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
; ===========================================================================

Banner_Main:
		move.w	#$120,obX(a0)
		move.w	#$B8,obScreenY(a0) ; position is fixed to screen
		move.l	#Map_Banner,obMap(a0)
		move.w	#($9000/$20),obGfx(a0)
		move.b	#1,obPriority(a0)
		bra.w	DisplaySprite
		rts