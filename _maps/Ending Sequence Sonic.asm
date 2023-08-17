; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_dspja:	
		dc.w SME_dspja_10-SME_dspja, SME_dspja_1B-SME_dspja	
		dc.w SME_dspja_2B-SME_dspja, SME_dspja_36-SME_dspja	
		dc.w SME_dspja_41-SME_dspja, SME_dspja_4C-SME_dspja	
		dc.w SME_dspja_6B-SME_dspja, SME_dspja_99-SME_dspja	
SME_dspja_10:	dc.b 2	
		dc.b $EC, $B, 0, 0, $F8	
		dc.b $C, $C, 0, $C, $F0	
SME_dspja_1B:	dc.b 3	
		dc.b $FE, $D, 0, $10, $F0	
		dc.b $EC, $B, 0, 0, $F8	
		dc.b $C, $C, 0, $C, $F0	
SME_dspja_2B:	dc.b 2	
		dc.b $EC, 9, 0, $18, $F8	
		dc.b $FC, $E, 0, $1E, $F0	
SME_dspja_36:	dc.b 2	
		dc.b $EC, 9, 0, $2A, $F8	
		dc.b $FC, $E, 0, $30, $F0	
SME_dspja_41:	dc.b 2	
		dc.b $EC, 9, 8, $2A, $F0	
		dc.b $FC, $E, 8, $30, $F0	
SME_dspja_4C:	dc.b 6	
		dc.b 5, $D, 0, $42, $F0	
		dc.b $FD, 0, 0, $41, $F8	
		dc.b $ED, 1, 0, $3C, $F8	
		dc.b $FD, 0, 0, $3E, $F0	
		dc.b $ED, 2, 8, $3F, 0	
		dc.b $FD, 0, 0, $3E, 5	
SME_dspja_6B:	dc.b 9	
		dc.b $C9, $F, 0, $4A, $F4	
		dc.b $C9, 3, 0, $5A, $14	
		dc.b $D1, $A, 0, $5E, $DC	
		dc.b $D1, 2, 0, $67, $1C	
		dc.b $E9, $C, 0, $6A, $E4	
		dc.b $E9, 8, 0, $6E, 4	
		dc.b $F1, $C, 0, $71, $F4	
		dc.b $F9, 9, 0, $75, $FC	
		dc.b 9, 4, 0, $7B, 4	
SME_dspja_99:	dc.b $1A	
		dc.b $80, $F, 0, $7D, 8	
		dc.b $80, 3, 0, $8D, $28	
		dc.b $88, $B, 0, $91, $F0	
		dc.b $90, $F, 0, $9D, $C0	
		dc.b $90, 7, 0, $AD, $E0	
		dc.b $90, 4, 0, $B5, $30	
		dc.b $98, 3, 0, $B7, $30	
		dc.b $A0, $F, 0, $BB, 8	
		dc.b $A0, 3, 0, $CB, $28	
		dc.b $A8, $B, 0, $CF, $F0	
		dc.b $A8, 0, 0, $DB, $38	
		dc.b $B0, $C, 0, $DC, $C0	
		dc.b $B0, 6, 0, $E0, $E0	
		dc.b $B8, 8, 0, $E6, $C8	
		dc.b $C0, $F, 0, $E9, 8	
		dc.b $C0, 0, 0, $F9, $28	
		dc.b $C8, $F, 0, $FA, $E8	
		dc.b $D0, 3, 1, $A, $E0	
		dc.b $D0, 1, 1, $E, $28	
		dc.b $D8, 6, 1, $10, $D0	
		dc.b $E0, $D, 1, $16, 8	
		dc.b $E8, $C, 1, $1E, $E8	
		dc.b $F0, $E, 1, $22, $F0	
		dc.b $F8, 3, 1, $2E, $E8	
		dc.b 8, 8, 1, $32, $F0	
		dc.b $10, 4, 1, $35, $F0	
		even