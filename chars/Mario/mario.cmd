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
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
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
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
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
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[command]
name = "qcf2_p"
command = ~D,DF,F,D,DF,F,x
time = 30
[command]
name = "qcf2_p"
command = ~D,F,D,F,x
time = 30
[command]
name = "qcf2_p"
command = ~D,DF,F,D,DF,F,y
time = 30
[command]
name = "qcf2_p"
command = ~D,F,D,F,y
time = 30
[command]
name = "qcf2_p"
command = ~D,DF,F,D,DF,F,z
time = 30
[command]
name = "qcf2_p"
command = ~D,F,D,F,z
time = 30

[command]
name = "qcf2_pex"
command = ~D,DF,F,D,DF,F,x+y
time = 30
[command]
name = "qcf2_pex"
command = ~D,F,D,F,x+y
time = 30
[command]
name = "qcf2_pex"
command = ~D,DF,F,D,DF,F,y+z
time = 30
[command]
name = "qcf2_pex"
command = ~D,F,D,F,y+z
time = 30
[command]
name = "qcf2_pex"
command = ~D,DF,F,D,DF,F,z+x
time = 30
[command]
name = "qcf2_pex"
command = ~D,F,D,F,z+x
time = 30


[command]
name = "qcf2_k"
command = ~D,DF,F,D,DF,F,a
time = 30
[command]
name = "qcf2_k"
command = ~D,F,D,F,a
time = 30
[command]
name = "qcf2_k"
command = ~D,DF,F,D,DF,F,b
time = 30
[command]
name = "qcf2_k"
command = ~D,F,D,F,b
time = 30
[command]
name = "qcf2_k"
command = ~D,DF,F,D,DF,F,c
time = 30
[command]
name = "qcf2_k"
command = ~D,F,D,F,c
time = 30

[command]
name = "qcb2_k"
command = ~D,DB,B,D,DB,B,a
time = 30
[command]
name = "qcb2_k"
command = ~D,B,D,B,a
time = 30
[command]
name = "qcb2_k"
command = ~D,DB,B,D,DB,B,b
time = 30
[command]
name = "qcb2_k"
command = ~D,B,D,B,b
time = 30
[command]
name = "qcb2_k"
command = ~D,DB,B,D,DB,B,c
time = 30
[command]
name = "qcb2_k"
command = ~D,B,D,B,c
time = 30

;-| Special Motions |------------------------------------------------------
[command]
name = "dpf_x"
command = ~F,D,DF,x
time = 15
[command]
name = "dpf_x"
command = ~F,D,F,x
time = 15

[command]
name = "dpf_y"
command = ~F,D,DF,y
time = 15
[command]
name = "dpf_y"
command = ~F,D,F,y
time = 15

[command]
name = "dpf_z"
command = ~F,D,DF,z
time = 15
[command]
name = "dpf_z"
command = ~F,D,F,z
time = 15

[command]
name = "dpf_2p"
command = ~F,D,DF,x+y
time = 15
[command]
name = "dpf_2p"
command = ~F,D,F,x+y
time = 15
[command]
name = "dpf_2p"
command = ~F,D,DF,y+z
time = 15
[command]
name = "dpf_2p"
command = ~F,D,F,y+z
time = 15

[command]
name = "qcf_a"
command = ~D,DF,F,a
time = 15
[command]
name = "qcf_a"
command = ~D,F,a
time = 15

[command]
name = "qcf_b"
command = ~D,DF,F,b
time = 15
[command]
name = "qcf_b"
command = ~D,F,b
time = 15

[command]
name = "qcf_c"
command = ~D,DF,F,c
time = 15
[command]
name = "qcf_c"
command = ~D,F,c
time = 15

[command]
name = "qcf_2k"
command = ~D,DF,F,a+b
time = 15
[command]
name = "qcf_2k"
command = ~D,F,a+b
time = 15
[command]
name = "qcf_2k"
command = ~D,DF,F,b+c
time = 15
[command]
name = "qcf_2k"
command = ~D,F,b+c
time = 15

[command]
name = "qcf_x"
command = ~D,DF,F,x
time = 15
[command]
name = "qcf_x"
command = ~D,F,x
time = 15

[command]
name = "qcf_y"
command = ~D,DF,F,y
time = 15
[command]
name = "qcf_y"
command = ~D,F,y
time = 15

[command]
name = "qcf_z"
command = ~D,DF,F,z
time = 15
[command]
name = "qcf_z"
command = ~D,F,z
time = 15

[command]
name = "qcf_2p"
command = ~D,DF,F,x+y
time = 15
[command]
name = "qcf_2p"
command = ~D,DF,F,y+z
time = 15
[command]
name = "qcf_2p"
command = ~D,F,x+y
time = 15
[command]
name = "qcf_2p"
command = ~D,F,y+z
time = 15

[command]
name = "qcb_x"
command = ~D,DB,B,x
time = 15
[command]
name = "qcb_x"
command = ~D,B,x
time = 15

[command]
name = "qcb_y"
command = ~D,DB,B,y
time = 15
[command]
name = "qcb_y"
command = ~D,B,y
time = 15

[command]
name = "qcb_z"
command = ~D,DB,B,z
time = 15
[command]
name = "qcb_z"
command = ~D,B,z
time = 15

[command]
name = "qcb_2p"
command = ~D,DB,B,x+y
time = 15
[command]
name = "qcb_2p"
command = ~D,B,x+y
time = 15
[command]
name = "qcb_2p"
command = ~D,DB,B,y+z
time = 15
[command]
name = "qcb_2p"
command = ~D,B,y+z
time = 15


[command]
name = "qcb_a"
command = ~D,DB,B,a
time = 15
[command]
name = "qcb_a"
command = ~D,B,a
time = 15

[command]
name = "qcb_b"
command = ~D,DB,B,b
time = 15
[command]
name = "qcb_b"
command = ~D,B,b
time = 15

[command]
name = "qcb_c"
command = ~D,DB,B,c
time = 15
[command]
name = "qcb_c"
command = ~D,B,c
time = 15

[command]
name = "qcb_2k"
command = ~D,DB,B,a+b
time = 15
[command]
name = "qcb_2k"
command = ~D,B,a+b
time = 15
[command]
name = "qcb_2k"
command = ~D,DB,B,b+c
time = 15
[command]
name = "qcb_2k"
command = ~D,B,b+c
time = 15

[command]
name = "Counter_P"
command = ~B,DB,D,x
time = 15
[command]
name = "Counter_P"
command = ~B,D,x
time = 15
[command]
name = "Counter_P"
command = ~B,DB,D,y
time = 15
[command]
name = "Counter_P"
command = ~B,D,y
time = 15
[command]
name = "Counter_P"
command = ~B,DB,D,z
time = 15
[command]
name = "Counter_P"
command = ~B,D,z
time = 15

[command]
name = "Counter_K"
command = ~B,DB,D,a
time = 15
[command]
name = "Counter_K"
command = ~B,D,a
time = 15
[command]
name = "Counter_K"
command = ~B,DB,D,b
time = 15
[command]
name = "Counter_K"
command = ~B,D,b
time = 15
[command]
name = "Counter_K"
command = ~B,DB,D,c
time = 15
[command]
name = "Counter_K"
command = ~B,D,c
time = 15

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[command]
name = "High Jump"
command = D,U
time = 10
[command]
name = "High Jump"
command = D,UF
time = 10
[command]
name = "High Jump"
command = D,UB
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "excelcombo"
command = c+z
time = 1

[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1
[command]
name = "recovery"
command = y+z
time = 1

[command]
name = "2k"
command = a+b
time = 1
[command]
name = "2k"
command = b+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------

[Command]
name = "fwd"
command = F
time = 1
[Command]
name = "back"
command = B
time = 1
[Command]
name = "up"
command = U
time = 1
[Command]
name = "down"
command = D
time = 1

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
name = "start"
command = s
time = 1

[Command]
name = "fwd"
command = F
time = 1
[Command]
name = "back"
command = B
time = 1
[Command]
name = "up"
command = U
time = 1
[Command]
name = "down"
command = D
time = 1

;-| Hold Dir |--------------------------------------------------------------
[command]
name = "holdb"
command = /b
time = 1

[command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
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





;===========================================================================
[State -1, Air Parry]
type = hitoverride
trigger1 = roundstate = 2 && statetype = A
trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
trigger1 = ctrl || stateno = 702
trigger1 = var(21) := 3
trigger1 = pos y != 0
attr = SA, AA, AP
stateno = 702
forceair = 1
slot = 0
time = 7

[State -1, Standing Parry]
type = hitoverride
trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
trigger1 = var(21) := 1
trigger1 = pos y = 0
attr = SA, AA, AP
stateno = 700
slot = 0
time = 8

[State -1, Crouching Parry]
type = hitoverride
trigger1 = roundstate = 2 && statetype != A
trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
trigger1 = var(21) := 2
trigger1 = pos y = 0
attr = C, AA, AP
stateno = 701
slot = 0
time = 8

[State -1, excelcombo]
type = changestate
value = 760
triggerall = command = "excelcombo"
triggerall = roundstate = 2 && power >= 1000 && !var(20)
trigger1 = ctrl || (stateno = [100,101])

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = stateno = 150 || stateno = 152
trigger1 = command = "Counter_P" || command = "Counter_K"
trigger1 = roundstate = 2 && !var(20) && power >= 1000 && statetype != A

[State -1, powercharge]
type = changestate
value = 740
trigger1 = !AIlevel
trigger1 = command = "holdb" && command = "holdy"
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = power < const(data.power) && power < powermax && !var(20)

[State -1, DivineJumpPunch]
type = changestate
value = 2000
triggerall = command = "qcb2_k"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000
triggerall = !var(20)
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = stateno = [1000,1030]
trigger4 = animelemno(0) >= 6
trigger5 = stateno = [1100,1230]
trigger5 = movecontact
trigger6 = stateno = 1030
trigger6 = time > 8
trigger7 = (stateno = 3000 || stateno = 3001) && movecontact
trigger8 = stateno = [1300,1303]
trigger8 = movecontact

[State -1, SuperJumpDestroyer]
type = changestate
value = 3105
triggerall = command = "qcf2_pex"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 2000
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = stateno = [1000,1030]
trigger4 = animelemno(0) >= 6
trigger5 = stateno = [1100,1230]
trigger5 = movecontact
trigger6 = stateno = 1030
trigger6 = time > 8
trigger7 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger8 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger9 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger9 = helper(stateno + 5), var(3)
trigger10 = stateno = [1300,1303]
trigger10 = movecontact

[State -1, SuperJumpDestroyer]
type = changestate
value = 3100
triggerall = command = "qcf2_p"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = stateno = [1000,1030]
trigger4 = animelemno(0) >= 6
trigger5 = stateno = [1100,1230]
trigger5 = movecontact
trigger6 = stateno = 1030
trigger6 = time > 8
trigger7 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger8 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger9 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger9 = helper(stateno + 5), var(3)
trigger10 = stateno = [1300,1303]
trigger10 = movecontact

[State -1, DivineJumpPunch]
type = changestate
value = 3010
triggerall = command = "qcf2_k"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 2000
triggerall = !var(20)
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = stateno = [1000,1030]
trigger4 = animelemno(0) >= 6
trigger5 = stateno = [1100,1230]
trigger5 = movecontact
trigger6 = stateno = 1030
trigger6 = time > 8
trigger7 = (stateno = 3000 || stateno = 3001) && movecontact
trigger8 = stateno = [1300,1303]
trigger8 = movecontact

[State -1, sjp]
type = changestate
value = 1230
triggerall = command = "dpf_2p"
triggerall = roundstate = 2 && statetype != A
triggerall = ifelse(!var(20), !numhelper(1000) && !numhelper(1025), 1) && !numhelper(1015) && !numhelper(1017) && !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
triggerall = power >= 500
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, sjp]
type = changestate
value = 1200
triggerall = command = "dpf_x"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, sjp]
type = changestate
value = 1210
triggerall = command = "dpf_y"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, sjp]
type = changestate
value = 1220
triggerall = command = "dpf_z"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, hammerex]
type = changestate
value = 1303
triggerall = command = "qcf_2k"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, hammer]
type = changestate
value = 1300
triggerall = command = "qcf_a"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, hammer]
type = changestate
value = 1301
triggerall = command = "qcf_b"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, hammer]
type = changestate
value = 1302
triggerall = command = "qcf_c"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, tornado]
type = changestate
value = 1100
triggerall = command = "qcb_x"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, tornado]
type = changestate
value = 1110
triggerall = command = "qcb_y"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[state -1, tornado]
type = changestate
value = 1120
triggerall = command = "qcb_z"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[State -1, lfireball]
type = changestate
value = 1030
triggerall = command = "qcf_2p"
triggerall = roundstate = 2 && statetype != A
triggerall = ifelse(!var(20), !numhelper(1000) && !numhelper(1025), 1) && !numhelper(1015) && !numhelper(1017) && !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
triggerall = power >= 500
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[State -1, lfireball]
type = changestate
value = 1000
triggerall = command = "qcf_x"
triggerall = roundstate = 2 && statetype != A
triggerall = ifelse(!var(20), !numhelper(1000) && !numhelper(1025), 1) && !numhelper(1015) && !numhelper(1017) && !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[State -1, lfireball]
type = changestate
value = 1010
triggerall = command = "qcf_y"
triggerall = roundstate = 2 && statetype != A
triggerall = ifelse(!var(20), !numhelper(1000) && !numhelper(1025), 1) && !numhelper(1015) && !numhelper(1017) && !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

[State -1, lfireball]
type = changestate
value = 1020
triggerall = command = "qcf_z"
triggerall = roundstate = 2 && statetype != A
triggerall = ifelse(!var(20), !numhelper(1000) && !numhelper(1025), 1) && !numhelper(1015) && !numhelper(1017) && !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 230 || stateno = 240
trigger2 = movecontact
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = movecontact
trigger4 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger6 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger6 = helper(stateno + 5), var(3)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[state -1, neudodge]
type = changestate
value = 710
trigger1 = command = "x" && command = "a" && command != "holdfwd" && command != "holdback"
trigger1 = statetype = S
trigger1 = ctrl

[state -1, fwdroll]
type = changestate
value = 711
trigger1 = command = "x" && command = "a" && command = "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl

[state -1, backroll]
type = changestate
value = 712
trigger1 = command = "x" && command = "a" && command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl

[state -1, taunt]
type = changestate
value = 195
triggerall = command = "start"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,450]
trigger2 = movecontact

[State -1, throw forward]
type = changestate
value = 800
trigger1 = command = "recovery" && command = "holdfwd"
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100

[State -1, throw backward]
type = changestate
value = 801
trigger1 = command = "recovery" && command = "holdback"
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100

[State -1, throw forward]
type = changestate
value = 802
trigger1 = command = "2k" && command = "holdfwd"
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100

[State -1, throw backward]
type = changestate
value = 803
trigger1 = command = "2k" && command = "holdback"
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100

[state -1, slp]
type = changestate
value = 200
triggerall = statetype != A && command != "holddown"
triggerall = command = "x"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = (stateno = 200 || stateno = 400 && time >= 5) || (stateno = 230 || stateno = 430 && time >= 12)
trigger3 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[state -1, smp]
type = changestate
value = 210
triggerall = statetype != A && command != "holddown"
triggerall = command = "y"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = stateno = 200 && movecontact

[state -1, shp]
type = changestate
value = 220
triggerall = statetype != A && command != "holddown"
triggerall = command = "z"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[state -1, slk]
type = changestate
value = 230
triggerall = statetype != A && command != "holddown"
triggerall = command = "a"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = (stateno = 200 || stateno = 400 && time >= 5) || (stateno = 230 || stateno = 430 && time >= 12)
trigger3 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[state -1, smk]
type = changestate
value = 240
triggerall = statetype != A && command != "holddown"
triggerall = command = "b"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[state -1, shk]
type = changestate
value = 250
triggerall = statetype != A && command != "holddown"
triggerall = command = "c"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)
trigger5 = stateno = 210 && movecontact

[state -1, clp]
type = changestate
value = 400
triggerall = statetype != A && command = "holddown"
triggerall = command = "x"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = (stateno = 200 || stateno = 400 && time >= 5) || (stateno = 230 || stateno = 430 && time >= 12)
trigger3 = var(20) && (stateno = [200, 600]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[state -1, cmp]
type = changestate
value = 410
triggerall = statetype != A && command = "holddown"
triggerall = command = "y"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 450]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[state -1, chp]
type = changestate
value = 420
triggerall = statetype != A && command = "holddown"
triggerall = command = "z"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[state -1, clk]
type = changestate
value = 430
triggerall = statetype != A && command = "holddown"
triggerall = command = "a"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = (stateno = 200 || stateno = 400 && time >= 5) || (stateno = 230 || stateno = 430 && time >= 12)
trigger3 = var(20) && (stateno = [200, 450]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger5 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(3)

[state -1, cmk]
type = changestate
value = 440
triggerall = statetype != A && command = "holddown"
triggerall = command = "b"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 450]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[state -1, shk]
type = changestate
value = 450
triggerall = statetype != A && command = "holddown"
triggerall = command = "c"
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 450]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, ALP]
type = changestate
value = 600
triggerall = command = "x" && statetype = A
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, AMP]
type = changestate
value = 610
triggerall = command = "y" && statetype = A
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, AHP]
type = changestate
value = 620
triggerall = command = "z" && statetype = A
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, ALK]
type = changestate
value = 630
triggerall = command = "a" && statetype = A
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, DrillKick]
type = changestate
value = 645
triggerall = command = "holddown" && command = "b" && statetype = A && vel y > 0
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, AMK]
type = changestate
value = 640
triggerall = command = "b" && statetype = A
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, AHK]
type = changestate
value = 650
triggerall = command = "c" && statetype = A
trigger1 = ctrl || stateno = 100 || stateno = 101
trigger2 = var(20) && (stateno = [200, 650]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && statetype != A && numhelper(stateno + 5)
trigger4 = helper(stateno + 5), var(3)

[State -1, super jump ]
type = ChangeState
value = 703
trigger1 = command = "High Jump"
trigger1 = ctrl ; these means that you can make the move when you control the char
trigger1 = statetype != A ; these is to make that you cant use the superjump while you are in the air
trigger2 = stateno = 100 && command = "holdup"

