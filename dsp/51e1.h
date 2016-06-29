struct state
{
    char off_0000[0xbe2];
    char off_0be2[0x00a];
    char off_0bec[0x00a];
    char off_0bf6[0x3ca];
    char off_0fc0[0x0a2];
    char off_1062[0x507];
    char off_1569[0x0f2];
    char off_165b[0x008];
    char off_1663[0x050];
    char off_16b3[0x004];
    char off_16b7[0x030];
    char off_16e7[0x060];
    char off_1747[0x004];
};

extern void dstar_init(char *p);
extern void dstar_enc_init(char *p);
extern void dstar_dec_init(char *p);

extern int dstar_enc_frame(int size, int half, char *channel, char *speech, int cmode, char *state);
extern int dstar_dec_frame(int size, int cmode, char *speech, char *state, int half, char *channel);

extern void dstar_golay_enc(char *out, char *in, char *p);
extern void dstar_golay_dec(int softness, int flags, char *out, char *in, char *p);
