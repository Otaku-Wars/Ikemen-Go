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

;~$B, $D, $F, $U, $B, $D, $F, x+y
;~$D, $F, $U, $B, $D, $F, $U, x+y
;~$F, $U, $B, $D, $F, $U, $B, x+y
;~$U, $B, $D, $F, $U, $B, $D, x+y

[Command]
name = "Great Boss Toad"
command = c+z

[Command]
name = "Grab"
command = x+a

[Command]
name = "Windmill of Shadows"
command = ~D, DF, F, x+y

[Command]
name = "Windmill of Shadows"
command = ~D, DF, F, x+z

[Command]
name = "Windmill of Shadows"
command = ~D, DF, F, z+y

[Command]
name = "Naruto Barrage"
command = ~D, DF, F, a+b

[Command]
name = "Naruto Barrage"
command = ~D, DF, F, a+c

[Command]
name = "Naruto Barrage"
command = ~D, DF, F, b+c


[Command]
name = "Sexy Jutsu"
command = ~D, DB, B, a+b

[Command]
name = "Sexy Jutsu"
command = ~D, DB, B, a+c

[Command]
name = "Sexy Jutsu"
command = ~D, DB, B, b+c

[Command]
name = "Rasengan"
command = ~D, DB, B, x+y

[Command]
name = "Rasengan"
command = ~D, DB, B, x+z

[Command]
name = "Rasengan"
command = ~D, DB, B, z+y

;-| Special Motions |------------------------------------------------------

[Command]
name = "Flip Kick (c)"
command = ~D, DB, B, c

[Command]
name = "Flip Kick (b)"
command = ~D, DB, B, b

[Command]
name = "Flip Kick (a)"
command = ~D, DB, B, a

[Command]
name = "Dash Slash (z)"
command = ~D, DB, B, z

[Command]
name = "Dash Slash (y)"
command = ~D, DB, B, y

[Command]
name = "Dash Slash (x)"
command = ~D, DB, B, x

[Command]
name = "Ninja Tool Throw (x)"
command = ~D, DF, F, x

[Command]
name = "Ninja Tool Throw (y)"
command = ~D, DF, F, y

[Command]
name = "Ninja Tool Throw (z)"
command = ~D, DF, F, z

[Command]
name = "Slashing Upper z"
command = ~F, D, DF, z

[Command]
name = "Slashing Upper y"
command = ~F, D, DF, y

[Command]
name = "Slashing Upper x"
command = ~F, D, DF, x

;---------------------------------------------------------------------------

[Command]
name = "superjump"     ;Required (do not remove)
command = ~D, U
time = 5

[Command]
name = "superjumpforward"     ;Required (do not remove)
command = ~D, UF
time = 5

[Command]
name = "superjumpbackward"     ;Required (do not remove)
command = ~D, UB
time = 5

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
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "Chakra Recovery" ;Required (do not remove)
command = b+y
time = 1

;[Command]
;name = "recovery"
;command = y+z
;time = 1

;[Command]
;name = "recovery"
;command = x+z
;time = 1

;[Command]
;name = "recovery"
;command = a+b
;time = 1

;[Command]
;name = "recovery"
;command = b+c
;time = 1

;[Command]
;name = "recovery"
;command = a+c
;time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdy"
command = /y
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
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
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
;==================================================================================
;==================================================================================
;==================================================================================


;===========================================================================
;======= AI Commands ========================================================
;===========================================================================
;---------------------------------------------------------------------------
;======= Constant Commands ========================================================

[State -1, AI Guard]
type = ChangeState
value = ifelse(StateType != A && (enemynear,HitDefAttr = SA,AA,AT,AP),130,ifelse(StateType = A,132,131))
;triggerall = var(50) != 0 ; A.I Level
triggerall = RoundState = 2
triggerall = stateno != 40 && stateno != 102 && stateno != 107
triggerall = stateno != [120,155]
triggerall = Stateno != [3000,4000]
triggerall = stateno != [6650,6652]
triggerall = Stateno != [5000,7999]
triggerall = AILevel >= 5
trigger1 = ctrl && inguarddist

[State -1, AI Run]
type = ChangeState
value = 100
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 5
;triggerall = var(50) = [2,3] ; A.I Level
triggerall = statetype != A
triggerall = p2bodyDist X >= 19
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = stateno != [6650,6652]
triggerall = Stateno != [100,5999]
triggerall = stateno != [120,155]
trigger1 = random <= 300
trigger2 = AIlevel = 7 && p2bodyDist X <= 50

;=============================================================================
;=============================================================================
;======= Super Commands ========================================================


[State -1, AI Rasengan]
type = ChangeState
value = 2999
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 4
triggerall = statetype != A
triggerall = Stateno != [5000,5999]
triggerall = Stateno != [2999,4000]
triggerall = stateno != [120,155]
triggerall = Stateno != [200,2998]
triggerall = stateno != 100
triggerall = power >= 1000
triggerall = NumHelper(3004) = 0
trigger1 = AIlevel = 4
trigger1 = Random = [0,199]
trigger2 = P2BodyDist X <= 80 && AIlevel = [5,6]
trigger3 = AIlevel >= 7 && P2Stateno = [4000,4200]

[State -1, AI Windmill of Shadows]
type = ChangeState
value = 3200
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 7
triggerall = statetype != A
triggerall = Stateno != [5000,5999]
triggerall = Stateno != [2999,4000]
triggerall = stateno != [120,155]
triggerall = Stateno != [1000,2998]
triggerall = stateno != 100
triggerall = power >= 1000
triggerall = NumHelper(3202) = 0
trigger1 = AIlevel = 7 && random >= 500 && P2BodyDist X >= 31
trigger2 = AIlevel = 8 && random >= 300 && P2BodyDist X >= 31

[State -1, AI Sexy Jutsu]
type = ChangeState
value = 3099
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 5
triggerall = statetype != A
triggerall = Stateno != [5000,5999]
triggerall = Stateno != [2999,4000]
triggerall = stateno != [120,155]
triggerall = Stateno != [1000,2998]
triggerall = stateno != 100
triggerall = power >= 1000
trigger1 = AIlevel = 5
trigger2 = AIlevel = 6 && P2BodyDist X <= 80 && Stateno != [200,4000]
trigger3 = AIlevel = 7 && P2BodyDist X >= 30 && P2Stateno != [4000,4200]
trigger4 = AIlevel = 8 && P2BodyDist X >= 30 && random <= 299 && var(21) <= 0 && P2Stateno != [4000,4200]

[State -1, AI Naruto Barrage]
type = ChangeState
value = 3299
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel = 2 || AIlevel >= 7
triggerall = Stateno != [2999,4000]
triggerall = Stateno != 8000
triggerall = stateno != [120,155]
triggerall = (StateType != A) && (StateType != L)
triggerall = Stateno != [5000,5999]
triggerall = stateno != 100
triggerall = P2StateType != A
triggerall = P2BodyDist X <= 22
triggerall = power >= 1000
trigger1 = AIlevel = 2 && Stateno != [200,4000]
trigger2 = AIlevel >= 7 && P2Stateno = [4000,4200]

;=============================================================================
;=============================================================================
;======= Special Commands ========================================================


[State -1, AI Moon Kick]
type = ChangeState
value = ifelse(p2bodyDist X >= 0 && p2bodyDist X <= 50,1400,ifelse(p2bodyDist X >= 51 && p2bodyDist X <= 80,1410,1420))
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = ctrl ; Prevents attack before each round even starts
Triggerall = AIlevel = 4 || AIlevel >= 6
triggerall = statetype != A
trigger1 = p2bodyDist X >= 30 && AIlevel = 4 && Random = [0,99]
trigger2 = p2statetype = A && AIlevel >= 6

[State -1, AI Dash Slash]
type = ChangeState
value = ifelse(p2bodyDist X >= 1 && p2bodyDist X <= 50,1200,ifelse(p2bodyDist X >= 51 && p2bodyDist X <= 100,1210,1220))
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 7
triggerall = Stateno != 8000
triggerall = Stateno != [1000,4000]
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = p2bodyDist X >= 51 && AIlevel = 7 && ctrl && Random = [0,499]
trigger2 = AIlevel = 8 && stateno = 420 && Movecontact && var(24) <= 0


[State -1, AI Ninja Tool Throw]
type = ChangeState
value = ifelse(statetype != A,1000,1030)
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 5
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = Stateno != [2999,4000]
triggerall = Stateno != [100,2998]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = NumHelper(1001) = 0
triggerall = statetype != A
trigger1 = AIlevel = 5 && p2bodyDist X >= 51 && random >= 500 && ctrl
trigger2 = AIlevel = 6 && p2bodyDist X >= 71 && random >= 500 && ctrl
trigger3 = AIlevel = 7 && p2bodyDist X >= 31 && random >= 500 && ctrl
trigger4 = AIlevel = 8 && p2bodyDist X >= 31 && random <= 200 && ctrl
trigger5 = AIlevel >= 7 && stateno = 650 && Movecontact

;=============================================================================
;=============================================================================
;======= Combo Commands ========================================================

[State -1, AI Stand Light Punch]
type = ChangeState
value = 200
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [0,99]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [100,299]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && p2statetype != A && AIlevel = 5
trigger4 = p2bodyDist X <= 18 && p2statetype = S && AIlevel = 6

[State -1, AI Stand Medium Punch]
type = ChangeState
value = 210
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 210
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = stateno != 100
triggerall = Stateno != 8000
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [100,199]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [100,199]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 200 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 200 && (movecontact) && p2statetype = S && AIlevel = 6


[State -1, AI Stand Hard Punch]
type = ChangeState
value = 220
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 220
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = stateno != 100
triggerall = Stateno != 8000
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [200,299]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [200,299]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 210 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 210 && (movecontact) && p2statetype = S && AIlevel = 6

[State -1, AI Stand Light Kick]
type = ChangeState
value = 230
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [300,399]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [300,399]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && p2statetype != A && AIlevel = 5
trigger4 = p2bodyDist X <= 25 && p2statetype = S && AIlevel = 6


[State -1, AI Stand Medium Kick]
type = ChangeState
value = 240
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 230
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = AIlevel = 3 && ctrl = 1 && Random = [400,499]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && ctrl = 1 && Random = [400,499]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 230 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 230 && (movecontact) && p2statetype = S && AIlevel = 6


[State -1, AI Stand Hard Kick]
type = ChangeState
value = 250
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 240
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = AIlevel = 3 && ctrl = 1 && Random = [500,599]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && ctrl = 1 && Random = [500,599]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 240 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 240 && (movecontact) && p2statetype = S && AIlevel = 6
trigger5 = (stateno = 410) && (movecontact) && AIlevel >= 7 && var(24) >= 1

[State -1, AI Crouch Light Punch]
type = ChangeState
value = 400
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [600,699]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [600,699]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && p2statetype != A && AIlevel = 5
trigger4 = p2statetype = C && AIlevel = 6


[State -1, AI Crouch Medium Punch]
type = ChangeState
value = 410
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 210
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = AIlevel = 3 && ctrl = 1 && Random = [700,799]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && ctrl = 1 && Random = [700,799]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 400 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 400 && (movecontact) && p2statetype = C && AIlevel = 6
trigger5 = stateno = 430 && (movecontact) && AIlevel >= 7

[State -1, AI Crouch Hard Punch]
type = ChangeState
value = 420
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 220
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = AIlevel = 3 && ctrl = 1 && Random = [800,899]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && ctrl = 1 && Random = [800,899]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 410 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 410 && (movecontact) && p2statetype = C && AIlevel = 6
trigger5 = (stateno = 410) && (movecontact) && AIlevel >= 7

[State -1, AI Crouch Light Kick]
type = ChangeState
value = 430
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [900,999]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [900,999]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && p2statetype != A && AIlevel = 5
trigger4 = p2statetype = C && AIlevel = 6
trigger5 = p2bodyDist X <= 25 && AIlevel >= 7


[State -1, AI Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 230
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [500,599]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [500,599]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 200 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 200 && (movecontact) && p2statetype = C && AIlevel = 6


[State -1, AI Crouch Hard Kick]
type = ChangeState
value = 450
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 3
triggerall = Stateno != 240
triggerall = Stateno != [5000,7999]
triggerall = stateno != [6650,6652]
triggerall = stateno != [120,155]
triggerall = Stateno != 8000
triggerall = stateno != 100
triggerall = statetype != A
trigger1 = AIlevel = 3 && Random = [400,499]
trigger1 = Stateno != [200,4000]
trigger2 = p2bodyDist X <= 25 && AIlevel = 4 && Random = [400,499]
trigger2 = Stateno != [200,4000]
trigger3 = p2bodyDist X <= 25 && stateno = 220 && (movecontact) && p2statetype != A && AIlevel = 5
trigger4 = stateno = 220 && (movecontact) && p2statetype = C && AIlevel = 6

; S.A.Punch
[State -1, A.I Jump Weak Kick]
type = ChangeState
value = 630
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 7
triggerall = StateType = A
triggerall = Stateno != [600,7999]
triggerall = stateno != [120,155]
trigger1 = p2statetype = A

; M.A.Punch
[State -1,A.I Jump Medium Kick]
type = ChangeState
value = 640
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 7
triggerall = StateType = A
trigger1 = (stateno = 630 && movecontact)

[State -1,A.I Jump Hard Kick]
type = ChangeState
value = 650
triggerall = roundstate = 2 ; Does Not Attack before each round
Triggerall = AIlevel >= 7
triggerall = StateType = A
trigger1 = (stateno = 640 && movecontact)

;---------------------------------------------------------------------------

[State -1, AI Throw]
type = ChangeState
value = 800
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = Stateno != [5000,7999]
Triggerall = AIlevel = [2,5]
triggerall = Stateno != 800
triggerall = stateno != 100
triggerall = Stateno != 8000
triggerall = (StateType != A) && (StateType != L)
triggerall = MoveType != H
triggerall = P2MoveType != A
triggerall = P2StateType != A
triggerall = P2BodyDist X <= 22
triggerall = P2BodyDist Y >= 0
trigger1 = AIlevel = 3 && Random = [300,399]
trigger1 = Stateno != [200,4000]
trigger2 = AIlevel = 4 && Random = [300,399]
trigger2 = Stateno != [200,4000]
trigger3 = Random >= 800 && AIlevel = 5 && Stateno != [200,4000]
trigger4 = AIlevel = 2 && Stateno != [200,4000]
trigger4 = Stateno != 8000

[State -1, AI Super Jump Forward]
type = ChangeState
value = 8000
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = Stateno != 8000
triggerall = Stateno != [5000,7999]
triggerall = statetype != A
trigger1 = (stateno = 250) && (movehit) && AIlevel >= 7

; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = Stateno != [100,7999]
Triggerall = AIlevel >= 7
triggerall = statetype != A
triggerall = p2movetype = A
triggerall = movetype != H
triggerall = power >= 1000
triggerall = life >= 101
triggerall = var(21) <= 0
trigger1 = Random >= 600 && AIlevel = 7
trigger2 = Random >= 800 && AIlevel = 8

[State -1, Floor Substitution Jutsu]
type = ChangeState
value = 1500
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = Stateno != [100,5099]
triggerall = Stateno != [5120,7999]
Triggerall = AIlevel >= 7
triggerall = statetype != A
triggerall = movetype = H
triggerall = power >= 500
triggerall = roundstate = 2
triggerall = stateno = 5110
trigger1 = Random >= 600 && AIlevel = 7
trigger2 = AIlevel = 8

[State -1, Nine-tailed Fox]
type = ChangeState
value = 3500
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = Stateno != [100,7999]
Triggerall = AIlevel >= 7
triggerall = var(21) <= 0 ; Nine Tailed Fox limiter is off
triggerall = statetype != A
triggerall = movetype != H
triggerall = life <= 100
triggerall = roundstate = 2
triggerall = alive = 1
trigger1 = Random >= 600 && AIlevel = 7
trigger2 = AIlevel = 8

[State -1,  Chakra Recovery]
type = ChangeState
value = 1300
triggerall = ctrl ; Prevents attack before each round even starts
triggerall = roundstate = 2 ; Does Not Attack before each round
triggerall = Power < powermax
Triggerall = AIlevel >= 7
triggerall = statetype != A
triggerall = movetype != H
triggerall = Stateno != [100,7999]
triggerall = P2BodyDist X >= 100
trigger1 = Random >= 600 && AIlevel = 7
trigger2 = AIlevel = 7 && p2movetype != H && var(21) <= 0 ; Nine Tailed Fox limiter is off
trigger3 = AIlevel = 8 && p2movetype != H && Power < 1000 && var(21) = 1 ; Nine Tailed Fox limiter is on

;=============================================================================
;=============================================================================
;======= Your Commands ========================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;This state executes only after performing the air launcher
[State -1, Jump Launcher]
type = ChangeState
value = 8000
triggerall = !AILevel
trigger1 = command = "holdup"
trigger1 = stateno = 250 &&  movecontact

[State -1, Super Jump Straight Up]
type = ChangeState
value = 8000
triggerall = !AILevel
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "superjump"
trigger2 = command = "superjumpforward"
trigger3 = command = "superjumpbackward"

; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !AILevel
trigger1 = command = "FF"
trigger1 = statetype = S && (stateno!=[100,106])
trigger1 = ctrl
;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !AILevel
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Throw
[State -1, Throw 1]
type = ChangeState
value = 800
triggerall = !AILevel
triggerall = command = "Grab"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !AILevel
triggerall = command = "start"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = life >= 101
trigger1 = ctrl
trigger1 = var(21) <= 0
trigger2 = ctrl
trigger2 = var(21) >= 1

[State -1, Floor Substitution Jutsu]
type = ChangeState
value = 1500
triggerall = !AILevel
triggerall = command = "start"
triggerall = statetype != A
triggerall = movetype = H
triggerall = power >= 1000
triggerall = roundstate = 2
trigger1 = stateno = 5110

[State -1, Nine-tailed Fox]
type = ChangeState
value = 3500
triggerall = !AILevel
triggerall = var(21) <= 0 ; Nine Tailed Fox limiter is off
triggerall = command = "start"
triggerall = statetype != A
triggerall = movetype != H
triggerall = life <= 100
triggerall = roundstate = 2
triggerall = alive = 1
trigger1 = ctrl

;==================================================================================
;==================================================================================

[State -1,  Great Boss Toad]
type = ChangeState
value = 3399
triggerall = !AILevel
triggerall = command = "Great Boss Toad"
triggerall = statetype != A
triggerall = power >= 3000
trigger1 = ctrl

[State -1,  Naruto Barrage]
type = ChangeState
value = 3299
triggerall = !AILevel
triggerall = command = "Naruto Barrage"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = ctrl

[State -1,  Windmill of Shadows]
type = ChangeState
value = 3200
triggerall = !AILevel
triggerall = command = "Windmill of Shadows"
triggerall = statetype != A
triggerall = power >= 1000
triggerall = NumHelper(3202) = 0
trigger1 = ctrl


[State -1,  Sexy Jutsu]
type = ChangeState
value = 3099
triggerall = !AILevel
triggerall = command = "Sexy Jutsu"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = ctrl

[State -1,  Rasengan]
type = ChangeState
value = 2999
triggerall = !AILevel
triggerall = NumHelper(3004) = 0
triggerall = command = "Rasengan"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = ctrl

;==================================================================================
;==================================================================================

[State -1,  Flip Kick]
type = ChangeState
value = 1420
triggerall = !AILevel
triggerall = command = "Flip Kick (c)"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Flip Kick]
type = ChangeState
value = 1410
triggerall = !AILevel
triggerall = command = "Flip Kick (b)"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Flip Kick]
type = ChangeState
value = 1400
triggerall = !AILevel
triggerall = command = "Flip Kick (a)"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Chakra Recovery]
type = ChangeState
value = 1300
triggerall = !AILevel
triggerall = Power < powermax
triggerall = command = "Chakra Recovery"
triggerall = statetype != A
trigger1 = ctrl

[State -1,  Dash Slash]
type = ChangeState
value = 1220
triggerall = !AILevel
triggerall = command = "Dash Slash (z)"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Dash Slash]
type = ChangeState
value = 1210
triggerall = !AILevel
triggerall = command = "Dash Slash (y)"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Dash Slash]
type = ChangeState
value = 1200
triggerall = !AILevel
triggerall = command = "Dash Slash (x)"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Slashing Upper]
type = null;ChangeState
value = 1120
triggerall = !AILevel
triggerall = command = "Slashing Upper z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Slashing Upper]
type = null;ChangeState
value = 1110
triggerall = !AILevel
triggerall = command = "Slashing Upper y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Slashing Upper]
type = null;ChangeState
value = 1100
triggerall = !AILevel
triggerall = command = "Slashing Upper x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,450]) && (movecontact)

[State -1,  Ninja Tool Throw]
type = ChangeState
value = ifelse(statetype != A,1000,1030)
triggerall = !AILevel
triggerall = command = "Ninja Tool Throw (x)"
triggerall = NumHelper(1001) = 0
trigger1 = ctrl
trigger2 = (stateno = [200,650]) && (movecontact)

[State -1,  Ninja Tool Throw]
type = ChangeState
value = ifelse(statetype != A,1010,1040)
triggerall = !AILevel
triggerall = command = "Ninja Tool Throw (y)"
triggerall = NumHelper(1001) = 0
trigger1 = ctrl
trigger2 = (stateno = [200,650]) && (movecontact)

[State -1,  Ninja Tool Throw]
type = ChangeState
value = ifelse(statetype != A,1020,1050)
triggerall = !AILevel
triggerall = command = "Ninja Tool Throw (z)"
triggerall = NumHelper(1001) = 0
trigger1 = ctrl
trigger2 = (stateno = [200,650]) && (movecontact)

;==================================================================================
;==================================================================================
;==================================================================================
;==================================================================================

[State -1,  Stand Light Punch]
type = ChangeState
value = 200
triggerall = !AILevel
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)


[State -1,  Stand Medium Punch]
type = ChangeState
value = 210
triggerall = !AILevel
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)


[State -1,  Stand Hard Punch]
type = ChangeState
value = 220
triggerall = !AILevel
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 210 && (movecontact)
trigger4 = stateno = 230 && (movecontact)
trigger5 = stateno = 240 && (movecontact)
trigger6 = stateno = 400 && (movecontact)
trigger7 = stateno = 410 && (movecontact)
trigger8 = stateno = 420 && (movecontact)
trigger9 = stateno = 430 && (movecontact)
trigger10 = stateno = 440 && (movecontact)


[State -1,  Stand Light Kick]
type = ChangeState
value = 230
triggerall = !AILevel
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)

[State -1,  Stand Medium Kick]
type = ChangeState
value = 240
triggerall = !AILevel
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)


[State -1,  Stand Hard Kick]
type = ChangeState
value = 250
triggerall = !AILevel
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 210 && (movecontact)
trigger4 = stateno = 230 && (movecontact)
trigger5 = stateno = 240 && (movecontact)
trigger6 = stateno = 400 && (movecontact)
trigger7 = stateno = 410 && (movecontact)
trigger8 = stateno = 420 && (movecontact)
trigger9 = stateno = 430 && (movecontact)
trigger10 = stateno = 440 && (movecontact)


[state -1,  Crouch Light Punch]
type = changestate
value = 400
triggerall = !AILevel
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)


[state -1,  Crouch medium Punch]
type = changestate
value = 410
triggerall = !AILevel
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)

[state -1,  Crouch Hard Punch]
type = changestate
value = 420
triggerall = !AILevel
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 210 && (movecontact)
trigger4 = stateno = 230 && (movecontact)
trigger5 = stateno = 240 && (movecontact)
trigger6 = stateno = 400 && (movecontact)
trigger7 = stateno = 410 && (movecontact)
trigger8 = stateno = 430 && (movecontact)
trigger9 = stateno = 440 && (movecontact)

[state -1, Crouch Light Kick]
type = changestate
value = 430
triggerall = !AILevel
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)

[state -1, Crouch medium Kick]
type = changestate
value = 440
triggerall = !AILevel
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 230 && (movecontact)
trigger4 = stateno = 400 && (movecontact)
trigger5 = stateno = 430 && (movecontact)

[state -1, Crouch Hard Kick]
type = changestate
value = 450
triggerall = !AILevel
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && (movecontact)
trigger3 = stateno = 210 && (movecontact)
trigger4 = stateno = 230 && (movecontact)
trigger5 = stateno = 240 && (movecontact)
trigger6 = stateno = 400 && (movecontact)
trigger7 = stateno = 410 && (movecontact)
trigger8 = stateno = 430 && (movecontact)
trigger9 = stateno = 440 && (movecontact)

[state -1,  Jump Weak Punch]
type = changestate
value = 600
triggerall = !AILevel
triggerall = command = "x"
triggerall = statetype = a
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact)
trigger3 = stateno = 630 && (movecontact)

[state -1,  Jump Medium Punch]
type = changestate
value = 610
triggerall = !AILevel
triggerall = command = "y"
triggerall = statetype = a
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact)
trigger3 = stateno = 630 && (movecontact)

[state -1,  Jump Hard Punch]
type = changestate
value = 620
triggerall = !AILevel
triggerall = command = "z"
triggerall = statetype = a
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact)
trigger3 = stateno = 610 && (movecontact)
trigger4 = stateno = 630 && (movecontact)
trigger5 = stateno = 640 && (movecontact)

[state -1,  Jump Weak Kick]
type = changestate
value = 630
triggerall = !AILevel
triggerall = command = "a"
triggerall = statetype = a
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact)
trigger3 = stateno = 630 && (movecontact)

[state -1,  Jump Medium Kick]
type = changestate
value = 640
triggerall = !AILevel
triggerall = command = "b"
triggerall = statetype = a
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact)
trigger3 = stateno = 630 && (movecontact)

[state -1,  Jump Hard Kick]
type = changestate
value = 650
triggerall = !AILevel
triggerall = command = "c"
triggerall = statetype = a
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact)
trigger3 = stateno = 610 && (movecontact)
trigger4 = stateno = 630 && (movecontact)
trigger5 = stateno = 640 && (movecontact)

