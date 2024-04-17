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
ptr_Balance:	dc.w SonAni_Balance-Ani_Sonic
ptr_LookUp:	dc.w SonAni_LookUp-Ani_Sonic
ptr_Duck:	dc.w SonAni_Duck-Ani_Sonic
ptr_Warp1:	dc.w SonAni_Warp1-Ani_Sonic
ptr_Warp2:	dc.w SonAni_Warp2-Ani_Sonic
ptr_Warp3:	dc.w SonAni_Warp3-Ani_Sonic
ptr_Warp4:	dc.w SonAni_Warp4-Ani_Sonic
ptr_Stop:	dc.w SonAni_Stop-Ani_Sonic
ptr_Float1:	dc.w SonAni_Float1-Ani_Sonic
ptr_Float2:	dc.w SonAni_Float2-Ani_Sonic
ptr_Spring:	dc.w SonAni_Spring-Ani_Sonic
ptr_Hang:	dc.w SonAni_Hang-Ani_Sonic
ptr_Leap1:	dc.w SonAni_Leap1-Ani_Sonic
ptr_Leap2:	dc.w SonAni_Leap2-Ani_Sonic
ptr_Surf:	dc.w SonAni_Surf-Ani_Sonic
ptr_GetAir:	dc.w SonAni_GetAir-Ani_Sonic
ptr_Burnt:	dc.w SonAni_Burnt-Ani_Sonic
ptr_Drown:	dc.w SonAni_Drown-Ani_Sonic
ptr_Death:	dc.w SonAni_Death-Ani_Sonic
ptr_Shrink:	dc.w SonAni_Shrink-Ani_Sonic
ptr_Hurt:	dc.w SonAni_Hurt-Ani_Sonic
ptr_WaterSlide:	dc.w SonAni_WaterSlide-Ani_Sonic
ptr_Null:	dc.w SonAni_Null-Ani_Sonic
ptr_Float3:	dc.w SonAni_Float3-Ani_Sonic
ptr_Float4:	dc.w SonAni_Float4-Ani_Sonic
ptr_HammerAttack: dc.w SonAni_HammerAttack-Ani_Sonic ; jump animation
ptr_HammerCharge: dc.w SonAni_HammerCharge-Ani_Sonic ; double jump animation
ptr_HammerRush: dc.w SonAni_HammerRush-Ani_Sonic ; running with hammer animation
ptr_BadEndWait: dc.w SonAni_BadEndWait-Ani_Sonic
ptr_SpinDash: dc.w SonAni_SpinDash-Ani_Sonic

SonAni_Walk:	dc.b $FF, 8, 9,	$A, $B,	6, 7, afEnd
		even
SonAni_Run:	dc.b $FF, $1E, $1F, $20, $21, afEnd, afEnd, afEnd
		even
SonAni_Roll:	dc.b $FE, $2E, $2F, $30, $31, $32, afEnd, afEnd
		even
SonAni_Roll2:	dc.b $FE, $2E, $2F, $32, $30, $31, $32,	afEnd
		even
SonAni_Push:	dc.b $FD, $45, $46, $47, $48, afEnd, afEnd, afEnd
		even
SonAni_Wait:	dc.b $C, 1, 1, 1, 1, 1, 1, 1, 1, 1
		dc.b 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 3, 2, afBack, 4
		even
SonAni_Balance:	dc.b 5, $52, $53, $54, afEnd
		even
SonAni_LookUp:	dc.b $3F, 5, afEnd
		even
SonAni_Duck:	dc.b $3F, $39, afEnd
		even
SonAni_Warp1:	dc.b $3F, $33, afEnd
		even
SonAni_Warp2:	dc.b $3F, $34, afEnd
		even
SonAni_Warp3:	dc.b $3F, $35, afEnd
		even
SonAni_Warp4:	dc.b $3F, $36, afEnd
		even
SonAni_Stop:	dc.b 7,	$37, $38, afEnd
		even
SonAni_Float1:	dc.b 7,	$3C, $3F, afEnd
		even
SonAni_Float2:	dc.b 7, $3A, $3B, $3C, $3D, $3E, $3F, $40, afEnd
		even
SonAni_Spring:	dc.b 7, $49, $4A, $49, $4A, $49, $4A, afChange, id_Walk
		even
SonAni_Hang:	dc.b 4,	$41, $42, afEnd
		even
SonAni_Leap1:	dc.b $F, $43, $43, $43,	afBack, 1
		even
SonAni_Leap2:	dc.b $F, $43, $44, afBack, 1
		even
SonAni_Surf:	dc.b $3F, $49, afEnd
		even
SonAni_GetAir:	dc.b $B, $56, $56, $A, $B, afChange, id_Walk
		even
SonAni_Burnt:	dc.b $20, $4B, afEnd
		even
SonAni_Drown:	dc.b $2F, $4C, afEnd
		even
SonAni_Death:	dc.b 3,	$4D, afEnd
		even
SonAni_Shrink:	dc.b 3,	$4E, $4F, $50, $51, $52, 0, afBack, 1
		even
SonAni_Hurt:	dc.b 3,	$55, afEnd
		even
SonAni_WaterSlide:
		dc.b 7, $55, $57, afEnd
		even
SonAni_Null:	dc.b $77, 0, afChange, id_Walk
		even
SonAni_Float3:	dc.b 3,	$3C, $3D, $3E, $3F, $40, afEnd
		even
SonAni_Float4:	dc.b 3,	$3C, afChange, id_Walk
		even
SonAni_HammerAttack:	dc.b 2, $51, $4E, $4F, $33, $34, $35, $4E, $4F, $50, $34, $35, $36, $4F, $50, $51, $35, $36, $33, $50, $51, $4E, afEnd
		even
SonAni_HammerCharge:	dc.b 2, $4F, $50, $51, $35, $36, $33, $50, $51, $35, $36, $33, $50, $51, $4E, $4F, afBack, 4
		even
SonAni_HammerRush:	dc.b 4, $5F, $60, $61, $62, $63, $64, $65, $66, afEnd
		even
SonAni_BadEndWait: 	dc.b 3, $58, afEnd
		even
SonAni_SpinDash: dc.b 0, $59, $5A, $59, $5B, $59, $5C, $59, $5D, $59, $5E, afEnd 
		even

id_Walk:	equ (ptr_Walk-Ani_Sonic)/2	; 0
id_Run:		equ (ptr_Run-Ani_Sonic)/2	; 1
id_Roll:	equ (ptr_Roll-Ani_Sonic)/2	; 2
id_Roll2:	equ (ptr_Roll2-Ani_Sonic)/2	; 3
id_Push:	equ (ptr_Push-Ani_Sonic)/2	; 4
id_Wait:	equ (ptr_Wait-Ani_Sonic)/2	; 5
id_Balance:	equ (ptr_Balance-Ani_Sonic)/2	; 6
id_LookUp:	equ (ptr_LookUp-Ani_Sonic)/2	; 7
id_Duck:	equ (ptr_Duck-Ani_Sonic)/2	; 8
id_Warp1:	equ (ptr_Warp1-Ani_Sonic)/2	; 9
id_Warp2:	equ (ptr_Warp2-Ani_Sonic)/2	; $A
id_Warp3:	equ (ptr_Warp3-Ani_Sonic)/2	; $B
id_Warp4:	equ (ptr_Warp4-Ani_Sonic)/2	; $C
id_Stop:	equ (ptr_Stop-Ani_Sonic)/2	; $D
id_Float1:	equ (ptr_Float1-Ani_Sonic)/2	; $E
id_Float2:	equ (ptr_Float2-Ani_Sonic)/2	; $F
id_Spring:	equ (ptr_Spring-Ani_Sonic)/2	; $10
id_Hang:	equ (ptr_Hang-Ani_Sonic)/2	; $11
id_Leap1:	equ (ptr_Leap1-Ani_Sonic)/2	; $12
id_Leap2:	equ (ptr_Leap2-Ani_Sonic)/2	; $13
id_Surf:	equ (ptr_Surf-Ani_Sonic)/2	; $14
id_GetAir:	equ (ptr_GetAir-Ani_Sonic)/2	; $15
id_Burnt:	equ (ptr_Burnt-Ani_Sonic)/2	; $16
id_Drown:	equ (ptr_Drown-Ani_Sonic)/2	; $17
id_Death:	equ (ptr_Death-Ani_Sonic)/2	; $18
id_Shrink:	equ (ptr_Shrink-Ani_Sonic)/2	; $19
id_Hurt:	equ (ptr_Hurt-Ani_Sonic)/2	; $1A
id_WaterSlide:	equ (ptr_WaterSlide-Ani_Sonic)/2 ; $1B
id_Null:	equ (ptr_Null-Ani_Sonic)/2	; $1C
id_Float3:	equ (ptr_Float3-Ani_Sonic)/2	; $1D
id_Float4:	equ (ptr_Float4-Ani_Sonic)/2	; $1E
id_HammerAttack: equ (ptr_HammerAttack-Ani_Sonic)/2 ; $1F 
id_HammerCharge: equ (ptr_HammerCharge-Ani_Sonic)/2 ; $20
id_HammerRush: equ (ptr_HammerRush-Ani_Sonic)/2 ; $21
id_BadEndWait: equ (ptr_BadEndWait-Ani_Sonic)/2 ; $22
id_SpinDash: equ (ptr_SpinDash-Ani_Sonic)/2 ; $23