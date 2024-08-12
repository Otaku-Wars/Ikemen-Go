;#ADD004BASIC PIEs#
; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.













command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------
[command]
name = "okay"
command = ~D,DF,F,a+b
time = 15

[command]
name = "okay again"
command = ~D,DB,B,a+b
time = 15

[command]
name = "qcbsuper"
command = ~D,DB,B,x+y
time = 15

[command]
name = "dpsuper"
command = ~F,D,DF,~z
time = 15

[command]
name = "qcfsuper"
command = ~D,DF,F,~z
time = 15

[command]
name = "rdpsuper"
command = ~D,DF,F,a+x
time = 15

[command]
name = "qcbsuper"
command = ~D,DB,B,z
time = 15

[command]
name = "dpsuper"
command = ~F,D,DF,z
time = 15

[command]
name = "qcfsuper"
command = ~D,DF,F,z
time = 15
;-| Special Motions |------------------------------------------------------
[Command]
name = "KF Palm"
command = ~D, DF, F, x
time = 15

[Command]
name = "KF Palm"
command = ~D, DF, F, ~x
time = 15

[Command]
name = "KF Palm2"
command = ~D, DF, F, y
time = 15

[Command]
name = "KF Palm2"
command = ~D, DF, F, ~y
time = 15

[Command]
name = "KF Palm3"
command = ~D, DF, F, z
time = 15

[Command]
name = "KF Palm3"
command = ~D, DF, F, ~z
time = 15

[Command]
name = "EX KF Palm"
command = ~F, D, DF, x+y
time = 15

[Command]
name = "EX KF Palm"
command = ~F, D, DF, y+z
time = 15

[Command]
name = "EX KF Palm"
command = ~F, D, DF, x+z
time = 15
;-| Special Motions |------------------------------------------------------
[command]
name = "ddk"
command = ~D,D,~b
time = 15

[command]
name = "ddk2"
command = ~D,D,~a
time = 15

[command]
name = "ddk"
command = ~D,D,b
time = 15

[command]
name = "ddk2"
command = ~D,D,a
time = 15

[command]
name = "qcfk"
command = ~D,DF,F,~b
time = 15

[command]
name = "qcfk2"
command = ~D,DF,F,~a
time = 15

[command]
name = "qcfk"
command = ~D,DF,F,b
time = 15

[command]
name = "qcfk2"
command = ~D,DF,F,a
time = 15

[command]
name = "qcbk"
command = ~F,D,B,~b
time = 15

[command]
name = "qcbk"
command = ~F,D,B,a+b
time = 15

[command]
name = "rdp"
command = ~B,D,DB,~y
time = 15

[command]
name = "rdp2"
command = ~B,D,DB,~x
time = 15

[command]
name = "rdp"
command = ~B,D,DB,y
time = 15

[command]
name = "rdp2"
command = ~B,D,DB,x
time = 15

[command]
name = "dpk"
command = ~F,D,DF,b
time = 15

[command]
name = "dpk3"
command = ~F,D,DF,a+b
time = 15

[command]
name = "dpk2"
command = ~F,D,DF,a
time = 15

[command]
name = "dpk"
command = ~F,D,DF,b
time = 15

[command]
name = "dpk2"
command = ~F,D,DF,a
time = 15

[command]
name = "dp"
command = ~F,D,DF,x+y
time = 15

[command]
name = "dp2"
command = ~F,D,DF,y
time = 15

[command]
name = "dp"
command = ~F,D,DF,y
time = 15

[command]
name = "dp2"
command = ~F,D,DF,x
time = 15

[command]
name = "dp3"
command = ~F,D,DF,x+y
time = 15

[command]
name = "qcfpex"
command = ~D,DF,F,x+y
time = 15

[command]
name = "qcfp3"
command = ~D,DF,F,x
time = 15

[command]
name = "qcfp4"
command = ~D,DF,F,y
time = 15

[command]
name = "qcfp2"
command = ~D,DF,F,z
time = 15

[command]
name = "qcfp"
command = ~D,DF,F,z
time = 15

[command]
name = "qcfp2"
command = ~D,DF,F,y+z
time = 15

[command]
name = "ring throw"
command = ~D,DF,F,a
time = 15

[command]
name = "ring throw"
command = ~D,DF,F,b
time = 15

[command]
name = "ddp"
command = ~D,D,y
time = 15
[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, x
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, y
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, z
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, ~x
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, ~y
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, ~z
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, a
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, b
time = 16

[Command]
name=  "412k" ;Zero Counter
command = ~B, DB, D, c
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, ~a
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, ~b
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, ~c
time = 16
;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+x
time = 1

[Command]
name = "pp"
command = x+y
time = 1

[Command]
name = "pp"
command = x+z
time = 1

[Command]
name = "pp"
command = y+z
time = 1

[Command]
name = "kk"
command = a+b
time = 1

[Command]
name = "kk"
command = a+c
time = 1

[Command]
name = "kk"
command = b+c
time = 1

[Command]
name = "a+x"
command = a+x
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;---------------------------------------------------------------------------
;Release Direction
[Command]
name = "rlsfwd"
command = ~$F
time = 1

[Command]
name = "rlsback"
command = ~$B
time = 1

[Command]
name = "rlsup"
command = ~$U
time = 1

[Command]
name = "rlsdown"
command = ~$D
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;##[a4b_-1_start.v20200523]##
;//==========================
;// add004-1-sctrls-start
;//==========================
;--- partner_standby
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	trigger1=ctrl && numpartner && !ishelper && roundstate=2 && pos y=0
	trigger1=(sysfvar(4)>0) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(22)=4)
	ignorehitpause=1
;##Add.List01##
;//==========================
;// add004-1-sctrls-end
;//==========================
;##[a4b_-1_end]##




;supersonic
[State -1, supersonic]
type = ChangeState
value = 3200
triggerall = command = "rdpsuper"
triggerall = numhelper(7040) = 0
triggerall = power >= 3000
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 1400 && movecontact
trigger10 = stateno = 1410 && movecontact
trigger11 = stateno = 1420 && movecontact
trigger12 = stateno = 1450 && movecontact
trigger13 = stateno = 1451 && movecontact
trigger14 = stateno = 1452 && movecontact
trigger15 = (statetype = A) && ctrl
trigger16 = stateno = 1110 && movecontact
trigger17 = stateno = 1100 && movecontact
trigger18 = stateno = 600 && movecontact
trigger19 = stateno = 610 && movecontact
trigger20 = stateno = 630 && movecontact
trigger21 = stateno = 1600 && movecontact
trigger22 = stateno = 1620 && movecontact
trigger23 = stateno = 1621 && movecontact

;tornado
[State -1, tornado]
type = ChangeState
value = 3300
triggerall = command = "dpsuper"
triggerall = numhelper(7040) = 0
triggerall = power >= 1000
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 1400 && movecontact
trigger10 = stateno = 1410 && movecontact
trigger11 = stateno = 1420 && movecontact
trigger12 = stateno = 1450 && movecontact
trigger13 = stateno = 1451 && movecontact
trigger14 = stateno = 1452 && movecontact

;tails
[State -1, tails]
type = ChangeState
value = 3100
triggerall = command = "okay"
triggerall = numhelper(7040) = 0
triggerall = power >= 1000
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact


[State -1, spinball]
type = ChangeState
value = 3000
triggerall = command = "okay again"
triggerall = power >= 1000
triggerall = numhelper(7050) != 0
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;shieldsuper3
[State -1, shieldsuper]
type = ChangeState
value = 3520
triggerall = command = "qcfsuper"
triggerall = power >= 1000
triggerall = numhelper(7007) != 0
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 1400 && movecontact
trigger10 = stateno = 1410 && movecontact
trigger11 = stateno = 1420 && movecontact
trigger12 = stateno = 1450 && movecontact
trigger13 = stateno = 1451 && movecontact
trigger14 = stateno = 1452 && movecontact

;shieldsuper2
[State -1, shieldsuper]
type = ChangeState
value = 3510
triggerall = command = "qcfsuper"
triggerall = power >= 1000
triggerall = numhelper(7010) != 0
trigger1 = (statetype != A) && ctrl
trigger2 = (statetype = A) && ctrl
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 411 && movecontact
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 600 && movecontact
trigger11 = stateno = 610 && movecontact
trigger12 = stateno = 630 && movecontact
trigger13 = stateno = 1110 && movecontact
trigger14 = stateno = 1100 && movecontact
trigger15 = stateno = 1400 && movecontact
trigger16 = stateno = 1410 && movecontact
trigger17 = stateno = 1420 && movecontact
trigger18 = stateno = 1450 && movecontact
trigger19 = stateno = 1451 && movecontact
trigger20 = stateno = 1452 && movecontact
trigger21 = stateno = 1600 && movecontact
trigger22 = stateno = 1620 && movecontact
trigger23 = stateno = 1621 && movecontact

;shieldsuper
[State -1, shieldsuper]
type = ChangeState
value = 3500
triggerall = command = "qcfsuper"
triggerall = power >= 1000
triggerall = numhelper(7009) != 0
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 1400 && movecontact
trigger10 = stateno = 1410 && movecontact
trigger11 = stateno = 1420 && movecontact
trigger12 = stateno = 1450 && movecontact
trigger13 = stateno = 1451 && movecontact
trigger14 = stateno = 1452 && movecontact

;speeddash
[State -1, speeddash]
type = ChangeState
value = 1300
triggerall = command = "qcbk"
triggerall = p2stateno != [13571,13572]
trigger1 = (statetype != A) && ctrl

;[State 0, DefenceMulSet]
;type = DefenceMulSet
;trigger1 = 
;value = 1
;ignorehitpause = 
;persistent = 

;spinball
[State -1, spinball]
type = ChangeState
value = 12553
triggerall = command = "qcbsuper"
triggerall = numhelper(7040) = 0
triggerall = power >= 1000
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 1400 && movecontact
trigger10 = stateno = 1410 && movecontact
trigger11 = stateno = 1420 && movecontact
trigger12 = stateno = 1450 && movecontact
trigger13 = stateno = 1451 && movecontact
trigger14 = stateno = 1452 && movecontact

;airjump
[State -1, airjump]
type = ChangeState
value = 45
triggerall = command = "up"
triggerall = numhelper(7009) != 0
triggerall = pos y <= -40
triggerall = var(24) = 0
trigger1 = (statetype = A) && ctrl

;bounce
[State -1, bounce]
type = ChangeState
value = 1610
triggerall = command = "qcfk" || command = "qcfk2"
triggerall = numhelper(7008) != 0
triggerall = pos y <= -60
triggerall = var(41) < 3
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 1611 && time > 10
trigger3 = stateno = 600 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact

;dash
[State -1, dash]
type = ChangeState
value = 1600
triggerall = command = "qcfk" || command = "qcfk2"
triggerall = numhelper(7010) != 0
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact

;item
[State -1, item]
type = ChangeState
value = 1360
triggerall = command = "ring throw"
triggerall = var(22) = 0
trigger1 = (statetype != A) && ctrl

;airspin4
[State -1, airspin4]
type = ChangeState
value = 1002
triggerall = command = "qcfpex"
triggerall = pos y <= -50
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact

;airspin4
[State -1, airspin4]
type = ChangeState
value = 1003
triggerall = command = "qcfp3"
triggerall = pos y <= -50
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact


;airspin4
[State -1, airspin4]
type = ChangeState
value = 1003
triggerall = command = "qcfp"
triggerall = pos y <= -50
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact

;airspin3
[State -1, airspin3]
type = ChangeState
value = 1003
triggerall = command = "qcfp2"
triggerall = pos y <= -50
trigger1 = (statetype = A) && ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact

;airspin2
[State -1, airspin2]
type = ChangeState
value = 1000
triggerall = command = "dp3"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;airspin1
[State -1, airspin1]
type = ChangeState
value = 1001
triggerall = command = "dp"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;airspin1
[State -1, airspin1]
type = ChangeState
value = 1001
triggerall = command = "dp2"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;aaspin2
[State -1, airspin2]
type = ChangeState
value = 1100
triggerall = command = "dpk3"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;aaspin
[State -1, airspin]
type = ChangeState
value = 1110
triggerall = command = "dpk"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;aaspin2
[State -1, airspin2]
type = ChangeState
value = 1110
triggerall = command = "dpk2"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;arch2
[State -1, arch2]
type = ChangeState
value = 1621
triggerall = command = "qcfk"
triggerall = numhelper(7009) != 0
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;arch
[State -1, arch]
type = ChangeState
value = 1620
triggerall = command = "qcfk2"
triggerall = numhelper(7009) != 0
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;spindash2
[State -1, spindash2]
type = ChangeState
value = 1450
triggerall = command = "qcfp3"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;spindash2
[State -1, spindash2]
type = ChangeState
value = 1450
triggerall = command = "qcfp4"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

;spindash2
[State -1, spindash2]
type = ChangeState
value = 1400
triggerall = command = "qcfp2"
trigger1 = (statetype != A) && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 411 && movecontact
trigger8 = stateno = 430 && movecontact

[State -1, EX KF Palm]
type = ChangeState
value = 4552
triggerall = command = "EX KF Palm"
triggerall = RoundState = 2 && StateType != A
triggerall = ifelse(var(20) <= 0, power >= 500, power >= 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(5)

;launch
[State -1, upfwd]
Type = changestate
value = 40000
triggerall = command = "upfwd" || command = "up"
triggerall = var(59) = 0
trigger1 = (StateNo = 440)
trigger1 = movehit

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1, Roll Forward]
type = ChangeState
value = 710
triggerall = command = "a+x"
triggerall = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdfwd"

[State -1, Roll Back]
type = ChangeState
value = 715
triggerall = command = "a+x"
triggerall = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdback"

[State -1, Dodge]
type = ChangeState
value = 700
triggerall = command = "a+x"
triggerall = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))

;throw
[state -1, throw]
Type = changestate
value = 800
trigger1 = (command = "holdfwd" || command = "holdback") && command = "pp" 
trigger1 = (statetype != a) && ctrl

[State -1, Power Charge]
type = ChangeState
value = 730
trigger1 = command = "hold_b" && command = "hold_y"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20)
trigger1 = ctrl || (StateNo = [100,101])

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerall = command = "c+z"
triggerall = RoundState = 2 && StateType != A
triggerall = var(20) <= 0 && Power >= 1000
trigger1 = ctrl || (Stateno = [100,101])

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Air Dash
[State -1, Air Dash]
type = ChangeState
value = 110
triggerall = pos y <= -35
triggerall = stateno != 111
triggerall = stateno != 113
trigger1 = command = "FF"
trigger1 = statetype = a
trigger1 = ctrl

; Air Dash B
[State -1, Air Dash B]
type = ChangeState
value = 112
triggerall = pos y <= -35
triggerall = stateno != 111
triggerall = stateno != 113
trigger1 = command = "BB"
trigger1 = statetype = a
trigger1 = ctrl

; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------


;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 200 && time >= 6

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 205 && movecontact
trigger7 = stateno = 235 && movecontact
trigger8 = stateno = 245 && movecontact

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])

;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 400 && time >= 6

;---------------------------------------------------------------------------
; Crouching Strong Punch 2
[State -1, Crouching Strong Punch 2]
type = ChangeState
value = 411
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = (stateno=[100,101])

;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 430 && time >= 8

;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl || (stateno=[100,101])
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 240 && movecontact
trigger8 = stateno = 210 && movecontact
trigger9 = stateno = 211 && movecontact
trigger10 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
;Jump Strong Punch 2
[State -1, Jump Strong Punch 2]
type = ChangeState
value = 620
triggerall = command = "y" && command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact
trigger4 = stateno = 610 && movecontact

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact
trigger4 = stateno = 610 && movecontact

;---------------------------------------------------------------------------

