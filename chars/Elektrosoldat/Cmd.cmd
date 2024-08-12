;#ADD004BASIC PIEs#
;==============================================================================================
;=======================================<COMMAND FILE>=========================================
;==============================================================================================

;====================<BUTTON REMAPPING>====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;====================<DEFAULT VALUES>====================

[Defaults]
command.time = 15
command.buffer.time = 1

[Command]
name = "movelist"
command = s, s
time = 15

;====================<SINGLE BUTTON>====================

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

;==================<HOLD DIRECTION>==================

[Command]
name = "holdfwd"
command=/$F
time=1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time=1

[Command]
name = "holddown"
command = /$D
time = 1

;====================<HOLD BUTTON>====================

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

;====================<DIRECTION>====================

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

;====================<RELEASE DIR>====================

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

;====================<RELEASE BUTTON>====================

[Command]
name = "rlsx"
command = ~x
time = 1

[Command]
name = "rlsy"
command = ~y
time = 1

[Command]
name = "rlsz"
command = ~z
time = 1

[Command]
name = "rlsa"
command = ~a
time = 1

[Command]
name = "rlsb"
command = ~b
time = 1

[Command]
name = "rlsc"
command = ~c
time = 1

;====================<SUPER MOTIONS>===================
;----------------
;----------------Blitzbombe
[Command]
name = "Blitzbombe"
command = D, D, x+y

[Command]
name = "Blitzbombe"
command = D, D, y+z

[Command]
name = "Blitzbombe"
command = D, D, x+z

[Command]
name = "Blitzbombe"
command = ~D, D, x+y

[Command]
name = "Blitzbombe"
command = ~D, D, y+z

[Command]
name = "Blitzbombe"
command = ~D, D, x+z
;----------------Größer Flak Tritt
[Command]
name = "GrößerTritt"
command = ~D, DF, F, D, DF, F, a
time = 32

[Command]
name = "GrößerTritt"
command = ~D, DF, F, D, DF, F, b
time = 32

[Command]
name = "GrößerTritt"
command = ~D, DF, F, D, DF, F, c
time = 32

[Command]
name = "GrößerTritt"
command = ~D, DF, F, D, DF, F, ~a
time = 32

[Command]
name = "GrößerTritt"
command = ~D, DF, F, D, DF, F, ~b
time = 32

[Command]
name = "GrößerTritt"
command = ~D, DF, F, D, DF, F, ~c
time = 32
;----------------MAX Größer Flak Tritt
[Command]
name = "MAXGrößerTritt"
command = ~D, DF, F, D, DF, F, a+b
time = 32

[Command]
name = "MAXGrößerTritt"
command = ~D, DF, F, D, DF, F, b+c
time = 32

[Command]
name = "MAXGrößerTritt"
command = ~D, DF, F, D, DF, F, a+c
time = 32
;----------------Größer Blitz
[Command]
name = "GrößerBlitz"
command = ~D, DF, F, D, DF, F, x
time = 30
[Command]
name = "GrößerBlitz"
command = ~D, DF, F, D, DF, F, y
time = 30
[Command]
name = "GrößerBlitz"
command = ~D, DF, F, D, DF, F, z
time = 30
[Command]
name = "GrößerBlitz"
command = ~D, DF, F, D, DF, F, ~x
time = 30
[Command]
name = "GrößerBlitz"
command = ~D, DF, F, D, DF, F, ~y
time = 30
[Command]
name = "GrößerBlitz"
command = ~D, DF, F, D, DF, F, ~z
time = 30
;----------------MAX Größer Blitz
[Command]
name = "MAXGrößerBlitz"
command = ~D, DF, F, D, DF, F, x+y
time = 30
[Command]
name = "MAXGrößerBlitz"
command = ~D, DF, F, D, DF, F, y+z
time = 30
[Command]
name = "MAXGrößerBlitz"
command = ~D, DF, F, D, DF, F, x+z
time = 30
;---------------- Super Move Name

;====================<SPECIAL MOTIONS>====================
;=====Flak Tritt=====
[Command]
name = "FlakTritt"
command = ~$D, $U, a
time = 16

[Command]
name = "FlakTritt"
command = ~$D, $U, b
time = 16

[Command]
name = "FlakTritt"
command = ~$D, $U, c
time = 16

[Command]
name = "FlakTritt"
command = ~$D, $U, ~a
time = 16

[Command]
name = "FlakTritt"
command = ~$D, $U, ~b
time = 16

[Command]
name = "FlakTritt"
command = ~$D, $U, ~c
time = 16

;=====EX Flak Tritt=====
[Command]
name = "EXFlakTritt"
command = ~$D, $U, a+b
time = 16

[Command]
name = "EXFlakTritt"
command = ~$D, $U, b+c
time = 16

[Command]
name = "EXFlakTritt"
command = ~$D, $U, a+c
time = 16

;=====Blitzkugel=====
[Command]
name = "Blitzkugel"
command = ~$B, $F, x
time = 16

[Command]
name = "Blitzkugel"
command = ~$B, $F, y
time = 16

[Command]
name = "Blitzkugel"
command = ~$B, $F, z
time = 16

[Command]
name = "Blitzkugel"
command = ~$B, $F, ~x
time = 16

[Command]
name = "Blitzkugel"
command = ~$B, $F, ~y
time = 16

[Command]
name = "Blitzkugel"
command = ~$B, $F, ~z
time = 16

;=====EX Blitzkugel=====
[Command]
name = "EXBlitzkugel"
command = ~$B, $F, x+y
time = 16

[Command]
name = "EXBlitzkugel"
command = ~$B, $F, y+z
time = 16

[Command]
name = "EXBlitzkugel"
command = ~$B, $F, x+z
time = 16
;----------------

[Command]
name = "412p"
command = ~B, DB, D, x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, z
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~z
time = 16

[Command]
name = "412k"
command = ~B, DB, D, a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, b
time = 16

[Command]
name=  "412k"
command = ~B, DB, D, c
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~b
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~c
time = 16

;====================<OTHER>====================

[Command]
name = "highjump"
command = $D, $U
time = 15

;====================<DOUBLE TAP>====================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

;====================<2/3 BUTTON COMBINATION>====================

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = y+z
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

;==============================================================================================
;========================================<-1 STATES>===========================================
;==============================================================================================
[StateDef -1]

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




[State -1, Tick Fix]
type = CtrlSet
triggerAll = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime && Anim != 251 
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, CtrlSet For Helpers]
type = CtrlSet
trigger1 = IsHelper
value = 0

[State -1, Hit Count For Helpers]
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -1, Juggle Count For Helpers]
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(15) = 1

[State -1, Roll Forward]
type = ChangeState
value = 710
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = ChangeState
value = 715
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdback"

[State -1, Dodge]
type = ChangeState
value = 700
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))

[State -1, Blitzbombe]
type = ChangeState
value = 3300
triggerAll = !AILevel
triggerAll = command = "Blitzbombe" && command != "MAXGrößerBlitz"
triggerAll = RoundState = 2 && StateType != A
triggerAll = ifelse(var(53) <= 0, power >= 3000, power >= 1000) && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (stateno=[3050,3052]) ;&& var(51)
trigger3 = movehit = [1,16]
trigger4 = (stateno=[3000,3002]) ;&& var(51)
trigger4 = movehit = [1,16]
trigger5 = stateno=3150 ;&& var(51)
trigger5 = numhelper(3155)
trigger5 = ((helper(3155),movehit)||(helper(3155),prevstateno))
trigger6 = stateno=3100 && var(51)
trigger6 = numhelper(3105)
trigger6 = ((helper(3105),movehit)||(helper(3105),prevstateno))

[State -1, MAX Größer Blitz]
type = changestate
value = 3150
triggerall = !AIlevel && (prevstateno!=3150||var(51)>1)
triggerall = command = "MAXGrößerBlitz"
triggerAll = RoundState = 2 && StateType != A
triggerAll = ifelse(var(53) <= 0, power >= 2000, power >= 1000) && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)
trigger3 = (stateno=[3050,3052]) && var(51)
trigger3 = movehit = [1,16]

[State -1, Größer Blitz]
type = changestate
value = 3100
triggerall = !AIlevel && (prevstateno!=3100||var(51)>1)
triggerall = command = "GrößerBlitz"
triggerAll = RoundState = 2 && StateType != A
triggerAll = ifelse(var(53) <= 0, power >= 1000, power >= 0) && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = (stateno=[3000,3002]) && var(51)
trigger3 = movehit = [1,16]

[State -1, MAX Größer Flak Tritt]
type = ChangeState
value = 3050
triggerAll = !AILevel && ((prevstateno!=[3050,3052])||var(51)>1) && (stateno!=3000||var(51)>1)
triggerAll = command = "MAXGrößerTritt"
triggerAll = RoundState = 2 && StateType != A
triggerAll = ifelse(var(53) <= 0, power >= 2000, power >= 1000) && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)
trigger3 = stateno=3150 && var(51)
trigger3 = numhelper(3155)
trigger3 = ((helper(3155),movehit)||(helper(3155),prevstateno))

[State -1, Größer Flak Tritt]
type = ChangeState
value = 3000
triggerAll = !AILevel && ((prevstateno!=[3000,3002])||var(51)>1)
triggerAll = command = "GrößerTritt"
triggerAll = RoundState = 2 && StateType != A
triggerAll = ifelse(var(53) <= 0, power >= 1000, power >= 10) && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)
trigger3 = stateno=3100 && var(51)
trigger3 = numhelper(3105)
trigger3 = ((helper(3105),movehit)||(helper(3105),prevstateno))

;[State -1, MAX Super 1]
;type = ChangeState
;value = 3050
;triggerAll = !AILevel
;triggerAll = command = "MAXSUPER1"
;triggerAll = RoundState = 2 && StateType != A
;triggerAll = power >= 2000 && var(20) <= 60
;trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
;trigger2 = var(7)

;[State -1, Super 1]
;type = ChangeState
;value = 3000
;triggerAll = !AILevel
;triggerAll = command = "SUPER1"
;triggerAll = RoundState = 2 && StateType != A
;triggerAll = power >= 1000 && var(20) <= 60
;trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
;trigger2 = var(7)

[State -1, EX Flak Tritt]
type = ChangeState
value = 1130
triggerAll = !AILevel
triggerAll = command = "EXFlakTritt" && ifElse(var(20) > 0 || (StateNo = [1000, 4999]), 1, var(50) > 16)
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Flak Tritt]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerAll = command = "FlakTritt" && ifElse(var(20) > 0 || (StateNo = [1000, 4999]), 1, var(50) > 16)
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Blitzkugel]
type = ChangeState
value = 1030
triggerAll = !AILevel
triggerAll = command = "EXBlitzkugel" && ifElse(var(20) > 0 || (StateNo = [1000, 4999]), 1, var(48) > 16)
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && ifelse((fvar(17)=[1,2]),!var(20),var(20)<=60)
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Blitzkugel]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "Blitzkugel" && ifElse(var(20) > 0 || (StateNo = [1000, 4999]), 1, var(48) > 16)
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Zero Counter]
type = ChangeState
value = 750
triggerAll = !AILevel
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
triggerAll = !AILevel
triggerall = command = "c+z"&&!var(54)
triggerall = RoundState = 2
triggerall = power >= ifelse(fvar(17)>=2,2000,1000) && !var(20)
trigger1 = ctrl || StateNo = 52 || (StateNo = [100,101])
trigger1 = !var(41)
trigger2 = (var(44)=[1,2]) && (stateno = [200,699]) && movehit = [1,16]

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerall = command = "c+z"&&var(54)
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 1000
trigger1 = ctrl || (Stateno = [100,101])
trigger2 = (var(44)=[2,3]) && (stateno = [200,699]) && movehit = [1,16]

[State -1, Power Charging]
type = ChangeState
value = 730
triggerAll = !AILevel
trigger1 = command = "holdb" && command = "holdy"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20)
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Dash Forward/Run]
type = ChangeState
value = 102
triggerAll = !AILevel
trigger1 = command = "FF"
trigger1 = roundstate = 2 && StateType = S
trigger1 = ctrl

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = !AILevel
trigger1 = command = "BB"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Grab]
type = ChangeState
value = 800
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && (command = "pp" || command = "kk")
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Air Throw]
type = ChangeState
value = 850
triggerAll = !AILevel
triggerAll = RoundState = 2 && StateType = A
triggerAll = ctrl
trigger1 = (command = "holdfwd" || command = "holdback") && command = "pp"
trigger2 = (command = "holdfwd" || command = "holdback") && command = "kk"


;--------------------------------------------------------------------------
[State -1, Standing Light Punch]
type=ChangeState
value=200
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command != "holddown"&& command="x"
trigger1=ctrl||stateno=[100,101]
trigger2= (StateNo = 200 || StateNo = 201 || StateNo = 400 || StateNo = 430) && Time >=4.5
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >= 6
trigger6 = StateNo = 230 && Time >= 9
trigger7 = var(4)
;trigger3=var(4)disabled
;---------------------------------------------------------------------------
[State -1, Standing Medium Punch]
type=ChangeState
value=210
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command != "holddown" && (command="y")
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || stateno = 230 || stateno = 400 || stateno = 430
trigger3 = var(20) && (stateno != 210 && stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = var(4)

 ;---------------------------------------------------------------------------
[State -1, Standing Heavy Punch]
type=ChangeState
value = 220 + (Abs(P2BodyDist X) <= 17) * 5
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command != "holddown"&& (command="z")
trigger1=ctrl||stateno=[100,101]
trigger2 = ((var(59)&&prevstateno!=251)||(stateno=240&&prevstateno=210&&var(10)=0)) && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || (stateno = [210,212]) || stateno = 230 || (stateno = [240,241]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5=movecontact && stateno=240&&prevstateno=241&&animelemtime(8)<0
trigger6 = var(4)
 ;---------------------------------------------------------------------------
[State -1, Standing Light Kick]
type=ChangeState
value=230
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command != "holddown"&& command="a"
trigger1=ctrl||stateno=[100,101]
trigger2 = StateNo = 200 && MoveContact && Time >=7
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = var(59) && movecontact = [1,8]
trigger5 = (stateno= 400 || stateno = [200,201])
trigger6 = (StateNo = 400 || StateNo = 430) && Time >= 6
trigger7 = StateNo = 230 && Time >= 9
trigger8 = StateNo = 200 && Time >= 7
trigger9 = var(4)
;trigger3=var(4)disabled

;---------------------------------------------------------------------------
[State -1, Standing Medium Kick]
type=ChangeState
value=240
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command != "holddown"&& (command="b")
trigger1=ctrl||stateno=[100,101]
trigger2 = ((stateno = 210 && prevstateno != 201) || var(59)) && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || stateno = 230 || stateno = 400 || stateno = 430 || (stateno = [210,212]) || stateno = 410 || (stateno = 210&&prevstateno!=240) || stateno = 211 || stateno = 410
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24]))  && time>3
trigger5 = var(4)
;trigger3=var(4)disabled

[State -1, Panzerfaust]
type = ChangeState
value = 245
triggerAll = !AILevel
triggerAll = command != "holddown" && (command = "holdfwd") && command = "c"
triggerAll = StateType != A
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && prevstateno != 251 && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || (stateno = [210,212]) || stateno = 230 || (stateno = [240,241]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440 || stateno = 225 || stateno = 220 || stateno = 420
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5=stateno=240&&prevstateno<200&&animelemtime(9)<0 && movecontact
trigger6 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440) && MoveContact = [1,6]
trigger7 = var(4)

[State -1, Panzerschreck]
type = ChangeState
value = 249
triggerAll = !AILevel
triggerAll = command != "holddown" && (command = "holdback") && command = "c"
triggerAll = StateType != A
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && prevstateno != 251 && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || (stateno = [210,212]) || stateno = 230 || (stateno = [240,241]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440 || stateno = 225 || stateno = 220 || stateno = 420
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5=stateno=240&&prevstateno<200&&animelemtime(9)<0 && movecontact
trigger6 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440) && MoveContact = [1,6]
trigger7 = var(4)

;---------------------------------------------------------------------------
[State -1, Standing Heavy Kick]
type=ChangeState
value=250
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command != "holddown"&& (command="c")
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && prevstateno != 251 && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || (stateno = [210,212]) || stateno = 230 || (stateno = [240,241]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440 || stateno = 225 || stateno = 220 || stateno = 420
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5=stateno=240&&prevstateno<200&&animelemtime(9)<0 && movecontact
trigger6 = var(4)

;---------------------------------------------------------------------------
[State -1, Crouching Light Punch]
type=ChangeState
value=400
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command="holddown"&& command="x"
trigger1=ctrl||stateno=[100,101]
trigger2= (StateNo = 200 || StateNo = 201 || StateNo = 400 || StateNo = 430) && Time >=4.5
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = (StateNo = 200 || StateNo = 400) && Time >= 6
trigger6 = StateNo = 430 && Time >= 9
trigger7 = var(4)
;trigger3=var(4)disabled

;---------------------------------------------------------------------------
[State -1, Crouching Medium Punch]
type=ChangeState
value=410
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command= "holddown"&& (command="y")
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || stateno = 230 || stateno = 400 || stateno = 430
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5=stateno=430&&animelemtime(4)<0 && movecontact
;trigger2=var(4)

;---------------------------------------------------------------------------
[State -1, Crouching Heavy Punch]
type=ChangeState
value=420
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command="holddown"&& (command="z")
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && prevstateno != 251 && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || (stateno = [210,212]) || stateno = 230 || (stateno = [240,241]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger6=stateno=410&&animelemtime(5)<0
trigger6=prevstateno=430 && movecontact
trigger7 = var(4)

;---------------------------------------------------------------------------
[State -1, Crouching Light Kick]
type=ChangeState
value=430
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command="holddown"&& command="a"
trigger1=ctrl||stateno=[100,101]
trigger2= (StateNo = 200 || StateNo = 201 || StateNo = 400 || StateNo = 430) && Time >=4.5
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = var(59) && movecontact = [1,8]
trigger5 = (stateno= 400 || stateno = [200,201])
trigger6 = (StateNo = 200 || StateNo = 400) && Time >= 6
trigger7 = StateNo = 430 && Time >= 9
trigger8 = var(4)
;trigger3=var(4)disabled

;---------------------------------------------------------------------------
[State -1, Crouching Medium Kick]
type=ChangeState
value=440
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command="holddown"&& command="b"
trigger1=ctrl||stateno=[100,101]
trigger2 = var(59) && movecontact = [1,8]
trigger2 = (stateno = [200,201]) || stateno = 230 || stateno = 400 || stateno = 430 || (stateno = [210,212]) || stateno = 410
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = var(4)

;---------------------------------------------------------------------------
[State -1, Crouching Heavy Kick]
type=ChangeState
value=450
triggerall=!AILevel&&Roundstate=2&&(statetype != A && prevstateno != 750)&&command="holddown"&& command="c"
trigger1=ctrl||stateno=[100,101]
trigger2 = StateNo = 430 && (MoveContact=[1,8]) && Time >=8
trigger3 = var(59)&&prevstateno!=251 && (movecontact = [1, 8])
trigger3 = (stateno = [200,201]) || (stateno = [210,212]) || stateno = 230 || (stateno = [240,241]) || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440 || stateno = 221 || stateno = 220 || stateno = 420
trigger4 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && ((var(37)=[1,16])||(movecontact = [1, 24])) && time>3
trigger5 = var(4)

;--------------------------------------------------------------------------
[State -1, Jumping Light Punch]
type=ChangeState
value=600
triggerall=!AILevel&&Roundstate=2&&statetype=A&&command="x"
trigger1=ctrl
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3
trigger4 = var(4)
;trigger2=var(4 ;---------------------------------------------------------------------------
[State -1, Jumping Medium Punch]
type=ChangeState
value=610
triggerall=!AILevel&&Roundstate=2&&statetype=A&&command="y"
trigger1=ctrl
trigger2 = var(59)>1 && (movecontact = [1, 8])
trigger2 = stateno = 600 || stateno = 630
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3
trigger5 = var(4)
;trigger2=var(4 ;---------------------------------------------------------------------------
[State -1, Jumping Heavy Punch]
type=ChangeState
value=620
triggerall=!AILevel&&Roundstate=2&&statetype=A&&command="z"
trigger1=ctrl
trigger2 = var(59)>1 && (movecontact = [1, 8])
trigger2 = stateno = 600 || stateno = 610 || stateno = 630 || stateno = [640,649]
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3
trigger5 = var(4)
;trigger2=var(4 ;---------------------------------------------------------------------------
[State -1, Jumping Light Kick]
type=ChangeState
value=630
triggerall=!AILevel&&Roundstate=2&&statetype=A&&command="a"
trigger1=ctrl
trigger2 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger3 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3 && (stateno!=1200 || (stateno=1200&&(command != "holdfwd" && command != "holdback" && command != "holddown" && command != "holdup")))
trigger4 = var(59)>1 && (movecontact = [1, 8])
trigger4 = stateno = 600
trigger5 = var(4)
;trigger2=var(4 ;---------------------------------------------------------------------------

[State -1, Hubschrauber Back]
type = ChangeState
value = 642
triggerAll = !AILevel
triggerAll = StateType = A
triggerall = command = "holdback" && command = "b"
trigger1 = ctrl
trigger2 = var(59)>1 && (movecontact = [1, 8])
trigger2 = stateno = 600 || stateno = 630 || stateno = 610
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3 && (stateno!=1200 || (stateno=1200&&(command != "holdfwd" && command != "holdback" && command != "holddown" && command != "holdup")))

[State -1, Hubschrauber Forward]
type = ChangeState
value = 641
triggerAll = !AILevel
triggerAll = StateType = A
triggerall = command = "holdfwd" && command = "b"
trigger1 = ctrl
trigger2 = var(59)>1 && (movecontact = [1, 8])
trigger2 = stateno = 600 || stateno = 630 || stateno = 610
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3 && (stateno!=1200 || (stateno=1200&&(command != "holdfwd" && command != "holdback" && command != "holddown" && command != "holdup")))

[State -1, Jumping Medium Kick]
type=ChangeState
value=640
triggerall=!AILevel&&Roundstate=2&&statetype=A&&command="b"
trigger1=ctrl
trigger2 = var(59)>1 && (movecontact = [1, 8])
trigger2 = stateno = 600 || stateno = 630 || stateno = 610
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3 && (stateno!=1200 || (stateno=1200&&(command != "holdfwd" && command != "holdback" && command != "holddown" && command != "holdup")))
trigger5 = var(4)
;trigger2=var(4 ;---------------------------------------------------------------------------
[State -1, Jumping Heavy Kick]
type=ChangeState
value=650
triggerall=!AILevel&&Roundstate=2&&statetype=A&&command="c"
trigger1=ctrl
trigger2 = var(59)>1 && (movecontact = [1, 8])
trigger2 = stateno = 600 || stateno = 610 || stateno = 630 || (stateno = [640,649]) || stateno = 620
trigger3 = var(20) && (stateno = [200, 699]) && (movecontact = [1, 24])
trigger4 = var(20) && (stateno = [1000, 2999]) && (movecontact = [1, 24]) && time>3 && (stateno!=1200 || (stateno=1200&&(command != "holdfwd" && command != "holdback" && command != "holddown" && command != "holdup")))
trigger5 = var(4)










[State -1, Standing Heavy Punch]
type = ChangeState
value = 220 + (Abs(P2BodyDist X) <= 17) * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Panzerschreck]
type = ChangeState
value = 249
triggerAll = !AILevel
triggerAll = command != "holddown" && (command = "holdback") && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440) && MoveContact = [1,6]
trigger3 = var(4)

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Kick]
type = ChangeState
value = 240 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Light Punch]
type = ChangeState
value = 200 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >= 6
trigger3 = StateNo = 230 && Time >= 9
trigger4 = var(4)

[State -1, Standing Light Kick]
type = ChangeState
value = 230 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 400 || StateNo = 430) && Time >= 6
trigger3 = StateNo = 230 && Time >= 9
trigger4 = StateNo = 200 && Time >= 7
trigger5 = var(4)

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = !AILevel
triggerAll = command  ="holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400) && Time >= 6
trigger3 = StateNo = 430 && Time >= 9
trigger4 = var(4)

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400) && Time >= 6
trigger3 = StateNo = 430 && Time >= 9
trigger4 = var(4)

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Hubschrauber Back]
type = ChangeState
value = 642
triggerAll = !AILevel
trigger1 = command = "holdback" && command = "b"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Hubschrauber Forward]
type = ChangeState
value = 641
triggerAll = !AILevel
trigger1 = command = "holdfwd" && command = "b"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = !AILevel
triggerAll = command = "start"
triggerAll = StateType != A
triggerAll = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(6)

;==============================================================================================
;===========================================< A.I >============================================
;==============================================================================================

[State -1, Fall Recovery (Air)]
type = ChangeState
value = 5210
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && CanRecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fall Recovery (Ground)]
type = ChangeState
value = 5200
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jump]
type = ChangeState
value = 40
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A && ctrl
trigger1 = EnemyNear, MoveType = A && P2BodyDist x < 160 && EnemyNear, HitDefAttr = SC, AT

[State -1, Roll Forward]
type = ChangeState
value = 710
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AILevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [92,122])

[State -1, Dodge]
type = ChangeState
value = 700
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [0,60])

[State -1, Dodge]
type = ChangeState
value = 700
triggerall = AIlevel && numenemy
triggerall = (facing=1 && (enemy,facing=-1)) || (facing=-1 && (enemy,facing=1))
triggerall = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (145 * (AILevel ** 2 / 64.0))
triggerall = roundstate=2  && statetype != A
trigger1 = enemynear,movetype=A && (p2bodydist x=[0,40])&&(p2bodydist y=[0,0])
trigger2 = ((enemynear,numproj) || (enemynear,numhelper)) && inguarddist && p2bodydist x>=25 
trigger3 = RoundState = 2 && InGuardDist
trigger3 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger3 = !var(26) || P2BodyDist x >= 40
trigger3 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger3 = StateType != A || P2StateType = A
trigger3 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger3 = Random <  (ifElse((P2StateNo = [200, 699]), 125, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && var(20) <= 150 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (AILevel ** 2 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (AILevel ** 2 / 64.0))

[State -1, Guard]
type = ChangeState
value = 120
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && InGuardDist
trigger1 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger1 = !var(26) || P2BodyDist x >= 40
trigger1 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger1 = StateType != A || P2StateType = A
trigger1 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = RoundState = 2 && StateType != A
trigger1 = ifelse(var(53) <= 0, power >= 1000, power >= 0) && var(20) <= 60
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20)
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20) && PrevStateNo != 5120
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Air Throw]
type = ChangeState
value = 850
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = A
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = ctrl
trigger1 = P2StateType = A && Random < (200 * (AILevel ** 2 / 64.0))
trigger1 = (P2Dist x = [-20,33]) && (P2Dist y = [-100,50])

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220 + (Abs(P2BodyDist X) <= 17) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,57]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,75]) && (P2Dist y = [-64,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && Statetype != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-135,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,78]) && (P2Dist y = [-33,0]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,51]) && (P2Dist y = [-101,76]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = AILevel && NumEnemy; && !vel x
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall = P2StateType != L
trigger1 = ctrl
trigger1 = P2bodydist X = [-10,80]
trigger1 = P2bodydist Y = [0,95]
trigger1 = Pos Y < -40
trigger1 = Vel X < 0
trigger1 = Random < (300 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Punch]
type = ChangeState
value = 210
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Kick]
type = ChangeState
value = 240
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-121,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Panzerfaust]
type = ChangeState
value = 245
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall = p2statetype = S
triggerall = MoveHit
trigger1 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440) && movehit && Random < (350 * (AILevel ** 2 / 64.0))
ignorehitpause = 0

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,52]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,65]) && (P2Dist y = [-60,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-80,72]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [-60,44]) && (P2Dist y = [-60,68]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Punch]
type = ChangeState
value = 200 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,44]) && (P2Dist y = [-68,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (85 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-68,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall = P2StateType != L
trigger1 = ctrl || stateno = 21 || stateno = 100
trigger1 = p2bodydist X = [-5,31]
trigger1 = p2MoveType = I
trigger1 = p2statetype != A
trigger1 = Random < (325 * (AILevel ** 2 / 64.0))

trigger2 = ctrl || stateno = 21 || stateno = 100
trigger2 = p2bodydist X = [-5,24]
trigger2 = p2MoveType = H
trigger2 = p2statetype != A
trigger2 = Random < (525 * (AILevel ** 2 / 64.0))

trigger3 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (525 * (AILevel ** 2 / 64.0))
trigger3 = stateno = 400 && (animelem=2,>0 && animelem=4,<0)
trigger3 = p2bodydist X = [-5,31]
trigger3 = p2MoveType = H
trigger3 = p2statetype != A
ignorehitpause = 0

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-25,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100, 101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = ((stateno = 400) && movehit && !animtime)
trigger3 = (enemy, statetype = S && (enemy, movetype = A || !enemy, ctrl) && random < (125 * (AIlevel ** 2 / 64.0)))

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-51,60]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,59]) && (P2Dist y = [-80,57]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 2 / 64.0))

;------------------------------------------------------------------------------
; SPECIALS
;------------------------------------------------------------------------------
[State -1, Flak Tritt]
type = ChangeState
value = ifElse(Power >= 500 && Random < 133, 1130, 1100)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-70,70]) && P2StateType != A) || ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Blitzkugel]
type = ChangeState
value = ifElse(Power >= 500 && Random < 150, 1030, 1000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (75 * (AILevel ** 2 / 64.0))

;------------------------------------------------------------------------------
; SUPERS
;------------------------------------------------------------------------------

[State -1, Größer Blitzkugel]
type = ChangeState
value = 3100
triggerAll = AILevel && NumEnemy 
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && !var(20)
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = EnemyNear, StateType = A
triggerAll = EnemyNear, StateType != L
triggerAll = (P2BodyDist x = [0,144]) && (P2Dist y = [-58,0])
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveContact && Random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 2 / 64.0))
trigger4 = var(7) && StateNo = 1100 && Random < (375 * (AILevel ** 2 / 64.0))

[State -1, MAX Größer Flak Tritt]
type = ChangeState
value = 3050
triggerall = AILevel && numenemy && RoundState=2 && StateType != A &&var(20)<=60&& random < (175 * (AIlevel ** 2 / 64.0))
triggerall = (p2stateno != [120, 155]) && (enemynear,statetype != L) && (enemynear,stateno!=[5070,5220]) && p2bodydist x >=0 && p2bodydist x <=45 &&(p2dist y=[-85,-40]) && (enemynear, statetype != C)
triggerAll = Power >= 2000 && var(20) <= 60
trigger1 = ctrl || (StateNo=[100,101])|| (StateNo=[110,111])
trigger2 = (P2BodyDist x = [0, 30]) || ((EnemyNear, BackEdgeBodyDist < 15) && P2StateType = A)
trigger2 = var(7) && MoveHit && Random < (175 * (AILevel ** 2 / 64.0))
trigger3 = var(8) && StateNo = 3001 && Random < (375 * (AILevel ** 2 / 64.0))

[State -1, Größer Flak Tritt]
type = ChangeState
value = 3000
triggerall = AILevel && numenemy && RoundState=2 && StateType != A &&var(20)<=60&& random < (300 * (AIlevel ** 2 / 64.0))
triggerall = (p2stateno != [120, 155]) && (enemynear,statetype != L) && (enemynear,stateno!=[5070,5220]) && p2bodydist x >=0 && p2bodydist x <=45 &&(p2dist y=[-70,-35]) && (enemynear, statetype != C)
triggerAll = Power >= 1000 && var(20) <= 60
trigger1 = ctrl || (StateNo=[100,101])|| (StateNo=[110,111])
trigger2 = (P2BodyDist x = [0, 30]) || ((EnemyNear, BackEdgeBodyDist < 15) && P2StateType = A)
trigger2 = var(7) && MoveHit && Random < (250 * (AILevel ** 2 / 64.0))
