;  =========================================================================
;   rocketsailor's note: 
;   Credit to E-122-Psi for the bouncing portion of the code.
;  =========================================================================
; ---------------------------------------------------------------------------
; Object 10 - "Superstars Amy Rose in" banner for title screen
; ---------------------------------------------------------------------------

TitleBanner:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Banner_Index(pc,d0.w),d1
		jmp	Banner_Index(pc,d1.w)
; ===========================================================================
Banner_Index:	dc.w Banner_Main-Banner_Index
		dc.w	Banner_Drop-Banner_Index
		dc.w	Banner_Stand-Banner_Index
; ===========================================================================

Banner_Main:
		addq.b	#2,obRoutine(a0)
		move.w	#$120,obX(a0)
		move.w	#$00,obScreenY(a0) ; position is fixed to screen
		move.l	#Map_Banner,obMap(a0)
		move.w	#($A000/$20),obGfx(a0)
		move.b	#1,obPriority(a0)

Banner_Drop:
		cmp.w	#$B0,obScreenY(a0)				; has titlecard reached bounce point yet?
		blt.s	Banner_NoBounce				; if not, branch
		tst.b	$28(a0)					; has bounce flag already been set?
		beq.s	Banner_NoFin				; if not, branch
		addq.b	#2,obRoutine(a0)			; increase routine counter
		bra.s	Banner_Stand				; continue to stand routine

Banner_NoFin:
		neg.w	obVelY(a0)					; reverse Y speed
		add.w	#$20,obVelY(a0)				; increase Y speed to prevent bouncing too high
		move.b	#1,$28(a0)				; set flag already bounced
		add.w	#$10,obVelY(a0)				; increase Y speed
		bra.s	Banner_NoExtra				; skip extra speed increase for one turn

Banner_NoBounce:
		add.w	#$10,obVelY(a0)				; increase Y speed
		tst.b	$28(a0)					; has bounce flag already been set?
		beq.s	Banner_NoExtra				; if not, branch
		add.w	#$30,obVelY(a0)				; increase Y speed extra (To drop down quicker)

Banner_NoExtra:
		bsr.s	SpeedToPos2				; convert speed to position

Banner_Stand:
		bra.w	DisplaySprite

SpeedToPos2:
		move.l	obX(a0),d2
		move.l	obScreenY(a0),d3
		move.w	obVelX(a0),d0	; load horizontal speed
		ext.l	d0
		asl.l	#8,d0		; multiply speed by $100
		add.l	d0,d2		; add to x-axis	position
		move.w	obVelY(a0),d0	; load vertical	speed
		ext.l	d0
		asl.l	#8,d0		; multiply by $100
		add.l	d0,d3		; add to y-axis	position
		move.l	d2,obX(a0)	; update x-axis	position
		move.l	d3,obScreenY(a0)	; update y-axis	position
		rts	