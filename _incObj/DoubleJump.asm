;  =========================================================================
;   rocketsailor's note: 
;   This script contains double jump code written by "EB".
;   The original code is from an SSRG forum thread.
;   The subroutine below has been heavily modified by me.
;  =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

DoubleJump:
        btst    #2,obStatus(a0)         ; is player jumping?
        beq.s   DoubleJumpEnd           ; if not, branch
        btst    #7,$22(a0)        ; (EB) read if DoubleJump flag was set
        bne.s   DoubleJumpEnd                ; (EB) was it set? if not, branch
	move.b	(v_jpadpress2).w,d0
	andi.b	#btnABC,d0	           ; is A, B or C pressed?
        beq.w   DoubleJumpEnd                ; (EB) if not, branch
        bset    #7,$22(a0)        ; (EB) set DoubleJump flag
        move.w	#sfx_Jump,d0           
        jsr    (PlaySound_Special).l
        move.w  #-$580,obVelY(A0)         ; bounce up
        btst	#6,obStatus(a0) 	; is player underwater?
	beq.s	DoubleJumpPart2 	; if not, branch
	move.w  #-$290,obVelY(A0) 	; Underwater-specific value
        
DoubleJumpPart2:
	move.b	#$B,obHeight(a0)
	move.b	#7,obWidth(a0)
	move.b	#id_HammerAttack2,obAnim(a0) ; use an alt copy of the animation to ensure a reset
        bset	#2,obStatus(a0)

DoubleJumpEnd:
        rts                             ; (EB) return