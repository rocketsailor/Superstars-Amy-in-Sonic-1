; ---------------------------------------------------------------------------
; Animation script - Sonic
; ---------------------------------------------------------------------------
Ani_Sonic:

ptr_Walk:	dc.w SonAni_Walk-Ani_Sonic
ptr_Run:	dc.w SonAni_Run-Ani_Sonic
ptr_Roll:	dc.w SonAni_Roll-Ani_Sonic
ptr_Roll2:	dc.w SonAni_Roll2-Ani_Sonic
ptr_Push:	dc.w SonAni_Push-Ani_Sonic
ptr_Wait:	dc.w SonAni_Wait-Ani_Sonic
ptr_Wait2:	dc.w SonAni_Wait2-Ani_Sonic
ptr_Wait3:	dc.w SonAni_Wait3-Ani_Sonic
ptr_Balance:	dc.w SonAni_Balance-Ani_Sonic
ptr_LookUp:	dc.w SonAni_LookUp-Ani_Sonic
ptr_Duck:	dc.w SonAni_Duck-Ani_Sonic
ptr_Stop:	dc.w SonAni_Stop-Ani_Sonic
ptr_Float1:	dc.w SonAni_Float1-Ani_Sonic
ptr_Float2:	dc.w SonAni_Float2-Ani_Sonic
ptr_Spring:	dc.w SonAni_Spring-Ani_Sonic
ptr_Hang:	dc.w SonAni_Hang-Ani_Sonic
ptr_GetAir:	dc.w SonAni_GetAir-Ani_Sonic
ptr_Burnt:	dc.w SonAni_Burnt-Ani_Sonic
ptr_Drown:	dc.w SonAni_Drown-Ani_Sonic
ptr_Death:	dc.w SonAni_Death-Ani_Sonic
ptr_Hurt:	dc.w SonAni_Hurt-Ani_Sonic
ptr_WaterSlide:	dc.w SonAni_WaterSlide-Ani_Sonic
ptr_Null:	dc.w SonAni_Null-Ani_Sonic
ptr_Float3:	dc.w SonAni_Float3-Ani_Sonic
ptr_Float4:	dc.w SonAni_Float4-Ani_Sonic
ptr_BadEndWait: dc.w SonAni_BadEndWait-Ani_Sonic
ptr_SpinDash: dc.w SonAni_SpinDash-Ani_Sonic
ptr_HammerAttack: dc.w SonAni_HammerAttack-Ani_Sonic
ptr_HammerCharge: dc.w SonAni_HammerCharge-Ani_Sonic
ptr_HammerRush: dc.w SonAni_HammerRush-Ani_Sonic

SonAni_Walk:	dc.b $FF, $F, $10, $11, $12, $13, $14, $D, $E, afEnd
		even
SonAni_Run:		dc.b $FF, $2D, $2E, $2F, $30, afEnd, afEnd, afEnd, afEnd, afEnd
		even
SonAni_Roll:	dc.b $FE, $3D, $3E, $3F, $40, $41, afEnd, afEnd
		even
SonAni_Roll2:	dc.b $FE, $3D, $3E, $41, $3F, $40, $41,	afEnd
		even
SonAni_Push:	dc.b $FD, $59, $5A, $5B, $5C, afEnd, afEnd, afEnd, afEnd, afEnd
		even
SonAni_Wait:	dc.b $11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, afChange, id_Wait2
		even
SonAni_Wait2:	dc.b $B, 3, 2, 3, 4, 3, 2, 3, 4, 3, 2, 3, 4, 3 
		dc.b 2, 3, 4, 3, 2, 3, 4, 3, 2, 3, 4, 3 
		dc.b 2, 3, 4, 3, 2, 3, 4, 3, 2, 3, 4, 3
		dc.b 2, 3, 4, 3, 2, 3, 4, 3, 2, 3, 4, 3
		dc.b 2, 3, 4, 3, 2, 3, 4, 3, afChange, id_Wait3
		even
SonAni_Wait3:	dc.b 8, 5, 6, 7, 7, 7, 8, 9, $A
		dc.b 7, 7, 7, 7, 7, 7, 8, 9, $A, 7, 7, 7, 7
		dc.b 7, 7, 8, 9, $A, 7, 7, 7, 7, 7, 7, 6, 5, afChange, id_Wait2
		even
SonAni_Balance:	dc.b 5, $62, $63, $64, afEnd
		even
SonAni_LookUp:	dc.b 4, $B, $C, afBack, 1
		even
SonAni_Duck:	dc.b 4, $4E, $4F, afBack, 1
		even
SonAni_Stop:	dc.b 3,	$4A, $4B, $4C, $4D, afBack, 1
		even
SonAni_Float1:	dc.b 7,	$52, $55, afEnd
		even
SonAni_Float2:	dc.b 7, $50, $51, $52, $53, $54, $55, $56, afEnd
		even
SonAni_Spring:	dc.b 7, $5D, $5E, $5D, $5E, $5D, $5E, afChange, id_Walk
		even
SonAni_Hang:	dc.b 4,	$57, $58, afEnd
		even
SonAni_GetAir:	dc.b $E, $66, $66, $D, $E, afChange, id_Walk
		even
SonAni_Burnt:	dc.b $20, $5F, afEnd
		even
SonAni_Drown:	dc.b $2F, $60, afEnd
		even
SonAni_Death:	dc.b 3,	$61, afEnd
		even
SonAni_Hurt:	dc.b 3,	$65, afEnd
		even
SonAni_WaterSlide:
		dc.b 7, $65, $67, afEnd
		even
SonAni_Null:	dc.b $67, 0, afChange, id_Walk
		even
SonAni_Float3:	dc.b 3,	$52, $53, $54, $55, $56, afEnd
		even
SonAni_Float4:	dc.b 3,	$52, afChange, id_Walk
		even
SonAni_BadEndWait: 	dc.b 3, $68, afEnd
		even
SonAni_SpinDash: dc.b 0, $69, $6A, $69, $6B, $69, $6C, $69, $6D, $69, $6E, afEnd 
		even
SonAni_HammerAttack:	dc.b 2, $42, $43, $44, $45, $46, $47, $48, $49, afEnd, afEnd
		even
SonAni_HammerCharge:	dc.b 1, $43, $45, $47, $49, afEnd
		even
SonAni_HammerRush:	dc.b 4, $6F, $70, $71, $72, $73, $74, $75, $76, afEnd
		even

id_Walk:	equ (ptr_Walk-Ani_Sonic)/2
id_Run:		equ (ptr_Run-Ani_Sonic)/2
id_Roll:	equ (ptr_Roll-Ani_Sonic)/2
id_Roll2:	equ (ptr_Roll2-Ani_Sonic)/2
id_Push:	equ (ptr_Push-Ani_Sonic)/2
id_Wait:	equ (ptr_Wait-Ani_Sonic)/2
id_Wait2:	equ (ptr_Wait2-Ani_Sonic)/2
id_Wait3:	equ (ptr_Wait3-Ani_Sonic)/2
id_Balance:	equ (ptr_Balance-Ani_Sonic)/2
id_LookUp:	equ (ptr_LookUp-Ani_Sonic)/2
id_Duck:	equ (ptr_Duck-Ani_Sonic)/2
id_Stop:	equ (ptr_Stop-Ani_Sonic)/2
id_Float1:	equ (ptr_Float1-Ani_Sonic)/2
id_Float2:	equ (ptr_Float2-Ani_Sonic)/2
id_Spring:	equ (ptr_Spring-Ani_Sonic)/2
id_Hang:	equ (ptr_Hang-Ani_Sonic)/2
id_GetAir:	equ (ptr_GetAir-Ani_Sonic)/2	
id_Burnt:	equ (ptr_Burnt-Ani_Sonic)/2
id_Drown:	equ (ptr_Drown-Ani_Sonic)/2
id_Death:	equ (ptr_Death-Ani_Sonic)/2
id_Hurt:	equ (ptr_Hurt-Ani_Sonic)/2
id_WaterSlide:	equ (ptr_WaterSlide-Ani_Sonic)/2
id_Null:	equ (ptr_Null-Ani_Sonic)/2
id_Float3:	equ (ptr_Float3-Ani_Sonic)/2	
id_Float4:	equ (ptr_Float4-Ani_Sonic)/2	
id_BadEndWait: equ (ptr_BadEndWait-Ani_Sonic)/2
id_SpinDash: equ (ptr_SpinDash-Ani_Sonic)/2
id_HammerAttack: equ (ptr_HammerAttack-Ani_Sonic)/2
id_HammerCharge: equ (ptr_HammerCharge-Ani_Sonic)/2
id_HammerRush: equ (ptr_HammerRush-Ani_Sonic)/2