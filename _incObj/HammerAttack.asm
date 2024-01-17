;  =========================================================================
;   rocketsailor's note: 
;   This script contains double jump code written by "EB".
;   The original code is from an SSRG forum thread.
;   The subroutine below has been modified by me.
;  =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerAttack:
	cmpi.b	#id_Roll,obAnim(a0) ; is Sonic rolling/jumping?
        bne.s    .return                ; (EB) if not, branch
        btst    #7,$22(a0)        ; (EB) read if DoubleJump flag was set
        bne.s    .return                ; (EB) was it set? if not, branch
	move.b	(v_jpadpress2).w,d0
	andi.b	#btnABC,d0	           ; is A, B or C pressed?
        beq.w    .return                ; (EB) if not, branch
        bset    #7,$22(a0)        ; (EB) set DoubleJump flag
;        move.w    #sfx_AB,d0           
;        jsr    (PlaySound_Special).l
	move.b	#$B,obHeight(a0)
	move.b	#7,obWidth(a0)
	move.b	#id_HammerAttack,obAnim(a0) ; use hammer attack animation
        bset	#2,obStatus(a0)

.return:
        rts                             ; EB: return