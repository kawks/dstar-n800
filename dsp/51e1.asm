	.text

	.def _dstar_enc_init
_dstar_enc_init:
	aadd	#-1, SP
	call	sub_024d78
	aadd	#1, SP
	ret

	.def _dstar_init
_dstar_init:
	aadd	#-1, SP
	call	sub_026a16
	aadd	#1, SP
	ret

	.def _dstar_enc_frame
_dstar_enc_frame:
	aadd	#-1, SP
	call	sub_024ce8
	aadd	#1, SP
	ret

	.def _dstar_dec_init
_dstar_dec_init:
	aadd	#-1, SP
	call	sub_028cf4
	aadd	#1, SP
	ret

	.def _dstar_dec_frame
_dstar_dec_frame:
	aadd	#-1, SP
	call	sub_028c0c
	aadd	#1, SP
	ret

	.def _dstar_golay_enc
_dstar_golay_enc:
	aadd	#-1, SP
	call	sub_02b1b9
	aadd	#1, SP
	ret

	.def _dstar_golay_dec
_dstar_golay_dec:
	aadd	#-1, SP
	call	sub_0269b9
	aadd	#1, SP
	ret

    .ref word_d7a7
    .ref word_d870
    .ref word_d877
    .ref word_d878
    .ref word_d880
    .ref word_d89a
    .ref word_de9a
    .ref word_e09a
    .ref word_e19a
    .ref word_e1aa
    .ref word_e1ca
    .ref word_e20a
    .ref word_e30b
    .ref word_e30e
    .ref word_e30f
    .ref word_e312
    .ref word_e482
    .ref word_e6e2
    .ref word_e6e8
    .ref word_e6ee
    .ref word_e6ef
    .ref word_e6fa
    .ref word_e8fa
    .ref word_e907
    .ref word_e97a
    .ref word_e9e3
    .ref word_ea07
    .ref word_ea65
    .ref word_ea7e
    .ref word_eaef
    .ref word_eb40
    .ref word_eb79
    .ref word_eb89
    .ref word_eb90
    .ref word_ebad
    .ref word_ebcd
    .ref word_ebd6
    .ref word_ebda
    .ref word_ebde
    .ref word_ebe2
    .ref word_ebe6
    .ref word_ebea
    .ref word_ebee
    .ref word_ebf2
    .ref word_ebf6
    .ref word_ec13
    .ref word_ec1f
    .ref word_ec3f
    .ref word_ec42
    .ref word_ec46
    .ref word_ec4d

sub_020000: MOV #14, BRC0 || PSH T2
            AADD #-2, SP
            MOV dbl(*AR0), AC0 || AADD #2, AR0
            RPTBLOCAL loc_020018 || SFTS AC0, #-5, AC0
               MOV dbl(*AR0+), AC1
               SFTS AC1, #-4, AC1
loc_020018:    ADD AC1, AC0
            SFTS AC0, #0, AC1
            EXP AC1, T2
            MOV T1, HI(AC1)
            SFTS AC0, T2, AC0
            OR #0, AC1, AC2 || SUB T2, T0
            EXP AC2, T2 || MOV #15, AR0
            AMAR *SP(#00h), XAR1 || ADD #5, T0
            SUB T2, AR0 || SFTS AC1, T2, AC1
            MOV T0, *SP(#00h) || MOV HI(AC1), T1
            .vli_off
            CALL sub_024152
            .vli_on
            BCC loc_02004c, T0 == #0
            MOV #-31, AR2
            MOV *SP(#00h), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_020052, TC1
loc_02004c: MOV #-23039 << #16, AC0
            B loc_02007f
loc_020052: MOV *SP(#00h), T1
            .vli_off
            CALL sub_0240d0
            .vli_on
            SFTS AC0, #0, AC1
            EXP AC1, T2
            SFTS AC0, T2, AC0
            MOV #-16216 << #16, AC0 || MOV HI(AC0), T1
            SFTL AC0, #0, AC0
            MOV #10, T1 || MPY T1, AC0, AC0
            SUB T2, T1
            MOV #19359 << #16, AC0 || SFTS AC0, T1, AC1
            SFTS AC0, #-4, AC0
            ADD AC1, AC0
            SFTS AC0, #0, AC0
            ROUND AC0, AC0
loc_02007f: MOV HI(AC0), T0
            AADD #2, SP
            POP T2
            RET
sub_020087: PSHBOTH XAR5
            AMAR *AR1, XAR3 || MOV #15, BRC0
            AMAR *AR2, XAR5 || MOV #0, AC0
            AADD #-2, SP
            AMAR *AR0, XAR2 || RPTBLOCAL loc_0200a3
               MOV *AR3+, T1
               SUB #9, T1
               MOV *AR2+ << #16, AC1
               SFTS AC1, T1, AC1
loc_0200a3:    ADD AC1, AC0
            MOV #-23040, AR3 || MOV HI(AC0), AR2
            CMP AR2 >= AR3, TC1
            XCCPART !TC1 || MOV #-23040, AR2
            MOV #10240 << #16, AC0 || MOV AR2, HI(AC1)
            ADD AC1, AC0
            MOV HI(AC0), AR2
            MOV #15, BRC0
            AMAR *AR5, XAR3 || MOV AR2, HI(AC0)
            MOV AC0, dbl(*SP(#00h)) || MOV #0, AC3
            RPTB loc_020118 || MOV #0, AC0
               MOV *AR0+, AR2
               NEG AR2, AR2
               MOV *AR1+, T1 || NEG AC0, AC2
               MOV AR2, HI(AC1) || SUB #5, T1
               SFTS AC2, #10, AC2
               SFTS AC1, T1, AC1
               SFTS AC2, #0, AC2
               SFTS AC1, #0, AC1 || BSET ST1_SATD
               ADD AC1, AC2
               ADD dbl(*SP(#00h)), AC2, AC2
               MOV #1024, AR4 || MOV HI(AC2), AR2
               CMP AR2 < AR4, TC1
               BCC loc_020108, TC1
               MOV #10240, AR4
               CMP AR4 >= AR2, TC1
               XCCPART !TC1 || MOV #10240, AR2
               B loc_02010c
loc_020108:    MOV #1024, AR2
loc_02010c:    BCLR ST1_SATD || MOV AR2, AC1
               MOV #0, AC1 || ADD AC1, AC3
               OR #39320, AC1, AC1
loc_020118:    MOV AR2, *AR3+ || ADD AC1, AC0
            SFTS AC3, #-4, AC0
            MOV #1023 << #16, AC0 || MOV AC0, T0
            OR #65535, AC0, AC0
            .vli_off
            CALL sub_024538
            .vli_on
            NOP
            MOV AC0, T1 || MOV #15, BRC0
            RPTBLOCAL loc_02013a || BSET ST1_FRCT
               MPYM *AR5, T1, AC0
loc_02013a:    MOV HI(AC0), *AR5+
            AADD #2, SP
            POPBOTH XAR5
            BCLR ST1_FRCT
            RET
sub_020144: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-6, SP
            AMAR *AR1, XAR7
            MOV AR2, *SP(#04h)
            MOV #16384, T0 || MOV T0, T3
            MOV *AR7, AR1 || MOV *AR5, T2
            MOV AR3, *SP(#03h) || MOV T1, AR6
            AMAR *SP(#00h), XAR2 || MOV #2, T1
            MOV AR1, *SP(#02h) || MOV T2, AR0
            .vli_off
            CALL sub_023f6f
            .vli_on
            MOV T0, *SP(#05h)
            MOV *SP(#02h), AR1
            AMAR *SP(#01h), XAR2 || MOV #7, T1
            MOV *SP(#03h), T0 || MOV T2, AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV T0, *SP(#03h)
            MOV *SP(#00h), AR1 || MOV AR6, T1
            MOV *SP(#05h), AR0 || MOV T3, T0
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_0201e2, T0 != #0
            MOV *SP(#01h), AR1 || MOV AR6, T1
            MOV *SP(#03h), AR0 || MOV T3, T0
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_0201e6, T0 == #0
            MOV #-6554 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T2, AC0, AC0
            OR #0, AC0, AC1
            EXP AC1, T1
            MOV #-13108 << #16, AC1
            SFTL AC1, #0, AC1
            MPY T3, AC1, AC1
            SUB T1, *SP(#02h), AR1 || OR #0, AC1, AC2
            EXP AC2, T2
            SUB T2, AR6
            MOV AR1, T1 || SFTS AC0, T1, AC0
            AMAR *SP(#02h), XAR2 || SUB #3, AR6
            MOV HI(AC0), T0 || SFTS AC1, T2, AC1
            MOV AR1, *SP(#00h) || MOV HI(AC1), AR0
            MOV AR6, *SP(#01h) || MOV AR6, AR1
            .vli_off
            CALL sub_0241d2
            .vli_on
            B loc_0201e6 || MOV T0, T2
loc_0201e2: MOV AR6, *SP(#02h) || MOV T3, T2
loc_0201e6: MOV *SP(#02h), AR1
            MOV AR1, *AR7 || MOV T2, *AR5
            MOV *SP(#04h), AR1
            AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            SUB #1, AR1, T0
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0201fe: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-4, SP
            AMAR *AR1, XAR7
            AMAR *AR2, XAR6
            MOV *AR7, AR1 || MOV *AR5, T2
            MOV T1, *SP(#01h)
            MOV XAR3, dbl(*SP(#02h)) || MOV T0, T3
            MOV AR1, *SP(#00h) || MOV T2, AR0
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_020258, T0 == #0
            MOV *SP(#01h), T1
            MOV #-28672, AR0
            MOV T3, T0 || MOV #5, AR1
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_020258, T0 == #0
            MOV T2, AC0
            SFTS AC0, #15, AC1
            SFTS AC1, #0, AC0
            EXP AC0, T2
            MOV T3, AC0
            SFTS AC0, #15, AC0
            SFTS AC0, #0, AC2
            EXP AC2, T1
            MOV *SP(#01h), AR1
            SFTS AC0, T1, AC0 || SUB T1, AR1
            B loc_020280 || MOV AR1, T1
loc_020258: MOV #-6554 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T2, AC0, AC1
            OR #0, AC1, AC0
            EXP AC0, T2
            MOV #-13108 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T3, AC0, AC0
            OR #0, AC0, AC2
            MOV *SP(#01h), AR1 || EXP AC2, T1
            SUB T1, AR1
            SUB #3, AR1, T1 || SFTS AC0, T1, AC0
loc_020280: SUB T2, *SP(#00h), AR1
            MOV HI(AC0), T0 || SFTS AC1, T2, AC1
            AMAR *SP(#00h), XAR2 || MOV HI(AC1), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#02h)), XAR3
            MOV *SP(#00h), AR1 || MOV T0, T2
            MOV T2, *AR5 || MOV #32767, *AR6
            MOV #5, *AR3 || MOV AR1, *AR7
            AADD #4, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            MOV #300, T0
            POP T3, T2
            RET
sub_0202b2: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR6 || PSHBOTH XAR7
            AADD #-14, SP
            MOV *SP(#1ah), AR1
            MOV AR1, *SP(#08h)
            AMAR *AR2, XAR7
            MOV *SP(#19h), AR1
            MOV XAR3, dbl(*SP(#06h))
            AMAR *AR0, XAR5
            MOV AR1, *SP(#09h)
            AMAR *SP(#00h), XAR2
            MOV *SP(#17h), AR1
            MOV dbl(*SP(#14h)), XAR3
            MOV T1, *SP(#02h)
            MOV T0, *SP(#03h)
            MOV AR1, *SP(#0ah)
            MOV XAR4, dbl(*SP(#04h))
            MOV *SP(#18h), T2
            MOV *SP(#16h), AR1
            MOV XAR3, dbl(*SP(#0ch))
            MOV AR1, *SP(#0bh)
            MOV *SP(#0ah), AR1 || MOV AR1, AR0
            .vli_off
            CALL sub_023f6f
            .vli_on
            MOV dbl(*SP(#04h)), XAR3
            MOV T0, T3
            MOV T3, *AR3
            MOV dbl(*SP(#0ch)), XAR3
            MOV *SP(#00h), AR1
            MOV AR1, *AR3
            MOV *SP(#03h), AR0
            MOV *SP(#0ah), T1
            MOV *SP(#0bh), T0
            AMAR *SP(#01h), XAR2
            MOV *SP(#02h), AR1
            .vli_off
            CALL sub_023f6f
            .vli_on
            MOV *SP(#08h), AR1 || MOV #6, AR3
            XCC T3 >= #0 || MOV *SP(#00h), AR2
            CMP AR1 >= AR3, TC1
            XCCPART T3 >= #0 || MOV T3, T0
            XCC T3 < #0 || MOV *SP(#01h), AR2
            BCC loc_020361, TC1
            MOV T0, HI(AC0) || BSET ST1_FRCT
            MPY T2, AC0, AC0
            ADD *SP(#09h), AR2, AR2 || OR #0, AC0, AC1
            EXP AC1, T3
            SUB T3, AR2
            MOV AR2, AR1
            MOV AR2, *SP(#01h)
            MOV *AR5, T0 || MOV *AR6, T1
            SFTS AC0, T3, AC0 || BCLR ST1_FRCT
            AMAR *AR6, XAR2 || MOV HI(AC0), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#06h)), XAR3
            MOV *SP(#09h), AR1
            MOV dbl(*SP(#06h)), XAR2
            MOV *AR7, T0 || MOV T0, *AR5
            MOV *AR3, T1 || MOV T2, AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV T0, *AR7
loc_020361: AADD #14, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02036d: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-20, SP
            MOV XAR1, dbl(*SP(#0ah))
            MOV *SP(#1ch), AR1
            MOV AR1, *SP(#10h)
            MOV XAR3, dbl(*SP(#06h))
            MOV T1, *SP(#04h)
            MOV *SP(#1bh), AR1
            MOV XAR0, dbl(*SP(#0ch))
            MOV XAR2, dbl(*SP(#08h))
            MOV AR4, *SP(#03h)
            MOV dbl(*SP(#1eh)), XAR7
            MOV dbl(*SP(#22h)), XAR3
            MOV AR1, *SP(#11h)
            MOV dbl(*SP(#20h)), XAR5
            MOV dbl(*SP(#24h)), XAR6
            MOV *SP(#26h), T3
            MOV *SP(#1ah), AR1
            MOV *SP(#27h), T1
            MOV AR1, *SP(#12h) || MOV AR4, AR1
            MOV XAR3, dbl(*SP(#0eh)) || MOV T0, T2
            BCC loc_0203d0, AR1 != #0
            MOV *AR7, AR0 || MOV *AR6, T1
            MOV *AR5, AR1 || MOV *AR3, T0
            AMAR *SP(#00h), XAR2
            .vli_off
            CALL sub_023f6f
            .vli_on
            BCC loc_0203c7, T0 <= #0
            MOV dbl(*SP(#0eh)), XAR3
            MOV *AR5, *AR6
            MOV *AR7, *AR3
loc_0203c7: MOV #0, *AR5
            MOV #0, *AR7
            B loc_0204f4
loc_0203d0: MOV T3, HI(AC0)
            AMAR *(#010000h), XAR3
            BSET ST1_SATD || SFTS AC0, #-5, AC0
            NEG AC0, AC1
            MOV XAR3, AC0 || BCLR ST1_SATD
            ADD AC1, AC0
            SFTS AC0, #14, AC0
            SFTS AC0, #0, AC0 || BSET ST1_FRCT
            MPY T1, AC0, AC0
            OR #0, AC0, AC1
            EXP AC1, T1 || MOV #-14, AR1
            AMAR *SP(#01h), XAR2 || SUB T1, AR1
            BCLR ST1_FRCT || SFTS AC0, T1, AC0
            MOV *SP(#04h), T1 || MOV HI(AC0), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV *SP(#01h), AR0
            AMAR *SP(#02h), XAR1 || MOV T0, T1
            MOV *SP(#04h), T0 || MOV T2, HI(AC0)
            .vli_off
            CALL sub_024152
            .vli_on
            MOV T0, T2
            BCC loc_02043a, T3 != #0
            MOV *SP(#02h), AR1
            BCC loc_02042c, AR1 != #0
            MOV #16384, AR1
            CMP AR1 >= T2, TC1
            BCC loc_02045c, TC1
            B loc_020434
loc_02042c: MOV *SP(#02h), AR1
            BCC loc_02045c, AR1 <= #0
            MOV #0, *SP(#02h)
loc_020434: MOV #16384, T2
            B loc_02045c
loc_02043a: MOV #1, AR1
            CMP T3 != AR1, TC1
            BCC loc_02045c, TC1
            MOV *SP(#02h), AR1
            BCC loc_020451, AR1 != #0
            MOV #24576, AR1
            CMP AR1 >= T2, TC1
            BCC loc_02045c, TC1
            B loc_020458
loc_020451: MOV *SP(#02h), AR1
            BCC loc_02045c, AR1 <= #0
            MOV #0, *SP(#02h)
loc_020458: MOV #24576, T2
loc_02045c: MOV dbl(*SP(#08h)), XAR3
            MOV *AR3, T0
            MOV dbl(*SP(#06h)), XAR3
            MOV *SP(#02h), AR1
            MOV dbl(*SP(#06h)), XAR2
            MOV *AR3, T1 || MOV T2, AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#08h)), XAR3
            MOV T0, *AR3
            MOV *SP(#12h), T1
            MOV *SP(#11h), AR0
            MOV *SP(#10h), AR1
            AMAR *SP(#00h), XAR2
            MOV *SP(#03h), T0
            .vli_off
            CALL sub_023f6f
            .vli_on
            MOV T2, HI(AC0) || BSET ST1_FRCT
            MOV dbl(*SP(#0ch)), XAR3
            BSET ST1_SATD || MPY T0, AC0, AC0
            MOV *SP(#00h), AR1 || ABS AC0, AC0
            ADD *SP(#02h), AR1, T3 || OR #0, AC0, AC1
            EXP AC1, T1
            MOV *AR3, T0 || BCLR ST1_SATD
            SUB T1, T3 || SFTS AC0, T1, AC0
            MOV dbl(*SP(#0ah)), XAR3
            MOV dbl(*SP(#0ah)), XAR2
            MOV HI(AC0), T2
            BCLR ST1_FRCT
            MOV T3, *SP(#02h) || MOV T3, AR1
            MOV *AR3, T1 || MOV T2, AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#0ch)), XAR3
            MOV *AR5, T1
            AMAR *SP(#01h), XAR2
            MOV T0, *AR3 || MOV T3, AR1
            MOV *AR7, T0 || MOV T2, AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#0eh)), XAR3
            MOV *AR6, T1
            MOV *SP(#01h), AR1
            AMAR *SP(#00h), XAR2 || MOV T0, T3
            MOV *AR3, T0 || MOV T3, AR0
            .vli_off
            CALL sub_023f6f
            .vli_on
            BCC loc_0204ee, T0 <= #0
            MOV dbl(*SP(#0eh)), XAR3
            MOV *SP(#01h), AR1
            MOV T3, *AR3 || MOV AR1, *AR6
loc_0204ee: MOV *SP(#02h), AR1
            MOV AR1, *AR5 || MOV T2, *AR7
loc_0204f4: AADD #20, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_020500: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            AADD #-94, SP
            MOV XAR3, dbl(*SP(#38h))
            MOV dbl(*SP(#74h)), XAR3
            MOV XAR2, dbl(*SP(#3ah))
            MOV XAR3, dbl(*SP(#3eh))
            AMAR *AR1, XAR7
            MOV dbl(*SP(#70h)), XAR3
            MOV dbl(*SP(#68h)), XAR2
            MOV *SP(#76h) << #16, AC0
            MOV XAR3, dbl(*SP(#42h))
            AMAR *AR0, XAR5
            MOV dbl(*SP(#6eh)), XAR3
            MOV XAR2, dbl(*SP(#48h))
            MOV *SP(#73h), AR1
            MOV HI(AC0), *SP(#3dh)
            AMAR *SP(#00h), XAR6
            MOV XAR3, dbl(*SP(#44h))
            MOV T0, *SP(#3ch)
            MOV XAR4, dbl(*SP(#36h))
            MOV #0, *SP(#1ah)
            MOV #0, *SP(#25h)
            MOV #0, *SP(#24h)
            MOV dbl(*SP(#66h)), XAR2
            MOV #0, *SP(#23h)
            MOV dbl(*SP(#6ch)), XAR3
            MOV #0, *SP(#22h)
            MOV #0, *SP(#20h)
            MOV #0, *SP(#1fh)
            MOV #0, *SP(#19h)
            MOV AR1, *SP(#40h)
            MOV XAR3, dbl(*SP(#46h))
            MOV #0, *SP(#1eh)
            MOV #0, *SP(#1dh) || MOV T1, HI(AC0)
            MOV XAR2, dbl(*SP(#4ah)) || OR #0, AC0, AC1
            MOV dbl(*SP(#6ah)), XAR3
            MOV #32000, *SP(#1ch)
            MOV #10, *SP(#1bh)
            MOV XAR3, dbl(*SP(#4eh)) || EXP AC1, T2
            MOV dbl(*SP(#64h)), XAR2
            MOV dbl(*SP(#42h)), XAR3
            MOV *SP(#72h), T3 || MOV #15, AR0
            AMAR *SP(#21h), XAR1 || SFTS AC0, T2, AC0
            MOV #23445 << #16, AC0 || MOV HI(AC0), T1
            MOV XAR2, dbl(*SP(#4ch)) || MOV #0, T0
            MOV #0, *AR3 || SUB T2, AR0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV T0, *SP(#50h)
            MOV dbl(*SP(#36h)), XAR1
            MOV dbl(*SP(#38h)), XAR0
            AMAR *SP(#26h), XAR2
            CALL sub_020087
            MOV dbl(*SP(#48h)), XAR3
            MOV *SP(#3dh) << #16, AC0
            MOV XAR3, dbl(*SP(#52h)) || MOV #0, AR1
            MOV #512 << #16, AC1
            MPYK #5442, AC0, AC0
            MOV AR1, *SP(#56h)
            AMAR *SP(#26h), XAR3 || SUB AC1, AC0
            MOV HI(AC0), *SP(#3dh) || MOV #0, AR1
            MOV AR1, *SP(#5ah)
            MOV XAR3, dbl(*SP(#54h)) || MOV #0, AC0
            MOV AC0, dbl(*SP(#58h))
            MOV AC0, dbl(*SP(#48h))
loc_0205d8: MOV dbl(*AR7), AC0
            MOV dbl(*SP(#3ah)), XAR3
            MOV dbl(*AR5), AC0 || EXP AC0, T1
            MOV *SP(#3ch), AR2 || EXP AC0, T2
            SUB T2, AR2
            MOV dbl(*AR5), AC0
            SUB T1, *AR3, AR1 || SFTS AC0, T2, AC0
            MOV dbl(*AR7), AC0 || MOV HI(AC0), T0
            MOV AR2, T1 || SFTS AC0, T1, AC0
            AMAR *SP(#10h), XAR2 || MOV HI(AC0), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#38h)), XAR3
            MOV *AR3, AR2
            MOV dbl(*SP(#36h)), XAR3
            MOV dbl(*SP(#48h)), AC0
            MOV #16384 << #16, AC1 || NEG AC0, AC0
            MOV AR2, *SP(#18h) || SFTS AC0, #10, AC0
            MOV *AR3, AR2 || MOV T0, T2
            MOV dbl(*SP(#4ch)), XAR3
            MOV *SP(#10h), AR1 || ADD AC0, AC1
            BSET ST1_FRCT || SFTS AC1, #0, AC0
            MOV AR2, *SP(#14h) || EXP AC0, T0
            MOV *SP(#50h) << #16, AC0 || SUB #1, AR1
            MOV *AR3, AR2 || MPY T2, AC0, AC0
            MOV dbl(*SP(#4ah)), XAR3
            OR #0, AC0, AC2
            MOV AR1, *SP(#10h) || EXP AC2, T1
            ADD *SP(#21h), AR1, AR1
            MOV AR2, *SP(#17h) || SFTS AC0, T1, AC0
            MOV *AR3, AR2 || SUB T1, AR1
            MOV #-30, AR1 || MOV AR1, T1
            MOV AR2, *SP(#12h)
            SUB T0, AR1
            BCLR ST1_FRCT || SFTS AC1, T0, AC1
            MOV HI(AC1), AR0
            AMAR *SP(#15h), XAR2 || MOV HI(AC0), T0
            .vli_off
            CALL sub_0241d2
            .vli_on
            XCCPART T0 == #0 || MOV #15, *SP(#15h)
            XCCPART T0 == #0 || MOV #-32768 << #16, AC0
            BCC loc_020689, T0 == #0
            MOV *SP(#15h), T1
            .vli_off
            CALL sub_0240d0
            .vli_on
            SFTS AC0, #0, AC1
            EXP AC1, T1 || MOV #15, AR1
            SUB T1, AR1
            MOV AR1, *SP(#15h) || SFTS AC0, T1, AC0
loc_020689: MOV *SP(#14h), T1
            MOV HI(AC0), *SP(#5bh) || SUB #7, T1
            MOV *SP(#18h) << #16, AC0
            SFTS AC0, T1, AC0
            MOV HI(AC0), AR1
            MOV AR1, AC0
            SFTS AC0, #14, AC0
            MOV *SP(#3dh), AR1 || NEG AC0, AC1
            OR #0, AC1, AC2
            MOV AR1, HI(AC0)
            ADD AC0, AC2
            MOV HI(AC2), AR1
            MOV #512, AR1 || MOV AR1, AC2
            MOV AC0, dbl(*SP(#5ch))
            MOV #256, AR1 || MIN AR1, AC2
            ADD dbl(*SP(#5ch)), AC1, AC1
            MOV HI(AC1), AR1 || MAX AR1, AC2
            MOV *SP(#18h), T0
            MOV #512, AR1 || MOV AR1, AC0
            AMAR *SP(#13h), XAR2
            MOV #256, AR1 || MIN AR1, AC0
            MOV *SP(#14h), T1
            MOV AC2, *SP(#3dh) || MAX AR1, AC0
            MOV #7, AR1 || MOV AC0, AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV #8, AR1
            CMP T3 < AR1, TC1
            MOV T0, AR0
            BCC loc_02072b, TC1
            MOV *SP(#5bh), T0
            MOV *SP(#15h), T1
            MOV *SP(#13h), AR1
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_020715, T0 != #0
            MOV dbl(*SP(#52h)), XAR3
            MOV *AR3, AR2
            BCC loc_020703, AR2 > #0
            MOV *SP(#17h), AR1
            MOV AR1, *SP(#18h)
            MOV *SP(#12h), AR1
            B loc_02077b
loc_020703: AMAR *SP(#17h), XAR0
            AMAR *SP(#12h), XAR1
            MOV *SP(#5bh), T0
            MOV *SP(#15h), T1
            MOV *SP(#3dh), AR3
            CALL sub_020144
            B loc_020788
loc_020715: AMAR *SP(#18h), XAR0
            AMAR *SP(#14h), XAR1
            AMAR *SP(#17h), XAR2
            AMAR *SP(#12h), XAR3
            MOV *SP(#5bh), T0
            MOV *SP(#15h), T1
            CALL sub_0201fe
            B loc_020788
loc_02072b: BSET ST1_FRCT
            MPYM *SP(#18h), T3, AC0
            OR #0, AC0, AC1
            AMAR *SP(#0eh), XAR2 || EXP AC1, T1
            SUB T1, *SP(#14h), AR1
            MOV *SP(#5bh), AR0 || ADD #15, AR1
            MOV AR1, *SP(#0eh) || BCLR ST1_FRCT
            NOP
            NOP
            MOV AR1, T1 || SFTS AC0, T1, AC0
            MOV *SP(#15h), AR1 || MOV HI(AC0), T0
            .vli_off
            CALL sub_0241d2
            .vli_on
            AMAR *(#010000h), XAR3
            MOV T3, HI(AC0)
            MOV XAR3, AC1
            ADD AC0, AC1
            SFTS AC1, #0, AC0
            EXP AC0, T1 || MOV #15, AR0
            SUB T1, AR0 || MOV T0, HI(AC0)
            AMAR *SP(#0eh), XAR1 || SFTS AC1, T1, AC1
            MOV *SP(#0eh), T0 || MOV HI(AC1), T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV T0, *SP(#18h)
            MOV *SP(#0eh), AR1
loc_02077b: MOV AR1, *SP(#14h)
            MOV #300, T0
            MOV #32767, *SP(#17h)
            MOV #5, *SP(#12h)
loc_020788: MOV dbl(*SP(#52h)), XAR3
            MOV T0, *AR3
            MOV dbl(*SP(#4ch)), XAR3
            MOV *SP(#17h), AR1
            MOV AR1, *AR3
            MOV dbl(*SP(#4ah)), XAR3
            MOV *SP(#12h), AR1
            MOV AR1, *AR3
            MOV dbl(*SP(#38h)), XAR3
            MOV *SP(#18h), AR1
            MOV AR1, *AR3
            MOV *SP(#14h), AR1
            MOV dbl(*SP(#36h)), XAR3
            MOV dbl(*AR5), dbl(*AR7)
            AMAR *SP(#1eh), XAR0
            AMAR *SP(#1ch), XAR2
            AMAR *SP(#16h), XAR4
            MOV AR1, *AR3
            AMAR *SP(#11h), XAR3
            MOV *SP(#5bh), AR1
            MOV XAR3, dbl(*SP(#00h))
            MOV AR1, *SP(#02h)
            MOV *SP(#15h), AR1
            MOV AR1, *SP(#03h)
            MOV T2, *SP(#04h)
            MOV *SP(#10h), AR1
            MOV AR1, *SP(#05h)
            MOV *SP(#5ah), AR1
            MOV AR1, *SP(#06h)
            MOV *SP(#18h), T0
            AMAR *SP(#1bh), XAR3
            MOV *SP(#14h), T1
            AMAR *SP(#1dh), XAR1
            CALL sub_0202b2
            MOV *SP(#15h), AR1
            MOV AR1, *SP(#00h)
            MOV *SP(#18h), AR1
            MOV AR1, *SP(#01h)
            MOV *SP(#14h), AR1
            AMAR *SP(#20h), XAR3
            MOV AR1, *SP(#02h)
            MOV XAR3, dbl(*SP(#04h))
            AMAR *SP(#1fh), XAR3
            MOV XAR3, dbl(*SP(#06h))
            MOV dbl(*SP(#42h)), XAR3
            MOV XAR3, dbl(*SP(#08h))
            AMAR *SP(#19h), XAR3
            MOV XAR3, dbl(*SP(#0ah))
            MOV dbl(*SP(#54h)), XAR3
            MOV *SP(#5ah), AR1
            MOV *SP(#40h), T1
            MOV AR1, *SP(#0ch) || BSET ST1_FRCT
            NOP
            NOP
            MPYM *AR3, T1, AC0
            MOV *SP(#5bh), AR4
            AMAR *SP(#25h), XAR0
            AMAR *SP(#23h), XAR2
            MOV HI(AC0), *SP(#0dh)
            AMAR *SP(#24h), XAR1
            AMAR *SP(#22h), XAR3 || BCLR ST1_FRCT
            MOV *SP(#10h), T1 || MOV T2, T0
            CALL sub_02036d
            MOV *SP(#5ah), AR1
            BTST @#00h, AR1, TC1
            BCC loc_020838, TC1
            MOV *SP(#16h), AR1
            MOV AR1, *SP(#56h)
            MOV *SP(#11h), AR1
            MOV AR1, *SP(#1ah)
            B loc_02085b
loc_020838: MOV *SP(#56h), T0
            MOV *SP(#1ah), T1
            MOV *SP(#16h), AR0
            MOV *SP(#11h), AR1
            AMAR *SP(#1ah), XAR2
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV dbl(*SP(#4eh)), XAR3
            MOV *SP(#1ah), T1 || MOV T0, AR1
            SUB #7, T1
            MOV AR1, HI(AC0)
            MOV T0, *SP(#56h) || SFTS AC0, T1, AC0
            MOV HI(AC0), *AR3+
            MOV XAR3, dbl(*SP(#4eh))
loc_02085b: MOV dbl(*SP(#48h)), AC0
            BCC loc_02086d, AC0 != #0
            MOV dbl(*SP(#46h)), XAR3
            MOV *SP(#11h), T1
            SUB #5, T1
            MOV *SP(#16h) << #16, AC0
            SFTS AC0, T1, AC0
            MOV HI(AC0), *AR3
loc_02086d: MOV *SP(#15h), T1
            MOV *SP(#5bh), AR1
            AMAR *(#0100000h), XAR3
            SUB #11, T1
            MOV AR1, HI(AC0)
            MOV dbl(*SP(#58h)), AC0 || SFTS AC0, T1, AC1
            ADD AC1, AC0
            MOV XAR3, AC1
            MOV dbl(*SP(#38h)), XAR3
            AMAR *AR3+
            MOV XAR3, dbl(*SP(#38h))
            MOV dbl(*SP(#36h)), XAR3
            AMAR *AR3+
            MOV XAR3, dbl(*SP(#36h))
            MOV dbl(*SP(#4ch)), XAR3
            AMAR *AR3+
            MOV XAR3, dbl(*SP(#4ch))
            MOV dbl(*SP(#4ah)), XAR3
            AMAR *AR3+
            MOV XAR3, dbl(*SP(#4ah))
            MOV dbl(*SP(#52h)), XAR3
            MOV AC0, dbl(*SP(#58h))
            MOV dbl(*SP(#5ch)), AC0
            ADD #1, *SP(#5ah)
            AMAR *AR3+
            MOV XAR3, dbl(*SP(#52h)) || SUB AC1, AC0
            MOV HI(AC0), *SP(#3dh) || MOV #0, AC1
            MOV dbl(*SP(#54h)), XAR3
            OR #32768, AC1, AC1
            MOV *SP(#5ah), AR1
            MOV dbl(*SP(#48h)), AC0 || AADD #2, AR7
            MOV #16, AR2
            AMAR *AR3+ || ADD AC1, AC0
            MOV AC0, dbl(*SP(#48h)) || CMP AR1 < AR2, TC1
            MOV XAR3, dbl(*SP(#54h)) || AADD #2, AR5
            BCC loc_0205d8, TC1
            MOV dbl(*SP(#58h)), AC0
            MOV #1792 << #16, AC1
            MOV dbl(*SP(#3eh)), XAR3
            MOV *SP(#1bh), AR0
            AMAR *SP(#0fh), XAR1 || ADD AC1, AC0
            MOV AC0, dbl(*SP(#58h))
            MOV #-13108 << #16, AC0
            MOV *SP(#1ch), T1 || SFTL AC0, #0, AC1
            MOV #-26084 << #16, AC0
            MOV *SP(#1dh), T0 || SFTL AC0, #0, AC0
            MPYM *SP(#58h), AC0, AC0
            MACM *AR3, AC1, AC0
            MOV HI(AC0), *AR3
            MOV *SP(#1eh) << #16, AC0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV dbl(*SP(#44h)), XAR3
            MOV *SP(#0fh), T1
            SUB #2, T1
            MOV T0, HI(AC0) || BSET ST1_SATD
            SFTS AC0, T1, AC0
            MOV HI(AC0), *AR3
            MOV dbl(*SP(#42h)), XAR3
            MOV *SP(#19h), T1 || BCLR ST1_SATD
            MOV *AR3 << #16, AC0 || MOV #2, AR1
            MPYK #13106, AC0, AC0
            MOV *SP(#22h), AR0 || SUB #3, T1
            CMP AR1 < AR0, TC1
            BSET ST1_SATD
            MOV *SP(#24h), T0 || SFTS AC0, T1, AC0
            MOV rnd(HI(saturate(AC0))), *AR3
            AMAR *SP(#24h), XAR1
            MOV *SP(#23h), T1
            XCCPART !TC1 || MOV #3, AR0
            MOV *SP(#25h) << #16, AC0 || BCLR ST1_SATD
            XCCPART !TC1 || MOV #16384, T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV dbl(*SP(#3ah)), XAR3
            MOV T0, *SP(#25h)
            MOV *SP(#3ch), AR1
            MOV *SP(#24h), T1
            MOV *SP(#25h) << #16, AC0
            MOV AR1, *AR3
            AADD #94, SP
            POPBOTH XAR6
            SUB #3, T1 || POPBOTH XAR7
            POPBOTH XAR5 || BSET ST1_SATD
            POP T3, T2 || SFTS AC0, T1, AC0
            ROUND AC0, AC0
            MOV HI(AC0), T0
            BCLR ST1_SATD
            RET
sub_020981: PSH T2
            MOV #16384, AR1 || MOV T0, T2
            CMP AR1 >= T1, TC1
            MOV AR0, T0
            AADD #-2, SP
            BCC loc_02099b, TC1
            MOV #-10240, AR1
            CMP AR1 < T2, TC1
            BCC loc_0209a2, TC1
loc_02099b: CMP T0 >= T2, TC1
            BCC loc_0209a8, TC1
            B loc_0209b2
loc_0209a2: CMP T0 < T2, TC1
            BCC loc_0209cb, TC1
loc_0209a8: MOV #8192, AR1
            CMP AR1 >= T1, TC1
            BCC loc_020a0a, TC1
loc_0209b2: MOV #-23592 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T2, AC0, AC0
            OR #0, AC0, AC1
            EXP AC1, T2
            MOV #-656 << #16, AC0 || SFTS AC0, T2, AC1
            B loc_0209e2 || MOV #1, T1
loc_0209cb: MOV #-13108 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T2, AC0, AC0
            OR #0, AC0, AC1
            EXP AC1, T2
            MOV #4, T1
            MOV #-6554 << #16, AC0 || SFTS AC0, T2, AC1
loc_0209e2: SFTL AC0, #0, AC0
            MPY T0, AC0, AC0
            OR #0, AC0, AC2 || SUB T2, T1
            EXP AC2, T2
            MOV HI(AC1), T0 || MOV #7, AR1
            SUB T2, AR1 || SFTS AC0, T2, AC0
            AMAR *SP(#00h), XAR2 || MOV HI(AC0), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV *SP(#00h), T1
            SUB #7, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
loc_020a0a: AADD #2, SP
            POP T2
            RET
sub_020a10: MOV AR1, AC1
            MOV T1, AC0
            SUB AC1, AC0
            MOV T0, HI(AC1) || PSH T3, T2
            AADD #-1, SP
            SFTS AC1, #8, AC1
            MOV #-23040, T3 || MOV HI(AC1), T2
            CMP T3 >= T2, TC1 || SFTS AC0, #16, AC3
            MOV *AR0 << #16, AC2 || OR #0, AC3, AC0
            BCC loc_020b1f, TC1
            CMP T2 < T1, TC1
            BCC loc_020b1f, TC1
            MOV #8, T1
            CMP AR4 < T1, TC1
            BCC loc_020b19, TC1
            MOV #-5120 << #16, AC1
            OR #1280, AC1, AC1
            CMP AC1 >= AC3, TC1
            BCC loc_020a66, TC1
            BTST @#00h, AR3, TC1
            BCC loc_020b0f, TC1
            MOV #2048, AR2 || SUB AR2, AR1
            CMP AR1 < AR2, TC1
            BCC loc_020b0f, TC1
loc_020a66: MOV #-5120 << #16, AC1
            CMP AC1 < AC0, TC1
            BCC loc_020b09, TC1
            MOV #-7680 << #16, AC1
            CMP AC1 < AC0, TC1
            BCC loc_020ae8, TC1
            MOV #-10240 << #16, AC1
            CMP AC1 < AC0, TC1
            BCC loc_020ac7, TC1
            MOV #-12800 << #16, AC1
            CMP AC1 >= AC0, TC1
            BCC loc_020ae2, TC1
            MOV #17, BRC0
            RPTBLOCAL loc_020a9b || MOV #0, AR1
               AND #1, AR3, AR2
               SFTS AR3, #-1
loc_020a9b:    ADD AR2, AR1
            MOV #2, AR2
            CMP AR1 >= AR2, TC1
            BCC loc_020ae2, !TC1
            MOV #12800 << #16, AC1
            ADD AC0, AC1
            MOV HI(AC1), AR1
            MOV #-1 << #16, AC1 || MOV AR1, AC0
            OR #13110, AC1, AC1
            .vli_off
            CALL sub_01dbba
            .vli_on
            SFTS AC0, #2, AC0
            MOV #15360 << #16, AC0 || SUB AC0, AC2
            B loc_020b1d
loc_020ac7: MOV #10240 << #16, AC1
            ADD AC0, AC1
            MOV HI(AC1), AR1
            MOV #-1 << #16, AC1 || MOV AR1, AC0
            OR #13108, AC1, AC1
            .vli_off
            CALL sub_01dbba
            .vli_on
            SFTS AC0, #-1, AC0
            SUB AC0, AC2
loc_020ae2: MOV #7168 << #16, AC0
            B loc_020b1d
loc_020ae8: MOV #7680 << #16, AC1
            ADD AC0, AC1
            MOV HI(AC1), AR1
            MOV #-1 << #16, AC1 || MOV AR1, AC0
            OR #13110, AC1, AC1
            .vli_off
            CALL sub_01dbba
            .vli_on
            SFTS AC0, #0, AC0
            MOV #6144 << #16, AC0 || SUB AC0, AC2
            B loc_020b1d
loc_020b09: MOV #4096 << #16, AC0
            B loc_020b1d
loc_020b0f: MOV #2457 << #16, AC0
            OR #32768, AC0, AC0
            B loc_020b1d
loc_020b19: MOV #14336 << #16, AC0
loc_020b1d: SUB AC0, AC2
loc_020b1f: MOV HI(AC2), *AR0 || MOV HI(AC2), AR1
            XCCPART AR1 > #0 || MOV #1, T0
            AADD #1, SP
            POP T3, T2
            XCCPART AR1 <= #0 || MOV #0, T0
            RET
sub_020b31: PSH T3, T2
            PSHBOTH XAR5
            MOV T0, T3 || MOV #4, BRC0
            AMAR *AR0, XAR5 || PSHBOTH XAR6
            AMAR *AR5, XAR3 || PSHBOTH XAR7
            AADD #-28, SP
            MOV T1, *SP(#17h) || AADD #127, AR3
            MOV XAR1, dbl(*SP(#18h)) || RPTBLOCAL loc_020b54
               MOV *AR3, AR1
               MOV AR1, *AR3(short(#1))
loc_020b54:    AMAR *AR3-
            AMAR *AR5, XAR3
            AMAR *AR5, XAR6
            AMAR *AR5, XAR7
            AMAR *+AR3(#0091h)
            AMAR *+AR6(#0089h)
            AMAR *+AR7(#009ah)
            MOV XAR3, dbl(*SP(#1ah)) || MOV #2, T2
loc_020b70: MOV dbl(*SP(#1ah)), XAR0
            AMAR *AR6, XAR1 || MOV #8, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV dbl(*SP(#1ah)), XAR3
            MOV *AR7, AR1
            MOV AR1, *AR7(short(#1)) || ASUB #8, AR6
            AMAR *AR7- || SUB #1, T2
            MOV XAR3, dbl(*SP(#1ah)) || ASUB #8, AR3
            BCC loc_020b70, T2 != #0
            MOV dbl(*SP(#18h)), XAR0
            MOV *SP(#17h), T1 || MOV T3, T0
            CALL sub_020000
            MOV #-5120, AR2
            MOV *AR5(#0024h), AR1
            CMP AR1 < AR2, TC1
            MOV T0, *AR5(#0025h)
            XCCPART !TC1 || MOV #17818 << #16, AC0
            BCC loc_020be7, !TC1
            MOV *AR5(#0024h) << #16, AC1
            MOV #5120 << #16, AC0
            ADD AC1, AC0
            SFTS AC0, #0, AC0
            MPYK #21770, AC0, AC0
            MOV #-850, AR1 || MOV HI(AC0), T0
            MAX AR1, T0
            MOV T0, HI(AC0) || MOV #7, T1
            MOV HI(AC0), T0 || MOV #0, AR0
            .vli_off
            CALL sub_0244d7
            .vli_on
            MOV #-29900 << #16, AC0
            SFTL AC0, #0, AC0
            MOV *AR5(#0024h), AR1
            MPY T0, AC0, AC0
loc_020be7: AMAR *AR5, XAR3
            MOV XAR3, dbl(*SP(#00h)) || AADD #73, AR3
            AMAR *AR5, XAR3
            MOV XAR3, dbl(*SP(#02h)) || AADD #89, AR3
            AMAR *AR5, XAR3
            MOV XAR3, dbl(*SP(#04h)) || AADD #105, AR3
            AMAR *AR5, XAR3
            AMAR *+AR3(#0081h)
            MOV XAR3, dbl(*SP(#06h))
            AMAR *AR5, XAR3
            AMAR *+AR3(#0099h)
            MOV XAR3, dbl(*SP(#08h))
            AMAR *AR5, XAR3
            MOV XAR3, dbl(*SP(#0ah)) || AADD #122, AR3
            AMAR *SP(#14h), XAR3
            MOV XAR3, dbl(*SP(#0ch))
            MOV *AR5(#009ch), AR2
            AMAR *AR5, XAR3
            MOV AR2, *SP(#0eh)
            AMAR *+AR3(#009dh)
            MOV HI(AC0), *SP(#0fh)
            MOV XAR3, dbl(*SP(#10h))
            AMAR *AR5, XAR4
            MOV AR1, *SP(#12h) || AADD #57, AR4
            AMAR *AR5, XAR2
            AMAR *AR5, XAR3
            MOV dbl(*SP(#18h)), XAR0
            AADD #121, AR2
            MOV *SP(#17h), T1 || AADD #41, AR3
            AMAR *AR5, XAR1 || MOV T3, T0
            CALL sub_020500
            MOV T0, *SP(#15h)
            MOV *AR5(#0024h), AR0
            MOV *AR5(#0025h), T0
            MOV *SP(#15h), T1
            CALL sub_020981
            MOV *SP(#14h), AR1
            MOV *SP(#15h), AR2
            CMP AR2 >= AR1, TC1
            MOV T0, *AR5(#0024h)
            XCCPART !TC1 || MOV AR1, *SP(#15h)
            MOV *AR5(#0025h), T1
            MOV *AR5(#0022h), AR3
            MOV *AR5(#009ch), AR4
            AMAR *SP(#15h), XAR0
            MOV *AR5(#0026h), T0
            MOV *AR5(#0028h), AR2
            MOV *AR5(#0024h), AR1
            CALL sub_020a10
            MOV *SP(#15h), AR1 || MOV T0, AR7
            MOV AR1, *AR5(#007bh)
            BCC loc_020ce6, AR7 != #0
            MOV #-6554 << #16, AC0
            SFTL AC0, #0, AC0
            MPYM *AR5(#0028h), AC0, AC1
            OR #0, AC1, AC0
            EXP AC0, T3
            MOV #-13108 << #16, AC0
            SFTL AC0, #0, AC0
            MPYM *AR5(#0025h), AC0, AC0
            OR #0, AC0, AC2
            EXP AC2, T2 || MOV #4, T1
            SUB T2, T1 || SFTS AC1, T3, AC1
            MOV HI(AC1), AR0 || MOV #7, AR1
            SUB T3, AR1 || SFTS AC0, T2, AC0
            AMAR *SP(#16h), XAR2 || MOV HI(AC0), T0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV *SP(#16h), T1
            SUB #7, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV HI(AC0), *AR5(#0028h)
loc_020ce6: MOV #8, AR2
            MOV *AR5(#009ch), AR1
            CMP AR1 >= AR2, TC1
            XCCPART !TC1 || ADD #1, AR1
            XCCPART !TC1
            MOV AR1, *AR5(#009ch)
            MOV *AR5(#0022h), AR1
            SFTL AR1, #1
            OR AR7, AR1
            MOV AR1, *AR5(#0022h)
            MOV *AR5(#0022h), T0
            AADD #28, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_020d15: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            MOV #16, T3 || PSHBOTH XAR7
            AMAR *AR1, XAR6
            AADD #-4, SP
            MOV #-1024, AR1
            AMAR *AR0, XAR7
            AMAR *AR6, XAR5 || MOV #0, AC0
            MOV AC0, dbl(*SP(#00h))
            AADD #41, AR5
loc_020d38: MOV *AR5(#0010h), T1
            SUB #5, T1
            MOV *AR5+ << #16, AC0
            MOV #30720 << #16, AC0 || SFTS AC0, T1, AC1
            ADD AC1, AC0
            MOV AR1, HI(AC1)
            MOV AC1, dbl(*SP(#02h))
            SUB dbl(*SP(#02h)), AC0, AC0 || MOV HI(AC0), T2
            MOV HI(AC0), AR1
            MOV #102, AR1 || MOV AR1, AC0
            MAX AR1, AC0 || MOV #5, AR0
            MOV AC0, T0 || MOV #5, T1
            .vli_off
            CALL sub_02410f
            .vli_on
            MOV #541 << #16, AC1 || MOV T0, HI(AC0)
            SUB AC1, AC0
            MOV HI(AC0), T0
            BCC loc_020d7c, T0 >= #0
            MOV T0, HI(AC1)
            MOV T2, HI(AC0) || BSET ST1_SATD
            ADD AC1, AC0
            MOV HI(AC0), T2
loc_020d7c: MOV T2, *AR7+ || MOV T2, AC1
            MOV dbl(*SP(#00h)), AC0 || BCLR ST1_SATD
            AMAR *(#0400000h), XAR3
            ADD AC1, AC0
            MOV AC0, dbl(*SP(#00h))
            MOV XAR3, AC1
            MOV dbl(*SP(#02h)), AC0
            SUB AC1, AC0
            SUB #1, T3
            MOV HI(AC0), AR1
            BCC loc_020d38, T3 != #0
            AMAR *(#010000h), XAR3
            MOV dbl(*SP(#00h)), AC0
            MOV XAR3, AC1
            CMP AC1 < AC0, TC1
            MOV #16384, AR1
            XCCPART TC1 || MOV #8192, AR1
            MOV AR1, AC0
            SFTS AC0, #5, AC1
            MOV dbl(*SP(#00h)), AC0 || SUB AC0 << #1, AC1
            SUB dbl(*AR6(#0020h)), AC0, AC0
            SFTS AC0, #6, AC0
            ADD AC1, AC0
            BCC loc_020dd9, AC0 >= #0
            MOV dbl(*SP(#00h)), AC0
            MOV AC0, dbl(*AR6(#0020h))
            B loc_020ddb || MOV #2, T0
loc_020dd9: MOV #0, T0
loc_020ddb: AADD #4, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_020de7: BAND *AR0(#0022h), #12, TC1
            XCCPART !TC1 || MOV #0, T0
            BCC loc_020e05, !TC1
            AMAR *(#0fa000h), XAR3
            MOV XAR3, AC0
            MOV AC0, dbl(*AR0(#0020h))
            MOV #1024, T0
loc_020e05: RET
sub_020e07: MOV XAR2, AC0
            MOV AC0, XAR4
            MOV #255, AR3 || PSH T2
            MOV #1, BRC0 || MOV #0, T2
            MOV #255, T1
            MOV #255, *AR0
            AADD #5, AR4 || RPTB loc_020e2b
               MOV *AR4, AR2
               CMP AR2 != AR3, TC1
               BCC loc_020e31, TC1
loc_020e2b:    AMAR *AR4+ || ADD #1, T2
            B loc_020e48
loc_020e31: MOV T2, AC1
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR3
            MOV AR2, *AR0
            MOV *AR3(short(#7)), AC0
            ADD *AR3(#0008h), AC0, AC0
            SFTS AC0, #-1
            MOV AC0, *AR1
            MOV *AR0, T1
loc_020e48: MOV #255, AR1
            MOV #0, T0
            POP T2
            CMP T1 == AR1, TC1
            XCCPART !TC1 || MOV #1, T0
            RET
sub_020e59: MOV #2, AR1
            CMP T0 < AR1, TC1
            BCC loc_020e83, TC1
            CMP AR1 >= T0, TC1
            BCC loc_020e7f, TC1
            MOV #4, AR1
            CMP AR1 >= T0, TC1
            BCC loc_020e7b, TC1
            MOV #8, AR1
            CMP AR1 < T0, TC1
            MOV #3, AR1
            XCCPART TC1 || MOV #4, AR1
            B loc_020e85
loc_020e7b: B loc_020e85 || MOV #2, AR1
loc_020e7f: B loc_020e85 || MOV #1, AR1
loc_020e83: MOV #0, AR1
loc_020e85: MOV #0, AC0
            BCC loc_020e9b, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, BRC0
            RPTBLOCAL loc_020e99 || NEG AR1, T1
               MOV dbl(*AR0+), AC1
               SFTS AC1, T1, AC1
loc_020e99:    ADD AC1, AC0
loc_020e9b: SUB #3, AR1, T1
            SFTS AC0, T1, AC0
            RET
sub_020ea3: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            MOV #0, AC2
            AMAR *AR1, XAR4 || MOV #7, T0
            AMAR *AR0, XAR5 || MOV #0, T3
            AMAR *AR2, XAR6 || MOV #0, T2
            AADD #-1, SP
loc_020ebc: MOV *AR3+, AC1
            MOV XAR6, AC0
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR0
            CALL sub_020e59
            CMP AC0 < AC2, TC1
            XCCPART !TC1 || MOV T2, T3
            MOV #4, AR1
            XCCPART !TC1 || OR #0, AC0, AC2
            ADD #1, T2
            CMP T2 < AR1, TC1
            BCC loc_020ebc, TC1
            MOV AC2, dbl(*AR5)
            MOV T3, *AR4
            AADD #1, SP
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_020eee: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR2, XAR5 || MOV T1, AC1
            MOV XAR5, AC0
            AADD #-4, SP
            AMAR *AR1, XAR7 || MOV T0, T3
            AMAR *AR0, XAR6 || MOV AR3, T2
            AMAR *SP(#01h), XAR1 || SFTL AC1, #1
            MOV T3, *SP(#01h) || ADD AC1, AC0
            MOV AC0, XAR0 || MOV #7, T0
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV AC0, dbl(*SP(#02h)) || MOV T2, AC1
            MOV XAR5, AC0
            MOV T3, *SP(#00h) || SFTL AC1, #1
            AMAR *SP(#00h), XAR1 || ADD AC1, AC0
            MOV AC0, XAR0 || MOV #7, T0
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV *SP(#01h), AR1
            MOV *SP(#00h), T0
            MAX AR1, T0
            SUB T0, *SP(#01h), T1
            MOV dbl(*SP(#02h)), AC1
            SUB T0, *SP(#00h), T1 || SFTS AC1, T1, AC1
            MOV AC1, dbl(*SP(#02h))
            MOV dbl(*SP(#02h)), AC1 || SFTS AC0, T1, AC0
            MOV HI(AC0), *AR7 || MOV HI(AC1), *AR6
            AADD #4, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_020f5b: SUB #2, T0, AR1
            MOV AR1, CSR
            BSET ST1_FRCT
            MOV #1, T1
            MOV #0, AC0
            AMAR *AR0+
            RPT CSR
               MACM *AR0+, T1, AC0, AC0 || ADD #1, T1
            BCLR ST1_FRCT
            RET
sub_020f74: MOV AR2, T3 || PSH T3, T2
            MOV AR4, T2
            MOV T1, AR2
            MOV AR1, AR4
            MOV T0, AR5 || PSHBOTH XAR5
            MOV #0, AR6 || PSHBOTH XAR6
            AADD #-1, SP
            BCC loc_020fce, AR2 <= #0
            MOV #7, T0
            CALL sub_020f5b
            MOV AR5, T1
            BSET ST1_FRCT || MOV AR2, HI(AC1)
            SUB AR4, T1 || MOV AR2, HI(AC2)
            MPY T3, AC1, AC1
            MOV AR3, T1 || SFTS AC0, T1, AC0
            SFTS AC1, #-9, AC1
            MAC AC2, T1, AC0, AC0
            SUB AC1, AC0
            BSET ST1_SATD || SFTS AC0, #0, AC0
            OR #0, AC1, AC2
            BCLR ST1_SATD || ABS AC0, AC0
            SFTS AC1, #16, AC1
            SFTL AC1, #0, AC1 || BCLR ST1_FRCT
            MPY T2, AC1, AC1
            SFTS AC1, #-15, AC1 || BSET ST1_FRCT
            MAC AC2, T2, AC1, AC1
            SFTS AC1, #-5, AC1
            CMP AC0 >= AC1, TC1
            XCCPART !TC1 || MOV #1, AR6
loc_020fce: AADD #1, SP
            POPBOTH XAR6 || MOV AR6, T0
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_FRCT
            RET
sub_020fdc: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR5 || PSHBOTH XAR7
            AADD #-22, SP
            MOV *SP(#1eh), AR1 || MOV AR0, AR7
            MOV XAR5, AC0 || MOV AR2, T3
            MOV AR1, *SP(#13h)
            MOV T0, *SP(#12h)
            AMAR *SP(#02h), XAR0
            AMAR *SP(#00h), XAR2
            MOV *SP(#1dh), AR1
            MOV AR4, *SP(#10h) || MOV AR3, T2
            MOV T1, *SP(#11h)
            MOV *SP(#1ch), AR6 || MOV T2, AC1
            MOV AR1, *SP(#14h) || SFTL AC1, #1
            MOV T3, *SP(#00h) || ADD AC1, AC0
            MOV AC0, XAR1 || MOV #7, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV XAR5, AC0
            MOV T3, *SP(#01h) || MOV AR6, AC1
            AMAR *SP(#09h), XAR0 || SFTL AC1, #1
            AMAR *SP(#01h), XAR2 || ADD AC1, AC0
            MOV AC0, XAR1 || MOV #7, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV *SP(#10h), AR2
            MOV *SP(#12h), T1
            MOV *SP(#13h), AR4
            MOV *SP(#00h), T0 || MOV AR7, AR1
            AMAR *SP(#02h), XAR0 || MOV T2, AR3
            CALL sub_020f74
            BCC loc_02105c, T0 == #0
            MOV *SP(#11h), T1
            MOV *SP(#14h), AR2
            MOV *SP(#13h), AR4
            MOV *SP(#01h), T0 || MOV AR6, AR3
            AMAR *SP(#09h), XAR0 || MOV AR7, AR1
            CALL sub_020f74
            BCC loc_02105c, T0 == #0
            B loc_02105e || MOV #1, T0
loc_02105c: MOV #0, T0
loc_02105e: AADD #22, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02106a: MOV #-59, AR1
            CMP T1 < AR1, TC1
            MOV AR0, T2 || PSH T2
            BCC loc_02109f, TC1
            BCC loc_02109f, T0 == #0
            ADD #30, T1, T1
            MOV #5, AR0
            .vli_off
            CALL sub_02410f
            .vli_on
            MOV T2, AC1
            MOV T0, AC0
            ADD AC1, AC0
            SFTS AC0, #16, AC0
            MOV #30720, AR1 || MOV HI(AC0), T0
            CMP AR1 >= T0, TC1
            BCC loc_0210a3, TC1
            MOV #30720, AC0
            B loc_0210a9
loc_02109f: MOV #-30720, T0
loc_0210a3: MOV #0, AR1
            MOV T0, AC0
            MAX AR1, AC0
loc_0210a9: POP T2
            MOV AC0, T0
            RET
sub_0210af: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR6 || PSHBOTH XAR7
            AADD #-32, SP
            AMAR *(#word_ebde), XAR5
            MOV *SP(#26h), AR1
            MOV XAR0, dbl(*SP(#16h))
            MOV AR3, *SP(#10h)
            MOV AR1, *SP(#18h)
            MOV T1, *SP(#11h)
            MOV XAR2, dbl(*SP(#12h))
            MOV T0, *SP(#14h)
            AMAR *SP(#04h), XAR0
            AMAR *SP(#0ch), XAR1
            AMAR *AR5, XAR3 || MOV AR4, T2
            CALL sub_020ea3
            AMAR *(#word_ebe2), XAR7
            MOV dbl(*SP(#12h)), XAR2
            AMAR *SP(#0dh), XAR1
            AMAR *SP(#06h), XAR0
            AMAR *AR7, XAR3
            CALL sub_020ea3
            MOV XAR7, AC0
            MOV *SP(#0dh), AC1
            ADD AC1, AC0
            MOV AC0, XAR7
            MOV *SP(#0ch), AC1
            MOV XAR5, AC0
            ADD AC1, AC0
            MOV AC0, XAR5
            MOV *SP(#11h), T0
            MOV dbl(*SP(#12h)), XAR2
            AMAR *SP(#08h), XAR0
            AMAR *SP(#09h), XAR1
            MOV *AR5, T1 || MOV *AR7, AR3
            CALL sub_020eee
            MOV *SP(#0dh), AC1
            MOV *SP(#0ch), AC0
            ADD AC1 << #2, AC0
            AND #15, AC0, AR1
            ADD #128, AR1, AR1
            MOV AR1, *SP(#1ah) || MOV #0, AR1
            MOV AR1, *SP(#1bh)
            MOV *SP(#14h), AR2
            MOV *SP(#1ah), AR1
            CMP AR1 == AR2, TC1
            MOV T0, *SP(#19h) || MOV #0, T3
            BCC loc_021176, TC1
            MOV *AR7, AR1
            MOV AR1, *SP(#00h)
            MOV *SP(#0dh), T0
            AMAR *(#word_ebda), XAR3
            MOV *AR3(T0), AR1
            MOV AR1, *SP(#01h)
            MOV #20972, *SP(#02h)
            MOV *SP(#0ch), T0
            AMAR *(#word_ebd6), XAR2
            MOV *SP(#19h), AR0
            MOV *AR2(T0), AR4 || MOV *AR5, AR3
            MOV dbl(*SP(#12h)), XAR1
            MOV *SP(#09h), T1
            MOV *SP(#11h), AR2
            MOV *SP(#08h), T0
            CALL sub_020fdc
            MOV #1, AR1
            CMP T0 == AR1, TC1
            XCCPART !TC1 || MOV #0, AR1
            XCCPART !TC1 || MOV AR1, *SP(#1ch)
            BCC loc_02117a, !TC1
loc_021176: MOV #1, AR1
            MOV AR1, *SP(#1ch)
loc_02117a: AMAR *(#word_ebea), XAR5
            AMAR *SP(#04h), XAR0
            AMAR *SP(#0eh), XAR1
            MOV dbl(*SP(#12h)), XAR2
            AMAR *AR5, XAR3
            CALL sub_020ea3
            AMAR *(#word_ebf2), XAR7
            MOV dbl(*SP(#12h)), XAR2
            AMAR *SP(#06h), XAR0
            AMAR *SP(#0fh), XAR1
            AMAR *AR7, XAR3
            CALL sub_020ea3
            MOV XAR7, AC0
            MOV *SP(#0fh), AC1
            ADD AC1, AC0
            MOV AC0, XAR7
            MOV *SP(#0eh), AC1
            MOV XAR5, AC0
            ADD AC1, AC0
            MOV AC0, XAR5
            MOV *SP(#11h), T0
            MOV dbl(*SP(#12h)), XAR2
            AMAR *SP(#0ah), XAR0
            AMAR *SP(#0bh), XAR1
            MOV *AR5, T1 || MOV *AR7, AR3
            CALL sub_020eee
            MOV *SP(#0fh), AC1
            MOV *SP(#0eh), AC0
            ADD AC1 << #2, AC0
            MOV *SP(#14h), AR2 || AND #15, AC0, AR1
            ADD #144, AR1, AR1
            MOV T0, *SP(#1dh) || CMP AR1 == AR2, TC1
            MOV AR1, *SP(#1eh)
            BCC loc_021215, TC1
            MOV *AR7, AR1
            MOV AR1, *SP(#00h)
            MOV *SP(#0fh), T0
            AMAR *(#word_ebee), XAR3
            MOV *AR3(T0), AR1
            MOV AR1, *SP(#01h)
            MOV #16777, *SP(#02h)
            MOV *SP(#0eh), T0
            AMAR *(#word_ebe6), XAR2
            MOV *SP(#1dh), AR0
            MOV *AR2(T0), AR4 || MOV *AR5, AR3
            MOV dbl(*SP(#12h)), XAR1
            MOV *SP(#0bh), T1
            MOV *SP(#11h), AR2
            MOV *SP(#0ah), T0
            CALL sub_020fdc
            MOV #1, AR1
            CMP T0 != AR1, TC1
            BCC loc_021217, TC1
loc_021215: MOV #1, T3
loc_021217: MOV *SP(#1ch), AR1
            BCC loc_021221, AR1 != #0
            BCC loc_021283, T3 != #0
            B loc_02133c
loc_021221: BCC loc_02129b, T3 == #0
            MOV *SP(#0ah) << #16, AC0
            MOV *SP(#0bh) << #16, AC0 || SFTS AC0, #-1, AC1
            SFTS AC0, #-1, AC0
            MOV AC1, dbl(*SP(#04h)) || ADD AC1, AC0
            MOV AC0, dbl(*SP(#04h)) || SFTS AC0, #0, AC0
            EXP AC0, T3
            MOV dbl(*SP(#04h)), AC0
            SFTS AC0, T3, AC0
            MOV AC0, dbl(*SP(#04h))
            MOV *SP(#08h) << #16, AC0
            MOV *SP(#09h) << #16, AC0 || SFTS AC0, #-1, AC1
            MOV *SP(#1dh), AR2 || SFTS AC0, #-1, AC0
            MOV AC1, dbl(*SP(#06h)) || ADD AC1, AC0
            MOV AC0, dbl(*SP(#06h)) || MOV AR2, AR1
            SUB T3, AR1 || SFTS AC0, #0, AC0
            EXP AC0, T1
            MOV dbl(*SP(#06h)), AC0 || MOV AR1, AR2
            MOV *SP(#19h), AR1 || SFTS AC0, T1, AC0
            MOV AC0, dbl(*SP(#06h))
            MOV dbl(*SP(#04h)), AC0 || SUB T1, AR1
            MOV HI(AC0), T0
            MOV dbl(*SP(#06h)), AC0 || MOV AR2, T1
            MOV HI(AC0), AR0
            .vli_off
            CALL sub_0241a1
            .vli_on
            BCC loc_02129b, T0 == #0
loc_021283: MOV *SP(#0ah), AR1
            MOV AR1, *SP(#08h)
            MOV *SP(#0bh), AR1
            MOV AR1, *SP(#09h)
            MOV *SP(#1dh), AR1
            MOV AR1, *SP(#19h)
            MOV *SP(#0eh), AR1
            MOV AR1, *SP(#0ch)
            MOV *SP(#0fh), AR1
            MOV AR1, *SP(#0dh)
            MOV *SP(#1eh), AR1
            MOV AR1, *SP(#1ah)
loc_02129b: MOV *SP(#08h) << #16, AC3
            SFTS AC3, #-4, AC0
            MOV AC0, dbl(*SP(#04h))
            MOV *SP(#09h), AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #15, AC1
            MOV AC1, dbl(*SP(#06h))
            MOV dbl(*SP(#04h)), AC1
            MOV dbl(*SP(#06h)), AC0
            CMP AC0 < AC1, TC1
            BCC loc_02133c, TC1
            MOV *SP(#09h) << #16, AC0
            SFTS AC0, #-4, AC1
            MOV AC1, dbl(*SP(#04h))
            MOV *SP(#08h), AC1
            SFTS AC1, #13, AC2
            ADD AC1 << #15, AC2
            MOV AC2, dbl(*SP(#06h))
            MOV dbl(*SP(#04h)), AC2
            MOV dbl(*SP(#06h)), AC1
            CMP AC1 < AC2, TC1
            BCC loc_02133c, TC1
            MOV AC0, dbl(*SP(#06h))
            MOV *SP(#19h), T1
            MOV AC3, dbl(*SP(#04h))
            SUB *SP(#18h), T1, T1 || SFTS AC0, #-1, AC0
            MOV AC0, dbl(*SP(#06h)) || SFTS AC3, #-1, AC1
            MOV AC1, dbl(*SP(#04h))
            MOV dbl(*SP(#06h)), AC2
            ADD dbl(*SP(#04h)), AC2, AC2 || ADD #1, T1
            MOV AC2, dbl(*SP(#04h)) || ADD AC1, AC0
            MOV #-2510 << #16, AC2 || SFTS AC0, T1, AC0
            SFTL AC2, #0, AC2
            MOV AC0, dbl(*SP(#04h)) || MPY T2, AC2, AC2
            MOV AC2, dbl(*SP(#06h))
            MOV dbl(*SP(#04h)), AC1
            MOV dbl(*SP(#06h)), AC0
            CMP AC1 < AC0, TC1
            BCC loc_02133c, TC1
            MOV dbl(*SP(#16h)), XAR3
            MOV *SP(#1ah), AR1
            MOV *SP(#08h), T0
            MOV *SP(#19h), T1
            MOV *SP(#10h), AR0
            MOV AR1, *AR3
            CALL sub_02106a
            MOV T0, *AR6
            MOV *SP(#19h), T1
            MOV *SP(#10h), AR0
            MOV *SP(#09h), T0
            CALL sub_02106a
            MOV T0, *AR6(short(#1)) || MOV #1, AR1
            MOV AR1, *SP(#1bh)
loc_02133c: MOV *SP(#1bh), T0
            AADD #32, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02134a: MOV AR1, AR4 || PSH T3, T2
            AMAR *AR0, XAR2 || MOV T1, AR3
            AADD #-1, SP
            MOV #5, T0 || MOV T0, T2
            CALL sub_020f5b
            MOV AR4, AR1 || SFTS AC0, #0, AC1
            EXP AC1, T1 || MOV #3, BRC0
            AMAR *AR2+ || SUB T1, AR1
            BSET ST1_FRCT || SFTS AC0, T1, AC0
            ADD #15, AR1, AC3
            MOV #0, AC1 || MOV HI(AC0), T1
            MOV #1, AR1 || SFTS AC0, #0, AC0
            RPTBLOCAL loc_02138c || MPY T1, AC0, AC0
               BCLR ST1_FRCT || MOV AR1, HI(AC2)
               SQR AC2, AC2 || ADD #1, AR1
               MOV AC2, T1
               BSET ST1_FRCT
loc_02138c:    MACM *AR2+, T1, AC1, AC1
            SFTS AC1, #0, AC2
            EXP AC2, T3
            SFTS AC3, #1, AC2 || SUB T3, AR4
            ADD #15, AR4, AR1 || SUB AR3, AC2
            SFTS AC1, T3, AC1
            SUB AR1, AC2
            MOV AC2, T1 || SFTS AC1, #0, AC1
            MPY T2, AC1, AC1
            SFTS AC0, T1, AC0
            SUB AC0, AC1
            MOV T2, HI(AC0) || BCLR ST1_FRCT
            MPYK #27525, AC0, AC0 || MOV AR3, T1
            SFTS AC0, #-15, AC0 || SUB AR1, T1
            MOV AC0, AR1
            AADD #1, SP
            MOV AR1, HI(AC0) || BSET ST1_FRCT
            MPY T2, AC0, AC0
            SFTS AC0, T1, AC0
            CMP AC1 < AC0, TC1
            XCCPART !TC1 || MOV #0, T0
            POP T3, T2
            XCCPART TC1 || MOV #1, T0
            BCLR ST1_FRCT
            RET
sub_0213db: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-18, SP
            AMAR *AR1, XAR7
            AMAR *AR2, XAR5
            MOV *SP(#18h), AR1
            MOV AR1, *SP(#0eh) || MOV #0, AR1
            MOV #255, AR2
            MOV AR1, *SP(#0fh)
            AMAR *AR3, XAR6
            MOV *AR5(short(#4)), AR1
            MOV T0, *SP(#0ah)
            MOV XAR0, dbl(*SP(#0ch)) || CMP AR1 == AR2, TC1
            MOV T1, *SP(#09h) || MOV AR4, T2
            BCC loc_02141f, TC1
            MOV #5, AR2
            CMP AR1 < AR2, TC1
            BCC loc_021552, TC1
            MOV #122, AR2
            CMP AR2 < AR1, TC1
            BCC loc_021552, TC1
loc_02141f: AMAR *AR6, XAR0
            MOV #118, T0
            AADD #10, AR0
            .vli_off
            CALL sub_0282cb
            .vli_on
            ADD #5, T0, AR1
            MOV AR1, AC1
            MOV XAR6, AC0
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR0
            MOV AR1, *SP(#10h)
            MOV *SP(#0ah), AR1
            MOV AR1, *SP(#00h)
            AMAR *AR0, XAR6
            AMAR *SP(#00h), XAR1
            ASUB #6, AR0 || MOV #7, T0
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV HI(AC0), *SP(#11h)
            MOV *SP(#09h), AR0
            MOV *SP(#00h), T1
            MOV *SP(#11h), T0
            CALL sub_02106a
            NOP
            NOP
            MOV *SP(#11h), AR1
            MOV *SP(#0eh), AR1 || MOV AR1, HI(AC0)
            SUB AR1, *SP(#00h), T1
            SFTS AC0, T1, AC1
            MOV T2, HI(AC0)
            SUB AC1, AC0
            BSET ST1_SATD || SFTS AC0, #0, AC0
            ABS AC0, AC0
            MOV AR1, T1 || OR #0, AC0, AC1
            BCLR ST1_SATD
            EXP AC1, T2
            MOV T0, T3
            SUB T2, T1 || SFTS AC0, T2, AC0
            MOV *SP(#09h), AR0 || MOV HI(AC0), T0
            CALL sub_02106a
            MOV *AR5(short(#4)), AR2 || MOV #5, AR1
            CMP AR2 < AR1, TC1
            ASUB #4, AR6 || MOV T0, T2
            BCC loc_0214d9, TC1
            MOV *SP(#10h), AR1
            SUB AR2, AR1
            BSET ST3_SATA
            ABS AR1, AR1 || MOV #2, AR2
            CMP AR1 >= AR2, TC1
            BCC loc_0214d9, TC1
            MOV #-8194 << #16, AC0
            SFTL AC0, #0, AC1
            MOV T3, AC0
            SFTS AC0, #13, AC0
            MACM *AR5(#000bh), AC1, AC0
            SFTS AC0, #0, AC0
            ROUND AC0, AC0
            MOV #-8194 << #16, AC0 || MOV HI(AC0), T3
            SFTL AC0, #0, AC1
            MOV T2, AC0
            SFTS AC0, #13, AC0
            MACM *AR5(#000ch), AC1, AC0
            SFTS AC0, #0, AC0
            ROUND AC0, AC0
            MOV HI(AC0), T2
loc_0214d9: MOV T2, AC1
            MOV T3, AC0
            SUB AC1, AC0
            SFTS AC0, #16, AC0
            MOV #6803, AR1 || MOV HI(AC0), AR2
            CMP AR2 < AR1, TC1
            BCC loc_021552, TC1
            MOV #18, AR3
            MOV *SP(#10h), AR1
            CMP AR3 < AR1, TC1
            BCC loc_021517, TC1
            MOV #8504, AR1
            CMP AR2 < AR1, TC1
            BCC loc_021552, TC1
            MOV *SP(#10h), AR1 || MOV #10, AR3
            CMP AR3 < AR1, TC1
            BCC loc_021517, TC1
            MOV #9865, AR1
            CMP AR2 < AR1, TC1
            BCC loc_021552, TC1
loc_021517: MOV *SP(#0ah), AR1
            MOV AR1, *SP(#01h)
            AMAR *SP(#01h), XAR2
            AMAR *SP(#02h), XAR0 || BCLR ST3_SATA
            AMAR *AR6, XAR1 || MOV #5, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV *SP(#00h), T1
            MOV *SP(#01h), AR1
            MOV *SP(#11h), T0
            AMAR *SP(#02h), XAR0
            CALL sub_02134a
            BCC loc_021552, T0 == #0
            MOV T3, *AR7
            MOV dbl(*SP(#0ch)), XAR3
            MOV T3, *AR7(short(#1))
            MOV *SP(#10h), AR1
            MOV T2, *AR5(#000ch)
            MOV T3, *AR5(#000bh)
            MOV AR1, *AR3 || MOV #1, AR1
            MOV AR1, *SP(#0fh)
loc_021552: MOV *SP(#0fh), T0
            AADD #18, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            BCLR ST3_SATA
            RET
sub_021562: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            MOV #0, CDP
            AMAR *(#word_ebf6), XAR6
            AMAR *AR6, XAR3 || PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-2, SP
            AMAR *AR3+
            AMAR *AR1, XAR7 || MOV #-1, AC0
            MOV AC0, dbl(*SP(#00h)) || MOV #0, T2
loc_021588: MOV *AR6, AR1
            MOV AR1, AC0
            MOV AR1, AC1
            SUB AC0, *AR3, AC0
            SFTS AC0, #16, AC0
            SFTL AC1, #1
            MOV XAR7, AC0 || MOV HI(AC0), T3
            ADD AC1, AC0
            MOV AC0, XAR4
            AMAR *(#050000h), XAR2
            MOV T3, HI(AC3)
            MOV XAR2, AC0
            ADD AC3, AC0
            AMAR *AR4, XAR0 || MOV HI(AC0), T0
            CALL sub_020e59
            MOV #6, AR1
            CMP T3 < AR1, TC1
            OR #0, AC0, AC2
            BCC loc_0215d4, TC1
            AMAR *(#050000h), XAR2
            MOV XAR2, AC0
            AMAR *AR4, XAR0 || SUB AC0, AC3
            AADD #10, AR0 || MOV HI(AC3), T0
            CALL sub_020e59
            SUB AC0, AC2
loc_0215d4: MOV dbl(*SP(#00h)), AC0
            CMP AC2 < AC0, TC1 || MOV #4, AR1
            XCCPART !TC1 || MOV T2, CDP
            XCCPART !TC1 || MOV AC2, dbl(*SP(#00h))
            ADD #1, T2
            AADD #2, AR3 || CMP T2 < AR1, TC1
            AADD #2, AR6
            BCC loc_021588, TC1
            MOV CDP, *AR5
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_021602: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-26, SP
            AMAR *AR2, XAR5
            MOV XAR1, dbl(*SP(#0ch))
            MOV *SP(#20h), AR1
            MOV #160, AR2
            MOV AR1, *SP(#10h)
            AMAR *AR3, XAR7
            MOV *AR5(short(#4)), AR1
            MOV T0, *SP(#0bh)
            MOV XAR0, dbl(*SP(#0eh)) || CMP AR1 < AR2, TC1
            MOV T1, *SP(#0ah) || MOV AR4, T2
            BCC loc_021641, TC1
            MOV #164, AR2
            CMP AR1 >= AR2, TC1
            XCCPART !TC1 || SUB #160, AR1, AR1
            XCCPART !TC1 || MOV AR1, *SP(#02h)
            BCC loc_02164a, !TC1
loc_021641: AMAR *SP(#02h), XAR0
            AMAR *AR7, XAR1
            CALL sub_021562
loc_02164a: MOV *SP(#0bh), AR1
            MOV *SP(#02h) << #1, AC0
            MOV AR1, *SP(#04h)
            MOV AR1, *SP(#03h) || MOV AC0, AR1
            AMAR *(#word_ebf6), XAR6
            AMAR *AR6, XAR3
            AADD AR1, AR3
            MOV *AR3, T3
            MOV AC0, *SP(#11h) || MOV T3, AC1
            MOV XAR7, AC0
            MOV XAR3, dbl(*SP(#12h)) || SFTL AC1, #1
            AMAR *SP(#04h), XAR1 || ADD AC1, AC0
            MOV AC0, XAR0 || MOV #5, T0
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV *SP(#11h), AR1
            ADD #1, AR1
            AADD AR1, AR6
            MOV *AR6, AR1
            MOV AR1, *SP(#16h)
            MOV AC0, dbl(*SP(#14h)) || MOV AR1, AC1
            MOV XAR7, AC0
            SFTL AC1, #1
            AMAR *SP(#03h), XAR1 || ADD AC1, AC0
            MOV AC0, XAR0 || MOV #5, T0
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV *SP(#03h), AR1
            MOV *SP(#04h), AR2
            MAX AR2, AR1
            SUB AR1, *SP(#04h), T1
            MOV dbl(*SP(#14h)), AC1
            SFTS AC1, T1, AC1
            MOV AC1, dbl(*SP(#14h))
            SUB AR1, *SP(#03h), T1
            MOV *SP(#14h), AR1
            SFTS AC0, T1, AC0
            MOV AR1, HI(AC0) || MOV HI(AC0), AR2
            SFTS AC0, #-3, AC0
            MOV AC0, dbl(*SP(#14h)) || MOV AR2, AC0
            MOV dbl(*SP(#14h)), AC1 || SFTS AC0, #15, AC0
            CMP AC0 < AC1, TC1
            BCC loc_02180e, TC1
            MOV AR2, HI(AC1)
            MOV AR1, AC0
            SFTS AC1, #-3, AC1
            SFTS AC0, #15, AC0
            CMP AC0 < AC1, TC1
            BCC loc_02180e, TC1
            MOV dbl(*SP(#12h)), XAR3
            MOV *SP(#0bh), AR1
            MOV AR1, *SP(#01h)
            MOV *AR3, AR1
            MOV XAR7, AC0
            MOV AR1, AC1
            SUB AR1, *AR6, AR2 || SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR3
            MOV AR2, AR1
            ADD #7, AR1, T0
            MOV AR2, *SP(#17h) || ASUB #2, AR3
            MOV XAR3, AC0
            AMAR *SP(#01h), XAR1
            MOV AC0, XAR0
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV *SP(#02h), AR1
            MOV HI(AC0), *SP(#18h)
            ADD #160, AR1, AR1
            MOV *SP(#01h), T1
            MOV *SP(#0ah), AR0
            MOV *SP(#18h), T0
            MOV AR1, *SP(#11h)
            CALL sub_02106a
            NOP
            NOP
            MOV *SP(#18h), AR1
            MOV *SP(#10h), AR1 || MOV AR1, HI(AC0)
            SUB AR1, *SP(#01h), T1
            SFTS AC0, T1, AC1
            MOV T2, HI(AC0)
            SUB AC1, AC0
            SFTS AC0, #0, AC0 || BSET ST1_SATD
            ABS AC0, AC0
            MOV AR1, T1 || OR #0, AC0, AC1
            BCLR ST1_SATD
            EXP AC1, T2
            MOV T0, AR6
            SUB T2, T1 || SFTS AC0, T2, AC0
            MOV *SP(#0ah), AR0 || MOV HI(AC0), T0
            CALL sub_02106a
            MOV *SP(#11h), AR1
            MOV *AR5(short(#4)), AR2
            CMP AR1 != AR2, TC1
            MOV T0, T2
            BCC loc_021789, TC1
            MOV #-8194 << #16, AC0
            SFTL AC0, #0, AC1
            MOV AR6, AC0
            SFTS AC0, #13, AC0
            MACM *AR5(#000bh), AC1, AC0
            SFTS AC0, #0, AC0
            ROUND AC0, AC0
            MOV #-8194 << #16, AC0 || MOV HI(AC0), AR6
            SFTL AC0, #0, AC1
            MOV T2, AC0
            SFTS AC0, #13, AC0
            MACM *AR5(#000ch), AC1, AC0
            SFTS AC0, #0, AC0
            ROUND AC0, AC0
            MOV HI(AC0), T2
loc_021789: MOV AR6, HI(AC0)
            MOV T2, AC1
            MOV AC0, dbl(*SP(#14h)) || MOV AR6, AC0
            SUB AC1, AC0
            SFTS AC0, #16, AC1
            MOV #9184 << #16, AC0
            CMP AC1 < AC0, TC1
            BCC loc_02180e, TC1
            MOV *SP(#17h), AR1 || MOV #4, AR2
            CMP AR1 >= AR2, TC1
            BCC loc_0217ef, TC1
            MOV *SP(#0bh), AR1
            MOV AR1, *SP(#00h)
            ADD *SP(#16h), T3, AR1
            ADD #4, AR1, AC0
            BFXTR #32768, AC0, AR1
            ADD AC0, AR1
            SFTS AR1, #-1
            MOV AR1, AC1
            MOV XAR7, AC0
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR3
            AMAR *SP(#05h), XAR0
            AMAR *SP(#00h), XAR2
            ASUB #4, AR3
            MOV XAR3, AC0
            MOV AC0, XAR1 || MOV #5, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV *SP(#01h), T1
            MOV *SP(#00h), AR1
            MOV *SP(#18h), T0
            AMAR *SP(#05h), XAR0
            CALL sub_02134a
            MOV #1, AR1
            CMP T0 == AR1, TC1
            BCC loc_02180e, TC1
loc_0217ef: MOV dbl(*SP(#0eh)), XAR3
            MOV *SP(#11h), AR1
            MOV AR1, *AR3
            MOV dbl(*SP(#0ch)), XAR3
            MOV #1024 << #16, AC1
            MOV dbl(*SP(#14h)), AC0
            SUB AC1, AC0
            MOV HI(AC0), *AR3
            MOV HI(AC0), *AR3(short(#1))
            MOV T2, *AR5(#000ch)
            MOV AR6, *AR5(#000bh)
loc_02180e: AADD #26, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02181a: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            MOV #128, T0 || MOV T0, T2
            AADD #-6, SP
            AMAR *AR1, XAR7
            AMAR *AR2, XAR5
            AMAR *AR0, XAR6
            AMAR *SP(#02h), XAR1
            MOV #255, *SP(#03h)
            MOV T2, *SP(#02h)
            AMAR *AR7, XAR0 || MOV T1, T3
            .vli_off
            CALL sub_02a629
            .vli_on
            MOV AC0, dbl(*SP(#04h))
            MOV *SP(#04h), AR1
            BCC loc_0218b1, AR1 == #0
            MOV *SP(#02h), AR1 || MOV #-13, AR2
            CMP AR1 < AR2, TC1
            BCC loc_0218b1, TC1
            MOV *SP(#02h), AR1
            MOV *AR5(short(#4)), T0
            MOV AR1, *SP(#00h)
            AMAR *SP(#03h), XAR0
            AMAR *AR7, XAR2
            MOV *SP(#04h), AR4 || MOV T2, T1
            AMAR *AR6, XAR1 || MOV T3, AR3
            CALL sub_0210af
            MOV #1, AR1
            CMP T0 == AR1, TC1
            BCC loc_0218b1, TC1
            MOV *SP(#02h), AR1
            AMAR *SP(#03h), XAR0
            MOV AR1, *SP(#00h)
            AMAR *AR7, XAR3
            AMAR *AR5, XAR2
            MOV *SP(#04h), AR4 || MOV T2, T0
            AMAR *AR6, XAR1 || MOV T3, T1
            CALL sub_0213db
            MOV #1, AR1
            CMP T0 == AR1, TC1
            BCC loc_0218b1, TC1
            MOV *SP(#02h), AR1
            AMAR *SP(#03h), XAR0
            MOV AR1, *SP(#00h)
            AMAR *AR7, XAR3
            AMAR *AR5, XAR2
            MOV *SP(#04h), AR4 || MOV T2, T0
            AMAR *AR6, XAR1 || MOV T3, T1
            CALL sub_021602
loc_0218b1: MOV *SP(#03h), T0
            AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0218bf: PSH T2
            AADD #-2, SP
            MOV T0, T2
            MOV T0, HI(AC0)
            MOV AC0, dbl(*SP(#00h))
            BCC loc_0218db, T2 == #0
            MOV T2, AR2
            SUB T1, AR2 || MOV #-1, AR1
            CMP AR2 != AR1, TC1
            XCCPART !TC1 || SUB #1, T2
            B loc_0218dd
loc_0218db: ADD #1, T2
loc_0218dd: AADD T2, AR0
            AMAR *AR0-
            MOV *AR0(short(#2)) << #16, AC3
            MOV *AR0 << #16, AC1 || SFTS AC3, #-1, AC0
            SFTS AC1, #-1, AC2
            MOV *AR0(short(#1)) << #16, AC2 || ADD AC2, AC0
            SUB AC2, AC0
            MOV HI(AC0), T0
            BCC loc_02190f, T0 >= #0
            SFTS AC3, #-2, AC2
            SFTS AC1, #-2, AC0
            SUB AC2, AC0
            .vli_off
            CALL sub_0244fa
            .vli_on
            MOV T2, HI(AC1)
            MOV mmap(@AC0L), AC0
            SFTS AC0, #1
            ADD AC1, AC0
            MOV AC0, dbl(*SP(#00h))
loc_02190f: MOV dbl(*SP(#00h)), AC0
            AADD #2, SP
            POP T2
            RET
sub_021918: PSH T2
            MOV AR1, HI(AC1) || MOV #0, AC0
            OR #32768, AC0, AC0
            ADD AC0, AC1 || BSET ST1_FRCT
            MANT AC1, AC0 :: NEXP AC1, T2 || MOV #15, AR1
            ADD T2, AR1
            MOV AR1, AR3
            ADD T1, AR3
            MOV AR1, T2
            ADD T1, T2 || SFTS AC0, #0, AC1
            SUB #15, AR3, T1 || MPY T0, AC1, AC3
            OR #0, AC0, AC2
            SFTS AC3, T1, AC0 || SUB #15, T2
            MOV HI(AC0), AR3
            SFTS AC3, T2, AC1 || CMP AR3 < AR2, TC1
            XCCPART !TC1 || MOV #1, T0
            MOV HI(AC1), *AR0(short(#1))
            BCC loc_02198f, !TC1
            NEG AR1, T2
            MOV #16384 << #16, AC0
            SFTS AC0, T2, AC1
            SUB AC1 << #1, AC2
            MPY T0, AC2, AC0
            SFTS AC0, T1, AC0
            MOV #8192 << #16, AC0 || MOV HI(AC0), AR1
            SFTS AC0, T2, AC0
            ADD AC2, AC0
            ADD AC0, AC1
            MPY T0, AC0, AC0 || ADD #1, AR1
            MOV AR1, *AR0 || SFTS AC0, T1, AC0
            MOV HI(AC0), AR1
            ADD #1, AR1
            MOV #0, T0 || MPY T0, AC1, AC1
            MOV AR1, *AR0(short(#2)) || SFTS AC1, T1, AC1
            MOV HI(AC1), *AR0(short(#3))
            MOV HI(AC1), T2
            CMP T2 < AR1, TC1
            XCCPART TC1 || MOV #1, T0
loc_02198f: BCLR ST1_FRCT
            POP T2
            RET
sub_021995: PSH T2
            PSHBOTH XAR5
            AADD #-5, SP
            MOV AC0, dbl(*SP(#00h))
            SUB dbl(*SP(#00h)), AC1, AC1
            AMAR *AR0, XAR5
            BCC loc_0219d8, AC1 <= #0
            MANT AC0, AC0 :: NEXP AC0, T0
            MOV AC0, dbl(*SP(#00h))
            MANT AC1, AC0 :: NEXP AC1, T2
            AMAR *SP(#02h), XAR1 || MOV T2, AR0
            MOV dbl(*SP(#00h)), AC0 || MOV HI(AC0), T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#02h), AR1 || MOV #8, AR2
            CMP AR1 >= AR2, TC1
            BCC loc_0219d8, TC1
            CMP *SP(#02h) == #7, TC1
            XCCPART TC1 || MOV #25600, AR1
            XCCPART TC1 || MIN AR1, T0
            B loc_0219df
loc_0219d8: MOV #25600, T0
            MOV #7, *SP(#02h)
loc_0219df: MOV *SP(#02h), AR1
            MOV dbl(*SP(#00h)), AC0
            MOV AR1, *AR5
            XCCPART AC0 < #0 || MOV #0, T0
            AADD #5, SP
            POPBOTH XAR5
            POP T2
            RET
sub_0219f2: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AADD #-3, SP
            MOV T0, T2
            AMAR *AR0, XAR7 || BSET ST1_FRCT
            MPYM *AR7(short(#2)), T2, AC0
            MANT AC0, AC0 :: NEXP AC0, T1
            ADD *AR7(short(#3)), T1, AR1
            ADD #15, AR1, AR5
            MOV AC0, dbl(*SP(#00h))
            MOV HI(AC0), T1
            AMAR *AR7(short(#7)), XAR2
            MPYM *AR7(short(#4)), T1, AC1
            ADD *AR7(short(#5)), AR5, AR1
            MOV *AR7(short(#6)), T0 || MANT AC1, AC1 :: NEXP AC1, T3
            BCLR ST1_FRCT
            ADD T3, AR1
            MOV *AR2, T1 || MOV HI(AC1), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV *SP(#00h) << #16, AC0 || BSET ST1_FRCT
            MPY T2, AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T2
            MOV T0, *AR7(short(#6)) || ADD T2, AR5
            ADD #15, AR5, AR1
            AMAR *AR7, XAR2 || BCLR ST1_FRCT
            MOV *AR7(#0009h), T1
            AADD #9, AR2 || MOV HI(AC0), AR0
            MOV *AR7(#0008h), T0
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV T0, *AR7(#0008h)
            MOV T0, T1
            BCC loc_021a72, T1 <= #0
            AMAR *AR7(#0001h), XAR1
            MOV *AR7(short(#6)) << #16, AC0
            MOV *AR7(short(#7)), T0
            MOV *AR7(#0009h), AR0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV T0, *AR7(#0000h)
loc_021a72: AADD #3, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_021a7c: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-16, SP
            MOV T0, T2
            MOV T1, AR7
            AMAR *AR0, XAR5 || MOV AR7, T0
            AADD T2, AR0 || SUB T2, T0
            .vli_off
            CALL sub_02824a
            .vli_on
            MOV AR7, T1
            AMAR *AR5, XAR0 || ADD T2, T0
            CALL sub_0218bf
            MANT AC0, AC0 :: NEXP AC0, T1 || MOV #15, AR1
            MOV HI(AC0), *SP(#06h) || ADD T1, AR1
            MOV AR1, *SP(#07h)
            MOV HI(AC0), *SP(#0ah)
            MOV #0, *SP(#0fh)
            MOV #0, *SP(#0eh)
            MOV #0, *SP(#0dh)
            MOV #0, *SP(#0ch)
            MOV AR1, *SP(#0bh)
            MOV #1, T3
loc_021abf: MOV *SP(#07h), T1
            MOV *SP(#06h), T0 || MOV AR7, AR2
            AMAR *SP(#02h), XAR0 || MOV T3, AR1
            CALL sub_021918
            MOV #1, AR1
            CMP T0 == AR1, TC1
            BCC loc_021b4d, TC1
            MOV *SP(#04h), T2
            SUB T2, *SP(#05h), AR1
            ADD #1, AR1, AR6
            MOV #2, AR1
            CMP T3 < AR1, TC1
            BCC loc_021b09, TC1
            AMAR *AR5, XAR0
            AADD T2, AR0 || MOV AR6, T0
            .vli_off
            CALL sub_02824a
            .vli_on
            MOV AR7, T1
            ADD T0, T2
            AMAR *AR5, XAR0 || MOV T2, T0
            CALL sub_0218bf
            MANT AC0, AC0 :: NEXP AC0, T1 || MOV #15, AR1
            ADD T1, AR1
            MOV AR1, *SP(#0bh)
            MOV HI(AC0), *SP(#0ah)
loc_021b09: MOV *SP(#02h), AR1
            AMAR *AR5, XAR0
            SUB AR1, *SP(#03h), AR1 || AADD AR1, AR0
            ADD #1, AR1, T0
            .vli_off
            CALL sub_028327
            .vli_on
            MOV AC0, dbl(*SP(#00h))
            MOV *SP(#04h), AC1
            MOV XAR5, AC0
            ADD AC1, AC0 || MOV AR6, T0
            MOV AC0, XAR0
            .vli_off
            CALL sub_028327
            .vli_on
            AMAR *SP(#09h), XAR0
            MOV dbl(*SP(#00h)), AC1
            CALL sub_021995
            MOV T0, *SP(#08h)
            AMAR *SP(#06h), XAR0 || MOV T3, T0
            CALL sub_0219f2
            MOV #16, AR1
            ADD #1, T3
            CMP T3 < AR1, TC1
            BCC loc_021abf, TC1
loc_021b4d: MOV *SP(#06h) << #16, AC0
            MOV *SP(#07h), T1
            SUB #5, T1
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            AADD #16, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_021b63: PSH T3, T2
            PSHBOTH XAR5
            AADD #-2, SP
            MOV T1, T3
            SUB #16, AR2, T1 || MOV AR1, HI(AC0)
            SFTS AC0, T1, AC1
            MOV #1 << #16, AC0
            ADD AC1, AC0
            MOV HI(AC0), AR1
            MOV #32, T0 || MOV T0, AR5
            AADD AR1, AR0 || SUB AR1, T0
            .vli_off
            CALL sub_028327
            .vli_on
            XCCPART AC0 <= #0 || MOV #32767, T0
            BCC loc_021bb9, AC0 <= #0
            MANT AC0, AC0 :: NEXP AC0, T2
            AMAR *SP(#00h), XAR1 || MOV T3, T0
            MOV T2, AR0
            MOV HI(AC0), T1 || MOV AR5, HI(AC0)
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            XCCPART T1 > #0 || MOV #0, T0
            BCC loc_021bb9, T1 > #0
            MOV T0, HI(AC0)
            MOV #32767 << #16, AC1 || SFTS AC0, T1, AC0
            SUB AC0, AC1
            MOV HI(AC1), T0
loc_021bb9: AADD #2, SP
            POPBOTH XAR5
            POP T3, T2
            RET
sub_021bc1: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            AMAR *(#020000h), XAR3
            MOV XAR3, AC0
            AMAR *AR0, XAR5
            AMAR *AR0, XAR1
            AMAR *SP(#02h), XAR0 || MOV T0, T3
            AMAR *SP(#00h), XAR2 || MOV T1, AR6
            .vli_off
            CALL sub_029d9b
            .vli_on
            MOV T0, AC0
            XCCPART AC0 == #0 || MOV #-1, T0
            BCC loc_021c9c, AC0 == #0
            SUB #7, AR6, T1 || MOV T3, AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #14, AC1
            SFTS AC1, T1, AC0
            SUB AC0, dbl(*SP(#00h)), AC0
            MOV HI(AC0), AR2
            MOV AR2, AR1
            SFTL AR1, #1
            AMAR *AR5, XAR0
            MOV #128, T0 || MOV T0, AR7
            MOV #0, *SP(#03h) || AADD AR1, AR0
            AMAR *SP(#03h), XAR1 || SUB AR2, T0
            .vli_off
            CALL sub_029d3b
            .vli_on
            MOV *SP(#02h), AR1
            SUB *SP(#03h), AR1, T1
            MOV AR7, HI(AC0)
            SFTS AC0, T1, AC0
            MOV #-5958 << #16, AC1 || MOV T0, T2
            SFTL AC1, #0, AC1
            MAS T2, AC1, AC0
            XCCPART AC0 <= #0 || MOV #-1, T0
            BCC loc_021c9c, AC0 <= #0
            SUB #8, AR6, T1 || MOV T3, AC0
            MOV T3, HI(AC0)
            SFTS AC0, T1, AC1
            ADD #1 << #16, AC1, AC0
            MOV HI(AC0), AR1
            MOV AR1, AR2
            SFTL AR2, #1
            MOV #128, T0
            SUB AR1, T0
            AMAR *AR5, XAR0
            AMAR *SP(#04h), XAR1
            MOV #0, *SP(#04h) || AADD AR2, AR0
            .vli_off
            CALL sub_029d3b
            .vli_on
            MOV *SP(#03h), AR1
            SUB *SP(#04h), AR1, T1
            MOV T2, HI(AC0) || MOV T0, AR7
            MOV #6552, T1 || SFTS AC0, T1, AC0
            MOV AR7, HI(AC1)
            MAS T1, AC1, AC0
            XCCPART AC0 <= #0 || MOV #-1, T0
            BCC loc_021c9c, AC0 <= #0
            AMAR *SP(#02h), XAR0
            AMAR *SP(#00h), XAR2
            MOV AR6, T1 || MOV T3, AC0
            AMAR *AR5, XAR1 || MOV T3, T0
            .vli_off
            CALL sub_029d9b
            .vli_on
            MOV *SP(#04h), AR1
            MOV *SP(#02h), T1 || MOV AR7, AR0
            .vli_off
            CALL sub_025629
            .vli_on
loc_021c9c: AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_021ca8: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-8, SP
            MOV XAR1, dbl(*SP(#02h)) || MOV AR4, AR7
            AMAR *AR0, XAR4
            AMAR *AR2, XAR0
            MOV AR3, *SP(#06h)
            MOV #13107, AR1 || MOV T0, T2
            MOV T1, *SP(#07h) || CMP T2 < AR1, TC1
            MOV XAR4, dbl(*SP(#04h))
            BCC loc_021cda, TC1
            MOV #-4, T1
            CALL sub_021bc1
            MOV T0, AR5
            BCC loc_021ead, AR5 >= #0
loc_021cda: MOV dbl(*SP(#02h)), XAR0
            MOV #5, T1
            MOV #64, AR1 || MOV T2, T0
            .vli_off
            CALL sub_0296d7
            .vli_on
            MOV dbl(*SP(#02h)), XAR0
            EXP AC0, T3
            SFTS AC0, T3, AC0
            MOV AC0, dbl(*SP(#00h))
            MOV *SP(#00h), AR1 || NEG T3, AR6
            MOV AR1, T0
            MOV AR6, T1 || MOV #5, AR2
            MOV T2, AR1
            CALL sub_021b63
            MOV #6554, AR1
            CMP AR1 >= T2, TC1
            MOV T0, AR5
            BCC loc_021ead, TC1
            MOV dbl(*SP(#02h)), XAR0
            MOV #4, T1
            MOV #64, AR1 || MOV T2, T0
            .vli_off
            CALL sub_0296d7
            .vli_on
            ADD #1, AR6, AR2
            EXP AC0, T1
            NEG T1, AR3
            CMP AR2 < AR3, TC1 || SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            BCC loc_021daa, TC1
            MOV *SP(#00h), AR1 || SUB T1, T3
            MOV #-30112 << #16, AC0 || MOV HI(AC0), T1
            SFTL AC0, #0, AC0
            MOV AR1, HI(AC1) || SUB #1, T3
            BSET ST1_SATD || MPY T1, AC0, AC0
            BCLR ST1_SATD || SFTS AC0, T3, AC0
            SFTS AC1, #-1, AC1
            CMP AC1 >= AC0, TC1
            BCC loc_021daa, TC1
            MOV #3, AR1
            CMP AR7 < AR1, TC1
            BCC loc_021d82, TC1
            MOV #-6554 << #16, AC0
            MOV *SP(#10h), T3 || SFTL AC0, #0, AC1
            MOV T2, HI(AC0)
            MAS T3, AC1, AC0
            MOV HI(AC0), AR1
            BCC loc_021d82, AR1 < #0
            MOV #-5958 << #16, AC0 || MOV T3, AR1
            SFTL AC0, #0, AC0
            MOV AR1, HI(AC1)
            MPY T2, AC0, AC0
            SUB AC1, AC0
            MOV HI(AC0), AR1
            BCC loc_021daa, AR1 <= #0
loc_021d82: MOV #-9830 << #16, AC0
            MOV *SP(#0eh), T3 || SFTL AC0, #0, AC1
            MOV T2, HI(AC0)
            MAS T3, AC1, AC0
            MOV HI(AC0), AR1
            BCC loc_021e8d, AR1 < #0
            MOV #-8548 << #16, AC0 || MOV T3, AR1
            SFTL AC0, #0, AC0
            MOV AR1, HI(AC1)
            MPY T2, AC0, AC0
            SUB AC1, AC0
            MOV HI(AC0), AR1
            BCC loc_021e8d, AR1 > #0
loc_021daa: MOV *SP(#00h), AR1
            MOV #-5958 << #16, AC1 || MOV AR1, HI(AC0)
            SFTL AC1, #0, AC1 || MOV AR3, AR1
            SFTS AC0, #-1, AC0 || SUB AR6, AR1
            SUB #1, AR1, T3
            BSET ST1_SATD || MPY T0, AC1, AC1
            OR #0, AC0, AC3
            SFTS AC1, T3, AC1
            CMP AC3 >= AC1, TC1
            BCC loc_021e61, TC1
            MOV *SP(#11h), AR1
            CMP AR1 < AR5, TC1
            BCC loc_021de2, TC1
            MOV #6554, AR1
            MOV *SP(#11h), AR2
            CMP AR2 >= AR1, TC1
            BCC loc_021de7, TC1
loc_021de2: MOV *SP(#12h), AR1
            BCC loc_021e47, AR1 != #0
loc_021de7: MOV #3277, AR2
            MOV *SP(#06h), AR1
            CMP AR1 < AR2, TC1
            BCC loc_021e2f, TC1
            MOV #9830, T1
            MOV *SP(#06h) << #16, AC1 || BCLR ST1_SATD
            MOV #22938 << #16, AC0
            MAS T1, AC1, AC0 || BSET ST1_FRCT
            MOV T0, HI(AC1)
            MPYM *SP(#00h), AC0, AC0 || BSET ST1_SATD
            SFTS AC1, T3, AC1
            CMP AC0 >= AC1, TC1
            BCC loc_021e61, TC1
            MOV *SP(#07h), AR1
            MOV T2, HI(AC0)
            MOV AR1, HI(AC1)
            OR #0, AC0, AC2
            SUB AC1, AC2
            ABS AC2, AC2
            SFTS AC0, #-1, AC0
            SUB AC1, AC0
            ABS AC0, AC0
            CMP AC0 >= AC2, TC1
            BCC loc_021e61, TC1
            B loc_021e8d
loc_021e2f: MOV #-18724 << #16, AC1
            SFTL AC1, #0, AC1 || BCLR ST1_SATD
            BSET ST1_SATD || MPY T0, AC1, AC1
            SFTS AC1, T3, AC1
            CMP AC0 >= AC1, TC1
            BCC loc_021e61, TC1
            B loc_021e8d
loc_021e47: MOV *SP(#0fh), AR1
            MOV T2, HI(AC0)
            MOV AR1, HI(AC1)
            OR #0, AC0, AC2
            SUB AC1, AC2
            ABS AC2, AC2
            SFTS AC0, #-1, AC0
            SUB AC1, AC0
            ABS AC0, AC0
            CMP AC0 < AC2, TC1
            BCC loc_021e8d, TC1
loc_021e61: MOV #3, AR1
            CMP AR7 < AR1, TC1
            BCC loc_021ead, TC1
            MOV T0, HI(AC0)
            SFTS AC0, T3, AC0
            CMP AC0 < AC3, TC1
            BCC loc_021ead, TC1
            MOV *SP(#0fh), AR1
            MOV T2, HI(AC1)
            MOV AR1, HI(AC2)
            OR #0, AC1, AC0
            SUB AC2, AC0
            ABS AC0, AC0
            SFTS AC1, #-1, AC1
            SUB AC2, AC1
            ABS AC1, AC1
            CMP AC1 >= AC0, TC1
            BCC loc_021ead, TC1
loc_021e8d: MOV dbl(*SP(#02h)), XAR0
            BCLR ST1_FRCT
            BCLR ST1_SATD
            MOV AR3, T1
            MOV T2, AR1 || MOV #4, AR2
            CALL sub_021b63
            MOV dbl(*SP(#04h)), XAR3
            MOV T2, HI(AC0)
            SFTS AC0, #-1, AC0
            MOV T0, *AR3 || ROUND AC0, AC0
            B loc_021eb2 || MOV HI(AC0), T2
loc_021ead: MOV dbl(*SP(#04h)), XAR3
            MOV AR5, *AR3
loc_021eb2: BCLR ST1_FRCT
            BCLR ST1_SATD
            MOV T2, T0
            AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_021ec4: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            MOV *AR0(short(#6)), AC3
            MOV #3277, AR1 || MOV AR1, AC1
            MOV *AR0(short(#2)), T1 || MOV T1, AR3
            MOV *AR0(short(#4)), T2
            MOV *AR0(short(#1)), T3 || MOV T0, AR4
            MOV *AR0(#0000h), T0
            MOV *AR0(short(#3)), AR5 || CMP AR3 >= AR1, TC1
            MOV *AR0(short(#5)), AR6
            MOV T1, AR7
            BCC loc_021eff, TC1
            MOV #-19660 << #16, AC0
            SFTL AC0, #0, AC0
            MOV AR4, T1 || MPY T1, AC0, AC0
            MACK T1, #19660, AC0, AC0
            MOV HI(AC0), AR7
loc_021eff: MOV AR4, AR1
            MOV mmap(@AC1L), AC1
            MOV AR1, AC0
            MOV #-26214 << #16, AC2 || SUB AC1, AC0
            SFTL AC2, #0, AC2
            SFTS AC0, #16, AC1 || MOV AR4, T1
            SFTS AC1, #0, AC0 || BSET ST1_SATD
            BCLR ST1_SATD || ABS AC0, AC0
            MOV #6554, AR1 || MPY T1, AC2, AC2
            SFTS AC2, #-2, AC2
            CMP AC0 < AC2, TC1
            XCCPART !TC1 || MOV #0, AC3
            XCCPART TC1 || ADD #1, AC3
            CMP AR3 >= AR1, TC1
            BCC loc_021f6b, TC1
            CMP AR2 >= AR1, TC1
            BCC loc_021f6b, TC1
            CMP AC0 >= AC2, TC1
            BCC loc_021f6b, TC1
            MANT AC1, AC0 :: NEXP AC1, T3
            MOV #-1310 << #16, AC0 || MOV HI(AC0), T0
            SFTL AC0, #0, AC1
            MOV #-23592 << #16, AC0 || MOV AR4, T2
            SFTL AC0, #0, AC0
            MPY T2, AC0, AC0 || MOV AR5, T1
            SFTS AC0, #-5, AC0
            MAC AC1, T1, AC0, AC0
            MOV #32767, AR6 || ROUND AC0, AC0
            B loc_021f88 || MOV HI(AC0), AR5
loc_021f6b: MOV #-13108 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T0, AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T1
            ADD T1, T3
            MOV HI(AC0), T0
            MOV #-6554 << #16, AC0 || MOV AR6, T1
            SFTL AC0, #0, AC0
            MPY T1, AC0, AC0
            MOV HI(AC0), AR6
loc_021f88: MOV #-6554 << #16, AC0
            MOV AR7, *AR0(short(#2)) || SFTL AC0, #0, AC0
            MOV #31744, AR1 || MOV T2, HI(AC1)
            MOV #-13108 << #16, AC2
            SFTL AC2, #0, AC2 || MOV AR5, T1
            MOV AR6, *AR0(short(#5)) || MPY T1, AC2, AC2
            MOV AR5, *AR0(short(#3)) || SFTS AC2, #-3, AC2
            BSET ST1_FRCT || MPY T0, AC0, AC0
            BSET ST1_SATD || SFTS AC0, T3, AC0
            MPYK #29491, AC1, AC1
            BCLR ST1_FRCT || ADD AC0, AC1
            MOV T3, *AR0(short(#1)) || ADD AC2, AC1
            MOV HI(AC1), T2
            CMP AR1 < T2, TC1
            XCCPART !TC1 || MOV #3277, AR1
            BCLR ST1_SATD
            MAX AR1, T2
            XCCPART TC1 || MOV #31744, T2
            MOV T2, *AR0(short(#4))
            MOV T0, *AR0(#0000h)
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            MOV AC3, *AR0(short(#6)) || RET
sub_021fe4: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-9, SP
            MOV XAR3, dbl(*SP(#06h))
            AMAR *AR1, XAR5
            AMAR *AR2, XAR6
            AMAR *AR0, XAR7 || MOV #2, BRC0
            AMAR *AR5, XAR3 || MOV T0, T2
            AADD #2, AR3 || RPTBLOCAL loc_02200f
               MOV *AR3, AR1
               MOV AR1, *AR3(short(#2))
               MOV *AR3(short(#5)), AR1
               MOV AR1, *AR3(short(#7))
loc_02200f:    AMAR *AR3-
            XCCPART T2 == #0 || MOV #0, *AR7(short(#6))
            MOV *AR7(short(#6)), AR2 || MOV #3, AR1
            CMP AR2 < AR1, TC1
            MOV #4, T0
            BCC loc_02204f, TC1
            MOV #9216, AR2
            MOV *AR7(short(#2)), AR1
            CMP AR1 < AR2, TC1
            BCC loc_022039, TC1
            MOV #9216, AR3
            MOV *AR5(short(#2)), AR2
            CMP AR2 >= AR3, TC1
            BCC loc_02204d, TC1
loc_022039: MOV #8192, AR2
            CMP AR1 < AR2, TC1
            BCC loc_02204f, TC1
            MOV *AR5(short(#2)), AR1
            CMP AR1 < AR2, TC1
            XCCPART !TC1 || MOV #5, T0
            B loc_02204f
loc_02204d: MOV #6, T0
loc_02204f: AMAR *AR6, XAR0
            MOV #32, T1
            CALL sub_021a7c
            MOV #31744, AR1
            MOV *AR7(short(#6)), AR4
            CMP AR1 < T0, TC1
            XCCPART !TC1 || MOV #3277, AR1
            XCCPART !TC1 || MAX AR1, T0
            AMAR *AR5(#0005h), XAR0
            MOV *AR7(short(#2)), AR1
            MOV *AR7(short(#4)), T1
            XCCPART AR4 <= #0 || MOV AR1, AR2
            MOV *AR5(short(#2)), AR3
            XCCPART AR4 > #0 || MOV AR3, AR2
            MOV AR1, *SP(#00h)
            XCCPART TC1 || MOV #31744, T0
            MOV AR2, *SP(#01h)
            MOV *AR5(short(#7)), AR1
            MOV AR3, *SP(#02h)
            MOV AR1, *SP(#03h)
            MOV T2, *SP(#04h)
            MOV *AR7(short(#5)), AR3
            MOV dbl(*SP(#06h)), XAR2
            AMAR *AR6, XAR1
            CALL sub_021ca8
            MOV *AR5(short(#5)), T1
            MOV *AR5(short(#2)), AR1
            MOV *AR5(short(#7)), AR2
            AMAR *AR7, XAR0
            MOV T0, *AR5(#0000h)
            CALL sub_021ec4
            MOV *AR5(short(#5)), AR3
            MOV #13108, AR1
            CMP AR3 < AR1, TC1
            BCC loc_0220c3, TC1
            MOV #13107, AR2
            MOV *AR5(short(#7)), AR1
            CMP AR1 < AR2, TC1
            BCC loc_022107, TC1
loc_0220c3: MOV #13108, AR2
            MOV *AR5(short(#7)), AR1
            CMP AR1 < AR2, TC1
            BCC loc_0220d8, TC1
            MOV #13107, AR2
            CMP AR3 < AR2, TC1
            BCC loc_0220ff, TC1
loc_0220d8: MOV #6554, AR2
            CMP AR2 >= AR1, TC1
            BCC loc_0220e9, TC1
            SFTS AR1, #-1
            CMP AR3 < AR1, TC1
            BCC loc_0220ff, TC1
loc_0220e9: MOV *AR5, AC0
            ADD *AR5(short(#2)), AC0, AC0
            SFTS AC0, #-1, AC0
            MOV AC0, *AR5(short(#1))
            MOV *AR5(short(#5)), AC0
            ADD *AR5(short(#7)), AC0, AC0
            SFTS AC0, #-1, AC0
            MOV AC0, *AR5(short(#6))
            B loc_02210f
loc_0220ff: MOV *AR5, AR1
            MOV AR1, *AR5(short(#1))
            MOV *AR5(short(#5)), AR1
            B loc_02210d
loc_022107: MOV *AR5(short(#2)), AR1
            MOV AR1, *AR5(short(#1))
            MOV *AR5(short(#7)), AR1
loc_02210d: MOV AR1, *AR5(short(#6))
loc_02210f: MOV *AR5(#0000h), T0
            AADD #9, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_02211f: MOV #14, BRC0
            AADD #26, AR0 || MOV T1, AR4
            AADD #20, AR1 || PSH T3, T2
            MOV T0, T3 || MOV #0, T1
            MOV #3, BRC1
            RPTBLOCAL loc_02214a || PSHBOTH XAR5
               AADD #24, AR1
               AMAR *AR1, XAR3 || RPTBLOCAL loc_022146
                  MOV *AR3+, T2 || NOP_16
                  CMP T1 >= T2, TC1
loc_022146:       XCCPART !TC1 || MOV T2, T1
loc_02214a:    NOP
            MOV #14, BRC0
            RPTBLOCAL loc_022171 || MOV #0, T0
               AADD #26, AR0
               BCC loc_022171, AR2 <= #0
               SUB #1, AR2, T2
               MOV T2, BRC1
               AMAR *AR0, XAR3
               ASUB #22, AR3 || RPTBLOCAL loc_02216d
                  MOV *AR3+, T2 || NOP_16
                  CMP T0 >= T2, TC1
loc_02216d:       XCCPART !TC1 || MOV T2, T0
loc_022171:    NOP
            AMAR *+AR0(#-0186h)
            BCC loc_0222d4, T1 == #0
            AMAR *+AR1(#-017ch)
            BCC loc_0222b7, T0 == #0
            MOV T3, AR3 || MOV T0, HI(AC0)
            EXP AC0, T2
            SUB T2, AR3
            MOV T1, HI(AC1)
            MOV mmap(@AR3), AC0
            EXP AC1, T2
            MOV AR4, AR3
            SUB T2, AR3
            MAX AR3, AC0 || MOV AR4, T1
            MOV AC0, T0
            SUB T0, T3
            SUB T0, T1
            MOV T3, T2
            BCC loc_022213, T1 > #0
            CMP AR4 == T0, TC1
            BCC loc_0221f5, TC1
            MOV #-15, AR3
            CMP AR3 < T1, TC1
            BCC loc_0221ca, TC1
            MOV #14, BRC0
            AMAR *AR0, XAR4 || RPTBLOCAL loc_0221c4
               AMAR *AR4, XAR3 || RPT #3
                  MOV #0, *AR3+
loc_0221c4:    AADD #26, AR4
            B loc_022237
loc_0221ca: AMAR *AR0, XAR3 || MOV #14, BRC0
            AADD #44, AR1 || NEG T1, T3
            MOV #3, BRC1
            RPTBLOCAL loc_0221ef || NEG T3, T1
               AMAR *AR1, XAR4
               AMAR *AR3, XAR5 || RPTBLOCAL loc_0221ea
                  MOV *AR4+, AC0 || NOP_16
                  SFTS AC0, T1, AC0
loc_0221ea:       MOV AC0, *AR5+
               AADD #26, AR3
loc_0221ef:    AADD #24, AR1
            B loc_022237
loc_0221f5: MOV #14, BRC0
            AADD #44, AR1
            AMAR *AR0, XAR3 || RPTBLOCAL loc_02220e
               AMAR *AR1, XAR4
               AMAR *AR3, XAR5 || RPT #3
                  MOV *AR4+, *AR5+
               AADD #26, AR3
loc_02220e:    AADD #24, AR1
            B loc_022237
loc_022213: MOV #14, BRC0
            AADD #44, AR1
            MOV #3, BRC1
            AMAR *AR0, XAR3 || RPTBLOCAL loc_022234
               AMAR *AR1, XAR4
               AMAR *AR3, XAR5 || RPTBLOCAL loc_02222f
                  MOV *AR4+ << #16, AC0 || NOP_16
                  SFTS AC0, T1, AC0
loc_02222f:       MOV HI(AC0), *AR5+
               AADD #26, AR3
loc_022234:    AADD #24, AR1
loc_022237: BCC loc_02228f, T2 > #0
            MOV #-15, AR1
            CMP AR1 >= T2, TC1
            BCC loc_022271, TC1
            BCC loc_0222ec, T2 >= #0
            MOV #14, BRC0
            AADD #4, AR0
            RPTBLOCAL loc_02226b || NEG T2, AR1
               BCC loc_02226b, AR2 <= #0
               SUB #1, AR2, T1
               MOV T1, BRC1
               AMAR *AR0, XAR3
               AMAR *AR3, XAR4
               RPTBLOCAL loc_022269 || NEG AR1, T1
                  MOV *AR3+, AC0 || NOP_16
                  SFTS AC0, T1, AC0
loc_022269:       MOV AC0, *AR4+
loc_02226b:    AADD #26, AR0
            B loc_0222ec
loc_022271: SUB #1, AR2, AR1
            MOV AR1, CSR
            MOV #14, BRC0
            AADD #4, AR0 || RPTBLOCAL loc_022289
               BCC loc_022289, AR2 <= #0
               AMAR *AR0, XAR3 || RPT CSR
                  MOV #0, *AR3+
loc_022289:    AADD #26, AR0
            B loc_0222ec
loc_02228f: MOV #14, BRC0
            AADD #4, AR0 || MOV T2, T1
            SUB #1, AR2, AR1 || RPTBLOCAL loc_0222b2
               BCC loc_0222b2, AR2 <= #0
               MOV AR1, BRC1
               AMAR *AR0, XAR3
               AMAR *AR3, XAR4 || RPTBLOCAL loc_0222b0
                  MOV *AR3+ << #16, AC0 || NOP_16
                  SFTS AC0, T1, AC0
loc_0222b0:       MOV HI(AC0), *AR4+
loc_0222b2:    AADD #26, AR0
            B loc_0222ec
loc_0222b7: MOV #14, BRC0
            AADD #44, AR1 || RPTBLOCAL loc_0222cd
               AMAR *AR0, XAR2
               AMAR *AR1, XAR3 || RPT #3
                  MOV *AR3+, *AR2+
               AADD #24, AR1
loc_0222cd:    AADD #26, AR0
            MOV AR4, T3
            B loc_0222ea
loc_0222d4: MOV #14, BRC0
            RPTBLOCAL loc_0222e1
               AMAR *AR0, XAR3 || RPT #3
                  MOV #0, *AR3+
loc_0222e1:    AADD #26, AR0
            BCC loc_0222ea, T0 != #0
            MOV #0, T0
            B loc_0222ec
loc_0222ea: MOV T3, T0
loc_0222ec: POPBOTH XAR5
            POP T3, T2
            RET
sub_0222f2: AMAR *AR0, XAR2
            AMAR *AR0, XAR3 || MOV #14, BRC0
            AADD #26, AR2 || PSH T2
            AADD #29, AR0 || PSHBOTH XAR5
            AADD #-1, SP
            AADD #30, AR3 || RPTB loc_022361
               AMAR *AR0, XAR4
               AMAR *AR3, XAR1
               MOV *AR4, T1
               BCC loc_02233a, T0 <= #0
               SUB #1, T0, T2
               MOV T2, BRC1
               AMAR *AR4+ || RPTBLOCAL loc_022338
                  MOV *AR4+, T2 || NOP_16
                  CMP T1 < T2, TC1
                  BCC loc_022336, TC1
                  MOV #-7518 << #16, AC0
                  SFTL AC0, #0, AC0
                  MPY T1, AC0, AC0
                  MOV HI(AC0), T2
loc_022336:       MOV T2, T1
loc_022338:       MOV T1, *AR1+
loc_02233a:    BCC loc_02235b, T0 <= #0
               SUB #1, T0, T1
               MOV T1, BRC1
               AMAR *AR3, XAR5
               AMAR *AR2, XAR4
               AMAR *AR4, XAR1 || RPTBLOCAL loc_022359
                  MOV *AR4+, T1 || NOP_16
                  SUB T1, *AR5+, T1
                  XCCPART T1 < #0 || MOV #0, T1
loc_022359:       MOV T1, *AR1+
loc_02235b:    AADD #26, AR3
               AADD #26, AR2
loc_022361:    AADD #26, AR0
            AADD #1, SP
            POPBOTH XAR5
            POP T2
            RET
sub_02236c: MOV T1, AR2
            MOV T0, T1 || PSH T2
            AADD #-2, SP
            BCC loc_0223e6, T1 == #0
            MOV dbl(*AR0(#000eh)), AC0
            SFTS AC0, #1, AC3
            MOV dbl(*AR0(#000ch)), AC0
            MOV dbl(*AR0(short(#4))), AC0 || SFTS AC0, #1, AC1
            SFTS AC0, #1
            ADD dbl(*AR0(short(#2))), AC0, AC0
            ADD dbl(*AR0(short(#6))), AC0, AC2
            MOV dbl(*AR0(short(#6))), AC0
            SFTS AC0, #1
            ADD AC2, AC0
            MOV dbl(*AR0(#0008h)), AC2
            SFTS AC2, #2, AC2
            ADD AC0, AC2
            MOV dbl(*AR0(#000ah)), AC0
            ADD dbl(*AR0(#000ah)), AC2, AC2
            SFTS AC0, #2, AC0
            ADD AC2, AC0
            SFTS AC1, #1, AC2
            ADD AC0, AC2
            ADD dbl(*AR0(#000eh)), AC2, AC2
            SFTS AC3, #1, AC0
            ADD AC2, AC0
            ADD AC1, AC0 || MOV AR1, T0
            ADD AC3, AC0
            SFTS AC0, #0, AC1
            EXP AC1, T2
            AMAR *SP(#00h), XAR1 || MOV AR2, AR0
            SFTS AC0, T2, AC0 || SUB T2, T0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            SUB #7, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            B loc_0223ea
loc_0223e6: MOV #1024, T0
loc_0223ea: AADD #2, SP
            POP T2
            RET
sub_0223f0: PSH T3, T2
            PSHBOTH XAR5
            MOV #42, T3 || PSHBOTH XAR7
            AMAR *AR0, XAR5 || PSHBOTH XAR6
            AADD #-98, SP
            AMAR *AR5, XAR3
            AMAR *AR5, XAR4
            MOV XAR2, dbl(*SP(#48h))
            MOV T0, *SP(#4ch)
            AMAR *SP(#00h), XAR6
            MOV XAR1, dbl(*SP(#4ah))
            AMAR *AR5, XAR2 || MOV #3, BRC0
            MOV T1, *SP(#4dh) || AADD #3, AR3
            SUB *SP(#4ch), T3, T3 || AADD #44, AR4
            AADD #52, AR2 || RPTBLOCAL loc_022451
               MOV *AR3, AR1
               MOV AR1, *AR3(short(#1))
               MOV *AR3(short(#5)), AR1
               MOV AR1, *AR3(short(#6))
               MOV *AR3(#000ah), AR1
               MOV AR1, *AR3(#000bh)
               MOV *AR3(#000fh), AR1
               MOV AR1, *AR3(#0010h)
               AMAR *AR2, XAR7
               AMAR *AR4, XAR1 || RPT #7
                  MOV *AR1+, *AR7+
               ASUB #8, AR4
               ASUB #8, AR2
loc_022451:    AMAR *AR3-
            MOV *AR5(#003ch), T1
            MOV dbl(*SP(#48h)), XAR0
            MOV dbl(*SP(#4ah)), XAR1
            MOV *SP(#4dh), T0
            MOV *SP(#4ch), AR2
            CALL sub_02211f
            MOV T0, *SP(#4dh)
            MOV dbl(*SP(#48h)), XAR0
            MOV *SP(#4ch), T0
            CALL sub_0222f2
            MOV *AR5(#003ch), AR1
            MOV *SP(#4dh), AR2
            CMP AR1 < AR2, TC1
            BCC loc_022480, TC1
            MOV AR1, AR2
            SUB *SP(#4dh), AR2, AR2
            B loc_022484
loc_022480: MOV *SP(#4dh), AR1 || SUB AR1, AR2
loc_022484: MOV AR1, *SP(#4fh) || MOV #4, AR1
            CMP AR1 >= T3, TC1
            MOV AR2, *SP(#4eh) || MOV #0, AC1
            BCC loc_0224c6, TC1
            SUB #5, T3, AR1
            MOV AR1, BRC0
            AMAR *SP(#02h), XAR4
            MOV dbl(*SP(#4ah)), XAR3
            SUB #4, T3, T2
            ASUB T3, AR3
            AADD #48, AR3 || RPTBLOCAL loc_0224c1
               MOV #0, AC0
               AMAR *AR3, XAR2
               RPT #14
                  ADD *AR2, AC0, AC0 || AADD #24, AR2
               MOV *SP(#4eh), AR1
               NEG AR1, T1
               ADD AC0, AC1
               AMAR *AR3+ || SFTS AC0, T1, AC0
loc_0224c1:    MOV AC0, dbl(*AR4+)
            B loc_0224c8
loc_0224c6: MOV #0, T2
loc_0224c8: MOV dbl(*SP(#4ah)), XAR7
            MOV #35, AR1
            CMP T2 >= AR1, TC1
            ASUB T3, AR7 || MOV #0, AC0
            BCC loc_02250b, TC1
            MOV #34, AR1
            AMAR *SP(#02h), XAR2 || SUB T2, AR1
            MOV dbl(*SP(#48h)), XAR3
            MOV AR1, BRC0 || MOV T2, AC2
            MOV XAR2, AC3
            SFTL AC2, #1
            ADD AC2, AC3
            MOV AC3, XAR2
            AADD #26, AR3 || RPTBLOCAL loc_022507
               MOV #0, AC2
               AMAR *AR3, XAR4
               RPT #14
                  ADD *AR4, AC2, AC2 || AADD #26, AR4
               MOV AC2, dbl(*AR2+)
loc_022507:    AMAR *AR3+ || ADD AC2, AC0
loc_02250b: MOV *SP(#4eh), AR1
            NEG AR1, T1
            AMAR *SP(#02h), XAR2 || SFTS AC1, T1, AC1
            MOV #0, AC0 || ADD AC0, AC1
            MOV AC1, dbl(*SP(#50h)) || RPT #7
               ADD dbl(*AR2+), AC0, AC0
            MOV #26, BRC0 || MOV #0, AR4
            AMAR *AR2, XAR3 || MOV #1, AR1
            MOV AR4, *SP(#52h) || OR #0, AC0, AC1
            ASUB #16, AR3 || RPTBLOCAL loc_022546
               ADD dbl(*AR2+), AC0, AC0
               SUB dbl(*AR3+), AC0, AC0
               CMP AC1 >= AC0, TC1
               XCCPART !TC1 || MOV AR1, *SP(#52h)
               XCCPART !TC1 || OR #0, AC0, AC1
loc_022546:    ADD #1, AR1
            MOV dbl(*SP(#50h)), AC0
            MOV *SP(#4fh), AR1 || EXP AC0, T1
            MOV dbl(*SP(#50h)), AC0
            SFTS AC0, T1, AC0 || SUB T1, AR1
            MOV AC0, dbl(*SP(#50h)) || SFTS AC1, #0, AC0
            EXP AC0, T1
            MOV AR1, *SP(#53h)
            MOV *SP(#4fh), AR1 || SFTS AC1, T1, AC0
            MOV AC0, dbl(*SP(#54h))
            MOV dbl(*SP(#50h)), AC0 || SUB T1, AR1
            MOV AR1, *SP(#56h)
            XCCPART AC0 == #0 || MOV #32767, T2
            BCC loc_0225a1, AC0 == #0
            MOV AR1, T0
            MOV *SP(#50h), T1
            MOV dbl(*SP(#54h)), AC0
            MOV *SP(#53h), AR0
            AMAR *SP(#00h), XAR1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            SUB #1, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            MOV #8192 << #16, AC0 || MOV T0, AC1
            SUB AC1 << #15, AC0
            SFTS AC0, #2, AC0
            MOV HI(AC0), T2
loc_0225a1: MOV *SP(#52h), AR1
            AMAR *SP(#02h), XAR3
            MOV *SP(#56h), T1 || MOV AR1, AC1
            MOV XAR3, AC0
            MOV *SP(#54h), T0 || SFTL AC1, #1
            MOV *SP(#4fh), AR1 || ADD AC1, AC0
            MOV AC0, XAR0
            CALL sub_02236c
            MOV *SP(#52h), AR1
            AMAR *(#0110000h), XAR3
            MOV AR1, HI(AC1)
            MOV XAR3, AC0
            SUB AC0, AC1
            MOV T0, HI(AC0)
            AMAR *AR7, XAR3 || SFTS AC1, #8, AC1
            MOV *SP(#53h), AR1 || ADD AC0, AC1
            AADD #24, AR3 || SFTS AC1, #-16, AC0
            MOV AR1, *AR5(#000fh)
            MOV XAR3, dbl(*SP(#54h)) || SFTS AC0, #2, AC0
            MOV AC0, *AR5
            MOV *SP(#52h), AR1
            MOV dbl(*SP(#48h)), XAR3
            MOV dbl(*SP(#50h)), AC0 || SUB #4, T3
            MOV T2, *AR5(short(#5)) || AADD #48, AR7
            MOV XAR3, dbl(*SP(#50h)) || ADD #8, AR1
            ADD #4, *SP(#4ch)
            MOV XAR7, dbl(*SP(#58h)) || CMP T3 >= AR1, TC1
            MOV HI(AC0), *AR5(#000ah)
            MOV XAR3, dbl(*SP(#5ah)) || AADD #26, AR3
            BCC loc_022633, TC1
            MOV *SP(#52h), AR1
            CMP AR1 < T3, TC1
            BCC loc_022625, TC1
            SUB T3, AR1
            MOV AR1, *SP(#5ch) || MOV #0, AR1
            MOV AR1, *SP(#56h) || MOV #8, AR1
            MOV AR1, *SP(#53h)
            B loc_02263f
loc_022625: MOV T3, AR1
            SUB *SP(#52h), AR1, AR1
            MOV AR1, *SP(#56h) || MOV #8, AR1
            SUB *SP(#56h), AR1, AR1
            B loc_022639
loc_022633: MOV #8, AR1
            MOV AR1, *SP(#56h) || MOV #0, AR1
loc_022639: MOV AR1, *SP(#53h) || MOV #0, AR1
            MOV AR1, *SP(#5ch)
loc_02263f: BCC loc_02264f, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#54h)), XAR3
            RPT CSR
               MOV #0, *AR3+
loc_02264f: MOV #42, AR1
            CMP T3 >= AR1, TC1
            BCC loc_022666, TC1
            MOV *SP(#4ch), AR1
            SUB #1, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#50h)), XAR3
            RPT CSR
               MOV #0, *AR3+
loc_022666: MOV #35, AR1
            AMAR *AR5, XAR7 || SUB T3, AR1
            MOV AR1, *SP(#5dh) || MOV #8, AR1
            MOV AR1, *SP(#5eh) || AADD #20, AR7
loc_022678: MOV *SP(#56h), AR1
            XCCPART AR1 <= #0 || MOV #0, AC0
            XCCPART AR1 <= #0 || MOV AC0, dbl(*SP(#60h))
            BCC loc_0226b9, AR1 <= #0
            MOV *SP(#52h), AR1
            MOV dbl(*SP(#58h)), XAR3
            MOV dbl(*SP(#54h)), XAR2
            AADD AR1, AR3
            MOV *SP(#56h), AR1 || AADD AR1, AR2
            SUB #1, AR1
            MOV AR1, CSR
            RPT CSR || MOV #0, AC0
               ADD *AR2+, AC0, AC0
            MOV *SP(#56h), AR1
            SUB #1, AR1
            MOV AR1, CSR
            MOV AC0, dbl(*SP(#60h))
            RPT CSR || MOV #0, AC0
               ADD *AR3+, AC0, AC0
            MOV dbl(*SP(#60h)), AC1
            ADD AC0, AC1
            MOV AC1, dbl(*SP(#60h))
loc_0226b9: MOV *SP(#53h), AR1
            XCCPART AR1 <= #0 || MOV #0, AC1
            BCC loc_0226ec, AR1 <= #0
            MOV *SP(#5ch), AR1
            MOV dbl(*SP(#5ah)), XAR3
            MOV dbl(*SP(#50h)), XAR2
            AADD AR1, AR3
            MOV *SP(#53h), AR1 || AADD AR1, AR2
            SUB #1, AR1
            MOV AR1, CSR
            RPT CSR || MOV #0, AC1
               ADD *AR2+, AC1, AC1
            MOV *SP(#53h), AR1
            SUB #1, AR1
            MOV AR1, CSR
            RPT CSR || MOV #0, AC0
               ADD *AR3+, AC0, AC0
            ADD AC0, AC1
loc_0226ec: MOV #0, AC3
            BCC loc_0226fe, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#54h)), XAR3
            RPT CSR
               ADD *AR3+, AC3, AC3
loc_0226fe: MOV #0, AC0
            BCC loc_022710, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#58h)), XAR3
            RPT CSR
               ADD *AR3+, AC0, AC0
loc_022710: MOV #35, AR1
            CMP T3 >= AR1, TC1
            ADD AC0, AC3 || MOV #0, AC2
            BCC loc_02272b, TC1
            MOV *SP(#5dh), AR1
            SUB #1, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#50h)), XAR3
            RPT CSR
               ADD *AR3+, AC2, AC2
loc_02272b: MOV #35, AR1
            CMP T3 >= AR1, TC1
            MOV #0, AC0
            BCC loc_022744, TC1
            MOV *SP(#5dh), AR1
            SUB #1, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#5ah)), XAR3
            RPT CSR
               ADD *AR3+, AC0, AC0
loc_022744: MOV *SP(#4eh), AR1
            NEG AR1, T1
            ADD AC0, AC2
            SFTS AC3, T1, AC0
            NEG AR1, T1 || ADD AC2, AC0
            MOV dbl(*SP(#60h)), AC0 || OR #0, AC0, AC2
            SFTS AC0, T1, AC0
            XCCPART AC2 == #0 || MOV #24576, *AR7
            ADD AC1, AC0
            BCC loc_0227a1, AC2 == #0
            SFTS AC2, #0, AC1
            EXP AC1, T2
            MOV *SP(#4fh), T0 || SFTS AC0, #0, AC1
            MOV *SP(#4fh), AR0 || EXP AC1, T1
            AMAR *SP(#01h), XAR1 || SUB T1, T0
            SUB T2, AR0 || SFTS AC2, T2, AC2
            MOV HI(AC2), T1 || SFTS AC0, T1, AC0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#01h), T1
            SUB #1, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            MOV T0, AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #14, AC1
            MOV #6144 << #16, AC0
            SUB AC1, AC0
            SFTS AC0, #2, AC0
            MOV HI(AC0), *AR7
loc_0227a1: MOV dbl(*SP(#5ah)), XAR3
            MOV XAR3, dbl(*SP(#5ah)) || AADD #52, AR3
            MOV dbl(*SP(#50h)), XAR3
            MOV XAR3, dbl(*SP(#50h)) || AADD #52, AR3
            MOV dbl(*SP(#58h)), XAR3
            MOV XAR3, dbl(*SP(#58h)) || AADD #48, AR3
            MOV dbl(*SP(#54h)), XAR3
            ADD #-1, *SP(#5eh)
            MOV *SP(#5eh), AR1
            AMAR *AR7+
            MOV XAR3, dbl(*SP(#54h)) || AADD #48, AR3
            BCC loc_022678, AR1 != #0
            MOV #18, AR1
            CMP AR1 < T3, TC1
            BCC loc_022802, TC1
            MOV dbl(*SP(#48h)), XAR3
            MOV *SP(#4ch), AR1
            MOV dbl(*SP(#4ah)), XAR2
            AADD AR1, AR3 || MOV #15, BRC0
            ASUB #24, AR3 || RPTBLOCAL loc_0227fc
               AMAR *AR2, XAR1
               AMAR *AR3, XAR4 || RPT #23
                  MOV *AR4+, *AR1+
               AADD #26, AR3
loc_0227fc:    AADD #24, AR2
            B loc_022882
loc_022802: MOV dbl(*SP(#4ah)), XAR7
            MOV #24, AR1
            SUB *SP(#4ch), AR1, AR1
            MOV AR1, *SP(#52h)
            MOV *SP(#4ch), AR1
            AMAR *AR7, XAR3
            AADD AR1, AR3
            MOV XAR3, dbl(*SP(#4ah)) || ASUB #4, AR3
            MOV #16, T2
            AMAR *AR7, XAR3
            ASUB AR1, AR3
            MOV XAR3, dbl(*SP(#50h)) || AADD #24, AR3
            MOV dbl(*SP(#48h)), XAR3
            MOV XAR3, dbl(*SP(#54h))
loc_022832: MOV *AR5(#003ch), T1
            MOV dbl(*SP(#4ah)), XAR1
            MOV *SP(#52h), T0
            MOV *SP(#4dh), AR2
            AMAR *AR7, XAR0
            .vli_off
            CALL sub_028311
            .vli_on
            MOV #42, AR1
            CMP T3 >= AR1, TC1
            BCC loc_02285f, TC1
            MOV *SP(#4ch), AR1
            SUB #1, AR1
            MOV AR1, CSR
            MOV dbl(*SP(#54h)), XAR3
            MOV dbl(*SP(#50h)), XAR2
            RPT CSR
               MOV *AR3+, *AR2+
loc_02285f: MOV dbl(*SP(#4ah)), XAR3
            MOV XAR3, dbl(*SP(#4ah)) || AADD #24, AR3
            MOV dbl(*SP(#50h)), XAR3
            MOV XAR3, dbl(*SP(#50h)) || AADD #24, AR3
            MOV dbl(*SP(#54h)), XAR3
            AADD #24, AR7 || SUB #1, T2
            MOV XAR3, dbl(*SP(#54h)) || AADD #26, AR3
            BCC loc_022832, T2 != #0
loc_022882: MOV *SP(#4dh), AR1
            MOV AR1, *AR5(#003ch)
            MOV *AR5(short(#1)), AR1
            BCC loc_0228e0, AR1 <= #0
            MOV *AR5(#000fh), AR2
            MOV #2, AR3
            SUB AR2, *AR5(#0010h), AR2
            CMP AR2 < AR3, TC1
            BCC loc_0228e0, TC1
            MOV #2, T1
            MOV *AR5(#000ah), AC0
            SUB AR2, T1
            MOV *AR5(#000bh), AR3
            SFTS AC0, T1, AC0
            MOV AC0, AR2
            CMP AR3 < AR2, TC1
            BCC loc_0228e0, TC1
            MOV *AR5(short(#5)), AR2
            MOV *AR5(short(#6)), AR3 || SFTS AR2, #-1
            CMP AR2 < AR3, TC1
            BCC loc_0228e0, TC1
            SUB #20480, AR1, AR1
            AMAR *AR5, XAR3
            MOV AR1, *AR5 || MOV #7, BRC0
            AADD #20, AR3 || RPTBLOCAL loc_0228de
               MOV *AR3(#0008h), AR1
               MOV *AR3, AR2
               CMP AR1 >= AR2, TC1
               XCCPART !TC1 || MOV AR1, *AR3
loc_0228de:    AMAR *AR3+
loc_0228e0: MOV *AR5, AR1
            BCC loc_022937, AR1 >= #0
            MOV *AR5(#0010h), AR2
            MOV #2, AR3
            SUB AR2, *AR5(#000fh), AR2
            CMP AR2 < AR3, TC1
            BCC loc_022937, TC1
            MOV #2, T1
            MOV *AR5(#000bh), AC0
            SUB AR2, T1
            MOV *AR5(#000ah), AR3
            SFTS AC0, T1, AC0
            MOV AC0, AR2
            CMP AR3 < AR2, TC1
            BCC loc_022937, TC1
            MOV *AR5(short(#6)), AR2
            MOV *AR5(short(#5)), AR3 || SFTS AR2, #-1
            CMP AR2 < AR3, TC1
            BCC loc_022937, TC1
            ADD #20480, AR1, AR1
            MOV AR1, *AR5(short(#1)) || MOV #7, BRC0
            AADD #20, AR5 || RPTBLOCAL loc_022935
               MOV *AR5, AR1
               MOV *AR5(#0008h), AR2
               CMP AR1 >= AR2, TC1
               XCCPART !TC1
               MOV AR1, *AR5(#0008h)
loc_022935:    AMAR *AR5+
loc_022937: AADD #98, SP
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_022943: PSHBOTH XAR5
            MOV #0, AC0
            MOV #56, T1
            AMAR *AR0, XAR5 || MOV #0, T0
            MOV #1, *AR5
            MOV #14, *AR5(short(#1))
            MOV #-1, *AR5(short(#4))
            MOV #24596, *AR5(short(#2))
            MOV #-1, *AR5(short(#3))
            MOV #16384, *AR5(#0008h)
            MOV #0, *AR5(#0009h)
            MOV #0, *AR5(#0043h)
            MOV AC0, dbl(*AR5(short(#6))) || AADD #10, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #13107, *AR5(#0042h)
            MOV #0, *AR5(#0044h)
            MOV #14336, *AR5(#0045h)
            MOV #0, *AR5(#0046h)
            POPBOTH XAR5
            RET
sub_022994: MOV #-30719, AR2
            CMP T1 >= AR2, TC1
            XCCPART !TC1 || MOV #-30719, T1
            MOV T1, AR4
            BCC loc_0229d9, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, BRC0
            MOV AR1, HI(AC1) || BSET ST1_SATD
            AMAR *AR0, XAR3 || OR #0, AC1, AC0
            AADD AR2, AR3 || RPTBLOCAL loc_0229d7
               MOV *AR3, AR2 || MOV AR4, HI(AC2)
               SUB AC0, AC2 || CMP AR2 >= AR4, TC1
               XCCPART !TC1 || MOV AR4, *AR3
               MOV #-30719, AR2 || MOV HI(AC2), AR4
               CMP AR4 >= AR2, TC1
               XCCPART !TC1 || MOV #-30719, AR4
loc_0229d7:    AMAR *AR3-
loc_0229d9: MOV #55, AR2
            CMP T0 >= AR2, TC1
            BCC loc_022a19, TC1
            ADD #1, T0, AR2
            MOV #54, AR1 || MOV AR1, HI(AC1)
            SUB T0, AR1
            MOV AR1, BRC0
            BSET ST1_SATD
            OR #0, AC1, AC0
            AADD AR2, AR0 || RPTBLOCAL loc_022a17
               MOV *AR0, AR1 || MOV T1, HI(AC2)
               SUB AC0, AC2 || CMP AR1 >= T1, TC1
               XCCPART !TC1 || MOV T1, *AR0
               MOV #-30719, AR1 || MOV HI(AC2), T1
               CMP T1 >= AR1, TC1
               XCCPART !TC1 || MOV #-30719, T1
loc_022a17:    AMAR *AR0+
loc_022a19: BCLR ST1_SATD
            RET
sub_022a1d: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-4, SP
            AMAR *AR3, XAR6
            AMAR *AR1, XAR7 || MOV T0, T2
            MOV AR2, *SP(#02h) || MOV T1, T3
            BCC loc_022a52, T2 != #0
            AMAR *AR5, XAR1
            AMAR *SP(#01h), XAR0
            MOV *(#word_ec3f), T1
            AMAR *AR6, XAR2
            MOV *AR5(short(#2)), T0 || AADD #8, AR1
            .vli_off
            CALL sub_02aebf
            .vli_on
            B loc_022a55
loc_022a52: MOV #0, *SP(#01h)
loc_022a55: AMAR *SP(#00h), XAR2
            MOV *SP(#02h), AR3
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1 || MOV T3, T1
            AMAR *AR6, XAR4 || MOV T2, T0
            .vli_off
            CALL sub_026ceb
            .vli_on
            MOV *SP(#01h), AR1
            MOV AR1, *AR7(#0009h)
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1 || MOV #1, T0
            .vli_off
            CALL sub_02abfb
            .vli_on
            AADD #4, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_022a89: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-8, SP
            AMAR *AR1, XAR5
            AMAR *AR3, XAR6
            MOV T1, *SP(#04h)
            MOV XAR0, dbl(*SP(#06h))
            AMAR *AR2, XAR7 || MOV T0, T2
            .vli_off
            CALL sub_02a937
            .vli_on
            MOV dbl(*SP(#06h)), XAR0
            MOV #72, T1
            MOV #0, T0 || MOV T0, T3
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *SP(#02h), XAR0
            MOV dbl(*SP(#06h)), XAR1
            .vli_off
            CALL sub_02b62f
            .vli_on
            MOV #2, AR1
            CMP AR1 >= T3, TC1
            BCC loc_022bd1, TC1
            MOV *SP(#04h), AR1
            AMAR *AR5, XAR3
            MOV #20480 << #16, AC1
            MOV #1, AR1 || MOV AR1, HI(AC0)
            MOV AR1, *AR7
            MOV AR1, *AR5 || AADD #8, AR3
            MOV #255, AR1 || SUB AC1, AC0
            MOV AR1, *AR7(short(#1)) || MOV HI(AC0), T3
            MOV AR1, *AR5(short(#1)) || RPT #55
               MOV #-30719, *AR3+
            MOV #163, AR1
            CMP T2 == AR1, TC1
            BCC loc_022b29, TC1
            SUB #128, T2, T0
            MOV #(word_ea07 >> 16) << #16, AC0 || MOV T2, AC1
            AMAR *(#word_e9e3), XAR3
            OR #(word_ea07 & 0xffff), AC0, AC0
            SFTL AC1, #1
            MOV *AR3(T0), AR1 || ADD AC1, AC0
            MOV AC0, XAR3
            MOV AR1, *AR5(short(#6))
            MOV *AR3(#-0100h), AR1
            SUB #1, AR1, T2
            MOV *AR3(#-00ffh), AR1
            SUB #1, AR1, AR7
            B loc_022b31
loc_022b29: MOV #2, AR7
            MOV #11796, *AR5(short(#6))
            MOV #1, T2
loc_022b31: AMAR *AR5, XAR3
            AMAR *AR5, XAR0
            MOV *SP(#04h), AR1 || AADD T2, AR3
            ADD #6144, T3, T3
            MOV AR1, *AR3(#0008h)
            AMAR *AR5, XAR3 || MOV T2, T0
            AADD AR7, AR3 || AADD #8, AR0
            MOV AR1, *AR3(#0008h)
            MOV #512, AR1 || MOV T3, T1
            CALL sub_022994
            MOV #512, AR1
            AMAR *AR5, XAR0 || MOV AR7, T0
            AADD #8, AR0 || MOV T3, T1
            CALL sub_022994
            AMAR *AR5, XAR2
            AMAR *AR5, XAR1
            MOV #21845, AC0
            AMAR *SP(#00h), XAR0 || MOV #7, T1
            MOV #30324, AR3
            MOV *AR5, T0 || AADD #2, AR2
            MOV AC0, dbl(*AR5(short(#4))) || AADD #6, AR1
            .vli_off
            CALL sub_02ab5b
            .vli_on
            MOV T0, T1
            AMAR *SP(#02h), XAR0 || MOV #7, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV #15, T1
            AMAR *SP(#02h), XAR0 || MOV #4, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV *AR5(short(#2)), AR1
            CMP T2 < AR1, TC1
            XCCPART !TC1 || SUB #1, AR1, T2
            CMP AR7 < AR1, TC1
            XCCPART !TC1 || SUB #1, AR1, AR7
            AMAR *AR5, XAR0 || MOV #1, T0
            AMAR *SP(#02h), XAR3 || MOV T2, T1
            AMAR *AR6, XAR1 || MOV AR7, AR2
            CALL sub_022a1d
            MOV *SP(#00h), AR1
            MOV AR1, *AR6(short(#2))
            B loc_022bdf
loc_022bd1: MOV *SP(#04h), T1
            AMAR *SP(#02h), XAR1
            AMAR *AR5, XAR0 || MOV T2, T0
            .vli_off
            CALL sub_029a46
            .vli_on
loc_022bdf: AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_022beb: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR4
            AMAR *AR3, XAR1
            AMAR *AR0, XAR6 || PSHBOTH XAR7
            AADD #-10, SP
            AMAR *AR4, XAR5
            AMAR *SP(#00h), XAR0
            MOV T0, *SP(#04h)
            AMAR *AR2, XAR7
            .vli_off
            CALL sub_02b62f
            .vli_on
            AMAR *SP(#00h), XAR0 || MOV #7, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
            MOV T0, T2
            AMAR *SP(#00h), XAR0 || MOV #4, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
            AMAR *AR6, XAR2
            AMAR *AR6, XAR1
            MOV #30324, T1
            AMAR *AR6, XAR0 || MOV T0, T3
            AADD #2, AR2 || MOV #7, T0
            AADD #6, AR1 || MOV T2, AR3
            .vli_off
            CALL sub_02b303
            .vli_on
            MOV T0, *SP(#05h) || MOV #0, AR1
            MOV AR1, *SP(#06h)
            BCC loc_022cca, T3 != #0
            MOV #64, AR1
            CMP T2 < AR1, TC1
            BCC loc_022c79, TC1
            MOV *(#word_e30f), AR1
            ADD #64, AR1, AR1
            CMP AR1 >= T2, TC1
            BCC loc_022ca5, TC1
            MOV #124, AR1
            CMP T2 >= AR1, TC1
            BCC loc_022ca5, TC1
            MOV #5, AR2
            MOV *AR7(#0044h), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_022ca5, TC1
            B loc_022c90
loc_022c79: MOV *(#word_e30b), AR1
            CMP T2 == AR1, TC1
            BCC loc_022c94, TC1
            MOV #5, AR2
            MOV *AR7(#0044h), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_022ca5, TC1
loc_022c90: B loc_022ca1 || ADD #1, AR1
loc_022c94: MOV #-5, AR2
            MOV *AR7(#0044h), AR1
            CMP AR2 >= AR1, TC1
            BCC loc_022cac, TC1
            SUB #1, AR1
loc_022ca1: MOV AR1, *AR7(#0044h)
loc_022ca5: MOV *AR7(#0044h), AR1
            BCC loc_022cc3, AR1 > #0
loc_022cac: MOV *(#word_e30b), AR1
            CMP T2 == AR1, TC1
            BCC loc_022cc3, TC1
            MOV *(#word_e30f), AR1
            AND #63, T2, T3
            CMP AR1 >= T3, TC1
            BCC loc_022cd0, TC1
loc_022cc3: MOV *(#word_e30f), T3
            B loc_022cd0
loc_022cca: ADD *(#word_e30f), T3, T3
loc_022cd0: AMAR *AR6, XAR1
            AMAR *AR5, XAR0
            MOV dbl(*AR7(short(#6))), AC0
            MOV *AR6, T0 || MOV #4, T1
            AADD #4, AR1 || MOV #7, AR2
            AADD #4, AR0 || MOV T3, AR3
            .vli_off
            CALL sub_02afd2
            .vli_on
            MOV *AR6, AR1 || MOV #1, AR2
            CMP AR1 == AR2, TC1
            BCC loc_022cfc, TC1
            MOV #2, AR2
            CMP AR1 != AR2, TC1
            BCC loc_022d61, TC1
loc_022cfc: MOV #255, AR2
            MOV AR2, *AR6(short(#1))
            MOV AR1, *AR5
            MOV AR2, *AR5(short(#1))
            CMP *AR6 == #2, TC1
            BCC loc_022d2d, TC1
            AMAR *AR5, XAR1
            AMAR *AR5, XAR0
            MOV dbl(*AR7(short(#6))), AC1
            MOV *SP(#05h), T0
            MOV #30324, AR2
            MOV dbl(*AR6(short(#4))), AC0 || AADD #2, AR1
            MOV *AR7(short(#2)), T1 || AADD #6, AR0
            .vli_off
            CALL sub_0294c5
            .vli_on
            B loc_022d35
loc_022d2d: MOV *AR6(short(#6)), AR1
            MOV AR1, *AR5(short(#6))
            MOV *AR6(short(#2)), AR1
            MOV AR1, *AR5(short(#2))
loc_022d35: AMAR *AR5, XAR0
            MOV *AR7(#0043h), T0
            MOV dbl(*AR7(short(#6))), AC1
            MOV *SP(#04h), T1
            MOV dbl(*AR5(short(#4))), AC0 || AADD #7, AR0
            .vli_off
            CALL sub_02b463
            .vli_on
            AMAR *AR6, XAR0
            MOV *AR5(short(#7)), T0
            MOV *SP(#04h), T1
            MOV dbl(*AR5(short(#4))), AC1
            MOV dbl(*AR6(short(#4))), AC0 || AADD #7, AR0
            .vli_off
            CALL sub_02b463
            .vli_on
            MOV *AR6, AR1
loc_022d61: MOV #1, AR2
            CMP AR1 == AR2, TC1
            BCC loc_022d97, TC1
            MOV #2, AR2
            CMP AR1 == AR2, TC1
            BCC loc_022d97, TC1
            MOV #3, AR2
            CMP AR1 == AR2, TC1
            XCCPART !TC1 || MOV #1, AR1
            XCCPART !TC1 || MOV AR1, *SP(#06h)
            BCC loc_022ed8, !TC1
            AMAR *SP(#00h), XAR2
            AMAR *AR7, XAR3
            AMAR *AR5, XAR1
            AMAR *AR6, XAR0
            .vli_off
            CALL sub_0287e7
            .vli_on
            MOV T0, *SP(#06h)
            B loc_022ed8
loc_022d97: MOV *AR6(short(#2)), T1
            AMAR *SP(#00h), XAR0
            MOV *(#word_ec3f), T0
            .vli_off
            CALL sub_02b371
            .vli_on
            CMP *AR6 == #1, TC1
            MOV T0, *SP(#03h)
            BCC loc_022dd5, !TC1
            MOV *SP(#03h), AC0
            MOV #30720, AR2
            ADD *AR7(#0009h), AC0, AC0
            SFTS AC0, #15, AC0
            MOV HI(AC0), *SP(#02h)
            MOV *SP(#02h), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_022dcf, TC1
            MOV *SP(#02h), AR1
            MOV #-30720, AR2
            B loc_022dd7 || MAX AR2, AR1
loc_022dcf: MOV #30719, AR1
            B loc_022dd7
loc_022dd5: MOV *SP(#03h), AR1
loc_022dd7: MOV AR1, *SP(#02h)
            MOV *SP(#03h), AR1
            MOV AR1, *AR7(#0009h)
            AMAR *SP(#02h), XAR2
            AMAR *SP(#00h), XAR3
            AMAR *AR7, XAR0
            AMAR *AR6, XAR1
            .vli_off
            CALL sub_029d0c
            .vli_on
            MOV *AR7, AR1 || MOV #2, AR2
            CMP AR1 == AR2, TC1
            BCC loc_022e9a, TC1
            CMP *AR6 == #2, TC1
            BCC loc_022e7c, !TC1
            MOV #2, AR3
            MOV *AR7(#0046h), AR2
            CMP AR2 >= AR3, TC1
            BCC loc_022e43, TC1
            MOV #3, AR2
            CMP AR1 == AR2, TC1
            BCC loc_022e43, TC1
            MOV AR1, *AR5
            MOV *AR7(short(#1)), AR1
            MOV AR1, *AR5(short(#2))
            MOV dbl(*AR7(short(#6))), AC0
            MOV AC0, dbl(*AR5(short(#4)))
            MOV *AR7(#0008h), AR1
            MOV AR1, *AR5(short(#6))
            MOV *AR7(#0043h), AR1
            MOV AR1, *AR5(short(#7))
            AMAR *AR5, XAR0
            MOV #56, T0
            AADD #8, AR0
            AMAR *AR7, XAR1
            AADD #10, AR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
            B loc_022e4d
loc_022e43: AMAR *AR6, XAR1
            AMAR *AR5, XAR0
            .vli_off
            CALL sub_02b593
            .vli_on
loc_022e4d: MOV *AR5(short(#7)), AR1
            BCC loc_022e68, AR1 > #0
            MOV #21845 << #16, AC0
            MOV dbl(*AR5(short(#4))), AC1
            OR #21845, AC0, AC0
            MOV #0, *AR5(short(#7)) || AND AC1, AC0
            MOV AC0, dbl(*AR5(short(#4)))
            B loc_022ec8
loc_022e68: AMAR *(#0500000h), XAR3
            MOV XAR3, AC0
            MOV *AR5(short(#7)) << #16, AC0 || SFTS AC0, #8, AC1
            SUB AC1, AC0
            MOV HI(AC0), *AR5(short(#7))
            B loc_022ec8
loc_022e7c: AMAR *AR6, XAR2
            AMAR *AR7, XAR1
            AMAR *AR5, XAR0
            MOV *AR6(short(#2)), AR3 || AADD #8, AR2
            MOV *AR7(short(#1)), T1 || AADD #10, AR1
            MOV *AR5(short(#2)), T0 || AADD #8, AR0
            .vli_off
            CALL sub_02ac80
            .vli_on
            B loc_022ec8
loc_022e9a: MOV dbl(*AR5(short(#4))), AC0
            MOV *AR5(short(#7)), T2
            AMAR *AR6, XAR1
            AMAR *AR5, XAR0
            MOV AC0, dbl(*SP(#08h))
            .vli_off
            CALL sub_02b593
            .vli_on
            MOV dbl(*SP(#08h)), AC0
            MOV T2, *AR5(short(#7))
            MOV AC0, dbl(*AR5(short(#4)))
            CMP *AR6 == #2, TC1
            BCC loc_022ec8, TC1
            MOV #55, BRC0
            AADD #8, AR5 || RPTBLOCAL loc_022ec6
               MOV *AR5, AR1
               SFTS AR1, #-1
loc_022ec6:    MOV AR1, *AR5+
loc_022ec8: AMAR *AR7, XAR0
            AMAR *AR6, XAR1 || MOV #1, T0
            .vli_off
            CALL sub_02abfb
            .vli_on
            MOV *SP(#05h), AR1
            MOV AR1, *AR7(short(#2))
loc_022ed8: MOV *SP(#06h), T0
            AADD #10, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_022ee6: MOV XAR1, AC0 || PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR2, XAR1
            AMAR *AR4, XAR5
            AMAR *AR3, XAR6 || PSHBOTH XAR7
            AADD #-5, SP
            AMAR *SP(#04h), XAR3
            MOV *AR5(#001ch), AR2
            AMAR *AR0, XAR7 || MOV T0, T2
            MOV XAR3, dbl(*SP(#00h)) || MOV T2, T1
            SUB AR2, *AR5(#001bh), AR2
            MOV *AR5(#0012h), T0
            MOV AC0, XAR0
            MOV AR2, *SP(#02h) || MOV #1, AR4
            MOV dbl(*AR5(short(#2))), XAR3
            MOV dbl(*AR5), XAR2
            .vli_off
            CALL sub_027260
            .vli_on
            MOV #16, AC1
            MOV AC0, dbl(*AR7(short(#4))) || MOV T2, AC0
            MOV dbl(*AR5(#0010h)), XAR3
            ADD AC0 << #3, AC1
            MOV XAR3, AC0
            AMAR *AR6, XAR0 || ADD AC1, AC0
            MOV AC0, XAR1 || MOV #0, T0
            .vli_off
            CALL sub_02739a
            .vli_on
            MOV *AR5(#0008h), T0
            MOV dbl(*AR5(short(#4))), XAR0
            MOV dbl(*AR5(short(#6))), XAR1
            MOV T2, T1 || MOV #1, AR2
            SUB T2, AR2
            .vli_off
            CALL sub_02a837
            .vli_on
            MOV T0, *AR7(short(#6))
            AADD #5, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_022f67: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AADD #-2, SP
            AMAR *AR0, XAR7 || MOV T0, T2
            CMP *AR7 == #2, TC1
            AMAR *AR2, XAR5 || MOV #0, AR4
            BCC loc_022fa6, TC1
            BCC loc_022fb9, T2 != #0
            MOV T2, *SP(#00h)
            MOV *AR7(short(#6)), T0
            MOV *AR7(short(#2)), T1
            MOV dbl(*AR7(short(#4))), AC0
            MOV *AR5(#001ah), AR2
            MOV dbl(*AR5(#000ah)), XAR3
            MOV dbl(*AR5(#000ch)), XAR4
            MOV #0, *SP(#01h) || AADD #8, AR0
            .vli_off
            CALL sub_02af19
            .vli_on
            B loc_022fb7
loc_022fa6: BCC loc_022fb9, T2 != #0
            AMAR *AR3+
            MOV *AR7(short(#2)), T0 || AADD #8, AR0
            AMAR *AR3, XAR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
loc_022fb7: MOV #1, AR4
loc_022fb9: MOV *AR5(#0013h), AR1
            BCC loc_022fdc, AR1 == #0
            MOV *AR5(#0012h), T0
            MOV dbl(*AR5(#0016h)), XAR0
            MOV dbl(*AR5(#0014h)), XAR2
            MOV dbl(*AR5(#0018h)), AC0
            MOV T2, AR3
            AMAR *AR7, XAR1 || MOV T2, T1
            CALL AC0
loc_022fdc: AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_022fe6: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            MOV #72, T1 || PSHBOTH XAR7
            AADD #-62, SP
            AMAR *AR1, XAR5
            MOV XAR4, dbl(*SP(#36h))
            AMAR *AR3, XAR6
            MOV XAR0, dbl(*SP(#38h))
            MOV dbl(*SP(#44h)), XAR4
            MOV #0, *SP(#02h)
            AMAR *AR2, XAR7 || MOV T0, T2
            MOV XAR4, dbl(*SP(#3ah)) || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#38h)), XAR1
            AMAR *SP(#04h), XAR0
            .vli_off
            CALL sub_02b62f
            .vli_on
            MOV T2, *AR7
            MOV #255, AR1
            MOV T2, *AR5
            MOV AR1, *AR7(short(#1))
            MOV AR1, *AR5(short(#1)) || MOV #1, AR1
            CMP T2 != AR1, TC1
            BCC loc_02305a, TC1
            AMAR *SP(#0eh), XAR1
            AMAR *SP(#2eh), XAR2
            AMAR *SP(#1eh), XAR3
            MOV dbl(*SP(#3ah)), XAR4
            AMAR *AR7, XAR0 || MOV #1, T0
            CALL sub_022ee6
            MOV dbl(*SP(#3ah)), XAR4
            AMAR *SP(#06h), XAR1
            AMAR *SP(#26h), XAR2
            AMAR *SP(#16h), XAR3
            AMAR *AR5, XAR0 || MOV #0, T0
            CALL sub_022ee6
loc_02305a: AMAR *AR5, XAR3
            MOV XAR3, dbl(*SP(#38h)) || AADD #2, AR3
            MOV *AR5, T0
            AMAR *SP(#02h), XAR0
            AMAR *AR5, XAR3 || MOV #7, T1
            MOV XAR3, dbl(*SP(#3ch)) || AADD #6, AR3
            MOV dbl(*SP(#38h)), XAR2
            MOV dbl(*SP(#3ch)), XAR1
            MOV #30324, AR3
            .vli_off
            CALL sub_02ab5b
            .vli_on
            MOV #2, AR1
            CMP T2 == AR1, TC1
            MOV T0, T3
            BCC loc_0230f5, TC1
            AMAR *AR5, XAR1
            AMAR *AR7, XAR0
            MOV #7, *SP(#00h)
            MOV dbl(*AR6(short(#6))), AC0
            AMAR *SP(#06h), XAR2
            AMAR *SP(#16h), XAR3
            AMAR *SP(#26h), XAR4
            AADD #4, AR1 || MOV T2, T0
            AADD #4, AR0 || MOV #4, T1
            .vli_off
            CALL sub_028560
            .vli_on
            MOV T0, T2
            MOV *(#word_e30f), AR1
            CMP T2 < AR1, TC1
            BCC loc_0230d6, TC1
            MOV *(#word_e30f), AR1
            CMP T2 == AR1, TC1
            BCC loc_0230cf, TC1
            SUB *(#word_e30f), T2, T2
            BCC loc_0230dc, T2 == #0
            B loc_0230ff
loc_0230cf: MOV *(#word_e30b), T3
            B loc_0230da
loc_0230d6: ADD #64, T2, T3
loc_0230da: MOV #0, T2
loc_0230dc: MOV dbl(*SP(#3ch)), XAR1
            MOV dbl(*SP(#38h)), XAR2
            MOV #30324, T1 || MOV T3, AR3
            AMAR *AR5, XAR0 || MOV #7, T0
            .vli_off
            CALL sub_02b303
            .vli_on
            MOV T0, *SP(#02h)
            B loc_0230ff
loc_0230f5: MOV #0, AC0
            MOV AC0, dbl(*AR7(short(#4)))
            MOV AC0, dbl(*AR5(short(#4))) || MOV #0, T2
loc_0230ff: AMAR *SP(#04h), XAR0
            MOV #7, T0 || MOV T3, T1
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV T2, T1
            AMAR *SP(#04h), XAR0 || MOV #4, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV dbl(*SP(#3ah)), XAR2
            MOV dbl(*SP(#36h)), XAR3
            AMAR *AR6, XAR1
            AMAR *AR7, XAR0 || MOV #1, T0
            CALL sub_022f67
            MOV dbl(*SP(#3ah)), XAR2
            MOV dbl(*SP(#36h)), XAR3
            AMAR *AR6, XAR1
            AMAR *AR5, XAR0 || MOV #0, T0
            CALL sub_022f67
            AMAR *SP(#04h), XAR3 || MOV #0, T0
            AMAR *AR6, XAR1 || MOV #0, AR2
            AMAR *AR5, XAR0 || MOV #0, T1
            CALL sub_022a1d
            MOV *SP(#02h), AR1
            MOV AR1, *AR6(short(#2))
            AADD #62, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_023159: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            AMAR *AR0, XAR5
            AMAR *AR1, XAR7
            MOV AC1, dbl(*SP(#02h)) || MOV AR2, T3
            MOV AC0, dbl(*SP(#00h)) || MOV T0, T2
            BCC loc_0231b0, T1 <= #0
            MOV AR3, HI(AC0)
            MOV AC0, dbl(*SP(#04h)) || MOV T1, AR6
loc_02317d: AMAR *SP(#00h), XAR0 || BCLR ST1_SATD
            AMAR *AR7, XAR1 || MOV T3, T0
            .vli_off
            CALL sub_026577
            .vli_on
            MOV dbl(*SP(#02h)), AC1
            .vli_off
            CALL sub_0265ac
            .vli_on
            MOV dbl(*SP(#02h)), AC1 || SFTS AC0, T2, AC0
            ADD dbl(*SP(#04h)), AC1, AC1
            SFTS AC0, #0, AC0
            MOV AC1, dbl(*SP(#02h)) || BSET ST1_SATD
            NOP
            NOP
            NOP
            ADD dbl(*AR5), AC0, AC0 || SUB #1, AR6
            MOV AC0, dbl(*AR5+)
            BCC loc_02317d, AR6 != #0
loc_0231b0: MOV dbl(*SP(#00h)), AC0
            AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_SATD
            RET
sub_0231c1: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6 || MOV AR1, AR5
            PSHBOTH XAR7 || MOV T0, AR1
            AADD #-14, SP
            MOV T0, *SP(#09h) || MOV AR1, HI(AC0)
            MOV AC0, dbl(*SP(#0ah))
            MOV AR3, *SP(#04h)
            MOV XAR2, dbl(*SP(#06h))
            MOV T1, *SP(#08h)
            AMAR *AR0, XAR7
            MOV dbl(*SP(#0ah)), AC0 || MOV T1, T0
            .vli_off
            CALL sub_024134
            .vli_on
            MOV *SP(#08h), AR1
            SUB #15, AR1, T1
            MOV dbl(*SP(#0ah)), AC0 || MOV HI(AC0), AR6
            SFTS AC0, T1, AC1
            MOV AR6, HI(AC0)
            SUB AC1, AC0
            SFTS AC0, #15, AC0
            MOV AR5, HI(AC0) || MOV HI(AC0), T2
            OR #0, AC0, AC1
            EXP AC1, T3 || MOV #-4, AR0
            AMAR *SP(#03h), XAR1 || MOV #1, T0
            SUB T3, AR0 || SFTS AC0, T3, AC0
            MOV #16384 << #16, AC0 || MOV HI(AC0), T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#08h), T1
            MOV *SP(#03h), AR1
            MOV *SP(#09h), T0 || MOV T0, AR0
            AMAR *SP(#02h), XAR2
            .vli_off
            CALL sub_0241d2
            .vli_on
            MOV T0, HI(AC0)
            MOV AC0, dbl(*SP(#0ah))
            MOV *SP(#02h), T0
            MOV dbl(*SP(#0ah)), AC0
            .vli_off
            CALL sub_024126
            .vli_on
            NOP
            MOV HI(AC0), AR1
            MOV HI(AC0), AR1 || MOV AR1, HI(AC2)
            MOV *SP(#02h), T1
            MOV #166, AR1 || MOV AR1, AC0
            SUB #15, T1
            MOV dbl(*SP(#0ah)), AC1 || MIN AR1, AC0
            MOV #150, AR3 || SFTS AC1, T1, AC1
            SUB AC2, AC1 || MOV AC0, AR1
            CMP AR3 < AR1, TC1 || SFTS AC1, #15, AC1
            MOV AC0, *SP(#08h) || MOV HI(AC1), AR2
            BCC loc_023270, TC1
            ADD #16, AR1, AR1
            MOV AR1, *SP(#09h)
            BCC loc_023276, AR1 > #0
            B loc_023392
loc_023270: MOV #166, AR1
            MOV AR1, *SP(#09h)
loc_023276: MOV T2, HI(AC0)
            AMAR *(#0f0000h), XAR3
            SFTS AC0, #-15, AC1
            MOV AR2, HI(AC0)
            SFTS AC0, #-15, AC2
            MOV XAR3, AC0
            ADD AC2, AC0
            MOV AC0, dbl(*SP(#0ah)) || MOV AR5, AC0
            SFTS AC0, #9, AC0
            SFTS AC0, #7, AC0
            MOV HI(AC0), *SP(#0ch)
            MOV *SP(#0ch), T1
            MOV T1, HI(AC0) || BSET ST1_FRCT
            MPY T2, AC0, AC0 || MOV AR6, T3
            SFTS AC0, #-11, AC0
            BCC loc_0232e6, T3 >= #0
            NEG T3, AR1
            MOV AR1, HI(AC2)
            MOV #-16, AR1 || MPY T1, AC2, AC2
            SFTS AC2, #4, AC2
            ADD AC2, AC0 || CMP T3 < AR1, TC1
            XCCPART !TC1 || MOV T3, HI(AC2)
            XCCPART !TC1 || SUB AC2, AC1
            BCC loc_0232cd, !TC1
            AMAR *(#0100000h), XAR3
            MOV XAR3, AC2
            ADD AC2, AC1
loc_0232cd: MOV *SP(#08h), AR1
            BCC loc_0232e4, AR1 >= #0
            AMAR *(#010000h), XAR3
            MOV AR1, HI(AC3)
            MOV XAR3, AC2
            ADD dbl(*SP(#0ah)), AC3, AC3
            ADD AC3, AC2
            MOV AC2, dbl(*SP(#0ah))
loc_0232e4: MOV #0, T3
loc_0232e6: MOV *SP(#04h), AR1
            SUB #16, AR1, T0 || MOV T3, AC3
            MOV XAR7, AC2 || MOV AR6, AR1
            SUB T3, AR1 || SFTL AC3, #1
            MOV T0, T2 || ADD AC3, AC2
            ADD #16, AR1, AR5
            MOV AC2, XAR7
            BCC loc_023322, AR5 <= #0
            MOV dbl(*SP(#06h)), XAR1
            BCLR ST1_FRCT
            ADD #16, AR6, T3
            MOV *SP(#0ch), AR2 || MOV #1, AR3
            AMAR *AR7, XAR0 || MOV AR5, T1
            CALL sub_023159
            MOV AR5, AC1
            MOV XAR7, AC2
            SFTL AC1, #1
            ADD AC2, AC1
            MOV AC1, XAR7
loc_023322: MOV *SP(#08h), AR1
            SUB T3, AR1
            ADD #1, AR1
            MOV AR1, *SP(#04h)
            BCC loc_023373, AR1 <= #0
            MOV *SP(#08h), AR1
            MOV *SP(#04h), AR6
            MOV AC0, dbl(*SP(#00h))
            ADD #1, AR1, T3
            AMAR *AR7, XAR5
            MOV *SP(#0ch), AR1
            MOV AR1, *SP(#08h)
loc_02333f: MOV dbl(*SP(#06h)), XAR1
            MOV *SP(#08h), T0 || BCLR ST1_FRCT
            AMAR *SP(#00h), XAR0 || BCLR ST1_SATD
            .vli_off
            CALL sub_026577
            .vli_on
            NOP
            SFTS AC0, T2, AC0
            SFTS AC0, #0, AC0 || BSET ST1_SATD
            ADD dbl(*AR5), AC0, AC0 || SUB #1, AR6
            MOV AC0, dbl(*AR5+)
            BCC loc_02333f, AR6 != #0
            MOV *SP(#04h), AR1
            MOV XAR7, AC2
            MOV AR1, AC1
            SFTL AC1, #1 || BCLR ST1_SATD
            MOV dbl(*SP(#00h)), AC0 || ADD AC2, AC1
            MOV AC1, XAR7
loc_023373: MOV *SP(#09h), AR1
            SUB T3, AR1
            ADD #1, AR1, T1
            BCC loc_023392, T1 <= #0
            MOV dbl(*SP(#06h)), XAR1
            MOV *SP(#0ch), AR2 || BCLR ST1_FRCT
            MOV dbl(*SP(#0ah)), AC1 || MOV #-1, AR3
            AMAR *AR7, XAR0 || MOV T2, T0
            CALL sub_023159
loc_023392: AADD #14, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_FRCT
            RET
sub_0233a0: PSH T3, T2
            AADD #-1, SP
            MOV #0, *AR2
            MOV #0, *AR1
            MOV T0, *AR0 || MOV #0, *AR3
            MOV *SP(#04h), T3
            MOV *SP(#05h), T2
            BCC loc_0233cd, AR4 != #0
            XCCPART T3 == #0 || MOV #0, AR1
            XCCPART T3 == #0 || MOV #0, AC0
            BCC loc_023466, T3 == #0
            BSET ST1_FRCT
            MOV T1, *AR0 || MOV T2, HI(AC1)
            B loc_023455 || MPY T1, AC1, AC1
loc_0233cd: BCC loc_02344f, T3 == #0
            MOV T0, HI(AC1)
            MOV T0, AC2
            MPYK #27306, AC1, AC3
            SFTS AC2, #13, AC1
            ADD AC2 << #15, AC1
            MOV #-26216 << #16, AC2
            SFTL AC2, #0, AC2
            MPY T1, AC2, AC2
            MOV HI(AC2), AR4
            CMP T0 >= AR4, TC1
            BCC loc_023406, TC1
            MOV T1, HI(AC2)
            MPYK #26214, AC2, AC2
            MOV HI(AC2), AR4
            CMP AR4 >= T0, TC1
            BCC loc_023406, TC1
            MOV #16384, AR4
            CMP T0 < AR4, TC1
            BCC loc_023429, TC1
loc_023406: MOV HI(AC3), AR2
            CMP AR2 >= T1, TC1
            BCC loc_023433, TC1
            MOV HI(AC1), AR2
            CMP T1 >= AR2, TC1
            BCC loc_023433, TC1
            MOV #16384, AR2
            CMP T1 >= AR2, TC1
            BCC loc_023433, TC1
            MOV T1, HI(AC1)
            MOV #1, *AR3 || SFTS AC1, #1
            B loc_023431
loc_023429: MOV #1, *AR2 || MOV T1, HI(AC1)
            SFTS AC1, #-1, AC1
loc_023431: MOV HI(AC1), T1
loc_023433: MOV T1, HI(AC3)
            MOV T0, HI(AC1)
            OR #0, AC3, AC2
            SUB AC1, AC2
            SFTS AC1, #-1, AC1
            MOV HI(AC2), *AR1 || SFTS AC3, #-1, AC2
            ADD AC2, AC1
            SFTS AC1, #0, AC1 || BSET ST1_FRCT
            B loc_023455 || MPY T2, AC1, AC1
loc_02344f: MOV T2, HI(AC1) || BSET ST1_FRCT
            MPY T0, AC1, AC1
loc_023455: SFTS AC1, #-4, AC1
            ADD AC0, AC1
            SFTS AC1, #0, AC0
            EXP AC0, T1
            MOV #15, AR1
            SFTS AC1, T1, AC0 || SUB T1, AR1
loc_023466: AADD #1, SP
            SUB #15, AR1, T1
            POP T3, T2
            SFTS AC0, T1, AC0
            BCLR ST1_FRCT
            RET
sub_023474: MOV dbl(*AR4(#00a8h)), AC0
            MOV *AR3 << #16, AC2
            SUB AC0, dbl(*AR1), AC1
            SFTS AC2, #-1, AC2
            SFTS AC0, #-1, AC0
            MOV AC0, dbl(*AR4(#00a8h))
            MOV HI(AC2), *AR3 || SFTS AC1, #-1, AC1
            MOV dbl(*AR4(#00a8h)), AC0
            ADD dbl(*AR4(#00a8h)), AC1, AC1
            MOV *AR2 << #16, AC2 || MOV AC0, dbl(*AR0)
            MOV AC1, dbl(*AR1) || SFTS AC2, #-1, AC2
            MOV HI(AC2), *AR2
            RET
sub_0234a7: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR4, XAR5
            AADD #-9, SP
            AMAR *AR1, XAR7
            MOV dbl(*AR5(#00a8h)), AC0
            SUB AC0, dbl(*AR7), AC1
            AMAR *AR2, XAR6 || SFTS AC0, #1
            MOV AC0, dbl(*SP(#06h))
            MOV XAR3, dbl(*SP(#00h))
            MOV XAR0, dbl(*SP(#02h))
            MOV *SP(#06h), AR1
            MOV AC1, dbl(*SP(#04h))
            BCC loc_02351c, AR1 <= #0
            MOV T0, HI(AC1)
            AMAR *(#010000h), XAR3
            OR #0, AC1, AC0
            MOV XAR3, AC2
            MOV dbl(*SP(#06h)), AC0 || EXP AC0, T2
            AMAR *AR5, XAR1 || SUB AC2, AC0
            MOV AC0, dbl(*SP(#06h))
            MOV dbl(*SP(#06h)), AC0 || BSET ST1_SATD
            AMAR *+AR1(#00abh)
            BCLR ST1_SATD || NEG AC0, AC0
            SFTS AC0, #-1, AC0
            OR #0, AC0, AC2
            EXP AC2, T1 || MOV #15, T0
            SUB T1, T0 || MOV #-4, AR0
            SUB T2, AR0 || SFTS AC1, T2, AC1
            MOV HI(AC1), T1 || SFTS AC0, T1, AC0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV T0, *AR5(#00aah)
loc_02351c: MOV dbl(*SP(#02h)), XAR3
            MOV dbl(*SP(#06h)), AC0
            MOV AC0, dbl(*AR5(#00a8h))
            MOV dbl(*SP(#06h)), AC0
            MOV AC0, dbl(*AR3)
            MOV dbl(*SP(#00h)), XAR3
            MOV *AR3 << #16, AC0
            BSET ST1_SATD || SFTS AC0, #1
            MOV *AR6 << #16, AC0 || MOV HI(AC0), *AR3
            SFTS AC0, #1
            MOV HI(AC0), *AR6
            NOP
            MOV dbl(*SP(#04h)), AC0 || BCLR ST1_SATD
            SFTS AC0, #1
            ADD dbl(*AR5(#00a8h)), AC0, AC0
            MOV AC0, dbl(*SP(#04h))
            MOV dbl(*SP(#04h)), AC0
            MOV AC0, dbl(*AR7)
            AADD #9, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_023560: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-376, mmap(@SP)
            MOV #21845 << #16, AC0
            AMAR *AR1, XAR7
            OR #21845, AC0, AC0
            MOV *AR7(#00aah), AR1
            MOV AR1, *SP(#09h)
            MOV dbl(*AR3(short(#4))), AC1
            MOV *AR7(#00abh), AR1
            AMAR *AR2, XAR5 || AND AC1, AC0
            MOV AR1, *SP(#08h) || MOV #0, AR1
            XCCPART AC0 != #0 || MOV #1, AR1
            AMAR *SP(#00h), XAR6
            MOV #21845 << #16, AC0
            MOV dbl(*AR5(short(#4))), AC1
            OR #21845, AC0, AC0 || MOV T0, T3
            MOV AR1, *AR6(#0166h)
            MOV #0, AR1 || AND AC1, AC0
            XCCPART AC0 != #0 || MOV #1, AR1
            MOV T3, HI(AC0)
            MOV T1, *AR6(#0160h)
            OR #0, AC0, AC1
            MOV AR1, *AR6(#0167h)
            MOV XAR0, dbl(*AR6(#0164h))
            MOV #15, AR1 || EXP AC1, T1
            MOV AC0, dbl(*AR6(#0168h))
            SUB T1, AR1
            MOV dbl(*AR6(#0168h)), AC0
            MOV AR1, *SP(#07h) || MOV AR1, AR0
            MOV AR1, *AR6(#016bh)
            SFTS AC0, T1, AC0
            MOV XAR3, dbl(*AR6(#0162h))
            MOV HI(AC0), *AR6(#016ah)
            AMAR *SP(#07h), XAR1 || MOV #1, T0
            MOV *AR6(#016ah), T1
            MOV #16384 << #16, AC0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV dbl(*AR7(#00a8h)), AC0
            MOV dbl(*AR6(#0162h)), XAR3
            MOV *AR6(#0167h), AR1
            MOV AC0, dbl(*SP(#0ah))
            MOV T0, *AR6(#016ch)
            MOV AR1, *SP(#00h)
            MOV *AR3(short(#6)), T0
            MOV T3, *SP(#01h)
            AMAR *SP(#06h), XAR2
            MOV *AR6(#0166h), AR4
            MOV *AR5(short(#6)), T1
            AMAR *SP(#0dh), XAR0
            AMAR *SP(#0ch), XAR1
            AMAR *SP(#05h), XAR3
            MOV dbl(*SP(#0ah)), AC0
            CALL sub_0233a0
            MOV AC0, dbl(*SP(#0eh))
            MOV dbl(*SP(#0eh)), AC0
            AMAR *SP(#10h), XAR0
            MOV HI(AC0), *AR6(#016dh)
            MOV #168, T0
            AMAR *AR7, XAR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AMAR *SP(#00h), XAR0 || MOV #0, T0
            MOV #168, T1
            AMAR *+AR0(#00b8h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV *AR6(#0166h), AR1
            BCC loc_02368f, AR1 == #0
            MOV *AR6(#016dh), AR1
            BCC loc_02368f, AR1 <= #0
            MOV *SP(#0dh), AR1
            MOV dbl(*AR6(#0162h)), XAR3
            MOV AR1, *SP(#00h)
            MOV *AR7(#00e5h), T1
            AMAR *SP(#10h), XAR0
            MOV *AR6(#016dh), AR1
            MOV T3, *SP(#01h)
            AMAR *SP(#08h), XAR2
            MOV AR1, *SP(#02h)
            MOV *AR3(short(#6)), T0
            MOV dbl(*SP(#0ah)), AC0
            AMAR *AR7, XAR3
            MOV *SP(#0ch), AR4
            AMAR *SP(#09h), XAR1
            AMAR *+AR3(#00e6h)
            .vli_off
            CALL sub_0265ef
            .vli_on
loc_02368f: MOV dbl(*AR6(#0164h)), XAR0
            MOV *AR6(#016ch), T0
            MOV *SP(#07h), T1
            AMAR *SP(#10h), XAR1 || MOV T3, AR2
            .vli_off
            CALL sub_026543
            .vli_on
            MOV #336, T1
            AMAR *SP(#10h), XAR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV *AR5(short(#6)), AR1
            MOV AR1, AC0
            SFTS AC0, #5, AC0
            SFTS AC0, #0, AC0 || BSET ST1_SATD
            BCLR ST1_SATD || NEG AC0, AC0
            SFTS AC0, #11, AC0
            MOV AR1, HI(AC1)
            MOV HI(AC0), *AR6(#016eh)
            OR #0, AC1, AC0
            MOV *AR6(#0160h), AR1
            EXP AC0, T2
            MOV AR1, HI(AC0)
            OR #0, AC0, AC2
            MOV #-4, T0
            MOV #-4, AR0 || EXP AC2, T1
            SUB T1, T0 || SFTS AC1, T2, AC1
            MOV HI(AC1), T1 || SFTS AC0, T1, AC0
            AMAR *SP(#04h), XAR1 || SUB T2, AR0
            .vli_off
            CALL sub_024152
            .vli_on
            AMAR *AR5, XAR3
            AADD #8, AR3
            MOV XAR3, dbl(*AR6(#0170h))
            AMAR *AR7, XAR3
            AMAR *+AR3(#00adh)
            MOV XAR3, dbl(*AR6(#0172h))
            MOV *AR5(short(#2)), AR1
            AMAR *AR7, XAR3
            MOV AR1, *SP(#00h)
            AMAR *+AR3(#00e5h)
            MOV *SP(#04h), T1
            MOV XAR3, dbl(*AR6(#0174h))
            SUB #15, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            AMAR *AR7, XAR3 || SFTS AC0, #0, AC0
            AMAR *+AR3(#00e6h)
            MOV rnd(HI(AC0)), *SP(#01h)
            AMAR *AR7, XAR0
            MOV XAR3, dbl(*AR6(#0176h))
            MOV *AR6(#016eh), T0
            MOV dbl(*AR6(#0170h)), XAR4
            MOV *AR5(#0042h), T1
            MOV dbl(*AR6(#0172h)), XAR2
            MOV dbl(*AR6(#0174h)), XAR1
            MOV #2, *SP(#02h)
            MOV dbl(*AR5(#0040h)), XAR3
            AMAR *+AR0(#00e6h)
            .vli_off
            CALL sub_026282
            .vli_on
            BCC loc_023791, T0 == #0
            AMAR *(#0100000h), XAR3
            MOV *AR5(short(#7)) << #16, AC0
            MOV XAR3, AC1
            SFTS AC0, #-8, AC0
            MOV dbl(*AR6(#0176h)), XAR2
            ADD dbl(*AR6(#0168h)), AC0, AC0
            SUB AC1, AC0
            SFTS AC0, #0, AC1 || MOV #15, T1
            AMAR *SP(#10h), XAR0 || EXP AC1, T2
            MOV *AR7(#00e5h), AR3
            SUB T2, T1 || SFTS AC0, T2, AC0
            MOV *AR5(short(#6)), AR1 || MOV HI(AC0), T0
            CALL sub_0231c1
loc_023791: MOV *AR6(#0167h), AR1
            BCC loc_02385e, AR1 == #0
            MOV *SP(#06h), AR1
            BCC loc_0237b7, AR1 != #0
            MOV *SP(#05h), AR1
            BCC loc_0237d0, AR1 == #0
            AMAR *SP(#0ah), XAR0
            AMAR *SP(#0eh), XAR1
            AMAR *SP(#0dh), XAR2
            AMAR *SP(#0ch), XAR3
            AMAR *AR7, XAR4
            CALL sub_023474
            B loc_0237d0
loc_0237b7: MOV dbl(*AR6(#0162h)), XAR3
            AMAR *SP(#0ah), XAR0
            AMAR *SP(#0eh), XAR1
            AMAR *SP(#0dh), XAR2
            AMAR *AR7, XAR4
            MOV *AR3(short(#6)), T0
            AMAR *SP(#0ch), XAR3
            CALL sub_0234a7
loc_0237d0: MOV dbl(*SP(#0eh)), AC0
            MOV *AR5(short(#2)), AR1
            MOV dbl(*AR5(#0040h)), XAR3
            MOV *AR5(#0042h), T1
            MOV HI(AC0), *AR6(#016dh)
            MOV dbl(*AR6(#0176h)), XAR0
            MOV dbl(*AR6(#0172h)), XAR2
            MOV dbl(*AR6(#0170h)), XAR4
            MOV *AR5(short(#6)), AC0
            MOV AR1, *SP(#00h) || SFTS AC0, #5, AC0
            SFTS AC0, #0, AC0 || BSET ST1_SATD
            MOV dbl(*AR6(#0174h)), XAR1
            BCLR ST1_SATD || NEG AC0, AC0
            MOV #0, *SP(#01h) || SFTS AC0, #11, AC0
            MOV #1, *SP(#02h) || MOV HI(AC0), T0
            .vli_off
            CALL sub_026282
            .vli_on
            MOV *AR7(#00aah), T0
            MOV *AR7(#00abh), T1
            MOV *AR5(short(#6)), AR1
            MOV *AR7(#00e5h), AR3
            MOV dbl(*AR6(#0176h)), XAR2
            AMAR *SP(#10h), XAR0
            CALL sub_0231c1
            MOV *AR6(#016dh), AR1
            BCC loc_02385e, AR1 <= #0
            MOV *SP(#0dh), AR1
            MOV *AR5(short(#6)), T0
            MOV *AR7(#00e5h), T1
            MOV AR1, *SP(#00h)
            AMAR *SP(#10h), XAR0
            AMAR *SP(#08h), XAR2
            MOV *AR6(#016dh), AR1
            MOV T3, *SP(#01h)
            MOV AR1, *SP(#02h)
            MOV dbl(*AR6(#0176h)), XAR3
            MOV dbl(*SP(#0ah)), AC0
            MOV *SP(#0ch), AR4
            AMAR *SP(#09h), XAR1
            .vli_off
            CALL sub_0265ef
            .vli_on
loc_02385e: MOV *AR6(#016dh), AR1
            MOV dbl(*AR6(#0164h)), XAR0
            MOV *AR6(#016ch), T0
            MOV *SP(#07h), T1 || MOV AR1, HI(AC0)
            SUB AC0, dbl(*SP(#0eh)), AC0
            MOV AC0, dbl(*AR7(#00a8h))
            MOV AC0, dbl(*SP(#0eh))
            AMAR *SP(#10h), XAR1 || MOV T3, AR2
            .vli_off
            CALL sub_02650f
            .vli_on
            AMAR *SP(#10h), XAR3 || MOV T3, AC1
            MOV XAR3, AC0
            MOV #168, T0 || SFTL AC1, #1
            AMAR *AR7, XAR0 || ADD AC1, AC0
            MOV AC0, XAR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV *AR6(#0167h), AR1
            OR *AR6(#0166h), AR1, AR1
            XCCPART AR1 == #0
            MOV #0, *AR7(#00abh)
            NOP
            XCCPART AR1 == #0
            MOV #0, *AR7(#00aah)
            BCC loc_0238d1, AR1 == #0
            AMAR *AR7, XAR2
            MOV *AR6(#016ah), T0
            MOV *AR6(#016bh), T1
            MOV *SP(#09h), AR0
            MOV *SP(#08h), AR1
            AMAR *+AR2(#00abh)
            .vli_off
            CALL sub_023f6f
            .vli_on
            MOV T0, *AR7(#00aah)
loc_0238d1: ADD #376, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0238e0: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            MOV XAR2, AC1
            AMAR *AR1, XAR5
            MOV AC1, XCDP
            AMAR *AR3, XAR7
            AADD #-14, SP
            AMAR *AR5, XAR2
            AMAR *AR0, XAR3
            AMAR *AR7, XAR1
            MOV T1, *SP(#01h)
            MOV XAR4, dbl(*SP(#04h)) || MOV #2, BRC0
            MOV T0, *SP(#02h) || BSET ST1_FRCT
            MOV dbl(*SP(#14h)), XAR6
            MOV *SP(#16h), T3 || RPTBLOCAL loc_023920
               MOV *CDP+, T2
               MOV *AR3+, T1
               CMP T1 < T2, TC1
               XCCPART !TC1 || MOV T2, T1
               MOV T1, *AR2+
               MPYM *AR1+, T3, AC0
loc_023920:    MOV HI(AC0), *AR4+
            MOV dbl(*SP(#04h)), XAR3
            MOV AC1, XAR2
            AADD #3, AR0 || MOV #5, AR1
            MOV AR1, *SP(#0ch) || AADD #3, AR5
            MOV XAR0, dbl(*SP(#06h)) || AADD #3, AR7
            MOV XAR3, dbl(*SP(#0ah)) || AADD #3, AR3
            MOV XAR2, dbl(*SP(#08h)) || AADD #3, AR2
            AADD #3, AR6
loc_023946: MOV *AR6 << #16, AC1
            OR #0, AC1, AC0
            MOV *AR7 << #16, AC0 || EXP AC0, T2
            OR #0, AC0, AC2
            MOV *SP(#01h), AR1 || EXP AC2, T0
            MOV *SP(#02h), T1 || SUB T2, AR1
            SUB T0, T1
            MOV mmap(@AR1), AC2
            MAX T1, AC2
            ADD #1, AC2, AR0
            SUB AR0, T1 || SFTS AC0, T0, AC0
            MOV dbl(*SP(#08h)), XAR3
            MOV AR1, T1 || SFTS AC0, T1, AC2
            SUB AR0, T1
            SFTS AC1, T2, AC0
            SFTS AC0, T1, AC0
            ADD AC2, AC0
            SFTS AC0, #0, AC1
            EXP AC1, T1
            MPYM *AR3+, *AR6+, AC1
            MOV XAR3, dbl(*SP(#08h))
            MOV dbl(*SP(#06h)), XAR3
            SUB T1, AR0 || SFTS AC0, T1, AC0
            OR #0, AC1, AC0 || MOV HI(AC0), AR2
            EXP AC0, T1
            MPYM *AR3+, *AR7, AC0
            MOV *SP(#01h), AR1 || OR #0, AC0, AC2
            MOV XAR3, dbl(*SP(#06h)) || EXP AC2, T2
            MOV *SP(#02h), AR3 || SUB T1, AR1
            SFTS AC0, T2, AC0 || SUB T2, AR3
            MOV mmap(@AR1), AC2
            MOV AR3, T2 || MAX AR3, AC2
            ADD #1, AC2, T0
            SUB T0, T2
            MOV AR1, T2 || SFTS AC0, T2, AC2
            SUB T0, T2
            SFTS AC1, T1, AC0
            SFTS AC0, T2, AC0
            ADD AC2, AC0
            SFTS AC0, #0, AC1
            EXP AC1, T2
            XCCPART AR2 == #0 || MOV #32767, *AR5
            SFTS AC0, T2, AC0 || SUB T2, T0
            BCC loc_0239ee, AR2 == #0
            BCLR ST1_FRCT
            AMAR *SP(#00h), XAR1 || MOV AR2, T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            MOV T0, HI(AC0) || BSET ST1_SATD
            SFTS AC0, T1, AC0
            MOV HI(AC0), *AR5
loc_0239ee: MOV dbl(*SP(#0ah)), XAR3
            BSET ST1_FRCT
            BCLR ST1_SATD
            MPYM *AR7+, T3, AC0
            AMAR *AR5+
            MOV HI(AC0), *AR3+
            ADD #-1, *SP(#0ch)
            MOV *SP(#0ch), AR1
            MOV XAR3, dbl(*SP(#0ah))
            BCC loc_023946, AR1 != #0
            MOV dbl(*SP(#04h)), XAR3
            RPT #7 || MOV #0, AR1
               OR *AR3+, AR1, AR1
            BCC loc_023a1d, AR1 != #0
            MOV dbl(*SP(#04h)), XAR3
            RPT #7
               MOV #1, *AR3+
loc_023a1d: AADD #14, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_FRCT
            RET
sub_023a2b: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-272, mmap(@SP)
            MOV T0, T3
            AMAR *SP(#00h), XAR6 || MOV #2, T2
            MOV XAR0, dbl(*AR6(#010ch))
            MOV dbl(*AR6(#010ch)), XAR3
            MOV dbl(*AR6(#010ch)), XAR7
            MOV dbl(*AR6(#010ch)), XAR5
            MOV XAR1, dbl(*AR6(#010ah))
            MOV XAR2, dbl(*AR6(#0108h))
            AMAR *+AR3(#0102h)
            AMAR *+AR7(#0204h)
            AMAR *+AR5(#0307h)
            MOV XAR3, dbl(*AR6(#010eh))
loc_023a6e: MOV dbl(*AR6(#010eh)), XAR1
            AMAR *AR7, XAR0
            MOV #258, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV dbl(*AR6(#010eh)), XAR3
            MOV *AR5, AR1
            AMAR *+AR7(#-0102h)
            MOV AR1, *AR5(short(#1))
            AMAR *+AR3(#-0102h)
            AMAR *AR5- || SUB #1, T2
            MOV XAR3, dbl(*AR6(#010eh))
            BCC loc_023a6e, T2 != #0
            MOV #8, *SP(#00h)
            MOV dbl(*AR6(#010ah)), XAR1
            MOV dbl(*AR6(#010ch)), XAR0
            AMAR *(#word_e97a), XAR2
            MOV #0, AR3
            MOV #145, T1
            AMAR *SP(#06h), XAR4 || MOV #-7, T0
            MOV #1, *SP(#01h) || AADD #55, AR1
            .vli_off
            CALL sub_02a24d
            .vli_on
            MOV dbl(*AR6(#010ch)), XAR3
            MOV T0, *AR3(#0306h)
            MOV dbl(*AR6(#0108h)), XAR3
            MOV #1, BRC0
            AMAR *+AR3(#00c2h)
            RPTBLOCAL loc_023adc
               MOV *AR3(short(#1)), AR1
loc_023adc:    MOV AR1, *AR3+
            MOV dbl(*AR6(#0108h)), XAR1
            MOV dbl(*AR6(#0108h)), XAR0
            MOV #64, T0
            AMAR *+AR1(#0082h)
            AADD #98, AR0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV dbl(*AR6(#010ch)), XAR3
            MOV dbl(*AR6(#0108h)), XAR0
            MOV *AR3(#0306h), T0
            AMAR *+AR0(#00a2h)
            AMAR *SP(#06h), XAR1 || SFTS T0, #-1
            .vli_off
            CALL sub_0245b8
            .vli_on
            MOV dbl(*AR6(#0108h)), XAR3
            MOV T0, *AR3(#00c4h)
            BCC loc_023b93, T3 <= #0
            MOV dbl(*AR6(#010ch)), XAR1
            AMAR *+AR1(#0311h)
            AMAR *AR1, XAR0
            AADD #5, AR0
            .vli_off
            CALL sub_024b1c
            .vli_on
            MOV dbl(*AR6(#010ch)), XAR3
            MOV dbl(*AR6(#010ch)), XAR0
            AMAR *SP(#04h), XAR2
            MOV dbl(*AR6(#010ch)), XAR1
            MOV *AR3(#0307h), T0
            MOV *AR3(#0306h), T1
            AMAR *+AR0(#0102h)
            .vli_off
            CALL sub_0249ec
            .vli_on
            MOV dbl(*AR6(#010ch)), XAR0
            MOV T0, AR1
            AMAR *+AR0(#031bh)
            MOV *AR0(#0050h), T0
            AMAR *AR0, XAR3
            ADD *SP(#04h), T0, AR2
            MOV XAR3, dbl(*SP(#00h)) || AADD #56, AR3
            MOV AR2, *AR0(#0051h)
            MOV AR1, *SP(#02h)
            AMAR *AR0, XAR4
            AMAR *AR0, XAR3
            AMAR *AR0, XAR2
            AMAR *AR0, XAR1
            MOV *AR0(#0052h), T1
            AADD #48, AR4
            AADD #40, AR3
            AADD #16, AR2
            AADD #8, AR1
            CALL sub_0238e0
loc_023b93: ADD #272, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_023ba2: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-612, mmap(@SP)
            MOV #383, T0 || MOV T0, T3
            AMAR *SP(#00h), XAR6
            AMAR *AR4, XAR5
            MOV XAR2, dbl(*AR6(#025ah))
            MOV XAR3, dbl(*AR6(#0258h))
            MOV dbl(*AR6(#026ah)), XAR2
            MOV XAR1, dbl(*AR6(#025ch))
            MOV dbl(*AR6(#026ch)), XAR3
            AMAR *SP(#06h), XAR4
            MOV XAR0, dbl(*AR6(#025eh))
            MOV XAR2, dbl(*AR6(#0260h))
            MOV dbl(*AR6(#026eh)), XAR7
            MOV XAR3, dbl(*SP(#00h))
            AMAR *SP(#07h), XAR1
            AMAR *SP(#00h), XAR2
            AMAR *AR5, XAR0
            MOV dbl(*AR6(#0258h)), XAR3
            AMAR *+AR2(#00b7h)
            .vli_off
            CALL sub_027d85
            .vli_on
            MOV T0, T2
            AMAR *SP(#00h), XAR2 || MOV T2, AC0
            AMAR *AR5, XAR1 || SFTS AC0, #1
            MOV dbl(*AR6(#0260h)), XAR0
            MOV *AR5(#0316h), T1
            AMAR *+AR2(#00b7h)
            AMAR *+AR1(#036eh)
            MOV AC0, T0
            AMAR *+AR0(#0370h)
            .vli_off
            CALL sub_0223f0
            .vli_on
            MOV *AR5(#0316h), AR1
            SFTL AR1, #1
            ADD #7, AR1, T0
            MOV *SP(#06h), T1
            MOV dbl(*AR6(#0258h)), XAR1
            AMAR *AR7, XAR0
            .vli_off
            CALL sub_020b31
            .vli_on
            BCC loc_023c73, T3 <= #0
            AMAR *AR5, XAR3
            AMAR *+AR3(#0310h)
            MOV XAR3, dbl(*SP(#00h))
            MOV dbl(*AR6(#025eh)), XAR0
            MOV dbl(*AR6(#025ch)), XAR1
            AMAR *AR5, XAR3
            AMAR *+AR3(#0317h)
            MOV XAR3, dbl(*SP(#02h))
            MOV dbl(*AR6(#025ah)), XAR2
            AMAR *SP(#07h), XAR4
            MOV XAR7, dbl(*SP(#04h))
            AMAR *AR5, XAR3 || MOV T2, T0
            .vli_off
            CALL sub_024804
            .vli_on
loc_023c73: AMAR *AR5, XAR3
            AMAR *AR5, XAR7
            MOV #49, AR1
            ASUB T2, AR7 || AADD T2, AR3
            MOV XAR3, dbl(*AR6(#025eh))
            MOV #16, T3 || SUB T2, AR1
            MOV AR1, *AR6(#0262h)
            AADD #49, AR7
            AMAR *SP(#07h), XAR3
            MOV XAR3, dbl(*AR6(#025ch))
loc_023c9d: MOV dbl(*AR6(#025eh)), XAR1
            MOV *AR6(#0262h), T0
            AMAR *AR5, XAR0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV dbl(*AR6(#025ch)), XAR1
            AMAR *AR7, XAR0 || MOV T2, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV dbl(*AR6(#025eh)), XAR3
            AADD #49, AR3
            MOV XAR3, dbl(*AR6(#025eh))
            MOV dbl(*AR6(#025ch)), XAR3
            AADD #49, AR5
            AADD #49, AR7
            AADD #11, AR3 || SUB #1, T3
            MOV XAR3, dbl(*AR6(#025ch))
            BCC loc_023c9d, T3 != #0
            ADD #612, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_023cef: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            MOV #255, T1 || PSHBOTH XAR7
            AADD #-8, SP
            AMAR *AR1, XAR5
            MOV XAR4, dbl(*SP(#02h))
            MOV XAR3, dbl(*SP(#04h))
            MOV XAR2, dbl(*SP(#06h))
            MOV dbl(*SP(#0eh)), XAR1
            MOV dbl(*SP(#10h)), XAR6
            AMAR *AR0, XAR7 || MOV #-7, T0
            MOV #8, *SP(#00h)
            AMAR *(#word_e8fa), XAR2
            MOV #0, *SP(#01h)
            AMAR *AR7, XAR4 || MOV #0, AR3
            .vli_off
            CALL sub_02a24d
            .vli_on
            AMAR *AR5, XAR1
            AMAR *AR5, XAR0 || MOV T0, T2
            MOV dbl(*SP(#06h)), XAR2
            MOV *AR5(#03adh), T0
            AMAR *+AR1(#0311h)
            AMAR *AR7, XAR3
            AMAR *+AR0(#030ah)
            .vli_off
            CALL sub_021fe4
            .vli_on
            MOV *AR5(#03aeh), AR1
            MOV AR1, *AR5(#03afh)
            MOV *AR5(#03adh), AR1
            MOV AR1, *AR5(#03aeh)
            MOV dbl(*SP(#02h)), XAR2
            MOV dbl(*SP(#04h)), XAR1
            AMAR *AR5, XAR0 || MOV T0, T3
            AMAR *+AR0(#031bh)
            .vli_off
            CALL sub_0258fd
            .vli_on
            MOV #8192, AR1
            CMP AR1 >= T3, TC1
            MOV T0, *AR5(#03adh)
            BCC loc_023d88, TC1
            AMAR *AR5, XAR0
            AMAR *AR7, XAR1 || MOV T3, T0
            AMAR *+AR0(#031bh)
            .vli_off
            CALL sub_02577f
            .vli_on
loc_023d88: MOV *AR5(#03adh), AC0
            MOV #8, T0
            .vli_off
            CALL sub_02b624
            .vli_on
            MOV *AR5(#03afh), AC0
            MOV #8, T0 || MOV T0, T3
            .vli_off
            CALL sub_02b624
            .vli_on
            MOV *AR6(#0022h), AC0
            MOV #8192, AR2
            MOV *AR5(#0316h), AR1
            ADD T3, T0 || SFTS AC0, #-2, AC0
            CMP AR2 >= AR1, TC1 || AND #7, AC0, AC0
            XCCPART AC0 == #0 || MOV #0, T0
            BCC loc_023dc5, TC1
            MOV *AR5(#0318h), AR1
            CMP AR2 < AR1, TC1
            BCC loc_023e3d, TC1
loc_023dc5: MOV #4, AR1
            CMP T0 < AR1, TC1
            BCC loc_023e3d, TC1
            MOV *AR6(#0024h) << #16, AC0
            MOV #2816 << #16, AC1
            MOV *AR6(#0029h), AR0
            MOV *AR6(#0039h), AR1
            MPYK #21770, AC0, AC0
            SUB AC1, AC0
            MOV HI(AC0), T0 || MOV #7, T1
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_023ed9, T0 == #0
            MOV *AR6(#002bh), T0
            MOV *AR6(#003bh), T1
            MOV *AR6(#0029h), AR0
            MOV *AR6(#0039h), AR1
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_023ed9, T0 == #0
            AMAR *AR5, XAR3
            MOV #6554, AR2
            AMAR *+AR3(#031ch)
            MOV *AR3, AR1
            CMP AR1 >= AR2, TC1
            BCC loc_023ed9, TC1
            MOV *AR5(#031bh), T1
            BSET ST1_FRCT
            MPYM *AR3, T1, AC0
            MOV HI(AC0), AR1
            MOV AR1, AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #15, AC1
            SFTS AC1, #0, AC0 || BSET ST1_SATD
            SFTS AC0, #3, AC0
            MOV HI(AC0), *AR5(#031bh)
            B loc_023ed9
loc_023e3d: AMAR *AR6, XAR3
            AMAR *AR6, XAR2
            AMAR *AR6, XAR1
            AMAR *AR5, XAR0
            AADD #57, AR3
            AADD #41, AR2
            AMAR *+AR1(#0091h)
            AMAR *+AR0(#031bh)
            .vli_off
            CALL sub_024aa4
            .vli_on
            MOV *AR6(#0024h) << #16, AC0
            MOV #3328 << #16, AC1
            MPYK #21770, AC0, AC0
            MOV *AR6(#0029h), AR0
            SUB AC1, AC0
            MOV *AR6(#0039h), AR1
            MOV HI(AC0), T0 || MOV #7, T1
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_023ed9, T0 == #0
            MOV #7168, AR2
            MOV *AR6(#007dh), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_023ed9, TC1
            MOV *AR6(#002bh), T0
            MOV *AR6(#003bh), T1
            MOV *AR6(#0029h), AR0
            MOV *AR6(#0039h), AR1
            .vli_off
            CALL sub_024585
            .vli_on
            BCC loc_023ed9, T0 == #0
            BAND *AR5(#03adh), #127, TC1
            BCC loc_023ed9, TC1
            BAND *AR5(#03afh), #127, TC1
            BCC loc_023ed9, TC1
            MOV *AR6(#009dh), AR1
            MOV #5632, AR2
            SUB AR1, *AR6(#0024h), AR1
            CMP AR2 >= AR1, TC1
            BCC loc_023ed9, TC1
            MOV #7209, AR2
            MOV *AR5(#031bh), AR1
            CMP AR1 >= AR2, TC1
            XCCPART !TC1
            MOV #7209, *AR5(#031bh)
loc_023ed9: AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5 || MOV T2, T0
            POP T3, T2
            BCLR ST1_FRCT
            BCLR ST1_SATD
            RET
sub_023eeb: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-307, mmap(@SP)
            AMAR *AR4, XAR7
            AMAR *SP(#00h), XAR6
            AMAR *AR0, XAR4
            AMAR *AR3, XAR5
            MOV XAR1, dbl(*AR6(#0130h))
            MOV XAR2, dbl(*AR6(#012eh))
            AMAR *SP(#00h), XAR0
            MOV dbl(*AR6(#012eh)), XAR1
            AMAR *+AR0(#0106h)
            MOV XAR1, dbl(*SP(#00h))
            AMAR *AR0, XAR3
            AMAR *SP(#00h), XAR2
            MOV XAR5, dbl(*SP(#02h))
            AMAR *SP(#06h), XAR1
            MOV XAR7, dbl(*SP(#04h)) || MOV T0, T2
            AMAR *+AR2(#0126h)
            CALL sub_023ba2
            XCCPART T2 <= #0 || MOV #0, T0
            BCC loc_023f60, T2 <= #0
            MOV XAR5, dbl(*SP(#00h))
            AMAR *SP(#00h), XAR4
            AMAR *SP(#00h), XAR2
            MOV dbl(*AR6(#0130h)), XAR0
            MOV dbl(*AR6(#012eh)), XAR1
            AMAR *SP(#06h), XAR3
            MOV XAR7, dbl(*SP(#02h))
            AMAR *+AR4(#0126h)
            AMAR *+AR2(#0106h)
            CALL sub_023cef
loc_023f60: ADD #307, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_023f6f: PSH T2
            MOV T1, T2
            MOV #0, AC2 || MOV AR1, T1
            MOV #32, AR3 || SUB T2, AR1
            CMP T0 == AC2, TC2
            CMP AR1 >= AR3, TC1
            BCC loc_023fcb, TC1 | TC2 || NEG AR1, AR1
            CMP AR0 == AC2, TC2
            CMP AR1 >= AR3, TC1
            BCC loc_023f9b, !TC1 & !TC2 || CMP T1 < T2, TC1
            MOV T2, *AR2
            NEG T0, T0
            POP T2
            RET
loc_023f9b: ADD #1, T1, AR1
            XCCPART TC1 || ADD #1, T2, AR1
            SUB AR1, T2
            MOV T0, HI(AC0)
            SFTS AC0, T2, AC1 || SUB AR1, T1
            MOV AR0, HI(AC0)
            SFTS AC0, T1, AC0
            SUB AC1, AC0 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            ADD T1, AR1
            MOV #0, *AR2 || MOV HI(AC0), AR3
            XCC AR3 != #0 || MOV AR1, *AR2
            MOV HI(AC0), T0
            POP T2
            RET
loc_023fcb: XCC AR0 != #0 || MOV T1, *AR2
            XCCPART AR0 != #0 || MOV AR0, T0
            XCC AR0 == #0 || MOV #0, *AR2
            XCCPART AR0 == #0 || MOV #0, T0
            POP T2
            RET
sub_023fe0: PSH T2
            BSET ST1_FRCT
            MOV AR0, T2
            BSET ST3_SMUL || MOV T0, HI(AC0)
            MPY T2, AC0, AC0 || ADD T1, AR1
            XCCPART AC0 == #0 || MOV #0, T2
            BCLR ST3_SMUL
            BCLR ST1_FRCT
            MANT AC0, AC0 :: NEXP AC0, T2 || XCCPART AC0 != #0
            ADD T2, AR1
            MOV HI(AC0), AR3
            MOV HI(AC0), T0
            XCC AR3 == #0 || MOV #0, *AR2
            XCC AR3 != #0 || MOV AR1, *AR2
            POP T2
            RET
sub_02400e: AADD #-1, SP
            MOV T0, AC2
            MOV AC0, AC1
            XOR AC2, AC1
            ABS AC2, AC2
            ABS AC0, AC0
            MOV AC2, *SP(#00h) || CMP AC0 < AC2, TC1
            BCC loc_02402e, TC1
            RPT #15
               SUBC *SP(#00h), AC0, AC0
            XCCPART AC1 < #0 || NEG AC0, AC0
            AADD #1, SP
            RET
loc_02402e: MOV #0, AC0
            AADD #1, SP
            RET
sub_024034: SUB #15, T0, T1
            SFTS AC0, T1, AC0
            BCC loc_024051, AC0 >= #0
            MOV dbl(mmap(@AC0H)), AC0
            MOV #-1 << #16, AC0 || NEG AC0, AC1
            AND AC1, AC0
            MOV dbl(mmap(@AC0H)), AC0
            NEG AC0, AC0
            B loc_024057
loc_024051: MOV #-1 << #16, AC1
            AND AC1, AC0
loc_024057: RET
sub_024059: RETCC AC0 == #0 || MOV #0, T1
            AMAR *(#word_e6ee), XAR3
            BSET ST1_FRCT
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MPYMR *AR3+, AC0, AC1
            ADD *AR0, T1, AR1 || ADD *AR3+ << #16, AC1, AC1
            MOV *AR3+ << #16, AC1 || MOV HI(AC1), T1
            BTST @#00h, AR1, TC1
            MACR AC0, T1, AC1, AC0 || ADD #1, AR1
            XCCPART TC1 || MPYMR *AR3, AC0, AC0
            SFTS AR1, #-1
            BCLR ST1_FRCT
            MOV AR1, *AR0 || RET
sub_02408c: AADD #-1, SP
            AMAR *SP(#00h), XAR0
            MOV T0, *SP(#00h)
            CALL sub_024059 || MOV T1, AR4
            SUB AR4, *SP(#00h), T1
            SFTS AC0, T1, AC0
            MOV dbl(mmap(@AC0H)), AC0
            ROUND AC0, AC0
            MOV HI(AC0), T0
            AADD #1, SP
            RET
sub_0240a9: MOV #173, T1
            MPYM *AR0, T1, AC0
            ADD #13849, AC0, T0
            MOV T0, *AR0
            RET
sub_0240b8: SUB #15, T0, T1
            SFTS AC0, T1, AC1
            MOV HI(AC1), AR1
            MOV AR1, HI(AC2) || NEG T1, T1
            XCCPART AC2 < #0 || ADD #1 << #16, AC2, AC2
            SUB AC2 << T1, AC0
            SFTS AC0, T0, AC0
            RET
sub_0240d0: MOV T0, HI(AC0) || BSET ST3_SMUL
            MANT AC0, AC0 :: NEXP AC0, T0
            AMAR *(#word_e6e2), XAR3
            ADD T1, T0
            SUB *AR3+ << #16, AC0, AC0 || BSET ST1_FRCT
            MPYMR *AR3+, AC0, AC1 || MOV HI(AC0), T1
            ADD *AR3+ << #16, AC1, AC1
            MPYR T1, AC1, AC1
            ADD *AR3+ << #16, AC1, AC1
            MPYR T1, AC1, AC1
            SFTS AC1, #-1, AC1
            ADD *AR3+ << #16, AC1, AC1
            MPYR T1, AC1, AC1
            SFTS AC1, #2, AC1
            ADD *AR3+ << #16, AC1, AC1
            SFTS AC1, #-15, AC0 || BCLR ST3_SMUL
            MOV T0, AC1 || BCLR ST1_FRCT
            ADD AC1 << #16, AC0
            RET
sub_02410f: AADD #-1, SP
            CALL sub_0240d0
            MOV #15, T1
            SUB AR0, T1
            BSET ST1_SATD
            SFTS AC0, T1, AC0
            ROUND AC0, AC0
            BCLR ST1_SATD
            MOV HI(AC0), T0
            AADD #1, SP
            RET
sub_024126: SUB #15, T0, T1
            SFTS AC0, T1, AC1
            MOV #-1 << #16, AC0
            AND AC1, AC0
            RET
sub_024134: SUB #15, T0, T1
            BSET ST1_SATD
            SFTS AC0, T1, AC0
            MOV dbl(mmap(@AC0H)), AC1
            MOV #0, AC0
            OR #65535, AC0, AC0
            ADD AC0, AC1
            BCLR ST1_SATD
            MOV #-1 << #16, AC0
            AND AC1, AC0
            RET
sub_024152: AADD #-1, SP
            MOV T1, AC2
            SFTS AC0, #-16, AC1 || BSET ST1_SATD
            XOR AC2, AC1
            ABS AC2, AC2
            ABS AC0, AC0
            MOV AC2, *SP(#00h) || SFTS AC2, #16, AC2
            CMP AC0 < AC2, TC1
            XCCPART !TC1 || SFTS AC0, #-1, AC0
            XCCPART !TC1 || ADD #1, T0
            SFTS AC0, #-1, AC0 || BCLR ST1_SXMD
            RPT #15
               SUBC *SP(#00h), AC0, AC0
            BSET ST1_SXMD
            XCCPART AC1 < #0 || NEG AC0, AC0
            MOV AC0, *SP(#00h) || MOV #0, T1
            MOV *SP(#00h) << #16, AC0
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MOV T0, AC1
            SUB AR0, AC1
            ADD T1, AC1 || MOV HI(AC0), T0
            MOV AC1, *AR1 || BCLR ST1_SATD
            XCCPART T0 == #0 || MOV T0, *AR1
            AADD #1, SP
            RET
sub_0241a1: SUB T1, AR1 || MOV #0, AC2
            MOV AR1, T1 || MOV T0, HI(AC0)
            MOV #-32, AR1 || MOV AR0, HI(AC1)
            CMP AC2 >= T1, TC2
            CMP T1 >= AR1, TC1
            XCCPART !TC2 || NEG T1, T1
            XCCPART !TC1 || MOV #-32, T1
            XCCPART !TC2 || SFTS AC0, T1, AC0
            XCCPART TC2 || SFTS AC1, T1, AC1
            CMP AC1 >= AC0, TC1 || MOV #0, T0
            XCCPART !TC1 || MOV #1, T0
            RET
sub_0241d2: PSH T2
            MOV T1, T2
            MOV #0, AC0 || MOV AR1, T1
            MOV #32, AR3 || SUB T2, AR1
            CMP T0 == AC0, TC2
            CMP AR1 >= AR3, TC1
            BCC loc_02422c, TC1 | TC2 || NEG AR1, AR1
            CMP AR0 == AC0, TC2
            CMP AR1 >= AR3, TC1
            BCC loc_0241fc, !TC1 & !TC2 || CMP T1 < T2, TC1
            MOV T2, *AR2
            POP T2
            RET
loc_0241fc: ADD #1, T1, AR1
            XCCPART TC1 || ADD #1, T2, AR1
            SUB AR1, T2
            MOV T0, HI(AC0)
            SFTS AC0, T2, AC1 || SUB AR1, T1
            MOV AR0, HI(AC0)
            SFTS AC0, T1, AC0
            ADD AC1, AC0 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            ADD T1, AR1
            MOV #0, *AR2 || MOV HI(AC0), AR3
            XCC AR3 != #0 || MOV AR1, *AR2
            MOV HI(AC0), T0
            POP T2
            RET
loc_02422c: XCC AR0 != #0 || MOV T1, *AR2
            XCCPART AR0 != #0 || MOV AR0, T0
            XCC AR0 == #0 || MOV #0, *AR2
            XCCPART AR0 == #0 || MOV #0, T0
            POP T2
            RET
sub_024241: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AADD #-3, SP
            MOV T0, T2
            XCCPART T2 >= #0 || MOV #1, AR5
            MOV T1, *SP(#02h)
            AMAR *AR0, XAR7
            BCC loc_024260, T2 >= #0
            MOV T2, HI(AC0) || BSET ST1_SATD
            NEG AC0, AC0
            MOV HI(AC0), T2
            MOV #-1, AR5
loc_024260: MOV *SP(#02h), T1 || BCLR ST1_SATD
            MOV #19777, AR0
            MOV T2, T0 || MOV #2, AR1
            CALL sub_0241a1
            BCC loc_0242e2, T0 != #0
            MOV *SP(#02h), T1
            MOV #27146, AR0
            MOV T2, T0 || MOV #-1, AR1
            CALL sub_0241a1
            BCC loc_0242dc, T0 == #0
            MOV XSP, XAR2
            AMAR *+AR2(#0000h)
            MOV *SP(#02h), AR1 || MOV #1, T1
            MOV #16384, T0 || MOV T2, AR0
            CALL sub_0241d2
            AMAR *SP(#01h), XAR2
            MOV *SP(#02h), AR1 || MOV #1, T1
            MOV #16384, T0 || MOV T0, T3
            MOV T2, AR0
            CALL sub_023f6f
            MOV T0, HI(AC0)
            BCC loc_0242bc, AC0 < #0
            AMAR *SP(#02h), XAR1
            MOV *SP(#00h), AR0
            MOV *SP(#01h), T0 || MOV T3, T1
            CALL sub_024152
            B loc_0242d8 || MOV T0, T2
loc_0242bc: AMAR *SP(#02h), XAR1
            MOV *SP(#00h), AR0 || BSET ST1_SATD
            MOV *SP(#01h), T0 || MOV T3, T1
            BCLR ST1_SATD || NEG AC0, AC0
            CALL sub_024152
            MOV T0, T2
            MOV T2, HI(AC0) || BSET ST1_SATD
            NEG AC0, AC0
            MOV HI(AC0), T2
loc_0242d8: B loc_0242fe || MOV #-1, AR2
loc_0242dc: MOV #0, AR3
            B loc_024302 || MOV #-1, AR2
loc_0242e2: AMAR *SP(#02h), XAR1
            MOV *SP(#02h), AR0 || MOV #1, T0
            MOV #16384 << #16, AC0 || MOV T2, T1
            CALL sub_024152
            MOV T0, T2
            MOV T2, HI(AC0) || BSET ST1_SATD
            NEG AC0, AC0
            MOV HI(AC0), T2
            MOV #0, AR2
loc_0242fe: MOV #25736, AR3
loc_024302: BCLR ST1_SATD
            BSET ST1_FRCT || MOV T2, HI(AC0)
            MOV *SP(#02h), AR1 || MPY T2, AC0, AC0
            SFTL AR1, #1 || MOV #0, T3
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            ADD T3, AR1
            MOV #-18725, AC1 || MOV HI(AC0), T0
            SUB #1, AR1, T3 || MOV T0, HI(AC0)
            MPYK #29127, AC0, AC0
            SFTS AC0, T3, AC0
            ADD AC1 << #16, AC0 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MPY T0, AC0, AC0 || MOV AR1, T3
            MOV #26214, AC1 || ADD T1, T3
            SFTS AC0, T3, AC0
            ADD AC1 << #16, AC0 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MOV #-21845, AC1 || MOV AR1, T3
            ADD T1, T3
            SUB #1, T3 || MPY T0, AC0, AC0
            SFTS AC0, T3, AC0
            ADD AC1 << #16, AC0 || MOV #0, T3
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            MPY T0, AC0, AC0 || MOV #0, T0
            MOV AR1, T1
            MANT AC0, AC0 :: NEXP AC0, T0 || XCCPART AC0 != #0
            ADD T3, T1
            ADD T0, T1
            SUB #1, T1
            MPY T2, AC0, AC0
            SFTS AC0, T1, AC1
            MOV *SP(#02h), T1 || MOV T2, AC0
            SUB #1, T1
            ADD AC0 << #16, AC1
            MOV AR2, T1 || SFTS AC1, T1, AC0
            MOV AR3, HI(AC1)
            ADD AC1 << T1, AC0 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MOV #1, AR1 || MOV HI(AC0), AR2
            ADD T1, AR1
            MOV HI(AC0), T0
            BCC loc_0243a6, AR2 == #0
            BCC loc_0243a8, AR5 >= #0
            MOV HI(AC0), T0
            MOV T0, HI(AC0) || BSET ST1_SATD
            NEG AC0, AC0
            B loc_0243a8 || MOV HI(AC0), T0
loc_0243a6: MOV #0, AR1
loc_0243a8: BCLR ST1_FRCT
            MOV AR1, *AR7 || BCLR ST1_SATD
            AADD #3, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0243b8: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AADD #-1, SP
            AMAR *AR2, XAR5
            XCCPART AR0 >= #0 || MOV #0, AR2
            XCCPART AR0 < #0 || MOV #2, AR2
            XCCPART T0 < #0 || BSET @#00h, AR2
            BCC loc_0243f3, AR0 != #0
            BTST @#00h, AR2, TC1
            BCC loc_0243e9, TC1
            BCC loc_0243e3, T0 != #0
            MOV #0, *SP(#00h)
            B loc_02447a || MOV #0, T0
loc_0243e3: MOV #25736, T0
            B loc_0243ed
loc_0243e9: MOV #-25736, T0
loc_0243ed: MOV #1, *SP(#00h)
            B loc_02447a
loc_0243f3: BCC loc_024410, T0 != #0
            BTST @#01h, AR2, TC1
            XCCPART !TC1 || MOV #0, T0
            XCC !TC1 || MOV #0, *SP(#00h)
            XCCPART TC1 || MOV #25736, T0
            XCC TC1 || MOV #2, *SP(#00h)
            B loc_02447a
loc_024410: MOV #2, AR2 || MOV AR2, AR3
            CMP AR3 == AR2, TC1
            BCC loc_024433, TC1
            MOV #3, AR2
            CMP AR3 == AR2, TC1
            XCCPART !TC1 || MOV #0, T3
            XCCPART !TC1 || MOV #0, AR6
            XCCPART TC1 || MOV #2, T3
            XCCPART TC1 || MOV #-25736, AR6
            B loc_024439
loc_024433: MOV #2, T3
            MOV #25736, AR6
loc_024439: MOV AR0, HI(AC0)
            MANT AC0, AC0 :: NEXP AC0, T2
            MOV T0, HI(AC0) || MOV HI(AC0), AR0
            ADD T2, AR1
            MANT AC0, AC0 :: NEXP AC0, T2
            ADD T2, T1
            MOV T1, T0
            MOV AR0, T1
            MOV AR1, AR0
            AMAR *SP(#00h), XAR1
            CALL sub_024152
            AMAR *SP(#00h), XAR0
            MOV *SP(#00h), T1
            CALL sub_024241
            SUB T3, *SP(#00h), T1
            SUB #1, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC1
            MOV AR6, HI(AC0)
            SFTS AC0, #-1, AC0
            ADD AC1, AC0
            MANT AC0, AC0 :: NEXP AC0, T1
            MOV T3, AR1
            ADD T1, AR1
            ADD #1, AR1
            MOV AR1, *SP(#00h)
            MOV HI(AC0), T0
loc_02447a: MOV *SP(#00h), AR1
            MOV AR1, *AR5
            AADD #1, SP
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_024488: MOV HI(AC0), AR1
            MOV AR1, AC2
            SFTS AC2, #16, AC2
            SUB AC2, AC0
            AMAR *(#word_e6e8), XAR3
            SFTS AC0, #-1, AC0 || BSET ST1_FRCT
            MOV AC0, T1
            MPYMR *AR3+, T1, AC1
            SFTS AC1, #-3, AC1
            ADD *AR3+ << #16, AC1, AC1
            MPYR T1, AC1, AC1
            SFTS AC1, #-3, AC1
            MOV *AR3+ << #16, AC2
            SFTS AC2, #-1, AC2
            ADD AC2, AC1
            MPYR T1, AC1, AC1
            SFTS AC1, #-2, AC1
            MOV *AR3+ << #16, AC2
            SFTS AC2, #-1, AC2
            ADD AC2, AC1
            MPYR T1, AC1, AC1
            SFTS AC1, #-1, AC1
            ADD *AR3+ << #16, AC1, AC1
            MPYR T1, AC1, AC1
            SFTS AC1, #-1, AC1
            ADD *AR3+ << #16, AC1, AC0
            ADD #1, AR1
            MOV AR1, *AR0 || BCLR ST1_FRCT
            RET
sub_0244d7: AADD #-1, SP
            MOV AR0, AR4
            SUB #15, T1
            AMAR *SP(#00h), XAR0
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            ADD #0, AR0
            CALL sub_024488
            SUB AR4, *SP(#00h), T1
            SFTS AC0, T1, AC0
            MOV dbl(mmap(@AC0H)), AC0
            ROUND AC0, AC0
            MOV HI(AC0), T0
            AADD #1, SP
            RET
sub_0244fa: AADD #-1, SP
            MOV T0, AC2
            MOV AC0, AC1
            XOR AC2, AC1
            ABS AC2, AC2
            ABS AC0, AC0
            MOV AC2, *SP(#00h) || CMP AC0 < AC2, TC1
            BCC loc_024526, TC1
            MOV HI(AC0), T0
            CMP T0 >= AC2, TC1
            BCC loc_02452c, TC1
            SFTS AC0, #-1, AC0
            RPT #15
               SUBC *SP(#00h), AC0, AC0
            XCCPART AC1 < #0 || NEG AC0, AC0
            AADD #1, SP
            RET
loc_024526: MOV #0, AC0
            AADD #1, SP
            RET
loc_02452c: MOV #32767, AC0
            XCCPART AC1 < #0 || NEG AC0, AC0
            AADD #1, SP
            RET
sub_024538: AADD #-1, SP
            MOV T0, AC2
            MOV AC0, AC1
            XOR AC2, AC1
            ABS AC2, AC2
            ABS AC0, AC0
            MOV AC2, *SP(#00h) || CMP AC0 < AC2, TC1
            SFTS AC0, #-1, AC0
            RPTCC #15, !TC1
               SUBC *SP(#00h), AC0, AC0
            XCCPART TC1 || MOV #0, AC0
            XCCPART AC1 < #0 || NEG AC0, AC0
            AADD #1, SP
            RET
sub_02455e: MOV T0, HI(AC0)
            SFTS AC0, #-6, AC0
            ABS AC0, AC0
            MOV HI(AC0), T0
            AMAR *(#word_e6fa), XAR3
            ADD #1, T0, AR1
            MOV *AR3(T0), T1 || SFTL AC0, #16, AC1
            AND #511, AR1, T0 || MOV T1, HI(AC0)
            MACM *AR3(T0), AC1, AC0
            MAS T1, AC1, AC0
            MOV HI(AC0), T0
            RET
sub_024585: SUB T1, AR1 || MOV #0, AC2
            MOV AR1, T1 || MOV T0, HI(AC0)
            MOV #-32, AR1 || MOV AR0, HI(AC1)
            CMP AC2 >= T1, TC2
            CMP T1 >= AR1, TC1
            XCCPART !TC2 || NEG T1, T1
            XCCPART !TC1 || MOV #-32, T1
            XCCPART !TC2 || SFTS AC0, T1, AC0
            XCCPART TC2 || SFTS AC1, T1, AC1
            CMP AC0 >= AC1, TC1 || MOV #0, T0
            XCCPART !TC1 || MOV #1, T0
            RET
            NOP
            NOP
sub_0245b8: AADD #-67, SP
            MOV T0, *SP(#00h) || MOV #31, BRC0
            BSET ST1_SATD
            AMAR *SP(#02h), XAR3 || RPTBLOCAL loc_0245fb
               MOV *AR1+, AC3 || MOV #0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               MOV *AR1+, AC3 || ADD AC0, AC1
               ABS AC3, AC0
               ADD AC0, AC1
               SFTS AC1, #13, AC1
loc_0245fb:    MOV AC1, dbl(*AR3+)
            BCLR ST1_SATD
            AMAR *SP(#02h), XAR1
            AMAR *SP(#00h), XAR2
            MOV #32, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV *SP(#00h), AR1
            SUB #3, AR1, T0
            AADD #67, SP
            RET
sub_024618: AADD #-1, SP
            BCC loc_024639, AR3 <= #0
            MOV T1, *SP(#00h) || SUB #1, AR3
            MOV AR3, BRC0
            AMAR *SP(#00h), XAR4
            AMAR *AR1+
            RPTBLOCAL loc_024634 || BSET ST1_FRCT
               MPYM *AR4, uns(*AR1-), AC0
               MACM *AR4, *AR1+, AC0 >> #16, AC0
loc_024634:    MOV AC0, dbl(*AR0+) || ADD #2, AR1
loc_024639: BCLR ST1_FRCT
            ADD AR2, T0
            AADD #1, SP
            RET
sub_024641: PSH T2
            MOV T1, T2
            MOV T0, T1
            MOV T2, AR4
            MAX T1, AR4
            MOV AR4, T0
            BCC loc_02466e, AR3 <= #0
            SUB #1, AR3
            MOV AR3, BRC0
            SUB T0, T1
            SUB T0, T2
            MOV dbl(*AR2+), AC0
            RPTBLOCAL loc_024668 || BSET ST1_SATD
               MOV dbl(*AR1+), AC1 || SFTS AC0, T2, AC0
               SFTS AC1, T1, AC1
               ADD AC1, AC0
loc_024668:    MOV dbl(*AR2+), AC0 || MOV AC0, dbl(*AR0+)
loc_02466e: BCLR ST1_SATD
            POP T2
            RET
sub_024674: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-10, SP
            MOV T0, T3
            MOV XAR0, dbl(*SP(#04h))
            MOV dbl(*SP(#10h)), XAR6
            MOV #57, T0
            AMAR *AR2, XAR5 || MOV T1, T2
            MOV XAR4, dbl(*SP(#08h)) || AADD T3, AR1
            MOV XAR3, dbl(*SP(#06h)) || ASUB #9, AR1
            AMAR *AR6, XAR3 || SUB T3, T0
            BCC loc_0246a9, T0 < #0
            MOV T0, CSR
            RPT CSR
               MOV *AR1+, *AR3+
loc_0246a9: BCC loc_0246b9, T3 <= #0
            SUB #1, T3, AR2
            MOV AR2, CSR
            AMAR *AR5, XAR1 || RPT CSR
               MOV *AR1+, *AR3+
loc_0246b9: MOV dbl(*SP(#06h)), XAR5
            MOV dbl(*SP(#08h)), XAR7
            MOV #5, BRC0
            RPTBLOCAL loc_0246e7
               MOV *AR5+, AR2
               SUB T2, *AR7+, T1 || AMAR *AR6, XAR0
               SUB AR2, *AR5, T0 || AADD AR2, AR0
               BCC loc_0246e7, T0 <= #0
               SUB #1, T0, AR2
               AMAR *AR0, XAR1 || MOV AR2, CSR
               MOV *AR1+ << #16, AC1 || RPT CSR
                  MOV *AR1+ << #16, AC1 || MOV HI(AC1 << T1), *AR0+
loc_0246e7:    NOP
            MOV *AR5, AR2
            AMAR *AR6, XAR0
            MOV #58, T0
            AADD AR2, AR0
            AMAR *AR0, XAR1 || SUB AR2, T0
            MOV *AR7, T1 || MOV T2, AR2
            .vli_off
            CALL sub_028311
            .vli_on
            MOV XAR6, dbl(*SP(#00h))
            MOV #29, AR4
            MOV #58, AR3
            MOV #6, *SP(#02h) || MOV T2, T0
            AMAR *(#word_eb90), XAR2
            AMAR *AR6, XAR1 || MOV #0, T1
            MOV dbl(*SP(#04h)), XAR0
            MOV #0, *SP(#03h)
            .vli_off
            CALL sub_02a1f8
            .vli_on
            AADD #10, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP_16
sub_024734: PSHBOTH XAR5
            MOV #-7680, AR1
            AMAR *AR0, XAR5
            MOV *AR5(#0028h), AR2
            CMP AR1 < AR2, TC1
            BCC loc_02476e, TC1
            MOV *AR5(#0029h), T0
            MOV *AR5(#0039h), T1
            MOV #5, AR1
            MOV #-20480, AR0
            .vli_off
            CALL sub_0241a1
            .vli_on
            BCC loc_02476e, T0 != #0
            MOV *AR5(#0028h), AC0
            MOV #3840, AC1
            SUB AC0, *AR5(#0024h), AC0
            CMP AC0 >= AC1, TC1
            BCC loc_024772, TC1
loc_02476e: MOV #1, T0
            B loc_024774
loc_024772: MOV #0, T0
loc_024774: POPBOTH XAR5
            RET
sub_024778: PSH T3, T2
            PSHBOTH XAR5
            AADD #-2, SP
            MOV *AR1(#009ah), AC0
            ADD *AR1(#009bh), AC0, AC0
            SFTS AC0, #15, AC1
            AMAR *AR0, XAR5 || OR #0, AC1, AC0
            BCC loc_0247a3, T0 <= #0
            MOV *AR1(#0089h) << #16, AC0
            SFTS AC1, #-1, AC1
            ADD *AR1(#0091h) << #16, AC0, AC0
            SUB AC1, AC0
            SFTS AC0, #1
loc_0247a3: MOV #4608 << #16, AC1
            SUB AC1, AC0
            BCC loc_0247f0, AC0 >= #0
            MOV #-21824 << #16, AC1
            SFTS AC0, #16, AC0 || MOV HI(AC0), T1
            SFTL AC1, #0, AC1
            SFTL AC0, #0, AC0
            MPYK #683, AC0, AC0
            SFTS AC0, #-10, AC0
            MAC AC1, T1, AC0, AC0
            AMAR *SP(#00h), XAR0 || SFTS AC0, #-9, AC0
            .vli_off
            CALL sub_024488
            .vli_on
            MANT AC0, AC0 :: NEXP AC0, T1
            ADD *SP(#00h), T1, T2
            MOV HI(AC0), T0
            MOV T2, T1 || MOV #-6, AR1
            MOV #20971, AR0 || MOV HI(AC0), T3
            .vli_off
            CALL sub_024585
            .vli_on
            XCCPART T0 != #0 || MOV #-6, T2
            XCCPART T0 != #0 || MOV #20971, T3
            B loc_0247f6
loc_0247f0: MOV #1, T2
            MOV #16384, T3
loc_0247f6: MOV T3, *AR5
            MOV T2, T0
            AADD #2, SP
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP_16
sub_024804: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-150, mmap(@SP)
            MOV XSP, XAR6
            AMAR *AR2, XAR7
            MOV XAR3, dbl(*AR6(#0082h))
            AMAR *AR1, XAR5
            MOV dbl(*AR6(#00a0h)), XAR2
            MOV XAR4, dbl(*AR6(#0084h))
            AMAR *SP(#02h), XAR3
            MOV XAR2, dbl(*AR6(#0086h))
            MOV XAR0, dbl(*AR6(#0088h))
            MOV T0, *AR6(#0090h)
            MOV #-30, *AR6(#0092h)
            RPT #31 || MOV #0, AC0
               MOV AC0, dbl(*AR3+)
            MOV dbl(*AR6(#009ch)), XAR0
            MOV #7, T0
            .vli_off
            CALL sub_028272
            .vli_on
            MOV dbl(*AR6(#009ch)), XAR3
            MOV T0, AR1
            MOV dbl(*AR6(#0086h)), XAR0
            MOV AR1, *AR6(#0091h)
            CALL sub_024734
            MOV XAR7, dbl(*AR6(#008ch))
            MOV XAR5, dbl(*AR6(#008ah))
            MOV T0, *AR6(#0093h)
            MOV #0, T2
loc_024873: AMAR *SP(#42h), XAR3
            MOV dbl(*AR6(#008ah)), XAR5
            MOV dbl(*AR6(#0082h)), XAR1
            MOV dbl(*AR6(#0084h)), XAR2
            MOV *AR6(#0090h), T0
            MOV dbl(*AR6(#009ch)), XAR4
            MOV *AR6(#0091h), T1
            MOV XAR3, dbl(*SP(#00h))
            MOV XAR5, dbl(*AR6(#008eh))
            AMAR *AR5, XAR0
            MOV dbl(*AR6(#009eh)), XAR3
            CALL sub_024674
            AMAR *SP(#42h), XAR7
            MOV T0, T3
            BCC loc_0248da, T2 != #0
            MOV *AR6(#0093h), AR1
            BCC loc_0248da, AR1 == #0
            MOV dbl(*AR6(#0086h)), XAR1
            MOV #0, T0
            AMAR *AR6(#0094h), XAR0
            CALL sub_024778
            MOV #32, AR3
            MOV *AR6(#0094h), T1
            AMAR *AR5, XAR0 || MOV T0, AR2
            AMAR *AR5, XAR1 || MOV T3, T0
            CALL sub_024618
            MOV T0, T3
loc_0248da: AMAR *SP(#42h), XAR3
            MOV XAR3, dbl(*SP(#00h))
            ADD #49, *AR6(#0083h)
            ADD #11, *AR6(#0085h)
            MOV *AR6(#0090h), T0
            MOV dbl(*AR6(#009ch)), XAR4
            MOV *AR6(#0091h), T1
            AMAR *AR7, XAR0
            MOV dbl(*AR6(#0082h)), XAR1
            MOV dbl(*AR6(#0084h)), XAR2
            MOV dbl(*AR6(#009eh)), XAR3
            CALL sub_024674
            MOV T0, *AR6(#0095h)
            BCC loc_024946, T2 != #0
            MOV *AR6(#0093h), AR1
            BCC loc_024946, AR1 == #0
            MOV dbl(*AR6(#0086h)), XAR1
            MOV #1, T0
            AMAR *AR6(#0094h), XAR0
            CALL sub_024778
            MOV #32, AR3
            MOV *AR6(#0094h), T1
            AMAR *AR7, XAR1
            AMAR *AR7, XAR0 || MOV T0, AR2
            MOV *AR6(#0095h), T0
            CALL sub_024618
            MOV T0, *AR6(#0095h)
loc_024946: MOV #0, AC0
            MOV dbl(*AR6(#008eh)), XAR0
            ADD #49, *AR6(#0083h)
            MOV AC0, dbl(*AR5(short(#2)))
            MOV AC0, dbl(*AR7(short(#2)))
            MOV *AR6(#0095h), T1
            AMAR *AR7, XAR2
            AMAR *AR5, XAR1 || MOV AC0, dbl(*AR5)
            MOV AC0, dbl(*AR7)
            ADD #11, *AR6(#0085h)
            MOV #32, AR3 || MOV T3, T0
            CALL sub_024641
            AMAR *SP(#02h), XAR1
            AMAR *SP(#02h), XAR0
            MOV dbl(*AR6(#008ch)), XAR3
            MOV dbl(*AR6(#008eh)), XAR2
            MOV T0, T1
            MOV *AR6(#0092h), T0
            MOV T1, *AR3
            MOV #32, AR3
            CALL sub_024641
            MOV T0, *AR6(#0092h)
            AMAR *AR5, XAR0
            MOV dbl(*AR6(#008eh)), XAR1
            MOV dbl(*AR6(#008ch)), XAR2
            MOV #32, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            ADD #32, *AR6(#008bh)
            ADD #1, T2
            MOV #8, AR1
            CMP T2 < AR1, TC1
            ADD #1, *AR6(#008dh)
            BCC loc_024873, TC1
            AMAR *AR6(#0092h), XAR2
            AMAR *SP(#02h), XAR1
            MOV dbl(*AR6(#0088h)), XAR0
            MOV #32, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            ADD #150, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP
sub_0249ec: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            MOV #0, AC0
            AMAR *AR0, XAR5 || MOV T1, AR0
            AMAR *AR2, XAR7 || BSET ST1_M40
            MOV T0, AR6 || RPT #127
               ADD dbl(*AR1+), AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T0
            ADD T0, AR0
            MOV HI(AC0), T1
            BCC loc_024a16, T1 != #0
            MOV #-13, AR0
            MOV #26843, T1
loc_024a16: MOV #0, AC0 || RPT #127
               ADD dbl(*AR5+), AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T0
            MOV T0, AR5
            MOV AR6, T0
            ADD AR5, T0
            AMAR *AR7, XAR1 || BCLR ST1_M40
            .vli_off
            CALL sub_024152
            .vli_on
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP_16 || NOP
sub_024a3c: PSH T2
            PSHBOTH XAR5
            AADD #-1, SP
            MOV T1, HI(AC0)
            SUB #5, AR1, T1
            SFTS AC0, T1, AC0
            MOV HI(AC0), AR1
            AMAR *AR0, XAR5 || CMP AR3 >= AR1, TC1
            MOV *SP(#04h), AR4 || MOV AR4, T2
            BCC loc_024a99, TC1
            MOV AR2, AC0
            SUB T0, AC0
            SUB AR4, AC0
            SFTS AC0, #16, AC0
            BCC loc_024a99, AC0 <= #0
            MOV #512, AR1 || MOV HI(AC0), AR2
            CMP AR1 >= AR2, TC1
            XCCPART !TC1 || MOV #512, AR2
            MOV AR2, HI(AC0) || BSET ST1_FRCT
            MPY T2, AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T2
            BCLR ST1_FRCT
            ADD #8, T2, T1
            MOV HI(AC0), T0 || MOV #3, AR0
            .vli_off
            CALL sub_0244d7
            .vli_on
            BSET ST1_FRCT
            MPYM *AR5, T0, AC0 || BSET ST1_SATD
            SFTS AC0, #3, AC0
            MOV HI(AC0), *AR5 || BCLR ST1_SATD
loc_024a99: BCLR ST1_FRCT
            AADD #1, SP
            POPBOTH XAR5
            POP T2
            RET
            NOP
sub_024aa4: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-5, SP
            MOV #17080, AR4
            AMAR *AR3, XAR5
            AMAR *AR2, XAR6
            MOV #-18432, AR3
            MOV #1152, AR2
            AMAR *AR1, XAR7 || MOV T0, HI(AC0)
            MOV XAR0, dbl(*SP(#02h)) || SFTS AC0, #8, AC0
            MOV *AR6, T1 || MOV HI(AC0), T2
            MOV T2, *SP(#00h)
            MOV *AR7, T0 || MOV *AR5, AR1
            MOV dbl(*SP(#02h)), XAR0
            CALL sub_024a3c
            MOV dbl(*SP(#02h)), XAR0
            AMAR *AR0+
            MOV #12984, AR4
            MOV #-20480, AR3
            MOV #1024, AR2
            MOV *AR5(short(#2)), AR1
            MOV *AR6(short(#2)), T1
            MOV *AR7(short(#1)), T0
            CALL sub_024a3c
            MOV #8888, AR4
            MOV dbl(*SP(#02h)), XAR0
            MOV #-21504, AR3
            MOV #896, AR2
            MOV *AR5(short(#4)), AR1
            MOV *AR6(short(#4)), T1
            MOV *AR7(short(#2)), T0 || AADD #2, AR0
            CALL sub_024a3c
            AADD #5, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_024b1c: AADD #-3, SP
            MOV #13108, AR2
            MOV *AR0, AR4
            CMP AR4 < AR2, TC1
            BCC loc_024b3d, TC1
            MOV *AR0(short(#2)), T1
            MOV #13107, AR2
            AMAR *AR0, XAR3 || CMP T1 < AR2, TC1
            AADD #2, AR3
            BCC loc_024be8, TC1
loc_024b3d: MOV #6554, T1
            AMAR *AR0, XAR3 || CMP AR4 < T1, TC1
            MOV *AR0(short(#2)), AR2 || AADD #2, AR3
            BCC loc_024b59, TC1
            MOV AR4, T1
            SFTS T1, #-1
            CMP AR2 < T1, TC1
            BCC loc_024be8, TC1
loc_024b59: MOV #13108, T1
            CMP AR2 < T1, TC1
            BCC loc_024b6c, TC1
            MOV #13107, T1
            CMP AR4 < T1, TC1
            BCC loc_024be0, TC1
loc_024b6c: MOV #6554, T1
            CMP AR2 < T1, TC1
            BCC loc_024b7d, TC1
            SFTS AR2, #-1
            CMP AR4 < AR2, TC1
            BCC loc_024be0, TC1
loc_024b7d: MOV *AR0 << #15, AC1
            MOV *AR3 << #15, AC0
            ADD AC1, AC0
            MOV HI(AC0), *AR0(short(#1))
            MOV *AR1(short(#2)) << #16, AC3
            MOV *AR1, AR2
            SFTS AC3, #-1, AC2
            MOV AC2, dbl(*SP(#00h)) || MOV AR2, HI(AC1)
            MOV dbl(*SP(#00h)), AC2 || SFTS AC1, #-1, AC0
            MOV #3276, AR4 || ADD AC0, AC2
            MOV HI(AC2), *AR1(short(#1))
            MOV *AR0, AR3
            CMP AR3 >= AR4, TC1
            BCC loc_024bf0, TC1
            SUB dbl(*SP(#00h)), AC1, AC1
            MOV #13106, T1 || MOV AR2, HI(AC2)
            ABS AC1, AC1
            MAS T1, AC2, AC1
            BCC loc_024bd4, AC1 < #0
            OR #0, AC3, AC1
            MOV AR2, HI(AC2)
            MOV #6552, T1 || SUB AC0, AC1
            ABS AC1, AC1
            MAS T1, AC2, AC1
            XCCPART AC1 < #0 || ADD AC3, AC0
            XCCPART AC1 < #0 || MOV HI(AC0), *AR1(short(#1))
            B loc_024bf0
loc_024bd4: MOV dbl(*SP(#00h)), AC1
            SFTS AC1, #-1, AC1
            ADD AC0, AC1
            MOV HI(AC1), *AR1(short(#1))
            B loc_024bf0
loc_024be0: MOV *AR1, AR2
            MOV AR2, *AR1(short(#1))
            MOV *AR0, AR1
            B loc_024bee
loc_024be8: MOV *AR1(short(#2)), AR2
            MOV AR2, *AR1(short(#1))
            MOV *AR3, AR1
loc_024bee: MOV AR1, *AR0(short(#1))
loc_024bf0: AADD #3, SP
            RET
sub_024bf4: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-260, mmap(@SP)
            AMAR *AR0, XAR5
            AMAR *SP(#00h), XAR6
            AMAR *AR1, XAR7 || MOV T0, T3
            MOV T1, *AR6(#0102h)
            AMAR *SP(#00h), XAR0 || MOV #0, T0
            MOV #258, T1 || MOV AR2, T2
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #383, AR1
            SUB T3, AR1
            MOV AR1, *AR6(#0103h)
            AMAR *AR5, XAR1
            AMAR *AR5, XAR0
            AADD T3, AR1
            MOV *AR6(#0103h), T0
            AMAR *+AR0(#0a63h)
            AMAR *+AR1(#0a63h)
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV *AR6(#0103h), AR2
            AMAR *AR5, XAR1
            AADD AR2, AR1
            AMAR *AR5, XAR0
            AMAR *+AR1(#0a63h)
            AMAR *AR7, XAR2 || MOV T3, T0
            .vli_off
            CALL sub_02a36f
            .vli_on
            AMAR *AR5, XAR7
            AADD #12, AR7
            AMAR *AR5, XAR0
            AMAR *AR5, XAR4
            AMAR *SP(#00h), XAR1
            AMAR *AR5, XAR3 || MOV T2, T0
            AMAR *AR7, XAR2 || MOV T3, T1
            AMAR *+AR0(#04a2h)
            AMAR *+AR4(#03bch)
            AMAR *+AR3(#0a63h)
            .vli_off
            CALL sub_023eeb
            .vli_on
            AMAR *AR5, XAR2
            AMAR *AR5, XAR1 || MOV T0, T3
            AMAR *AR7, XAR0 || MOV T2, T0
            AMAR *+AR2(#0991h)
            AMAR *+AR1(#0a63h)
            .vli_off
            CALL sub_023a2b
            .vli_on
            AMAR *AR5, XAR1
            AMAR *AR5, XAR0
            MOV *AR5(#0312h), T0
            MOV *AR6(#0102h), T1
            AADD #12, AR1 || MOV T2, AR2
            AMAR *+AR0(#0a56h)
            .vli_off
            CALL sub_02ad9c
            .vli_on
            MOV #1, AR1
            AMAR *AR5, XAR7 || CMP T2 != AR1, TC1
            AADD #12, AR7
            BCC loc_024cd9, TC1
            AMAR *SP(#00h), XAR1
            AMAR *AR7, XAR0
            MOV #258, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV T3, *AR5(#0312h)
loc_024cd9: ADD #260, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_024ce8: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            MOV #84, AR2 || MOV AR2, T2
            AMAR *AR3, XAR5 || CMP AR2 < T0, TC1
            AADD #-1, SP
            AMAR *AR0, XAR7 || MOV T1, T3
            BCC loc_024d0e, TC1
            MOV #76, AR2
            MOV mmap(@T0), AC0
            B loc_024d12 || MAX AR2, AC0
loc_024d0e: MOV #84, AC0
loc_024d12: MOV AC0, T0
            MOV T3, AR2
            AMAR *AR5, XAR0 || MOV T2, T1
            CALL sub_024bf4
            BTST @#00h, T3, TC1
            XCCPART !TC1 || MOV #0, T2
            BCC loc_024d35, !TC1
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1 || MOV T2, T0
            .vli_off
            CALL sub_0298b1
            .vli_on
            MOV T0, T2
loc_024d35: AADD #1, SP
            MOV T2, T0
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_024d41: PSH T3, T2
            PSHBOTH XAR5
            MOV T1, T3
            AMAR *AR0, XAR5 || MOV T0, T2
            .vli_off
            CALL sub_02a937
            .vli_on
            MOV #4, AR1
            CMP T0 != AR1, TC1
            XCCPART !TC1 || MOV #32, T2
            AMAR *AR5, XAR0 || MOV T3, T1
            MOV T2, *AR5(#0a58h)
            AMAR *+AR0(#0a57h)
            MOV T2, T0
            .vli_off
            CALL sub_02a9b6
            .vli_on
            POPBOTH XAR5
            POP T3, T2
            MOV #16384, T0
            RET
sub_024d78: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-13, SP
            MOV XAR0, dbl(*SP(#00h))
            MOV dbl(*SP(#00h)), XAR3
            AADD #12, AR3
            AMAR *AR3, XAR1
            AMAR *+AR3(#0370h)
            MOV XAR3, dbl(*SP(#02h))
            MOV dbl(*SP(#00h)), XAR3
            AMAR *+AR3(#0a56h)
            MOV XAR3, dbl(*SP(#06h))
            MOV dbl(*SP(#00h)), XAR3
            MOV #3042, T1
            MOV dbl(*SP(#00h)), XAR5
            MOV XAR1, dbl(*SP(#04h))
            AMAR *+AR3(#0991h)
            AMAR *AR1, XAR7
            MOV XAR3, dbl(*SP(#08h)) || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#00h)), XAR3
            MOV #0, AC0
            MOV dbl(*SP(#00h)), XAR0
            MOV AC0, dbl(*AR3)
            MOV AC0, dbl(*AR3(short(#6)))
            MOV AC0, dbl(*AR3(short(#4)))
            MOV AC0, dbl(*AR3(#000ah))
            MOV AC0, dbl(*AR3(#0008h))
            MOV #383, T1
            MOV AC0, dbl(*AR3(short(#2))) || MOV #0, T0
            AMAR *+AR0(#0a63h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#00h)), XAR6
            MOV dbl(*SP(#00h)), XAR3
            AMAR *+AR6(#04a2h)
            MOV #0, *AR3(#0990h)
            MOV #784, T1
            AMAR *AR6, XAR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #7, T1
            AMAR *AR6, XAR0 || MOV #-15, T0
            AMAR *+AR0(#0310h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #7, T1
            AMAR *AR6, XAR0 || MOV #0, T0
            AMAR *+AR0(#0317h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #80, T1
            AMAR *AR6, XAR0 || MOV #0, T0
            AMAR *+AR0(#031eh)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#04h)), XAR3
            AMAR *+AR7(#031bh)
            AMAR *+AR5(#03bch)
            MOV #0, *AR3(#030ah)
            MOV #0, *AR3(#030bh)
            MOV #21854, *AR3(#030ch)
            MOV #10486, *AR3(#030eh)
            MOV #10486, *AR3(#030dh)
            MOV #0, *AR3(#030fh)
            MOV #0, *AR3(#0310h)
            MOV #4, BRC0
            AMAR *+AR3(#0311h)
            RPTBLOCAL loc_024e75
               MOV #8192, *AR3
               MOV #32767, *AR3(short(#5))
loc_024e75:    AMAR *AR3+
            AMAR *AR7, XAR3
            AMAR *AR7, XAR6
            AADD #80, AR3 || MOV #5, T2
            MOV XAR3, dbl(*SP(#0ah)) || AADD #40, AR6
loc_024e88: MOV #8, T1
            AMAR *AR6, XAR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#0ah)), XAR3
            MOV #30, *AR3+
            MOV #32767, T0
            MOV XAR3, dbl(*SP(#0ah))
            AMAR *AR7, XAR0 || MOV #8, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AADD #8, AR7 || SUB #1, T2
            AADD #8, AR6
            BCC loc_024e88, T2 != #0
            AMAR *AR5, XAR3
            MOV dbl(*SP(#02h)), XAR6
            AMAR *+AR3(#-03b0h)
            MOV #0, *AR3(#03afh)
            MOV #0, *AR3(#03aeh)
            MOV #0, *AR3(#03adh)
            AADD #20, AR6 || MOV #5, T2
            MOV dbl(*SP(#02h)), XAR7
loc_024ed5: MOV #0, *AR7
            MOV #0, *AR7(short(#5))
            MOV #0, *AR7(#000ah)
            MOV #-30, *AR7(#000fh)
            AMAR *AR6, XAR0 || MOV #8, T1
            MOV #32767, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AADD #8, AR6 || SUB #1, T2
            AMAR *AR7+
            BCC loc_024ed5, T2 != #0
            MOV dbl(*SP(#02h)), XAR3
            MOV dbl(*SP(#04h)), XAR0
            MOV #387, T1
            MOV #0, T0
            MOV #-32, *AR3(#003ch)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#04h)), XAR0
            MOV #3, T1
            MOV #0, T0
            AMAR *+AR0(#0306h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #-23551, *AR5(#0029h)
            MOV #-24575, *AR5(#002ah)
            MOV #-25599, *AR5(#002bh)
            MOV #-26623, *AR5(#002ch)
            MOV #-27647, *AR5(#002dh)
            AMAR *AR5, XAR0
            MOV #-28671, *AR5(#002eh)
            MOV #-29695, T0
            AADD #47, AR0 || MOV #10, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR5, XAR0
            MOV #16, T1
            AADD #57, AR0 || MOV #5, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR5, XAR0
            MOV #16, T1
            MOV #32767, T0
            AADD #73, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR5, XAR0
            MOV #16, T1
            AADD #89, AR0 || MOV #5, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR5, XAR0
            MOV #16, T1
            MOV #300, T0
            AADD #105, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #32, T1
            AMAR *AR5, XAR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #0, *AR5(#0079h)
            MOV #0, *AR5(#0022h)
            MOV #-7679, *AR5(#0024h)
            MOV #-11519, *AR5(#0028h)
            AMAR *AR5, XAR0 || MOV #0, T0
            AADD #123, AR0 || MOV #6, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #48, T1
            AMAR *AR5, XAR0 || MOV #0, T0
            AMAR *+AR0(#0081h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #3, T1
            AMAR *AR5, XAR0 || MOV #0, T0
            AMAR *+AR0(#0099h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *(#0fa000h), XAR3
            MOV XAR3, AC0
            MOV dbl(*SP(#08h)), XAR0
            MOV dbl(*SP(#08h)), XAR3
            MOV #0, *AR5(#009ch)
            MOV #0, *AR5(#007ah)
            MOV #32, T1
            MOV AC0, dbl(*AR5(#0020h))
            MOV #8192, *AR3
            AMAR *AR0+ || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#08h)), XAR3
            MOV dbl(*SP(#08h)), XAR0
            MOV #0, *AR3(#0021h)
            MOV #64, T1
            AADD #34, AR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#08h)), XAR0
            MOV #96, T1
            AADD #98, AR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#08h)), XAR0
            MOV #3, T1
            MOV #0, T0
            AMAR *+AR0(#00c2h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#06h)), XAR0
            MOV #13, T1
            MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #255, *AR5(#069fh)
            AMAR *AR5, XAR3
            MOV #255, *AR5(#06a0h)
            AMAR *+AR3(#069ah)
            MOV #0, *AR3
            MOV #-20479, *AR5(#06a1h)
            MOV #-20479, *AR5(#06a2h)
            MOV #-20479, *AR5(#06a3h)
            MOV #-20479, *AR5(#06a4h)
            MOV dbl(*SP(#00h)), XAR0
            MOV #-20479, *AR3(#000bh)
            MOV #-20479, *AR3(#000ch)
            MOV #-10, T1
            MOV #32, T0
            CALL sub_024d41
            MOV dbl(*SP(#00h)), XAR0
            AMAR *+AR0(#045ah)
            .vli_off
            CALL sub_022943
            .vli_on
            MOV dbl(*SP(#00h)), XAR3
            MOV #-90, AR2
            MOV #-25, AR1
            MAX AR2, AR1
            MOV AR1, *AR3(#03e2h)
            AADD #13, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_0250c6: PSH T2
            MOV *AR1(#0a56h), AR2
            BCC loc_025130, AR2 != #0
            AMAR *AR1, XAR2
            MOV #0, T2 || MOV #1, BRC0
            MOV #-20479 << #16, AC0
            MOV #255, T0
            MOV #-20479, *AR0(short(#1))
            MOV #255, *AR0
            AMAR *+AR2(#0a5bh)
            MOV #128, T1
            RPTB loc_02512c
               MOV #255, AR4
               MOV *AR2+, AR3
               CMP AR3 == AR4, TC1
               BCC loc_02512c, TC1
               MOV T2, AC1
               MOV XAR1, AC0
               SFTL AC1, #1
               ADD AC1, AC0
               MOV AC0, XAR4
               MOV AR3, T0
               CMP T0 >= T1, TC1
               MOV T0, *AR0
               AMAR *AR4, XAR3
               AMAR *+AR3(#0a5eh)
               XCC !TC1 || MOV *AR3 << #16, AC0
               BCC loc_02512a, !TC1
               MOV *AR4(#0a5dh) << #16, AC0
               MOV *AR3 << #16, AC0 || SFTS AC0, #-1, AC1
               SFTS AC0, #-1, AC0
               ADD AC1, AC0
loc_02512a:    MOV HI(AC0), *AR0(short(#1))
loc_02512c:    ADD #1, T2
            B loc_02513c
loc_025130: MOV *AR1(#0a58h), T0
            MOV T0, *AR0
            MOV *AR1(#0a57h) << #16, AC0
            MOV HI(AC0), *AR0(short(#1))
loc_02513c: AMAR *AR0+ || MOV HI(AC0), T1
            .vli_off
            CALL sub_02b420
            .vli_on
            POP T2
            RET
sub_025148: PSHBOTH XAR5
            MOV #56, T1
            AMAR *AR0, XAR5 || MOV #0, AC0
            MOV #26214, T0
            MOV #16384, *AR5(short(#6))
            MOV #14, *AR5(short(#2))
            MOV #255, *AR5(short(#1))
            MOV #2, *AR5
            MOV #0, *AR5(short(#7))
            MOV AC0, dbl(*AR5(#0040h))
            MOV AC0, dbl(*AR5(short(#4))) || AADD #8, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #-18, *AR5(#0042h)
            POPBOTH XAR5
            RET
sub_025180: AADD #-1, SP
            MOV *AR1, *AR0
            MOV *AR1(short(#6)), AR2
            MOV AR2, *AR0(short(#6))
            MOV #56, T0
            MOV *AR1(short(#2)), AR2
            MOV AR2, *AR0(short(#2))
            MOV *AR1(short(#1)), AR2
            MOV AR2, *AR0(short(#1))
            MOV *AR1(#0042h), AR2
            MOV AR2, *AR0(#0042h)
            MOV dbl(*AR1(short(#4))), AC0
            MOV AC0, dbl(*AR0(short(#4)))
            MOV *AR1(short(#7)), AR2 || MOV #0, AC0
            MOV AC0, dbl(*AR0(#0040h))
            AADD #8, AR1
            MOV AR2, *AR0(short(#7)) || AADD #8, AR0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AADD #1, SP
            RET
sub_0251bc: PSHBOTH XAR5
            AMAR *AR0, XAR5
            MOV *AR5, AR1 || MOV #1, AR2
            CMP AR1 == AR2, TC1
            BCC loc_025247, TC1
            MOV #2, AR2
            CMP AR1 == AR2, TC1
            BCC loc_025236, TC1
            MOV #3, AR2
            CMP AR1 == AR2, TC1
            BCC loc_025257, !TC1
            MOV dbl(*AR5(#0040h)), XAR0
            MOV #56, T1
            MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV *AR5(short(#1)), T0
            .vli_off
            CALL sub_02a937
            .vli_on
            BCC loc_025225, T0 == #0
            MOV #2, AR2
            SUB #1, T0, AR1
            CMPU AR2 >= AR1, TC1
            BCC loc_025257, !TC1
            MOV dbl(*AR5(short(#4))), AC0
            MOV dbl(*AR5(#0040h)), XAR3
            SFTS AC0, #-8, AC0 || MOV AC0, AR1
            AND #255, AC0, T0
            SUB #1, T0
            AND #255, AR1, AR1
            MOV #1, *AR3(T0)
            SUB #1, AR1, T0
            MOV dbl(*AR5(#0040h)), XAR3
            MOV #1, *AR3(T0)
            B loc_025257
loc_025225: MOV *AR5(short(#5)), T0
            MOV dbl(*AR5(#0040h)), XAR3
            MOV #1, AC0
            MOV #1, *AR3(T0)
            MOV AC0, dbl(*AR5(short(#4)))
            B loc_025257
loc_025236: MOV dbl(*AR5(#0040h)), XAR0
            MOV #56, T1
            MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            B loc_025257
loc_025247: MOV dbl(*AR5(#0040h)), XAR0
            MOV dbl(*AR5(short(#4))), AC0
            MOV *AR5(short(#6)), T0
            MOV *AR5(short(#2)), T1
            .vli_off
            CALL sub_02a01b
            .vli_on
loc_025257: POPBOTH XAR5
            RET
sub_02525b: MOV #13108, AR1 || PSH T3, T2
            MOV T0, AR5 || PSHBOTH XAR5
            CMP AR5 < AR1, TC1
            XCCPART !TC1 || MOV #13107, AR5
            MOV AR5, HI(AC0) || PSHBOTH XAR7
            AADD #-1, SP
            OR #0, AC0, AC1
            MOV #1, T0
            AMAR *AR0, XAR7 || EXP AC1, T2
            AMAR *SP(#00h), XAR1 || MOV #-4, AR0
            SUB T2, AR0 || SFTS AC0, T2, AC0
            MOV #16384 << #16, AC0 || MOV HI(AC0), T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *AR7(short(#6)), T2
            CMP T2 >= AR5, TC1
            BCC loc_0252e2, TC1
            AMAR *AR7, XAR3
            MOV *SP(#00h), AC0 || BSET ST1_FRCT
            AADD #8, AR3 || SFTS AC0, #1, AC2
loc_0252a7: MOV T0, HI(AC0) || BCLR ST1_SATD
            MPY T2, AC0, AC0
            OR #0, AC0, AC1
            EXP AC1, T1
            SFTS AC0, T1, AC0
            MOV T1, AC0 || MOV HI(AC0), T3
            SFTS AC0, #1 || MOV AC2, T1
            SUB AC0, T1
            SUB #8, T1 || MOV T3, HI(AC0)
            MPY T3, AC0, AC0
            SFTS AC0, T1, AC0
            SFTS AC0, #0, AC0
            MPYM *AR3, AC0, AC0
            MOV HI(AC0), *AR3+ || BSET ST1_SATD
            NOP
            NOP
            NOP
            MOV *AR7(short(#6)) << #16, AC1 || MOV T2, HI(AC0)
            ADD AC1, AC0
            MOV HI(AC0), T2
            CMP T2 < AR5, TC1
            BCC loc_0252a7, TC1
loc_0252e2: AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_FRCT
            BCLR ST1_SATD
            RET
sub_0252f0: PSH T3, T2
            AADD #-113, SP
            MOV *AR0(short(#2)), AR1
            BCC loc_025314, AR1 <= #0
            SUB #1, AR1
            MOV AR1, BRC0
            AMAR *SP(#00h), XAR2
            AMAR *AR0, XAR3
            AMAR *SP(#38h), XAR4
            MOV *AR0(#0042h), T1
            AADD #8, AR3 || RPTBLOCAL loc_025311
               MOV T1, *AR4+
loc_025311:    MOV *AR3+, *AR2+
loc_025314: MOV *AR0(short(#6)), AR4
            MOV *AR0(short(#2)), T1
            MOV AR4, HI(AC0) || BSET ST1_FRCT
            MPY T1, AC0, AC0
            SFTS AC0, #12, AC0
            MPYM *AR0(short(#6)), T1, AC0 || MOV HI(AC0), AR1
            SFTS AC0, #12, AC0
            MOV #19662, AR3 || MOV HI(AC0), AR2
            CMP AR2 < AR3, TC1
            BCC loc_025388, TC1
            SUB #1, T1, T2
            AMAR *SP(#38h), XAR3 || MOV AR4, HI(AC0)
            MOV *AR0(#0042h), T0
            AMAR *SP(#00h), XAR2 || SFTS AC0, #-3, AC2
            AADD T2, AR3 || AADD T2, AR2
loc_02534e: MOV AR1, HI(AC0) || BCLR ST1_FRCT
            MPYK #27307, AC0, AC0
            SFTS AC0, #-15, AC0
            MOV AC0, T2
            BSET ST1_FRCT
            MPYM *AR2, T2, AC0
            EXP AC0, T3
            MPYM *AR2, T2, AC0
            OR #0, AC0, AC1 || MOV T0, AR4
            EXP AC1, T2
            SUB T3, AR4
            ADD #1, AR4 || SFTS AC0, T2, AC0
            MOV HI(AC0), *AR2- || MOV AR1, HI(AC0)
            MOV AR4, *AR3- || SUB AC2, AC0
            MOV #19662, AR4 || MOV HI(AC0), AR1
            CMP AR1 >= AR4, TC1
            BCC loc_02534e, TC1
loc_025388: MOV #2, AR1
            CMP T1 < AR1, TC1
            MOV *SP(#38h), T2
            BCC loc_0253a6, TC1
            SUB #2, T1, AR1
            MOV AR1, BRC0
            AMAR *SP(#39h), XAR3 || RPTBLOCAL loc_0253a2
               MOV *AR3+, AR1
               CMP T2 >= AR1, TC1
loc_0253a2:    XCCPART !TC1 || MOV AR1, T2
loc_0253a6: BCC loc_0253ca, T1 <= #0
            AMAR *AR0, XAR3
            AMAR *SP(#00h), XAR2
            AADD #8, AR3 || MOV #0, AR1
            AMAR *SP(#38h), XAR4
loc_0253b7: SUB T2, *AR4+, T1
            MOV *AR2+ << #16, AC0
            SFTS AC0, T1, AC0
            MOV HI(AC0), *AR3+
            MOV *AR0(short(#2)), T1 || ADD #1, AR1
            CMP AR1 < T1, TC1
            BCC loc_0253b7, TC1
loc_0253ca: MOV T2, *AR0(#0042h)
            AADD #113, SP
            POP T3, T2
            BCLR ST1_FRCT
            RET
sub_0253d6: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-290, mmap(@SP)
            AMAR *AR2, XAR7
            AMAR *AR7, XAR3
            AMAR *SP(#00h), XAR6 || MOV T1, T3
            AMAR *+AR3(#0238h)
            MOV XAR1, dbl(*AR6(#0118h))
            MOV XAR3, dbl(*AR6(#011ah))
            AMAR *AR0, XAR5 || MOV T0, T2
            MOV dbl(*AR6(#011ah)), XAR1
            BTST #0, *AR7(#03beh), TC1
            MOV XAR1, dbl(*AR6(#011ch))
            BCC loc_0254cc, TC1
            CMP *AR5 == #1, TC1
            BCC loc_025439, TC1
            MOV #56, T1
            AMAR *AR7, XAR0 || MOV #0, T0
            AMAR *+AR0(#00b9h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR5, XAR3
            AADD #8, AR3
            MOV XAR3, dbl(*AR6(#011eh))
            B loc_025456
loc_025439: AMAR *AR5, XAR3
            AMAR *AR7, XAR0
            MOV *AR5(short(#2)), T0 || AADD #8, AR3
            MOV XAR3, dbl(*AR6(#011eh))
            MOV dbl(*AR6(#011eh)), XAR1
            AMAR *+AR0(#00b9h)
            .vli_off
            CALL sub_02a4e5
            .vli_on
loc_025456: AMAR *AR5, XAR3
            MOV dbl(*AR6(#011eh)), XAR0
            MOV *AR5(short(#2)), T0 || AADD #66, AR3
            MOV XAR3, dbl(*AR6(#0120h))
            MOV dbl(*AR6(#0120h)), XAR1
            .vli_off
            CALL sub_02a0eb
            .vli_on
            MOV *AR5, AR1 || MOV #1, AR2
            CMP AR1 != AR2, TC1
            BCC loc_0254b8, TC1
            AMAR *AR7, XAR3
            AMAR *AR7, XAR2
            MOV *AR5(short(#6)), T0
            MOV *AR5(short(#2)), T1
            MOV dbl(*AR6(#011eh)), XAR0
            MOV dbl(*AR6(#0120h)), XAR1
            AMAR *+AR3(#03c2h)
            AMAR *+AR2(#03c1h)
            .vli_off
            CALL sub_0261c8
            .vli_on
            AMAR *AR7, XAR2
            MOV *AR7(#03c1h), T0
            MOV *AR7(#03c2h), T1
            MOV dbl(*AR6(#011ah)), XAR1
            AMAR *AR5, XAR0
            AMAR *+AR2(#0308h)
            .vli_off
            CALL sub_029717
            .vli_on
            MOV *AR5, AR1
loc_0254b8: MOV #2, AR2
            CMP AR1 != AR2, TC1
            BCC loc_0254cc, TC1
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1
            AMAR *+AR0(#027ch)
            CALL sub_025180
loc_0254cc: AMAR *SP(#00h), XAR3
            AMAR *AR5, XAR0
            AMAR *+AR3(#00a8h)
            MOV XAR3, dbl(*AR5(#0040h))
            CALL sub_0251bc
            MOV dbl(*AR6(#011ch)), XAR3
            AMAR *SP(#00h), XAR2
            AMAR *+AR2(#00e0h)
            MOV dbl(*AR6(#011ch)), XAR0
            MOV XAR2, dbl(*AR3(#0040h))
            CALL sub_0251bc
            CMP *AR5 == #3, TC1
            BCC loc_025522, TC1
            BCC loc_025512, T3 != #0
            MOV *AR7(#03c0h), T0
            MOV *AR5(short(#6)), T1
            MOV dbl(*AR5(short(#4))), AC0
            .vli_off
            CALL sub_02a0a7
            .vli_on
            MOV T0, *AR7(#03c0h)
loc_025512: MOV *AR7(#03c0h), T0
            AMAR *AR5, XAR0
            CALL sub_02525b
            AMAR *AR5, XAR0
            CALL sub_0252f0
loc_025522: MOV T2, AC0
            AMAR *SP(#00h), XAR0 || SFTS AC0, #1
            MOV AC0, T1 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR7, XAR1
            MOV *AR7(#03c0h), T1
            AMAR *SP(#00h), XAR0
            AMAR *AR5, XAR2 || MOV T2, T0
            AMAR *+AR1(#0312h)
            .vli_off
            CALL sub_026fe2
            .vli_on
            AMAR *AR7, XAR1
            MOV *AR7(#03c0h), T1
            AMAR *SP(#00h), XAR0
            MOV dbl(*AR6(#011ah)), XAR3
            AMAR *AR5, XAR2
            AADD #12, AR1 || MOV T2, T0
            .vli_off
            CALL sub_023560
            .vli_on
            AMAR *SP(#00h), XAR0
            AMAR *SP(#00h), XAR1
            AMAR *AR7, XAR2 || MOV T2, T0
            .vli_off
            CALL sub_02a2b8
            .vli_on
            MOV dbl(*AR6(#0118h)), XAR0
            AMAR *SP(#00h), XAR1 || MOV #15, T0
            MOV #17, T1 || MOV T2, AR2
            .vli_off
            CALL sub_02828e
            .vli_on
            MOV #0, AC0
            MOV dbl(*AR6(#011ah)), XAR0
            MOV AC0, dbl(*AR5(#0040h))
            AMAR *AR5, XAR1
            CALL sub_025180
            ADD #290, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0255a7: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-1, SP
            AMAR *AR0, XAR5
            AMAR *AR2, XAR6
            AMAR *AR1, XAR7
            AMAR *AR6, XAR0 || MOV T0, T2
            .vli_off
            CALL sub_028272
            .vli_on
            BCC loc_0255df, T2 <= #0
            SUB #1, T2, AR1
            MOV AR1, BRC0
            AMAR *AR5, XAR2
            AMAR *AR7, XAR3
            AMAR *AR6, XAR4
            RPTBLOCAL loc_0255dd
               SUB T0, *AR4+, T1
               MOV *AR3+ << T1, AC0
loc_0255dd:    MOV AC0, *AR2+
loc_0255df: AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_0255eb: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-1, SP
            AMAR *AR0, XAR5
            AMAR *AR2, XAR6
            AMAR *AR1, XAR7
            AMAR *AR6, XAR0 || MOV T0, T2
            .vli_off
            CALL sub_028272
            .vli_on
            BCC loc_02561d, T2 <= #0
            SUB #1, T2, AR1
            MOV AR1, BRC0
            RPTBLOCAL loc_02561a
               SUB T0, *AR6+, T1
               MOV dbl(*AR7+), AC0
               SFTS AC0, T1, AC0
loc_02561a:    MOV AC0, dbl(*AR5+)
loc_02561d: AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_025629: AADD #-1, SP
            XCCPART AR0 <= #0 || MOV #32767, T0
            BCC loc_02565e, AR0 <= #0
            MOV T1, T0 || MOV T0, HI(AC0)
            MOV AR0, T1
            MOV AR1, AR0
            AMAR *SP(#00h), XAR1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            XCCPART T1 > #0 || MOV #0, T0
            BCC loc_02565e, T1 > #0
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0 || BSET ST1_SATD
            BCLR ST1_SATD || NEG AC0, AC1
            MOV #32767 << #16, AC0
            ADD AC1, AC0
            MOV HI(AC0), T0
loc_02565e: AADD #1, SP
            RET
sub_025662: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-18, SP
            MOV #8192 << #16, AC0
            AMAR *AR0, XAR5
            AMAR *AR1, XAR6
            MOV T0, *SP(#0ah)
            MOV T1, *SP(#0bh)
            AMAR *SP(#0dh), XAR1
            MOV AR4, *SP(#0ch) || MOV #-4, AR0
            MOV XAR2, dbl(*SP(#08h))
            MOV #-3, T0 || MOV AR3, T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#0dh), T1
            SUB #15, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV AC0, dbl(*SP(#00h))
            SFTS AC0, #1
            ADD dbl(*SP(#00h)), AC0, AC0
            MOV HI(AC0), T2
            MOV #0, AC3
            ADD #1, T2
            MOV #1, T3
            CMP T2 >= T3, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T2 >= T3, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T2 >= T3, TC1
            XCCPART TC1 || ADD #1, AC3
            NEG AC3, T3
            MOV T3, *SP(#11h)
            ADD *SP(#0ah), AC3, AC0
            MOV AC0, *SP(#0ah)
            ADD *SP(#0bh), AC3, AC0
            MOV AC0, *SP(#0bh)
            MOV dbl(*SP(#00h)), AC0
            SFTS AC0, #1
            MOV AC0, dbl(*SP(#02h)) || MOV #8, AR1
            MOV #0, AC0
            MOV AR1, *SP(#0eh)
            MOV AC0, dbl(*SP(#04h))
            MOV #0, AR3
loc_0256de: MOV dbl(*SP(#02h)), AC0
            ADD dbl(*SP(#04h)), AC0, AC0
            OR #0, AC0, AC1
            ROUND AC0, AC0
            MOV *SP(#0ch), AR1 || MOV HI(AC0), AR2
            CMP AR1 >= AR2, TC1
            MOV AR3, AR1
            SFTL AR1, #1
            AMAR *AR6, XAR7 || BSET ST1_M40
            XCCPART !TC1 || MOV *SP(#0ch) << #16, AC0
            MOV #0, AC0 || MOV HI(AC0), T2
            MOV AC1, dbl(*SP(#04h))
            SUB AR3, T2
            AADD AR1, AR7
            BCC loc_025720, T2 < #0
            MOV dbl(*SP(#08h)), XAR3
            MOV T2, BRC0
            MOV *SP(#11h), T1
            AADD AR1, AR3 || RPTB loc_02571e
               MOV dbl(*AR3+), AC3
               SFTS AC3, T1, AC3
loc_02571e:    ADD AC3, AC0
loc_025720: MANT AC0, AC0 :: NEXP AC0, T3
            MOV *SP(#0bh), AR1
            MOV AC0, dbl(*SP(#06h)) || ADD T3, AR1
            MOV #0, AC0 || MOV AR1, T3
            MOV *SP(#06h), AR1
            MOV AR1, *SP(#0fh)
            BCC loc_025742, T2 < #0
            MOV T2, BRC0
            MOV *SP(#11h), T1
            RPTB loc_025740
               MOV dbl(*AR7+), AC3
               SFTS AC3, T1, AC3
loc_025740:    ADD AC3, AC0
loc_025742: MANT AC0, AC0 :: NEXP AC0, T2
            MOV *SP(#0ah), AR1 || MOV T3, T1
            MOV HI(AC0), AR0
            ADD T2, AR1
            MOV *SP(#0fh), T0 || BCLR ST1_M40
            CALL sub_025629
            MOV dbl(*SP(#04h)), AC0
            ADD #-1, *SP(#0eh)
            MOV *AR5, AR1
            SUB dbl(*SP(#00h)), AC0, AC0 || CMP T0 >= AR1, TC1
            XCC !TC1 || MOV T0, *AR5
            MOV *SP(#0eh), AR1 || ROUND AC0, AC0
            AMAR *AR5+ || MOV HI(AC0), AR3
            BCC loc_0256de, AR1 != #0
            AADD #18, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02577f: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-286, mmap(@SP)
            MOV XSP, XAR6
            AMAR *AR6(#00e4h), XAR5
            AMAR *AR5+ || MOV #0, AC0
            AMAR *SP(#00h), XAR7
            MOV AC0, dbl(*AR7+)
            MOV XAR1, dbl(*AR6(#00e0h))
            MOV XAR0, dbl(*AR6(#00e2h))
            MOV #-30, *AR6(#00e4h)
            MOV dbl(*AR6(#00e0h)), XAR2
            AMAR *AR5, XAR1
            AMAR *AR7, XAR0 || MOV T0, T3
            .vli_off
            CALL sub_02961c
            .vli_on
            AMAR *AR5, XAR2
            AMAR *AR7, XAR1
            AMAR *AR7, XAR0 || MOV T0, T2
            CALL sub_0255eb
            AMAR *SP(#70h), XAR7
            MOV dbl(*AR6(#00e0h)), XAR2
            MOV T0, *AR6(#011ch)
            MOV #0, AC0
            MOV #-30, *AR6(#00e4h)
            MOV AC0, dbl(*AR7+) || MOV T3, T0
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1 || MOV T2, T1
            .vli_off
            CALL sub_02955c
            .vli_on
            AMAR *AR5, XAR2
            AMAR *AR7, XAR1
            AMAR *AR7, XAR0 || MOV T2, T0
            CALL sub_0255eb
            MOV T0, T1
            MOV *AR6(#011ch), T0
            AMAR *SP(#70h), XAR2 || MOV T3, AR3
            MOV dbl(*AR6(#00e2h)), XAR0
            AMAR *SP(#00h), XAR1 || MOV T2, AR4
            CALL sub_025662
            ADD #286, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_025824: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-14, SP
            MOV #32, T0 || MOV T0, T3
            AMAR *AR4, XAR5
            MOV XAR0, dbl(*SP(#02h))
            MOV *SP(#14h), T2
            MOV XAR2, dbl(*SP(#04h))
            MOV XAR1, dbl(*SP(#06h))
            AMAR *AR5, XAR0 || SUB T1, T0
            MOV XAR3, dbl(*SP(#08h)) || AADD T1, AR0
            .vli_off
            CALL sub_028327
            .vli_on
            EXP AC0, T1
            SFTS AC0, T1, AC0
            MOV HI(AC0), *SP(#0ah)
            NEG T1, AR6
            AMAR *AR5, XAR0 || MOV #5, T1
            MOV #64, AR1 || MOV T3, T0
            .vli_off
            CALL sub_0296d7
            .vli_on
            MANT AC0, AC0 :: NEXP AC0, T1
            MOV HI(AC0), *SP(#0bh)
            MOV #6554, AR1
            CMP AR1 >= T3, TC1
            MOV T1, AR7
            BCC loc_0258d9, TC1
            AMAR *AR5, XAR0
            MOV #32, T0
            AADD T2, AR0 || SUB T2, T0
            .vli_off
            CALL sub_028327
            .vli_on
            MOV #64, AR1
            MANT AC0, AC0 :: NEXP AC0, T2
            AMAR *AR5, XAR0 || MOV #4, T1
            MOV AC0, dbl(*SP(#00h)) || MOV T3, T0
            .vli_off
            CALL sub_0296d7
            .vli_on
            MANT AC0, AC0 :: NEXP AC0, T1
            MOV HI(AC0), T3
            MOV *SP(#0ah) << #16, AC0 || MOV HI(AC0), AR5
            BSET ST1_FRCT
            MPY T3, AC0, AC0
            MOV *SP(#00h) << #16, AC1
            MANT AC0, AC0 :: NEXP AC0, T0
            MPYM *SP(#0bh), AC1, AC1
            MANT AC1, AC1 :: NEXP AC1, T3
            MOV T1, *SP(#0ch) || BCLR ST1_FRCT
            MOV HI(AC1), AR0
            ADD AR6, T1
            ADD T0, T1
            MOV T2, AR1
            ADD AR7, AR1
            MOV HI(AC0), T0
            ADD T3, AR1
            .vli_off
            CALL sub_0241a1
            .vli_on
            BCC loc_0258d9, T0 == #0
            MOV *SP(#00h), AR1
            MOV *SP(#0ch), AR7
            MOV AR1, *SP(#0ah) || MOV T2, AR6
            MOV AR5, *SP(#0bh)
loc_0258d9: MOV dbl(*SP(#02h)), XAR3
            MOV *SP(#0bh), AR1
            MOV AR1, *AR3
            MOV dbl(*SP(#06h)), XAR3
            MOV AR7, *AR3
            MOV dbl(*SP(#04h)), XAR3
            MOV *SP(#0ah), AR1
            MOV AR1, *AR3
            MOV dbl(*SP(#08h)), XAR3
            MOV AR6, *AR3
            AADD #14, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0258fd: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-26, SP
            MOV XAR0, dbl(*SP(#02h))
            MOV T0, *SP(#12h)
            MOV XAR2, XAR6
            AMAR *AR0(#0020h), XAR2
            AMAR *AR0(#0048h), XAR3
            MOV XAR1, XAR5
            AMAR *AR0(#0054h), XAR4
            MOV #2, BRC0
            RPTB loc_02594a
               AMAR *AR2, XAR0
               AMAR *AR2(#-0010h), XAR1
               RPT #7
                  MOV *AR1+, *AR0+
               AMAR *AR3, XAR0
               AMAR *AR3(#-0010h), XAR1
               RPT #7
                  MOV *AR1+, *AR0+
               AMAR *AR4(#-0002h), XAR1
               ASUB #8, AR2
               ASUB #8, AR3
loc_02594a:    MOV *AR1, *AR4-
            MOV dbl(*SP(#02h)), XAR3 || MOV T0, HI(AC1)
            MOV XAR3, dbl(*SP(#08h))
            MOV XAR3, dbl(*SP(#04h)) || AADD #40, AR3
            MOV XAR3, dbl(*SP(#06h))
            SFTS AC1, #-11, AC0
            ADD #1 << #16, AC0, AC0
            AMAR *SP(#0ah), XAR7
            MOV HI(AC0), *SP(#13h)
            MOV #0, T2 || SFTS AC1, #-12, AC0
            ADD #1 << #16, AC0, AC0
            MOV HI(AC0), *SP(#14h) || MOV #8, T3
loc_025977: MOV *SP(#14h), AR1
            AMAR *SP(#16h), XAR3
            AMAR *SP(#15h), XAR2
            AMAR *SP(#17h), XAR0
            MOV AR1, *SP(#00h)
            MOV *SP(#12h), T0
            MOV *SP(#13h), T1
            AMAR *AR5, XAR4
            AMAR *SP(#18h), XAR1
            CALL sub_025824
            MOV dbl(*SP(#06h)), XAR3
            MOV *SP(#15h), AR0
            MOV *SP(#18h), T1
            MOV AR0, *AR3+
            MOV *SP(#16h), AR1
            ADD *AR6+, AR1, T0
            MOV T0, *AR7+
            MOV XAR3, dbl(*SP(#06h))
            MOV *SP(#17h), T0
            CALL sub_025629
            MOV dbl(*SP(#08h)), XAR3
            MOV #6554, AR1
            MOV T0, *AR3+ || CMP T0 >= AR1, TC1
            MOV XAR3, dbl(*SP(#08h)) || SFTL T2, #1
            AADD #32, AR5 || SUB #1, T3
            XCCPART !TC1 || ADD #1, T2
            BCC loc_025977, T3 != #0
            MOV dbl(*SP(#04h)), XAR0
            MOV dbl(*SP(#04h)), XAR1
            AMAR *SP(#0ah), XAR2 || MOV #8, T0
            CALL sub_0255a7
            MOV dbl(*SP(#02h)), XAR4
            MOV dbl(*SP(#04h)), XAR0
            MOV T0, *AR4(#0050h)
            AMAR *AR0, XAR3
            MOV *AR3+, AR1
            RPT #7 || MOV #0, AR2
               MOV *AR3+, AR1 || OR AR1, AR2
            BCC loc_0259f7, AR2 != #0
            RPT #7
               MOV #1, *AR0+
            MOV #-30, *AR4(#0050h)
loc_0259f7: MOV T2, T0
            AADD #26, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP
            NOP
            NOP
sub_025a08: MOV #32, AR1
            CMP T0 == AR1, TC1
            BCC loc_025a20, TC1
            MOV #128, AR1
            CMP T0 == AR1, TC1
            AMAR *(#word_ea7e), XAR2
            B loc_025a26
loc_025a20: AMAR *(#word_ea65), XAR2
loc_025a26: MOV *AR2+, AR1
            MOV XAR0, XAR3
            SUB #1, AR1
            MOV AR1, BRC0
            ADD *AR2+, AR0, AR0
            RPTBLOCAL loc_025a3e || NOP_16
               ADD *AR2+, AR3, AR3
               MOV dbl(*AR0), AC0
               MOV dbl(*AR3), dbl(*AR0)
loc_025a3e:    ADD *AR2+, AR0, AR0 || MOV AC0, dbl(*AR3)
            RET
sub_025a46: PSH T2
            BSET ST1_M40
            BSET ST1_FRCT
            MOV T1, T2
            MOV T0, AC0 || MOV #3, T0
            MOV XAR0, XAR1 || SFTS AC0, #-1
            SUB #1, AC0, AR2
            MOV AR2, BRC0
            ADD #2, AR1
            MOV XAR1, XAR2
            MOV *AR2+ << #16, AC0 || RPTBLOCAL loc_025a7c
               ADD *AR0 << #16, AC0, AC2 || MOV *(AR2+T0) << #16, AC1
               SUB AC0, *AR0 << #16, AC3 || MOV HI(AC2 << T2), *AR0+
               NOP
               ADD *AR0 << #16, AC1, AC2 || MOV HI(AC3 << T2), *AR1+
               SUB AC1, *AR0 << #16, AC3 || MOV HI(AC2 << T2), *(AR0+T0)
loc_025a7c:    MOV *AR2+ << #16, AC0 :: MOV HI(AC3 << T2), *(AR1+T0)
            BCLR ST1_FRCT
            BCLR ST1_M40
            POP T2
            RET
sub_025a88: MOV XAR0, XAR1
            SFTS T0, #-1
            SUB #1, T0
            MOV T0, BRC0
            MOV dbl(*AR0+), AC0
            ADD dual(*AR0), AC0, AC1
            SUB dual(*AR0+), AC0, AC2
            NOP_16 || NOP
            RPTBLOCAL loc_025aa9 || NOP_16
               MOV dbl(*AR0+), AC0
               ADD dual(*AR0), AC0, AC1 || MOV AC1, dbl(*AR1+)
loc_025aa9:    SUB dual(*AR0+), AC0, AC2 || MOV AC2, dbl(*AR1+)
            RET
sub_025ab1: BSET ST1_M40
            BSET ST1_FRCT
            AMAR *(#word_e6fa), XCDP
            MPYM *AR0, *(CDP+T0), AC0
            MOV XCDP, XAR3
            ADD #128, AR3, AR3
            PSH T2, T3
            BCLR ST2_ARMS
            MOV AR2, T2
            SUB #1, T1, AR2
            MOV AR2, BRC0
            MOV XAR1, XAR2
            MOV #3, T1
            MOV *(AR3+T0), T3
            MPYM *AR2+, T3, AC1
            NOP_16 || NOP
            RPTBLOCAL loc_025aff || NOP_16
               MAC *(AR2-T1), *(CDP+T0), AC1 :: MPY *AR1+, *(CDP+T0), AC0
               MASM *AR1-, T3, AC0, AC0
               ADD *AR0 << #16, AC0, AC2 || MOV *(AR3+T0), T3
               SUB AC0, *AR0 << #16, AC3 || MOV HI(AC2 << T2), *AR0+
               NOP
               ADD *AR0 << #16, AC1, AC2 || MOV HI(AC3 << T2), *AR1+
               SUB *AR0 << #16, AC1, AC3 || MOV HI(AC2 << T2), *AR0+
loc_025aff:    MPYM *AR2+, T3, AC1 :: MOV HI(AC3 << T2), *(AR1-T1)
            BSET ST2_ARMS
            BCLR ST1_FRCT
            BCLR ST1_M40
            POP T2, T3
            RET
sub_025b0d: BCC loc_025b4e, T0 <= #0
            SUB #1, T0, AR4
            MOV AR4, BRC0
            MOV XAR1, XAR3
            MOV XAR0, XAR2
            ADD #1, AR3
            ADD #1, AR2
            MOV #-1, T1
            MOV #-2, T0
            BCLR ST1_SATD
            MOV *AR0, AC0
            ADD *AR1, AC0, AC1
            NOP_16 || NOP
            RPTBLOCAL loc_025b48 || NOP_16
               SUB AC0, *AR1+, AC2
               MOV *AR1, AC0 || MOV AC1 << T1, *AR0+
               ADD *AR0, AC0, AC2 || MOV AC2 << T1, *AR1-
               SUB AC0, *AR0, AC1 || MOV AC2 << T1, *(AR1+T0)
               MOV *AR0(#0001h), AC0
loc_025b48:    ADD *AR1, AC0, AC1 || MOV AC1 << T1, *AR0+
loc_025b4e: BCLR ST1_SATD
            RET
sub_025b52: BCC loc_025b4e, T0 <= #0
            SUB #1, T0, AR4
            MOV AR4, BRC0
            MOV XAR1, XAR3
            MOV XAR0, XAR2
            ADD #1, AR3
            ADD #1, AR2
            MOV #-1, T1
            MOV #-2, T0
            BCLR ST1_SATD
            MOV *AR0, AC0
            ADD *AR1, AC0, AC1
            NOP_16
            RPTBLOCAL loc_025b8c || NOP_16
               SUB *AR1+, AC0, AC2
               MOV *AR1, AC0 || MOV AC1 << T1, *AR0+
               ADD *AR0, AC0, AC2 || MOV AC2 << T1, *AR1-
               SUB *AR0, AC0, AC1 || MOV AC2 << T1, *(AR1+T0)
               MOV *AR0(#0001h), AC0
loc_025b8c:    ADD *AR1, AC0, AC1 || MOV AC1 << T1, *AR0+
            BCLR ST1_SATD
            RET
sub_025b96: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-12, SP
            MOV #1, AC0
            MOV XAR0, dbl(*SP(#00h)) || MOV T1, T2
            MOV T0, *SP(#02h) || SFTS AC0, T2, AC0
            MOV AC0, *SP(#03h) || SUB #1, AC0
            MOV AC0, *SP(#0ah)
            MOV *SP(#0ah), BRC0
            MOV #256 << #16, AC1 || RPTBLOCAL loc_025bc0
               SQRM *AR0+, AC0
               SQAM *AR0+, AC0, AC0
loc_025bc0:    MAX AC0, AC1
            EXP AC1, T3 || MOV #-1, AR1
            SUB #1, T3
            CMP T3 == AR1, TC1
            BCC loc_025be0, TC1
            BCC loc_025bdc, T3 == #0
            MOV #1, AR1
            CMP T3 == AR1, TC1
            BCC loc_025bdc, TC1
            B loc_025be2 || MOV #0, AR6
loc_025bdc: B loc_025be2 || MOV #-1, AR6
loc_025be0: MOV #-2, AR6
loc_025be2: MOV *SP(#03h), T0
            MOV dbl(*SP(#00h)), XAR0
            CALL sub_025a08
            MOV dbl(*SP(#00h)), XAR0 || MOV AR6, T1
            MOV *SP(#03h), T0
            BCC loc_025bf8, AR6 != #0
            CALL sub_025a88
            B loc_025bfb
loc_025bf8: CALL sub_025a46
loc_025bfb: MOV *SP(#03h), AR1
            MOV AR1, AR2
            MOV mmap(@AR2), AC0
            MOV AR6, *SP(#06h) || MOV #2, AR1
            CMP T2 < AR1, TC1 || SFTS AC0, #-2, AC0
            MOV AC0, *SP(#04h)
            BCC loc_025d0f, TC1
            SUB #1, T2, AR1
            MOV #128, AR6
            MOV AR1, *SP(#07h) || MOV #2, AR1
            MOV AR1, *SP(#08h) || MOV #1, AR7
            SUB #2, T3
            BSET ST2_AR3LC
            AMAR *(#word_e6fa), XAR3
            MOV mmap(@AR3), BSA23
            MOV #128, AR3
            BSET ST2_CDPLC
            AMAR *(#word_e6fa), XCDP
            MOV mmap(@CDP), BSAC
            MOV #0, CDP || BSET ST1_M40
loc_025c46: BTST @#00h, AR7, TC1
            MOV dbl(*SP(#00h)), XAR0 || BCC loc_025c67, TC1
            MOV *SP(#0ah), BRC0
            NOP_16
            MOV #256 << #16, AC1 || RPTBLOCAL loc_025c60
               SQRM *AR0+, AC0
               SQAM *AR0+, AC0, AC0
loc_025c60:    MAX AC0, AC1
            EXP AC1, T3
            SUB #1, T3
loc_025c67: MOV #2, AR1
            MOV *SP(#08h), AR1 || CMP T3 < AR1, TC1
            MOV *SP(#08h), T1 || SFTL AR1, #1
            MOV AR1, *SP(#09h) || MOV #0, T2
            MOV *SP(#04h), AR1
            MOV T3, *SP(#0bh) || SUB #1, AR1
            MOV AR1, BRC0
            MOV dbl(*SP(#00h)), XAR0 || MOV AR6, T0
            XCCPART TC1 || MOV #-1, T2
            AMAR *AR0, XAR1 || BSET ST1_FRCT
            ADD *SP(#09h), AR1, AR1
            MOV T1, AR4
            ADD T1, AR4 || MOV #-1, AR5
            ADD AR4, AR5 || MOV #512, BK03
            MOV XAR1, XAR2 || MOV #512, BKC
            SUB #1, T1, T3
            SUB AR4, AR0
            MOV T3, BRC1
            NOP
            RPTBLOCAL loc_025ce2 || NOP_16
               ADD AR4, AR0
               MPYM *AR2+, *AR3, AC1 || RPTBLOCAL loc_025cd4
                  MAC *AR2+, *(CDP+T0), AC1 :: MPY *AR1+, *(CDP+T0), AC0
                  MASM *AR1-, *(AR3+T0), AC0, AC0
                  ADD *AR0 << #16, AC0, AC2 || MOV *AR3, T1
                  SUB AC0, *AR0 << #16, AC3 || MOV HI(AC2 << T2), *AR0+
                  ADD *AR0 << #16, AC1, AC2 || MOV HI(AC3 << T2), *AR1+
                  NOP
                  SUB AC1, *AR0 << #16, AC3 || MOV HI(AC2 << T2), *AR0+
loc_025cd4:       MPYM *AR2+, T1, AC1 :: MOV HI(AC3 << T2), *AR1+
               MOV T3, BRC1 || NOP_16
               MOV #128, AR3 || ADD AR5, AR2
loc_025ce2:    MOV #0, CDP || ADD AR4, AR1
            MOV *SP(#04h), AR1 || BCLR ST1_FRCT
            MOV *SP(#0bh), T3 || SFTS AR1, #-1
            MOV AR1, *SP(#04h)
            MOV *SP(#09h), AR1
            ADD #-1, *SP(#07h)
            MOV AR1, *SP(#08h)
            ADD *SP(#06h), T2, AR1
            MOV AR1, *SP(#06h) || SFTS AR6, #-1
            MOV *SP(#07h), AR1 || ADD #1, AR7
            SUB #2, T3
            BCC loc_025c46, AR1 != #0
            BCLR ST2_CDPLC
            BCLR ST2_AR3LC
loc_025d0f: MOV *SP(#02h), T0 || BCLR ST1_M40
            SUB *SP(#06h), T0, T0
            AADD #12, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_025d22: PSHBOTH XAR5
            PSH T3, T2
            MOV AR1, AR2 || MOV #1, AR1
            AMAR *AR0, XAR5
            SUB #1, T1, T2
            XCCPART AR2 == #0 || MOV #0, *AR5(short(#1))
            CALL sub_025d72
            AMAR *AR5, XAR0 || MOV T2, T1
            CALL sub_025b96
            SUB T2, T0 || POP T3, T2
            POPBOTH XAR5
            RET
sub_025d49: PSHBOTH XAR5
            PSH T3, T2
            AMAR *AR0, XAR5 || MOV T1, T2
            SUB #1, T2, T1
            MOV AR1, T3
            CALL sub_025b96
            MOV #0, AR1 || MOV T3, AR2
            AMAR *AR5, XAR0 || MOV T2, T1
            CALL sub_025d72
            XCCPART T3 == #0 || MOV #0, *AR5(short(#1))
            POP T3, T2
            POPBOTH XAR5
            RET
sub_025d72: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7 || MOV #1, AC0
            SFTS AC0, T1, AC0
            AADD #-2, SP
            MOV AC0, *SP(#00h)
            AMAR *AR0, XAR7
            MOV *SP(#00h), AR3
            AMAR *AR7, XAR6 || NEG T1, T1
            MOV #512, AC0 || MOV T0, T2
            AMAR *AR6, XAR5 || SFTS AC0, T1, AC0
            MOV AC0, *SP(#01h) || MOV AR3, AC0
            AADD AR3, AR5 || SFTS AC0, #-2, AC0
            SUB #1, AC0, T3
            BCC loc_025de1, AR2 == #0
            BCC loc_025dc7, AR1 != #0
            MOV *AR6+ << #15, AC1
            ADD *AR6- << #15, AC1, AC1
            MOV *AR6+ << #15, AC2
            SUB *AR6- << #15, AC2, AC2
            MOV HI(AC2), *AR5+ || MOV HI(AC1), *AR6+
            MOV #0, *AR5-
            MOV #0, *AR6+ || B loc_025df5
loc_025dc7: MOV *AR6 << #15, AC1
            ADD *AR5 << #15, AC1, AC1
            SFTS AC1, #-1, AC1
            MOV *AR6 << #15, AC0 || MOV HI(AC1), *AR6+
            SUB *AR5 << #15, AC0, AC0
            SFTS AC0, #-1, AC0
            B loc_025df3
loc_025de1: MOV *AR6+ << #15, AC1
            ADD *AR6- << #15, AC1, AC1
            MOV *AR6+ << #15, AC0
            SUB *AR6- << #15, AC0, AC0
            MOV HI(AC1), *AR6+
loc_025df3: MOV HI(AC0), *AR6+
loc_025df5: ASUB #2, AR5
            BCC loc_025e07, AR1 != #0
            AMAR *AR6, XAR0
            AMAR *AR5, XAR1 || MOV T3, T0
            CALL sub_025b0d
            B loc_025e12
loc_025e07: AMAR *AR6, XAR0
            AMAR *AR5, XAR1 || MOV T3, T0
            CALL sub_025b52
loc_025e12: MOV *SP(#01h), T0
            AMAR *AR6, XAR0 || MOV #-1, AR2
            AMAR *AR5, XAR1 || MOV T3, T1
            CALL sub_025ab1
            MOV *SP(#00h), AR1
            SFTS AR1, #-1
            AADD AR1, AR7
            AMAR *AR7, XAR3 || MOV *AR7 << #16, AC0
            AMAR *AR3+ || SFTS AC0, #-1, AC0
            MOV HI(AC0), *AR7
            MOV *AR3 << #16, AC0 || BSET ST1_SATD
            BCLR ST1_SATD || NEG AC0, AC0
            SFTS AC0, #-1, AC0
            MOV HI(AC0), *AR3
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            ADD #1, T2, T0
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP
            NOP
            NOP
sub_025e54: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-10, SP
            AMAR *AR2, XAR5
            AMAR *AR1, XAR6
            MOV XAR0, dbl(*SP(#02h))
            MOV *SP(#12h), T3
            MOV dbl(*SP(#10h)), XAR7
            MOV T0, *SP(#08h)
            MOV XAR4, dbl(*SP(#06h))
            MOV XAR3, dbl(*SP(#04h))
            AMAR *AR6, XAR0
            MOV #4, AC3
            MOV #16, T2
            CMP T2 < T3, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T2, #1
            CMP T2 < T3, TC1
            XCCPART TC1 || ADD #1, AC3
            NEG AC3, AC3
            MOV AC3, *SP(#09h)
            AMAR *AR7, XAR2 || MOV T1, T2
            AMAR *AR7, XAR1 || MOV T3, T0
            .vli_off
            CALL sub_02a6b1
            .vli_on
            MOV dbl(*SP(#02h)), XAR3
            MOV HI(AC0), *AR3
            SFTL T2, #1
            ADD *AR6, T2, AR1
            MOV *AR3, AR1 || MOV AR1, *AR6
            BCC loc_025f16, AR1 == #0
            MOV *SP(#08h), AR2
            MOV AR2, AC0
            SFTS AC0, #10, AC0
            SFTS AC0, #-4, AC0
            MOV AC0, dbl(*SP(#00h)) || BSET ST1_M40
            MOV #0, AC2
            MOV dbl(*SP(#00h)), AC3
            BCC loc_025ef4, T3 <= #0
            SUB #1, T3, AR3
            MOV AR3, BRC0
            AMAR *(#word_e6fa), XAR4
            AMAR *AR7, XAR1
            MOV dbl(*SP(#06h)), XAR2
            MOV *SP(#09h), T3
            NOP
            RPTBLOCAL loc_025ef1 || BSET ST1_FRCT
               SQRM *AR1+, AC0 || MOV HI(AC3), T0
               MOV HI(AC0), T1
               MPYM *AR4(T0), T1, AC1
               SFTS AC1, T3, AC1
               MOV *AR4(T0), *AR2+ || ADD AC1, AC2
loc_025ef1:    ADD dbl(*SP(#00h)), AC3, AC3
loc_025ef4: BCLR ST1_FRCT
            MANT AC2, AC0 :: NEXP AC2, T0
            MOV dbl(*SP(#04h)), XAR3
            MOV #-32768, AR2
            MOV HI(AC0), AR1
            CMP AR1 != AR2, TC1
            SUB *SP(#09h), T0, T0
            ADD T0, T2
            MOV AR1, *AR5 || MOV T2, *AR3
            XCCPART !TC1 || MOV #-32767, *AR5
            B loc_025f1f
loc_025f16: MOV dbl(*SP(#04h)), XAR3
            MOV #0, *AR3
            MOV #0, *AR5
loc_025f1f: BCLR ST1_M40
            AADD #10, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP_16 || NOP
sub_025f30: PSH T2
            MOV *AR1, T2
            MOV T2, AR2
            MOV #-3276 << #16, AC0 || MAX T1, AR2
            SUB AR2, T2 || SFTL AC0, #0, AC0
            MPYM *AR0, AC0, AC0 || SUB AR2, T1
            MOV #-13108 << #16, AC0 || SFTS AC0, T2, AC1
            SFTL AC0, #0, AC0 || SUB #4, T1
            MPY T0, AC0, AC0
            SFTS AC0, T1, AC0
            ADD AC1, AC0
            MANT AC0, AC0 :: NEXP AC0, T1
            ADD T1, AR2
            BCC loc_025f67, AC0 == #0
            MOV #-17, AR3
            CMP AR3 < AR2, TC1
            BCC loc_025f6f, TC1
loc_025f67: MOV #-17, AR2
            MOV #32767 << #16, AC0
loc_025f6f: MOV HI(AC0), *AR0
            MOV AR2, *AR1
            POP T2
            RET
            NOP
sub_025f78: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            BSET ST1_FRCT
            MOV T0, *SP(#05h)
            AMAR *AR1, XAR5
            MOV AR4, *SP(#04h)
            MOV *SP(#0dh), T0
            MOV XAR0, XAR7
            SQRM *SP(#05h), AC0
            MOV XAR2, dbl(*SP(#00h)) || MOV T1, T3
            MOV XAR3, XAR6 || SFTS AC0, #-1, AC0
            MOV T3, AR1
            SFTL AR1, #1
            ADD #1, AR1, T2
            BCC loc_025fd0, AR4 == #0
            MOV *SP(#0ch), T1
            SFTL T1, #1
            SUB T2, T1
            SQRM *SP(#04h), AC1
            SFTS AC1, T1, AC1
            OR #0, AC1, AC2
            ADD AC0, AC2
            SUB AC1, AC0
            MOV HI(AC0), T1
            MOV HI(AC2), *SP(#03h)
            BCC loc_025fd4, T1 != #0
            MOV #0, *AR7
            MOV #0, *AR5
            MOV #32767, *AR2
            MOV #0, *AR6
            B loc_026039
loc_025fd0: MOV HI(AC0), T1
            MOV HI(AC0), *SP(#03h)
loc_025fd4: MOV *SP(#05h) << #16, AC0
            MPY T1, AC0, AC0
            MPY T0, AC0, AC0
            EXP AC0, T1
            BCLR ST1_FRCT
            MOV T1, *SP(#02h) || SFTS AC0, T1, AC0
            MOV #15568 << #16, AC0 || MOV HI(AC0), T0
            OR #5033, AC0, AC0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV AC0, T0
            MOV *SP(#03h) << #16, AC0 || BSET ST1_FRCT
            MPY T0, AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T1
            MOV T1, *AR6
            MOV dbl(*SP(#00h)), XAR3
            NEG T2, AR2
            SUB T3, AR2
            ADD *SP(#02h), AR2, AR2
            MOV HI(AC0), *AR3 || MOV HI(AC0), AR1
            ADD #4, AR2
            BCC loc_026017, AR1 == #0
            ADD *AR6, AR2, AR1
            ADD T2, AR1
            MOV AR1, *AR6
loc_026017: MOV *SP(#04h) << #16, AC0
            MPYM *SP(#05h), AC0, AC0
            MPY T0, AC0, AC0
            MPYK #16384, AC0, AC0
            MANT AC0, AC0 :: NEXP AC0, T1
            MOV T1, *AR5
            MOV HI(AC0), AR1
            MOV AR1, *AR7
            BCC loc_026039, AR1 == #0
            ADD *AR5, T3, AR1
            ADD *SP(#0ch), AR1, AR1
            ADD AR2, AR1
            ADD #2, AR1
            MOV AR1, *AR5
loc_026039: BCLR ST1_FRCT
            AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP
sub_026048: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-10, SP
            MOV AR3, *SP(#04h)
            MOV XAR1, dbl(*SP(#02h)) || MOV T0, AR6
            AMAR *AR0, XAR5 || MOV AR6, AC0
            MOV AR4, *SP(#05h) || SFTS AC0, #-3, AC0
            MOV AC0, *SP(#06h) || MOV T1, T2
            MOV dbl(*SP(#10h)), XAR7
            MOV *AR1, T1 || MOV AR2, T3
            AMAR *AR5, XAR1 || MOV AC0, T0
            ADD #1, T1, AR2
            .vli_off
            CALL sub_028311
            .vli_on
            MOV *SP(#05h), AR1
            CMP T3 < AR1, TC1
            XCCPART !TC1 || ADD #1, T3, AR1
            XCCPART TC1 || ADD #1, AR1
            MOV AR1, *SP(#07h)
            MOV *SP(#06h), AR1
            CMP AR1 >= AR6, TC1
            BCC loc_026125, TC1
            MOV *SP(#05h), T1
            MOV *SP(#04h), AR1
            ADD *SP(#06h), AR7, AR7
            SUB *SP(#07h), T1, T1
            ADD *SP(#06h), AR5, AR5 || MOV AR1, HI(AC0)
            SUB *SP(#06h), AR6, AR6 || SFTS AC0, T1, AC0
            MOV AC0, dbl(*SP(#00h))
            NOP
            SUB *SP(#07h), T3, T3
loc_0260b0: BSET ST1_FRCT
            MPYM *AR7+, T2, AC0
            MOV dbl(*SP(#00h)), AC0 || SFTS AC0, T3, AC2
            SUB AC2, AC0
            BCC loc_0260f2, AC0 == #0
            MOV *SP(#07h), AR1
            AMAR *SP(#08h), XAR0
            MOV AR1, *SP(#08h) || BCLR ST1_FRCT
            .vli_off
            CALL sub_024059
            .vli_on
            MOV dbl(*SP(#02h)), XAR3
            MOV HI(AC0), T1
            AMAR *SP(#08h), XAR0
            MPYM *AR5, T1, AC0 || MOV *AR3, AR1
            ADD *SP(#08h), AR1, AR1
            MOV AR1, *SP(#08h) || SFTS AC0, #1
            .vli_off
            CALL sub_024059
            .vli_on
            MOV *SP(#08h), AR1 || MOV #2, AR2
            CMP AR1 < AR2, TC1
            BCC loc_0260f5, TC1
            MOV #1, *SP(#08h)
            B loc_026115
loc_0260f2: MOV #0, *SP(#08h)
loc_0260f5: MOV *SP(#08h), T1
            SUB #1, T1
            SFTS AC0, T1, AC0
            MOV #19661, AR1 || MOV HI(AC0), AR2
            CMP AR2 >= AR1, TC1
            MOV #1, *SP(#08h) || MOV HI(AC0), T1
            BCC loc_026115, TC1
            MOV #8192, AR1 || MOV HI(AC0), T1
            MAX AR1, T1
            B loc_026119
loc_026115: MOV #19661, T1
loc_026119: BSET ST1_FRCT
            MPYM *AR5, T1, AC0
            SUB #1, AR6
            MOV HI(AC0), *AR5+
            BCC loc_0260b0, AR6 != #0
loc_026125: MOV dbl(*SP(#02h)), XAR3 || BCLR ST1_FRCT
            ADD #1, *AR3
            AADD #10, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
            NOP_16
sub_02613c: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-2, SP
            MOV AR2, T2
            AMAR *AR0, XAR5
            AMAR *AR1, XAR7
            AMAR *AR7, XAR2 || MOV T0, T3
            AMAR *AR5, XAR1 || MOV T1, AR6
            .vli_off
            CALL sub_02821d
            .vli_on
            AMAR *SP(#00h), XAR0
            AMAR *AR5, XAR2
            AMAR *AR5, XAR1 || MOV T3, T0
            .vli_off
            CALL sub_02a6b1
            .vli_on
            MOV *SP(#00h), AC0 || OR #0, AC0, AC1
            ADD *AR7 << #1, AC0, AC0 || MOV HI(AC1), AR1
            MOV AC0, *SP(#00h)
            BCC loc_0261bc, AR1 == #0
            AMAR *SP(#01h), XAR1
            MOV *SP(#00h), AR0 || MOV T2, T0
            MOV AR6, HI(AC0) || MOV HI(AC1), T1
            .vli_off
            CALL sub_024152
            .vli_on
            AMAR *SP(#01h), XAR0 || MOV T0, HI(AC0)
            .vli_off
            CALL sub_024059
            .vli_on
            AMAR *AR5, XAR1 || MOV T3, T0
            AMAR *AR5, XAR0 || MOV HI(AC0), T1
            .vli_off
            CALL sub_028338
            .vli_on
            MOV *SP(#01h), AR1
            ADD *AR7, AR1, T1
            MOV T1, *AR7
            BCC loc_0261bc, T1 <= #0
            AMAR *AR5, XAR0 || MOV #0, AR2
            AMAR *AR5, XAR1 || MOV T3, T0
            .vli_off
            CALL sub_0282fb
            .vli_on
            MOV #0, *AR7
loc_0261bc: AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0261c8: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-70, SP
            AMAR *AR1, XAR5
            AMAR *AR2, XAR6
            AMAR *SP(#06h), XAR4
            AMAR *AR0, XAR7
            AMAR *SP(#3fh), XAR1
            MOV XAR3, dbl(*SP(#04h))
            MOV *AR5, T1 || MOV T1, T2
            AMAR *SP(#40h), XAR2
            AMAR *SP(#3eh), XAR0
            AMAR *SP(#41h), XAR3
            MOV XAR7, dbl(*SP(#00h))
            MOV T2, *SP(#02h) || MOV T0, T3
            CALL sub_025e54
            MOV *SP(#3fh), T1
            MOV *SP(#3eh), T0
            MOV dbl(*SP(#04h)), XAR1
            AMAR *AR6, XAR0
            CALL sub_025f30
            MOV *SP(#3eh), AR1
            BCC loc_026250, AR1 <= #0
            MOV *SP(#41h), AR1
            AMAR *SP(#45h), XAR3
            AMAR *SP(#44h), XAR2
            AMAR *SP(#42h), XAR0
            MOV *SP(#3eh), T0
            MOV *SP(#3fh), T1
            MOV *SP(#40h), AR4
            MOV AR1, *SP(#00h)
            MOV T3, *SP(#01h)
            AMAR *SP(#43h), XAR1
            CALL sub_025f78
            AMAR *SP(#06h), XAR3
            MOV *SP(#42h), T1
            MOV *SP(#43h), AR2
            MOV *SP(#45h), AR4
            AMAR *AR5, XAR1
            MOV XAR3, dbl(*SP(#00h))
            AMAR *AR7, XAR0
            MOV *SP(#44h), AR3 || MOV T2, T0
            CALL sub_026048
            AMAR *AR5, XAR1
            AMAR *AR7, XAR0
            MOV *SP(#3fh), AR2
            MOV *SP(#3eh), T1 || MOV T2, T0
            CALL sub_02613c
loc_026250: AADD #70, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02625c: CMP T0 >= T1, TC1
            MOV #0, AC1
            BCC loc_02627d, TC1
            SUB T0, T1
            SUB #1, T1, AR3
            MOV AR3, BRC0
            AMAR *(AR0+T0)
            AMAR *(AR1+T0) || RPTBLOCAL loc_026279
               MOV *AR1+, AR3 || MOV *AR0+ << #16, AC0
               CMP AR3 == AR2, TC1
loc_026279:    XCCPART TC1 || MAX AC0, AC1
loc_02627d: MANT AC1, AC1 :: NEXP AC1, T0
            RET
sub_026282: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-8, SP
            AMAR *AR0, XAR5
            AMAR *AR2, XAR6
            MOV XAR1, dbl(*SP(#00h))
            AMAR *AR4, XAR7
            MOV *SP(#10h), AR1
            MOV *SP(#0fh), T3
            MOV AR1, *SP(#05h)
            MOV T1, *SP(#04h)
            MOV XAR3, dbl(*SP(#02h))
            MOV *SP(#0eh), AR1
            AMAR *AR7, XAR0
            MOV AR1, *SP(#06h)
            MOV *SP(#05h), AR2 || MOV T0, T2
            MOV *SP(#06h), T1 || MOV T3, T0
            MOV dbl(*SP(#02h)), XAR1
            CALL sub_02625c
            MOV #256, T1
            AMAR *AR5, XAR0
            MOV T0, *SP(#07h) || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV T3, CDP
            MOV mmap(@CDP), AR2
            MOV *SP(#06h), AR1
            CMP AR2 >= AR1, TC1
            MOV #0, T3
            BCC loc_026397, TC1
            MOV mmap(@CDP), AR3
            SUB AR3, AR1
            SUB #1, AR1
            MOV AR1, BRC0
            MOV dbl(*SP(#02h)), XAR2
            ADD mmap(@CDP), AR2, AR2
            RPTB loc_026393
               MOV *SP(#05h), AR3
               MOV *AR2, AR1
               CMP AR1 != AR3, TC1
               BCC loc_02638e, TC1
               MOV mmap(@CDP), T0
               ADD #1, T0, AR0
               MOV *AR6(T0) << #16, AC0
               SFTS AC0, #-6, AC1
               MOV AR0, HI(AC0) || BSET ST1_FRCT
               MPY T2, AC0, AC0
               ADD AC0 << #9, AC1 || MOV #0, AC0
               OR #32768, AC0, AC0
               ADD AC1, AC0
               SFTS AC0, #-9, AC1
               AMAR *AR7, XAR4 || MOV HI(AC1), AR1
               ADD mmap(@CDP), AR4, AR4
               MOV #384, AC2 || MOV AR1, HI(AC3)
               MOV *SP(#07h), AR1 || OR #0, AC3, AC1
               NEG AR1, T1 || SFTS AC2, #16, AC2
               XCCPART AC1 < #0 || ADD #1 << #16, AC3, AC1
               SUB AC1 << #9, AC0
               SFTS AC0, #6, AC0
               MPYK #512, AC0, AC0
               MOV #0, AC1
               CMP AC0 < AC1, TC1
               MOV #-1 << #16, AC1
               XCCPART TC1 || NEG AC0, AC0
               AND AC1, AC0
               XCCPART TC1 || NEG AC0, AC0
               MOV #511 << #16, AC1 || SFTL AR0, #1
               AND AC1, AC0
               AMAR *AR5, XAR3 || MOV HI(AC0), T0
               AMAR *(#word_e6fa), XAR1
               AADD AR0, AR3 || OR #0, AC0, AC1
               MPYM *AR4, *AR1(T0), AC0 || MOV HI(AC1), T0
               MOV #511 << #16, AC1 || SFTS AC0, T1, AC0
               OR #65535, AC1, AC1
               MOV HI(AC0), *AR3 || MOV T0, HI(AC0)
               ADD AC2, AC0
               AND AC0, AC1
               MOV HI(AC1), T0
               MPYM *AR4, *AR1(T0), AC0
               SFTS AC0, T1, AC0
               MOV HI(AC0), *AR3(short(#1))
               ADD #1, T3
loc_02638e:    MOV mmap(@CDP), AR1
               ADD #1, AR1
loc_026393:    AMAR *AR2+ || MOV AR1, CDP
loc_026397: MOV dbl(*SP(#00h)), XAR3
            MOV *SP(#04h), AR1
            ADD *SP(#07h), AR1, AR1
            ADD #23, AR1, T0
            MOV T0, *AR3
            XCC T3 <= #0
            MOV dbl(*SP(#00h)), XAR3
            XCC T3 <= #0 || MOV #-32, *AR3
            BCC loc_0263c4, T3 <= #0
            MOV #0, AR1
            BCLR ST1_FRCT
            AMAR *AR5, XAR0 || MOV #8, T1
            .vli_off
            CALL sub_025d22
            .vli_on
            MOV dbl(*SP(#00h)), XAR3
            MOV T0, *AR3
loc_0263c4: BCLR ST1_FRCT
            MOV *AR5, AR1 || BCLR ST1_SATD
            MOV AR1, *AR5(#0100h)
            MOV T3, T0
            AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0263dc: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-14, SP
            MOV AC0, dbl(*SP(#00h)) || MOV AR3, AR5
            MOV T1, *SP(#08h) || MOV AR2, T2
            BCC loc_026503, AR5 <= #0
            MOV T0, HI(AC0) || BSET ST1_FRCT
            MPY T0, AC0, AC1 || MOV #0, T1
            MANT AC1, AC1 :: NEXP AC1, T1 || XCCPART AC1 != #0
            MOV T2, HI(AC0)
            MPY T2, AC0, AC0 || MOV #0, T3
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            MOV T3, AR2
            MOV HI(AC1), T3
            MPY T3, AC0, AC0 || MOV #0, T3
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            MOV HI(AC0), *SP(#09h) || MOV T0, HI(AC0)
            MPY T2, AC0, AC0 || MOV #-8, AR3
            ADD T1, AR3 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MOV HI(AC0), *SP(#0bh) || MOV T2, AC0
            MOV XAR1, dbl(*SP(#06h)) || SFTS AC0, #16, AC0
            MOV AC0, dbl(*SP(#02h)) || ADD AR2, AR3
            ADD T3, AR3 || MOV #0, AC0
            ADD #30, AR3, AR2
            MOV AR2, *SP(#0ah) || MOV #11, AR2
            MOV AC0, dbl(*SP(#04h)) || ADD T1, AR2
            MOV AR2, *SP(#0ch)
            MOV XAR0, XAR6
loc_02644d: MOV dbl(*SP(#04h)), AC0 || BCLR ST1_SATD
            MOV #1 << #16, AC1
            ADD AC1, AC0
            MOV AC0, dbl(*SP(#04h)) || BSET ST1_FRCT
            SUB dbl(*SP(#00h)), AC0, AC0 || MOV #0, T3
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            MPY T2, AC0, AC0 || MOV #0, T0
            MANT AC0, AC0 :: NEXP AC0, T0 || XCCPART AC0 != #0
            MOV *SP(#0ah), AR1
            MOV AR1, *SP(#0dh)
            MOV HI(AC0), AR7 || MOV #15, AR1
            AMAR *SP(#0dh), XAR2
            MOV AR7, HI(AC0)
            MPYM *SP(#08h), AC0, AC0 || ADD T3, AR1
            ADD T0, AR1
            ADD #16, AR1, T3
            EXP AC0, T1
            MOV T3, AR1
            SUB T1, AR1 || SFTS AC0, T1, AC0
            MOV *SP(#09h), T0 || MOV HI(AC0), AR0
            MOV *SP(#0dh), T1 || BCLR ST1_FRCT
            SUB #4, AR1
            .vli_off
            CALL sub_0241d2
            .vli_on
            AMAR *SP(#0dh), XAR0
            MOV T0, HI(AC0)
            .vli_off
            CALL sub_024059
            .vli_on
            MOV *SP(#0dh), AR1 || MOV #0, T1
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            AMAR *SP(#0dh), XAR2
            MOV *SP(#0ch), T1 || ADD T1, AR1
            MOV AR1, *SP(#0dh)
            MOV *SP(#0bh), T0 || MOV HI(AC0), AR0
            .vli_off
            CALL sub_0241d2
            .vli_on
            AMAR *SP(#0dh), XAR1
            MOV AR7, HI(AC0) || MOV T0, T1
            MOV *SP(#0dh), AR0 || MOV T3, T0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#0dh), T3 || MOV T0, T1
            SUB #15, T3 || MOV T1, HI(AC0)
            MOV *SP(#0dh), AR1 || SFTS AC0, T3, AC1
            MOV #0, T3 || MOV T2, HI(AC0)
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            SUB dbl(*SP(#02h)), AC1, AC1
            XCCPART AC1 >= #0 || ADD #15, T3, AR1
            XCCPART AC1 >= #0 || MOV HI(AC0), T1
            MOV T1, *AR6+
            MOV dbl(*SP(#06h)), XAR3
            MOV AR1, *AR3+ || SUB #1, AR5
            MOV XAR3, dbl(*SP(#06h))
            BCC loc_02644d, AR5 != #0
loc_026503: AADD #14, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02650f: BCC loc_02653d, AR2 <= #0
            SUB #1, AR2
            MOV AR2, BRC0
            MOV #0, AC2 || MOV T0, HI(AC0)
            BSET ST1_SATD
            RPTBLOCAL loc_026538 || SFTS AC0, T1, AC3
               MOV HI(AC2), T0
               MOV *AR1(short(#1)) << #16, AC1 || BCLR ST1_FRCT
               MOV dbl(*AR1+), AC0 || SFTL AC1, #0, AC1
               MPY T0, AC1, AC1
               SFTS AC1, #-15, AC1 || BSET ST1_FRCT
               MAC AC0, T0, AC1, AC1
               ADD dbl(*AR0), AC1, AC1
loc_026538:    MOV AC1, dbl(*AR0+) || ADD AC3, AC2
loc_02653d: BCLR ST1_SATD
            BCLR ST1_FRCT
            RET
sub_026543: BCC loc_026573, AR2 <= #0
            SUB #1, AR2
            MOV AR2, BRC0
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC3
            BSET ST1_SATD
            RPTBLOCAL loc_02656e || MOV #0, AC0
               MOV *AR1(short(#1)) << #16, AC2 || MOV HI(AC0), T1
               MOV dbl(*AR1+), AC1 || BSET ST1_FRCT
               MAS T1, AC1, AC1
               SFTL AC2, #0, AC2 || BCLR ST1_FRCT
               MPY T1, AC2, AC2
               SFTS AC2, #-15, AC2
               SUB AC2, AC1
               ADD dbl(*AR0), AC1, AC1
loc_02656e:    MOV AC1, dbl(*AR0+) || ADD AC3, AC0
loc_026573: BCLR ST1_SATD
            RET
sub_026577: PSH T2
            MOV *AR0 << #16, AC1
            MOV dbl(*AR0), AC0 || MOV #15, T1
            SUB AC1, AC0
            SFTS AC0, #15, AC0
            AND #255 << #16, AC1, AC0 || MOV HI(AC0), T2
            MOV HI(AC0), T0 || MOV T0, HI(AC1)
            SFTS AC1, #-11, AC1
            ADD dbl(*AR0), AC1, AC1
            MOV *AR1(T0) << T1, AC0 || AMAR *AR1+
            MOV *AR1(T0) << T1, AC1 || MOV AC1, dbl(*AR0)
            SUB AC0, AC1 || BSET ST1_FRCT
            MAC AC1, T2, AC0, AC0
            POP T2
            RET || BCLR ST1_FRCT
sub_0265ac: SFTS AC1, #-6, AC1
            SFTS AC1, #10, AC1
            ABS AC1, AC1
            MOV HI(AC1), T0 || SFTL AC0, #16, AC3
            AMAR *(#word_e6fa), XAR3
            ADD #1, T0, AR1
            MOV *AR3(T0), T1 || SFTL AC1, #16, AC1
            AND #511, AR1, T0 || MOV T1, HI(AC2)
            MAS T1, AC1, AC2
            MACM *AR3(T0), AC1, AC2
            MOV #1 << #15, AC2 || MOV HI(AC2), T0
            SUB T0, AC2
            SFTS AC2, #15, AC2
            MOV HI(AC2), T0 || MOV AC0, AC2
            MPY T0, AC3, AC0
            BSET ST1_FRCT || SFTS AC0, #-15, AC0
            MAC AC2, T0, AC0, AC0 || BCLR ST1_FRCT
            RET
sub_0265ef: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-48, SP
            MOV XAR1, dbl(*SP(#00h))
            AMAR *AR0, XAR5
            MOV *SP(#38h), AR1
            MOV XAR2, dbl(*SP(#02h))
            MOV T0, *SP(#2eh)
            MOV AR1, *SP(#2fh)
            AMAR *SP(#06h), XAR0
            AMAR *SP(#1ah), XAR1
            MOV XAR3, dbl(*SP(#04h))
            MOV *SP(#37h), AR2
            MOV *SP(#36h), T0 || MOV T1, T3
            MOV *SP(#2fh), AR3 || MOV AR4, T1
            CALL sub_0263dc
            MOV *SP(#2fh), AR1
            BCC loc_026642, AR1 <= #0
            AMAR *SP(#1ah), XAR7
            AMAR *SP(#06h), XAR6
            MOV AR1, T2
loc_02662b: MOV *SP(#2eh), AR1
            MOV dbl(*SP(#04h)), XAR2
            MOV *AR7+, T1
            AMAR *AR5, XAR0
            MOV *AR6+, T0 || MOV T3, AR3
            .vli_off
            CALL sub_0231c1
            .vli_on
            SUB #1, T2
            BCC loc_02662b, T2 != #0
loc_026642: MOV *SP(#2fh), T0
            SUB #1, T0
            MOV dbl(*SP(#00h)), XAR2
            AMAR *SP(#06h), XAR3
            MOV *AR3(T0), *AR2
            MOV dbl(*SP(#02h)), XAR2
            AMAR *SP(#1ah), XAR3
            MOV *AR3(T0), *AR2
            AADD #48, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026664: MOV *AR1, *AR0
            MOV *AR1(short(#1)), AR2
            MOV AR2, *AR0(short(#1))
            MOV *AR1(short(#3)), AR2
            MOV AR2, *AR0(short(#3))
            MOV *AR1(short(#5)), AR2
            MOV AR2, *AR0(short(#5))
            MOV *AR1(#0008h), AR2
            MOV AR2, *AR0(#0008h)
            MOV *AR1(short(#2)), AR2
            MOV AR2, *AR0(short(#2))
            MOV *AR1(short(#4)), AR2
            MOV AR2, *AR0(short(#4))
            MOV *AR1(short(#6)), AR2 || MOV #0, T0
            MOV AR2, *AR0(short(#6))
            MOV *AR1(short(#7)), AR1
            MOV AR1, *AR0(short(#7))
            RET
sub_02668f: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR5 || PSHBOTH XAR7
            AADD #-6, SP
            AMAR *AR2, XAR6
            MOV T0, *SP(#00h)
            AMAR *AR0, XAR7
            AMAR *AR6, XAR1
            MOV *SP(#00h), T1
            AMAR *AR5, XAR0
            MOV #24, T0
            .vli_off
            CALL sub_028f54
            .vli_on
            MOV dbl(*AR5), AC0
            SFTS AC0, #-1, AC0
            .vli_off
            CALL sub_02a509
            .vli_on
            MOV AC0, dbl(*SP(#02h))
            MOV dbl(*SP(#02h)), AC0
            MOV #23, T0
            .vli_off
            CALL sub_02b624
            .vli_on
            MOV dbl(*SP(#02h)), AC0 || AND #1, T0, AR1
            MOV #2, AR2 || SFTS AC0, #1, AC1
            MOV *SP(#00h), AR1 || MOV AR1, AC0
            CMP AR1 < AR2, TC1 || OR AC1, AC0
            MOV AC0, dbl(*SP(#02h)) || MOV #0, T3
            BCC loc_026755, TC1
            MOV dbl(*AR5), AC1
            MOV dbl(*SP(#02h)), AC0
            CMP AC0 == AC1, TC1
            BCC loc_026755, TC1
            MOV dbl(*SP(#02h)), AC0
            AMAR *AR6, XAR0
            MOV #24, T0 || MOV AR1, T1
            .vli_off
            CALL sub_028fc3
            .vli_on
            MOV T0, T3 || MOV #7, T2
            AADD #2, AR5
loc_02670b: MOV dbl(*AR5+), AC0
            SFTS AC0, #-1, AC0
            .vli_off
            CALL sub_02a509
            .vli_on
            MOV AC0, dbl(*SP(#04h))
            MOV dbl(*SP(#04h)), AC0
            MOV #23, T0
            .vli_off
            CALL sub_02b624
            .vli_on
            MOV dbl(*SP(#04h)), AC0 || AND #1, T0, AR1
            SFTS AC0, #1, AC1
            MOV AR1, AC0
            OR AC1, AC0
            MOV AC0, dbl(*SP(#04h))
            MOV *SP(#00h), T1
            MOV dbl(*SP(#04h)), AC0
            AMAR *AR6, XAR0
            MOV #24, T0
            .vli_off
            CALL sub_028fc3
            .vli_on
            CMP T0 >= T3, TC1
            BCC loc_026750, TC1
            MOV dbl(*SP(#04h)), AC0
            MOV AC0, dbl(*SP(#02h)) || MOV T0, T3
loc_026750: SUB #1, T2
            BCC loc_02670b, T2 != #0
loc_026755: MOV T3, *AR7
            MOV dbl(*SP(#02h)), AC0
            AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026766: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-32, SP
            MOV XAR3, dbl(*SP(#14h))
            MOV XAR0, dbl(*SP(#18h))
            MOV dbl(*SP(#18h)), XAR3
            MOV XAR1, dbl(*SP(#16h))
            MOV dbl(*AR3), XAR3
            MOV XAR3, dbl(*SP(#1ah))
            MOV dbl(*SP(#16h)), XAR3
            MOV dbl(*SP(#14h)), XAR7
            AMAR *AR2, XAR5 || MOV #0, T3
            MOV XAR4, dbl(*SP(#12h)) || MOV T0, T2
            MOV dbl(*AR3), XAR6
loc_026795: AMAR *SP(#00h), XAR0
            AMAR *SP(#02h), XAR1
            AMAR *AR6, XAR2 || MOV T2, T0
            CALL sub_02668f
            MOV *SP(#00h), AR1
            ADD *AR5, AR1, AR1
            MOV AC0, dbl(*SP(#1ch))
            MOV AR1, *AR5
            BCC loc_0267b6, T3 != #0
            MOV dbl(*SP(#12h)), XAR3
            MOV *SP(#00h), AR1
            MOV AR1, *AR3(short(#6))
loc_0267b6: MOV dbl(*SP(#02h)), AC0
            MOV dbl(*SP(#1ch)), AC1
            MOV #24, T0 || XOR AC1, AC0
            .vli_off
            CALL sub_02b624
            .vli_on
            MOV T0, *AR7+
            MOV dbl(*SP(#1ch)), AC0
            SFTS AC0, #-12, AC0
            AND #4095, AC0, AC0
            MOV AC0, *SP(#1eh)
            BCC loc_0267ef, T3 != #0
            AMAR *AR6, XAR0
            MOV *SP(#1eh), T1 || MOV #1, AC0
            MOV #24, T0
            AADD #24, AR0 || SFTS AC0, T2, AC0
            SUB #1, AC0, AR1
            .vli_off
            CALL sub_02b566
            .vli_on
loc_0267ef: MOV dbl(*SP(#1ah)), XAR0
            MOV *SP(#1eh), T0 || MOV #12, T1
            .vli_off
            CALL sub_02a734
            .vli_on
            MOV #2, AR1
            ADD #1, T3
            CMP T3 < AR1, TC1
            MOV XAR0, dbl(*SP(#1ah)) || AADD #24, AR6
            BCC loc_026795, TC1
            MOV dbl(*SP(#14h)), XAR3
            MOV *AR3(short(#1)), AR1
            MOV dbl(*SP(#12h)), XAR3
            MOV AR1, *AR3(short(#7))
            MOV dbl(*SP(#18h)), XAR3
            MOV dbl(*SP(#1ah)), XAR2
            MOV XAR2, dbl(*AR3)
            MOV dbl(*SP(#16h)), XAR3
            MOV XAR6, dbl(*AR3)
            AADD #32, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02682f: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AMAR *AR1, XAR7
            AMAR *AR0, XAR5 || MOV #17, BRC0
            AMAR *AR7, XAR3 || MOV T1, T2
            MOV T0, *AR5(short(#2)) || MOV #0, AR1
            MOV #0, *AR5(#0008h)
            MOV #0, *AR5(short(#3)) || RPTBLOCAL loc_026854
               ADD *AR3+, AR1, AR1
loc_026854:    MOV AR1, *AR5(short(#3))
            MOV #48, T0 || MOV AR1, HI(AC0)
            .vli_off
            CALL sub_024538
            .vli_on
            MOV #-23592 << #16, AC0 || MOV AC0, T1
            SFTL AC0, #0, AC0
            MOV #-656 << #16, AC1 || MPY T1, AC0, AC0
            SFTL AC1, #0, AC1
            SFTS AC0, #-6, AC0 || MOV #2, AR1
            MACM *AR5, AC1, AC0 || CMP T2 >= AR1, TC1
            MOV HI(AC0), AR2
            MOV AR2, *AR5
            BCC loc_0268b4, TC1
            MOV *AR7, AR1 || MOV #4, AR3
            CMP AR1 >= AR3, TC1
            BCC loc_02689e, TC1
            MOV #2, AR3
            CMP AR1 < AR3, TC1
            BCC loc_0268a4, TC1
            MOV *AR5(short(#5)), AR1
            MOV *AR5(short(#3)), AR3
            CMP AR3 < AR1, TC1
            BCC loc_0268a4, TC1
loc_02689e: OR #1, *AR5(#0008h)
loc_0268a4: MOV *AR5(short(#5)) << #16, AC0
            MPYK #328, AC0, AC0
            SFTS AC0, #15, AC1
            MOV #983 << #16, AC0
            B loc_0268fb
loc_0268b4: MOV *AR7, AR1 || MOV #2, AR3
            CMP AR1 < AR3, TC1
            BCC loc_0268ec, TC1
            MOV #1, AC0
            MOV *AR5(short(#4)), AR1 || SFTS AC0, T2, AC0
            SUB #1, AC0, T1
            MOV AR1, HI(AC0)
            MPY T1, AC0, AC0
            SFTS AC0, #16, AC1
            MPY T1, AC1, AC0
            MOV *AR5(short(#2)), AR4 || MOV AC0, AR3
            CMP AR4 < AR3, TC1
            BCC loc_0268ee, TC1
            MOV *AR5(short(#5)), AR3
            MOV *AR5(short(#3)), AR4
            CMP AR4 < AR3, TC1
            XCC !TC1
            OR #1, *AR5(#0008h)
            B loc_0268ee
loc_0268ec: MOV *AR5(short(#4)), AR1
loc_0268ee: MOV AR1, HI(AC0)
            MPYK #328, AC0, AC0
            SFTS AC0, #15, AC1
            MOV #1638 << #16, AC0
loc_0268fb: ADD AC1, AC0
            MOV HI(AC0), AR1
            CMP AR1 >= AR2, TC1
            SFTS AR1, #-1
            MOV AR1, *AR5(short(#1))
            XCC !TC1
            OR #3, *AR5(#0008h)
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_026916: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            MOV #18, T1
            AMAR *AR0, XAR5
            AADD #-23, SP
            AMAR *AR2, XAR7
            AMAR *SP(#05h), XAR0
            MOV XAR1, dbl(*SP(#02h))
            MOV #0, *SP(#04h) || MOV T0, T2
            MOV XAR5, dbl(*SP(#00h)) || MOV #0, T0
            MOV #0, *AR7(short(#6))
            MOV #0, *AR7(short(#7))
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *SP(#05h), XAR3
            AMAR *SP(#04h), XAR2
            AMAR *SP(#00h), XAR0
            AMAR *SP(#02h), XAR1
            AMAR *AR7, XAR4 || MOV T2, T0
            CALL sub_026766
            MOV dbl(*SP(#00h)), XAR3
            MOV XAR5, AC1
            MOV XAR3, AC0
            MOV #48, AR1 || SUB AC1, AC0
            MOV AC0, AR3
            CMP AR3 >= AR1, TC1
            BCC loc_0269a2, TC1
            SUB AR3, AR1
            SUB #1, T2, T3
            BCC loc_026990, AR1 <= #0
            MOV dbl(*SP(#00h)), XAR3
            MOV XAR3, AC0
            MOV #47, AR4 || SUB AC1, AC0
            SUB AC0, AR4
            MOV AR4, BRC0
            MOV dbl(*SP(#02h)), XAR2
            RPTBLOCAL loc_02698e || NEG T3, T1
               MOV *AR2+, AC0
               SFTS AC0, T1, AC0
loc_02698e:    MOV AC0, *AR3+
loc_026990: MOV dbl(*SP(#00h)), XAR3
            MOV XAR3, dbl(*SP(#00h)) || AADD AR1, AR3
            MOV dbl(*SP(#02h)), XAR3
            MOV XAR3, dbl(*SP(#02h)) || AADD AR1, AR3
loc_0269a2: MOV *SP(#04h), T0
            AMAR *SP(#05h), XAR1
            AMAR *AR7, XAR0 || MOV T2, T1
            CALL sub_02682f
            AADD #23, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0269b9: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-193, mmap(@SP)
            AMAR *AR2, XAR5
            AMAR *AR0, XAR7 || AND #12, T1, AR2
            AMAR *SP(#00h), XAR6 || MOV T0, T2
            BCC loc_0269f8, AR2 != #0
            AMAR *SP(#00h), XAR0 || MOV #12, T1
            MOV #72, T0
            .vli_off
            CALL sub_02b4d3
            .vli_on
            AMAR *SP(#00h), XAR1
            AMAR *AR5, XAR2
            AMAR *AR7, XAR0 || MOV T2, T0
            CALL sub_026916
            MOV *AR5(#0008h), T0
            B loc_026a07
loc_0269f8: MOV #4, T0
            MOV #0, *AR5(short(#3))
            MOV #0, *AR5(short(#2))
            MOV #0, *AR5(short(#1))
            MOV T0, *AR5(#0008h)
loc_026a07: ADD #193, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_026a16: MOV #0, *AR0
            MOV #0, *AR0(short(#1))
            MOV #0, *AR0(short(#2))
            MOV #0, *AR0(short(#3))
            MOV #0, T0
            MOV #0, *AR0(#0008h)
            MOV #8, *AR0(short(#5))
            MOV #10, *AR0(short(#4))
            RET
sub_026a31: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR5 || PSHBOTH XAR7
            AADD #-2, SP
            AMAR *AR4, XAR6
            MOV XAR0, dbl(*SP(#00h))
            BCC loc_026a6f, T0 <= #0
            SUB #1, T0, AR4
            MOV AR4, BRC0
            RPTBLOCAL loc_026a6d
               MOV *AR2+, AC0
               SUB AC0, *AR3+, AC1 || MOV #0, AC0
               OR #32768, AC0, AC0
               CMP AC1 >= AC0, TC1
               XCCPART !TC1 || MOV #-32767, AC0
               XCCPART !TC1 || MAX AC1, AC0
               XCCPART TC1 || MOV #32767, AC0
loc_026a6d:    MOV AC0, *AR1+
loc_026a6f: MOV dbl(*SP(#00h)), XAR7
            MOV #4, T2
loc_026a74: MOV *AR6+, T3 || MOV #6, T1
            AMAR *AR5, XAR0 || MOV T3, T0
            .vli_off
            CALL sub_02aa2c
            .vli_on
            MOV *AR5(short(#1)), AR1
            MOV *AR5, *AR7
            AMAR *AR5, XAR0 || MOV #0, T0
            SUB #6, T3, T1
            MOV AR1, *AR7(short(#1)) || AADD #6, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            SUB #1, T2
            AADD #2, AR7 || AADD T3, AR5
            BCC loc_026a74, T2 != #0
            MOV dbl(*SP(#00h)), XAR3
            MOV #3, BRC0
            RPTB loc_026b06
               MOV #-19196 << #16, AC0
               MOV *AR3, AR1
               SFTL AC0, #0, AC1
               MOV *AR3(short(#1)), T1 || MOV AR1, HI(AC0)
               SFTS AC0, #-1, AC0
               MAC AC1, T1, AC0, AC0
               MOV #0, AC0 || SFTS AC0, #-15, AC1
               OR #32768, AC0, AC0
               CMP AC1 >= AC0, TC1
               XCCPART !TC1 || MOV #-32767, AC0
               XCCPART !TC1 || MAX AC1, AC0
               XCCPART TC1 || MOV #32767, AC0
               MOV AC0, *AR3
               MOV #-19196 << #16, AC0
               SFTL AC0, #0, AC1
               MOV AR1, HI(AC0)
               SFTS AC0, #-1, AC0
               MAS T1, AC1, AC0
               MOV #0, AC0 || SFTS AC0, #-15, AC1
               OR #32768, AC0, AC0
               CMP AC1 >= AC0, TC1
               XCCPART !TC1 || MOV #-32767, AC0
               XCCPART !TC1 || MAX AC1, AC0
               XCCPART TC1 || MOV #32767, AC0
loc_026b06:    MOV AC0, *AR3(short(#1)) || AADD #2, AR3
            MOV dbl(*SP(#00h)), XAR0
            MOV #8, T1
            MOV #8, T0
            .vli_off
            CALL sub_02aa2c
            .vli_on
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026b22: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-6, SP
            AMAR *AR1, XAR7
            AMAR *(#word_ec42), XAR6
            MOV XAR2, dbl(*SP(#02h)) || MOV #0, AR1
            MOV AR1, *SP(#04h)
loc_026b3f: MOV *AR7+, T3
            SUB #2, T3, T0
            MOV *AR6+, T2
            BCC loc_026b8d, T0 <= #0
            MOV *SP(#04h) << #2, AC0
            MOV AC0, AR1
            AMAR *(#word_d880), XAR4
            MOV #4, AR2
            MOV *SP(#04h), AR1 || AADD AR1, AR4
            AMAR *AR5, XAR0 || MOV #4, AR3
            MOV AR1, AC0 || CMP AR2 >= T0, TC1
            MOV dbl(*SP(#02h)), XAR2
            AADD #2, AR0 || SFTS AC0, #6, AC1
            XCCPART !TC1 || MOV #4, T0
            MOV #(word_e09a >> 16) << #16, AC0
            OR #(word_e09a & 0xffff), AC0, AC0 || MOV T2, T1
            MOV XAR2, dbl(*SP(#00h)) || ADD AC1, AC0
            MOV AC0, XAR1 || MOV #4, AR2
            .vli_off
            CALL sub_028756
            .vli_on
            B loc_026bb3
loc_026b8d: MOV #16, AR1
            CMP AR1 >= T2, TC1
            BCC loc_026ba8, TC1
            MOV dbl(*SP(#02h)), XAR0
            MOV #0, T1
            MOV #16, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            SUB #16, T2, T2
loc_026ba8: MOV dbl(*SP(#02h)), XAR0
            MOV T2, T0 || MOV #0, T1
            .vli_off
            CALL sub_02b60b
            .vli_on
loc_026bb3: ADD #1, *SP(#04h)
            MOV *SP(#04h), AR1 || MOV #4, AR2
            CMP AR1 < AR2, TC1
            AADD T3, AR5
            BCC loc_026b3f, TC1
            AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026bd1: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR1, XAR6 || PSHBOTH XAR7
            AADD #-22, SP
            MOV *SP(#1eh), AR1
            MOV AR1, *SP(#12h)
            AMAR *AR3, XAR7
            MOV *SP(#1dh), AR1
            MOV T1, *SP(#0eh)
            MOV dbl(*SP(#20h)), XAR3
            MOV AR1, *SP(#13h)
            AMAR *AR2, XAR5
            MOV T0, *SP(#0fh)
            MOV *AR0(short(#1)), T1
            AMAR *AR0, XAR1
            MOV *SP(#1ch), T3
            MOV XAR3, dbl(*SP(#10h)) || AADD #10, AR1
            AMAR *AR6, XAR0 || MOV AR4, AR2
            .vli_off
            CALL sub_0277d8
            .vli_on
            XCCPART T3 == #0 || MOV #0, T2
            BCC loc_026c34, T3 == #0
            MOV *SP(#13h), T0
            MOV *AR5(T0) << #16, AC0
            MOV *SP(#12h), T0
            MOV *AR5(T0) << #16, AC0 || SFTS AC0, #-1, AC1
            MOV *SP(#13h), T0
            SFTS AC0, #-1, AC0
            MOV *AR6(T0) << #16, AC1 || ADD AC1, AC0
            MOV *SP(#12h), T0
            SFTS AC1, #-1, AC1
            MOV *AR6(T0) << #16, AC1 || SUB AC1, AC0
            SFTS AC1, #-1, AC1
            SUB AC1, AC0
            MOV HI(AC0), T2
loc_026c34: AMAR *SP(#0ah), XAR0
            MOV *SP(#0fh), T0
            .vli_off
            CALL sub_0277bf
            .vli_on
            AMAR *SP(#0ah), XAR4
            MOV *SP(#0fh), T0
            AMAR *SP(#02h), XAR0
            AMAR *AR5, XAR3
            AMAR *AR6, XAR2
            AMAR *AR5, XAR1
            CALL sub_026a31
            AMAR *(#word_d878), XAR3
            MOV #0, *SP(#02h)
            MOV XAR3, dbl(*SP(#14h))
            MOV XAR7, dbl(*SP(#00h))
            MOV dbl(*SP(#14h)), XAR4
            AMAR *(#word_ec3f), XAR6
            AMAR *SP(#03h), XAR0 || MOV #9, AR2
            MOV *AR6(short(#1)), T1 || MOV #3, T0
            AMAR *(#word_d89a), XAR1
            AMAR *AR4+ || MOV #3, AR3
            .vli_off
            CALL sub_028756
            .vli_on
            MOV XAR7, dbl(*SP(#00h))
            MOV dbl(*SP(#14h)), XAR4
            MOV #4, AR3
            MOV #7, AR2
            AMAR *SP(#06h), XAR0 || MOV #4, T0
            AMAR *(#word_de9a), XAR1
            MOV *AR6(short(#2)), T1 || AADD #4, AR4
            .vli_off
            CALL sub_028756
            .vli_on
            AMAR *SP(#0ah), XAR1
            AMAR *AR5, XAR0
            AMAR *AR7, XAR2
            CALL sub_026b22
            MOV *SP(#0fh), T0
            MOV *SP(#0eh), T1
            AMAR *SP(#02h), XAR1
            AMAR *SP(#0ah), XAR3
            AMAR *AR5, XAR2
            AMAR *AR5, XAR0
            .vli_off
            CALL sub_027841
            .vli_on
            MOV dbl(*SP(#10h)), XAR3
            MOV AC0, dbl(*AR3)
            BCC loc_026cdd, T3 == #0
            MOV *SP(#13h), T0
            MOV *AR5(T0) << #16, AC0
            MOV *SP(#12h), T0
            SFTS AC0, #-1, AC1
            MOV T2, HI(AC0)
            MOV *AR5(T0) << #16, AC1 || SUB AC1, AC0
            SFTS AC1, #-1, AC1
            SUB AC1, AC0
            MOV HI(AC0), T2
loc_026cdd: AADD #22, SP
            MOV T2, T0 || POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026ceb: PSH T2
            PSHBOTH XAR5
            AMAR *AR4, XAR5 || MOV AR3, AR4
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR5, XAR3
            AADD #-71, SP
            AMAR *AR1, XAR5 || MOV T0, T2
            AMAR *AR2, XAR7
            BCC loc_026d1a, T2 == #0
            MOV dbl(*AR3), XAR2
            MOV *(#word_ec3f), AC1
            MOV XAR2, AC0
            ADD AC1, AC0
            MOV AC0, dbl(*AR3)
            MOV XAR2, dbl(*SP(#42h))
loc_026d1a: MOV T2, *SP(#00h)
            AMAR *SP(#06h), XAR2
            AMAR *AR5, XAR6
            MOV T1, *SP(#01h)
            MOV *AR5(short(#2)), T0
            MOV AR4, *SP(#02h)
            MOV XAR2, dbl(*SP(#04h))
            AMAR *SP(#09h), XAR1
            MOV *AR7(short(#1)), T1 || AADD #8, AR6
            MOV #26214, AR4
            AMAR *AR6, XAR2
            CALL sub_026bd1
            MOV T0, *SP(#08h)
            BCC loc_026d98, T2 == #0
            MOV *AR5(short(#2)), T0
            AMAR *SP(#08h), XAR0
            AMAR *SP(#42h), XAR1
            MOV *(#word_ec3f), T1
            .vli_off
            CALL sub_02ae60
            .vli_on
            MOV *SP(#08h), AR1
            MOV AR1, *AR7(short(#1))
            MOV dbl(*SP(#06h)), AC0
            MOV *AR5(short(#2)), T0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV AC0, dbl(*SP(#44h))
            NOP
            MOV *AR5(short(#2)), T0
            MOV dbl(*SP(#06h)), AC0 || BSET ST1_FRCT
            MACM *SP(#08h), T0, AC0, AC0
            MOV AC0, dbl(*SP(#06h)) || BCLR ST1_FRCT
            .vli_off
            CALL sub_024538
            .vli_on
            MOV *AR5(short(#2)), AR1
            SUB *SP(#45h), AC0, AC0
            MOV AC0, *SP(#08h)
            BCC loc_026d98, AR1 <= #0
            MOV *SP(#08h) << #16, AC0 || MOV #0, AR1
            AMAR *AR6, XAR3
loc_026d88: MOV *AR3 << #16, AC1
            ADD AC0, AC1
            MOV HI(AC1), *AR3+
            MOV *AR5(short(#2)), AR2 || ADD #1, AR1
            CMP AR1 < AR2, TC1
            BCC loc_026d88, TC1
loc_026d98: MOV *AR5(short(#2)), T0
            AMAR *SP(#09h), XAR1
            AMAR *AR6, XAR0
            .vli_off
            CALL sub_0277fa
            .vli_on
            AADD #71, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_026db0: MOV T0, AR2
            MOV #0, AC1
            BCC loc_026dca, AR2 <= #0
            SUB #1, AR2
            MOV AR2, BRC0
            RPTBLOCAL loc_026dc6 || MOV #0, T0
               MOV *AR1+, AR2 || MOV *AR0+ << #16, AC0
               CMP AR2 == T0, TC1
loc_026dc6:    XCCPART TC1 || MAX AC0, AC1
loc_026dca: MANT AC1, AC1 :: NEXP AC1, T0
            RET
sub_026dcf: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-2, SP
            MOV T0, AR6
            MOV AR6, HI(AC1) || MOV T1, T3
            MANT AC1, AC1 :: NEXP AC1, T2
            AMAR *AR1, XAR5 || MOV T3, HI(AC0)
            AMAR *SP(#00h), XAR1
            MANT AC0, AC0 :: NEXP AC0, T0
            AMAR *AR0, XAR7 || MOV HI(AC1), T1
            MOV T2, AR0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            SUB #15, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC3 || MOV #2, AR1
            CMP AR6 < AR1, TC1
            MOV *AR5, *AR7 || OR #0, AC3, AC2
            BCC loc_026e3a, TC1
            SUB #2, AR6, AR1
            MOV AR1, BRC0
            AMAR *AR7, XAR3 || BSET ST1_FRCT
            AMAR *AR5(#0001h), XAR2
            MOV HI(AC2), T0 || SFTL AC2, #16, AC0
            AMAR *AR3+ || RPTBLOCAL loc_026e35
               SFTL AC0, #-1
               MOV *AR5(T0) << #16, AC1 || ADD AC3, AC2
               MACM *AR2(T0), AC0, AC1
               MASM *AR5(T0), AC0, AC1 || MOV HI(AC2), T0
loc_026e35:    MOV HI(AC1), *AR3+ || SFTL AC2, #16, AC0
loc_026e3a: MOV T3, T0
            AADD AR6, AR7
            MOV *AR5(T0), *AR7 || BCLR ST1_FRCT
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026e50: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            MOV T0, T2
            AADD #-3, SP
            AMAR *AR0, XAR7
            AMAR *AR1, XAR5 || MOV T2, AC0
            AMAR *SP(#01h), XAR0 || SFTS AC0, #1
            AMAR *AR2, XAR1 || MOV AC0, T0
            .vli_off
            CALL sub_02a6b1
            .vli_on
            MOV T2, HI(AC0) || MOV HI(AC0), T0
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MOV #15, AR1
            OR #0, AC0, AC1 || ADD T1, AR1
            MOV AR1, *SP(#00h) || MOV HI(AC1), AR1
            CMP AR1 < T0, TC1
            XCCPART !TC1 || SFTS AC1, #-1, AC0
            XCC !TC1 || ADD #1, *SP(#00h)
            MOV T0, AC2
            MOV AC0, AC1
            XOR AC2, AC1
            ABS AC2, AC2
            ABS AC0, AC0 || BSET ST1_FRCT
            MOV AC2, *SP(#02h) || CMP AC0 < AC2, TC1
            SFTS AC0, #-1, AC0
            RPTCC #15, !TC1
               SUBC *SP(#02h), AC0, AC0
            XCCPART TC1 || MOV #0, AC0
            XCCPART AC1 < #0 || NEG AC0, AC0
            MOV AC0, AR1
            MOV *SP(#01h), AR1 || MOV AR1, HI(AC0)
            SUB AR1, *SP(#00h), AR1
            MOV #0, T1
            AMAR *(#word_e6ee), XAR3
            MANT AC0, AC0 :: NEXP AC0, T1 || XCCPART AC0 != #0
            MPYMR *AR3+, AC0, AC1
            ADD *AR3+ << #16, AC1, AC1 || ADD T1, AR1
            MOV *AR3+ << #16, AC1 || MOV HI(AC1), T1
            BTST @#00h, AR1, TC1
            MACR AC0, T1, AC1, AC0 || ADD #1, AR1
            XCCPART TC1 || MPYMR *AR3, AC0, AC0
            SFTS AR1, #-1
            MOV HI(AC0), *AR7 || BCLR ST1_FRCT
            MOV AR1, *AR5
            AADD #3, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_026ef4: PSH T3, T2
            PSHBOTH XAR5
            BCC loc_026f11, T0 <= #0
            SUB #1, T0, T2
            MOV T2, BRC0
            AMAR *AR2, XAR4
            AMAR *AR3, XAR5
            RPTBLOCAL loc_026f0f || BSET ST1_FRCT
               MPYM *AR4+, *AR5+, AC0
loc_026f0f:    MOV HI(AC0), *AR0+
loc_026f11: MOV #83, T2
            SUB T0, T2
            BCC loc_026f28, T2 < #0
            MOV T2, CSR
            AMAR *AR2, XAR4
            AMAR *AR4, XAR5
            AMAR *(AR5+T0) || RPT CSR
               MOV *AR5+, *AR4+
loc_026f28: MOV *AR1, AC0
            SUB #1, T0, T3
            BCC loc_026f45, T0 <= #0
            MOV T3, BRC0
            BCLR ST1_FRCT
            MOV #13849, AC1
            RPTBLOCAL loc_026f41 || MOV AC0, T2
               MACK T2, #173, AC1, AC0
loc_026f41:    MOV AC0, *AR4+ || MOV AC0, T2
loc_026f45: MOV AC0, *AR1
            BCC loc_026f57, T0 <= #0
            MOV T3, BRC0
            AMAR *(AR3+T0)
            RPTBLOCAL loc_026f55 || BSET ST1_FRCT
               MPYM *AR2+, *AR3-, AC0
loc_026f55:    MOV HI(AC0), *AR0+
loc_026f57: SFTL T0, #1
            BCLR ST1_FRCT
            MOV #0, T0 || SUB T0, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026f69: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR2, XAR5
            AMAR *AR3, XAR7 || MOV T1, T3
            BCC loc_026fb2, T3 <= #0
            MOV T0, AR6
            SUB #1, T3, AR6
            SUB #2, T0, T2
            AMAR *AR4, XAR3 || MOV AR6, BRC0
            MOV *AR7, AR6
            SUB #2, AR6, T1
            OR #576, mmap(@ST1_55)
            AMAR *AR1, XAR6
            AADD T3, AR3 || RPTBLOCAL loc_026faf
               MPYM *AR6+, *AR4+, AC0
               SFTS AC0, T2, AC1
               MPYM *AR2+, *AR3-, AC0
               SFTS AC0, T1, AC0
               ADD AC0, AC1
               ADD dbl(*AR0), AC1, AC0
loc_026faf:    MOV AC0, dbl(*AR0+)
loc_026fb2: AADD T3, AR1 || BCLR ST1_SATD
            BCC loc_026fc4, T3 <= #0
            SUB #1, T3, AR2
            MOV AR2, CSR
            RPT CSR
               MOV *AR1+, *AR5+
loc_026fc4: MOV #83, T1
            MOV #0, AR3 || SUB T3, T1
            BCC loc_026fd4, T1 < #0
            MOV T1, CSR
            RPT CSR
               MOV AR3, *AR5+
loc_026fd4: MOV T0, *AR7 || BCLR ST1_FRCT
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_026fe2: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-348, mmap(@SP)
            MOV XSP, XAR6
            AMAR *AR1, XAR5
            MOV #128, AR1
            MOV #8, T2 || MOV T0, T3
            CMP AR1 >= T3, TC1
            MOV XAR0, dbl(*AR6(#0100h))
            MOV XAR2, dbl(*AR6(#0102h))
            MOV T1, *AR6(#0159h)
            BCC loc_02701d, TC1
loc_02700f: MOV #1, AC0
            SFTS AC0, T2, AC0
            MOV AC0, AR1
            CMP AR1 < T3, TC1
            ADD #1, T2
            BCC loc_02700f, TC1
loc_02701d: AMAR *AR6(#0104h), XAR0
            AMAR *(#word_eaef), XAR1
            MOV #80, T1
            CALL sub_026dcf
            MOV dbl(*AR6(#0102h)), XAR3
            AMAR *SP(#00h), XAR7
            CMP *AR3(#0000h) == #3, TC1
            BCC loc_02709e, TC1
            MOV #1, AC0
            AMAR *AR6(#0104h), XAR3
            AMAR *AR5(short(#1)), XAR2
            AMAR *AR7, XAR0 || MOV T3, T0
            AMAR *AR5, XAR1 || SFTS AC0, T2, AC0
            MOV AC0, *AR6(#015ah)
            MOV AC0, T1
            CALL sub_026ef4
            MOV T2, T1
            AMAR *AR7, XAR0 || MOV #0, T0
            MOV #0, AR1
            .vli_off
            CALL sub_025d49
            .vli_on
            MOV T0, *AR6(#015bh)
            AMAR *AR6(#015bh), XAR1
            MOV *AR6(#0159h), T1
            AMAR *AR7, XAR0 || MOV T3, AR3
            MOV dbl(*AR6(#0102h)), XAR2
            MOV *AR6(#015ah), T0
            .vli_off
            CALL sub_028ff2
            .vli_on
            MOV *AR6(#015bh), T0
            AMAR *AR7, XAR0 || MOV T2, T1
            MOV #0, AR1
            .vli_off
            CALL sub_025d22
            .vli_on
            MOV T0, *AR6(#015bh)
            B loc_0270b3
loc_02709e: AMAR *AR5(short(#1)), XAR0 || MOV #0, T0
            RPT #83
               MOV T0, *AR0+
            AMAR *AR7, XAR0
            RPT #255
               MOV T0, *AR0+
            MOV #0, *AR6(#015bh)
loc_0270b3: AMAR *AR6(#0104h), XAR4
            AMAR *AR5(#00a9h), XAR3
            AMAR *AR5(#0055h), XAR2
            MOV *AR6(#015bh), T0
            MOV dbl(*AR6(#0100h)), XAR0
            AMAR *AR7, XAR1 || MOV T3, T1
            CALL sub_026f69
            ADD #348, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0270e2: MOV T1, T3 || PSH T3, T2
            ADD AR4, T3
            ADD #2, T3
            MOV #1, AC0
            SFTS AC0, T3, AC0
            AND T0, AC0
            MOV AC0, T2
            XCC T2 == #0 || AMAR *AR1, XAR3
            MOV AR4, T2
            SUB T1, T2
            ADD #2, T2
            MOV #1, AC0
            SFTS AC0, T2, AC0
            AND T0, AC0
            MOV AC0, AR4
            MOV #7, BRC0
            AADD #-1, SP
            XCC AR4 == #0 || AMAR *AR1, XAR2
            RPTB loc_027140
               MOV *AR2, T1 || MOV *AR3, AR4
               CMP AR4 >= T1, TC1
               BCC loc_027123, TC1
               MOV *AR1, T2
               CMP T1 < T2, TC1
               BCC loc_027137, TC1
loc_027123:    CMP AR4 < T1, TC1
               BCC loc_027133, TC1
               MOV *AR1, T1
               CMP AR4 >= T1, TC1
               XCC !TC1 || MOV *AR3 << #16, AC0
               BCC loc_027139, !TC1
loc_027133:    MOV *AR1 << #16, AC0
               B loc_027139
loc_027137:    MOV *AR2 << #16, AC0
loc_027139:    AMAR *AR1+
               MOV AC0, dbl(*AR0+)
               AMAR *AR3+
loc_027140:    AMAR *AR2+
            AADD #1, SP
            POP T3, T2
            RET
sub_027148: ADD AR3, T1
            ADD #2, T1
            MOV #1, AC0 || PSH T3, T2
            SFTS AC0, T1, AC0 || MOV #0, T3
            AND T0, AC0 || PSHBOTH XAR5
            MOV AC0, T2
loc_02715a: BCC loc_0271af, T2 == #0
            ADD #2, AR3, T1
            MOV #1, AC0
            SFTS AC0, T1, AC0
            AND T0, AC0
            MOV AC0, AR4
            BCC loc_0271af, AR4 == #0
            AMAR *AR2, XAR4
            MOV #4391, AR5
            AADD T3, AR4
            MOV *AR4, T1
            CMP T1 < AR5, TC1
            BCC loc_0271a1, TC1
            MOV #6554, AR5
            CMP T1 < AR5, TC1
            XCC !TC1 || MOV *AR1 << #16, AC0
            BCC loc_0271b1, !TC1
            MOV *AR4, AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #15, AC1
            SFTS AC1, #3, AC0
            SFTS AC0, #0, AC0 || BSET ST1_FRCT
            MPYM *AR1, AC0, AC0
            B loc_0271b1
loc_0271a1: MOV #-21626 << #16, AC0
            SFTL AC0, #0, AC0 || BCLR ST1_FRCT
            MPYM *AR1, AC0, AC0
            B loc_0271b1
loc_0271af: MOV *AR1 << #16, AC0
loc_0271b1: ADD #1, T3
            MOV #8, AR4
            AMAR *AR1+ || CMP T3 < AR4, TC1
            MOV AC0, dbl(*AR0+)
            BCC loc_02715a, TC1
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_FRCT
            RET
sub_0271c8: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-5, SP
            AMAR *AR3, XAR7
            MOV XAR2, dbl(*SP(#02h))
            MOV XAR4, dbl(*SP(#00h)) || MOV #0, T2
            AMAR *AR1, XAR6
loc_0271e3: MOV *AR7, *AR6+
            MOV *AR7+, AR1
            BCC loc_027243, AR1 == #0
            MOV dbl(*SP(#02h)), AC0 || MOV T2, AC1
            SFTL AC1, #1 || BCLR ST1_SATD
            ADD AC1, AC0
            MOV AC0, XAR3
            MOV T2, T0
            MOV dbl(*AR3), AC0
            MOV dbl(*SP(#00h)), XAR3
            MOV *AR3(T0), T1
            BSET ST1_SATD
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            BCC loc_02723d, T0 == #0
            BCLR ST1_SATD
            MOV #0, T1
            .vli_off
            CALL sub_0240d0
            .vli_on
            MOV #0, AC1
            BSET ST1_SATD || SFTS AC0, #-1, AC0
            OR #43316, AC1, AC1
            BCLR ST1_SATD || NEG AC0, AC0
            SUB AC1, AC0
            BCC loc_027243, AC0 < #0
            MOV #0, AC1
            OR #65534, AC1, AC1
            CMP AC1 < AC0, TC1
            BCC loc_02723d, TC1
            SFTS AC0, #15, AC0
            SFTS AC0, #0, AC0
            MOV rnd(HI(AC0)), *AR5
            B loc_027246
loc_02723d: MOV #32767, *AR5
            B loc_027246
loc_027243: MOV #0, *AR5
loc_027246: MOV #8, AR1
            ADD #1, T2
            CMP T2 < AR1, TC1
            AMAR *AR5+
            BCC loc_0271e3, TC1
            AADD #5, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            BCLR ST1_SATD
            RET
sub_027260: PSH T3, T2
            MOV XAR3, AC0 || PSHBOTH XAR5
            PSHBOTH XAR6 || MOV T1, T2
            PSHBOTH XAR7 || MOV T2, T3
            AADD #-34, SP
            MOV AR4, *SP(#18h) || MOV T2, AC1
            SUB *SP(#18h), T3, T3 || SFTS AC1, #3, AC1
            ADD AC1, AC0
            MOV AC0, XAR7 || MOV T3, AC0
            SFTS AC0, #3, AC2
            MOV XAR2, AC0
            ADD AC2, AC0
            MOV AC0, dbl(*SP(#1ch))
            MOV XAR2, AC0
            ADD *SP(#18h), T2, AR3
            ADD #2, T2, T1 || ADD AC1, AC0
            MOV AC0, dbl(*SP(#1eh)) || MOV AR3, AC0
            SFTS AC0, #3, AC1
            MOV XAR2, AC0
            MOV T0, *SP(#19h) || ADD AC1, AC0
            MOV AC0, dbl(*SP(#20h)) || MOV #1, AC0
            MOV dbl(*SP(#28h)), XAR6
            MOV XAR1, dbl(*SP(#1ah)) || SFTS AC0, T1, AC0
            AND *SP(#19h), AC0, AC0
            MOV *SP(#2ah), AR1 || MOV AC0, AR2
            AMAR *AR0, XAR5
            BCC loc_0272de, AR2 != #0
            MOV #5632, AR2
            CMP AR2 >= AR1, TC1
            BCC loc_0272de, TC1
            MOV dbl(*SP(#1ah)), XAR3
            MOV #7, BRC0
            AMAR *AR5, XAR2 || RPTBLOCAL loc_0272d5
               MOV #0, *AR2+
loc_0272d5:    MOV *AR7+, *AR3+
            MOV #0, *AR6
            B loc_027373
loc_0272de: AMAR *AR7, XAR1 || MOV #8, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV #2, T1
            AMAR *AR5, XAR0 || MOV #8, T0
            .vli_off
            CALL sub_02aa2c
            .vli_on
            NOP
            MOV *AR5 << #16, AC0
            BSET ST1_SATD || SFTS AC0, #-1, AC0
            MOV *AR5(short(#1)) << #16, AC1 || NEG AC0, AC0
            CMP AC1 < AC0, TC1
            XCCPART !TC1 || MOV #0, AR1
            XCCPART !TC1 || MOV #0, *AR6
            XCCPART TC1 || MOV #1, AR1
            XCCPART TC1 || MOV AR1, *AR6
            AMAR *SP(#10h), XAR3 || RPT #3
               MOV #0, *AR3+
            AMAR *SP(#14h), XAR3 || RPT #3
               MOV AR1, *AR3+
            BCC loc_02734d, T2 == #0
            BCLR ST1_SATD
            ADD #2, T3, T1
            MOV #1, AC0
            SFTS AC0, T1, AC0
            AND *SP(#19h), AC0, AC0
            MOV AC0, AR1
            BCC loc_02734d, AR1 == #0
            MOV dbl(*SP(#1eh)), XAR1
            MOV dbl(*SP(#1ch)), XAR2
            MOV dbl(*SP(#20h)), XAR3
            MOV *SP(#19h), T0
            MOV *SP(#18h), T1
            AMAR *SP(#00h), XAR0 || MOV T2, AR4
            CALL sub_0270e2
            B loc_027361
loc_02734d: MOV dbl(*SP(#1eh)), XAR1
            MOV dbl(*SP(#20h)), XAR2
            MOV *SP(#18h), T1
            MOV *SP(#19h), T0 || BCLR ST1_SATD
            AMAR *SP(#00h), XAR0 || MOV T2, AR3
            CALL sub_027148
loc_027361: MOV dbl(*SP(#1ah)), XAR1
            AMAR *SP(#00h), XAR2
            AMAR *SP(#10h), XAR4
            AMAR *AR7, XAR3
            AMAR *AR5, XAR0
            CALL sub_0271c8
loc_027373: MOV #7, BRC0
            AADD #7, AR5 || MOV #0, AC0
            MOV #16384, AR2 || RPTBLOCAL loc_027389
               MOV *AR5-, AR1
               CMP AR2 >= AR1, TC1 || SFTS AC0, #2, AC0
loc_027389:    XCCPART !TC1 || BSET @#00h, AC0
            AADD #34, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02739a: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AMAR *AR0, XAR5 || MOV #0, T3
            AMAR *AR1, XAR7 || MOV T0, T2
            AADD #-1, SP
loc_0273ac: MOV *AR7+, T0
            BCC loc_0273e4, T0 == #0
            BCLR ST1_SATD
            MOV #6, AR0
            MOV #0, T1
            .vli_off
            CALL sub_02410f
            .vli_on
            MOV #-1187 << #16, AC0 || MOV T0, HI(AC1)
            SUB AC1, AC0
            BCC loc_0273d4, T2 == #0
            MOV #4, AR1
            CMP T3 < AR1, TC1
            XCCPART !TC1 || MOV #512 << #16, AC1
            XCCPART !TC1 || SUB AC1, AC0
loc_0273d4: XCCPART AC0 < #0 || MOV #0, AC0
            SFTS AC0, #0, AC0 || BSET ST1_SATD
            SFTS AC0, #5, AC0
            MOV HI(AC0), *AR5
            B loc_0273e8
loc_0273e4: MOV #32767, *AR5
loc_0273e8: MOV #8, AR1
            ADD #1, T3
            CMP T3 < AR1, TC1
            AMAR *AR5+
            BCC loc_0273ac, TC1
            AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_SATD
            RET
sub_027400: PSH T2
            PSHBOTH XAR5
            AADD #-67, SP
            AMAR *AR0, XAR5
            BCC loc_0274ec, AR2 != #0
            BCC loc_027567, AR3 == #0
            MOV T1, AR2
            SUB T0, AR2
            SUB #2, AR2, T2
            BCC loc_027478, T2 < #0
            ADD #1, T1, AR2
            MOV AR2, *SP(#00h)
            SUB T1, T0
            AMAR *SP(#02h), XAR3 || MOV #31, BRC0
            SUB #1, T0, T2
            AMAR *AR5, XAR2 || RPTB loc_027472
               MOV #-21846 << #16, AC1
               MOV *AR2 << #16, AC0 || SFTL AC1, #0, AC1
               SFTS AC0, T2, AC0
               MPYM *AR1, AC1, AC1
               SFTS AC1, #-2, AC1
               CMP AC1 < AC0, TC1
               XCCPART !TC1 || MOV AC0, dbl(*AR3)
               BCC loc_02746e, !TC1
               MOV #-13108 << #16, AC0
               SFTL AC0, #0, AC0
               MPYM *AR1, AC0, AC0
               SFTS AC0, #-4, AC1
               MOV #-6554 << #16, AC0
               SFTL AC0, #0, AC0
               MPYM *AR2, AC0, AC0
               SFTS AC0, T2, AC0
               ADD AC1, AC0
               MOV AC0, dbl(*AR3)
loc_02746e:    AMAR *AR2+
               AMAR *AR1+
loc_027472:    AADD #2, AR3
            B loc_0274cf
loc_027478: ADD #1, T0, AR2
            MOV AR2, *SP(#00h)
            SUB #2, T2, T1
            AMAR *SP(#02h), XAR3 || MOV #31, BRC0
            AMAR *AR5, XAR2 || RPTB loc_0274cc
               MOV #-21846 << #16, AC1
               MOV *AR2 << #16, AC0 || SFTL AC1, #0, AC1
               SFTS AC0, #-1, AC0
               MPYM *AR1, AC1, AC1
               SFTS AC1, T2, AC1
               CMP AC1 < AC0, TC1
               XCCPART !TC1 || MOV AC0, dbl(*AR3)
               BCC loc_0274c8, !TC1
               MOV #-13108 << #16, AC0
               SFTL AC0, #0, AC0
               MPYM *AR1, AC0, AC0
               MOV #-6554 << #16, AC0 || SFTS AC0, T1, AC1
               SFTL AC0, #0, AC0
               MPYM *AR2, AC0, AC0
               SFTS AC0, #-1, AC0
               ADD AC1, AC0
               MOV AC0, dbl(*AR3)
loc_0274c8:    AMAR *AR2+
               AMAR *AR1+
loc_0274cc:    AADD #2, AR3
loc_0274cf: AMAR *SP(#02h), XAR1
            AMAR *SP(#00h), XAR2
            MOV #32, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV #0, AR1
            MOV *SP(#00h), T0 || RPT #31
               OR *AR5+, AR1, AR1
            BCC loc_027562, AR1 == #0
            B loc_027567
loc_0274ec: MOV T1, AR2
            SUB T0, AR2
            SUB #3, AR2, T2
            BCC loc_027524, T2 < #0
            ADD #1, T1, AR2
            MOV AR2, *SP(#00h)
            SUB T1, T0
            AMAR *SP(#02h), XAR3 || MOV #31, BRC0
            SUB #1, T0, T1
            AMAR *AR5, XAR2 || RPTBLOCAL loc_02751f
               MOV *AR2+, AC0
               SFTS AC0, #14, AC1
               ADD AC0 << #15, AC1
               MOV *AR1+ << #16, AC0 || SFTS AC1, T1, AC1
               SFTS AC0, #-3, AC0
               ADD AC1, AC0
loc_02751f:    MOV AC0, dbl(*AR3+)
            B loc_027549
loc_027524: ADD #1, T0, AR2
            MOV AR2, *SP(#00h)
            AMAR *SP(#02h), XAR3 || MOV #31, BRC0
            AMAR *AR5, XAR2 || RPTBLOCAL loc_027546
               MOV *AR2+, AC0
               SFTS AC0, #14, AC1
               ADD AC0 << #15, AC1
               MOV *AR1+ << #16, AC0 || SFTS AC1, #-1, AC1
               SFTS AC0, T2, AC0
               ADD AC1, AC0
loc_027546:    MOV AC0, dbl(*AR3+)
loc_027549: AMAR *SP(#02h), XAR1
            AMAR *SP(#00h), XAR2
            MOV #32, T0
            .vli_off
            CALL sub_0282aa
            .vli_on
            MOV #0, AR1
            MOV *SP(#00h), T0 || RPT #31
               OR *AR5+, AR1, AR1
            BCC loc_027567, AR1 != #0
loc_027562: MOV #0, *SP(#00h)
            B loc_027569
loc_027567: MOV T0, *SP(#00h)
loc_027569: MOV *SP(#00h), T0
            AADD #67, SP
            POPBOTH XAR5
            POP T2
            RET
sub_027573: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            MOV #21845 << #16, AC0 || MOV AR4, T2
            OR #21845, AC0, AC0 || MOV T0, T3
            AADD #-38, SP
            AMAR *AR1, XAR7 || MOV AR3, AR4
            MOV T2, *SP(#21h) || MOV #0, AR3
            MOV dbl(*AR7(short(#4))), AC1 || MOV AR4, T2
            ADD #2, AR4, T0
            SUB T1, T2 || AND AC1, AC0
            XCCPART AC0 == #0 || MOV #1, AR3
            ADD #2, T2
            MOV #15, AC0
            SFTS AC0, T2, AC0
            MOV mmap(@AC0L), AC0
            SFTS AC0, #-2, AC0
            MOV *AR2(T0) << #16, AC0 || MOV AC0, T2
            ADD #3, AR4, T0
            AMAR *AR0, XAR5
            MOV *AR2(T0) << #16, AC0 || SFTS AC0, #-1, AC1
            SFTS AC0, #-1, AC0 || MOV T2, AR1
            AND T3, AR1 || ADD AC1, AC0
            MOV HI(AC0), *SP(#22h) || MOV #0, AC2
            BCC loc_0275e7, AR1 != #0
            ADD #1, AR4, T0
            MOV *AR2(T0) << #16, AC0
            SFTS AC0, #-1, AC0
            ADD AC1, AC0
            MOV #-2048, AR2 || MOV HI(AC0), AR1
            CMP AR1 >= AR2, TC1
            XCCPART !TC1 || MOV #1, AC2
loc_0275e7: MOV #2, AR1
            SUB AR4, AR1
            MOV AR1, AC0
            AMAR *AR5, XAR6 || SFTS AC0, #5, AC1
            MOV XAR5, AC0
            ASUB AR4, AR6 || ADD AC1, AC0
            MOV AC0, XAR4
            AMAR *+AR6(#00c4h)
            MOV *AR5(#0021h), T0
            AMAR *AR0+
            MOV *AR6, T1 || AADD #98, AR4
            MOV XAR4, AC0
            MOV AC0, dbl(*SP(#24h)) || MOV AC2, AR2
            MOV dbl(*SP(#24h)), XAR1
            CALL sub_027400
            MOV T0, *AR5(#0021h)
            AMAR *AR5, XAR1
            MOV dbl(*SP(#24h)), XAR2
            AMAR *SP(#00h), XAR0
            MOV *AR5(#0021h), T0
            MOV dbl(*AR7(short(#4))), AC0
            MOV *AR6, T1
            AMAR *AR1+
            .vli_off
            CALL sub_0279b2
            .vli_on
            AMAR *AR5, XAR2
            AMAR *AR5, XAR1
            AMAR *SP(#00h), XAR0
            AADD #66, AR2
            AADD #34, AR1
            .vli_off
            CALL sub_027a8e
            .vli_on
            MOV *SP(#22h), AR1
            MOV AR1, HI(AC0) || BSET ST1_SATD
            NEG AC0, AC0
            SFTS AC0, #2, AC0
            MOV #16384, AR1 || MOV HI(AC0), T1
            CMP AR1 < T1, TC1
            XCCPART !TC1 || MOV #0, AR1
            XCCPART !TC1 || MAX AR1, T1
            MOV T2, AR1
            AND T3, AR1
            XCCPART TC1 || MOV #16384, T1
            BCC loc_027687, AR1 == #0
            SFTS T2, #-1
            AND T3, T2
            BCC loc_027698, T2 == #0
            MOV #-31314 << #16, AC0
            SFTL AC0, #0, AC0 || BCLR ST1_SATD
            MPYM *AR5, AC0, AC0
            SFTS AC0, #1
            B loc_027693
loc_027687: MOV #-2676 << #16, AC0
            SFTL AC0, #0, AC0 || BCLR ST1_SATD
            MPYM *AR5, AC0, AC0
loc_027693: SFTL AC0, #-16, AC0
            MOV AC0, *AR5
loc_027698: MOV *AR5, T0
            MOV #8192, AR1
            AMAR *SP(#00h), XAR0 || CMP AR1 < T0, TC1
            XCCPART !TC1 || MOV #4096, AR1
            MAX AR1, T0
            XCCPART TC1 || MOV #8192, T0
            MOV T0, *AR5
            MOV dbl(*AR7(short(#4))), AC0 || BCLR ST1_SATD
            .vli_off
            CALL sub_027af4
            .vli_on
            MOV *SP(#21h), AR1
            BCC loc_0276d6, AR1 == #0
            AMAR *AR7, XAR0
            MOV *AR7(short(#6)), T1
            MOV dbl(*AR7(short(#4))), AC0
            AMAR *SP(#00h), XAR1
            MOV *AR7(short(#2)), T0 || AADD #8, AR0
            .vli_off
            CALL sub_027b5d
            .vli_on
loc_0276d6: AADD #38, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0276e2: PSH T3, T2
            PSHBOTH XAR5
            MOV T0, T3
            MOV T3, HI(AC1)
            SFTS AC1, #9, AC1 || MOV T1, T2
            AMAR *AR0, XAR5 || MOV HI(AC1), T0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV AC0, AR1
            MOV AR1, HI(AC0) || BSET ST1_FRCT
            MPY T2, AC0, AC0
            NEG AC0, AC0
            SFTS AC0, #-1, AC0
            BCC loc_027721, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            BSET ST1_SATD
            AMAR *AR5, XAR3 || RPTBLOCAL loc_02771f
               MPYM *AR3, T2, AC1
               SFTS AC1, #-1, AC1
               ADD AC0, AC1
               SFTS AC1, #1
loc_02771f:    MOV HI(AC1), *AR3+
loc_027721: BCLR ST1_FRCT
            BCLR ST1_SATD
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02772b: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AADD #-3, SP
            AMAR *(#080000h), XAR3
            MOV XAR3, AC0
            AMAR *AR1, XAR5 || MOV T0, T3
            AMAR *AR0, XAR7 || MOV T1, T2
            .vli_off
            CALL sub_024538
            .vli_on
            MOV AC0, AR1
            MOV AR1, HI(AC0)
            MOV T2, HI(AC0) || MOV HI(AC0), T1
            SFTS AC0, #9, AC0
            SFTS AC0, #0, AC0 || BSET ST1_FRCT
            MPY T1, AC0, AC0
            SFTS AC0, #-12, AC0
            MOV AC0, dbl(*SP(#00h))
            MOV #0, AC0
            MOV dbl(*SP(#00h)), AC3
            BCC loc_0277ab, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            AMAR *AR7, XAR3 || RPTB loc_0277a9
               MOV #55, AR2 || MOV HI(AC3), AR1
               MIN AR2, AR1
               XCCPART AR1 == #0 || MOV *AR5 << #16, AC1
               BCC loc_0277a1, AR1 == #0
               AMAR *AR5, XAR2
               AADD AR1, AR2 || MOV AC3, AR1
               MOV AR1, HI(AC2)
               SFTL AC2, #-1
               MOV *AR2(#-0001h), T1
               MOV HI(AC2), T2
               MOV T1, HI(AC1)
               MACM *AR2, T2, AC1, AC2
               MPY T2, AC1, AC1
               NEG AC1, AC1
               ADD AC2, AC1
loc_0277a1:    ADD dbl(*SP(#00h)), AC3, AC3
               MOV HI(AC1), *AR3+ || SFTS AC1, #-6, AC1
loc_0277a9:    ADD AC1, AC0
loc_0277ab: BCLR ST1_FRCT
            AADD #3, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0277b7: ADD #1, *AR0(#0046h)
            RET
sub_0277bf: AMAR *(#word_d7a7), XAR3
            MOV #3, BRC0
            MOV *AR3(T0), AC0 || RPTBLOCAL loc_0277d4
               AND #15, AC0, AR1
               SFTS AC0, #-4, AC0 || ADD #2, AR1
loc_0277d4:    MOV AR1, *AR0+
            RET
sub_0277d8: PSH T3, T2
            PSHBOTH XAR5
            AADD #-2, SP
            AMAR *AR0, XAR5 || MOV T0, T2
            MOV AR2, *SP(#00h)
            CALL sub_02772b
            MOV *SP(#00h), T1
            AMAR *AR5, XAR0 || MOV T2, T0
            CALL sub_0276e2
            AADD #2, SP
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0277fa: BCC loc_027820, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, BRC0
            AMAR *AR0, XAR3
            MOV #30719 << #16, AC3
            BSET ST1_SATD
            MOV #-30720 << #16, AC1 || RPTBLOCAL loc_02781e
               MOV *AR3, AC0
               ADD *AR1+, AC0, AC0
               SFTS AC0, #16, AC0
               MIN AC3, AC0
               MAX AC1, AC0
loc_02781e:    MOV HI(AC0), *AR3+
loc_027820: BCLR ST1_SATD
            MOV #56, AR2
            AMAR *(AR0+T0) || CMP T0 >= AR2, TC1
            MOV *AR0(#-0001h), AR1
            BCC loc_02783d, TC1
            MOV #55, AR2
            SUB T0, AR2
            MOV AR2, CSR
            RPT CSR
               MOV AR1, *AR0+
loc_02783d: BCLR ST1_SATD
            RET
sub_027841: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-12, SP
            MOV T1, *SP(#08h)
            MOV XAR2, dbl(*SP(#04h))
            MOV XAR0, dbl(*SP(#00h)) || MOV T0, T2
            MOV XAR1, dbl(*SP(#02h)) || MOV #8, T0
            MOV XAR3, dbl(*SP(#06h)) || MOV #8, T1
            MOV dbl(*SP(#04h)), XAR5
            MOV dbl(*SP(#02h)), XAR0
            .vli_off
            CALL sub_02b276
            .vli_on
            MOV dbl(*SP(#02h)), XAR3
            MOV #3, BRC0
            MOV #-19196 << #16, AC3
            RPTBLOCAL loc_02788b || SFTL AC3, #0, AC3
               MOV *AR3(short(#1)) << #15, AC2
               MOV *AR3 << #15, AC0
               OR #0, AC0, AC1
               SUB AC2, AC0
               ADD AC2, AC1
               MOV HI(AC1), *AR3+ || MPY AC3, AC0
loc_02788b:    MOV HI(AC0), *AR3+
            MOV dbl(*SP(#02h)), XAR7
            MOV #4, T3
            MOV dbl(*SP(#06h)), XAR6
loc_027895: MOV *AR7+, *AR5
            MOV *AR7+, AR1
            AMAR *AR5, XAR0
            MOV AR1, *AR5(short(#1))
            MOV *AR6+, T0 || MOV #6, T1
            ADD T0, AR5
            .vli_off
            CALL sub_02b276
            .vli_on
            SUB #1, T3
            BCC loc_027895, T3 != #0
            MOV *SP(#08h), AC0
            MOV dbl(*SP(#02h)), XAR3
            MOV dbl(*SP(#06h)), XAR2
            SFTS AC0, #16, AC0 || MOV #2, T0
            BSET ST1_FRCT
            RPT #3 || MPY T2, AC0, AC0
               MASM *(AR3+T0), *AR2+, AC0, AC0
            MOV AC0, dbl(*SP(#0ah))
            BCLR ST1_FRCT
            MOV T2, T0
            .vli_off
            CALL sub_024538
            .vli_on
            BCC loc_0278ec, T2 <= #0
            MOV AC0, AR1
            SUB #1, T2, AR1 || MOV AR1, HI(AC1)
            MOV dbl(*SP(#04h)), XAR3 || MOV AR1, BRC0
            MOV dbl(*SP(#00h)), XAR2 || BSET ST1_SATD
            RPTBLOCAL loc_0278ea
               ADD *AR3+ << #16, AC1, AC0
loc_0278ea:    MOV HI(AC0), *AR2+
loc_0278ec: MOV dbl(*SP(#0ah)), AC0
            BCLR ST1_SATD
            AADD #12, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0278fd: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-2, SP
            AMAR *AR1, XAR5
            MOV XAR0, dbl(*SP(#00h))
            BCC loc_02792b, T0 <= #0
            SUB #1, T0, T1
            MOV T1, BRC0
            MOV #-32767, T0
            MOV #32767, T1
            RPTBLOCAL loc_027929
               MOV *AR2+, AC0
               SUB AC0, *AR3+, AC0
               MIN T1, AC0
               MAX T0, AC0
loc_027929:    MOV AC0, *AR1+
loc_02792b: MOV #4, T3
            MOV dbl(*SP(#00h)), XAR7
            AMAR *AR4, XAR6
loc_027933: MOV *AR6+, T2 || MOV #6, T1
            AMAR *AR5, XAR0 || MOV T2, T0
            .vli_off
            CALL sub_02aa2c
            .vli_on
            MOV *AR5, *AR7
            AMAR *AR5, XAR0
            MOV *AR5(short(#1)), AR1 || MOV #0, T0
            SUB #6, T2, T1
            MOV AR1, *AR7(short(#1)) || AADD #6, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            SUB #1, T3
            AADD #2, AR7 || AADD T2, AR5
            BCC loc_027933, T3 != #0
            MOV dbl(*SP(#00h)), XAR3
            MOV #-32767, T0
            MOV #32767, T2
            MOV #-19196 << #16, AC0
            SFTL AC0, #0, AC1
            MOV #3, BRC0
            RPTBLOCAL loc_027999
               MOV *AR3, AR1
               MOV *AR3(short(#1)), T1 || MOV AR1, HI(AC0)
               SFTS AC0, #-1, AC0
               SFTS AC0, #0, AC2
               MAC AC1, T1, AC0, AC0
               SFTS AC0, #-15, AC0
               MIN T2, AC0
               MAX T0, AC0
               MOV AC0, *AR3+
               MAS T1, AC1, AC2
               SFTS AC2, #-15, AC2
               MIN T2, AC2
               MAX T0, AC2
loc_027999:    MOV AC2, *AR3+
            MOV dbl(*SP(#00h)), XAR0
            MOV #8, T1
            MOV #8, T0
            .vli_off
            CALL sub_02aa2c
            .vli_on
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0279b2: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-8, SP
            AMAR *AR0, XAR5
            AMAR *AR1, XAR7
            MOV XAR2, dbl(*SP(#02h))
            MOV AC0, dbl(*SP(#00h))
            MOV T1, *SP(#05h)
            MOV T0, *SP(#04h) || MOV #0, AR1
            MOV AR1, *SP(#06h)
            MOV #0, T3
loc_0279d2: MOV dbl(*SP(#02h)), XAR3
            MOV #32, AR1
            CMP T3 < AR1, TC1
            MOV *AR3, T1
            MOV *SP(#05h), AR0
            BCC loc_0279ef, TC1
            MOV dbl(*SP(#00h)), AC0
            SFTS AC0, #-2, AC0
            MOV AC0, dbl(*SP(#00h))
            SUB #32, T3, T3
loc_0279ef: MOV *SP(#01h), AR1
            AND #1, AR1, AR1
            BCC loc_027a1b, AR1 != #0
            MOV *SP(#06h), T0
            AMAR *(#word_ebad), XAR3
            MOV *AR3(T0) << #15, AC1
            MOV #8192 << #16, AC0
            ADD AC1, AC0 || BSET ST1_FRCT
            MANT AC0, AC0 :: NEXP AC0, T2
            MPY T1, AC0, AC0
            ADD T2, AR0
            MANT AC0, AC0 :: NEXP AC0, T1
            ADD T1, AR0
            MOV HI(AC0), T1
            ADD #1, AR0
loc_027a1b: MOV *AR7+ << #16, AC0
            MANT AC0, AC0 :: NEXP AC0, T2
            MOV T1, HI(AC1)
            MOV *SP(#04h), T0 || MANT AC1, AC1 :: NEXP AC1, T1
            ADD #16, T3, T3
            ADD T2, T0
            ADD T1, AR0
            BCC loc_027a68, AC1 == #0
            CMP AR0 >= T0, TC1
            BCC loc_027a3a, TC1
            BCC loc_027a68, AC0 != #0
loc_027a3a: CMP T0 != AR0, TC1
            BCC loc_027a45, TC1
            CMP AC0 < AC1, TC1
            BCC loc_027a68, !TC1
loc_027a45: BCLR ST1_FRCT
            AMAR *SP(#07h), XAR1 || MOV HI(AC1), T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#07h), T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0 || BSET ST1_SATD
            ADD #-32768 << #16, AC0, AC0
            BCLR ST1_SATD
            MPYK #-22118, AC0, AC0
            SFTS AC0, #1
            MOV HI(AC0), *AR5+
            B loc_027a6b
loc_027a68: MOV #0, *AR5+
loc_027a6b: ADD #1, *SP(#06h)
            MOV #32, AR2
            MOV *SP(#06h), AR1
            CMP AR1 < AR2, TC1
            ADD #1, *SP(#03h)
            BCC loc_0279d2, TC1
            BCLR ST1_FRCT
            AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_027a8e: PSHBOTH XAR5
            MOV *AR0(#001fh), AR5
            MOV AR5, *AR0(#0020h)
            BSET ST1_FRCT
            MOV XAR0, AC1 || MOV #29, BRC0
            MOV #8192, T1
            MOV #2, T0
            AMAR *(#word_ebcd), XAR4
            RPTBLOCAL loc_027adc
               MPYM *AR4+, *AR2+, AC0
               MACM *AR4+, *AR2+, AC0, AC0
               MACM *AR4+, *(AR2-T0), AC0, AC0
               MACM *AR4+, *AR1+, AC0, AC0
               MACM *AR4+, *AR1+, AC0, AC0
               MACM *AR4+, *(AR1-T0), AC0, AC0
               MACM *AR4+, *AR0+, AC0, AC0
               MACM *AR4+, *AR0+, AC0, AC0
               MACM *AR4+, *(AR0-T0), AC0, AC0
               MOV *AR1, *AR2+
               MOV *AR0, *AR1+
               MOV T1, *AR0+ || ASUB #9, AR4
loc_027adc:    MOV HI(AC0), T1 || MOV #0, AC0
            MOV AC1, XAR0
            BCLR ST1_FRCT
            MOV T1, *AR0(#001eh)
            MOV T1, *AR0(#001fh)
            MOV *AR0(short(#1)), AR1
            MOV AR1, *AR0
            POPBOTH XAR5
            RET
sub_027af4: PSH T3, T2
            MOV T1, AC1
            SFTS AC1, #16, AC2
            MOV #16384 << #16, AC1
            SUB AC2, AC1 || BSET ST1_FRCT
            OR #0, AC1, AC3
            MOV #0, AR3
            AMAR *(#word_ebad), XAR1
            MOV #31, BRC0
            RPTB loc_027b55
               MOV #32, AR2
               CMP AR3 < AR2, TC1
               MOV T0, T2
               XCCPART !TC1 || SFTS AC0, #-2, AC0
               AND #1, AC0, AR2
               XCCPART !TC1 || SUB #32, AR3, AR3
               MPYM *AR1+, T2, AC1
               SFTS AC1, #1
               XCCPART AR2 == #0
               MOV HI(AC1), T2
               MOV #16384, AR2
               MOV *AR0, T3 || MOV T2, HI(AC2)
               CMP AR2 < T3, TC1
               MAX T2, T3
               XCCPART TC1 || MOV #16384, T3
               ADD #16, AR3, AR3 || MPY T3, AC3, AC1
               MOV #32, AR2 || MAC AC2, T1, AC1, AC1
               SFTS AC1, #1
loc_027b55:    MOV HI(AC1), *AR0+
            BCLR ST1_FRCT
            POP T3, T2
            RET
sub_027b5d: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-12, SP
            MOV #0, AC1
            OR #32768, AC1, AC1 || MOV T1, T2
            MOV AC0, dbl(*SP(#00h)) || MOV T2, HI(AC0)
            MPYK #64, AC0, AC0
            SFTS AC0, #-3, AC0
            MOV AC0, dbl(*SP(#02h))
            MOV dbl(*SP(#02h)), AC0
            SUB AC1, AC0
            MOV AC0, dbl(*SP(#04h)) || MOV T2, AC0
            SFTS AC0, #5, AC0
            SFTS AC0, #0, AC0
            AMAR *AR1, XAR6 || SFTS AC0, #-3, AC0
            MOV AC0, dbl(*SP(#06h))
            MOV dbl(*SP(#06h)), AC0
            MOV AC0, dbl(*SP(#08h))
            BCC loc_027c60, T0 <= #0
            MOV #0, AR1
            MOV AR1, *SP(#0ah) || MOV T0, AR5
            AMAR *AR0, XAR7
loc_027ba9: MOV *SP(#04h), T0
            AMAR *AR6(T0), XAR3
            MOV *AR3(short(#1)) << #16, AC0
            SUB *AR3 << #16, AC0, AC0 || BCLR ST1_FRCT
            MOV *SP(#05h) << #16, AC0 || MOV HI(AC0), T1
            SFTL AC0, #0, AC0
            MPY T1, AC0, AC0
            ADD *AR3 << #16, AC0, AC0 || MOV #0, T3
            MANT AC0, AC0 :: NEXP AC0, T3 || XCCPART AC0 != #0
            NOP
            XCCPART AC0 == #0 || MOV #-32768, T0
            ADD #1, T3, T1
            BCC loc_027bdd, AC0 == #0
            MOV #4, AR0 || MOV HI(AC0), T0
            .vli_off
            CALL sub_02410f
            .vli_on
loc_027bdd: MOV *SP(#08h), T1
            SFTL T1, #1
            MOV #1, AC0
            MOV dbl(*SP(#00h)), AC0 || SFTS AC0, T1, AC1
            AND AC0, AC1
            BCC loc_027c2b, AC1 == #0
            AMAR *(#02b333h), XAR3
            MOV dbl(*SP(#04h)), AC0
            MOV XAR3, AC1
            CMP AC0 < AC1, TC1
            BCC loc_027c24, TC1
            AMAR *(#05e666h), XAR3
            MOV XAR3, AC1
            CMP AC0 >= AC1, TC1
            BCC loc_027c2b, TC1
            MOV *SP(#0ah) << #16, AC0
            MPYK #10, AC0, AC0
            ADD #10, AC0
            SFTS AC0, #16, AC0
            MPY T2, AC0, AC0
            SFTS AC0, #-4, AC0
            SFTS AC0, #16, AC0 || BSET ST1_FRCT
            B loc_027c29 || MPY T0, AC0, AC0
loc_027c24: MOV T0, HI(AC0)
            SFTS AC0, #-1, AC0
loc_027c29: MOV HI(AC0), T0
loc_027c2b: BSET ST1_SATD || MOV T0, AC1
            MOV *AR7 << #16, AC0 || SFTS AC1, #16, AC1
            ADD AC1, AC0
            MOV #-30720, AR1 || MOV HI(AC0), AR2
            MAX AR1, AR2
            MOV AR2, HI(AC0)
            MOV HI(AC0), *AR7+
            MOV dbl(*SP(#02h)), AC0
            ADD dbl(*SP(#04h)), AC0, AC0
            MOV AC0, dbl(*SP(#04h))
            MOV dbl(*SP(#06h)), AC0 || SUB #1, AR5
            ADD dbl(*SP(#08h)), AC0, AC0 || BCLR ST1_SATD
            ADD #1, *SP(#0ah)
            MOV AC0, dbl(*SP(#08h))
            BCC loc_027ba9, AR5 != #0
loc_027c60: BCLR ST1_FRCT
            AADD #12, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_027c6e: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-96, SP
            AMAR *AR2, XAR5
            MOV T0, *SP(#54h)
            MOV XAR1, dbl(*SP(#56h))
            AMAR *AR4, XAR6
            MOV *SP(#54h) << #1, AC0
            MOV XAR0, dbl(*SP(#58h))
            MOV *SP(#66h), AR1
            MOV XAR3, dbl(*SP(#52h))
            MOV T1, *SP(#50h)
            MOV AC0, *SP(#5ah) || AADD #4, AR5
            BCC loc_027d79, AR1 <= #0
            MOV dbl(*SP(#56h)), XAR3
            MOV AR1, *SP(#5eh) || MOV #0, AR1
            MOV AR1, *SP(#5fh)
            MOV XAR3, dbl(*SP(#5ch)) || AADD #32, AR3
loc_027ca9: MOV dbl(*SP(#56h)), XAR7
            AADD #80, AR7 || MOV #2, T2
loc_027cb1: AMAR *SP(#30h), XAR0
            AMAR *(#word_eb79), XAR2
            AMAR *AR6, XAR1
            MOV #32, AR3
            MOV #16, T1
            MOV #32, T0
            .vli_off
            CALL sub_02a187
            .vli_on
            AMAR *SP(#30h), XAR0
            .vli_off
            CALL sub_02accc
            .vli_on
            MOV *SP(#30h), T3
            AMAR *SP(#10h), XAR0
            AMAR *SP(#30h), XAR1
            MOV #16, T0
            .vli_off
            CALL sub_02818e
            .vli_on
            MOV *SP(#5ah), T1
            MOV dbl(*SP(#52h)), XAR3
            AMAR *SP(#10h), XAR2 || MOV #15, BRC0
            SUB *SP(#50h), T1, T1 || RPTBLOCAL loc_027cfc
               MOV dbl(*AR2+), AC0
               SFTS AC0, T1, AC0
               ADD dbl(*AR3), AC0, AC0
loc_027cfc:    MOV AC0, dbl(*AR3+)
            MOV #0, AR1
            AND #65535, AR1, AR1
            AMAR *AR7, XAR0 || MAX T3, AR1
            MOV AR1, *AR7
            MOV *SP(#54h), T0
            MOV *SP(#5ah), T1
            AMAR *AR0+
            AMAR *SP(#12h), XAR1
            .vli_off
            CALL sub_02b1dc
            .vli_on
            MOV #15, BRC0
            AMAR *AR7, XAR3 || RPTBLOCAL loc_027d24
               MOV *AR3+, *AR5
loc_027d24:    AADD #26, AR5
            AADD #4, AR6
            AADD #16, AR7 || SUB #1, T2
            AMAR *+AR5(#-019fh)
            BCC loc_027cb1, T2 != #0
            AMAR *SP(#00h), XAR0
            MOV dbl(*SP(#56h)), XAR2
            AMAR *(#word_eb89), XAR1
            .vli_off
            CALL sub_02b229
            .vli_on
            MOV dbl(*SP(#56h)), XAR0
            MOV dbl(*SP(#5ch)), XAR1
            MOV #80, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV *SP(#5fh), AR1
            MOV dbl(*SP(#58h)), XAR3
            AMAR *SP(#00h), XAR2 || MOV #15, BRC0
            AADD AR1, AR3 || RPTBLOCAL loc_027d68
               MOV *AR2+, *AR3
loc_027d68:    AADD #11, AR3
            ADD #-1, *SP(#5eh)
            MOV *SP(#5eh), AR1
            ADD #1, *SP(#5fh)
            BCC loc_027ca9, AR1 != #0
loc_027d79: AADD #96, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_027d85: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-244, mmap(@SP)
            AMAR *SP(#00h), XAR6
            AMAR *AR0, XAR7
            MOV XAR2, dbl(*AR6(#00ech))
            ADD *AR7(#04eeh), T1, AR2
            MOV AR2, *AR7(#04eeh)
            MOV XAR1, dbl(*AR6(#00eeh))
            MOV *AR7(#04eeh), AR2
            MOV XAR3, dbl(*AR6(#00eah))
            MOV AR2, AC0
            MOV dbl(*AR6(#00fah)), XAR1
            SFTS AC0, #-3, AC0
            SFTS AC0, #3, AC0 || MOV AC0, T2
            AMAR *AR7, XAR3 || SUB AC0, AR2
            ADD #28, AC0, T3
            AMAR *(AR1+T0)
            MOV AR2, *AR7(#04eeh)
            AMAR *+AR3(#0317h)
            MOV *AR7(#04eeh), AR2
            ASUB T3, AR1
            MOV XAR4, dbl(*AR6(#00e8h))
            AMAR *SP(#03h), XAR0
            MOV XAR3, dbl(*AR6(#00f0h))
            ASUB AR2, AR1 || MOV T3, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AMAR *AR7, XAR3
            AMAR *+AR3(#031eh)
            MOV XAR3, dbl(*AR6(#00f2h))
            AMAR *SP(#77h), XAR0
            MOV dbl(*AR6(#00f2h)), XAR1
            MOV #80, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AMAR *AR7, XAR5
            AMAR *+AR5(#0310h)
            MOV #5, BRC0
            AMAR *+AR7(#0318h)
            MOV dbl(*AR6(#00f0h)), XAR3
            RPTBLOCAL loc_027e2f
               SUB T2, *AR7+, AR2 || MOV #0, AR1
               AND #65535, AR1, AR1
               MAX AR2, AR1
loc_027e2f:    MOV AR1, *AR3+
            MOV #58, AR1
            MOV dbl(*AR6(#00f0h)), XAR3
            MOV dbl(*AR6(#00f0h)), XAR4
            AMAR *AR5, XAR2 || MOV #5, BRC0
            MOV #1, T0 || SUB T2, AR1
            MOV AR1, *AR5(#000dh)
            AMAR *AR3+ || RPTBLOCAL loc_027e61
               MOV *AR4+, AR1
               SUB AR1, *AR3+, AR1
               XCC AR1 > #0 || MOV *AR5(T0), *AR2
               XCCPART AR1 <= #0 || MOV #-32768, *AR2
loc_027e61:    AMAR *AR2+ || ADD #1, T0
            MOV dbl(*AR6(#00e8h)), XAR3
            MOV T2, AC0
            MOV dbl(*AR6(#00eah)), XAR0
            SFTS AC0, #1
            MOV #32, T1
            MOV AC0, *AR3 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #0, *SP(#02h)
            AMAR *SP(#03h), XAR1
            AMAR *SP(#02h), XAR2
            AMAR *SP(#03h), XAR0 || MOV T3, T0
            .vli_off
            CALL sub_02821d
            .vli_on
            MOV *AR5(short(#6)), AR7
            MOV *SP(#02h), AR1
            CMP AR7 < AR1, TC1
            BCC loc_027eb7, TC1
            MOV *SP(#02h), AR1
            CMP AR1 >= AR7, TC1
            BCC loc_027ec9, TC1
            MOV *SP(#02h), T1
            AMAR *SP(#03h), XAR1 || MOV AR7, AR2
            AMAR *SP(#03h), XAR0 || MOV T3, T0
            .vli_off
            CALL sub_028311
            .vli_on
            MOV AR7, *SP(#02h)
            B loc_027ec9
loc_027eb7: AMAR *SP(#77h), XAR0
            AMAR *SP(#77h), XAR1
            MOV *SP(#02h), AR2
            MOV #80, T0 || MOV AR7, T1
            .vli_off
            CALL sub_028311
            .vli_on
loc_027ec9: MOV *SP(#02h), AR1
            MOV T2, *SP(#00h)
            MOV AR1, *AR5(short(#6))
            MOV dbl(*AR6(#00eeh)), XAR0
            MOV dbl(*AR6(#00ech)), XAR2
            MOV *SP(#02h), AR1
            SFTL AR1, #1
            ADD #7, AR1, T1
            MOV dbl(*AR6(#00eah)), XAR3
            AMAR *SP(#03h), XAR4
            MOV *SP(#02h), T0
            AMAR *SP(#77h), XAR1
            CALL sub_027c6e
            MOV dbl(*AR6(#00f2h)), XAR0
            AMAR *SP(#77h), XAR1
            MOV #80, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            ADD #244, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            MOV T2, T0
            POPBOTH XAR5
            POP T3, T2
            RET
sub_027f12: PSH T3, T2
            AMAR *AR2, XAR3 || MOV T0, T2
            AMAR *AR1, XAR2 || CMP T1 < T2, TC1
            AMAR *AR3, XAR1
            BCC loc_027f32, TC1
            MOV #24576, T3 || MOV T1, T0
            MOV #8192, T2 || MOV T2, T1
            B loc_027f40
loc_027f32: AMAR *AR2, XAR3
            MOV #8192, T3
            AMAR *AR1, XAR2
            MOV #24576, T2
loc_027f40: MOV T0, AR4
            SUB AR4, T1
            AMAR *AR2, XAR1
            AMAR *AR2+
            AMAR *AR3, XAR4 || MOV #128, BRC0
            BCLR ST1_FRCT
            AMAR *AR3+ || RPTB loc_027f7b
               BCLR ST1_SATD
               MPYMU *AR4(short(#1)), T2, AC0
               SFTS AC0, #-15, AC0 || BSET ST1_FRCT
               MACM *AR4, T2, AC0, AC0 || BCLR ST1_FRCT
               MPYMU *AR1(short(#1)), T3, AC1
               SFTS AC1, #-15, AC1 || BSET ST1_FRCT
               MACM *AR1, T3, AC1, AC1 || BCLR ST1_FRCT
               SFTS AC1, T1, AC1 || BSET ST1_SATD
               AADD #2, AR4 || ADD AC1, AC0
loc_027f7b:    MOV AC0, dbl(*AR0+) || AADD #2, AR1
            BCLR ST1_FRCT
            BCLR ST1_SATD
            POP T3, T2
            RET
sub_027f89: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-12, SP
            BSET ST3_SMUL
            BSET ST1_FRCT
            MOV #0, AC1 || MOV T0, HI(AC0)
            MPYK #256, AC0, AC0
            SFTS AC0, #-4, AC0
            MOV #0, AC3
            MOV HI(AC0), T2
            ADD #1, T2
            MOV #1, T3
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            ADD AC3, AR2
            NEG AC3, AC3
            MOV AR3, T3
            MOV AC0, dbl(*SP(#00h)) || SFTS AC0, #-1, AC0
            OR #32768, AC1, AC1 || MOV AR2, AR5
            MOV dbl(mmap(@AC0H)), AC0
            MOV XAR1, dbl(*SP(#02h)) || ADD AC1, AC0
            MOV AC0, *SP(#0ah) || MOV HI(AC0), AR6
            BCC loc_0280bb, T1 <= #0
            MOV XAR0, dbl(*SP(#04h)) || MOV T1, T2
            MOV XAR0, XAR4
loc_027fff: MOV *SP(#0ah), AR1
            MOV dbl(*SP(#00h)), AC1 || MOV AR6, HI(AC2)
            MOV dbl(*SP(#02h)), XAR3 || OR AR1, AC2
            ADD AC1, AC2 || MOV AR6, AR7
            MOV AC2, dbl(*SP(#08h)) || MOV AR7, AC0
            SFTL AC0, #1 || BCLR ST1_FRCT
            MOV #127, AR1 || ADD AC0, AR3
            MOV XAR3, dbl(*SP(#06h)) || BCLR ST3_SMUL
            MOV HI(AC2), AR6
            MOV *SP(#0ah), AC0 || MIN AR1, AR6
            BFXTR #65534, AC0, T0
            MPYMU *AR3(#0001h), T0, AC0
            SFTS AC0, #-15, AC0 || BSET ST1_FRCT
            MACM *AR3, T0, AC0, AC0 || BCLR ST1_FRCT
            SUB AC0, dbl(*AR3), AC2
            MOV AC3, T0
            SFTS AC2, T0, AC2
            MOV *SP(#09h), AR1 || MOV AR6, AC0
            MOV AR1, T0
            MOV AR1, *SP(#0ah) || SFTL T0, #-1
            MOV dbl(*SP(#02h)), XAR1 || SFTL AC0, #1
            ADD AC0, AR1
            MPYMU *AR1(#0001h), T0, AC0
            SFTS AC0, #-15, AC0 || BSET ST1_FRCT
            MACM *AR1, T0, AC0, AC0 || BCLR ST1_FRCT
            BSET ST1_M40
            MOV AC3, T0
            SFTS AC0, T0, AC0
            ADD AC0, AC2 || MOV AR6, AR1
            SUB AR7, AR1 || MOV #2, AR2
            CMP AR1 < AR2, TC1
            BCC loc_028085, TC1 || SUB #2, AR1
            MOV AR1, BRC0
            ADD #2, AR3
            RPTBLOCAL loc_028083
               MOV dbl(*AR3+), AC1
               SFTS AC1, T0, AC1
loc_028083:    ADD AC1, AC2
loc_028085: MOV AR5, AR7
            MANT AC2, AC0 :: NEXP AC2, T0
            MOV #-59, AR1 || ADD T0, AR7
            CMP AR7 < AR1, TC1
            BCLR ST1_M40
            MOV #-30720, *AR4
            BCC loc_0280b1, TC1 || MOV HI(AC0), T0
            BCC loc_0280b1, T0 == #0
            ADD #30, AR7, T1
            .vli_off
            CALL sub_02410f || MOV #5, AR0
            .vli_on
            MOV T3, AR1
            ADD T0, AR1
            MOV AR1, *AR4
loc_0280b1: SUB #1, T2
            AMAR *AR4+ || ADD #1, AR1
            BCC loc_027fff, T2 != #0
loc_0280bb: BCLR ST3_SMUL
            BCLR ST1_FRCT
            AADD #12, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0280cb: PSH T3, T2
            MOV #13107, AR2
            MOV *AR1, T1 || CMP AR2 < T0, TC1
            BCC loc_02812f, TC1
            MOV #6554, AR2
            CMP AR2 < T0, TC1
            BCC loc_0280f1, TC1
            MOV #4369, AR2
            CMP AR2 < T0, TC1
            MOV #2, AR2
            XCCPART TC1 || MOV #1, AR2
            B loc_0280f3
loc_0280f1: MOV #0, AR2
loc_0280f3: ADD #1, AR2, AR3
            MOV AR3, HI(AC0)
            MOV #-13108 << #16, AC1
            SFTL AC1, #0, AC1
            MPY T0, AC0, AC0
            SFTS AC0, #16, AC0
            MAS T1, AC1, AC0
            MOV HI(AC0), AR4
            AADD AR2, AR0 || BSET ST1_FRCT
            AMAR *AR0(short(#1)), XAR3
            MOV AR2, BRC0
            MOV T0, HI(AC1)
            BSET ST1_SATD
            MPYK #-7680, AC1, AC3
            RPTB loc_02812b
               MOV *AR3- << #16, AC1
               ADD AC3, AC1
               MOV *AR0, T3 || MOV HI(AC1), T2
               CMP T3 >= T2, TC1
               SUB T0, AR4
loc_02812b:    XCCPART !TC1 || MOV T2, *AR0-
loc_02812f: MOV #-6554 << #16, AC0
            BCLR ST1_FRCT || SFTL AC0, #0, AC1
            MOV #-13108 << #16, AC0
            BCLR ST1_SATD || SFTL AC0, #0, AC0
            MPY T0, AC0, AC0
            SFTS AC0, #-3, AC0
            MAC AC1, T1, AC0, AC0
            POP T3, T2
            MOV HI(AC0), *AR1 || RET
sub_02814e: BCC loc_02816a, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            BSET ST1_SATD
            MOV #30719, AR1 || RPTBLOCAL loc_028168
               MOV #170, AR2
               ADD *AR0, AR2, AR2
               MIN AR1, AR2
loc_028168:    MOV AR2, *AR0+
loc_02816a: BCLR ST1_SATD
            RET
sub_02816e: MOV #0, AC0
            BCC loc_028185, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            MOV dbl(*AR0+), AC1
            RPTBLOCAL loc_028180
               ABS AC1, AC1
loc_028180:    MOV dbl(*AR0+), AC1 || MAX AC1, AC0
loc_028185: MANT AC0, AC0 :: NEXP AC0, T0
            XCCPART AC0 == #0 || MOV #0, T0
            RET
sub_02818e: BCC loc_0281ab, T0 <= #0 || BSET ST1_FRCT
            SUB #1, T0, AR2
            BSET ST3_SMUL
            MOV AR2, BRC0
            MOV XAR1, XAR2
            SQRM *AR1+, AC0 || RPTBLOCAL loc_0281a5
               SQAM *AR1+, AC0, AC0
loc_0281a5:    SQRM *AR1+, AC0 || MOV AC0, dbl(*AR0+)
loc_0281ab: BCLR ST3_SMUL
            BCLR ST1_FRCT
            RET
sub_0281b1: PSH T2
            BCC loc_0281cb, T1 == #0
            BCC loc_0281cf, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, BRC0
            RPTBLOCAL loc_0281c7
               NEG T1, T2
               MOV *AR1+, AC0
               SFTS AC0, T2, AC0
loc_0281c7:    MOV AC0, *AR0+
            B loc_0281cf
loc_0281cb: .vli_off
 CALL sub_02b5d4
 .vli_on
loc_0281cf: POP T2
            RET
sub_0281d3: MOV #0, AR2
            BCC loc_0281e8, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            MOV *AR0+, AR1
            RPTBLOCAL loc_0281e4
               ABS AR1, AR1
loc_0281e4:    MOV *AR0+, AR1 || MAX AR1, AR2
loc_0281e8: MOV AR2, HI(AC0)
            MOV #0, T1
            XCCPART AC0 != #0 || EXP AC0, T1
            NEG T1, T0
            RET
sub_0281f5: AADD #-1, SP
            BCC loc_028215, T1 == #0
            MOV #2, AR2
            MOV *AR1+ << #16, AC0 || CMP T0 < AR2, TC1
            BCC loc_028210, TC1
            SUB #2, T0, AR2
            MOV AR2, CSR
            RPT CSR
               MOV *AR1+ << #16, AC0 || MOV HI(AC0 << T1), *AR0+
loc_028210: MOV HI(AC0 << T1), *AR0+
            B loc_028219
loc_028215: .vli_off
 CALL sub_02b5d4
 .vli_on
loc_028219: AADD #1, SP
            RET
sub_02821d: PSH T3, T2
            AADD #-3, SP
            MOV XAR0, XAR4
            MOV XAR1, XAR3
            MOV XAR2, dbl(*SP(#00h))
            MOV XAR3, XAR0
            CALL sub_0281d3 || MOV T0, T3
            MOV T0, T2
            MOV XAR3, XAR1
            MOV XAR4, XAR0
            MOV T3, T0
            CALL sub_0281f5 || NEG T2, T1
            MOV dbl(*SP(#00h)), XAR3
            ADD *AR3, T2, AR1
            MOV AR1, *AR3
            AADD #3, SP
            POP T3, T2
            RET
sub_02824a: MOV #2, AR2
            MOV *AR0+, AC0 || CMP T0 < AR2, TC1
            MOV #0, AR3
            BCC loc_02826c, TC1
            SUB #2, T0, AR4
            MOV AR4, BRC0
            MOV *AR0+, AC1 || MOV #1, AR2
            RPTBLOCAL loc_028268
               MAX AC1, AC0
               XCCPART !Carry || MOV AR2, AR3
loc_028268:    MOV *AR0+, AC1 || ADD #1, AR2
loc_02826c: MOV AR3, T0
            MOV AC0, AR1
            RET
sub_028272: MOV #2, AR2
            MOV *AR0+, AC0 || CMP T0 < AR2, TC1
            BCC loc_02826c, TC1
            SUB #2, T0, AR4
            MOV AR4, CSR
            MOV *AR0+, AC1
            RPT CSR
               MOV *AR0+, AC1 || MAX AC1, AC0
            MOV AC0, T0
            RET
sub_02828e: BCC loc_0282a6, AR2 <= #0
            SUB #1, AR2
            MOV AR2, BRC0
            SUB T0, T1
            BSET ST1_SATD
            MOV dbl(*AR1+), AC1
            RPTBLOCAL loc_0282a3
               MOV dbl(*AR1+), AC1 || SFTS AC1, T1, AC0
loc_0282a3:    MOV rnd(HI(saturate(AC0))), *AR0+
loc_0282a6: BCLR ST1_SATD
            RET
sub_0282aa: PSHBOTH XAR5
            MOV XAR1, XAR4
            MOV XAR0, XAR5
            MOV XAR2, XAR3
            MOV XAR4, XAR0
            CALL sub_02816e || MOV T0, AR2
            MOV XAR4, XAR1
            MOV XAR5, XAR0
            CALL sub_02828e || MOV #0, T1
            ADD *AR3, T0, AR1
            MOV AR1, *AR3
            POPBOTH XAR5
            RET
sub_0282cb: MOV #2, AR1
            MOV dbl(*AR0), AC0 || CMP T0 < AR1, TC1
            MOV #0, AR2
            BCC loc_0282f7, TC1
            SUB #2, T0, AR3
            MOV AR3, BRC0
            ADD #2, AR0
            MOV #1, AR1
            RPTBLOCAL loc_0282f5
               MOV dbl(*AR0), AC1
               CMP AC0 >= AC1, TC1
               XCCPART !TC1 || MOV dbl(*AR0), AC0
               ADD #2, AR0
               XCCPART !TC1 || MOV AR1, AR2
loc_0282f5:    ADD #1, AR1
loc_0282f7: MOV AR2, T0
            RET
sub_0282fb: BCC loc_02830f, T0 <= #0
            SUB AR2, T1
            SUB #1, T0, AR2
            MOV AR2, CSR
            MOV *AR1+ << #16, AC1 || RPT CSR
               MOV *AR1+ << #16, AC1 || MOV HI(saturate(AC1 << T1)), *AR0+
loc_02830f: RET
sub_028311: BCC loc_028325, T0 <= #0
            SUB AR2, T1
            SUB #1, T0, AR2
            MOV AR2, CSR
            MOV *AR1+ << #16, AC1 || RPT CSR
               MOV *AR1+ << #16, AC1 || MOV HI(AC1 << T1), *AR0+
loc_028325: RET
sub_028327: MOV #0, AC0
            BCC loc_028336, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, CSR
            RPT CSR
               ADD *AR0+, AC0, AC0
loc_028336: RET
sub_028338: MOV #2, AR2
            BSET ST1_FRCT
            MOV T1, HI(AC0) || BSET ST3_SMUL
            CMP T0 < AR2, TC1
            MPYM *AR1+, AC0, AC1
            BCC loc_028355, TC1
            SUB #2, T0, AR2
            MOV AR2, CSR
            RPT CSR
               MPYM *AR1+, AC0, AC1 || MOV HI(AC1), *AR0+
loc_028355: BCLR ST3_SMUL
            BCLR ST1_FRCT
            MOV HI(AC1), *AR0+
            RET
sub_02835d: PSH T2
            MOV #0, AR4
            BSET ST1_FRCT
            BSET ST3_SMUL
            SUB #1, T0
            CMP T0 < AR4, TC1
            MPYM *AR1+, T1, AC1
            BCC loc_02837b, TC1
            MOV T0, CSR
            MOV AR2, T2
            SUB AR3, T2
            RPT CSR
               MPYM *AR1+, T1, AC1 :: MOV HI(AC1 << T2), *AR0+
loc_02837b: BCLR ST1_FRCT
            BCLR ST3_SMUL
            POP T2
            RET
sub_028383: AADD #-1, SP
            MOV #0, AC0
            BCC loc_028394, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, CSR
            RPT CSR
               ADD *AR0+, AC0, AC0
loc_028394: .vli_off
 CALL sub_02400e
 .vli_on
            MOV AC0, T0
            AADD #1, SP
            RET
sub_02839e: AMAR *(#word_e30e), XAR3
            MOV #15, BRC0 || PSH T3, T2
            AADD #15, AR0 || MOV T0, T2
            SUB #6, T1, T0 || PSHBOTH XAR5
            AADD #15, AR2 || PSHBOTH XAR6
            AADD #15, AR1 || PSHBOTH XAR7
            AADD #-102, SP
            MOV AC0, dbl(*SP(#60h)) || BSET ST1_FRCT
            MOV *AR3(T0), AR6 || MOV #1, AC0
            SFTS AC0, T2, AC0 || MOV #7, AR3
            AMAR *SP(#20h), XAR4 || CMP T1 >= AR3, TC1
            XCCPART !TC1 || MOV #4, AR7
            AMAR *SP(#40h), XAR5 || MOV AC0, T0
            XCCPART TC1 || MOV #2, AR7
            AMAR *SP(#00h), XAR3 || RPTB loc_028449
               MOV #32767 << #16, AC0
               SUB *AR0 << #16, AC0, AC0
               MOV #32767 << #16, AC1 || SQR AC0, AC0
               MPYM *AR2, AC0, AC0
               MOV *AR1 << #16, AC2 || SFTS AC0, #-4, AC0
               SQRM *AR0, AC3 || MOV AC0, dbl(*AR3+)
               MOV #32767 << #16, AC0 || SUB AC2, AC1
               OR #65535, AC0, AC0
               SFTS AC0, #0, AC2
               SQR AC1, AC1
               SUB AC3, AC0
               MOV HI(AC0), T3 || SFTS AC3, #-16, AC3
               MPY T3, AC1, AC0
               SFTS AC0, #-17, AC0
               ADD AC0, AC3
               SFTS AC3, #16, AC0
               MPYM *AR2, AC0, AC0
               SFTS AC0, #-4, AC0
               SQRM *AR0-, AC1 || MOV AC0, dbl(*AR4+)
               SUB AC1, AC2
               MOV HI(AC2), T1 || SFTS AC1, #-16, AC1
               SQRM *AR1, AC0
               MPY T1, AC0, AC0
               SFTS AC0, #-17, AC0
               ADD AC0, AC1
               SFTS AC1, #16, AC0
               MPYM *AR2-, AC0, AC0
               AMAR *AR1- || SFTS AC0, #-4, AC0
loc_028449:    MOV AC0, dbl(*AR5+)
            MOV #32767 << #16, AC0
            OR #65535, AC0, AC0
            MOV AC0, dbl(*SP(#62h)) || MOV #0, AR1
            BCC loc_0284a7, AR6 <= #0
            SUB #1, AR6, AR3
            MOV AR3, BRC0
            AMAR *(#word_e312), XAR2
            MOV #-1, AR4
            MOV #2, T1
            MOV #15, BRC1
            MOV T0, T3
            MOV #2, T0
            RPTBLOCAL loc_0284a3
               MOV dbl(*AR2), AC2 || AADD AR7, AR2
               AMAR *SP(#20h), XAR0
               AMAR *SP(#40h), XAR5
               RPTBLOCAL loc_028496 || MOV #0, AC3
                  AND #3, AC2, AR3 || SFTS AC2, #-2, AC2
                  MOV dbl(*AR0+), AC1 || CMP AR3 == T1, TC1
                  XCCPART !TC1 || MOV dbl(*AR5), AC1
loc_028496:       AMAR *(AR5+T0) || ADD AC1, AC3
               CMP AC3 >= AC0, TC1 || ADD #1, AR4
               XCCPART !TC1 || MOV AR4, AR1
loc_0284a3:    XCCPART !TC1 || MOV AC3, AC0
loc_0284a7: MOV AC0, dbl(*SP(#62h))
            MOV #4, AR2
            CMP T2 == AR2, TC1
            BCC loc_0284d7, TC1
            MOV #5, AR2
            CMP T2 == AR2, TC1
            BCC loc_0284cf, TC1
            MOV #6, AR2
            CMP T2 == AR2, TC1
            AMAR *(#word_e20a), XAR2
            XCC TC1
            AMAR *(#word_e1ca), XAR2
            B loc_0284dd
loc_0284cf: AMAR *(#word_e1aa), XAR2
            B loc_0284dd
loc_0284d7: AMAR *(#word_e19a), XAR2
loc_0284dd: MOV #21845, AC1
            MOV dbl(*SP(#60h)), AC0
            AND AC1, AC0
            MOV AC0, dbl(*SP(#60h))
            BCC loc_028550, T3 <= #0
            SUB #1, T3, AR3
            MOV AR3, BRC0
            MOV #0, AR4
            MOV #15, BRC1
            RPTB loc_02854c || MOV #1, T1
               MOV *AR2, AR3
               AND #65535, AR3, AC2
               MOV dbl(*SP(#60h)), AC1 || OR #0, AC2, AC0
               AMAR *SP(#00h), XAR0 || XOR AC1, AC0
               AMAR *SP(#40h), XAR5 || SFTS AC0, #2, AC1
               AND AC0, AC1
               SFTS AC2, #16, AC0 || MOV #0, AC3
               MOV dbl(*SP(#60h)), AC0 || OR AC0, AC1
               MOV #0, AC0 || AND AC0, AC2
               RPTBLOCAL loc_028538 || OR AC1, AC2
                  AND #3, AC2, AR3 || SFTS AC2, #-2, AC2
                  MOV dbl(*AR0+), AC1 || CMP AR3 == T1, TC1
                  XCCPART !TC1 || MOV dbl(*AR5), AC1
loc_028538:       AMAR *(AR5+T0) || ADD AC1, AC3
               SUB dbl(*SP(#62h)), AC3, AC0
               XCCPART AC0 < #0 || MOV AR6, AR1
               XCCPART AC0 < #0 || MOV AC3, dbl(*SP(#62h))
               XCCPART AC0 < #0 || ADD AR4, AR1
loc_02854c:    AMAR *AR2+ || ADD #1, AR4
loc_028550: AADD #102, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            MOV AR1, AC0
            BCLR ST1_FRCT
            RET
sub_028560: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR1, XAR7
            AADD #-2, SP
            AMAR *AR0, XAR5 || MOV #1, AR1
            MOV AC0, dbl(*SP(#00h)) || CMP T0 == AR1, TC1
            MOV *SP(#08h), T3 || MOV T1, T2
            BCC loc_028595, TC1
            SUB #7, T2, T1
            MOV #64, AC0
            SFTS AC0, T1, AC0
            MOV #0, AC0 || MOV AC0, AR6
            MOV AC0, dbl(*AR7)
            MOV AC0, dbl(*AR5)
            B loc_0285bf
loc_028595: AMAR *AR2, XAR0
            MOV dbl(*SP(#00h)), AC0
            AMAR *AR3, XAR1 || MOV T2, T0
            AMAR *AR4, XAR2 || MOV T3, T1
            CALL sub_02839e
            MOV AC0, AR6
            MOV T2, T1
            MOV dbl(*SP(#00h)), AC0 || MOV #1, T0
            AMAR *AR7, XAR1 || MOV T3, AR2
            AMAR *AR5, XAR0 || MOV AR6, AR3
            .vli_off
            CALL sub_02afd2
            .vli_on
loc_0285bf: AADD #2, SP
            POPBOTH XAR7 || MOV AR6, T0
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0285cd: PSH T3, T2
            MOV #12, AR1 || MOV AR1, T2
            MOV mmap(@T1), AC0
            MIN AR1, AC0 || PSHBOTH XAR5
            PSHBOTH XAR6 || MOV AC0, T3
            MOV #1, AC0 || PSHBOTH XAR7
            AADD #-8, SP
            MOV XAR4, dbl(*SP(#00h)) || SFTS AC0, T3, AC0
            MOV AC0, *SP(#03h) || SUB T3, T1
            MOV T1, *SP(#02h)
            BCC loc_02867d, T0 <= #0
            AMAR *AR3, XAR7
            AMAR *AR0, XAR5
            AMAR *AR2, XAR6
            MOV T0, *SP(#04h)
            NOP
            NOP
loc_028600: BSET ST1_FRCT
            MPYM *AR6, T2, AC0
            SFTS AC0, #-3, AC0
            MOV HI(AC0), *SP(#05h)
            MOV *AR7, AC0
            SUB AC0, *AR5, AC0
            SFTS AC0, #16, AC0
            MOV HI(AC0), AR1
            MOV *SP(#05h), AR1 || MOV AR1, HI(AC1)
            MOV AR1, HI(AC0)
            SFTS AC0, #-1
            ADD AC1, AC0
            MOV HI(AC0), AR3
            MOV *SP(#03h), AR2
            BCC loc_02863c, AR3 < #0
            CMP AR3 >= AR1, TC1
            BCC loc_028636, TC1
            BCLR ST1_FRCT
            MOV AR1, T0
            MOV T3, T1
            .vli_off
            CALL sub_02b49e
            .vli_on
            B loc_02863e
loc_028636: SUB #1, AR2, T0
            B loc_02863e
loc_02863c: MOV #0, T0
loc_02863e: MOV dbl(*SP(#00h)), XAR0
            MOV T0, *SP(#06h) || BCLR ST1_FRCT
            MOV *SP(#06h), T1 || MOV T3, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV *SP(#02h), AR1
            BCC loc_02865c, AR1 <= #0
            MOV dbl(*SP(#00h)), XAR0
            MOV #0, T1 || MOV AR1, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
loc_02865c: MOV *SP(#05h), T1
            MOV *SP(#03h), AR0
            MOV *SP(#06h), T0 || MOV T3, AR1
            .vli_off
            CALL sub_02b4b1
            .vli_on
            MOV T0, AC0
            ADD *AR7+, AC0, AC0
            SFTS AC0, #16, AC0
            MOV HI(AC0), *AR5+
            ADD #-1, *SP(#04h)
            MOV *SP(#04h), AR1
            AMAR *AR6+
            BCC loc_028600, AR1 != #0
loc_02867d: AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028689: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            AMAR *AR1, XAR5 || MOV T1, HI(AC0)
            MOV AC0, dbl(*SP(#02h))
            AMAR *AR2, XAR6
            MOV dbl(*SP(#02h)), AC0 || MOV #5, T1
            AMAR *AR0, XAR7 || MOV T0, T2
            MOV XAR3, dbl(*SP(#00h)) || SFTS AC0, #-5, AC0
            .vli_off
            CALL sub_02b49e
            .vli_on
            MOV T0, *SP(#04h)
            NOP
            MPYM *SP(#04h), T2, AC0
            MOV AC0, AR1
            MOV dbl(*SP(#02h)), AC0 || MOV AR1, HI(AC1)
            SUB AC1, AC0
            MOV HI(AC0), T3
            BCC loc_0286f3, T3 <= #0
            MOV T0, AR1 || MOV #8, AR2
            CMP AR1 >= AR2, TC1
            ADD #1, AR1, T1
            BCC loc_0286dd, TC1
            AMAR *(#word_d870), XAR3
            MOV *AR3(T0), AR1
            B loc_0286e2
loc_0286dd: MOV *(#word_d877), AR1
loc_0286e2: MOV dbl(*SP(#00h)), XAR4
            AMAR *AR6, XAR2
            AMAR *AR7, XAR0
            AMAR *AR5, XAR3 || MOV T3, T0
            CALL sub_0285cd
loc_0286f3: ADD #-1, *SP(#04h)
            MOV *SP(#04h), AR1
            BCC loc_028736, AR1 < #0
            MOV #8, AR2
            CMP AR1 >= AR2, TC1
            ADD #1, AR1, T1
            BCC loc_028713, TC1
            MOV AR1, T0
            AMAR *(#word_d870), XAR3
            MOV *AR3(T0), AR1
            B loc_028718
loc_028713: MOV *(#word_d877), AR1
loc_028718: AADD T3, AR6 || AADD T3, AR5
            AMAR *AR7, XAR0
            MOV dbl(*SP(#00h)), XAR4
            AMAR *AR5, XAR3
            AMAR *AR6, XAR2 || MOV T2, T0
            AADD T3, AR0 || SUB T3, T0
            CALL sub_0285cd
            B loc_02874a
loc_028736: AADD T3, AR5
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1 || MOV T2, T0
            AADD T3, AR0 || SUB T3, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
loc_02874a: AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028756: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            AMAR *AR1, XAR5
            AMAR *AR0, XAR7
            MOV AR3, *SP(#03h) || MOV T1, T3
            MOV T0, *SP(#02h) || MOV AR2, T2
            MOV XAR4, dbl(*SP(#00h)) || CMP T3 >= T2, TC1
            MOV dbl(*SP(#0ch)), XAR6
            BCC loc_028788, TC1
            SUB T3, T2
            MOV #1, AC0
            SFTS AC0, T2, AC0
            MOV AC0, T1
            MPYM *SP(#03h), T1, AC0
            MOV AC0, *SP(#03h)
            MOV T3, T2
loc_028788: MOV #1, AC0
            SFTS AC0, T2, AC0
            MOV *SP(#03h), AR2 || MOV AC0, T1
            .vli_off
            CALL sub_02b3cb
            .vli_on
            MOV T0, *SP(#04h)
            AMAR *AR6, XAR0
            MOV *SP(#04h), T1 || MOV T2, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            SUB T2, T3
            BCC loc_0287be, T3 != #0
            MOV *SP(#04h) << #16, AC0
            MPYM *SP(#03h), AC0, AC0
            MOV AC0, AR1
            AMAR *AR7, XAR0
            MOV *SP(#02h), T0 || AADD AR1, AR5
            AMAR *AR5, XAR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
            B loc_0287db
loc_0287be: MOV *SP(#04h) << #16, AC0
            MPYM *SP(#03h), AC0, AC0
            MOV AC0, AR1
            MOV dbl(*SP(#00h)), XAR2
            AMAR *AR6, XAR3
            AMAR *AR7, XAR0
            MOV *SP(#02h), T0 || AADD AR1, AR5
            AMAR *AR5, XAR1 || MOV T3, T1
            CALL sub_028689
loc_0287db: AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0287e7: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR0, XAR5 || PSHBOTH XAR7
            AADD #-4, SP
            AMAR *AR2, XAR6
            MOV XAR1, dbl(*SP(#00h))
            AMAR *AR6, XAR0
            AMAR *AR3, XAR7 || MOV #8, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
            MOV T0, T2
            AMAR *AR6, XAR0 || MOV #8, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
            MOV T0, T3
            MOV T3, HI(AC0)
            MPYK #30840, AC0, AC0
            SFTS AC0, #8, AC0
            MOV HI(AC0), T3
            BCC loc_02885b, T2 < #0
            MOV #16, AR1
            CMP T2 < AR1, TC1
            BCC loc_028855, TC1
            MOV #20, AR1
            CMP T2 < AR1, TC1
            BCC loc_02884f, TC1
            MOV #37, AR1
            CMP T2 < AR1, TC1
            BCC loc_02885b, TC1
            MOV #154, AR1
            CMP AR1 < T2, TC1
            BCC loc_02885b, TC1
            SUB #32, T2, T2
            B loc_02885d
loc_02884f: ADD #144, T2, T2
            B loc_02885d
loc_028855: ADD #128, T2, T2
            B loc_02885d
loc_02885b: MOV #-1, T2
loc_02885d: AMAR *AR5, XAR0
            MOV #56, T1
            MOV #-20480, T0
            AADD #8, AR0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #128, AR1
            CMP T2 < AR1, TC1
            MOV #3, *AR5
            BCC loc_028886, TC1
            MOV #164, AR1
            CMP T2 < AR1, TC1
            BCC loc_02895f, TC1
loc_028886: MOV #5, AR1
            CMP T2 < AR1, TC1
            BCC loc_028957, TC1
            MOV #122, AR1
            CMP AR1 < T2, TC1
            BCC loc_028957, TC1
            MOV T2, AC0
            MOV *AR7(short(#4)), AR1 || SFTS AC0, #-4, AC0
            MOV AC0, AR6
            BCC loc_0288e8, AR1 <= #0
            MOV #2, AR2 || SUB AR6, AR1
            XCCPART AR1 < #0 || NEG AR1, AR1
            CMP AR1 >= AR2, TC1
            BCC loc_0288e8, TC1
            AMAR *(#010000h), XAR3
            MOV *AR7(short(#4)), AR1
            MOV XAR3, AC0
            MOV AR1, HI(AC1)
            ADD AC1, AC0
            SFTS AC0, #8, AC0
            MOV T2, HI(AC0) || MOV HI(AC0), T1
            SFTS AC0, #4, AC1
            MOV #-586 << #16, AC0
            SFTL AC0, #0, AC2
            OR #0, AC1, AC0
            MAS T1, AC2, AC0
            BCC loc_0288e8, AC0 >= #0
            MOV T1, AC0
            SFTS AC0, #12, AC2
            ADD AC0 << #14, AC2
            SUB AC2, AC1
            XCCPART AC1 > #0 || MOV AR1, AR6
loc_0288e8: AMAR *(#010000h), XAR3
            MOV AR6, HI(AC2)
            MOV AR6, AC0
            MOV XAR3, AC1
            ADD AC2, AC1
            MOV AC0, dbl(*SP(#02h)) || MOV T2, HI(AC0)
            SFTS AC1, #8, AC1
            MOV HI(AC1), T0 || SFTS AC0, #4, AC0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV #56, AR1
            ADD #1, AR6, AR2
            MOV AC0, *AR5(short(#6)) || CMP AR6 >= AR1, TC1
            MOV AR2, *AR5(short(#2))
            BCC loc_028921, TC1
            MOV #9, AR1
            MOV mmap(@AR2), AC0
            B loc_028925 || MAX AR1, AC0
loc_028921: MOV #56, AC0
loc_028925: MOV #30720, AR1
            CMP T3 >= AR1, TC1
            MOV AC0, *AR5(short(#2))
            BCC loc_02893c, TC1
            MOV #-20480, AR1
            MOV T3, AC0
            MAX AR1, AC0
            B loc_028940 || MOV AC0, T3
loc_02893c: MOV #30719, T3
loc_028940: AMAR *AR5, XAR3
            MOV dbl(*SP(#02h)), AC0 || AADD AR6, AR3
            MOV T3, *AR3(#0008h)
            MOV T2, *AR5(short(#1))
            MOV AC0, dbl(*AR5(short(#4)))
            MOV AR6, *AR7(short(#4))
            B loc_0289e6
loc_028957: MOV #-1, *AR7(short(#4))
            B loc_0289e8 || MOV #1, T2
loc_02895f: SUB #128, T2, T2
            MOV T2, T0
            AMAR *(#word_e9e3), XAR3
            MOV #(word_ea07 >> 16) << #16, AC0 || MOV T2, AC1
            OR #(word_ea07 & 0xffff), AC0, AC0
            SFTL AC1, #1
            MOV *AR3(T0), AR1 || ADD AC1, AC0
            MOV AC0, XAR3
            MOV AR1, *AR5(short(#6))
            MOV *AR3, AR1
            AMAR *AR3+
            MOV *AR3, AR2
            ADD #1, AR2, AR4
            MOV AR4, *AR5(short(#2))
            MOV *AR3, AR3
            MOV #56, AR4
            ADD #1, AR3
            CMP AR4 < AR3, TC1
            BCC loc_0289a1, TC1
            MOV mmap(@AR3), AC0
            MOV #9, AR3
            B loc_0289a5 || MAX AR3, AC0
loc_0289a1: MOV #56, AC0
loc_0289a5: MOV #28672, AR3
            CMP T3 >= AR3, TC1
            MOV AC0, *AR5(short(#2))
            BCC loc_0289bc, TC1
            MOV #-20480, AR3
            MOV T3, AC0
            MAX AR3, AC0
            B loc_0289c0 || MOV AC0, T3
loc_0289bc: MOV #28671, T3
loc_0289c0: AMAR *AR5, XAR3
            AADD AR1, AR3
            MOV T3, *AR3(short(#7)) || MOV AR1, AC1
            AMAR *AR5, XAR3 || MOV AR2, AC0
            AADD AR2, AR3 || ADD AC1 << #8, AC0
            ADD #128, T2, AR1
            MOV T3, *AR3(short(#7))
            MOV mmap(@AC0L), AC0
            MOV AR1, *AR5(short(#1))
            MOV AC0, dbl(*AR5(short(#4)))
            MOV #-1, *AR7(short(#4))
loc_0289e6: MOV #0, T2
loc_0289e8: MOV dbl(*SP(#00h)), XAR0
            AMAR *AR5, XAR1
            .vli_off
            CALL sub_02b593
            .vli_on
            AADD #4, SP
            POPBOTH XAR7
            POPBOTH XAR6
            MOV T2, T0
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028a00: PSH T3, T2
            PSHBOTH XAR5
            MOV #0, AC0 || MOV T1, T3
            MOV #56, T1 || PSHBOTH XAR6
            AMAR *AR0, XAR5 || PSHBOTH XAR7
            AADD #-2, SP
            MOV #3, *AR5
            MOV AC0, dbl(*AR5(short(#4))) || AADD #8, AR0
            MOV #-20479, T0 || MOV T0, AR7
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV T3, T0
            .vli_off
            CALL sub_02a937
            .vli_on
            BCC loc_028a95, T0 == #0
            MOV #2, AR2
            SUB #1, T0, AR1
            CMPU AR2 >= AR1, TC1
            BCC loc_028a4a, TC1
            MOV #4, AR1
            CMP T0 == AR1, TC1
            BCC loc_028af5, !TC1
            B loc_028b10 || MOV #0, T0
loc_028a4a: SUB #128, T3, T0
            MOV #(word_ea07 >> 16) << #16, AC0 || MOV T3, AC1
            AMAR *(#word_e9e3), XAR3
            OR #(word_ea07 & 0xffff), AC0, AC0
            SFTL AC1, #1
            MOV *AR3(T0), AR1 || ADD AC1, AC0
            MOV AC0, XAR3
            AMAR *AR3, XAR2
            AMAR *+AR2(#-0100h)
            MOV XAR5, AC1
            MOV *AR2, AC2
            ADD AC2, AC1
            MOV AC1, XAR4
            AMAR *+AR3(#-00ffh)
            MOV AR1, *AR5(short(#6))
            MOV XAR5, AC0
            MOV *AR3, AC1
            MOV AR7, *AR4(short(#7)) || ADD AC1, AC0
            MOV AC0, XAR4
            MOV *AR3, AR1
            MOV *AR2 << #8, AC0
            OR AR1, AC0
            MOV AR7, *AR4(short(#7))
            MOV mmap(@AC0L), AC0
            B loc_028af0
loc_028a95: MOV T3, AC0
            AMAR *(#010000h), XAR3
            SFTS AC0, #-4, AC0
            MOV AC0, AR6
            MOV XAR3, AC1
            MOV AR6, HI(AC0)
            ADD AC0, AC1
            SFTS AC1, #0, AC0
            EXP AC0, T2
            MOV #23, AR0 || MOV T3, HI(AC0)
            OR #0, AC0, AC2
            EXP AC2, T1 || MOV #15, T0
            AMAR *SP(#00h), XAR1 || SUB T1, T0
            SUB T2, AR0 || SFTS AC1, T2, AC1
            MOV HI(AC1), T1 || SFTS AC0, T1, AC0
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *SP(#00h), T1
            ADD #4, T1
            MOV T0, HI(AC0)
            SFTS AC0, T1, AC0
            MOV HI(AC0), *AR5(short(#6))
            AMAR *AR5, XAR3
            MOV #30719, AR1
            MOV mmap(@AR7), AC0
            AADD AR6, AR3
            ADD #1, AR6, AR1 || MIN AR1, AC0
            MOV AC0, *AR3(#0008h)
            MOV AR6, AC0
loc_028af0: MOV AC0, dbl(*AR5(short(#4)))
            MOV AR1, *AR5(short(#2))
loc_028af5: MOV *AR5(short(#2)), AR1
            MOV #56, AR2
            MOV T3, *AR5(short(#1)) || CMP AR2 < AR1, TC1
            XCCPART !TC1 || MOV #9, AR2
            MAX AR2, AR1
            XCCPART TC1 || MOV #56, AR1
            MOV AR1, *AR5(short(#2)) || MOV #1, T0
loc_028b10: AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028b1c: AADD #-1, SP
            XCCPART T0 == #0 || MOV #0 << #16, AC0
            BCC loc_028b4e, T0 == #0
            .vli_off
            CALL sub_0240d0
            .vli_on
            MOV #30720 << #16, AC1
            SFTS AC1, #-11, AC1
            ADD AC1, AC0
            CMP AC1 < AC0, TC1
            BCC loc_028b48, TC1
            MOV #0, AC1
            SFTS AC1, #-11, AC1
            CMP AC0 >= AC1, TC1
            XCCPART !TC1 || OR #0, AC1, AC0
            B loc_028b4b
loc_028b48: OR #0, AC1, AC0
loc_028b4b: SFTS AC0, #11, AC0
loc_028b4e: MOV HI(AC0), T0
            AADD #1, SP
            RET
sub_028b54: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR2, XAR5 || PSHBOTH XAR7
            AADD #-1, SP
            AMAR *AR1, XAR6
            MOV *AR5(short(#1)), T0 || MOV T0, T2
            AMAR *AR0, XAR7
            .vli_off
            CALL sub_02a937
            .vli_on
            BCC loc_028bc9, T0 == #0
            MOV #2, AR2
            SUB #1, T0, AR1
            CMPU AR2 >= AR1, TC1
            BCC loc_028bf7, !TC1
            MOV *AR5(short(#1)), AR2
            MOV #(word_e907 >> 16) << #16, AC0 || MOV AR2, AC1
            OR #(word_e907 & 0xffff), AC0, AC0
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR3
            MOV *AR3, AR1
            SUB #1, AR1
            MOV AR2, *AR7
            XCC T2 == #0 || AADD AR1, AR5
            XCC T2 == #0
            MOV *AR5(#0008h), T0
            BCC loc_028bb5, T2 == #0
            AMAR *AR5, XAR3
            MOV *AR5(#0042h), T1
            AADD AR1, AR3
            MOV *AR3(#0008h), T0
            CALL sub_028b1c
loc_028bb5: MOV #2048 << #16, AC0 || MOV T0, HI(AC1)
            ADD AC1, AC0
loc_028bbd: MOV HI(AC0), T0
            .vli_off
            CALL sub_02a9f6
            .vli_on
            MOV T0, *AR6
            B loc_028c00 || MOV #1, T0
loc_028bc9: MOV *AR5(short(#1)), AR1
            MOV AR1, *AR7
            MOV *AR5(short(#1)), AC0
            SFTS AC0, #-4, AC0
            MOV AC0, AR1
            XCC T2 == #0 || AADD AR1, AR5
            XCC T2 == #0
            MOV *AR5(#0008h) << #16, AC0
            BCC loc_028bbd, T2 == #0
            AMAR *AR5, XAR3
            MOV *AR5(#0042h), T1
            AADD AR1, AR3
            MOV *AR3(#0008h), T0
            CALL sub_028b1c
            B loc_028bbd || MOV T0, HI(AC0)
loc_028bf7: MOV #255, *AR7
            MOV #0, T0
            MOV #-90, *AR6
loc_028c00: AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_028c0c: PSH T3, T2
            PSHBOTH XAR5
            AMAR *AR3, XAR5
            AMAR *AR1, XAR3 || PSHBOTH XAR7
            MOV #84, AR1
            CMP AR1 < T0, TC1
            AADD #-69, SP
            AMAR *AR0, XAR7
            BCC loc_028c33, TC1
            MOV #76, AR1
            MOV mmap(@T0), AC0
            MAX AR1, AC0
            B loc_028c37 || MOV AC0, T2
loc_028c33: MOV #84, T2
loc_028c37: MOV #80, *AR5(#00b8h)
            BCC loc_028c60, AR2 != #0
            AMAR *AR3, XAR0
            AMAR *AR5, XAR1
            AMAR *SP(#00h), XAR2 || MOV T1, T0
            AMAR *AR5, XAR3 || MOV T2, T1
            AMAR *+AR1(#01f4h)
            .vli_off
            CALL sub_029eab
            .vli_on
            AMAR *SP(#00h), XAR0 || MOV T0, T3
            B loc_028c6b || MOV #0, T1
loc_028c60: MOV #0, T3
            AMAR *AR5, XAR0 || MOV #1, T1
            AMAR *+AR0(#01f4h)
loc_028c6b: AMAR *AR7, XAR1
            AMAR *AR5, XAR2 || MOV T2, T0
            .vli_off
            CALL sub_0253d6
            .vli_on
            AADD #69, SP
            POPBOTH XAR7
            MOV T3, T0
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028c83: PSH T3, T2
            PSHBOTH XAR5
            MOV T1, T3
            AMAR *AR0, XAR5 || MOV T0, T2
            .vli_off
            CALL sub_02a937
            .vli_on
            MOV #4, AR1
            CMP T0 != AR1, TC1
            XCCPART !TC1 || MOV #32, T2
            AMAR *AR5, XAR0 || MOV T3, T1
            MOV T2, *AR5(#03bch)
            AMAR *+AR0(#03bdh)
            MOV T2, T0
            .vli_off
            CALL sub_02a9b6
            .vli_on
            POPBOTH XAR5
            POP T3, T2
            MOV #16384, T0
            RET
sub_028cba: MOV *AR1, AR2
            MOV AR2, *AR0(#0308h)
            MOV *AR1(short(#1)), AR2
            MOV AR2, *AR0(#0309h)
            MOV *AR1(short(#3)), AR2
            MOV AR2, *AR0(#030bh)
            MOV *AR1(short(#5)), AR2
            MOV AR2, *AR0(#030dh)
            MOV *AR1(#0008h), AR2
            MOV AR2, *AR0(#0310h)
            MOV *AR1(short(#2)), AR2
            MOV AR2, *AR0(#030ah)
            MOV *AR1(short(#4)), AR2
            MOV AR2, *AR0(#030ch)
            MOV *AR1(short(#6)), AR2
            MOV AR2, *AR0(#030eh)
            MOV *AR1(short(#7)), AR1
            MOV AR1, *AR0(#030fh)
            RET
sub_028cf4: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR0, XAR6
            AMAR *AR6, XAR3 || PSHBOTH XAR7
            AADD #-3, SP
            AMAR *+AR3(#0312h)
            MOV XAR3, dbl(*SP(#00h))
            MOV #0, *AR6(#03beh)
            MOV #0, *AR6(#03bfh)
            MOV #0, *AR6(#03c1h)
            MOV #-30, *AR6(#03c2h)
            MOV #7316, *AR6(#03c0h)
            AMAR *+AR0(#0238h)
            .vli_off
            CALL sub_025148
            .vli_on
            AMAR *AR6, XAR0
            AMAR *+AR0(#027ch)
            .vli_off
            CALL sub_025148
            .vli_on
            MOV dbl(*SP(#00h)), XAR5
            MOV dbl(*SP(#00h)), XAR3
            AMAR *AR6, XAR7
            MOV #84, T2
            MOV #0, *AR6(#03bbh)
            AMAR *AR5+
            MOV #0, *AR3 || AADD #12, AR7
loc_028d52: MOV dbl(*SP(#00h)), XAR0
            .vli_off
            CALL sub_0240a9
            .vli_on
            SUB #1, T2
            MOV T0, *AR5+
            BCC loc_028d52, T2 != #0
            MOV dbl(*SP(#00h)), XAR0
            MOV #84, T1
            AADD #85, AR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #0, AC0
            MOV #0, *AR7(#00ach)
            MOV #0, *AR7(#00aah)
            MOV #0, *AR7(#00abh)
            MOV AC0, dbl(*AR7(#00a8h))
            MOV #168, T1
            AMAR *AR7, XAR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #56, T1
            AMAR *AR7, XAR0 || MOV #0, T0
            AMAR *+AR0(#00adh)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #0, *AR7(#00e5h)
            MOV #257, T1
            AMAR *AR7, XAR0 || MOV #0, T0
            AMAR *+AR0(#00e6h)
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR6, XAR0 || MOV #0, AC0
            MOV AC0, dbl(*AR6(short(#2)))
            MOV AC0, dbl(*AR6)
            MOV AC0, dbl(*AR6(short(#6)))
            MOV AC0, dbl(*AR6(short(#4)))
            MOV AC0, dbl(*AR6(#000ah))
            MOV AC0, dbl(*AR6(#0008h))
            AMAR *+AR0(#02c0h)
            .vli_off
            CALL sub_022943
            .vli_on
            MOV #32, T0
            AMAR *AR6, XAR0 || MOV #-10, T1
            CALL sub_028c83
            AADD #3, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_028df5: AMAR *AR1, XAR2
            AADD #-1, SP
            AMAR *AR0, XAR1
            AMAR *+AR2(#0238h)
            AMAR *AR1+ || MOV #1, T0
            .vli_off
            CALL sub_028b54
            .vli_on
            AADD #1, SP
            RET
            NOP
            NOP
            NOP
sub_028e10: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AADD #-32, SP
            MOV AR2, T2 || MOV #1, AC0
            MOV mmap(@AC0L), AC0
            AMAR *SP(#00h), XAR4
            AMAR *SP(#00h), XAR7
            AMAR *SP(#10h), XAR2
            AMAR *SP(#10h), XAR5
            SUB #1, T1, T2 || SFTS AC0, T2, AC0
            ADD T2, AR4
            ADD T2, AR7
            AMAR *AR7-
            ADD T2, AR5
            ADD T2, AR2
            AMAR *AR5-
            BCC loc_028e48, T1 <= #0
            MOV T2, CSR
            AMAR *SP(#00h), XAR3
            RPT CSR
               MOV AC0, *AR3+
loc_028e48: ADD T0, AR1 || MOV #1, AR3
            SUB AR3, AR1
            BCC loc_028f17, T0 <= #0
            SUB #1, T0, AR3
            MOV AR3, BRC0
            MOV #0, T3
            SUB #3, T2, T0
            BCC loc_028ed0, T0 < #0
            NOP_16 || NOP
            RPTB loc_028ecb
               MOV *AR1- << #1, AC3
               SUB AC0, AC3
               ADD #1, AC3, T2
               ABS T2, T2
               SUB T2, *SP(#00h), AC3 || MOV #2, T0
               SUB T2, *SP(#01h), AC3 || BCC loc_028e9a, AC3 <= #0
               MOV *AR7-, *AR4-
               MOV *AR5-, *AR2-
               MOV *AR7-, *AR4-
               MOV *AR5-, *AR2-
               MOV *(AR7+T0), *AR4-
               MOV *(AR5+T0), *AR2-
               MOV T2, *(AR4+T0)
               MOV T3, *(AR2+T0)
               AMAR *AR2+
               AMAR *AR4+ || B loc_028ecb
loc_028e9a:    SUB T2, *SP(#02h), AC3 || BCC loc_028eb2, AC3 <= #0
               MOV *AR7-, *AR4-
               MOV *AR5-, *AR2-
               MOV *AR7+, *AR4-
               MOV *AR5+, *AR2-
               MOV T2, *(AR4+T0)
               MOV T3, *(AR2+T0) || B loc_028ecb
loc_028eb2:    BCC loc_028ec0, AC3 <= #0
               MOV *AR7, *AR4-
               MOV *AR5, *AR2-
               MOV T2, *AR4+
               MOV T3, *AR2+ || B loc_028ecb
loc_028ec0:    SUB T2, *SP(#03h), AC3
               XCCPART AC3 > #0 || MOV T2, *AR4
               XCCPART AC3 > #0 || MOV T3, *AR2
loc_028ecb:    ADD #1, T3
            B loc_028f17
loc_028ed0: RPTB loc_028f15
               MOV *AR1- << #1, AC3
               SUB AC0, AC3
               ADD #1, AC3, T2
               ABS T2, T2
               SUB T2, *SP(#00h), AC3 || MOV #2, T0
               SUB T2, *SP(#01h), AC3 || BCC loc_028efc, AC3 <= #0
               MOV *AR7-, *AR4-
               MOV *AR5-, *AR2-
               MOV *AR7+, *AR4-
               MOV *AR5+, *AR2-
               MOV T2, *(AR4+T0)
               MOV T3, *(AR2+T0) || B loc_028f15
loc_028efc:    BCC loc_028f0a, AC3 <= #0
               MOV *AR7, *AR4-
               MOV *AR5, *AR2-
               MOV T2, *AR4+
               MOV T3, *AR2+ || B loc_028f15
loc_028f0a:    SUB T2, *SP(#02h), AC3
               XCCPART AC3 > #0 || MOV T2, *AR4
               XCCPART AC3 > #0 || MOV T3, *AR2
loc_028f15:    ADD #1, T3
loc_028f17: BCC loc_028f2e, T1 <= #0
            SUB #1, T1, AR1
            MOV AR1, BRC0
            AMAR *SP(#10h), XAR3
            RPTBLOCAL loc_028f2b || MOV #1, AC2
               MOV *AR3+, T1
               SFTS AC2, T1, AC0
loc_028f2b:    MOV AC0, dbl(*AR0+)
loc_028f2e: AADD #32, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028f38: SUB #1, T1, AR2
            MOV #0, AC0
            BCC loc_028f52, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            NEG AR2, T1
            RPTBLOCAL loc_028f50
               MOV *AR0+ << T1, AC1
               SFTS AC0, #1
loc_028f50:    OR AC1, AC0
loc_028f52: RET
sub_028f54: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            MOV T1, T2
            MOV T0, T3
            MOV #8, AR2
            AMAR *AR1, XAR5 || MOV #3, T1
            AMAR *AR0, XAR7 || MOV AR2, AR6
            AMAR *SP(#00h), XAR0 || MOV T2, AR2
            CALL sub_028e10
            MOV T2, T1
            AMAR *AR5, XAR0 || MOV T3, T0
            CALL sub_028f38
            AMAR *SP(#00h), XAR0
            MOV AC0, dbl(*AR7)
            MOV dbl(*AR7+), AC2
            MOV #1, AR2
            SUB #2, AR6, T0
            BCC loc_028fb7, T0 <= #0
            MOV T0, BRC0
            MOV #2, BRC1
            MOV #1, AC3
            RPTBLOCAL loc_028fb4
               MOV #0, T1
               RPTBLOCAL loc_028fac || MOV AC2, AC1
                  SFTS AC3, T1, AC0
                  AND AR2, AC0 || ADD #1, T1
                  MOV dbl(*AR0+), AC0 || MOV AC0, AR3
loc_028fac:       XCCPART AR3 != #0 || XOR AC0, AC1
               AMAR *AR2+ || SUB #6, AR0
loc_028fb4:    MOV AC1, dbl(*AR7+)
loc_028fb7: AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_028fc3: MOV #1, AC1
            SFTS AC1, T1, AC1
            SUB #1, AC1, AR2
            MOV #0, AC1
            BCC loc_028fee, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            AADD AR1, AR0 || RPTB loc_028fec
               BTST @#00h, AC0, TC1
               XCCPART !TC1 || MOV *AR0, T1
               XCCPART TC1 || SUB AR2, *AR0-, T1
               SFTS AC0, #-1
               MOV T1, HI(AC2)
loc_028fec:    MAC AC2, T1, AC1, AC1
loc_028fee: MOV AC1, T0
            RET
sub_028ff2: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AMAR *AR2, XAR5 || PSHBOTH XAR7
            AADD #-22, SP
            MOV XAR1, dbl(*SP(#06h))
            CMP *AR5 == #2, TC1
            MOV XAR0, dbl(*SP(#08h)) || MOV #0, AR1
            XCCPART TC1 || MOV #1, AR1
            MOV AR1, *SP(#0ah)
            MOV T0, *SP(#04h) || MOV T0, AR1
            AMAR *AR5, XAR0 || SFTS AR1, #-1
            MOV AR1, *SP(#0bh)
            MOV T1, *SP(#03h) || MOV AR3, T2
            MOV dbl(*AR5(#0040h)), XAR1
            MOV *AR5(short(#2)), T0 || AADD #8, AR0
            .vli_off
            CALL sub_026db0
            .vli_on
            MOV *SP(#0ah), AR1
            MOV T0, *SP(#0ch)
            BCC loc_02904f, AR1 != #0
            MPYM *AR5(short(#2)), T2, AC0
            MOV #-31050 << #16, AC0 || MOV AC0, T1
            AMAR *SP(#02h), XAR0 || SFTL AC0, #0, AC0
            MOV #17, *SP(#02h) || MPY T1, AC0, AC0
            .vli_off
            CALL sub_024059
            .vli_on
            B loc_02907a
loc_02904f: MOV #-31050 << #16, AC0
            AMAR *SP(#02h), XAR0
            MOV #17, *SP(#02h) || SFTL AC0, #0, AC0
            MPYM *AR5(short(#2)), AC0, AC0
            .vli_off
            CALL sub_024059
            .vli_on
            MOV dbl(*SP(#06h)), XAR3
            MOV *SP(#02h), AR1
            MOV #-20492 << #16, AC0 || MOV HI(AC0), T1
            ADD *AR3, AR1, AR1
            ADD #1, AR1 || SFTL AC0, #0, AC0
            MOV AR1, *SP(#02h) || MPY T1, AC0, AC0
loc_02907a: MOV *SP(#04h), T1
            MOV *SP(#0ch), AR1 || BSET ST1_FRCT
            AMAR *(#010000h), XAR3
            MPYM *AR5(short(#6)), T1, AC0 || MOV HI(AC0), T2
            MOV dbl(*SP(#08h)), XAR0
            ADD *SP(#02h), AR1, AR1 || SFTS AC0, #-4, AC0
            MOV AC0, dbl(*SP(#0eh))
            MOV XAR3, AC0 || ADD #2, AR1
            ADD dbl(*SP(#0eh)), AC0, AC0
            MOV AR1, *SP(#0dh) || SFTS AC0, #-1, AC0
            MOV AC0, dbl(*SP(#10h))
            MOV *SP(#10h), AR1
            MOV AR1, *SP(#12h)
            MOV *SP(#12h) << #1, AC0 || BCLR ST1_FRCT
            MOV AC0, T1 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #0, AR1
            MOV AR1, *SP(#13h)
            MOV *AR5(short(#2)), AR1
            AMAR *AR0, XAR7
            BCC loc_029174, AR1 <= #0
            MOV #0, AR1
            MOV AR1, *SP(#14h)
loc_0290c9: MOV dbl(*SP(#10h)), AC0
            MOV *SP(#12h), AR1
            MOV *SP(#14h), T0
            ADD dbl(*SP(#0eh)), AC0, AC0
            MOV dbl(*AR5(#0040h)), XAR3
            MOV AC0, dbl(*SP(#10h))
            MOV *SP(#10h), AR2
            MOV AR2, *SP(#12h) || SUB AR1, AR2
            MOV AR2, *SP(#15h)
            MOV *AR3(T0), AR1
            BCC loc_029151, AR1 != #0
            MOV *SP(#0ch), AR1
            NEG AR1, T3
            MOV T0, AR1
            AMAR *AR5, XAR6
            MOV *SP(#0ah), AR1 || AADD AR1, AR6
            AADD #8, AR6
            BCC loc_02911b, AR1 != #0
            AMAR *SP(#01h), XAR0
            AMAR *SP(#00h), XAR1
            MOV *SP(#15h), T0
            AMAR *AR7, XAR2
            .vli_off
            CALL sub_026e50
            .vli_on
            NOP
            NOP
            MOV *SP(#02h), AR1 || BSET ST1_FRCT
            MPYM *SP(#01h), T2, AC0
            ADD *SP(#00h), AR1, AR1
            MOV HI(AC0), *SP(#01h)
            B loc_02911f
loc_02911b: MOV T2, *SP(#01h)
            MOV *SP(#02h), AR1
loc_02911f: MOV AR1, *SP(#00h)
            MOV *SP(#01h), T1
            MOV *SP(#0ch), AR1
            MOV *SP(#0dh), AR3 || BSET ST1_FRCT
            MPYM *AR6, T1, AC0
            ADD *SP(#00h), AR1, AR2
            AMAR *AR7, XAR0 || SFTS AC0, T3, AC0
            MOV AR2, *SP(#00h) || MOV HI(AC0), T1
            MOV *SP(#15h) << #1, AC0 || BCLR ST1_FRCT
            AMAR *AR7, XAR1 || MOV AC0, T3
            MOV T1, *SP(#01h) || MOV T3, T0
            .vli_off
            CALL sub_02835d
            .vli_on
            ADD #1, *SP(#13h)
            B loc_029162
loc_029151: MOV *SP(#15h) << #1, AC0
            MOV #0, T0 || MOV AC0, T3
            AMAR *AR7, XAR0 || MOV T3, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
loc_029162: ADD #1, *SP(#14h)
            MOV *AR5(short(#2)), AR2
            MOV *SP(#14h), AR1
            CMP AR1 < AR2, TC1
            AADD T3, AR7
            BCC loc_0290c9, TC1
loc_029174: MOV *SP(#0bh), AR1
            SUB *SP(#12h), AR1, AR1
            MOV mmap(@AR1), AC0
            MOV dbl(*SP(#08h)), XAR0
            MOV *SP(#0bh), AR1
            SUB #121, AR1, AR1
            MOV *SP(#04h), AR1 || MAX AR1, AC0
            SFTS AC0, #1
            MOV AC0, T1
            AADD AR1, AR0 || MOV T1, AR1
            ASUB AR1, AR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            NOP
            NOP
            MOV *SP(#04h) << #16, AC0 || BSET ST1_FRCT
            MPYM *SP(#03h), AC0, AC0
            SFTS AC0, #-4, AC1
            SFTS AC1, #-16, AC0
            MOV dbl(*SP(#08h)), XAR0
            BCLR ST1_FRCT || SFTS AC0, #1
            MOV AC0, T1 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV dbl(*SP(#06h)), XAR3
            MOV *SP(#0dh), AR1
            ADD *AR5(#0042h), AR1, AR1
            MOV *SP(#13h), T0
            MOV AR1, *AR3
            AADD #22, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0291d3: PSH T3, T2
            MOV #12, AR1 || MOV AR1, T2
            MOV mmap(@T1), AC0
            MIN AR1, AC0 || PSHBOTH XAR5
            PSHBOTH XAR6 || MOV AC0, T3
            MOV #1, AC0 || PSHBOTH XAR7
            AADD #-8, SP
            MOV XAR4, dbl(*SP(#00h)) || SFTS AC0, T3, AC0
            MOV AC0, *SP(#03h) || SUB T3, T1
            MOV T1, *SP(#02h)
            BCC loc_029246, T0 <= #0
            MOV T0, *SP(#04h)
            AMAR *AR2, XAR6
            AMAR *AR0, XAR5
            AMAR *AR3, XAR7
loc_029203: BSET ST1_FRCT
            MPYM *AR6+, T2, AC0
            MOV dbl(*SP(#00h)), XAR0
            SFTS AC0, #-3, AC0 || MOV T3, T0
            MOV HI(AC0), *SP(#05h) || BCLR ST1_FRCT
            .vli_off
            CALL sub_02b5e8
            .vli_on
            MOV *SP(#02h), AR1
            MOV T0, *SP(#06h)
            BCC loc_029227, AR1 <= #0
            MOV dbl(*SP(#00h)), XAR0
            MOV AR1, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
loc_029227: MOV *SP(#05h), T1
            MOV *SP(#03h), AR0
            MOV *SP(#06h), T0 || MOV T3, AR1
            .vli_off
            CALL sub_02b4b1
            .vli_on
            MOV T0, AC0
            ADD *AR7+, AC0, AC0
            SFTS AC0, #16, AC0
            MOV HI(AC0), *AR5+
            ADD #-1, *SP(#04h)
            MOV *SP(#04h), AR1
            BCC loc_029203, AR1 != #0
loc_029246: AADD #8, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_029252: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-6, SP
            AMAR *AR1, XAR5 || MOV T1, HI(AC0)
            MOV AC0, dbl(*SP(#02h))
            AMAR *AR2, XAR6
            MOV dbl(*SP(#02h)), AC0 || MOV #5, T1
            AMAR *AR0, XAR7 || MOV T0, T2
            MOV XAR3, dbl(*SP(#00h)) || SFTS AC0, #-5, AC0
            .vli_off
            CALL sub_02b49e
            .vli_on
            MOV T0, *SP(#04h)
            NOP
            MPYM *SP(#04h), T2, AC0
            MOV AC0, AR1
            MOV dbl(*SP(#02h)), AC0 || MOV AR1, HI(AC1)
            SUB AC1, AC0
            MOV HI(AC0), T3
            BCC loc_0292bc, T3 <= #0
            MOV T0, AR1 || MOV #8, AR2
            CMP AR1 >= AR2, TC1
            ADD #1, AR1, T1
            BCC loc_0292a6, TC1
            AMAR *(#word_d870), XAR3
            MOV *AR3(T0), AR1
            B loc_0292ab
loc_0292a6: MOV *(#word_d877), AR1
loc_0292ab: MOV dbl(*SP(#00h)), XAR4
            AMAR *AR6, XAR2
            AMAR *AR7, XAR0
            AMAR *AR5, XAR3 || MOV T3, T0
            CALL sub_0291d3
loc_0292bc: ADD #-1, *SP(#04h)
            MOV *SP(#04h), AR1
            BCC loc_0292ff, AR1 < #0
            MOV #8, AR2
            CMP AR1 >= AR2, TC1
            ADD #1, AR1, T1
            BCC loc_0292dc, TC1
            MOV AR1, T0
            AMAR *(#word_d870), XAR3
            MOV *AR3(T0), AR1
            B loc_0292e1
loc_0292dc: MOV *(#word_d877), AR1
loc_0292e1: AADD T3, AR6 || AADD T3, AR5
            AMAR *AR7, XAR0
            MOV dbl(*SP(#00h)), XAR4
            AMAR *AR5, XAR3
            AMAR *AR6, XAR2 || MOV T2, T0
            AADD T3, AR0 || SUB T3, T0
            CALL sub_0291d3
            B loc_029313
loc_0292ff: AADD T3, AR5
            AMAR *AR7, XAR0
            AMAR *AR5, XAR1 || MOV T2, T0
            AADD T3, AR0 || SUB T3, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
loc_029313: AADD #6, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02931f: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-4, SP
            AMAR *AR1, XAR5
            AMAR *AR0, XAR7 || MOV AR2, T3
            MOV dbl(*SP(#0ah)), XAR6
            MOV AR3, *SP(#03h) || MOV T1, T2
            MOV T0, *SP(#02h) || CMP T2 >= T3, TC1
            MOV XAR4, dbl(*SP(#00h))
            BCC loc_029354, TC1
            MOV T3, T1
            SUB T2, T1
            MOV #1, AC0
            SFTS AC0, T1, AC0
            MOV AC0, T1
            MPYM *SP(#03h), T1, AC0
            MOV AC0, *SP(#03h)
            MOV T2, T3
loc_029354: AMAR *AR6, XAR0 || MOV T3, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
            SUB T3, T2
            MOV T0, HI(AC0)
            BCC loc_02937a, T2 != #0
            MPYM *SP(#03h), AC0, AC0
            MOV AC0, AR1
            AMAR *AR7, XAR0
            MOV *SP(#02h), T0 || AADD AR1, AR5
            AMAR *AR5, XAR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
            B loc_029395
loc_02937a: MPYM *SP(#03h), AC0, AC0
            MOV AC0, AR1
            MOV dbl(*SP(#00h)), XAR2
            AMAR *AR6, XAR3
            AMAR *AR7, XAR0
            MOV *SP(#02h), T0 || AADD AR1, AR5
            AMAR *AR5, XAR1 || MOV T2, T1
            CALL sub_029252
loc_029395: AADD #4, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_0293a1: MOV T1, HI(AC0) || PSH T2
            SFTS AC0, #-3, AC0 || MOV T0, T2
            .vli_off
            CALL sub_024538
            .vli_on
            MOV mmap(@AC0L), AC0
            SFTS AC0, #7, AC0
            MOV HI(AC0), T0
            MOV T0, HI(AC0)
            AMAR *(#0400000h), XAR3
            SFTS AC0, #7, AC1
            MOV XAR3, AC0
            ADD AC1, AC0
            SFTS AC0, #0, AC0 || BSET ST1_FRCT
            MOV #1024 << #16, AC0 || MPY T2, AC0, AC1
            CMP AC1 < AC0, TC1
            BCC loc_0293f2, TC1
            BCLR ST1_FRCT
            MOV #4096 << #16, AC0 || MOV T2, T0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV #0, AC1
            MOV mmap(@AC0L), AC0
            OR #32768, AC1, AC1
            SFTS AC0, #7, AC0
            SUB AC1, AC0
            MOV HI(AC0), T0
loc_0293f2: MOV #56, AR1
            CMP AR1 < T0, TC1
            BCC loc_029405, TC1
            MOV #9, AR1
            MOV T0, AC0
            MAX AR1, AC0
            B loc_029409 || MOV AC0, T0
loc_029405: MOV #56, T0
loc_029409: POP T2
            MOV T0, HI(AC0)
            MOV HI(AC0), T0
            BCLR ST1_FRCT
            RET
sub_029413: PSH T3, T2
            PSHBOTH XAR5
            MOV T0, AC0
            SFTS AC0, #5, AC1
            AMAR *AR1, XAR5 || MOV AC1, AR1
            SFTL AR1, #-1
            MOV AR1, AC1 || MOV T1, T2
            SUB #16384, AC1, T1
            MOV T1, HI(AC1)
            MPY T1, AC1, AC1
            MOV HI(AC1), AR3
            MOV AR3, HI(AC1)
            MPY T1, AC1, AC1
            MOV HI(AC1), T3
            MOV mmap(@AC0L), AC0
            MOV T3, HI(AC1)
            MPY T1, AC1, AC1
            SFTS AC0, #-11, AC0 || MOV HI(AC1), T0
            MOV AR3, HI(AC1)
            MOV T0, HI(AC2)
            MPYK #22265, AC1, AC1
            MPY T1, AC2, AC2
            MACK T1, #32121, AC1, AC1
            MACK T3, #10288, AC1, AC1 || MOV HI(AC2), T1
            MACK T0, #3566, AC1, AC1
            MACK T1, #989, AC1, AC2
            MOV #23170 << #16, AC1 || PSHBOTH XAR7
            ADD AC2, AC1 || MOV AC0, T1
            SUB #14, T1
            AADD #-1, SP
            SFTS AC1, T1, AC0
            AMAR *AR0, XAR7 || MOV HI(AC0), T3
            MOV #1024 << #16, AC0 || MOV T3, T0
            .vli_off
            CALL sub_02400e
            .vli_on
            MOV #27594, AR2 || MOV AC0, AR1
            CMP AR2 < AR1, TC1
            BCC loc_029496, TC1
            MOV #4250, AR1
            MOV mmap(@AC0L), AC0
            MAX AR1, AC0
            MOV AC0, *AR7
            B loc_02949a
loc_029496: MOV #27594, *AR7
loc_02949a: MOV T3, HI(AC0) || BSET ST1_FRCT
            MPY T2, AC0, AC0
            SFTS AC0, #-8, AC0
            MOV #56, AR2 || MOV HI(AC0), AR1
            CMP AR2 < AR1, TC1
            BCC loc_0294b6, TC1
            MOV #9, AR2
            MAX AR2, AR1
            MOV AR1, *AR5
            B loc_0294b9
loc_0294b6: MOV #56, *AR5
loc_0294b9: AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            BCLR ST1_FRCT
            RET
sub_0294c5: AADD #-1, SP
            BCC loc_0294db, AC0 == #0
            XCCPART AC1 == #0 || MOV T0, HI(AC0)
            BCC loc_0294d9, AC1 == #0
            MOV T0, AC1
            MOV T1, AC0
            ADD AC1, AC0
            SFTS AC0, #15, AC0
loc_0294d9: MOV HI(AC0), T1
loc_0294db: MOV T1, T0
            MOV AR2, T1
            CALL sub_029413
            AADD #1, SP
            RET
sub_0294e6: MOV T0, HI(AC0)
            AMAR *(#010000h), XAR3
            SFTS AC0, #1, AC1
            MOV XAR3, AC0 || PSH T2
            ADD AC1, AC0 || MOV #13, T2
            SUB T1, T2 || SFTS AC0, #0, AC0
            MPYK #22823, AC0, AC0
            MOV #23036 << #16, AC0 || SFTS AC0, T2, AC1
            ADD AC1, AC0
            MOV HI(AC0), T2
            MOV AR2, T1
            MOV T2, T0
            CALL sub_029413
            MOV T2, T0
            POP T2
            RET
sub_029519: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            MOV T1, T2
            AMAR *AR0, XAR5 || MOV #3, T1
            AMAR *AR1, XAR7 || MOV #-4, AR0
            .vli_off
            CALL sub_0244d7
            .vli_on
            MOV #27594, AR1
            CMP AR1 < T0, TC1
            MOV T0, *AR5
            BCC loc_029545, TC1
            MOV #4217, AR1
            MOV mmap(@T0), AC0
            B loc_029549 || MAX AR1, AC0
loc_029545: MOV #27594, AC0
loc_029549: MOV AC0, T0
            MOV AC0, *AR5 || MOV T2, T1
            CALL sub_0293a1
            MOV T0, *AR7
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_02955c: PSH T3, T2
            AADD #-5, SP
            MOV T0, AC0
            SFTS AC0, #4, AC2 || BSET ST1_FRCT
            SFTS AC2, #-1, AC3 || BSET ST1_M40
            MOV HI(AC3), T2
            MOV #0, AC3
            ADD #1, T2
            MOV #1, T3
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            NEG AC3, T3
            MOV T3, *SP(#00h)
            SFTS AC2, #-1, AC3
            MOV #127, T3
            ADD AC2, AC3 || SUB #1, T1
            ADD #1 << #15, AC3, AC3 || MOV T1, BRC0
            MOV AC3, T2
            SFTL T2, #-1
            NOP
            RPTB loc_02960e
               MOV HI(AC3), T0 || ADD AC2, AC3
               AMAR *AR2, XAR3 || MOV HI(AC3), T1
               MIN T3, T1
               AMAR *(AR3+T0) || SUB T0, T1
               AMAR *(AR3+T0) || SUB #2, T1
               MPYM *AR3+, T2, AC0 || MOV T1, BRC1
               MOV uns(*AR3-) << #16, AC1
               MPY T2, AC1, AC1 || MOV AC3, T2
               SFTS AC1, #-16, AC1 || SFTL T2, #-1
               ADD AC1, AC0
               MOV dbl(*AR3+), AC1 || NEG AC0, AC0
               MOV *SP(#00h), T1 || ADD AC1, AC0
               RPTBLOCAL loc_0295ec || SFTS AC0, T1, AC0
                  MOV dbl(*AR3+), AC1
                  SFTS AC1, T1, AC1
loc_0295ec:       ADD AC1, AC0
               MPYM *AR3+, T2, AC1
               SFTS AC1, T1, AC1
               ADD AC1, AC0
               MOV uns(*AR3-) << #16, AC1
               MPY T2, AC1, AC1
               SFTS AC1, #-16, AC1
               SFTS AC1, T1, AC1
               ADD AC1, AC0
               MANT AC0, AC0 :: NEXP AC0, T0
               MOV AC0, dbl(*AR0+) || ADD AC2, AC3
               MOV AC3, T2
               SUB T1, T0
loc_02960e:    MOV T0, *AR1+ || SFTL T2, #-1
            BCLR ST1_M40
            BCLR ST1_FRCT
            AADD #5, SP
            POP T3, T2
            RET
sub_02961c: PSH T3, T2
            AADD #-3, SP
            MOV T0, AC0
            SFTS AC0, #5, AC0
            MOV AC0, dbl(*SP(#00h))
            MOV #0, AC3
            MOV HI(AC0), T2
            ADD #1, T2
            MOV #1, T3
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            SFTS T3, #1
            CMP T3 < T2, TC1
            XCCPART TC1 || ADD #1, AC3
            NEG AC3, T3
            SFTS AC0, #-1, AC3
            ADD #1 << #15, AC3, AC3
            MOV HI(AC3), T0
            MOV AC3, T2
            SFTL T2, #-1
            ADD dbl(*SP(#00h)), AC3, AC3
            AMAR *(AR2+T0) || MOV HI(AC3), T1
            AMAR *(AR2+T0) || BSET ST1_M40
            BSET ST1_FRCT
            MPYM *AR2+, T2, AC2 || MOV #0, AR4
            MOV uns(*AR2-) << #16, AC1
            MOV #128, AR3 || MPY T2, AC1, AC1
            SFTS AC1, #-16, AC1
            ADD AC1, AC2
            NOP_16
loc_029684: NEG AC2, AC0 || SUB T0, T1
            SUB #2, T1
            MOV T1, BRC0
            MOV AC3, T2
            MOV dbl(*AR2+), AC1
            ADD AC1, AC0
            SFTS AC0, T3, AC0
            RPTBLOCAL loc_02969e || SFTL T2, #-1
               MOV dbl(*AR2+), AC1
               SFTS AC1, T3, AC1
loc_02969e:    ADD AC1, AC0
            MPYM *AR2+, T2, AC2
            MOV uns(*AR2-) << #16, AC1
            MPY T2, AC1, AC1
            SFTS AC1, #-16, AC1
            ADD AC1, AC2
            SFTS AC2, T3, AC1
            AMAR *AR4+ || ADD AC1, AC0
            MANT AC0, AC0 :: NEXP AC0, T0
            SUB T3, T0
            MOV T0, *AR1+ || MOV HI(AC3), T0
            MOV AC0, dbl(*AR0+)
            ADD dbl(*SP(#00h)), AC3, AC3
            MOV HI(AC3), T1
            CMP T1 < AR3, TC1
            BCC loc_029684, TC1
            BCLR ST1_M40
            BCLR ST1_FRCT
            MOV AR4, T0
            AADD #3, SP
            POP T3, T2
            RET
sub_0296d7: SUB #15, T1 || MOV T0, HI(AC0)
            SFTS AC0, T1, AC1
            OR #0, AC1, AC2
            SFTS AC1, #-2, AC0
            SUB AC0, AC2
            ADD #1 << #16, AC2, AC2 || SFTS AR1, #-1
            MOV HI(AC2), AR2 || MOV #0, AC0
            SFTS AC1, #-1, AC3
            NOP_16
loc_0296f4: AMAR *AR0, XAR4 || ADD AC3, AC2
            AADD AR2, AR4 || MOV HI(AC2), AR3
            MIN AR1, AR3
            SUB AR2, AR3
            SUB #1, AR3
            MOV AR3, CSR || ADD AC3, AC2
            MOV HI(AC2), AR2
            CMP AR2 < AR1, TC1
            RPT CSR
               ADD *AR4+, AC0, AC0
            BCC loc_0296f4, TC1
            RET
sub_029717: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AMAR *AR1, XAR6
            AADD #-5, SP
            AMAR *AR2, XAR7
            BCC loc_029844, T0 == #0
            MOV *AR7(short(#1)), AR1
            MOV *AR7, AR2
            CMP AR1 < AR2, TC1
            BCC loc_029746, TC1
            MPYMK *AR7(short(#3)), #3, AC0
            MOV *AR7(short(#5)), AR2 || MOV AC0, AR1
            CMP AR1 < AR2, TC1
            BCC loc_029844, TC1
loc_029746: ADD #30, T1, T1
            MOV #5, AR0
            .vli_off
            CALL sub_02410f
            .vli_on
            MOV T0, AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #14, AC1
            MOV #5632 << #16, AC0
            ADD AC1, AC0
            MOV AC0, dbl(*SP(#02h))
            MOV *AR7, AC0
            SFTS AC0, #13, AC1
            ADD AC0 << #15, AC1
            MOV *AR7(short(#1)), AR1 || MOV HI(AC1), AR2
            CMP AR1 < AR2, TC1
            BCC loc_02979f, TC1
            MOV *AR7(short(#5)), AC2
            MOV *AR7(short(#3)), AR2
            SFTS AC2, #1, AC0
            MOV AR2, HI(AC0) || MOV AC0, AR1
            MPYK #3, AC0, AC1
            MOV AC1, AR3
            CMP AR3 >= AR1, TC1
            BCC loc_02979f, TC1
            MOV AR2, AR1
            MOV AR1, AC1
            SFTS AC1, #11, AC0
            ADD AC1 << #13, AC0 || MOV AC2, T0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV AC0, AR1
            B loc_0297a3 || MOV AR1, HI(AC1)
loc_02979f: MOV #5120 << #16, AC1
loc_0297a3: MOV dbl(*SP(#02h)), AC0
            SUB AC1, AC0
            MOV AC0, dbl(*SP(#02h))
            MOV dbl(*SP(#02h)), AC0
            MOV #15360, AR2 || ROUND AC0, AC0
            MOV AC0, dbl(*SP(#02h))
            MOV *SP(#02h), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_0297c8, TC1
            MOV #-15359, AR1 || MOV AR1, T0
            B loc_0297cc || MAX AR1, T0
loc_0297c8: MOV #15359, T0
loc_0297cc: MOV #15, AR0
            MOV #5, T1
            .vli_off
            CALL sub_0244d7
            .vli_on
            MOV *AR6(short(#6)), AC0
            MOV *AR5(short(#2)), AR2 || SFTS AC0, #6, AC0
            MOV *AR6(short(#2)), AR1 || SFTS AC0, #-4, AC0
            SFTS AC0, #-1, AC3 || MIN AR2, AR1
            OR #0, AC3, AC1
            BCC loc_029844, AR1 <= #0
            SUB #1, AR1
            MOV AR1, BRC0
            MOV *AR5(#0042h), T2
            AMAR *AR5, XAR3
            AADD #8, AR3 || RPTB loc_029842
               MOV #16, AR1
               MOV *AR3+ << #16, AC0 || MOV HI(AC1), T1
               SFTS AC0, T2, AC0 || CMP T1 < AR1, TC1
               XCCPART !TC1 || MOV #15, T1
               MOV HI(AC0), AR1
               CMP T0 >= AR1, TC1
               SFTL T1, #1
               BCC loc_029842, TC1
               MOV #1, AC0
               SFTS AC0, T1, AC0
               MOV dbl(*AR6(short(#4))), AC2
               MOV mmap(@AC0L), AC0
               AND AC2, AC0
               BCC loc_029842, AC0 == #0
               MOV #3, AC0
               SFTS AC0, T1, AC0
               NOT AC0, AR1
               MOV dbl(*AR5(short(#4))), AC2 || MOV AR1, AC0
               AND AC2, AC0
               MOV AC0, dbl(*AR5(short(#4))) || MOV #1, AC0
               MOV dbl(*AR5(short(#4))), AC2 || SFTS AC0, T1, AC0
               OR AC2, AC0
               MOV AC0, dbl(*AR5(short(#4)))
loc_029842:    ADD AC3, AC1
loc_029844: AMAR *AR5, XAR7
            MOV *AR5(short(#2)), T0 || AADD #8, AR7
            AMAR *AR7, XAR0
            .vli_off
            CALL sub_028327
            .vli_on
            MOV *AR5(#0042h), T1
            ADD #10, T1
            SFTS AC0, T1, AC0
            MOV #320, AR2 || MOV HI(AC0), AR1
            CMP AR2 >= AR1, TC1
            BCC loc_0298a5, TC1
            MOV #6, T0 || SFTS AC0, #0, AC1
            EXP AC1, T2 || MOV #6, AR0
            MOV #320 << #16, AC1
            AMAR *SP(#00h), XAR1 || EXP AC1, T1
            SFTS AC0, T2, AC0 || SUB T1, T0
            SUB T2, AR0 || SFTS AC1, T1, AC1
            OR #0, AC1, AC0 || MOV HI(AC0), T1
            .vli_off
            CALL sub_024152
            .vli_on
            MOV *AR5(short(#2)), T0 || MOV T0, T1
            AMAR *AR7, XAR1
            AMAR *AR7, XAR0
            .vli_off
            CALL sub_028338
            .vli_on
            MOV *SP(#00h), AR1
            ADD *AR5(#0042h), AR1, AR1
            MOV AR1, *AR5(#0042h)
loc_0298a5: AADD #5, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_0298b1: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-380, mmap(@SP)
            AMAR *AR1, XAR5
            AMAR *AR5, XAR3
            AMAR *+AR3(#0327h)
            AMAR *SP(#00h), XAR6
            MOV XAR3, dbl(*AR6(#009ch))
            AADD #40, AR3
            MOV XAR3, dbl(*AR6(#009eh))
            AMAR *AR5, XAR3
            AMAR *+AR3(#031dh)
            MOV XAR3, dbl(*AR6(#00a0h))
            AADD #5, AR3
            MOV XAR3, dbl(*AR6(#00a2h))
            AMAR *AR5, XAR3
            AADD #12, AR3
            MOV XAR3, dbl(*AR6(#00a6h))
            AMAR *AR5, XAR3
            AMAR *+AR3(#0312h)
            MOV XAR3, dbl(*AR6(#00a8h))
            AMAR *AR5, XAR3
            AMAR *+AR3(#037ch)
            MOV XAR3, dbl(*AR6(#00aah))
            MOV #(sub_027573 >> 16) << #16, AC0
            MOV *AR5(#03deh), AR1
            AADD #20, AR3
            MOV XAR3, dbl(*AR6(#00ach))
            OR #(sub_027573 & 0xffff), AC0, AC0
            MOV AR1, *AR6(#00aeh)
            MOV AC0, dbl(*AR6(#00b4h))
            AMAR *AR5, XAR3 || MOV T0, T2
            AMAR *+AR3(#0437h)
            MOV XAR3, dbl(*AR6(#00b0h))
            MOV *AR5(#03e0h), AR1
            AMAR *AR0, XAR7 || MOV T2, AC0
            MOV *AR5(#0318h), AR2
            AMAR *AR5, XAR3 || SFTS AC0, #-6, AC0
            AMAR *+AR3(#0991h)
            MOV AR1, *AR6(#00b7h)
            MOV XAR3, dbl(*AR6(#00b2h))
            MOV #-377, *AR6(#00b6h)
            MOV AR2, *AR6(#00a4h)
            MOV *AR5(#0459h), AR1
            AMAR *AR5, XAR3 || AND #1, AC0, AC0
            MOV AC0, *AR6(#00afh)
            AMAR *+AR3(#03bch)
            MOV AR1, *AR6(#00b8h)
            MOV XAR3, dbl(*AR6(#017ah))
            MOV dbl(*AR6(#017ah)), XAR0
            .vli_off
            CALL sub_020de7
            .vli_on
            BTST @#0eh, T2, TC1
            AMAR *AR5, XAR2 || MOV T0, T3
            AMAR *+AR2(#0a56h)
            BCC loc_0299ef, TC1
            AMAR *SP(#02h), XAR0
            AMAR *SP(#03h), XAR1
            .vli_off
            CALL sub_020e07
            .vli_on
            BCC loc_0299f7, T0 != #0
            BCC loc_0299c3, T3 != #0
            BTST @#0bh, T2, TC1
            BCC loc_0299c3, !TC1
            AMAR *SP(#00h), XAR0
            MOV dbl(*AR6(#017ah)), XAR1
            AMAR *+AR0(#008ch)
            .vli_off
            CALL sub_020d15
            .vli_on
            MOV T0, T2
            B loc_0299c8 || MOV #2, T0
loc_0299c3: MOV #1, T0
            OR #2, T3, T2
loc_0299c8: AMAR *SP(#00h), XAR3
            AMAR *SP(#00h), XAR4
            AMAR *+AR3(#009ch)
            AMAR *SP(#04h), XAR1
            MOV XAR3, dbl(*SP(#00h))
            AMAR *SP(#48h), XAR2
            AMAR *AR7, XAR0
            AMAR *+AR4(#008ch)
            AMAR *AR5, XAR3
            AMAR *+AR3(#045ah)
            .vli_off
            CALL sub_022fe6
            .vli_on
            B loc_029a13
loc_0299ef: MOV *AR2(short(#2)), AR1
            MOV AR1, *SP(#02h)
            MOV *AR2(short(#1)), AR1
            MOV AR1, *SP(#03h)
loc_0299f7: AMAR *AR5, XAR3
            AMAR *SP(#04h), XAR1
            AMAR *SP(#48h), XAR2
            MOV *SP(#02h), T0
            MOV *SP(#03h), T1
            AMAR *AR7, XAR0
            AMAR *+AR3(#045ah)
            .vli_off
            CALL sub_022a89
            .vli_on
            OR #32770, T3, T2
loc_029a13: AMAR *SP(#00h), XAR0
            AMAR *AR7, XAR1 || MOV #1, T0
            AMAR *+AR0(#00bah)
            .vli_off
            CALL sub_02b0a8
            .vli_on
            AMAR *SP(#00h), XAR1
            MOV #72, T0
            AMAR *AR7, XAR0
            AMAR *+AR1(#00bah)
            .vli_off
            CALL sub_02b5d4
            .vli_on
            ADD #380, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            MOV T2, T0
            POPBOTH XAR5
            POP T3, T2
            RET
sub_029a46: PSH T3, T2
            PSHBOTH XAR5
            MOV T0, T3
            MOV #-20480, T0 || PSHBOTH XAR6
            AMAR *AR0, XAR5 || PSHBOTH XAR7
            MOV #56, T1 || MOV T1, AR6
            MOV #3, *AR5
            MOV T3, *AR5(short(#1)) || AADD #8, AR0
            AMAR *AR1, XAR7
            .vli_off
            CALL sub_02b5c0
            .vli_on
            MOV #128, AR1
            CMP T3 < AR1, TC1
            BCC loc_029a7f, TC1
            MOV #164, AR1
            CMP T3 < AR1, TC1
            BCC loc_029adc, TC1
loc_029a7f: MOV T3, AC0
            AMAR *(#010000h), XAR3
            SFTS AC0, #-4, AC0
            MOV AC0, T2
            MOV XAR3, AC1
            MOV T2, HI(AC2)
            ADD AC2, AC1
            MOV T3, HI(AC0)
            SFTS AC1, #8, AC1
            MOV HI(AC1), T0 || SFTS AC0, #4, AC0
            .vli_off
            CALL sub_024538
            .vli_on
            MOV #896, AR1
            ADD #1, T2, AR2
            MOV AC0, *AR5(short(#6)) || CMP T3 >= AR1, TC1
            MOV AR2, *AR5(short(#2))
            BCC loc_029aba, TC1
            MOV #9, AR1
            MOV mmap(@AR2), AC0
            B loc_029abe || MAX AR1, AC0
loc_029aba: MOV #56, AC0
loc_029abe: MOV AC0, *AR5(short(#2))
            AMAR *AR5, XAR3 || MOV T2, AC0
            AADD T2, AR3 || SFTS AC0, #-3, AC0
            MOV #1, AC0 || MOV AC0, T2
            MOV AR6, *AR3(#0008h)
            ADD #32, T3, T3 || SFTS AC0, T2, AC0
            B loc_029b6b
loc_029adc: MOV #160, AR1
            CMP T3 < AR1, TC1
            SUB #128, T3, T0
            BCC loc_029afd, TC1
            MOV #164, AR1
            CMP T3 >= AR1, TC1
            XCCPART !TC1 || SUB #16, T3, T3
            XCCPART !TC1 || SUB #16, T0, T0
loc_029afd: MOV #(word_ea07 >> 16) << #16, AC0 || MOV T0, AC1
            AMAR *(#word_e9e3), XAR3
            OR #(word_ea07 & 0xffff), AC0, AC0
            SFTL AC1, #1
            MOV *AR3(T0), AR1 || ADD AC1, AC0
            MOV AC0, XAR3
            MOV #56, AR2
            MOV AR1, *AR5(short(#6))
            MOV *AR3, T2
            AMAR *AR3+
            MOV *AR3, T1
            ADD #1, T1, AR1
            MOV AR1, *AR5(short(#2))
            MOV *AR3, AR1
            ADD #1, AR1
            CMP AR2 < AR1, TC1
            BCC loc_029b39, TC1
            MOV mmap(@AR1), AC0
            MOV #9, AR1
            B loc_029b3d || MAX AR1, AC0
loc_029b39: MOV #56, AC0
loc_029b3d: MOV AC0, *AR5(short(#2)) || MOV T2, AC0
            AMAR *AR5, XAR3 || SFTS AC0, #-3, AC0
            AADD T2, AR3 || MOV AC0, T2
            MOV #1, AC0
            SUB #128, T3, T3 || SFTS AC0, T2, AC1
            MOV AR6, *AR3(short(#7)) || MOV T1, AC0
            AMAR *AR5, XAR3 || SFTS AC0, #-3, AC0
            AADD T1, AR3 || MOV AC0, T1
            MOV #1, AC0
            MOV AR6, *AR3(short(#7)) || SFTS AC0, T1, AC0
            OR AC1, AC0
loc_029b6b: MOV mmap(@AC0L), AC0
            AMAR *AR7, XAR0
            MOV #126, T1
            MOV AC0, dbl(*AR5(short(#4))) || MOV #7, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV dbl(*AR7), XAR3
            MOV #8, T0
            MOV XAR3, dbl(*AR7) || AADD #4, AR3
            AMAR *AR7, XAR0 || MOV T3, T1
            .vli_off
            CALL sub_02b60b
            .vli_on
            MOV AR6, AC0
            SFTS AC0, #1, AC1
            ADD AC0 << #5, AC1
            SFTS AC1, #4, AC0
            MOV #256, AR1 || MOV HI(AC0), AR6
            CMP AR6 >= AR1, TC1
            BCC loc_029bb2, TC1
            MOV #0, AR1
            MOV AR6, AC0
            MAX AR1, AC0
            B loc_029bb6 || MOV AC0, AR6
loc_029bb2: MOV #255, AR6
loc_029bb6: MOV AR6, T1
            AMAR *AR7, XAR0 || MOV #8, T0
            .vli_off
            CALL sub_02b60b
            .vli_on
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_029bcb: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-22, SP
            AMAR *AR0, XAR5
            MOV XAR2, dbl(*SP(#12h))
            MOV T1, *SP(#10h)
            MOV T0, *SP(#11h)
            MOV XAR3, dbl(*SP(#0eh))
            AMAR *AR1, XAR7
            MOV dbl(*SP(#12h)), XAR0
            MOV *SP(#11h), T1 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AMAR *AR5, XAR1
            MOV *SP(#11h), T0
            MOV #26214, AR2
            MOV *AR5(short(#1)), T1 || AADD #10, AR1
            AMAR *AR7, XAR0
            .vli_off
            CALL sub_0277d8
            .vli_on
            MOV *SP(#11h), T0
            AMAR *SP(#0ah), XAR0
            .vli_off
            CALL sub_0277bf
            .vli_on
            AMAR *(#word_ec3f), XAR7
            MOV #0, *SP(#02h)
            MOV dbl(*SP(#0eh)), XAR1
            AMAR *(#word_d878), XAR5
            MOV XAR1, dbl(*SP(#00h))
            AMAR *SP(#03h), XAR0
            MOV *AR7(short(#1)), T1 || MOV #3, T0
            AMAR *AR5, XAR4 || MOV #9, AR2
            AMAR *AR4+ || MOV #3, AR3
            AMAR *(#word_d89a), XAR1
            .vli_off
            CALL sub_02931f
            .vli_on
            MOV dbl(*SP(#0eh)), XAR1
            MOV XAR1, dbl(*SP(#00h)) || AADD #4, AR5
            MOV *AR7(short(#2)), T1 || MOV #7, AR2
            AMAR *SP(#06h), XAR0 || MOV #4, T0
            AMAR *AR5, XAR4 || MOV #4, AR3
            AMAR *(#word_de9a), XAR1
            .vli_off
            CALL sub_02931f
            .vli_on
            MOV #0, AR1
            MOV dbl(*SP(#12h)), XAR5
            MOV AR1, *SP(#14h) || AADD #3, AR7
            AMAR *SP(#0ah), XAR6
loc_029c6b: MOV *AR6+, T3
            SUB #2, T3, T0
            MOV *AR7+, T2
            BCC loc_029cb9, T0 <= #0
            MOV *SP(#14h) << #2, AC0
            MOV AC0, AR1
            AMAR *(#word_d880), XAR4
            MOV #4, AR2
            MOV *SP(#14h), AR1 || AADD AR1, AR4
            AMAR *AR5, XAR0 || MOV #4, AR3
            MOV AR1, AC0 || CMP AR2 >= T0, TC1
            MOV dbl(*SP(#0eh)), XAR2
            AADD #2, AR0 || SFTS AC0, #6, AC1
            XCCPART !TC1 || MOV #4, T0
            MOV #(word_e09a >> 16) << #16, AC0
            OR #(word_e09a & 0xffff), AC0, AC0 || MOV T2, T1
            MOV XAR2, dbl(*SP(#00h)) || ADD AC1, AC0
            MOV AC0, XAR1 || MOV #4, AR2
            .vli_off
            CALL sub_02931f
            .vli_on
            B loc_029cda
loc_029cb9: MOV #16, AR1
            CMP AR1 >= T2, TC1
            BCC loc_029cd1, TC1
            MOV dbl(*SP(#0eh)), XAR0
            MOV #16, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
            SUB #16, T2, T2
loc_029cd1: MOV dbl(*SP(#0eh)), XAR0
            MOV T2, T0
            .vli_off
            CALL sub_02b5e8
            .vli_on
loc_029cda: ADD #1, *SP(#14h)
            MOV *SP(#14h), AR1 || MOV #4, AR2
            CMP AR1 < AR2, TC1
            AADD T3, AR5
            BCC loc_029c6b, TC1
            MOV dbl(*SP(#12h)), XAR0
            MOV *SP(#11h), T0
            AMAR *SP(#02h), XAR1
            MOV dbl(*SP(#12h)), XAR2
            AMAR *SP(#0ah), XAR3
            MOV *SP(#10h), T1
            .vli_off
            CALL sub_027841
            .vli_on
            AADD #22, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_029d0c: PSHBOTH XAR5
            AMAR *AR1, XAR5
            AADD #-56, SP
            AMAR *AR5, XAR4
            MOV *AR2(short(#1)), T1
            AMAR *SP(#00h), XAR1
            MOV *AR5(short(#2)), T0 || AADD #8, AR4
            AMAR *AR4, XAR2
            CALL sub_029bcb
            AMAR *AR5, XAR0
            AMAR *SP(#00h), XAR1
            MOV *AR5(short(#2)), T0 || AADD #8, AR0
            .vli_off
            CALL sub_0277fa
            .vli_on
            AADD #56, SP
            POPBOTH XAR5
            RET
sub_029d3b: MOV #0, AC0
            BCC loc_029d53, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, BRC0
            AMAR *AR0, XAR3 || RPTBLOCAL loc_029d51
               MOV dbl(*AR3+), AC2
               SFTS AC2, #-7, AC2
loc_029d51:    ADD AC2, AC0
loc_029d53: MOV #32767 << #16, AC2 || MOV T0, HI(AC1)
            MPYK #127, AC1, AC1
            OR #65535, AC2, AC2
            MOV mmap(@AC1L), AC3
            SUB AC3, AC2
            SFTS AC2, #-7, AC2
            CMP AC0 >= AC2, TC1
            BCC loc_029d88, TC1
            MOV #0, AC0
            BCC loc_029d7d, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, CSR
            RPT CSR
               ADD dbl(*AR0+), AC0, AC0
loc_029d7d: SFTS AC0, #0, AC1
            EXP AC1, T1
            SUB T1, *AR1, AR2
            B loc_029d93
loc_029d88: SFTS AC0, #0, AC1
            EXP AC1, T1
            SUB T1, *AR1, AR2
            ADD #7, AR2
loc_029d93: SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            MOV AR2, *AR1
            RET
sub_029d9b: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR1, XAR5
            AADD #-2, SP
            AMAR *AR2, XAR6 || MOV T0, T3
            AMAR *AR0, XAR7 || MOV T1, T2
            .vli_off
            CALL sub_02400e
            .vli_on
            MOV T3, AC0 || MOV AC0, AR2
            SFTS AC0, #9, AC0
            SFTS AC0, T2, AC1
            OR #0, AC1, AC0
            SFTS AC0, #-1, AC2
            MOV AC2, dbl(*SP(#00h))
            MOV *SP(#00h), AR1 || MOV #2, AR3
            ADD #1, AR1
            CMP AR1 < AR3, TC1
            BCC loc_029df6, TC1
            CMP AR3 >= AR1, TC1
            BCC loc_029df2, TC1
            MOV #4, AR3
            CMP AR3 >= AR1, TC1
            BCC loc_029dee, TC1
            MOV #8, AR3
            CMP AR3 < AR1, TC1
            MOV #3, AR1
            XCCPART TC1 || MOV #4, AR1
            B loc_029df8
loc_029dee: B loc_029df8 || MOV #2, AR1
loc_029df2: B loc_029df8 || MOV #1, AR1
loc_029df6: MOV #0, AR1
loc_029df8: BSET ST1_SATD || SFTS AC1, #-2, AC1
            AMAR *(#010000h), XAR3
            NEG AC1, AC2
            MOV XAR3, AC1 || BCLR ST1_SATD
            ADD AC2, AC1
            BCC loc_029e15, AR2 <= #0
            SUB #1, AR2
            MOV AR2, CSR
            RPT CSR
               ADD AC0, AC1
loc_029e15: MOV AC1, dbl(*AR6)
            ADD dbl(*SP(#00h)), AC1, AC1 || MOV HI(AC1), AR3
            MOV HI(AC1), AR4
            MOV #128, T1 || MOV HI(AC1), AR2
            CMP T1 < AR4, TC1
            SUB AR3, AR2 || MOV #0, AC0
            BCC loc_029e63, TC1
loc_029e2f: BCC loc_029e4b, AR2 <= #0
            SUB #1, AR2
            MOV AR2, BRC0 || MOV AR3, AC2
            MOV XAR5, AC3
            SFTL AC2, #1
            ADD AC2, AC3
            MOV AC3, XAR3
            RPTBLOCAL loc_029e49 || NEG AR1, T1
               MOV dbl(*AR3+), AC2
               SFTS AC2, T1, AC2
loc_029e49:    ADD AC2, AC0
loc_029e4b: ADD dbl(*SP(#00h)), AC1, AC1
            ADD dbl(*SP(#00h)), AC1, AC1 || MOV HI(AC1), AR3
            MOV HI(AC1), AR4
            MOV #128, T1 || MOV HI(AC1), AR2
            CMP T1 >= AR4, TC1
            SUB AR3, AR2
            BCC loc_029e2f, TC1
loc_029e63: MOV #128, AR2
            CMP AR3 >= AR2, TC1
            BCC loc_029e8a, TC1
            MOV #127, AR2
            SUB AR3, AR2
            MOV AR2, BRC0 || MOV AR3, AC2
            MOV XAR5, AC1
            SFTL AC2, #1
            ADD AC2, AC1
            MOV AC1, XAR5
            RPTBLOCAL loc_029e88 || NEG AR1, T1
               MOV dbl(*AR5+), AC1
               SFTS AC1, T1, AC1
loc_029e88:    ADD AC1, AC0
loc_029e8a: XCCPART AC0 == #0 || MOV #0, *AR7
            BCC loc_029e9d, AC0 == #0
            SFTS AC0, #0, AC1
            EXP AC1, T1
            SUB T1, AR1
            MOV AR1, *AR7 || SFTS AC0, T1, AC0
loc_029e9d: AADD #2, SP
            MOV HI(AC0), T0 || POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_029eab: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-200, mmap(@SP)
            AMAR *AR3, XAR5
            AMAR *AR1, XAR7 || MOV T0, T2
            MOV *AR5(#03beh), AR1
            SFTL AR1, #1
            MOV AR1, *AR5(#03beh)
            AMAR *SP(#00h), XAR6 || MOV #0, AR1
            MOV AR1, *AR6(#00c6h)
            MOV AR1, *AR6(#00c7h)
            MOV XAR0, dbl(*AR6(#00c4h))
            MOV T1, *AR6(#00c2h)
            AND #12, T2, AR1
            MOV XAR2, dbl(*AR6(#00c0h))
            BCC loc_029f45, AR1 != #0
            MOV *AR5(#0310h), T3
            AMAR *SP(#00h), XAR0
            MOV dbl(*AR6(#00c4h)), XAR1
            MOV #72, T0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV dbl(*AR6(#00c4h)), XAR1
            AMAR *SP(#00h), XAR0 || MOV #0, T0
            .vli_off
            CALL sub_02b0a8
            .vli_on
            AMAR *AR5, XAR2
            MOV dbl(*AR6(#00c0h)), XAR1
            MOV *AR6(#00c2h), T0
            MOV dbl(*AR6(#00c4h)), XAR3
            AMAR *AR7, XAR0
            AMAR *+AR2(#02c0h)
            .vli_off
            CALL sub_022beb
            .vli_on
            OR T0, T3
            BCC loc_029f45, T3 == #0
            BTST @#01h, T3, TC1
            XCCPART !TC1 || MOV #1, AR1
            XCCPART !TC1
            MOV AR1, *AR6(#00c7h)
            XCCPART TC1 || MOV #1, AR1
            XCCPART TC1
            MOV AR1, *AR6(#00c6h)
loc_029f45: AMAR *AR5, XAR3
            BTST @#0eh, T2, TC1
            AMAR *+AR3(#02c0h)
            MOV XAR3, dbl(*AR6(#00c4h))
            BCC loc_029fdd, TC1
            BTST @#03h, T2, TC1
            BCC loc_029fae, TC1
            BTST @#02h, T2, TC1
            BCC loc_029f97, TC1
            MOV *AR6(#00c6h), AR1
            BCC loc_029fae, AR1 != #0
            MOV *AR6(#00c7h), AR1
            BCC loc_029f97, AR1 != #0
            MOV *AR7, AR1 || MOV #1, AR2
            CMP AR1 == AR2, TC1
            BCC loc_029f92, TC1
            MOV #2, AR2
            CMP AR1 == AR2, TC1
            BCC loc_029f8d, TC1
            MOV #3, AR2
            CMP AR1 == AR2, TC1
            BCC loc_029f97, !TC1
            B loc_029ff8
loc_029f8d: B loc_029ffc || MOV #0, T2
loc_029f92: B loc_029ffc || MOV #2, T2
loc_029f97: MOV *AR5(#03beh), AR1
            AND #14, AR1, AR1
            MOV #14, AR2
            CMP AR1 == AR2, TC1
            BCC loc_029fae, TC1
            AMAR *AR5, XAR1
            AMAR *+AR1(#0238h)
            B loc_029fb5
loc_029fae: AMAR *AR5, XAR1
            AMAR *+AR1(#027ch)
loc_029fb5: AMAR *AR7, XAR0
            .vli_off
            CALL sub_025180
            .vli_on
            MOV dbl(*AR6(#00c0h)), XAR0
            AMAR *AR7, XAR1
            .vli_off
            CALL sub_025180
            .vli_on
            OR #1, *AR5(#03beh)
            MOV dbl(*AR6(#00c4h)), XAR0
            .vli_off
            CALL sub_0277b7
            .vli_on
            MOV #32, T0
            B loc_02a00c
loc_029fdd: MOV *AR5(#03bdh), T0
            MOV *AR5(#03bch), T1
            AMAR *AR7, XAR0
            .vli_off
            CALL sub_028a00
            .vli_on
            MOV dbl(*AR6(#00c0h)), XAR0
            AMAR *AR7, XAR1
            .vli_off
            CALL sub_025180
            .vli_on
loc_029ff8: MOV #-32766, T2
loc_029ffc: MOV #0, *AR5(#03bfh)
            MOV dbl(*AR6(#00c4h)), XAR0
            .vli_off
            CALL sub_0277b7
            .vli_on
            MOV T2, T0
loc_02a00c: ADD #200, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02a01b: PSH T2
            AADD #-16, SP
            MOV XSP, XAR3
            AMAR *+AR3(#0000h)
            MOV #14, AR1
            MOV #7, BRC0
            RPTBLOCAL loc_02a037
               NEG AR1, T2
               SFTS AC0, T2, AC1
               AND #3, AC1, AR2
               MOV AR2, *AR3(short(#1)) || SUB #2, AR1
loc_02a037:    MOV AR2, *AR3 || AADD #2, AR3
            MOV T0, HI(AC0) || BSET ST1_FRCT
            MPYK #32, AC0, AC0
            SFTS AC0, #-4, AC2
            OR #0, AC2, AC0
            BCC loc_02a085, T1 <= #0
            MOV #15, T2
            SUB #1, T1, AR1
            MOV AR1, BRC0
            MOV HI(AC0), T0
            MIN T2, T0
            AMAR *AR0, XAR2
            MOV XSP, XAR3
            AMAR *+AR3(#0000h)
            RPTBLOCAL loc_02a083
               MOV *AR3(T0), *AR2 || ADD #1, T0
               MIN T2, T0
               MOV *AR3(T0), AR1
               OR *AR2, AR1, AR1
               MOV #3, AR1 || MOV AR1, AR4
               CMP AR4 < AR1, TC1 || ADD AC2, AC0
               MOV AR4, *AR2 || MOV HI(AC0), T0
               MIN T2, T0
               XCC !TC1 || MOV #1, *AR2
loc_02a083:    AMAR *AR2+
loc_02a085: MOV #56, AR1
            CMP T1 >= AR1, TC1
            BCC loc_02a09f, TC1
            MOV #55, AR1
            SUB T1, AR1
            MOV AR1, CSR
            AADD T1, AR0 || RPT CSR
               MOV #0, *AR0+
loc_02a09f: BCLR ST1_FRCT
            AADD #16, SP
            POP T2
            RET
sub_02a0a7: PSH T3, T2
            AADD #-1, SP
            OR #0, AC0, AC1
            MOV #21845 << #16, AC0 || MOV T0, T2
            OR #21845, AC0, AC0 || MOV T1, T3
            MOV #32, T0 || AND AC1, AC0
            .vli_off
            CALL sub_02b624
            .vli_on
            MOV #8, AR1
            CMP T0 < AR1, TC1
            BCC loc_02a0e3, TC1
            MOV #-3278 << #16, AC0
            SFTL AC0, #0, AC1
            MOV #-13108 << #16, AC0
            SFTL AC0, #0, AC0
            MPY T3, AC0, AC0
            SFTS AC0, #-4, AC0
            MAC AC1, T2, AC0, AC0
            MOV HI(AC0), T2
loc_02a0e3: MOV T2, T0
            AADD #1, SP
            POP T3, T2
            RET
sub_02a0eb: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-2, SP
            AMAR *AR1, XAR6 || MOV T0, T3
            AMAR *AR0, XAR7
            BCC loc_02a11b, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            MOV #-30719, AR1
            MOV #30719, AR4
            AMAR *AR7, XAR3 || RPTBLOCAL loc_02a119
               MOV *AR3, AR2
               MAX AR1, AR2
               MIN AR4, AR2
loc_02a119:    MOV AR2, *AR3+
loc_02a11b: MOV #-32768 << #16, AC1
            BCC loc_02a130, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            AMAR *AR7, XAR3 || RPTBLOCAL loc_02a12e
               MOV *AR3+ << #16, AC0
loc_02a12e:    MAX AC0, AC1
loc_02a130: SFTS AC1, #0, AC0
            SFTS AC0, #-11, AC1
            MOV #1, AC0
            SFTS AC0, #16, AC0
            ADD AC0, AC1
            MOV HI(AC1), *SP(#00h)
            BCC loc_02a163, T3 <= #0
            MOV T3, T2
            AMAR *AR7, XAR5
            AMAR *SP(#01h), XAR0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            RPTB loc_02a160
               MOV *AR5 << #5, AC0
               .vli_off
               CALL sub_024488
               .vli_on
               MOV *AR0, AR1
               SUB *SP(#00h), AR1, T1
loc_02a160:    MOV rnd(HI(saturate(AC0 << T1))), *AR5+
loc_02a163: MOV *SP(#00h), AR1
            MOV #56, T1
            AMAR *AR7, XAR0
            SUB #15, AR1
            AADD T3, AR0 || MOV #0, T0
            MOV AR1, *AR6 || SUB T3, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02a187: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            MOV T1, AR4
            MOV T0, T1
            MOV AR3, T0
            SFTS T0, #-1
            AMAR *AR2, XAR5
            AMAR *(AR1+T0)
            AMAR *(AR5+T0)
            AMAR *AR1, XAR7
            AMAR *AR5-
            AMAR *AR7-
            BCC loc_02a1b4, AR4 != #0
            AMAR *AR0, XAR4
            BTST @#00h, AR3, TC1
            AADD T1, AR4
            AMAR *AR4-
            BCC loc_02a1c1, TC1
            B loc_02a1c9
loc_02a1b4: AADD AR4, AR0
            BTST @#00h, AR3, TC1
            AMAR *AR0, XAR4
            AMAR *AR4-
            BCC loc_02a1c9, !TC1
loc_02a1c1: BSET ST1_FRCT
            MPYMR *AR2(T0), *AR1+, AC0
            MOV HI(AC0), *AR0+
loc_02a1c9: BCC loc_02a1e4, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, BRC0
            AMAR *AR5, XCDP
            OR #576, mmap(@ST1_55)
            RPTBLOCAL loc_02a1e0
               MPYR *AR1+, *CDP-, AC1 :: MPYR *AR7-, *CDP-, AC0
loc_02a1e0:    MOV HI(AC1), *AR0+ || MOV HI(AC0), *AR4-
loc_02a1e4: BCLR ST1_FRCT
            BCLR ST1_SATD
            MOV #0, T0 || SUB AR3, T1
            .vli_off
            CALL sub_02b5c0
            .vli_on
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_02a1f8: PSH T2, T3
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-1, SP
            MOV *SP(#08h), T2 || MOV T1, AR6
            MOV AR4, T1 || MOV #1, AC0
            AMAR *AR0, XAR7 || SFTS AC0, T2, AC0
            MOV T0, *SP(#00h) || MOV AC0, T3
            MOV dbl(*SP(#06h)), XAR0
            MOV T3, T0
            CALL sub_02a187
            MOV T2, T1
            MOV dbl(*SP(#06h)), XAR0
            ADD *SP(#00h), AR6, T0
            MOV *SP(#09h), AR1
            .vli_off
            CALL sub_025d49
            .vli_on
            MOV XAR7, AC0 || MOV T0, T2
            BCC loc_02a241, AC0 == #0 || MOV T3, T0
            AMAR *AR7, XAR0 || SFTL T2, #1
            SFTS T0, #-1
            ADD *SP(#09h), T0, T0
            MOV dbl(*SP(#06h)), XAR1
            .vli_off
            CALL sub_02818e
            .vli_on
loc_02a241: MOV T2, T0
            AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POP T2, T3
            RET
sub_02a24d: PSH T2, T3
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-264, mmap(@SP)
            MOV XSP, XAR6
            AMAR *AR2, XAR5
            AMAR *AR4, XAR7 || MOV T1, T2
            MOV XAR0, dbl(*SP(#04h))
            MOV #0, *SP(#06h) || MOV T0, T3
            MOV AR3, *SP(#07h) || MOV T2, T0
            AMAR *SP(#08h), XAR0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AMAR *SP(#08h), XAR1
            AMAR *SP(#06h), XAR2
            MOV T2, T0
            AMAR *SP(#08h), XAR0
            .vli_off
            CALL sub_02821d
            .vli_on
            MOV *AR6(#010fh), AR1
            MOV AR1, *SP(#03h)
            MOV *AR6(#010eh), AR1
            MOV XAR7, dbl(*SP(#00h))
            AMAR *AR5, XAR2
            MOV AR1, *SP(#02h)
            MOV *SP(#07h), AR4
            MOV dbl(*SP(#04h)), XAR0
            MOV *SP(#06h), T0 || MOV T3, T1
            MOV T2, AR3
            AMAR *SP(#08h), XAR1
            CALL sub_02a1f8
            ADD #264, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2, T3
            RET
sub_02a2b8: PSH T3, T2
            PSHBOTH XAR6
            PSHBOTH XAR7
            BCC loc_02a367, T0 <= #0
            SUB #1, T0, AR3
            MOV AR3, BRC0
            AMAR *AR2, XAR3
            MOV #31776, T2
            MOV #30891, T3
            MOV #30895, AR6
            AADD #6, AR3
            RPTB loc_02a364
               MOV dbl(*AR0), AC1 || ASUB #6, AR3
               SFTS AC1, #-3, AC1
               MOV dbl(*AR3+), AC3 || MOV #4, T0
               SUB AC3 << #-3, AC1
               MPYMU *AR3(short(#1)), T3, AC0
               SFTS AC0, #-15, AC0 || BSET ST1_FRCT
               MACM *AR3, T3, AC0, AC0 || BCLR ST1_FRCT
               SFTS AC0, #-3, AC0
               ADD AC1, AC0 || MOV AR6, T1
               SFTS AC0, #3, AC3
               SAT AC3, AC3
               MOV AC3, dbl(*AR3-)
               MOV dbl(*AR0+), dbl(*(AR3+T0))
               AMAR *AR3, XAR4 || BSET ST1_M40
               MOV dbl(*(AR3+T0)), AC3
               MOV dbl(*(AR3-T0)), AC3 || SUB AC3 << #-2, AC0
               MOV dbl(*(AR3+T0)), AC1 || ADD AC3 << #-3, AC0
               MOV AC1, dbl(*AR3) || ASUB #6, AR3
               MOV dbl(*(AR3+T0)), dbl(*AR4)
               MOV dbl(*AR3), AC2 || BCLR ST1_M40
               MPYMU *AR3(#0001h), T2, AC1
               SFTS AC1, #-15, AC1 || BSET ST1_FRCT
               MACM *(AR3+T0), T2, AC1, AC1 || BCLR ST1_FRCT
               MOV dbl(*AR3), AC2 || ADD AC1 << #-2, AC0
               AMAR *AR3, XAR4
               MPYMU *AR3(#0001h), T1, AC1
               SFTS AC1, #-15, AC1 || BSET ST1_FRCT
               MACM *(AR3-T0), T1, AC1, AC1 || BCLR ST1_FRCT
               MOV dbl(*AR3), dbl(*AR4) || SUB AC1 << #-3, AC0
               SFTS AC0, #3, AC3
               SAT AC3, AC3
               MOV AC3, dbl(*AR3)
loc_02a364:    MOV AC3, dbl(*AR1+)
loc_02a367: POPBOTH XAR7
            POPBOTH XAR6
            POP T3, T2
            RET
sub_02a36f: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            ADD #-168, mmap(@SP)
            MOV XSP, XAR6
            AMAR *AR0, XAR4
            AMAR *AR1, XAR5 || MOV T0, T2
            BCC loc_02a39c, T2 <= #0
            SUB #1, T2, AR1
            MOV *AR2+ << #16, AC0 || MOV AR1, BRC0
            AMAR *SP(#00h), XAR3 || RPTBLOCAL loc_02a397
               SFTS AC0, #-2, AC0
loc_02a397:    MOV *AR2+ << #16, AC0 || MOV AC0, dbl(*AR3+)
loc_02a39c: AMAR *SP(#00h), XAR0
            AMAR *SP(#00h), XAR1
            AMAR *AR4, XAR2
            CALL sub_02a2b8
            BCC loc_02a3d9, T2 <= #0
            SUB #1, T2, AR1
            AMAR *SP(#00h), XAR2
            MOV #-3756 << #16, AC1
            MOV AR1, BRC0
            MOV #15445, T1
            AMAR *AR2(short(#1)), XAR3
            SFTL AC1, #0, AC2
            MOV #2, T0
            RPTBLOCAL loc_02a3d4
               MPYMU *(AR3+T0), T1, AC0
               SFTS AC0, #-14, AC0
               MACM *(AR2+T0), AC2, AC0 || BSET ST1_SATD
               SFTS AC0, #2, AC0
loc_02a3d4:    MOV rnd(HI(saturate(AC0))), *AR5+ || BCLR ST1_SATD
loc_02a3d9: ADD #168, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_02a3e6: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-1, SP
            AMAR *AR0, XAR7
            AMAR *AR1, XAR6
            AADD #20, AR0 || MOV T0, T2
            MOV #0, *AR7(#0013h)
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AMAR *AR7(#0013h), XAR5
            MOV #64, AR1
            AMAR *AR6, XAR3
            AADD T2, AR3 || CMP T2 >= AR1, TC1
            MOV *AR3(#-0001h) << #16, AC0
            BCC loc_02a43d, TC1
            MOV #63, AR1
            SUB T2, AR1
            MOV AR1, BRC0
            AMAR *AR7(#0014h), XAR3
            AADD T2, AR3 || BSET ST1_SATD
            MOV #1477 << #16, AC2
            MOV AR1, CSR
            RPT CSR || SUB AC2, AC0
               MOV HI(AC0), *AR3+ || SUB AC2, AC0
loc_02a43d: MOV #46, AR1
            CMP T2 < AR1, TC1
            AMAR *AR5(#003fh), XAR3
            BCC loc_02a45c, TC1
            SUB #46, T2, AR1
            MOV AR1, CSR
            AMAR *AR5(#0041h), XAR2
            RPT CSR
               MOV *AR3-, *AR2+
loc_02a45c: AMAR *AR5, XAR3
            AMAR *AR5+
            AMAR *AR3- || RPT #18
               MOV *AR5+, *AR3-
            BCLR ST1_SATD
            AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_02a476: PSH T3, T2
            AADD #-3, SP
            MOV T0, T2
            MOV XAR0, dbl(*SP(#00h))
            BCC loc_02a45c, T2 <= #0
            MOV XAR1, XAR2
            ADD #21, AR1, AR1
            ADD #19, AR2, AR2
            SUB #1, T2, T3
            MOV T3, BRC0
            BSET ST1_FRCT
            BSET ST3_SMUL
            MOV #14, T1
            MOV #2, T0
            RPTBLOCAL loc_02a4c5 || MOV #0, AC1
               AMAR *(#word_ec4d), XCDP
               RPT #9 || MOV #0, AC0
                  MAC *(AR1+T0), *CDP+, AC0 :: MAC *(AR2-T0), *CDP+, AC1
               SUB #19, AR1, AR1 || SUB AC1, AC0
               SFTS AC0, #-14, AC1
               MOV HI(AC1), AR3
               ADD #21, AR2, AR2 || MOV AR3, HI(AC2)
               XCCPART AC2 < #0 || ADD #1 << #16, AC2, AC2
               SUB AC2 << T1, AC0
loc_02a4c5:    MOV HI(AC0 << #1), *AR0+ || MOV #0, AC1
            BCLR ST3_SMUL
            BCLR ST1_FRCT
            MOV dbl(*SP(#00h)), XAR0
            MOV #56, T1
            ADD T2, AR0 || MOV #0, T0
            .vli_off
            CALL sub_02b5c0 || SUB T2, T1
            .vli_on
            AADD #3, SP
            POP T3, T2
            RET
sub_02a4e5: PSH T2
            PSHBOTH XAR5
            AADD #-105, SP
            AMAR *AR0, XAR5
            AMAR *SP(#00h), XAR0 || MOV T0, T2
            CALL sub_02a3e6
            AMAR *SP(#00h), XAR1
            AMAR *AR5, XAR0 || MOV T2, T0
            CALL sub_02a476
            AADD #105, SP
            POPBOTH XAR5
            POP T2
            RET
sub_02a509: AADD #-5, SP
            MOV #22, BRC0
            MOV AC0, dbl(*SP(#00h))
            MOV #64, AC2
            SFTS AC2, #16, AC2
            MOV #0, AC1
            RPTBLOCAL loc_02a52e
               MOV AC0, AC3
               SFTL AC1, #1
               AND AC2, AC3
               XCCPART AC3 != #0 || BNOT @#00h, AC1
               AND #2048, AC1, AC3
               SFTS AC2, #-1, AC2
loc_02a52e:    XCCPART AC3 != #0 || XOR #1141, AC1, AC1
            MOV #3, T0
            AMAR *SP(#02h), XAR1 || MOV #0, T1
            AMAR *SP(#00h), XAR0 || MOV #0, AR2
            MOV AC1, dbl(*SP(#02h)) || MOV #0, AR3
            CALL sub_02a589
            XCCPART T0 != #0 || MOV dbl(*SP(#00h)), AC0
            BCC loc_02a585, T0 != #0
            MOV #870, AR3
            AMAR *SP(#02h), XAR1 || MOV #1, AR2
            MOV #870, T1
            AMAR *SP(#00h), XAR0 || MOV #2, T0
            CALL sub_02a589
            XCCPART T0 != #0 || MOV dbl(*SP(#00h)), AC0
            BCC loc_02a585, T0 != #0
            MOV #1740, AR3
            AMAR *SP(#02h), XAR1 || MOV #2, AR2
            MOV #1740, T1
            AMAR *SP(#00h), XAR0 || MOV #2, T0
            CALL sub_02a589
            MOV dbl(*SP(#00h)), AC0
loc_02a585: AADD #5, SP
            RET
sub_02a589: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-5, SP
            AMAR *AR0, XAR5
            AMAR *AR1, XAR7
            MOV #22, AR6
            MOV *AR7(short(#1)), T2
            MOV T0, *SP(#03h)
            MOV T1, *SP(#02h)
            MOV AR2, *SP(#01h)
            MOV AR3, *SP(#00h) || MOV #0, AR1
            MOV AR1, *SP(#04h)
            MOV #1, AC2
            SFTS AC2, #11, AC2
            SUB #1, AC2
            MOV *SP(#03h), AR1
            MOV #22, BRC0
            RPTB loc_02a5d7 || NOP_16
               AND #2047, T2, T2
               MOV *SP(#02h), AC0
               XOR T2, AC0
               BCNT AC0, AC2, TC1, T0
               CMP AR1 >= T0, TC2
               XCCPART !TC2 || SFTL T2, #1
               BTST @#0bh, T2, TC1
               XCCPART TC1 & !TC2 || XOR #1141, T2, T2
loc_02a5d7:    XCCPART !TC2 || SUB #1, AR6
            MOV T2, AC0
            MOV AC0, dbl(*AR7)
            MOV *SP(#01h), AR1 || BCC loc_02a60b, AR6 < #0
            XOR *SP(#00h), T2, T2 || MOV AR1, HI(AC0)
            ADD #1, AR6, T1 || MOV T2, AC1
            OR AC0, AC1
            SUB #22, AR6, T1 || SFTS AC1, T1, AC0
            SFTS AC1, T1, AC2
            MOV dbl(*AR5), AC0 || XOR AC0, AC2
            MOV AC1, dbl(*AR7) || XOR AC2, AC0
            MOV AC0, dbl(*AR5) || MOV #1, AR1
            MOV AR1, *SP(#04h)
loc_02a60b: MOV *SP(#04h), T0
            AMAR *(#07fffffh), XAR3
            MOV dbl(*AR5), AC1
            MOV XAR3, AC0
            AND AC1, AC0
            MOV AC0, dbl(*AR5)
            AADD #5, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02a629: MOV #128, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a688, TC1
            MOV #64, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a684, TC1
            MOV #32, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a680, TC1
            MOV #16, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a67c, TC1
            MOV #8, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a678, TC1
            MOV #4, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a674, TC1
            MOV #2, AR2
            CMP AR2 < T0, TC1
            BCC loc_02a68a, TC1
            CMP T0 >= AR2, TC1
            MOV #0, AR2
            XCCPART TC1 || MOV #1, AR2
            B loc_02a68a
loc_02a674: B loc_02a68a || MOV #3, AR2
loc_02a678: B loc_02a68a || MOV #4, AR2
loc_02a67c: B loc_02a68a || MOV #5, AR2
loc_02a680: B loc_02a68a || MOV #6, AR2
loc_02a684: B loc_02a68a || MOV #7, AR2
loc_02a688: MOV #8, AR2
loc_02a68a: MOV #0, AC0
            BCC loc_02a6a0, T0 <= #0
            SUB #1, T0, AR3
            MOV AR3, BRC0
            RPTBLOCAL loc_02a69e || NEG AR2, T1
               MOV dbl(*AR0+), AC1
               SFTS AC1, T1, AC1
loc_02a69e:    ADD AC1, AC0
loc_02a6a0: ADD *AR1, AR2, AR2 || SFTS AC0, #0, AC1
            EXP AC1, T1
            SUB T1, AR2
            MOV AR2, *AR1
            SFTS AC0, T1, AC0
            RET
sub_02a6b1: MOV #128, AR3
            CMP AR3 < T0, TC1
            BCC loc_02a709, TC1
            MOV #64, AR3
            CMP AR3 < T0, TC1
            BCC loc_02a705, TC1
            MOV #32, AR3
            CMP AR3 < T0, TC1
            BCC loc_02a701, TC1
            MOV #16, AR3
            CMP AR3 < T0, TC1
            BCC loc_02a6fd, TC1
            MOV #8, AR3
            CMP AR3 < T0, TC1
            BCC loc_02a6f9, TC1
            MOV #4, AR3
            CMP AR3 < T0, TC1
            BCC loc_02a6f5, TC1
            MOV #2, AR3
            CMP AR3 < T0, TC1
            MOV #1, AR3
            XCCPART TC1 || MOV #2, AR3
            B loc_02a70b
loc_02a6f5: B loc_02a70b || MOV #3, AR3
loc_02a6f9: B loc_02a70b || MOV #4, AR3
loc_02a6fd: B loc_02a70b || MOV #5, AR3
loc_02a701: B loc_02a70b || MOV #6, AR3
loc_02a705: B loc_02a70b || MOV #7, AR3
loc_02a709: MOV #8, AR3
loc_02a70b: MOV #0, AC0
            BCC loc_02a726, T0 <= #0
            SUB #1, T0, T1
            MOV T1, BRC0
            SUB #1, AR3, AR4
            RPTBLOCAL loc_02a724 || NEG AR4, T1
               MPYM *AR2+, *AR1+, AC1
               SFTS AC1, T1, AC1
loc_02a724:    ADD AC1, AC0
loc_02a726: SFTS AC0, #0, AC1
            EXP AC1, T1
            SUB T1, AR3
            MOV AR3, *AR0
            SFTS AC0, T1, AC0
            RET
sub_02a734: BCC loc_02a74c, T1 <= #0
            SUB #1, T1, AR1
            MOV AR1, BRC0
            AMAR *AR0, XAR3
            AADD AR1, AR3 || RPTBLOCAL loc_02a74a
               SFTS T0, #-1 || AND #1, T0, AC0
loc_02a74a:    MOV AC0, *AR3-
loc_02a74c: AADD T1, AR0 || RET
sub_02a751: PSH T3, T2
            MOV T0, AR5 || PSHBOTH XAR5
            AMAR *AR1, XAR2
            MOV #16, AR1 || MOV AR5, AC0
            CMP AR5 < AR1, TC1 || SFTS AC0, #-4, AC0
            MOV AC0, T3
            BCC loc_02a77e, TC1
            MOV #16, T1 || MOV T3, T2
            AMAR *AR2, XAR4
loc_02a774: MOV *AR4+, T0
            CALL sub_02a734
            SUB #1, T2
            BCC loc_02a774, T2 != #0
loc_02a77e: MOV T3, AC0
            SFTS AC0, #4, AC0
            SUB AC0, AR5
            BCC loc_02a790, AR5 <= #0
            MOV T3, T0
            MOV *AR2(T0), T0 || MOV AR5, T1
            CALL sub_02a734
loc_02a790: POPBOTH XAR5
            POP T3, T2
            RET
sub_02a796: BCC loc_02a7ae, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            AMAR *AR0, XAR3
            AADD AR1, AR3 || RPTBLOCAL loc_02a7aa
               AND #1, AC0, AC1
loc_02a7aa:    MOV AC1, *AR3- || SFTS AC0, #-1
loc_02a7ae: AMAR *(AR0+T0)
            RET
sub_02a7b2: MOV #0, AC0
            BCC loc_02a7c3, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            RPTBLOCAL loc_02a7c0
               SFTS AC0, #1
loc_02a7c0:    OR *AR0+, AC0, AC0
loc_02a7c3: MOV AC0, T0
            RET
sub_02a7c7: MOV T1, T3 || PSH T3, T2
            AMAR *AR1, XAR2
            MOV #16, AR1 || MOV T3, AC0
            SFTS AC0, #-4, AC0 || CMP T3 < AR1, TC1
            AADD #-1, SP
            AMAR *AR0, XAR3 || MOV AC0, T2
            BCC loc_02a7fd, TC1
            AMAR *AR3, XAR4 || MOV T2, T1
loc_02a7e9: AMAR *AR2, XAR0
            MOV #16, T0
            CALL sub_02a7b2
            SUB #1, T1
            MOV T0, *AR4+ || AADD #16, AR2
            BCC loc_02a7e9, T1 != #0
loc_02a7fd: MOV T2, AC0
            SFTS AC0, #4, AC0
            SUB AC0, T3
            BCC loc_02a81d, T3 <= #0
            AMAR *AR2, XAR0 || MOV T3, T0
            CALL sub_02a7b2
            MOV T2, T0 || MOV T0, AC0
            MOV #16, T1
            SUB T3, T1
            SFTS AC0, T1, AC0
            MOV AC0, *AR3(T0)
loc_02a81d: AADD #1, SP
            POP T3, T2
            RET
sub_02a823: MOV #0, AC0
            BCC loc_02a835, T0 <= #0
            SUB #1, T0, AR1
            MOV AR1, BRC0
            RPTBLOCAL loc_02a833
               MOV *AR0+, AC1 || SFTS AC0, #1
loc_02a833:    OR AC1, AC0
loc_02a835: RET
sub_02a837: MOV T0, AR4 || PSH T3, T2
            AADD #-1, SP
            BCC loc_02a8a0, T1 <= #0
            MOV T1, AR3
            SUB #1, AR3, T2
            MOV #6554, T3
            AMAR *AR1, XAR3
            AADD T2, AR3
            MOV *AR3, AR3
            CMP AR3 >= T3, TC1
            BCC loc_02a8a0, TC1
            MOV T1, T0
            MOV *AR1(T0) << #16, AC1 || MOV AR3, HI(AC0)
            SFTS AC1, #-1, AC1
            CMP AC0 >= AC1, TC1
            BCC loc_02a8a0, TC1
            MOV T1, AR3
            ADD #1, AR3, T0
            MOV *AR1(T0) << #16, AC1
            SFTS AC1, #-1, AC1
            CMP AC0 >= AC1, TC1
            BCC loc_02a8a0, TC1
            MOV T2, T0
            MOV *AR0(T0) << #16, AC0 || MOV T1, T0
            MOV *AR0(T0) << #16, AC0 || SFTS AC0, #-1, AC1
            OR #0, AC0, AC2
            SUB AC1, AC2
            SFTS AC2, #0, AC2 || BSET ST1_SATD
            BCLR ST1_SATD || ABS AC2, AC2
            SFTS AC1, #-2, AC1
            CMP AC2 >= AC1, TC1
            BCC loc_02a8a0, TC1
            SFTS AC0, #1
loc_02a89b: B loc_02a918 || MOV HI(AC0), T0
loc_02a8a0: MOV T1, T0
            MOV #13108, T2
            MOV *AR1(T0), AR3
            CMP AR3 < T2, TC1
            BCC loc_02a916, TC1
            MOV AR2, T0
            MOV #13107, T1
            MOV *AR1(T0), AR3
            CMP AR3 < T1, TC1
            BCC loc_02a8dd, TC1
            MOV #3, BRC0
            AMAR *AR1, XAR3 || MOV #1, T2
            MOV *AR1, AR2 || MOV #0, T0
            AMAR *AR3+ || RPTBLOCAL loc_02a8d7
               MOV *AR3+, T1
               CMP T1 >= AR2, TC1
               XCCPART !TC1 || MOV T2, T0
               ADD #1, T2
loc_02a8d7:    XCC !TC1 || MOV *AR1(T0), AR2
            B loc_02a8df
loc_02a8dd: MOV *AR1(T0), AR2
loc_02a8df: MOV #13107, AR1
            CMP AR2 < AR1, TC1
            BCC loc_02a916, TC1
            AMAR *AR0, XAR3 || MOV #3, BRC0
            MOV *AR0 << #16, AC0 || MOV #1, T0
            AMAR *AR3+ || RPTBLOCAL loc_02a911
               SUB AR4, *AR3+, AR1
               BSET ST3_SATA
               ABS AR1, AR2
               BCLR ST3_SATA
               MOV HI(AC0), AR1
               SUB AR4, AR1
               BSET ST3_SATA
               ABS AR1, AR1
               CMP AR2 >= AR1, TC1
               BCLR ST3_SATA
               XCC !TC1 || MOV *AR0(T0) << #16, AC0
loc_02a911:    ADD #1, T0
            B loc_02a89b
loc_02a916: MOV *AR0(T0), T0
loc_02a918: MOV #27594, AR1
            CMP AR1 < T0, TC1
            BCC loc_02a92d, TC1
            MOV #4217, AR1
            MOV T0, AC0
            MAX AR1, AC0
            MOV AC0, T0
            B loc_02a931
loc_02a92d: MOV #27594, T0
loc_02a931: AADD #1, SP
            POP T3, T2
            RET
sub_02a937: MOV #5, AR1
            CMP T0 < AR1, TC1
            BCC loc_02a97f, TC1
            MOV #122, AR1
            CMP AR1 < T0, TC1
            XCCPART !TC1 || MOV #0, T0
            BCC loc_02a981, !TC1
            MOV #128, AR1
            CMP T0 < AR1, TC1
            BCC loc_02a97f, TC1
            MOV #144, AR1
            CMP T0 >= AR1, TC1
            XCCPART !TC1 || MOV #1, T0
            BCC loc_02a981, !TC1
            MOV #160, AR1
            CMP T0 >= AR1, TC1
            XCCPART !TC1 || MOV #3, T0
            BCC loc_02a981, !TC1
            MOV #164, AR1
            CMP T0 >= AR1, TC1
            XCCPART !TC1 || MOV #2, T0
            BCC loc_02a981, !TC1
loc_02a97f: MOV #4, T0
loc_02a981: RET
sub_02a983: MOV #4, AR1
            CMP T0 >= AR1, TC1
            BCC loc_02a997, TC1
            MOV #-60, AR1
            MOV mmap(@T0), AC0
            MAX AR1, AC0
            B loc_02a999 || MOV AC0, T1
loc_02a997: MOV #3, T1
loc_02a999: MOV #-21994 << #16, AC0
            SFTL AC0, #0, AC1
            MOV #29642 << #16, AC0
            SFTS AC0, #-9, AC0
            MOV #2048 << #16, AC1 || MAC AC1, T1, AC0, AC0
            SFTS AC0, #9, AC0
            SUB AC1, AC0
            MOV HI(AC0), T0
            RET
sub_02a9b6: AADD #-1, SP
            CALL sub_02a937
            BCC loc_02a9e9, T0 == #0
            MOV #1, AR2
            SUB #1, T0, AR1
            CMPU AR2 >= AR1, TC1
            XCCPART !TC1 || MOV #0, T0
            XCCPART !TC1 || MOV #0, *AR0
            BCC loc_02a9f2, !TC1
            MOV T1, T0
            CALL sub_02a983
            MOV #2048 << #16, AC1 || MOV T0, HI(AC0)
            SUB AC1, AC0
            SFTL AC0, #-16, AC0
            MOV T0, *AR0 || MOV AC0, T0
            B loc_02a9ee
loc_02a9e9: MOV T1, T0
            CALL sub_02a983
loc_02a9ee: MOV T0, *AR0 || MOV #1, T0
loc_02a9f2: AADD #1, SP
            RET
sub_02a9f6: MOV #2048 << #16, AC0 || MOV T0, HI(AC1)
            ADD AC1, AC0
            SFTS AC0, #0, AC0
            MOV #29642 << #16, AC1
            SUB AC1, AC0
            MOV #-16216 << #16, AC0 || MOV HI(AC0), T1
            SFTL AC0, #0, AC0
            MPY T1, AC0, AC0
            SFTS AC0, #-8, AC0
            ROUND AC0, AC0
            MOV HI(AC0), T0 || MOV #4, AR1
            CMP T0 >= AR1, TC1
            XCCPART !TC1 || MOV #-60, AR1
            MAX AR1, T0
            XCCPART TC1 || MOV #3, T0
            RET
sub_02aa2c: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AADD #-60, SP
            AMAR *AR0, XAR7
            MOV XSP, XAR0
            AMAR *+AR0(#0000h)
            MOV T1, T2
            MOV T0, AR5 || MOV #2, AR1
            CMP AR5 < AR1, TC1
            BCC loc_02aa89, TC1
            CMP AR1 >= AR5, TC1
            BCC loc_02aa85, TC1
            MOV #4, AR1
            CMP AR1 >= AR5, TC1
            BCC loc_02aa81, TC1
            MOV #8, AR1
            CMP AR1 >= AR5, TC1
            BCC loc_02aa7d, TC1
            MOV #16, AR1
            CMP AR1 >= AR5, TC1
            BCC loc_02aa79, TC1
            MOV #32, AR1
            CMP AR1 < AR5, TC1
            MOV #-5, AR6
            XCCPART TC1 || MOV #-6, AR6
            B loc_02aa8b
loc_02aa79: B loc_02aa8b || MOV #-4, AR6
loc_02aa7d: B loc_02aa8b || MOV #-3, AR6
loc_02aa81: B loc_02aa8b || MOV #-2, AR6
loc_02aa85: B loc_02aa8b || MOV #-1, AR6
loc_02aa89: MOV #0, AR6
loc_02aa8b: MOV AR6, *SP(#38h)
            AMAR *AR7, XAR1 || MOV T0, AR5
            SUB #1, T0, AR2
            MOV AR2, CSR
            RPT CSR
               MOV *AR1+, *AR0+
            MOV AR5, T0
            MOV AR5, AR2
            AMAR *(#word_eb40), XAR3
            MIN T2, AR2
            MOV *AR3(T0), AR1
            BCC loc_02ab0d, AR2 <= #0
            MOV XSP, XAR6
            AMAR *+AR0(#0000h)
            SUB #1, AR2
            MOV AR2, BRC0
            AMAR *AR7, XAR4 || MOV #0, AC3
            AMAR *(#word_e6fa), XAR2
            SUB #1, AR5, T2
            MOV T2, BRC1
            BSET ST1_M40
            BSET ST1_FRCT
            MOV AR1, T3
            RPTB loc_02ab08 || MOV #0, T1
               MOV XAR6, XAR3 || SFTS AC3, #-1, AC0
               ADD #64, AC0, AC1
               MOV *SP(#38h), T2
               RPTBLOCAL loc_02aaf5 || MOV #0, AC0
                  MOV AC0, dbl(*SP(#3ah)) || SFTS AC1, #-7, AC2
                  AND #511, AC2, T0 || ADD AC3, AC1
                  MPYM *AR2(T0), *AR3+, AC0
                  SFTS AC0, T2, AC0
loc_02aaf5:       ADD dbl(*SP(#3ah)), AC0, AC0
               SUB T2, T2
               MANT AC0, AC0 :: NEXP AC0, T2 || XCCPART AC0 != #0
               SUB *SP(#38h), T2, T2 || MPY T3, AC0, AC0
               SFTS AC0, T2, AC0 || ADD #1, T1
loc_02ab08:    MOV rnd(HI(AC0)), *AR4+ || ADD AR1, AC3
loc_02ab0d: BCLR ST1_M40
            BCLR ST1_FRCT
            AADD #60, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02ab1d: PSH T2
            MOV #4250, AR1 || MOV T1, T2
            MOV #-4, T1 || CMP T0 >= AR1, TC1
            XCCPART !TC1 || MOV #4250, T0
            .vli_off
            CALL sub_0240d0
            .vli_on
            SFTS AC0, #10, AC0
            MOV HI(AC0), AR1
            MOV #-4350 << #16, AC0 || MOV AR1, HI(AC1)
            SUB AC1, AC0
            MOV #-18490 << #16, AC0 || MOV HI(AC0), T1
            SFTL AC0, #0, AC0
            MPY T1, AC0, AC0
            SUB #6, T2, T1 || POP T2
            SFTS AC0, #-5, AC0
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            RET
sub_02ab5b: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            MOV AR3, T2
            AMAR *AR1, XAR7 || MOV T1, T3
            AMAR *AR0, XAR5 || MOV #1, AR1
            AMAR *AR2, XAR6 || CMP T0 == AR1, TC1
            AADD #-2, SP
            BCC loc_02abd6, TC1
            MOV #2, AR1
            CMP T0 == AR1, TC1
            BCC loc_02aba6, TC1
            MOV #30324, AR1
            MOV #0, *AR5 || CMP T2 == AR1, TC1
            XCCPART !TC1 || SUB #6, T3, T1
            XCCPART !TC1 || MOV #62, AC0
            XCCPART TC1 || SUB #6, T3, T1
            XCCPART TC1 || MOV #60, AC0
            B loc_02abc3
loc_02aba6: MOV #30324, AR1
            CMP T2 == AR1, TC1
            MOV #16384, *AR7
            BCC loc_02abc9, TC1
            MOV #24596, *AR5
            MOV #14, *AR6
            MOV #62, AC0
loc_02abbf: SUB #6, T3, T1
loc_02abc3: SFTS AC0, T1, AC0
            MOV AC0, *SP(#00h)
            B loc_02abed
loc_02abc9: MOV #20480, *AR5
            MOV #60, AC0
            MOV #15, *AR6
            B loc_02abbf
loc_02abd6: MOV *AR7, T0
            CALL sub_02ab1d
            MOV T0, *SP(#00h)
            AMAR *AR6, XAR1 || MOV T2, AR2
            AMAR *AR7, XAR0 || MOV T3, T1
            .vli_off
            CALL sub_0294e6
            .vli_on
            MOV T0, *AR5
loc_02abed: MOV *SP(#00h), T0
            AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02abfb: PSHBOTH XAR5
            PSHBOTH XAR7
            AMAR *AR1, XAR5
            AADD #-1, SP
            AMAR *AR0, XAR7
            MOV *AR5, *AR7
            MOV *AR5, AR1
            SUB #1, AR1
            BCC loc_02ac1e, AR1 != #0
            MOV dbl(*AR5(short(#4))), AC0
            MOV AC0, dbl(*AR7(short(#6)))
            MOV *AR5(short(#7)), AR2
            MOV AR2, *AR7(#0043h)
            B loc_02ac28
loc_02ac1e: MOV #0, AC0
            MOV #0, *AR7(#0043h)
            MOV AC0, dbl(*AR7(short(#6)))
loc_02ac28: BCC loc_02ac2d, AR1 == #0
            BCC loc_02ac73, T0 == #0
loc_02ac2d: MOV *AR5(short(#2)), AR1
            MOV AR1, *AR7(short(#1))
            MOV *AR5(short(#6)), AR1
            MOV AR1, *AR7(#0008h)
            AADD #10, AR0
            MOV #56, T0
            AMAR *AR5, XAR1
            AADD #8, AR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
            MOV #56, AR1
            MOV *AR5(short(#2)), AR2
            CMP AR2 >= AR1, TC1
            BCC loc_02ac73, TC1
            MOV #55, AR1
            SUB AR2, AR1
            MOV AR1, BRC0
            AMAR *AR7, XAR3
            AADD AR2, AR3
            AADD #10, AR3 || RPTBLOCAL loc_02ac71
               MOV *AR5(short(#2)), AC1
               MOV XAR5, AC0
               ADD AC1, AC0
               MOV AC0, XAR2
               MOV *AR2(short(#7)), AR1
loc_02ac71:    MOV AR1, *AR3+
loc_02ac73: MOV #0, *AR7(#0046h)
            AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR5
            RET
sub_02ac80: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AADD #-113, SP
            AMAR *SP(#00h), XAR0 || MOV T0, T3
            AMAR *AR2, XAR7 || MOV AR3, T2
            .vli_off
            CALL sub_02772b
            .vli_on
            AMAR *SP(#38h), XAR0 || MOV T2, T1
            AMAR *AR7, XAR1 || MOV T3, T0
            .vli_off
            CALL sub_02772b
            .vli_on
            BCC loc_02acc2, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            AMAR *SP(#00h), XAR2
            AMAR *SP(#38h), XAR3 || RPTBLOCAL loc_02acc0
               MOV *AR2+, AC0
               ADD *AR3+, AC0, AC0
               SFTS AC0, #15, AC0
loc_02acc0:    MOV HI(AC0), *AR5+
loc_02acc2: AADD #113, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02accc: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            AADD #-32, SP
            AMAR *AR0(#001fh), XAR5
            MOV XSP, XAR1
            MOV *AR0, AR2
            AMAR *SP(#00h), XAR4
            MOV XAR0, XAR7
            SFTS AR2, #-1
            ADD #17, AR1, AR1
            MOV AR2, *AR4 || ADD #1, AR7
            MOV XAR1, XAR3
            MOV XAR4, XAR2 || MOV #14, BRC0
            BSET ST1_M40
            MOV #-17, T0
            RPTBLOCAL loc_02ad06 || ADD #1, AR2
               ADD *AR5, *AR7, AC0
               MOV AC0 << T0, *AR2+
               SUB *AR7+, *AR5-, AC0
loc_02ad06:    MOV AC0 << T0, *AR3+
            MOV XAR4, XAR3
            MOV *AR0(#0010h), AR2
            SFTS AR2, #-1
            MOV AR2, *AR4(#0010h)
            RPT #16 || MOV #0, AC0
               ADD *AR3+, AC0, AC0
            MOV #14, BRC0
            MOV #0, *AR0(short(#1)) || SFTS AC0, #-3, AC0
            MOV AC0, *AR0 || MOV #1, T1
            MOV #32, BK03
            BSET ST2_AR2LC
            BSET ST2_AR3LC
            AMAR *(#word_ec1f), XAR2
            AMAR *(#word_ec1f), XAR3
            MOV mmap(@AR2), BSA23
            AMAR *SP(#00h), XAR4
            AMAR *SP(#00h), XAR5
            AADD #17, AR5
            MOV #14, BRC1
            MOV XAR5, XAR1
            AMAR *+AR0(#0002h)
            MOV #9, T2
            MOV #-18, T0
            RPTB loc_02ad88
               MOV #0, AC1 || MOV T2, AR3
               MOV *AR4+ << #13, AC0 || MOV T1, AR2
               MPYM *AR4+, *(AR2+T1), AC2
               RPTBLOCAL loc_02ad79 || ADD AC2 << #-2, AC0
                  MPYM *AR4+, *(AR2+T1), AC2
                  ADD AC2 << #-2, AC0
                  MPYM *AR5+, *(AR3+T1), AC2
loc_02ad79:       ADD AC2 << #-2, AC1
               MOV XAR1, XAR5
               MOV HI(AC0), *AR0+ || ADD #1, T1
               AMAR *SP(#00h), XAR4 || MOV #14, BRC1
loc_02ad88:    MOV HI(AC1), *AR0+ || ADD #1, T2
            BCLR ST2_AR2LC
            BCLR ST2_AR3LC
            BCLR ST1_M40
            AADD #32, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_02ad9c: PSH T2
            PSHBOTH XAR5
            BTST @#0ch, T1, TC1
            MOV AR2, T2
            AMAR *AR0, XAR5 || PSHBOTH XAR7
            AADD #-2, SP
            BCC loc_02ae3a, !TC1
            MOV T2, AC1
            MOV XAR5, AC0
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR3
            AADD #7, AR3
            MOV XAR3, AC0
            MOV AC0, XAR7
            MOV *AR7, AR2
            MOV AR2, *SP(#00h)
            MOV *AR7(short(#1)), AR2
            MOV AR2, *SP(#01h)
            AMAR *SP(#00h), XAR0
            AMAR *AR5, XAR2 || MOV #0, T1
            .vli_off
            CALL sub_02181a
            .vli_on
            MOV #255, AR1
            CMP T0 != AR1, TC1
            BCC loc_02ae1e, TC1
            MOV #128, AR2
            MOV *AR5(short(#4)), AR1
            CMP AR1 < AR2, TC1
            BCC loc_02ae09, TC1
            MOV *AR5(short(#3)), AR2
            BCC loc_02ae09, AR2 <= #0
            AMAR *AR5, XAR3
            AADD T2, AR3
            AADD #5, AR3
            MOV AR1, *AR3
            ADD #-1, *AR5(short(#3))
            MOV #-20479, *AR7(short(#1))
            MOV #-20479, *AR7
            B loc_02ae34
loc_02ae09: AMAR *AR5, XAR3
            AADD T2, AR3
            AADD #5, AR3
            MOV #255, *AR3
            MOV #0, *AR7
            MOV #0, *AR7(short(#1))
            B loc_02ae34
loc_02ae1e: AMAR *AR5, XAR3
            AADD T2, AR3
            MOV *SP(#00h), AR1 || AADD #5, AR3
            MOV T0, *AR3
            MOV AR1, *AR7
            MOV *SP(#01h), AR1
            MOV AR1, *AR7(short(#1))
            MOV #0, *AR5(short(#3))
loc_02ae34: MOV *AR3, AR1
            MOV AR1, *AR5(short(#4))
            B loc_02ae56
loc_02ae3a: MOV T2, AC1
            MOV XAR5, AC0
            SFTL AC1, #1
            AMAR *AR5, XAR3 || ADD AC1, AC0
            MOV AC0, XAR5
            AADD T2, AR3
            MOV #255, *AR3(short(#5))
            MOV #0, *AR5(#0008h)
            MOV #0, *AR5(short(#7))
loc_02ae56: AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T2
            RET
sub_02ae60: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            MOV T1, T2
            AMAR *AR0, XAR5 || MOV #15, T1
            AADD #-3, SP
            AMAR *AR1, XAR7 || MOV #5, AR0
            .vli_off
            CALL sub_02410f
            .vli_on
            NOP
            MOV T0, T3
            MOV T3, AC0
            ADD *AR5, AC0, AC0
            MOV #1, AR3 || SFTS AC0, #16, AC0
            AMAR *SP(#02h), XAR0 || SFTS AC0, #0, AC0
            MOV #5, AR2 || SFTS AC0, #0, AC0
            AMAR *(#word_d878), XAR4
            MOV rnd(HI(AC0)), *SP(#02h) || MOV T2, T1
            AMAR *(#word_e482), XAR1
            MOV XAR7, dbl(*SP(#00h)) || MOV #1, T0
            .vli_off
            CALL sub_028756
            .vli_on
            MOV *SP(#02h) << #16, AC0 || MOV T3, HI(AC1)
            SFTS AC0, #0, AC0
            SUB AC1, AC0
            MOV HI(AC0), *AR5
            AADD #3, SP
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02aebf: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5
            AMAR *AR1, XAR0 || MOV T1, T3
            AADD #-2, SP
            AMAR *AR2, XAR7 || MOV T0, T2
            .vli_off
            CALL sub_028383
            .vli_on
            MOV T0, AR6
            MOV AR6, *SP(#00h)
            AMAR *SP(#00h), XAR0 || MOV T3, T1
            AMAR *AR7, XAR1 || MOV T2, T0
            CALL sub_02ae60
            MOV *SP(#00h), AR1
            MOV AR1, *AR5
            MOV #15974, AR1
            CMP AR1 >= AR6, TC1
            BCC loc_02af0b, TC1
            MOV #512, AC0 || MOV AR6, AC1
            SUB *SP(#00h), AC1, AC1
            CMP AC0 >= AC1, TC1
            XCCPART !TC1 || MOV #1, T0
            BCC loc_02af0d, !TC1
loc_02af0b: MOV #0, T0
loc_02af0d: AADD #2, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02af19: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR7
            PSHBOTH XAR6
            ADD #-262, mmap(@SP)
            AMAR *AR1, XAR5
            AMAR *SP(#00h), XAR6 || MOV T0, T3
            AMAR *AR0, XAR7 || MOV T1, T2
            MOV *AR6(#010dh), AR1
            MOV AC0, dbl(*AR6(#0104h))
            MOV AR2, *AR6(#0102h)
            MOV *AR6(#010ch), T0
            BCC loc_02af76, AR1 == #0
            CMP *AR5 == #3, TC1
            BCC loc_02af76, TC1
            MOV T0, AC1
            MOV XAR3, AC0
            SFTS AC1, #1, AC2
            ADD AC1 << #8, AC2
            ADD AC2, AC0
            MOV *AR4(T0), AC1 || ADD #1, T0
            MOV AC0, XAR1
            AMAR *SP(#00h), XAR0
            MOV *AR4(T0), T1
            AMAR *AR1, XAR2 || MOV AC1, T0
            AMAR *+AR2(#0102h)
            .vli_off
            CALL sub_027f12
            .vli_on
            B loc_02af8e || MOV T0, AR2
loc_02af76: MOV T0, AC1
            MOV XAR3, AC0
            SFTS AC1, #1, AC2
            ADD AC1 << #8, AC2
            ADD AC2, AC0
            MOV AC0, XAR3
            AMAR *SP(#00h), XAR2 || RPT #128
               MOV dbl(*AR3+), dbl(*AR2+)
            MOV *AR4(T0), AR2
loc_02af8e: MOV *AR6(#0102h), AR3
            AMAR *SP(#00h), XAR1 || MOV T2, T1
            AMAR *AR7, XAR0 || MOV T3, T0
            .vli_off
            CALL sub_027f89
            .vli_on
            AMAR *AR7, XAR0 || MOV T2, T0
            .vli_off
            CALL sub_02814e
            .vli_on
            MOV dbl(*AR6(#0104h)), AC0
            AND #16384, AC0, AC0
            BCC loc_02afc3, AC0 == #0
            AMAR *AR5, XAR1
            AMAR *AR7, XAR0
            AADD #66, AR1 || MOV T3, T0
            .vli_off
            CALL sub_0280cb
            .vli_on
loc_02afc3: ADD #262, mmap(@SP)
            POPBOTH XAR6
            POPBOTH XAR7
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02afd2: MOV #2, AR4
            CMP T0 == AR4, TC1
            BCC loc_02b07f, TC1
            SUB #6, AR2, T0
            AMAR *(#word_e30e), XAR4
            MOV *AR4(T0), AR4
            CMP AR3 < AR4, TC1
            BCC loc_02b051, TC1
            MOV AR3, T0 || MOV #4, AR2
            CMP T1 == AR2, TC1
            SUB AR4, T0
            BCC loc_02b02c, TC1
            MOV #5, AR2
            CMP T1 == AR2, TC1
            BCC loc_02b024, TC1
            MOV #6, AR2
            CMP T1 == AR2, TC1
            BCC loc_02b01c, TC1
            MOV #8, AR2
            CMP T1 != AR2, TC1
            XCC !TC1
            AMAR *(#word_e20a), XAR3
            XCC !TC1 || MOV *AR3(T0), AC1
            B loc_02b034
loc_02b01c: AMAR *(#word_e1ca), XAR3
            B loc_02b032
loc_02b024: AMAR *(#word_e1aa), XAR3
            B loc_02b032
loc_02b02c: AMAR *(#word_e19a), XAR3
loc_02b032: MOV *AR3(T0), AC1
loc_02b034: AND #65535, AC1, AC1
            OR #0, AC1, AC2
            XOR AC0, AC2
            SFTS AC2, #2, AC3
            AND AC2, AC3
            OR #0, AC1, AC2
            AND AC0, AC2
            OR AC3, AC2
            MOV AC2, dbl(*AR0)
            MOV AC1, dbl(*AR1)
            B loc_02b087
loc_02b051: MOV #6, AR4
            CMP AR2 != AR4, TC1
            XCCPART !TC1 || SFTL AR3, #1
            MOV #(word_e312 >> 16) << #16, AC0 || MOV AR3, AC1
            OR #(word_e312 & 0xffff), AC0, AC0
            SFTL AC1, #1
            ADD AC1, AC0
            MOV AC0, XAR3
            MOV dbl(*AR3), AC0
            AND #65535, AC0, AC0
            MOV AC0, dbl(*AR0)
            MOV dbl(*AR3), AC0
            SFTL AC0, #-16, AC0
            MOV AC0, dbl(*AR1)
            B loc_02b087
loc_02b07f: MOV #0, AC0
            MOV AC0, dbl(*AR1)
            MOV AC0, dbl(*AR0)
loc_02b087: RET
sub_02b089: BCC loc_02b0a6, T0 <= #0
            BCC loc_02b09b, T1 != #0
            SUB #1, T0, AR2
            MOV AR2, CSR
            RPT CSR
               MOV *AR0+, *AR1+
            B loc_02b0a6
loc_02b09b: SUB #1, T0, AR2
            MOV AR2, CSR
            RPT CSR
               MOV *AR1+, *AR0+
loc_02b0a6: RET
sub_02b0a8: PSH T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7 || MOV T0, T1
            AADD #-1, SP
            AMAR *AR1, XAR6 || MOV #6, T0
            CALL sub_02b089
            AMAR *AR6, XAR3
            AADD #7, AR3
            AMAR *(#word_ec3f), XAR5
            AMAR *AR3, XAR7
            AADD #4, AR3 || MOV #7, T2
            AMAR *(#word_ec46), XAR4
loc_02b0d6: MOV *AR4+, T0
            AMAR *AR3, XAR1
            CALL sub_02b089
            MOV *AR5+, AR1
            SUB #1, T2
            AADD AR1, AR3
            BCC loc_02b0d6, T2 != #0
            AMAR *AR7, XAR1 || MOV #4, T0
            CALL sub_02b089
            AMAR *AR6, XAR3
            AMAR *(#word_ec3f), XAR4
            AADD #11, AR3 || MOV #7, T2
            AMAR *(#word_ec46), XAR5
loc_02b104: MOV *AR5+, AR2
            AMAR *AR3, XAR1
            SUB AR2, *AR4, T0 || AADD AR2, AR1
            CALL sub_02b089
            MOV *AR4+, AR1
            SUB #1, T2
            AADD AR1, AR3
            BCC loc_02b104, T2 != #0
            AMAR *AR6, XAR1
            AADD #6, AR1 || MOV #1, T0
            CALL sub_02b089
            AADD #1, SP
            POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T2
            RET
sub_02b133: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            PSHBOTH XAR7
            AMAR *AR0, XAR5 || MOV #0, T3
            AMAR *AR1, XAR7 || MOV #0, T2
            AMAR *AR7, XAR6
loc_02b148: AMAR *AR6, XAR0 || MOV #12, T0
            .vli_off
            CALL sub_02a7b2
            .vli_on
            XCCPART T2 == #0 || MOV T0, T3
            MOV #12, AR1
            MOV #12, T1
            AMAR *(#word_ec13), XAR0
            .vli_off
            CALL sub_02b538
            .vli_on
            MOV #24, T0
            AMAR *AR5, XAR0
            .vli_off
            CALL sub_02a796
            .vli_on
            MOV #2, AR1
            ADD #1, T2
            AADD #12, AR6 || CMP T2 < AR1, TC1
            AMAR *AR0, XAR5
            BCC loc_02b148, TC1
            ASUB #24, AR0 || MOV #1, AR1
            MOV #24, T0 || MOV T3, T1
            .vli_off
            CALL sub_02b566
            .vli_on
            MOV XAR7, AC1
            MOV XAR6, AC0
            SUB AC1, AC0
            MOV #48, AR2 || MOV AC0, AR1
            CMP AR1 >= AR2, TC1
            BCC loc_02b1af, TC1
            MOV #48, T0
            SUB AR1, T0
            AMAR *AR5, XAR0
            AMAR *AR6, XAR1
            .vli_off
            CALL sub_02b5d4
            .vli_on
loc_02b1af: POPBOTH XAR7
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02b1b9: PSHBOTH XAR5
            AADD #-72, SP
            AMAR *AR0, XAR5
            AMAR *SP(#00h), XAR0
            CALL sub_02b133
            AMAR *SP(#00h), XAR1
            MOV #72, T0
            AMAR *AR5, XAR0 || MOV #12, T1
            .vli_off
            CALL sub_02b505
            .vli_on
            AADD #72, SP
            POPBOTH XAR5
            RET
sub_02b1dc: PSH T3, T2
            AMAR *(#word_e6ef), XAR3
            MOV #14, BRC0
            BSET ST3_SMUL
            MOV #0, T2
            RPTB loc_02b21c || BSET ST1_FRCT
               MOV dbl(*AR1+), AC0
               BCC loc_02b21c, AC0 == #0
               MOV *AR3- << #16, AC1 || MOV T1, AR2
               MANT AC0, AC0 :: NEXP AC0, T2 || XCCPART AC0 != #0
               MACMR *AR3+, AC0, AC1 || ADD T1, T2
               BTST @#00h, T2, TC1
               AMAR *AR3+ || ADD #1, T2
               MOV *AR3- << #16, AC2 || MOV HI(AC1), T3
               MACR AC0, T3, AC2, AC2 || SFTS T2, #-1
               XCCPART TC1 || MPYMR *AR3(short(#2)), AC2, AC2
               SUB T0, T2
               SFTS AC2, T2, AC0
loc_02b21c:    MOV rnd(HI(AC0)), *AR0+ || MOV #0, T2
            BCLR ST3_SMUL
            BCLR ST1_FRCT
            POP T3, T2
            RET
sub_02b229: PSH T3, T2
            AADD #-5, SP
            MOV XAR1, dbl(*SP(#00h))
            MOV XAR2, dbl(*SP(#02h))
            MOV XAR0, XAR1
            MOV #8192, AC1
            MOV #15, BRC0
            MOV dbl(*SP(#02h)), AC2 || BSET ST1_FRCT
            MOV dbl(*SP(#00h)), XAR2 || BSET ST1_M40
            MOV #16, T1
            MOV #6, T2
            MOV T2, BRC1
            RPTB loc_02b268
               MOV AC2, XAR3 || ADD #1, AC2
               RPTBLOCAL loc_02b25d || MOV AC1, AC0
                  MPYM *(AR3+T1), *AR2+, AC3
loc_02b25d:       ADD AC3 << #-3, AC0
               SFTS AC0, #2, AC0
               MOV dbl(*SP(#00h)), XAR2 || SAT AC0, AC0
loc_02b268:    MOV HI(AC0), *AR1+ || MOV T2, BRC1
            BCLR ST1_M40
            BCLR ST1_FRCT
            AADD #5, SP
            POP T3, T2
            RET
sub_02b276: PSH T3, T2
            PSHBOTH XAR5
            PSHBOTH XAR6
            AADD #-59, SP
            MOV XAR0, XAR3
            MOV T1, T2
            MOV T0, T3
            MOV XAR0, dbl(*SP(#38h)) || CMP T2 < T3, TC1
            XCCPART !TC1 || MOV T3, T2
            MOV *AR3, AR1
            MOV AR1, *SP(#00h) || MOV #2, AR1
            CMP T2 < AR1, TC1
            BCC loc_02b2aa, TC1
            AMAR *SP(#01h), XAR0
            AMAR *AR3(short(#1)), XAR1
            SUB #1, T2, T0
            .vli_off
            CALL sub_0281f5 || MOV #1, T1
            .vli_on
loc_02b2aa: MOV T3, T0
            AMAR *(#word_eb40), XAR3
            MOV *AR3(T0), AR5
            MOV AR5, AR1
            SFTS AR1, #-1
            MOV AR1, AC0
            BCC loc_02b2f5, T3 <= #0
            SUB #1, T3, AR1
            MOV AR1, BRC0
            MOV dbl(*SP(#38h)), XAR3
            BSET ST3_SMUL
            SUB #1, T2, AR1
            RPTBLOCAL loc_02b2f0 || BSET ST1_FRCT
               MOV AR1, BRC1
               AMAR *SP(#00h), XAR2 || SUB AC2, AC2
               AMAR *(#word_e6fa), XAR4
               MOV #64, AC1 || RPTBLOCAL loc_02b2ec
                  SFTS AC1, #-7, AC3
                  AND #511, AC3, T0 || ADD AC0, AC1
loc_02b2ec:       MACM *AR2+, *AR4(T0), AC2, AC2
loc_02b2f0:    MOV rnd(HI(saturate(AC2))), *AR3+ || ADD AR5, AC0
loc_02b2f5: BCLR ST3_SMUL
            BCLR ST1_FRCT
            AADD #59, SP
            POPBOTH XAR6
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02b303: PSH T3, T2
            PSHBOTH XAR5
            MOV T1, T2
            MOV T0, T1
            AMAR *AR2, XAR5 || MOV T2, AR2
            SUB #6, T1, T2
            MOV #62, AC0
            SFTS AC0, T2, AC0
            MOV AC0, T3
            AMAR *AR1, XAR4 || CMP AR3 < T3, TC1
            AMAR *AR5, XAR1
            BCC loc_02b35f, TC1
            MOV AC0, AR2
            CMP AR3 == AR2, TC1
            BCC loc_02b34f, TC1
            MOV #63, AC0
            SFTS AC0, T2, AC0
            MOV AC0, AR2
            CMP AR3 == AR2, TC1 || MOV #0, T0
            XCCPART !TC1 || MOV #0, *AR0
            XCCPART TC1 || MOV #3, *AR0
            MOV #0, *AR4
            MOV #0, *AR1
            B loc_02b36b
loc_02b34f: MOV #16384, *AR4
            MOV #2, *AR0
            MOV #24596, T0
            MOV #14, *AR1
            B loc_02b36b
loc_02b35f: MOV #1, *AR0
            AMAR *AR4, XAR0 || MOV AR3, T0
            .vli_off
            CALL sub_0294e6
            .vli_on
loc_02b36b: POPBOTH XAR5
            POP T3, T2
            RET
sub_02b371: PSH T2
            AADD #-4, SP
            AMAR *(#word_d878), XAR4
            MOV XAR0, dbl(*SP(#00h))
            AMAR *(#word_e482), XAR1
            MOV #1, AR3 || MOV T1, T2
            MOV #5, AR2 || MOV T0, T1
            AMAR *SP(#02h), XAR0 || MOV #1, T0
            .vli_off
            CALL sub_02931f
            .vli_on
            MOV #15, T1
            MOV T2, T0 || MOV #5, AR0
            .vli_off
            CALL sub_02410f
            .vli_on
            MOV *SP(#02h) << #16, AC0 || MOV T0, HI(AC1)
            SFTS AC0, #0, AC0
            SUB AC1, AC0
            MOV #30720, AR2 || MOV HI(AC0), AR1
            CMP AR1 >= AR2, TC1
            BCC loc_02b3bf, TC1
            MOV #-30720, AR1 || MOV AR1, AC0
            MAX AR1, AC0
            MOV AC0, *SP(#02h)
            B loc_02b3c3
loc_02b3bf: MOV #30719, *SP(#02h)
loc_02b3c3: MOV *SP(#02h), T0
            AADD #4, SP
            POP T2
            RET
sub_02b3cb: PSH T3, T2
            PSHBOTH XAR5
            MOV #0, T3
            BCC loc_02b414, T1 <= #0
            SUB #1, T1, AR3
            MOV AR3, BRC0
            MOV #32767 << #16, AC3
            OR #576, mmap(@ST1_55)
            MOV #0, T2
            SUB #1, T0, AR5
            AMAR *AR1, XAR4 || SUB T0, AR2
            MOV AR2, T0
            SUB #1, T0
            MOV AR5, CSR
            OR #65535, AC3, AC3 || RPTBLOCAL loc_02b410
               AMAR *AR0, XAR3 || MOV #0, AC1
               SUB *AR4+, *AR3+, AC0 || RPT CSR
                  SQDST *AR4+, *AR3+, AC0, AC1
               MIN AC1, AC3 || MOV AR5, CSR
               XCCPART !Carry || MOV T2, T3
loc_02b410:    AMAR *(AR4+T0) || ADD #1, T2
loc_02b414: BCLR ST1_FRCT
            BCLR ST1_SATD
            MOV T3, T0
            POPBOTH XAR5
            POP T3, T2
            RET
sub_02b420: PSH T2
            PSHBOTH XAR5
            AADD #-1, SP
            AMAR *AR0, XAR5 || MOV T1, T2
            .vli_off
            CALL sub_02a937
            .vli_on
            BCC loc_02b451, T0 == #0
            MOV #1, AR2
            SUB #1, T0, AR1
            CMPU AR2 >= AR1, TC1
            XCCPART !TC1 || MOV #-90, *AR5
            XCCPART !TC1 || MOV #0, T0
            BCC loc_02b45b, !TC1
            MOV #2048 << #16, AC0 || MOV T2, HI(AC1)
            ADD AC1, AC0
            MOV HI(AC0), T2
loc_02b451: MOV T2, T0
            .vli_off
            CALL sub_02a9f6
            .vli_on
            MOV T0, *AR5 || MOV #1, T0
loc_02b45b: AADD #1, SP
            POPBOTH XAR5
            POP T2
            RET
sub_02b463: MOV #-21846 << #16, AC2
            OR #43690, AC2, AC2
            AND AC0, AC2
            BCC loc_02b499, AC2 == #0
            BCC loc_02b490, T0 <= #0
            MOV #-21846 << #16, AC0
            OR #43690, AC0, AC0
            AND AC1, AC0
            BCC loc_02b490, AC0 == #0
            MOV T1, HI(AC0)
            SFTS AC0, #8, AC1
            MOV T0, HI(AC0)
            SUB AC1, AC0
loc_02b489: SFTL AC0, #-16, AC0
            MOV AC0, *AR0
            B loc_02b49c
loc_02b490: MOV T1, HI(AC0)
            SFTS AC0, #8, AC0
            B loc_02b489 || SFTS AC0, #-1
loc_02b499: MOV #0, *AR0
loc_02b49c: RET
sub_02b49e: AADD #-1, SP
            MOV T0, *SP(#00h)
            SUB #1, T1
            MOV T1, CSR
            RPT CSR
               SUBC *SP(#00h), AC0, AC0
            AADD #1, SP
            MOV AC0, T0
            RET
sub_02b4b1: MOV T0, HI(AC1)
            AMAR *(#010000h), XAR3
            SFTS AC1, #1
            MOV AR0, HI(AC0)
            SUB AC0, AC1
            MOV XAR3, AC0
            ADD AC1, AC0 || BSET ST1_FRCT
            MPY T1, AC0, AC0 || MOV #14, T1
            SUB AR1, T1
            SFTS AC0, T1, AC0
            MOV HI(AC0), T0
            BCLR ST1_FRCT
            RET
sub_02b4d3: AMAR *AR0, XAR3
            AMAR *(AR3+T0)
            MOV XAR3, AC1
            BCC loc_02b503, T1 <= #0
            SUB #1, T1, AR2
            MOV AR2, BRC0
            RPTB loc_02b501
               MOV XAR0, AC0
               OR #0, AC0, AC2
               CMPU AC2 >= AC1, TC1
               BCC loc_02b501, TC1
loc_02b4f1:    MOV AC0, XAR3
               MOV *AR1+, *(AR3+T1)
               MOV XAR3, AC0
               OR #0, AC0, AC2
               CMPU AC2 < AC1, TC1
               BCC loc_02b4f1, TC1
loc_02b501:    AMAR *AR0+
loc_02b503: RET
sub_02b505: AMAR *AR1, XAR3
            AMAR *(AR3+T0)
            MOV XAR3, AC1
            BCC loc_02b535, T1 <= #0
            SUB #1, T1, AR2
            MOV AR2, BRC0
            RPTB loc_02b533
               MOV XAR1, AC0
               OR #0, AC0, AC2
               CMPU AC2 >= AC1, TC1
               BCC loc_02b533, TC1
loc_02b523:    MOV AC0, XAR3
               MOV *(AR3+T1), *AR0+
               MOV XAR3, AC0
               OR #0, AC0, AC2
               CMPU AC2 < AC1, TC1
               BCC loc_02b523, TC1
loc_02b533:    AMAR *AR1+
loc_02b535: RET
            NOP
sub_02b538: MOV AR1, AR2 || MOV T0, AC1
            BCC loc_02b55e, AR1 <= #0 || MOV #0, AC0
            SUB #1, AR1
            MOV #1, AC2 || MOV AR1, BRC0
            MOV *AR0+, AC3 || SFTS AC2, T1, AC2
            NOP
            RPTBLOCAL loc_02b55a || SUB #1, AC2
               AND AC1, AC3
               BCNT AC3, AC2, TC1, T0
               AND #1, T0, AR1 || SFTS AC0, #1
loc_02b55a:    MOV *AR0+, AC3 || OR AR1, AC0
loc_02b55e: MOV AR2, T0
            SFTS AC1, T0, AC1
            RET || OR AC1, AC0
sub_02b566: AMAR *AR0- || BCC loc_02b591, T0 <= #0
            SUB #1, T0, AR3 || MOV T1, AC0
            SFTS AC0, #4, AC0 || MOV AR3, BRC0
            MOV #13849, AC1 || MOV AC0, T1
            RPTBLOCAL loc_02b58d || MOV #0, AR2
               MACK T1, #173, AC1, AC0
               AMAR *AR0+ || MOV AC0, T1
               XCCPART T1 < #0 || SUB *AR0, AR1, AR4
loc_02b58d:    XCCPART T1 < #0 || MOV AR4, *AR0
loc_02b591: RET
sub_02b593: AADD #-1, SP
            MOV *AR1, *AR0
            MOV *AR1(short(#1)), AR2
            MOV #56, T0
            MOV AR2, *AR0(short(#1))
            MOV *AR1(short(#2)), AR2
            MOV AR2, *AR0(short(#2))
            MOV dbl(*AR1(short(#4))), AC0
            MOV AC0, dbl(*AR0(short(#4)))
            MOV *AR1(short(#6)), AR2
            MOV AR2, *AR0(short(#6))
            MOV *AR1(short(#7)), AR2 || AADD #8, AR1
            MOV AR2, *AR0(short(#7)) || AADD #8, AR0
            .vli_off
            CALL sub_02b5d4
            .vli_on
            AADD #1, SP
            RET
sub_02b5c0: BCC loc_02b5cf, T1 <= #0
            SUB #1, T1, AR1
            MOV AR1, CSR
            AMAR *AR0, XAR3 || RPT CSR
               MOV T0, *AR3+
loc_02b5cf: AADD T1, AR0 || RET
sub_02b5d4: BCC loc_02b5e4, T0 <= #0
            SUB #1, T0, AR2
            MOV AR2, CSR
            AMAR *AR0, XAR3 || RPT CSR
               MOV *AR1+, *AR3+
loc_02b5e4: AMAR *(AR0+T0)
            RET
sub_02b5e8: PSH T2
            PSHBOTH XAR5
            AADD #-1, SP
            AMAR *AR0, XAR5 || MOV T0, T2
            MOV dbl(*AR5), XAR0
            .vli_off
            CALL sub_02a7b2
            .vli_on
            MOV dbl(*AR5), XAR3
            MOV XAR3, dbl(*AR5) || AADD T2, AR3
            AADD #1, SP
            POPBOTH XAR5
            POP T2
            RET
sub_02b60b: PSHBOTH XAR5
            MOV T1, AR1
            MOV T0, T1
            AMAR *AR0, XAR5 || MOV AR1, T0
            MOV dbl(*AR5), XAR0
            .vli_off
            CALL sub_02a734
            .vli_on
            MOV XAR0, dbl(*AR5)
            POPBOTH XAR5
            RET
sub_02b624: MOV #1, AC2
            SFTS AC2, T0, AC2
            SUB #1, AC2
            BCNT AC0, AC2, TC1, T0
            RET
sub_02b62f: MOV XAR1, dbl(*AR0)
            RET

sub_01dbba: PSH AC1 || MOV AC0, T0
            MPYM *SP(#00h), AC0, AC0
            MAC AC1, T0, AC0, AC1
            MPYMU *SP(#00h), T0, AC0
            ADD AC1 << #16, AC0 || AADD #1, SP
            RET
