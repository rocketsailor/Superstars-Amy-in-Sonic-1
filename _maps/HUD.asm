;  =========================================================================
;   rocketsailor's note: 
;   These mappings were modified to use the yellow from the second palette
;	line and the red from the first line. Thank you E-122-Psi for writing the
; 	forum post that explains how to do it.
;  =========================================================================
; ---------------------------------------------------------------------------
; Sprite mappings - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------
Map_575e:
Map_575e_0: 	dc.w Map_575e_8-Map_575e
Map_575e_2: 	dc.w Map_575e_3B-Map_575e
Map_575e_4: 	dc.w Map_575e_6E-Map_575e
Map_575e_6: 	dc.w Map_575e_A1-Map_575e

Map_575e_8: 	dc.b $A ; Everything yellow
	dc.b $80, $D, $A0, $0, $0
	dc.b $80, $D, $A0, $18, $20
	dc.b $80, $D, $A0, $20, $40
	dc.b $90, $D, $A0, $10, $0
	dc.b $90, $D, $A0, $28, $28
	dc.b $A0, $D, $A0, $8, $0
	dc.b $A0, $1, $A0, $0, $20
	dc.b $A0, $9, $A0, $30, $30
	dc.b $40, $5, $81, $A, $0
	dc.b $40, $D, $A1, $E, $10

Map_575e_3B: 	dc.b $A ; Rings red
	dc.b $80, $D, $A0, $0, $0
	dc.b $80, $D, $A0, $18, $20
	dc.b $80, $D, $A0, $20, $40
	dc.b $90, $D, $A0, $10, $0
	dc.b $90, $D, $A0, $28, $28
	dc.b $A0, $D, $80, $8, $0
	dc.b $A0, $1, $80, $0, $20
	dc.b $A0, $9, $A0, $30, $30
	dc.b $40, $5, $81, $A, $0
	dc.b $40, $D, $A1, $E, $10

Map_575e_6E: 	dc.b $A ; Time red
	dc.b $80, $D, $A0, $0, $0
	dc.b $80, $D, $A0, $18, $20
	dc.b $80, $D, $A0, $20, $40
	dc.b $90, $D, $80, $10, $0
	dc.b $90, $D, $A0, $28, $28
	dc.b $A0, $D, $A0, $8, $0
	dc.b $A0, $1, $A0, $0, $20
	dc.b $A0, $9, $A0, $30, $30
	dc.b $40, $5, $81, $A, $0
	dc.b $40, $D, $A1, $E, $10

Map_575e_A1: 	dc.b $A ; Both time and rings red
	dc.b $80, $D, $A0, $0, $0
	dc.b $80, $D, $A0, $18, $20
	dc.b $80, $D, $A0, $20, $40
	dc.b $90, $D, $80, $10, $0
	dc.b $90, $D, $A0, $28, $28
	dc.b $A0, $D, $80, $8, $0
	dc.b $A0, $1, $80, $0, $20
	dc.b $A0, $9, $A0, $30, $30
	dc.b $40, $5, $81, $A, $0
	dc.b $40, $D, $A1, $E, $10
	even