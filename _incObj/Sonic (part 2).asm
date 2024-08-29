; ---------------------------------------------------------------------------
; Player when they get hurt
; ---------------------------------------------------------------------------

Sonic_Hurt:	; Routine 4
        clr.b	(f_hammerobject).w ; clear hammer object flag
		clr.b   (f_hammerrush).w ; clear hammer rush flag
		jsr	(SpeedToPos).l
		addi.w	#$30,obVelY(a0)
		btst	#6,obStatus(a0)
		beq.s	loc_1380C
		subi.w	#$20,obVelY(a0)

loc_1380C:
		bsr.w	Sonic_HurtStop
		bsr.w	Sonic_LevelBound
		bsr.w	Sonic_RecordPosition
		; Mercury's Underwater Hurt Fix (from S1Fixed)
		bsr.w 	Sonic_Water
		bsr.w	Sonic_Animate
		bsr.w	Sonic_LoadGfx
		jmp	(DisplaySprite).l

; ---------------------------------------------------------------------------
; Subroutine to	stop player falling after they've been hurt
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_HurtStop:
		move.w	(v_limitbtm2).w,d0
		addi.w	#$E0,d0
		cmp.w	obY(a0),d0
		bcs.w	KillSonic
		bsr.w	Sonic_Floor
		btst	#1,obStatus(a0)
		bne.s	locret_13860
		moveq	#0,d0
		move.w	d0,obVelY(a0)
		move.w	d0,obVelX(a0)
		move.w	d0,obInertia(a0)
		move.b	#id_Walk,obAnim(a0)
		subq.b	#2,obRoutine(a0)
		move.w	#$78,$30(a0)

locret_13860:
		rts	
; End of function Sonic_HurtStop

; ---------------------------------------------------------------------------
; Player's death
; ---------------------------------------------------------------------------

Sonic_Death:	; Routine 6
        clr.b	(f_hammerobject).w ; clear hammer object flag
        clr.b	(f_hammerrush).w ; clear hammer rush flag
		bsr.w	GameOver
		jsr	(ObjectFall).l
		bsr.w	Sonic_RecordPosition
		bsr.w	Sonic_Animate
		bsr.w	Sonic_LoadGfx
		jmp	(DisplaySprite).l

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


GameOver:
		move.w	(v_limitbtm2).w,d0
		addi.w	#$100,d0
		cmp.w	obY(a0),d0
		bcc.w	locret_13900
		move.w	#-$38,obVelY(a0)
		addq.b	#2,obRoutine(a0)
		clr.b	(f_timecount).w	; stop time counter
		addq.b	#1,(f_lifecount).w ; update lives counter
		subq.b	#1,(v_lives).w	; subtract 1 from number of lives
		bne.s	loc_138D4
		move.w	#0,$3A(a0)
		move.b	#id_GameOverCard,(v_objspace+$80).w ; load GAME object
		move.b	#id_GameOverCard,(v_objspace+$C0).w ; load OVER object
		move.b	#1,(v_objspace+$C0+obFrame).w ; set OVER object to correct frame
		clr.b	(f_timeover).w

loc_138C2:
		move.w	#bgm_GameOver,d0
		jsr	(PlaySound).l	; play game over music
		moveq	#3,d0
		jmp	(AddPLC).l	; load game over patterns
; ===========================================================================

loc_138D4:
		move.w	#60,$3A(a0)	; set time delay to 1 second
		tst.b	(f_timeover).w	; is TIME OVER tag set?
		beq.s	locret_13900	; if not, branch
		move.w	#0,$3A(a0)
		move.b	#id_GameOverCard,(v_objspace+$80).w ; load TIME object
		move.b	#id_GameOverCard,(v_objspace+$C0).w ; load OVER object
		move.b	#2,(v_objspace+$80+obFrame).w
		move.b	#3,(v_objspace+$C0+obFrame).w
		bra.s	loc_138C2
; ===========================================================================

locret_13900:
		rts	
; End of function GameOver

; ---------------------------------------------------------------------------
; Player when the level is restarted
; ---------------------------------------------------------------------------

Sonic_ResetLevel:; Routine 8
		tst.w	$3A(a0)
		beq.s	locret_13914
		subq.w	#1,$3A(a0)	; subtract 1 from time delay
		bne.s	locret_13914
		move.w	#1,(f_restart).w ; restart the level

locret_13914:
		rts	