; ---------------------------------------------------------------------------
; Subroutine to display player and set music
; ---------------------------------------------------------------------------

Sonic_Display:
		tst.b 	(f_hammerrush).w ; is player using hammer rush?
		beq.s 	.continue ; if not, branch
        move.b	(v_jpadhold2).w,d0
        andi.b	#btnABC,d0	; is A, B or C pressed?
        beq.s	.walk	; if not, branch
        tst.w	rushtime(a0)	; check	time remaining
		beq.s	.chkbonk  ; if no time remains, branch
		subq.w	#1,rushtime(a0)	; subtract 1 from time
		bne.s	.chkbonk

.walk:
        move.b	#id_Walk,obAnim(a0) ; use running/walking animation
        clr.b	(f_hammerobject).w ; clear hammer object flag
        clr.b	(f_hammerrush).w ; clear hammer rush flag
		bra.s 	.continue

.chkbonk:
		cmpi.b 	#fr_Bonk1,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk2,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk3,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk4,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk5,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk6,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk7,obFrame(a0)
		beq.s 	.bonk
		cmpi.b 	#fr_Bonk8,obFrame(a0)
		bne.s 	.continue

.bonk: 
		move.b  #dac_sfx_Bonk,d0  ; load sfx
        jsr     MegaPCM_PlaySample  ; play it		

.continue:
		move.w	flashtime(a0),d0
		beq.s	.display
		subq.w	#1,flashtime(a0)
		lsr.w	#3,d0
		bcc.s	.chkinvincible

.display:
		jsr	(DisplaySprite).l

.chkinvincible:
		tst.b	(v_invinc).w	; does player have invincibility?
		beq.s	.chkshoes	; if not, branch
		tst.w	invtime(a0)	; check	time remaining for invinciblity
		beq.s	.chkshoes	; if no	time remains, branch
		subq.w	#1,invtime(a0)	; subtract 1 from time
		bne.s	.chkshoes
		tst.b	(f_lockscreen).w
		bne.s	.removeinvincible
		cmpi.w	#$C,(v_air).w
		bcs.s	.removeinvincible
		moveq	#0,d0
		move.b	(v_zone).w,d0
		cmpi.w	#(id_LZ<<8)+3,(v_zone).w ; check if level is SBZ3
		bne.s	.music
		moveq	#5,d0		; play SBZ music

.music:
		lea	(MusicList2).l,a1
		move.b	(a1,d0.w),d0
		jsr	(PlaySound).l	; play normal music

.removeinvincible:
		move.b	#0,(v_invinc).w ; cancel invincibility

.chkshoes:
		tst.b	(v_shoes).w	; does player have speed shoes?
		beq.s	.exit
		tst.w	shoetime(a0)	; check	time remaining
		beq.s	.exit
		subq.w	#1,shoetime(a0)	; subtract 1 from time
		bne.s	.exit
		move.w	#$600,(v_sonspeedmax).w ; restore player's speed
		move.w	#$C,(v_sonspeedacc).w ; restore player's acceleration
		move.w	#$80,(v_sonspeeddec).w ; restore player's deceleration
		move.b	#0,(v_shoes).w	; cancel speed shoes
		move.w	#bgm_Slowdown,d0
		jmp	(PlaySound).l	; run music at normal speed

.exit:
		rts	