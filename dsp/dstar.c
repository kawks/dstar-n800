#include <std.h>
#include "mailbox.h"
#include "tokliBIOS.h"

#include "51e1.h"

static const char prodid[] = "DVHack";
static const char verstring[] = "1.0";

static const Uns DV3K_START_BYTE = 0x61;
enum
{
    DV3K_CONTROL_RATEP     = 0x0A,
    DV3K_CONTROL_CHANFMT   = 0x15,
    DV3K_CONTROL_PRODID    = 0x30,
    DV3K_CONTROL_VERSTRING = 0x31,
    DV3K_CONTROL_RESET     = 0x33,
    DV3K_CONTROL_READY     = 0x39
};
static const Uns DV3K_AMBE_FIELD_CHAND    = 0x01;
static const Uns DV3K_AMBE_FIELD_CMODE    = 0x02;
static const Uns DV3K_AMBE_FIELD_TONE     = 0x08;
static const Uns DV3K_AUDIO_FIELD_SPEECHD = 0x00;
static const Uns DV3K_AUDIO_FIELD_CMODE   = 0x02;

#pragma DATA_ALIGN(dstar_state, 2)
static struct state dstar_state;
static Uns bitstream[72];

static Uns get_byte(Uns offset, Uns *p)
{
    Uns word = p[offset >> 1];
    return (offset & 1) ? (word >> 8) : (word & 0xff);
}

static void set_byte(Uns offset, Uns *p, Uns byte)
{
    p[offset >> 1] =
        (offset & 1) ? (byte << 8) | (p[offset >> 1] & 0xff)
                     : (p[offset >> 1] & 0xff00) | (byte & 0xff);
}

static Uns get_word(Uns offset, Uns *p)
{
    return get_byte(offset + 1, p) | (get_byte(offset, p) << 8);
}

static void set_word(Uns offset, Uns *p, Uns word)
{
    set_byte(offset, p, word >> 8);
    set_byte(offset + 1, p, word & 0xff);
}

static void set_cstring(Uns offset, Uns *p, const char *str)
{
    do
        set_byte(offset++, p, *str);
    while (*str++ != 0);
}

static Uns pkt_check_ratep(Uns offset, Uns *p)
{
    static const Uns ratep[] = {
        0x01, 0x30, 0x07, 0x63, 0x40, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x48 };
    Uns i;
    for (i = 0; i < sizeof(ratep); ++i)
        if (get_byte(offset + i, p) != ratep[i])
            return 0;
    return 1;
}

static void pack(Uns bits, Uns offset, Uns *p, Uns *bitstream)
{
    Uns i;
    Uns byte = 0;
    for (i = 0; i < bits; ++i)
    {
        byte |= bitstream[i] << (7 - (i & 7));
        if ((i & 7) == 7)
        {
            set_byte(offset++, p, byte);
            byte = 0;
        }
    }
    if (i & 7)
        set_byte(offset, p, byte);
}

static void unpack(Uns bits, Uns offset, Uns *bitstream, Uns *p)
{
    Uns i;
    Uns byte;
    for (i = 0; i < bits; ++i)
    {
        if ((i & 7) == 0)
            byte = get_byte(offset++, p);
        bitstream[i] = (byte >> (7 - (i & 7))) & 1;
    }
}

static Uns pkt_process(struct dsptask *task, Uns bid, Uns cnt)
{
    struct state *st = task->udata;
    Uns *pkt = ipbuf_d[bid];
    Uns len = cnt << 1;
    Uns payload_length;
    Uns i;
    Uns cmode = 0;
    Uns tone = 0;

    if (len < 4 || cnt > 256)
        goto fail;

    if (get_byte(0, pkt) != DV3K_START_BYTE)
        goto fail;

    payload_length = get_word(1, pkt);
    if (payload_length == 0)
        goto fail;
    if (4 + payload_length > len)
        goto fail;

    switch (get_byte(3, pkt))
    {
    case 0:
        switch (get_byte(4, pkt))
        {
        case DV3K_CONTROL_RATEP:
            if (payload_length != 13)
                goto fail;
            if (!pkt_check_ratep(5, pkt))
                goto fail;
            set_word(1, pkt, 1);
            bksnd(task, bid, 3);
            return MBCMD_EID_NOERR;
        case DV3K_CONTROL_CHANFMT:
            if (payload_length != 3)
                goto fail;
            if (get_word(5, pkt) != 0x0001)
                goto fail;
            set_word(1, pkt, 2);
            set_byte(5, pkt, 0);
            bksnd(task, bid, 3);
            return MBCMD_EID_NOERR;
        case DV3K_CONTROL_PRODID:
            set_word(1, pkt, 8);
            set_cstring(5, pkt, prodid);
            bksnd(task, bid, 6);
            return MBCMD_EID_NOERR;
        case DV3K_CONTROL_VERSTRING:
            set_word(1, pkt, 5);
            set_cstring(5, pkt, verstring);
            bksnd(task, bid, 5);
            return MBCMD_EID_NOERR;
        case DV3K_CONTROL_RESET:
            if (payload_length != 1)
                goto fail;
            dstar_enc_init(st->off_0000);
            dstar_init(st->off_0be2);
            for (i = 0; i < 0xf2; ++i)
                st->off_1569[i] = 0;
            for (i = 0; i < 0xa2; ++i)
                st->off_0fc0[i] = 0;
            for (i = 0; i < 4; ++i)
                st->off_1747[i] = 0;
            dstar_dec_init(st->off_0bf6);
            dstar_init(st->off_0bec);
            set_byte(4, pkt, DV3K_CONTROL_READY);
            bksnd(task, bid, 3);
            return MBCMD_EID_NOERR;
        default:
            goto fail;
        }
    case 1:
        switch (payload_length)
        {
        case 17:
            if (get_byte(18, pkt) != DV3K_AMBE_FIELD_TONE)
                goto fail;
            tone = get_word(19, pkt);
            /* FALLTHROUGH */
        case 14:
            if (get_byte(15, pkt) != DV3K_AMBE_FIELD_CMODE)
                goto fail;
            cmode = get_word(16, pkt);
            /* FALLTHROUGH */
        case 11:
            if (get_byte(4, pkt) != DV3K_AMBE_FIELD_CHAND)
                goto fail;
            if (get_byte(5, pkt) != 72)
                goto fail;
            unpack(72, 6, bitstream, pkt);
            break;
        default:
            goto fail;
        }
        dstar_golay_dec(1, 0, st->off_16b7, (char *)bitstream, st->off_0bec);
        dstar_dec_frame(80, cmode, st->off_1663, st->off_16b7, 0, st->off_0bf6);
        for (i = 0; i < 80; ++i)
            pkt[3 + i] = st->off_1663[i];
        dstar_dec_frame(80, cmode, st->off_1663, st->off_16b7, 1, st->off_0bf6);
        for (i = 0; i < 80; ++i)
            pkt[83 + i] = st->off_1663[i];
        set_word(1, pkt, 322);
        set_byte(3, pkt, 2);
        set_byte(4, pkt, DV3K_AUDIO_FIELD_SPEECHD);
        set_byte(5, pkt, 160);
        bksnd(task, bid, 165);
        return MBCMD_EID_NOERR;
    case 2:
        if (payload_length != 322 && payload_length != 325)
            goto fail;
        if (get_byte(4, pkt) != DV3K_AUDIO_FIELD_SPEECHD)
            goto fail;
        if (get_byte(5, pkt) != 160)
            goto fail;
        if (payload_length == 325)
        {
            if (get_byte(326, pkt) != DV3K_AUDIO_FIELD_CMODE)
                goto fail;
            cmode = get_word(323, pkt);
        }
        for (i = 0; i < 80; ++i)
            st->off_1663[i] = get_word(6 + (i << 1), pkt);
        dstar_enc_frame(80, 0, st->off_16b7, st->off_1663, 0x1840, st->off_0000);
        for (i = 0; i < 80; ++i)
            st->off_1663[i] = get_word(6 + 160 + (i << 1), pkt);
        dstar_enc_frame(80, 1, st->off_16b7, st->off_1663, 0x1840, st->off_0000);
        dstar_golay_enc((char *)bitstream, st->off_16b7, st->off_0be2);
        set_word(1, pkt, 11);
        set_byte(3, pkt, 1);
        set_byte(4, pkt, DV3K_AMBE_FIELD_CHAND);
        set_byte(5, pkt, 72);
        pack(72, 6, pkt, bitstream);
        bksnd(task, bid, 8);
        return MBCMD_EID_NOERR;
    default:
        goto fail;
    }

fail:
    bksnd(task, bid, 0);
    return MBCMD_EID_NOERR;
}

static struct TSK_Attrs attr_c = {
    DSPTASK_DEFAULT_PRIORITY,
    NULL,
    0x2000, // stack
    0x400, // sysstack
    0,
    NULL,
    NULL,
    TRUE
};

#pragma DATA_SECTION(dstar_dsptask, "dspgw_task")
struct dsptask dstar_dsptask = {
    TID_MAGIC,
    "dstar",
    MBCMD_TTYP_GBDM | MBCMD_TTYP_GBMD |
    MBCMD_TTYP_BKDM | MBCMD_TTYP_BKMD |
    MBCMD_TTYP_ASND | MBCMD_TTYP_PRCV,
    pkt_process,
    NULL,
    NULL,
    &attr_c,
    NULL,
    &dstar_state
};
