;  =========================================================================
;   rocketsailor's note: 
;   This script makes the player bounce if either bounce flag is set. 
;   The bounce flags allow the player to bounce off an object after
;   the hammer hitbox detroys said object.
;  =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerBounceCheck: 
        tst.b	(f_hammerbounce).w	; is bounce flag set?
        beq.s   HammerBounceCheck2  ; if not, branch
        tst.w	obVelY(a0)
		bmi.s	BounceCheckEnd
		neg.w	obVelY(a0)    ; badnik & monitor bounce

BounceCheckEnd:        
        clr.b	(f_hammerbounce).w ; clear bounce flag
		rts	

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerBounceCheck2: 
        tst.b	(f_hammerbounce2).w	; is bounce flag set?
        beq.s   BounceCheck2End  ; if not, branch
		neg.w	obVelX(a0)  ; boss bounce
		neg.w	obVelY(a0)
        asr	    obVelX(a0)
		asr	    obVelY(a0)
        
BounceCheck2End:     
        clr.b	(f_hammerbounce2).w ; clear bounce flag
        rts