; ADD004 BASIC PIEs ReBuilded CNS (01/03/2023)
;==============================================
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==============================================

; _________________________________________
;| Venom by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<SYSTEM STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[StateDef 0]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = IsHelper

[State 0, Destroy Helpers]
type = DestroySelf
trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && !AnimTime
value = 0

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050

[State 0, Skywalker]
type = ChangeState
triggerall = pos y < 0
trigger1 = !NumEnemy
trigger2 = NumEnemy = 1
trigger2 = (Enemy, Name = "M -NES Game 1" + Enemy, Name = "M -NES Game 2" + Enemy, Name = "M -GB Game 1" + Enemy, AuthorName = "Bane84") < 2
trigger3 = Numenemy >= 2
trigger3 = (Enemy(0), Name = "M -NES Game 1" + Enemy(0), Name = "M -NES Game 2" + Enemy(0), Name = "M -GB Game 1" + Enemy(0), AuthorName = "Bane84") < 2
trigger3 = (Enemy(1), Name = "M -NES Game 1" + Enemy(1), Name = "M -NES Game 2" + Enemy(1), Name = "M -GB Game 1" + Enemy(1), AuthorName = "Bane84") < 2
value = 50



;====================<CROUCHING>====================
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 12
value = 10
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 10
value = 10

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11


;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = 11
velSet = 0,0
sprPriority = 0

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6 && !AnimTime
value = 11


;Crouch to Stand
[StateDef 12]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 10
value = 12
elem = 3 - AnimElemNo(0)

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 12
value = 12

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<WALKING>====================
[StateDef 20]
type = S
physics = S
moveType = I
sprPriority = 0

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 20

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 21



;====================<JUMPING>====================
;Jumping
[StateDef 40]
type = S
physics = S
moveType = I
anim = 40
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 40, Direction]
type = VarSet
trigger1 = !AILevel
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 40, Direction (AI)]
type = VarSet
trigger1 = AILevel
sysvar(1) = ifElse((EnemyNear, MoveType != A || BackEdgeBodyDist <= 10), 1, ifElse((EnemyNear, MoveType = A), -1, 0))

[State 40, High Jump]
type = VarSet
trigger1 = !Time && !AILevel
var(3) = ifElse(command = "highjump", 3, 0)

[State 40, High Jump (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(3) = ifElse((P2BodyDist x >= 160 || Random < (125 * (AILevel ** 2 / 64.0))), 3, 0)

[State 40, High Jump]
type = VarSet
trigger1 = !Time && PrevStateNo = 100
var(3) = 3

[State 40, Low Jump]
type = VarSet
trigger1 = !AILevel && command != "holdup" && (var(3) != [1,2])
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Low Jump (AI)]
type = VarSet
trigger1 = AILevel && (var(3) != [1,2])
trigger1 = (EnemyNear, StateType = C) && Random < 500
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = ifElse((var(3) = [2,3]), 41, 40), 0

[State 40, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 40, Velocity: Normal Jump]
type = VelSet
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;In Air
[StateDef 50]
type = A
physics = N
moveType = I
sprPriority = 1

[State 50, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(!vel x , 41, ifElse(vel x > 0, 42, 43)) + 10 * (var(3) = [1,2])
persistent = 0

[State 50, Assert: No Guard]
type = AssertSpecial
trigger1 = var(3) = [1,2]
flag = NoAirGuard
ignoreHitPause = 1

[State 50, Grounded Frame]
type = PosFreeze
trigger1 = Time < 1 && PrevStateNo = 40
value = 1

[State 50, Gravity]
type = Gravity
trigger1 = Time >= 1 || PrevStateNo != 40

[State 50, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


[StateDef 51]
type = A
physics = N
moveType = I
sprPriority = 1

[State 51, Gravity]
type = Gravity
trigger1 = 1

[State 51, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Landing
[StateDef 52]
type = S
physics = S
moveType = I
anim = 47
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && (var(3) = 1 || var(3) = 2)
trigger1 = (PrevStateNo = [600,699])
value = 57

[State 52, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, CtrlSet]
type = CtrlSet
trigger1 = !Time && (PrevStateNo != [600,699])
trigger2 = Time = 1 && Anim != 57
value = 1

[State 52, ChangeState to Guarding]
type = ChangeState
trigger1 = ctrl && command = "holdback"
trigger1 = InGuardDist && (PrevStateNo != [600,699])
value = 120

[State 52, Assert: NoWalk]
type = AssertSpecial
trigger1 = Anim != 5
flag = NoWalk
ignoreHitPause = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 52, ChangeAnim to Turning]
type = ChangeAnim
trigger1 = ctrl && P2Dist x < 0
trigger1 = Anim != 5
value = 5

[State 52, Turn]
type = Turn
trigger1 = Anim = 5 && AnimElem = 1

[State 52, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;======================<RUN>===========================
[StateDef 100]
type = S
physics = N
moveType = I
anim = 100
ctrl = 0
sprPriority = 1

[State 100, VelSet]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 1 || AnimElem = 5 || AnimElem = 9)
value = 100, ifElse((AnimElem = 1 || AnimElem = 9), 0, 1)

[State 100, Jump]
type = ChangeState
trigger1 = !AILevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Jump (AI)]
type = ChangeState
trigger1 = AILevel && Random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2BodyDist x <= 90
value = 101


;Stop Running
[StateDef 101]
type = S
physics = S
moveType = I
anim = 101
ctrl = 0
sprPriority = 1

[State 101, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0

[State 101, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 101, Jump]
type = ChangeState
trigger1 = !AILevel && command = "holdup"
value = 40

[State 101, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(command = "holddown", 10, 0)
ctrl = 1

;=================<AIR DASH>=================
[Statedef 103]
type = A
physics = N
velset = 0,-5
ctrl = 0
anim = 102

[State 103, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,1
volume = 255
volumescale = 255
channel = 0

[State 103, 1]
type = VelAdd
trigger1 = Animelemtime(2) < 6
y = .75

[State 103, 2]
type = VelAdd
trigger1 = Animelemtime(1) > 3 &&  AnimElemtime(3) < 0
x = .76

[State 103, 3]
type = VelAdd
trigger1 = Animelemtime(2) >= 1 && AnimElemtime(3) <2
y = -.85

[State 103, 2]
type = VelSet
trigger1 = Animelem = 3
x = 7.5
y = -5.8

[State 103, 1]
type = Gravity
trigger1 = Animelemtime(3) > 3

[State 103, 2]
type = PlayerPush
trigger1 = 1
value = 0

[State 103 , 1]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 103, 0]
type = Helper
trigger1 = time = 0
pos = 68*const(size.xscale),-175*const(size.yscale)
postype = p1
stateno = 104
helpertype = normal
name = "Webbing"
keyctrl = 0
ownpal = 1
ID =103
size.xscale = const(size.xscale)

[State 103, 3]
type = CtrlSet
trigger1 = time = 10
value = 1

[State 103, ChangeState]
type = ChangeState
trigger1 = Animtime = 0
value = 1613
ctrl = 1

;Webrope
[Statedef 104]
type = S
ctrl = 0
anim = 103
velset = 0,0

[State 104, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 20,0
volume = 255
volumescale = 255
channel = 1

[State 104, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 104, 1]
type = PosFreeze
trigger1 = 1
value = 1

[State 104, 1]
type = DestroySelf
trigger1 = Animtime = 0 || parent, stateno !=103

;========================<DASH BACKWARDS>==========================
[StateDef 105]
type = A
physics = N
moveType = I
velSet = 0,0
anim = 105
ctrl = 0
sprPriority = 1

[State 105, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 105,0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)

[State 105, End]
type = ChangeState
trigger1 = !AnimTime
value = 106

;Stop Dashing Backwards
[StateDef 106]
type = S
physics = S
ctrl = 0
anim = 106
velSet = 0,0

[State 106, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 106, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 100,1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 106, CtrlSet]
type = CtrlSet
trigger1 = Time >= 2
value = 1

[State 106, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=================<DASH FORWARD>=================
[StateDef 110]
type = A
physics = N
moveType = I
anim = 110
ctrl = 0
sprPriority = 1

[State 110, Dash Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, VarSet -> Running]
type = VarSet
trigger1 = !Time
sysvar(1) = 1

[State 110, VarSet -> Not Running]
type = VarSet
triggerAll = AnimElemTime(2) < 0
trigger1 = !AILevel && command != "holdfwd"
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.8
y = -4

[State 110, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.98

[State 110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 110, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
value = 111


;Stop Dashing Forward
[StateDef 111]
type = S
physics = S
ctrl = 1
anim = 111
velSet = 0,0

[State 111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 111, Dash End Sound]
type = PlaySnd
trigger1 = !Time
value = 100,0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = ceil(16 * const(size.xScale)),0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====================<DODGE>====================
[StateDef 700]
type = S
physics = S
moveType = I
anim = 700
ctrl = 0
velSet = 0,0
sprPriority = -2

[State 700, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
channel = 0

[State 700, Dodge Sound]
type = PlaySnd
trigger1 = !Time
value = 1,3
channel = 1

[State 700, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 700, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 700, Attack]
type = ChangeState
trigger1 = !AILevel && Time = [15,25]
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifElse((command = "x" || command = "y" || command = "z"), 229, 250)

[State 700, Attack (AI)]
type = ChangeState
trigger1 = AILevel && (Time = [15,25]) && NumEnemy
trigger1 = (EnemyNear, MoveType != A) && (P2BodyDist x = [-60,60]) && (P2Dist y >= -60)
value = ifElse(Random < 666, 229, 250)

[State 700, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;================<ROLL FORWARD>================
[StateDef 710]
type = S
physics = N
moveType = I
anim = 710
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 710, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HitBy]
type = HitBy
trigger1 = AnimElemTime(7) < 0
value = SCA,AT
time = 1

[State 710, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 1, 0)
channel = 0

[State 710, Roll Sound]
type = PlaySnd
trigger1 = Time = 1
value = 110,0
channel = 1

[State 710, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = 6.45

[State 710, End Roll]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 710, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===============<ROLL BACKWARDS>===============
[StateDef 715]
type = S
physics = N
moveType = I
anim = 715
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 715, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 715, HitBy]
type = HitBy
trigger1 = AnimElemTime(7) < 0
value = SCA,AT
time = 1

[State 715, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 1, 0)
channel = 0

[State 715, Roll Sound]
type = PlaySnd
trigger1 = Time = 1
value = 110,0
channel = 1

[State 715, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = -6.45

[State 715, End Roll]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 715, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;==========<POWER CHARGE>==========
[StateDef 730]
type = S
physics = S
moveType = I
anim = 730
velSet = 0,0
ctrl = 0

[State 730, PowerAdd]
type = PowerAdd
triggerAll = Power < const(data.power) && Power < PowerMax
trigger1 = !AILevel && (command = "holdb" && command = "holdy")
trigger2 = AILevel
value = 2 + ifElse(time < 60, 0, (time - 60) / 12)

[State 730, Voice]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 730, Character Flash]
type = PalFX
trigger1 = 1
time = 1
add = 75 + ceil(sin(Time / 6.0 * pi) * 75),25 + ceil(sin(Time / 6.0 * pi) * 25),0

[State 730, Power Charge Helper]
type = Helper
trigger1 = !NumHelper(8330)
helperType = Normal
stateNo = 8330
ID = 8330
name = "Power Charge"
posType = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, Particles]
type = Helper
trigger1 = !NumHelper(8331)
helperType = Normal
stateNo = 8331
ID = 8331
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, End]
type = ChangeState
trigger1 = Power >= const(data.power) || Power >= PowerMax || RoundState != 2
trigger2 = !AILevel && (command != "holdb" || command != "holdy")
trigger3 = AILevel && (InGuardDist || P2BodyDist x <= 120)
value = 731
ctrl = 1


;Power Charge End
[StateDef 731]
type = S
physics = S
moveType = I
anim = 731
velSet = 0,0
ctrl = 1

[State 731, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 0

[State 730, Full Power Voice]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power)
value = 195,1
channel = 0
persistent = 0

[State 730, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====================<ZERO COUNTER>====================
[StateDef 750]
type = S
physics = S
moveType = I
anim = 750
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = -1000
faceP2 = 1

[State 750, Button]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = (command = "412k")
ignoreHitPause = 1

[State 750, Button (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2StateType = A), 0, ifElse((P2StateType = C), 1, ifElse(Random < 500, 0, 1)))
ignoreHitPause = 1

[State 750, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 750, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 750, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2
channel = 0

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = ceil(-20 * const(size.xScale)), ceil(-57 * const(size.yScale))
superMoveTime = 255
ownPal = 1

[State 750, SuperPause]
type = SuperPause
trigger1 = !Time
time = 15
moveTime = 15
p2DefMul = 1
anim = -1
sound = s750,0
darken = 0

[State 750, End]
type = ChangeState
trigger1 = Time >= 15
value = ifElse(var(10) = 1, 2910, 2900)



;====================<PARRY>====================
;Standing Parry
[StateDef 760]
type = S
physics = S
moveType = I
anim = 760
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 760, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 760, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 760, Stop]
type = PosFreeze
trigger1 = 1
value = 1

[State 760, No Walking]
type = VarSet
trigger1 = 1
var(26) = 7

[State 760, Voice]
type = PlaySnd
trigger1= !Time
value = 4,2
channel = 0

[State 760, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 760, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 760, FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = ceil(39 * const(size.xscale)), ceil(-100 * const(size.yscale))
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownPal = 1

[State 760, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 760, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Crouching Parry
[StateDef 761]
type = C
physics = C
moveType = I
anim = 761
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 761, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 761, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 761, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 761, No Walk]
type = VarSet
trigger1 = 1
var(26) = 7

[State 761, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2
channel = 0

[State 761, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 761, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinAdd = 0,-64,-255,60
time = 15

[State 761, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprpriority = 5
postype = P1
pos = ceil(32 * const(size.xscale)), ceil(-70 * const(size.yscale))
pauseMovetime = -1
superMovetime = -1
scale = 0.5,0.5
ownpal = 1

[State 761, EnvShake]
type = EnvShake
trigger1 = !time
time = 0
ampl = 0

[State 761, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;Jumping Parry
[StateDef 762]
type = A
physics = N
moveType = I
anim = 762
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 762, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 762, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 762, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 762, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2
channel = 0

[State 762, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 762, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 762, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = ceil(38 * const(size.xscale)), ceil(-120 * const(size.yscale))
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownpal = 1

[State 762, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 762, End]
type = ChangeState
trigger1 = !AnimTime
value = 763
ctrl = 1


;Falling
[StateDef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(vel x > 2, 2, ifElse(vel x < -2, -2, vel x))
y = ifElse(vel y < -2, vel y, -2)

[State 763, Gravity]
type = Gravity
trigger1 = 1

[State 763, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;====================<CUSTOM COMBO>====================
;Ground Version
[StateDef 900]
type = S
physics = S
moveType = A
anim = 900
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = -1000

[State 900, Corner Push]
type = VarSet
trigger1 = Time = 4
fvar(5) = 0

[State 900, Unguardable]
type = VarSet
trigger1 = Time = 4 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 30

[State 900, NotHitBy]
type = NotHitBy
trigger1 = !time
value = SCA
time = 38

[State 900, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 900, Custom Combo Time]
type = VarSet
trigger1 = Time >= 4
var(20) = 180

[State 900, Voice]
type = PlaySnd
trigger1 = Time = 4
value = 1400,0
channel = 0

[State 900, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo FX"
posType = P1
pos = ceil(0 * const(size.xscale)), ceil(-60 * const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 900, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 30
moveTime = 30
anim = -1
sound = s900,0
p2DefMul = 1
darken = 0

[State 900, AfterImage]
type = AfterImage
trigger1= !AnimTime
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Air Version
[Statedef 905]
type = A
physics = N
moveType = A
anim = 905
ctrl = 0
sprPriority = 2
powerAdd = -1000

[State 905, Corner Push]
type = VarSet
trigger1 = Time = 4
fvar(5) = 0

[State 905, Unguardable]
type = VarSet
trigger1 = Time = 4 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 30

[State 905, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 38

[State 905, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 905, Custom Combo Timer]
type = VarSet
trigger1 = Time >= 4
var(20) = 180

[State 905, Voice]
type = PlaySnd
trigger1 = Time = 4
value = 1400,0
channel = 0

[State 905, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo Startup"
posType = P1
pos = ceil(10 * const(size.xscale)), ceil(-81 * const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 905, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 30
moveTime = 30
anim = -1
sound = s900,0
p2DefMul = 1
darken = 0

[State 905, AfterImage]
type = AfterImage
trigger1 = !AnimTime
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 905, End]
type = ChangeState
trigger1 = !AnimTime
value = 906
ctrl = 1


;Air Finish
[StateDef 906]
type = A
physics = N
moveType = I
anim = 906
ctrl = 1

[State 906, Gravity]
type = Gravity
trigger1 = 1

[State 906, Land]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;==========<TARGET SAFE FALL>==========
[StateDef 5205]
type = A
physics = N
moveType = H

[State 5205, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 5035
value = 5050

[State 5205, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5205, SelfState (Ground)]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 5205, SelfState (Air)]
type = SelfState
trigger1 = Time >= 60
value = 5210




;==========<FALL RECOVERY>==========
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5200, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 10
value = 5201


[StateDef 5201]
type = S
moveType = I
physics = N
anim = 5200
ctrl = 0
faceP2 = 1

[State 5201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !Time
x = -8
y = 0

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

[State 5201, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,1
channel = 0

[State 5201, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0
channel = 1

[State 5201, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 5201, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Air Recover
[StateDef 5210]
type = A
moveType = I
physics = N
anim = 5210
ctrl = 0

[State 5210, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse((command = "holdfwd" && command != "holdback"), 4, ifElse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,1
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value  = 5200,0

[State 5210, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5210, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = ceil(8 * const(size.xscale)), ceil(-65 * const(size.yscale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(5) >= 0
value = 1

[State 5210, Land]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52



;===================<GUARD>================
;Guard Start
[StateDef 120]
type = U
physics = U
anim = 120 + (StateType = C) + (StateType = A) * 2

[State 120, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 120, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 120, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 120, VelSet]
type = VelSet
trigger1 = !Time && StateType != A
x = 0
y = 0

[State 120, Stand to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 120, Crouching to Stand]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 120, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 120, Change to Guard State]
type = ChangeState
trigger1 = !AnimTime || AILevel
value = 130 + (StateType = C) + (StateType = A) * 2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Standing Guard
[StateDef 130]
type = S
physics = S

[State 130, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[State 130, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 130, Standing to Crouch]
type = ChangeState
trigger1 = !AILevel && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

[State 130, Landing Sound]
type = PlaySnd
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
value = 52,0

[State 130, Landing Dust Expod]
type = Explod
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1


;Crouch Guarding
[StateDef 131]
type = C
physics = C

[State 131, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 131
value = 131

[State 131, Crouching to Standing]
type = ChangeState
trigger1 = !AILevel && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130

[State 131, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 131, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Air Guard
[StateDef 132]
type = A
physics = N

[State 132, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 132
value = 132

[State 132, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yAccel)

[State 132, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 132, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 132, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 132, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 132, Jumping to Standing]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 132, Change to Falling]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Guard End
[StateDef 140]
type = U
physics = U
ctrl = 1

[State 140, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 140 + (StateType = C) + (StateType = A) * 2

[State 140, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 140, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 140, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 140, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 140, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 140, End]
type = ChangeState
trigger1 = !AnimTime
value = (StateType = C) * 11 + (StateType = A) * 51


;Hit while Guarding (Standing)
[StateDef 150]
type = S
movetype = H
physics = N
velSet = 0,0

[State 150, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 150

[State 150, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 150, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
stateType = C
physics = C

[State 150, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S


;Knocked Back while Guarding (Standing)
[StateDef 151]
type = S
moveType = H
physics = S
anim = 150

[State 151, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 151, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 151, CtrlSet]
type = CtrlSet
trigger1 = time = GetHitVar(CtrlTime)
value = 1

[State 151, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 151, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 151, End]
type = ChangeState
trigger1 = HitOver
value = 130
ctrl = 1


;Hit while Guarding (Crouching)
[StateDef 152]
type = C
moveType = H
physics = N
velSet = 0,0

[State 152, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 151

[State 152, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 152, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 152, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S


;Knocked Back while Guarding (Crouching)
[StateDef 153]
type = C
moveType = H
physics = C
anim = 151

[State 153, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 153, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 153, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 153, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 153, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 153, End]
type = ChangeState
trigger1 = HitOver
value = 131
ctrl = 1


;Hit while Guarding (Jumping)
[StateDef 154]
type = A
moveType = H
physics = N
velSet = 0,0

[State 154, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 152

[State 154, End]
type = ChangeState
trigger1 = HitShakeOver
value = 155


;Knocked Back while Guarding (Jumping)
[StateDef 155]
type = A
moveType = H
physics = N
anim = 152

[State 155, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 155, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yAccel)

[State 155, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 155, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 155, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 155, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 155, End]
type = ChangeState
trigger1 = sysvar(0)
value = 52



;====================<LOSE>====================
[StateDef 170]
type = S
ctrl = 0
anim = 170
velSet = 0,0

[State 170, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 170, 0]
type = Helper
trigger1 = time = 0
pos = 0,0
postype = p1
stateno = 171
helpertype = normal
name = "Eddie Brock"
keyctrl = 0
ownpal = 1
ID = 192
bindtime = 50000
size.xscale = const(size.xscale)

;====================<LOSE EDDIE>====================
[Statedef 171]
type = S
ctrl = 0
anim = 171
velset = 0,0

[State 171, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;====================<DRAW GAME>====================
[StateDef 175]
type = S
ctrl = 0
velSet = 0,0

[State 175, ChangeState]
type = ChangeState
trigger1 = !Time
value = 170



;====================<CONTINUE?>====================
[StateDef 5500]
type = S
anim = 5500
velSet = 0,0
ctrl = 0

[State 5500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5500



;====================<INITIALIZE>====================
[StateDef 5900]
type = S

[State 5900, Purple One]
Type = ChangeState
;TriggerAll = !Time
trigger1 = Enemy, Name = "Thanos" && Enemy, AuthorName = "zvitor"
trigger2 = Enemy, Name = "Symbiote Thanos" && Enemy, AuthorName = "JARRO77"
trigger3 = Enemy, Name = "Thanos" && Enemy, AuthorName = "Alucard"
trigger4 = Enemy, Name = "Thanos" && Enemy, AuthorName = "The_None"
trigger5 = Enemy, Name = "Thanoseid" && Enemy, AuthorName = "rozeros & zvitor"
trigger6 = Enemy, Name = "Thanoseid" && Enemy, AuthorName = "zvitor"
trigger7 = Enemy, Name = "Thanos" && Enemy, AuthorName = "CPoC and Splode"
trigger8 = Enemy, Name = "Thanos" && Enemy, AuthorName = "Splode"
trigger9 = Enemy, Name = "Thanos" && Enemy, AuthorName = "Infinite"
trigger10 = enemy,name = "Thanos"
trigger11 = P2Name = "Thanos"
trigger12 = P4Name = "Thanos"
trigger13 = Enemy, Name = "Thanos" && Enemy, AuthorName = "JJKOOLAID"
Value = 510

[State 5900, Here Kitty,Kitty]
Type = ChangeState
;TriggerAll = !Time
trigger1 = Enemy, Name = "Felicia" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = Enemy, Name = "Felicia" && Enemy, AuthorName = "ahuron"
trigger3 = Enemy, Name = "Felicia" && Enemy, AuthorName = "Hernan 'KaijuuAoiro' Fuentealba"
trigger4 = Enemy, Name = "Felicia" && Enemy, AuthorName = "Jesuszilla"
trigger5 = Enemy, Name = "Felicia"  && Enemy, AuthorName = "Mgbenz"
trigger6 = P2Name = "Felicia"
trigger7 = P4Name = "Felicia"
trigger8 = Enemy, Name = "Felicia"
trigger9 = P2Name = "Black Cat"
trigger10 = P4Name = "Black Cat"
trigger11 = Enemy, Name = "Black Cat"
trigger12= Enemy, Name = "Black Cat"  && Enemy, AuthorName = "Edit: Freestyle !, Sprites: Beja, Xfields Codes: O Ilusionista, Mauteck, Eclipse"
trigger13 = Enemy, Name = "Black Cat" && Enemy, AuthorName = "JJKOOLAID"
trigger14 = Enemy, Name = "Black Cat" && Enemy, AuthorName = "Sprites: Beja, Xfields Codes: O Ilusionista, Mauteck, Eclipse"
trigger15 = Enemy, Name = "Shadowcat" && Enemy, AuthorName = "Arkady, Hypersonic & B-5"
trigger16 = Enemy, Name = "Shadowcat" && Enemy, AuthorName = "JJKOOLAID"
trigger17 = Enemy, Name = "Shadowcat"
trigger18 = Enemy, Name = "Patricia Walker - Felina"
trigger19 = Enemy, Name = "Catwoman" && Enemy, AuthorName = "Madcook"
trigger20 = Enemy, Name = "Patricia Walker - Felina"
trigger21 = Enemy, Name = "Catwoman" && Enemy, AuthorName = ""
trigger22 = Enemy, Name = "Catwoman"
trigger23 = Enemy, Name = "Cheeta" && Enemy, AuthorName = "Madcook"
trigger24 = Enemy, Name = "Cheetah" && Enemy, AuthorName = "Madcook"
trigger25 = Enemy, Name = "Cheetah" && Enemy, AuthorName = "JJKOOLAID"
trigger26 = Enemy, Name = "Cheetah" && Enemy, AuthorName = "ZVitor"
trigger27 = Enemy, Name = "Cheetah"
Value = 511

[State 5900, Can't Hide Spiderman]
Type = ChangeState
;TriggerAll = !Time
trigger1 = Enemy, Name = "Spiderman" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = P2Name = "Spiderman"
trigger3 = P4Name = "Spiderman"
trigger4 = Enemy, Name = "Spider-man"
trigger5 = P2Name = "Spider-man"
trigger6 = P4Name = "Spider-man"
trigger7 = Enemy, Name = "Spider-man"
trigger8= Enemy, Name = "Spider-man"  && Enemy, AuthorName = "Seth Zankuten"
trigger9 = Enemy, Name = "Spiderman" && Enemy, AuthorName = "Kong"
trigger10 = Enemy, Name = "Spiderman" && Enemy, AuthorName = "ZVitor"
trigger11 = Enemy, Name = "Spider-Man" && Enemy, AuthorName = "DL"
trigger12 = Enemy, Name = "SuperiorSpiderman" && Enemy, AuthorName = "bdc"
trigger13 = Enemy, Name = "Symbiote Spider-Man" && Enemy, AuthorName = "Empawk, Yunnin,shining,thatguy"
trigger14 = Enemy, Name = "Symbiote Spiderman" && Enemy, AuthorName = "JJKOOLAID"
trigger15 = Enemy, Name = "Symbiote Spiderman"   && Enemy, AuthorName = "Seth Zankuten & Sei"
trigger16 = Enemy, Name = "Symbiote Spiderman"
Value = 512

[State 5900, Too Loud Stark!]
Type = ChangeState
trigger1 = Enemy, Name = "Ironman" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = P2Name = "Iron Man"
trigger3 = P4Name = "Iron Man"
trigger4 = Enemy, Name = "Ironman"
trigger5 = P2Name = "Ironman"
trigger6 = P4Name = "Ironman"
trigger7= Enemy, Name = "Iron Man" && Enemy, AuthorName = "One Winged Angel & Unko Man"
trigger8 = Enemy, Name = "Hyper Iron Man"
trigger9 = Enemy, Name = "Ironman" && Enemy, AuthorName = "ZVitor"
trigger10 = Enemy, Name = "Ironman" && Enemy, AuthorName = "Erradicator"
trigger11 = Enemy, Name = "Ironman" && Enemy, AuthorName = "ZVitor & DC"
trigger12 = Enemy, Name = "Ironman" && Enemy, AuthorName = "OWATANKS"
trigger13 = Enemy, Name = "mkIronman" && Enemy, AuthorName = "ZVitor & wildshark"
trigger14 = Enemy, Name = "Ironman 2099" && Enemy, AuthorName = "ZVitor"
trigger15 = Enemy, Name = "Iron Man -MGMX-" && Enemy, AuthorName = "Duracelleur"
Value = 513

[State 5900,VS Avengers]
type = ChangeState
trigger1 = Enemy, Name = "Thor"  && Enemy, AuthorName = "JJKOOLAID"
Trigger2 = Enemy,Name = "Thor by Loganir and Acey" && Enemy, AuthorName = "DarkWolf13-MVC2"
trigger3 = Enemy, Name = "Thor Odinson"  && Enemy, AuthorName = "Kenshiro99"
Trigger4 = Enemy,Name = "The Mighty Thor" && Enemy, AuthorName = "Loganir & BlackDragon"
trigger5 = Enemy, Name = "MVC_Thor"  && Enemy, AuthorName = "Loganir & BlackDragon"
trigger6 = Enemy, Name = "The Mighty Thor"  && Enemy, AuthorName = "Aaron Alejandro"
trigger7 = Enemy, Name = "Hulk"
Trigger8 = Enemy,Name = "MvC2 Hulk By Kamekaze" && Enemy, AuthorName = "Kamekaze"
trigger9 = Enemy, Name = "UMVC_Hulk"&& Enemy, AuthorName = "Rel"
trigger10 = Enemy, Name = "HULK_HR" && Enemy, AuthorName = "Erradicator"
trigger11 = Enemy, Name = "Savage Hulk"
trigger12 = Enemy, Name = "Savage Hulk"  && Enemy, AuthorName = "Buyog & BobStarsky, Edited By Josh Geary"
trigger13 = Enemy, Name = "Savage Hulk by Xasor"  && Enemy, AuthorName = "Renegade"
trigger14 = Enemy, Name = "Savage Hulk" && Enemy, AuthorName = "Buyog & BobStarsky edited by ldpp"
trigger15 = Enemy, Name = "Hulk's true potential"  && Enemy, AuthorName = "Renegade + edit by coldskin1"
Trigger16 = Enemy,Name = "Orange Hulk" && Enemy, AuthorName = "One Winged Angel edited by Nodog"
trigger17 = Enemy, Name = "Monster Hulk"  && Enemy, AuthorName = "Hernan 'KaijuuAoiro' Fuentealba"
Trigger18 = Enemy,Name = "The Incredible Hulk"
trigger19 = Enemy, Name = "The Inmortal Hulk" && Enemy, AuthorName = "Marvel"
trigger20 = Enemy, Name = "Hulk" && Enemy, AuthorName = "JJKOOLAID"
trigger21 = Enemy, Name = "Hulk2" && Enemy, AuthorName = "Marvel"
trigger22 = Enemy, Name = "Black Widow" && Enemy, AuthorName = "Arkady, NIco & Hyper"
trigger23 = Enemy, Name = "Black Widow" && Enemy, AuthorName = "JJKOOLAID"
trigger24 = Enemy, Name = "MissMarvel" && Enemy, AuthorName = "Ultraroboninja & ZVitor"
trigger25 = Enemy, Name = "Miss Marvel" && Enemy, AuthorName = ""
trigger26 = Enemy, Name = "Miss Marvel" && Enemy, AuthorName = "Ultraroboninja & ZVitor"
trigger27 = Enemy, Name = "Captain Marvel" && Enemy, AuthorName = "Ultraroboninja & ZVitor"
trigger28 = Enemy, Name = "Captain Marvel" && Enemy, AuthorName = "JJKOOLAID"
trigger29 = Enemy, Name = "Captain Marvel" && Enemy, AuthorName = "ZVitor - ReSprite and Edit By Abnerrse4 - Palettes by Yolomate "
trigger30 = Enemy, Name = "MKCaptain Marvel" && Enemy, AuthorName = "ZVitor - ReSprite and Edit By Abnerrse4 - Palettes by Yolomate "
trigger31 = Enemy, Name = "Captain Marvel" && Enemy, AuthorName = "Mr.Giang"
trigger32 = Enemy, Name = "Captain America by Whiplash" && Enemy, AuthorName = "DarkWolf13-MvC2"
trigger33 = Enemy, Name = "Captain America" && Enemy, AuthorName = "Mr.Giang"
trigger34 = Enemy, Name = "Ultimate Cap" && Enemy, AuthorName = "Sic-1"
trigger35 = Enemy, Name = "Captain Marvel" && Enemy, AuthorName = "Mr.Giang"
trigger36 = Enemy, Name = "Hawkeye" && Enemy, AuthorName = "JJKOOLAID"
trigger37 = Enemy, Name = "Hawkeye" && Enemy, AuthorName = "Nicotinefist & Arkady"
trigger38 = Enemy, Name = "HawkeyeMVC"&& Enemy, AuthorName = "Kenshiro99"
trigger39 = Enemy, Name = "Rocket Racoon" && Enemy, AuthorName = "JJKOOLAID"
trigger40 = Enemy, Name = "Rocket Racoon" && Enemy, AuthorName = ""
trigger41 = Enemy, Name = "Doctor Strange" && Enemy, AuthorName = "Arkady, Angleus & Volzilla"
trigger42 = Enemy, Name = "Doctor Strange" && Enemy, AuthorName = "JJKOOLAID"
trigger43 = Enemy, Name = "Doctor Strange"&& Enemy, AuthorName = "Mr.Giang"
trigger44 = Enemy, Name = "Doctor Strange"
trigger45 = Enemy, Name = "Hawkeye" && Enemy, AuthorName = "JJKOOLAID"
trigger46 = Enemy, Name = "Hawkeye" && Enemy, AuthorName = "Nicotinefist & Arkady"
trigger47 = Enemy, Name = "HawkeyeMVC"&& Enemy, AuthorName = "Kenshiro99"
trigger48 = Enemy, Name = "Rocket Racoon" && Enemy, AuthorName = "JJKOOLAID"
trigger49 = Enemy, Name = "Rocket Racoon" && Enemy, AuthorName = ""
trigger50 = Enemy, Name = "Captain America" && Enemy, AuthorName = "JJKOOLAID"
trigger51 = Enemy, Name = "Captain America"
trigger52 = Enemy, Name = "Captain America" && Enemy, AuthorName = "Unkoman"
trigger53 = Enemy, Name = "Captain America" && Enemy, AuthorName = "Acey"
trigger54 = Enemy, Name = "CaptainAmerica"
trigger55 = Enemy, Name = "Captain America" && Enemy, AuthorName = "Dick Buckus"
trigger56 = Enemy, Name = "Scarlet Witch" && Enemy, AuthorName = "Warecus, Acey, Ark_ & ZVitor"
trigger57 = Enemy, Name = "Scarlet Witch" && Enemy, AuthorName = "Warecus, Acey, Arkady & ZVitor"
trigger58 = Enemy, Name = "Scarlet Witch" && Enemy, AuthorName = "JJKOOLAID"
trigger59 = Enemy, Name = "Ultimate Cap" && Enemy, AuthorName = "Sic-1"
trigger60 = Enemy, Name = "Black Panther" && Enemy, AuthorName = "JJKOOLAID"
trigger61 = Enemy, Name = "Black Panther" && Enemy, AuthorName = "Arkady"
trigger62 = Enemy, Name = "Black Panther" && Enemy, AuthorName = "Original - Arkady, Edit By Abnerrse4 and Yolomate"
trigger63 = Enemy, Name = "New Black Panther" && Enemy, AuthorName = "Arkady, edited by SSonic, Abnerrse4 - palettes by Yolomate"
trigger64 = Enemy, Name = "WarMachine"  && Enemy, AuthorName = "Akiraz"
trigger65 = Enemy, Name = "Jenifer Walters" && Enemy, AuthorName = "Kenshiro99"
trigger66 = Enemy, Name = "She Hulk" && Enemy, AuthorName = "Cravd, Arkady, Mistah Jorge, Shining and volzzilla"
trigger67 = Enemy, Name = "She-Hulk" && Enemy, AuthorName = "JJKOOLAID"
trigger68 = Enemy, Name = "She Hulk"
trigger69 = Enemy, Name = "WarMachine"
trigger70 = Enemy, Name = "Marvel vs. Capcom's WarMachine" && Enemy, AuthorName = "One Winged Angel"
trigger71 = Enemy, Name = "War Machine" && Enemy, AuthorName = "One Winged Angel & Unko Man"
trigger72 = Enemy, Name = "War Machine" && Enemy, AuthorName = "JJKOOLAID"
trigger73 = Enemy, Name = "War Machine"
trigger74 = Enemy, Name = "Warmachine" && Enemy, AuthorName = "Logansam"
trigger75 = Enemy, Name = "Vision"
trigger76 = Enemy, Name = "Vision"  && Enemy, AuthorName = "Slotman"
trigger77 = Enemy, Name = "Vision" && Enemy, AuthorName = "JJKOOLAID"
trigger78 = Enemy, Name = "War Machine"
trigger79 = Enemy, Name = "Vision" && Enemy, AuthorName = "Elecbyte"
trigger80 = Enemy, Name = "Vision" && Enemy, AuthorName = "Arkady"
trigger81 = Enemy, Name = "gamora"
trigger82 = Enemy, Name = "gamora" && Enemy, AuthorName = "EDITED BY YIFFERMAN 42"
trigger83 = Enemy, Name = "gamora" && Enemy, AuthorName = "JJKOOLAID"
Value = 514

[State 5900,How do you taste?]
type = ChangeState
trigger1 = Enemy, Name = "Dormammu777"  && Enemy, AuthorName = "Gladiacloud, Delusiontrim & Shinzankuro"
Trigger2 = Enemy,Name = "Ghost rider"
trigger3 = Enemy, Name = "Dormammu7777"  && Enemy, AuthorName = "Gladiacloud, Delusiontrim & Shinzankuro"
Trigger4 = Enemy,Name = "Scorpion"
trigger5 = Enemy, Name = "Devil by DarkonMK"  && Enemy, AuthorName = "DarkonMK"
trigger6 = Enemy, Name = "Mephisto"  && Enemy, AuthorName = "Pitu DMC"
trigger7 = Enemy, Name = "[o_O]'s Blackheart"  && Enemy, AuthorName = "[Hayte]"
Trigger8 = Enemy,Name = "Blackheart"
trigger9 = Enemy, Name = "Ghost Rider 2099" && Enemy, AuthorName = "KillaCroc, ZVitor"
trigger10 = Enemy, Name = "SURTUR"  && Enemy, AuthorName = "Bambulin (Bam77)"
trigger11 = Enemy, Name = "DCvsMEtrigan"  && Enemy, AuthorName = "Wucash"
trigger12 = Enemy, Name = "SURTUR"  && Enemy, AuthorName = "Bambulin (Bam77)"
trigger13 = Enemy, Name = "Spawn"  && Enemy, AuthorName = "Justinsane"
trigger14 = Enemy, Name = "spawn"  && Enemy, AuthorName = "ER / Edited by Duracelleur / reedited by ldpp / revamped by Sookie"
trigger15 = Enemy, Name = "hjhghg"  && Enemy, AuthorName = ""
Trigger16 = Enemy,Name = "Hellboy"
trigger17 = Enemy, Name = "Darkon by DarkonMK"  && Enemy, AuthorName = "DarkonMK"
Trigger18 = Enemy,Name = "Netherealm Scorpion"
trigger19 = Enemy, Name = "Lilith Aensland" && Enemy, AuthorName = "JJKOOLAID"
trigger20 = Enemy, Name = "Morrigan Aensland" && Enemy, AuthorName = "JJkoolaid"
trigger21 = Enemy, Name = "Morrigan" && Enemy, AuthorName = "KAZ"
trigger22 = Enemy, Name = "Master Morrigan" && Enemy, AuthorName = "KAZ"
Trigger23 = Enemy,Name = "Ghost rider" && Enemy, AuthorName = "JJKOOLAID"
Value = 515

[State 5900, We don't hate you,Ultron]
Type = ChangeState
trigger1 = Enemy, Name = "Ultron" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = P2Name = "Ultron"
trigger3 = P4Name = "Ultron"
trigger4 = Enemy, Name = "Ultron"
trigger5 = Enemy, Name = "Ultron"
trigger6 = Enemy, Name = "Ultron" && Enemy, AuthorName = "McCready, Enzo, Magus & Scruffydragon + Mugenesis Team"
trigger7 = Enemy, Name = "Ultron_X" && Enemy, AuthorName = "Xasor"
Value = 516

[State 5900, Frank West]
Type = ChangeState
trigger1 = Enemy, Name = "Frank West" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = P2Name = "Frank West"
trigger3 = P4Name = "Frank West"
trigger4 = Enemy, Name = "Frank West"
trigger6 = Enemy, Name = "Frank West Arr" && Enemy, AuthorName = "Kamekaze/EDIT by SUPERFERNNADOXT"
trigger7 = Enemy, Name = "Frank West Arr" && Enemy, AuthorName = "Kamekaze"
Value = 517

[State 5900, Women with Guns]
Type = ChangeState
trigger1 = Enemy, Name = "Michelle Heart" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = Enemy, Name = "Michelle Heart" && Enemy, AuthorName = "Gladiacloud & Beximus"
trigger3 = Enemy, Name = "Michelle Heart Redux" && Enemy, AuthorName = "Gladiacloud, Beximus & Shinzankuro"
trigger4 = Enemy, Name = "Saki Omokane" && Enemy, AuthorName = "Gladiacloud & Beximus"
trigger5 = Enemy, Name ="Saki Omokane" && Enemy, AuthorName = "DarkWolf13-MVC2"
trigger6 = Enemy, Name = "Saki Omokane" && Enemy, AuthorName = "JJKOOLAID"
trigger7 = Enemy, Name = "Saki Omokane by Gladiacloud & Beximus" && Enemy, AuthorName = "DarkWolf13-MvC2"
trigger8 = Enemy, Name = "Trish"
trigger9 = Enemy, Name = "Trish"  && Enemy, AuthorName = "Nexus Games"
trigger10 = Enemy, Name = "Trish" && Enemy, AuthorName = "JJKOOLAID"
trigger11 = Enemy, Name = "Trish" && Enemy, AuthorName = "Arumikan"
trigger12 = Enemy, Name = "devilot" && Enemy, AuthorName = "Beximus"
trigger13 = Enemy, Name = "MVC_Devilotte" && Enemy, AuthorName = "Li-Kun & Beximus (original)"
trigger14 = Enemy, Name = "Devilotte de Deathsatan IX" && Enemy, AuthorName = "Beximus and Kenshiro99"
trigger15 = Enemy, Name = "Devilotte" && Enemy, AuthorName = "JJKOOLAID"
trigger16 = Enemy, Name = "Yoko Littner"
trigger17 = Enemy, Name = "Yoko" && Enemy, AuthorName = "Warusaki3 & Cruz"
trigger18 = Enemy, Name = "Yoko Littner" && Enemy, AuthorName = "Gknux"
trigger19 = Enemy, Name = "Yoko Littner" && Enemy, AuthorName = "G.knux19"
trigger20 = Enemy, Name = "Yoko Littner" && Enemy, AuthorName = "JJKOOLAID"
trigger21 = Enemy, Name = "Yoko" && Enemy, AuthorName = "Nexus Games"
trigger22 = Enemy, Name = "Yoko"
trigger23 = Enemy, Name = "2B"
Value = 518

[State 5900, Ultron Sigma]
Type = ChangeState
trigger1 = Enemy, Name = "Sigma" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = P2Name = "Ultron Sigma"
trigger3 = P4Name = "Ultron Sigma"
trigger4 = P2Name = "Sigma"
trigger5 = P4Name = "Sigma"
trigger6 = Enemy, Name = "Ultron Sigma" && Enemy, AuthorName = "JJKOOLAID"
trigger7 = Enemy, Name = "Sigma" && Enemy, AuthorName = "Hunter_eXe"
trigger8 = Enemy, Name = "Giant sigma W" && Enemy, AuthorName = "cesarsombra"
trigger9 = Enemy, Name = "Sigma" && Enemy, AuthorName = "±Ù»î - JOJO Fu"
trigger10 = Enemy, Name = "Infinity Sigma" && Enemy, AuthorName = "RedLine//Magma Dragoon MK II"
trigger11 = Enemy, Name = "Sigma x5" && Enemy, AuthorName = "Jeff Locos"
trigger12 = Enemy, Name = "sigmax5" && Enemy, AuthorName = "SebbJara"
trigger13 = Enemy, Name = "Eregion BG"&& Enemy, AuthorName = "Arcadedemo"
Value = 519

[State 5900, Villians]
Type = ChangeState
trigger1 = Enemy, Name = "Magneto" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = Enemy, Name = "Magneto"
trigger3 = Enemy, Name = "Magneto by Kong" && Enemy, AuthorName = "DarkWolf13-MvC2"
trigger4 = Enemy, Name = "Dr.Doom" && Enemy, AuthorName = "JJKOOLAID"
trigger5 = Enemy, Name = "DrDoom"
trigger6 = Enemy, Name = "Marvel vs Capcom - Eternity of Heroes: Dr.Doom" && Enemy, AuthorName = "DCL"
trigger7 = Enemy, Name = "Dr. Doom by WhiteMagic2002" && Enemy, AuthorName = "WhiteMagic2002"
trigger8 = Enemy, Name = "Dr.Doom" && Enemy, AuthorName = "MSHR-Infinite"
trigger9 = Enemy, Name = "Dr.Doom"
trigger10 = Enemy, Name = "Doctor Doom" && Enemy, AuthorName = "DCL"
trigger11 = Enemy, Name = "Doctor Doom"
trigger12 = Enemy, Name = "MvC2 Doom By Kamekaze" && Enemy, AuthorName = "Kamekaze"
trigger13 = Enemy, Name = "Dormammu"  && Enemy, AuthorName = "Gladiacloud, Delusiontrim & Shinzankuro"
trigger14 = Enemy, Name = "Dormammu"  && Enemy, AuthorName = "Gladiacloud, Delusiontrim & Shinzankuro"
trigger15 = Enemy, Name = "Dormammu"  && Enemy, AuthorName = "JJKOOLAID"
trigger16 = Enemy, Name = "Blackheart"
trigger17 = Enemy, Name = "Blackheart SxP" && Enemy, AuthorName = "Beximus"
trigger18 = Enemy, Name = "Blackheart"  && Enemy, AuthorName = "JJKOOLAID"
trigger19 = Enemy, Name = "Mephisto"
trigger20 = Enemy, Name = "Apocalypse" && Enemy, AuthorName = "JJKOOLAID"
trigger21 = Enemy, Name = "Apocalypse" && Enemy, AuthorName = "RobiWanKen0bi & MMV Team"
trigger22 = Enemy, Name = "Apocalypse" && Enemy, AuthorName = "marvel"
Value = 523

[State 5900, Powerless Characters]
Type = ChangeState
trigger1 = Enemy, Name = "Regina" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = Enemy, Name = "Regina" && Enemy, AuthorName = "PizzaHighFive, ER & ZVitor"
trigger3 = Enemy, Name = "Ada Wong" && Enemy, AuthorName = "JJKOOLAID"
trigger4 = Enemy, Name = "Chris Redfield" && Enemy, AuthorName = "Riklaionel, & Nestor"
trigger5 = Enemy, Name = "Chris Redfield" && Enemy, AuthorName = "JJKOOLAID"
trigger6 = Enemy, Name = "Chris Redfield" && Enemy, AuthorName = "Kenshiro99"
trigger7 = Enemy, Name = "Chris Redfield"
trigger8 = Enemy, Name = "Chris Redfield"  && Enemy, AuthorName = "Riklaionel, & Nestor (Update by FlavioCamarao)"
trigger9 = Enemy, Name = "Chris Redfield"  && Enemy, AuthorName = "FlavioCamarao"
trigger10 = Enemy, Name = "Leon" && Enemy, AuthorName = "wou"
trigger11 = Enemy, Name = "Leon" && Enemy, AuthorName = "Shin Ken Master"
trigger12 = Enemy, Name = "Leon" && Enemy, AuthorName = "armin_iuf"
trigger13 = Enemy, Name = "Leon" && Enemy, AuthorName = "Nexus Games"
trigger14 = Enemy, Name = "Leon S. Kennedy" && Enemy, AuthorName = "wou"
trigger15 = Enemy, Name = "Leon Kennedy" && Enemy, AuthorName = "JJKOOLAID"
trigger16 = Enemy, Name = "LEON!!! HAAAALP!!!" && Enemy, AuthorName = "Brergrsart"
trigger17 = Enemy, Name = "ada" && Enemy, AuthorName = "armin_iuf"
trigger18 = Enemy, Name = "AdaWong" && Enemy, AuthorName = "FLAVIO CAMARAO"
trigger19 = Enemy, Name = "claire redfield" && Enemy, AuthorName = "armin_iuf"
trigger20 = Enemy, Name = "claire redfield" && Enemy, AuthorName = "JJKOOLAID"
trigger21 = Enemy, Name = "rebecca" && Enemy, AuthorName = "armin_iuf"
trigger22 = Enemy, Name = "rebecca chambers" && Enemy, AuthorName = "JJKOOLAID"
trigger23 = Enemy, Name = "carlos" && Enemy, AuthorName = "armin_iuf"
trigger24 = Enemy, Name = "carlos oliveira" && Enemy, AuthorName = "JJKOOLAID"
trigger25 = Enemy, Name = "Barry" && Enemy, AuthorName = "armin_iuf"
trigger26 = Enemy, Name = "Barry Burton" && Enemy, AuthorName = "JJKOOLAID"
trigger27 = Enemy, Name = "Hunk"
trigger28 = Enemy, Name = "Hunk" && Enemy, AuthorName = "JJKOOLAID"
trigger29 = Enemy, Name = "Punisher"
trigger30 = Enemy, Name = "the Punisher" && Enemy, AuthorName = "aPoCaLyPsE"
trigger31 = Enemy, Name = "Punisher" && Enemy, AuthorName = "JJKOOLAID"
trigger32 = Enemy, Name = "Punisher by RAHLONNIR" && Enemy, AuthorName = "RAHLONNIR"
Value = 524

[State 5900, Vs Carnage]
Type = ChangeState
trigger1 = Enemy, Name = "Carnage" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = Enemy, Name = "Carnage" && Enemy, AuthorName = "PizzaHighFive, ER & ZVitor"
trigger3 = Enemy, Name ="Carnage" && Enemy, AuthorName = "theFuTuR3 & T.O.P.S"
trigger4 = Enemy, Name = "Carnage_MMV" && Enemy, AuthorName = "theFuTuR3 & T.O.P.S"
trigger5 = Enemy, Name = "Carnage" && Enemy, AuthorName = "Seth Zankuten"
trigger6 = Enemy, Name = "Carnage" && Enemy, AuthorName = "Pizzahighfive, theFuTuR3 & T.O.P.S"
trigger7 = Enemy, Name = "Carnage"&& Enemy, AuthorName = "angelus-silverhead and YoungSamurai5"
trigger8 = Enemy, Name = "Carnage by XASOR" && Enemy, AuthorName = ""
trigger9 = Enemy, Name = "Carnage_MMV" && Enemy, AuthorName = "zako"
trigger10 = Enemy, Name = "Carnage_SW" && Enemy, AuthorName = "theFuTuR3 & T.O.P.S"
trigger11 = Enemy, Name = "Carnage"
Value = 525

[State 5900, Vs Screamers]
Type = ChangeState
trigger1 = Enemy, Name = "Black Canary" && Enemy, AuthorName = "JJKOOLAID"
trigger2 = Enemy, Name = "Black Canary" && Enemy, AuthorName = "Ultraroboninja & ZVitor"
trigger3 = Enemy, Name ="Banshee"
trigger4 = Enemy, Name = "Banshee" && Enemy, AuthorName = "Acey & Arkady"
trigger5 = Enemy, Name = "Banshee" && Enemy, AuthorName = "Acey"
trigger6 = Enemy, Name = "Silver banshee" && Enemy, AuthorName = "Animaraz, GM Spectre y Jhonny_DC"
trigger7 = Enemy, Name = "silverbanshee" && Enemy, AuthorName = "Magus"
trigger8 = Enemy, Name = "Queen Sindel" && Enemy, AuthorName = "Mathri"
trigger9 = Enemy, Name = "Sindel" && Enemy, AuthorName = "JJKOOLAID"
trigger10 = Enemy, Name = "Sindel" && Enemy, AuthorName = "Rusher"
Value = 526

[State 5900, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = 190 + (Random % 4)

[State 5900, End]
type = ChangeState
trigger1 = 1
value = 0

;====================<INTRO 1>====================
[StateDef 190]
type = S
physics = S
anim = 190

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 0]
type = Helper
trigger1 = time = 0
pos = 0,0
postype = p1
stateno = 300;192
helpertype = normal
name = "Eddie Brock"
keyctrl = 0
ownpal = 1
ID = 300;192
bindtime = 50000
size.xscale = const(size.xscale)

[State 190, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 190,0+random%2
volume = 255
volumescale = 255
channel = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<INTRO 2>====================
[StateDef 191]
type = S
physics = S
anim = 192

[State 191, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 2]
type = PlaySnd
trigger1 = time = 0
value = 191,0+random%3
volume = 255
volumescale = 255
channel = 0

[State 191, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<INTRO 3>====================
[StateDef 192]
type = S
physics = S
anim = 193
ctrl = 0

[State 192, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, 2]
type = PlaySnd
trigger1 = time = 0
value = 193,0
volume = 255
volumescale = 255
channel = 0

[State 192, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO 4>====================
[StateDef 193]
type = S
physics = S
anim = 194

[State 193, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193, 2]
type = PlaySnd
trigger1 = time = 0
value = 193,1+random%2
volume = 255
volumescale = 255
channel = 0

[State 193, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<INTRO VS THANOS>====================
[StateDef 510]
type = S
physics = S
anim = 500
ctrl = 0

[State 510, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 510, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,0
volume = 255
volumescale = 255
channel = 0

[State 510, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS CATS CHARACTERS>====================
[StateDef 511]
type = S
moveType = I
physics = N
anim = 510
ctrl = 0

[State 511, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 511, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,1
volume = 255
volumescale = 255
channel = 0

[State 511, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS SPIDERMAN>====================
[StateDef 512]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 512, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 512, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,2
volume = 255
volumescale = 255
channel = 0

[State 512, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS IRONMAN>====================
[StateDef 513]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 513, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 513, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,3
volume = 255
volumescale = 255
channel = 0

[State 513, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS AVENGERS>====================
[StateDef 514]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 514, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 514, 2]
type = PlaySnd
trigger1 = time = 0
value = 194,0+random%3
volume = 255
volumescale = 255
channel = 0

[State 514, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS HELL SPAWNS>====================
[StateDef 515]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 515, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 515, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,5
volume = 255
volumescale = 255
channel = 0

[State 515, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS ULTRON>====================
[StateDef 516]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 516, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 516, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,9
volume = 255
volumescale = 255
channel = 0

[State 516, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS WEST>====================
[StateDef 517]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 517, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 517, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,8
volume = 255
volumescale = 255
channel = 0

[State 517, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS WOMEN WITH BIG GUNS>====================
[StateDef 518]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 518, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 518, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,6
volume = 255
volumescale = 255
channel = 0

[State 518, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS ULTRON SIGMA>====================
[StateDef 519]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 519, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 519, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,10
volume = 255
volumescale = 255
channel = 0

[State 519, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS VILLIANS>====================
[StateDef 523]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 523, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 523, 2]
type = PlaySnd
trigger1 = time = 0
value = 192,11
volume = 255
volumescale = 255
channel = 0

[State 523, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS POWERLESS CHARACTERS>====================
[StateDef 524]
type = S
moveType = I
physics = N
anim = 193
ctrl = 0

[State 524, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 524, 2]
type = PlaySnd
trigger1 = time = 0
value = 3400,0
volume = 255
volumescale = 255
channel = 0

[State 524, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS CARNAGE>====================
[StateDef 525]
type = S
moveType = I
physics = N
anim = 503
ctrl = 0

[State 525, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 525, 2]
type = PlaySnd
trigger1 = animelem = 2
value = 192,12
;volumescale = 255
channel = 0

[State 525, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO VS SCREAMERS>====================
[StateDef 526]
type = S
moveType = I
physics = N
anim = 500
ctrl = 0

[State 526, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 526, 2]
type = PlaySnd
trigger1 = time = 0
value = 182,0
volume = 255
volumescale = 255
channel = 0

[State 526, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====================<INTRO POSE>====================
[Statedef 300]
type = S
ctrl = 0
anim = 191
velset = 0,0
sprpriority = 1

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent,stateno !=190

;====================<TURNS INTRO>====================
[StateDef 6900]
type = A
anim = 42
velSet = 0,0
ctrl = 0

[State 6900, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6900, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6900, PosSet]
type = PosSet
trigger1 = !Time
x = (-320 + abs(pos x)) * Facing

[State 6900, VelSet]
type = VelSet
trigger1 = !Time
x = (Helper(8999), RootDist x) / -40.0
y = -10.25

[State 6900, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = pos y > -vel y
value = 6901

;Landing
[StateDef 6901]
type = S
physics = S
anim = 6901
velSet = 0,0

[State 6901, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6901, PosSet]
type = PosSet
trigger1 = !Time && NumHelper(8999)
x = ceil(Helper(8999), pos x)

[State 6901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 6901, Landing Dust Expod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6901, Voice 1]
type = PlaySnd
trigger1 = time = 2
value = 193,0
volume = 255
volumescale = 255
channel = 0

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<WIN POSE DECIDER>====================
[StateDef 180]
type = S

[State 180, Generic Victory Quote (Normal/Master mode)]
type = VictoryQuote
trigger1 = 1
value = Random % 78

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdstart" || command = "holdb"
value = 181

[State 180, Win 2]
type = ChangeState
trigger1 = command = "holdx" || command = "holdc"
value = 182

[State 180, Win 3]
type = ChangeState
trigger1 = command = "holdy" || command = "holdz"
value = 183

[State 180, Win 4]
type = ChangeState
trigger1 = command = "holda"
value = 184

[State 180, Win Decider]
type = ChangeState
trigger1 = 1
value = 181 + (Random % 4)

;====================<WIN 1>====================
[StateDef 181]
type = S
physics = S
anim = 181
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, 0]
type = Helper
trigger1 = time = 0
pos = 0,0
postype = p1
stateno = 301
helpertype = normal
name = "Eddie Brock"
keyctrl = 0
ownpal = 1
ID = 192
bindtime = 50000
size.xscale = const(size.xscale)

[State 181, 2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 180,0+random%2
volume = 255
volumescale = 255
channel = 0

;====================<WIN 2>====================
[StateDef 182]
type = S
physics = S
anim = 182
ctrl = 0

[State 182, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 182, 0]
type = Helper
trigger1 = time = 0
pos = 0,0
postype = p1
stateno = 302
helpertype = normal
name = "Eddie Brock"
keyctrl = 0
ownpal = 1
ID = 192
bindtime = 50000
size.xscale = const(size.xscale)

[State 182, 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 181,1+random%2
volume = 255
volumescale = 255
channel = 0

;====================<WIN 3>====================
[StateDef 183]
type = S
physics = S
anim = 185
ctrl = 0

[State 183, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 670
flag = RoundNotOver

[State 183, 2]
type = PlaySnd
trigger1 = AnimElem = 1
value = 182,0
volume = 255
volumescale = 255
channel = 0

[State 183, Explod]
type = Explod
trigger1 = time = 225;0
anim = 501
pos = 0,0
;pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
;vfacing = -1
;scale = 1,1
scale = .82,1.07
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 0

[State 183, Explod]
type = Explod
trigger1 = time = 200;100
anim = 502
pos = 0,0
postype = right  ;p2,front,back,left,right
facing = 1
;vfacing = -1
scale = 50,50
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0

;====================<WIN 4>====================
[StateDef 184]
type = S
physics = S
anim = 186
ctrl = 0

[State 184, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 184, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 181,0
volume = 255
volumescale = 255
channel = 0

[State 184, 1]
type = Explod
trigger1 = AnimElem = 2
anim = 3014
ID = 301423
pos = 0,0
postype = right
bindtime = 1
ownpal = 1
;removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
;scale = const(size.xscale),1
scale = 2,2
ontop = 1

[State 184, 1]
type = Explod
trigger1 = AnimElem = 2
anim = 3014
ID = 301423
pos = 0,0
postype = right
bindtime = 1
ownpal = 1
;removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
;scale = const(size.xscale),1
scale = 2,2
ontop = 1

[State 184, 1]
type = Explod
;trigger1 = !time
trigger1 = AnimElem = 2
anim = 3014
ID = 301423
pos = 0,0
postype = right
bindtime = 1
ownpal = 1
;removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
;scale = const(size.xscale),1
scale = 2,2
ontop = 1

[State 184, 1]
type = Explod
trigger1 = AnimElem = 2
anim = 3014
ID = 301423
pos = 0,0
postype = right
bindtime = 1
ownpal = 1
;removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing=-1
vfacing = -1
;scale = const(size.xscale),1
scale = 2,2
ontop = 1

[State 184, 1]
type = PlaySnd
trigger1 = AnimElem = 2
;trigger1 = !time
value = 20,1

;====================<WIN POSE>====================
[Statedef 301]
type = S
ctrl = 0
anim = 183
velset = 0,0

[State 301, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;====================<WIN POSE 2>====================
[Statedef 302]
type = s
ctrl = 0
anim = 184
velset = 0,0

[State 302, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;==========<TAUNT>==========
[StateDef 195]
type = S
moveType = I
physics = S
anim = 195
velSet  = 0,0
sprPriority = 1
ctrl = 0

[State 195, Taunt Decider]
type = ChangeState
trigger1 = command = "start" && command = "holddown"
value = 196

[State 195, Taunt Decider]
type = ChangeState
trigger1 = command = "start" && command = "holdfwd"
value = 197

[State 195, 0]
type = Helper
trigger1 = time = 0
pos = 0,0
postype = p1
stateno = 305
helpertype = normal
name = "Eddie Brock"
keyctrl = 0
ownpal = 1
ID =305
bindtime = 50000
size.xscale = const(size.xscale)

[State 195]
type = PlaySnd
trigger1 = AnimElem = 10
value = 196,0+random%2
volume = 255
volumescale = 255
channel = 0

[State 195, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;==========<TAUNT 2>==========
[StateDef 196]
type = S
moveType = I
physics = S
anim = 196
velSet  = 0,0
sprPriority = 1
ctrl = 0

[State 196]
type = PlaySnd
trigger1 = time = 0
value = 195,1+random%2
volume = 255
volumescale = 255
channel = 0

[State 196, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;==========<TAUNT 3>==========
[StateDef 197]
type = S
moveType = I
physics = S
anim = 197
velSet  = 0,0
sprPriority = 1
ctrl = 0

[State 197]
type = PlaySnd
trigger1 = time = 0
value = 195,0
volume = 255
volumescale = 255
channel = 0

[State 197, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;==========<TAUNT POSE>==========
[Statedef 305]
type = S
ctrl = 0
anim = 199
velset = 0,0

[State 305, 1]
type = BindToParent
trigger1 = 1
time = 1
pos = 0,0
;ignorehitpause = 0
;persistent = 1

[State 305, 1]
type = DestroySelf
trigger1 = Animtime = 0 || parent, stateno !=195
;ignorehitpause = 0
;persistent = 1

;====================<CHEAP K.O.>====================
[StateDef 5950]
type = S
moveType = H
physics = S
anim = 5950
velSet = 0,0

[State 5950, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5950, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5950, Assert: NoKOsnd]
type = AssertSpecial
trigger1 = 1
flag = NoKOsnd

[State 5950, StopSnd]
type = StopSnd
trigger1 = !Time && !Alive
channel = 0

[State 5950, KO Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && !Alive
value = 5950,0

[State 5981, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = F7,0

[State 5981, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 10
anim = F60
posType = P1
pos = 0,0
sprPriority = -3

[State 5950, End]
type = ChangeState
trigger1= !AnimTime
value = ifElse(Alive, 5110, 5150)




;====================<AIR HIT TRANSITION>====================
[Statedef 5035]
type = A
movetype = H
physics = N

[State 5035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim = [5000,5029]
value = 5035

[State 5035, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5035, Recover]
type = ChangeState
triggerAll = !HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5040

[State 5035, Fall]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5050



;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[StateDef -2]

;#ADD004BASIC PIEs#
;##[a4b_-2_start.v20200523]##
;//==========================
;// add004-sctrls-start
;//==========================
;sys::-2::partners_standby ; ???????
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	;;---
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(??)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(??)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(??????)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(??)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; ??????
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ?????
[state 0]
	type=helper
	triggerall=!ishelper && !numhelper(90900)
	trigger1=numpartner
	trigger1=id<(partner,id) && partner,numhelper(90900)=0
	trigger2=!numpartner
	id=90900
	stateno=90900
	helpertype=normal
	ownpal=1
;op;	size.ground.front=###
;op;	size.ground.back=###
	size.air.front=2108130 ;; <<-version
;op;	size.air.back=###
	size.height=0 ;; 1;; <<-powerbar off mode
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	;---
;op;	size.xscale=0
;op;	size.yscale=0
	;---
	pos=0,88888

;sys::-2::get_helper::bar004_id ; ID??
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=(helper(90900),id)

;sys::-2::get_players_id2
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=(partner,sysfvar(0)))
	sysfvar(0)=(partner,sysfvar(0))

;sys::-2::bk/jd_system ; ?????/????D
[state 0]
	type=hitoverride
	triggerall=!ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	trigger1=numprojid(195502)||numprojid(195503)
	trigger2=numpartner
	trigger2=partner,numprojid(195502)||partner,numprojid(195503)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1


;//==========================
;//==========================
;;>>@Config.Face>>
;sys::-2::face_d_mod
[state 0]
	type=removeexplod
	trigger1=roundstate!=2 || (stateno=5150 && time=5 && !alive)
	trigger2=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger2=(playerid(floor(sysfvar(0))),var(0)=90900)
	trigger2=!(playerid(floor(sysfvar(0))),var(9)&4) || (playerid(floor(sysfvar(0))),var(9)&262144)
	id=490600
	ignorehitpause=1

;sys::-2::face_d_main ; portrait (?)
[state 0]
	type=explod
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909002)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0))) && roundstate=2
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490600)
	trigger1=id=playerid(floor(sysfvar(0))),var(15)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909002
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(20))), floor(const240p(playerid(floor(sysfvar(0))),fvar(22)))
	scale=playerid(floor(sysfvar(0))),fvar(24), playerid(floor(sysfvar(0))),fvar(26)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(32))
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(28))/1000, floor(playerid(floor(sysfvar(0))),fvar(28))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;;sys::-2::face_d_partner_#+option
[state 0]
	type=explod
	trigger1=numpartner
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909001)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0))) && roundstate=2
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490601+(gametime%numpartner))
	trigger1=(id+numpartner+1-playerid(floor(sysfvar(0))),var(15))%(numpartner+1)=(gametime%numpartner)+1
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909001
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(21) +playerid(floor(sysfvar(0))),fvar(34)*(gametime%numpartner) )), floor(const240p(playerid(floor(sysfvar(0))),fvar(23) +playerid(floor(sysfvar(0))),fvar(35)*(gametime%numpartner) ))
	scale=playerid(floor(sysfvar(0))),fvar(25) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner), playerid(floor(sysfvar(0))),fvar(27) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(33))+(gametime%numpartner)*10
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(29))/1000, floor(playerid(floor(sysfvar(0))),fvar(29))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;#Options_Char_Name
;sys::-2::name_d_main_left&right
[state 0]
	type=explod
	trigger1=numexplod(490600)=1 && selfanimexist(909010+teamside)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && id=playerid(floor(sysfvar(0))),var(15)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909010+teamside
	space=screen
	postype=left
	facing=1
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(10))), floor(const240p(playerid(floor(sysfvar(0))),fvar(12)))
	scale=playerid(floor(sysfvar(0))),fvar(14), playerid(floor(sysfvar(0))),fvar(16)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(32))+2
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(18))/1000, floor(playerid(floor(sysfvar(0))),fvar(18))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;;sys::-2::name_d_partner_#left&right
[state 0]
	type=explod
	trigger1=numpartner
	trigger1=numexplod(490600)=1 && selfanimexist(909010+teamside)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490601+(gametime%numpartner))
	trigger1=(id+numpartner+1-playerid(floor(sysfvar(0))),var(15))%(numpartner+1)=(gametime%numpartner)+1
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909010+teamside
	space=screen
	postype=left
	facing=1
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(11) +playerid(floor(sysfvar(0))),fvar(34)*(gametime%numpartner) )), floor(const240p(playerid(floor(sysfvar(0))),fvar(13) +playerid(floor(sysfvar(0))),fvar(35)*(gametime%numpartner) ))
	scale=playerid(floor(sysfvar(0))),fvar(15) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner), playerid(floor(sysfvar(0))),fvar(17) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(33))+(gametime%numpartner)*10+3
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(19))/1000, floor(playerid(floor(sysfvar(0))),fvar(19))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;//==========================
;;>>@Config.Camera>>
;sys::-2::camera_nc ; ????
[state 0]
	type=screenbound
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	movecamera=0,0
	ignorehitpause=1
;sys::-2::camera_np
[state 0]
	type=playerpush
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	ignorehitpause=1
;sys::-2::camera_nc2
[state 0]
	type=screenbound
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==========================
;sys::-2::add.option2-noko
[state 0] ;; opt-noko
	type=assertspecial
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && (playerid(floor(sysfvar(0))),var(9)&65536) ;; opt-noko
	flag=noko
	ignorehitpause=1
;sys::-2::add.option3-life-mod
[state 0] ;; opt-life-mod
	type=lifeadd
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && playerid(floor(sysfvar(0))),var(23)!=0 ;; opt-mod-life
	value=playerid(floor(sysfvar(0))),var(23)
	kill=0
	ignorehitpause=1

;//==========================
;// optional settings
;sys::-2::guard_crush_fx ; ????????
[state 0]
	type=palfx
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (gametime%5=0) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=800
	time=2
	add=200,0,0
;sys::-2::guard_crush_cs
[state 0]
	type=changestate
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=1000
	value=190010
	ignorehitpause=1
;;--- dizzy
;sys::-2::goto-dizzy_s/c
[state 0] ;[.03-2d1]
	type=selfstate
	trigger1=(stateno=5001 || stateno=5011) && hitover      && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195201;; (goto-dizzy:190116)
;sys::-2::goto-dizzy_a/l
[state 0] ;[.03-2d2]
	type=selfstate
	trigger1=(stateno=5030 || stateno=5071) && hitshakeover && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195050
;sys::-2::goto-dizzy_fd
[state 0] ;[.03-2e1]
	type=selfstate
	trigger1=(stateno=[5110,5111]) && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195110
;;--- fadeout when KOed ; KO????
;sys::-2::st5150-1
[state 0]
	type=varset
	trigger1=stateno=5150 && time=1 && alive=0 && !ishelper && numpartner
	sysvar(1)=(roundstate<=2)
;sys::-2::st5150-2
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && sysvar(1) && (((time=[80,150]) && time%10<5) || time>150)
	flag=invisible
	flag2=noshadow
;;--- intro-pos-reset
;;--- <<IKEMEN????>>
;sys::-2::st5900-f
[state 0]
	type=turn
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && facing=ifelse(teamside=1,-1,1)
;sys::-2::st5900-pp3
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && playeridexist(id-2)
	trigger1=playerid(id-2),ishelper=0 && playerid(id-2),teamside=teamside
	x=const240p(120)*ifelse(teamside=1,-1,1)
;sys::-2::st5900-pp4
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>2 && playeridexist(id-3)
	trigger1=playerid(id-3),ishelper=0 && playerid(id-3),teamside=teamside
	x=const240p(145)*ifelse(teamside=1,-1,1)
;//==========================
;// add004-sctrls-end
;//==========================
;##[a4b_-2_end]##


[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Combo]
type = VarSet
trigger1 = enemy, ctrl || enemy, statetype = L;movehit || projhit = 1
fvar(25) = -1
ignorehitpause = 1

[State -2, Combo]
type = VarSet
triggerall = p2movetype = H
trigger1 = projhit1005 = 1 ;|| projhit3300 = 1 || projhit3500 = 1; || projhit1108 = 1
fvar(25) = 1
ignorehitpause = 1

[State -2, Combo]
type = VarSet
triggerall = p2movetype = H && enemy, statetype != L
trigger1 = projhit1005 = 1
fvar(25) = 2
ignorehitpause = 1

[State -2, Combo]
type = VarSet
triggerall = p2movetype = H && enemy, statetype != L
trigger1 = projhit3500 = 1
fvar(25) = 3
ignorehitpause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = Movecontact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = Movecontact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Combo]
type = VarSet
;triggerall = p2movetype = H
trigger1 = projguarded = 1
fvar(25) = 6
ignorehitpause = 1

[State -2, Spark]
type = Helper
triggerall = projcontact = 1
triggerall = numhelper(8000) < 1 && !enemy, hitshakeover && !var(29)
trigger1 = fvar(25) = 1 || fvar(25) = 2 || fvar(25) = 3 || fvar(25) = 5 || fvar(25) = 6
helperType = Normal
stateNo = ifElse(fvar(25) = 6, 8001, 8013);ifelse(fvar(25) = 2, 8015,8013))
ID = 8000
name = "Spark"
posType = P2
;pos = ceil(ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(35), ceil(p2dist x), var(35))) * const(size.xscale)), ceil(var(36) * const(size.yscale))
pos = 0, 0;var(12);-100;0;-60
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(9)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter Flag]
type = VarSet
trigger1 = NumEnemy
var(9) = (EnemyNear, MoveType = A)
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

[State -2, P2 Facing]
type = TargetFacing
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && !(Target, HitFall) && (Target, Time <= 1)
trigger2 = MoveContact = 1 && NumTarget(1232)
trigger2 = !(Target, HitShakeOver) && (Target, Time <= 1)
value = ifElse(P2Dist x >= 0, -1, 1)
ignoreHitPause = 1

[State -2, P2 Safe Fall]
type = TargetState
trigger1 = NumTarget = 1
trigger1 = Target, command = "recovery"
trigger1 = Target, pos y >= -48 && Target, vel y > 0
trigger1 = Target, Alive && Target, HitFall && Target, GetHitVar(fall.recover)
trigger1 = Target, StateNo = 5030 || Target, StateNo = 5035 || Target, StateNo = 5050 || Target, StateNo = 5071
value = 5205
ignoreHitPause = 1

[State -2, Assert: UnGuardable]
type = AssertSpecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) - 1)
flag = UnGuardable
ignoreHitPause = 1

[State -2, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 1)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(0), Time >= 1)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Custom Combo End]
type = VarSet
trigger1 = var(20) < 0
trigger2 = MoveType = H
trigger3 = RoundState != 2
trigger4 = (StateNo = [3000,4999])
var(20) = 0
ignoreHitPause=1

[State -2, Custom Combo Time]
type = VarAdd
trigger1 = var(20) > 0
var(20) = -1
ignoreHitPause = 1

[State -2, Custom Combo Asserts]
type = AssertSpecial
trigger1 = var(20) > 0
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) = [1,60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignoreHitPause = 1

[State -2, Throws Allowed]
type = VarSet
trigger1 = EnemyNear, MoveType != H
trigger1 = EnemyNear, StateNo != 140
trigger1 = (EnemyNear, ctrl && EnemyNear, Time >= 1) || (EnemyNear, Time >= 8)
trigger2 = EnemyNear, MoveType = A
trigger3 = (EnemyNear, StateNo != [0,52]) && (EnemyNear, StateNo != [120,155]) && (EnemyNear, StateNo != [5000,5120])
trigger4 = var(20) || var(21) || var(22)
var(38) = 0

[State -2, Throws Disallowed]
type = VarSet
triggerAll = NumEnemy
trigger1 = EnemyNear, StateNo = [150,155]
trigger2 = (EnemyNear, StateNo = 51 || EnemyNear, StateNo = 140) && (EnemyNear, PrevStateNo = [150, 155])
trigger3 = EnemyNear, MoveType = H && EnemyNear, StateType != A && !var(20) && !var(21) && !var(22)
trigger4 = (EnemyNear, StateNo = [5020,5040]) && EnemyNear, HitFall = 0
trigger5 = EnemyNear, StateNo = 40 && EnemyNear, PrevStateNo != 52 && (EnemyNear, Anim != [0, 29])
var(38) = 1
ignoreHitPause = 1

[State -2, Dampener]
type = VarSet
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo]
type = VarSet
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo Limiter]
type = VarSet
trigger1 = var(20)
trigger1 = StateNo = 229
fvar(10) = ifElse(var(13), 0, 0.72)
ignoreHitPause = 1

[State -2, Dampener - Supers]
type = VarSet
trigger1 = (StateNo = [3000,4999])
fvar(10) = ifElse(var(22), 0.6, ifElse(var(21), 0.8, 1.0))
ignoreHitPause = 1

[State -2, Dampener Limit]
type = VarSet
trigger1 = fvar(10) < 0
fvar(10) = 0
ignoreHitPause = 1

[State -2, Root Dampener]
type = VarSet
trigger1 = 1
fvar(11) = fvar(10) * ifElse(var(9), 1.2, 1)
ignoreHitPause = 1

[State -2, Back Charge Increment]
type = VarAdd
trigger1 = command = "holdback"
var(47) = 1

[State -2, Back Charge Reset]
type = VarSet
trigger1 = command != "holdback"
var(47) = 0

[State -2, Back Charge Buffer Activation]
type = VarSet
trigger1 = var(47) >= 45
var(48) = 32

[State -2, Back Charge Buffer Decrement]
type = VarAdd
trigger1 = var(47) < 45 && var(48) > 0
var(48) = -1

[State -2, Down Charge Increment]
type = VarAdd
trigger1 = command = "holddown"
var(49) = 1

[State -2, Down Charge Reset]
type = VarSet
trigger1 = command != "holddown"
var(49) = 0

[State -2, Down Charge Buffer Activation]
type = VarSet
trigger1 = var(49) >= 45
var(50) = 32

[State -2, Down Charge Buffer Decrement]
type = VarAdd
trigger1 = var(49) < 45 && var(50) > 0
var(50) = -1

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Attack = %f Hits = %d Juggle = %d"
params = AILevel, fvar(11), var(13), var(15)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Jmorphman"
ignoreHitPause = 1

[state -2, - Wallbounce Limit]
type = varset
trigger1 = numenemy = 1
trigger1 = (enemynear,movetype!=H)
trigger2 = !numenemy
trigger3 = numenemy = 2
trigger3 = enemy(0),movetype != H
trigger3 = enemy(1),movetype != H
var(53) = 0

[State -2,SND]
type = PlaySnd
trigger1 = P2movetype=H && p2stateno=1208 && enemy,time=1
value = 820,2
persistent = 0
ignorehitpause = 1

[State -2, Wall Impact Dust];For EX Kung Fu Palm
type = Helper
triggerall=!numhelper(8111) && numenemy
trigger1 = P2movetype=H && p2stateno=1208 && enemy,time=1
helperType = Normal
stateNo = 8111
ID = 8111
name = "Wall Impact Dust"
posType = p2
facing = -1
pos = floor(-5*const(size.xscale)),ceil(-70*const(size.yscale))
ownPal = 1
ignorehitpause = 1

;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[StateDef -3]

[State -3, GameTime]
type = VarSet
trigger1 = 1
var(58) = GameTime
ignoreHitPause = 1

[State -3, ProjContact Reset]
type = VarSet
triggerAll = var(18)
trigger1 = (StateNo != [1000,1030])
trigger1 = StateNo != 3200
var(18) = 0

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = 1
var(39) = 0
ignoreHitPause = 1

[State -3, Projectile Flag On]
type = VarSet
triggerAll = var(20) <= 0
trigger1 = NumHelper(1005)
trigger1 = Helper(1005), StateNo = 1005
trigger2 = NumHelper(1005)
trigger2 = Helper(1005), StateNo = 1035
trigger3 = NumHelper(3205)
trigger3 = Helper(3205), StateNo = 3205
var(39) = 1
ignoreHitPause = 1

[State -3, Chain Combo Reset]
type = VarSet
trigger1 = 1
var(4) = 0
ignoreHitPause = 1

[State -3, Chain Combo Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact
trigger2 = var(20) && (StateNo = [1000,2999]) && StateType != A && (MoveContact || var(18))
var(4) = 1
ignoreHitPause = 1

[State -3, Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200
trigger5 = StateNo = 210
trigger6 = StateNo = 220
trigger7 = StateNo = 229
trigger8 = StateNo = 230
trigger9 = StateNo = 240
trigger10 = StateNo = 400
trigger11 = StateNo = 410
trigger12 = StateNo = 420
trigger13 = StateNo = 430
trigger14 = StateNo = 440
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200
trigger5 = StateNo = 210
trigger6 = StateNo = 220
trigger7 = StateNo = 229
trigger8 = StateNo = 230
trigger9 = StateNo = 240
trigger10 = StateNo = 400
trigger11 = StateNo = 410
trigger12 = StateNo = 420
trigger13 = StateNo = 430
trigger14 = StateNo = 440
trigger15 = (StateNo = [1000,1030]) && (AnimElemTime(5) = [1,8])
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3000 && MoveContact
trigger2 = StateNo = 3300 && MoveContact
var(8) = 1
ignoreHitPause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Flag Reset]
type = VarSet
trigger1 = var(22)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(22) = 0
ignoreHitPause = 1

[State -3, Parry Detection]
type = Helper
triggerAll = RoundState = 2 && !NumHelper(765) && !var(20)
triggerAll = (MoveType = I && ctrl) || (StateNo = [760, 762]) || StateNo = 5120
triggerAll = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AILevel
trigger1 = !AILevel && (StateType = S || StateType = C || StateNo = 5120) && (command = "fwd" || command = "down")
trigger2 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2) && command = "fwd"
trigger3 = AILevel && (StateNo != [760,762]) && InGuardDist && Random < 50
trigger4 = AILevel && (StateNo = [760,762]) && Time = 14 && Random < 667
helperType = Normal
stateNo = 765
ID = 765
name = "Parry Detection"
posType = P1
pauseMoveTime = 65535
superMoveTime = 65535

[State -3, Parry Attacks]
type = ChangeState
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = Helper(765), StateNo = 766
value = ifElse((Helper(765), Anim = 767), 762, ifElse((Helper(765), Anim = 766), 761, 760))
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 765)
attr = SA, AP
stateNo = 760
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 766)
attr = C, AP
stateNo = 761
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 767)
attr = SCA, AP
stateNo = 762
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Assert: NoWalk after Parry]
type = AssertSpecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26)-1)
flag = NoWalk
ignoreHitPause = 1

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = NumTarget
trigger1 = Target, HitOver || (Target, GetHitVar(HitShakeTime) > 0 && Target, Time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1

[State -3, Corner Push]
type = PosAdd
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 0
triggerAll = (Target, StateType = S || Target, StateType = C) && !(Target, GetHitVar(yvel)) && !(Target, HitFall)
trigger1 = Target, FrontEdgeBodyDist <= abs(Target, vel x)
trigger1 = (Target, GetHitVar(xvel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= abs(target, vel x)
trigger2 = (Target, GetHitVar(xvel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5)

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, GetHitVar(HitShakeTime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, EX FX Decrement]
type = VarAdd
trigger1 = var(25) > 0
var(25) = -1

[State -3, EX FX Reset]
type = VarSet
trigger1 = (StateNo != [1000,2999]) || MoveType = H
var(25) = 0

[State -3, EX Flash]
type = PalFX
trigger1 = !(GameTime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignoreHitPause = 1

[State -3, Movement AfterImage]
type = AfterImage
triggerAll = Time = 1 && !var(20)
trigger1 = StateNo = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (StateNo = [700,715])
time = 2
timeGap = 1
frameGap = 4
length = 9
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.9,0.9,0.9
trans = Add1

[State -3, Level 1 Super AfterImage]
type = AfterImage
trigger1 = (StateNo = 3000 || StateNo = 3101 || StateNo = 3300) && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 2 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3050 && Time = 43
trigger2 = StateNo = 3151 && Time = 43
trigger3 = StateNo = 3350 && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 3 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3200 && Time = 38
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State -3, AfterImage Persist]
type = AfterImageTime
trigger1 = StateNo = 50 || (StateNo = [600,699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = StateNo = [700,715]
trigger4 = (StateNo = [3000,4999])
time = 2

[State -3, Underground Juggle Prevention]
type = TargetBind
trigger1 = MoveContact = 1
trigger1 = NumTarget && NumEnemy
trigger1 = (Target, Time = 0) && (Target, ID = EnemyNear, ID)
trigger1 = !(Target, HitShakeOver) && (Target, pos y > 0)
pos = ceil(P2Dist x), ceil(-pos y)
ignoreHitPause = 1

[State -3, Prevent Crossup]
type = Width
trigger1 = MoveType != H
edge = 8, 0
ignoreHitPause = 1

[State -3, Variable Height]
type = PlayerPush
triggerAll = StateType = A && MoveType != H && NumEnemy
triggerAll = P2BodyDist x = [-(EnemyNear, const(size.ground.back) + EnemyNear, const(size.ground.front)), 0]
trigger1 = P2StateType = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
value = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerall = Alive && Time = 1
triggerall = StateNo = 5000 || StateNo = 5010
trigger1 = GetHitVar(AnimType) >= 2 && Random < 500
trigger2 = GetHitVar(AnimType) = 1 && Random < 375
trigger3 = GetHitVar(AnimType) = 0 && Random < (250 * (AILevel ** 2 / 64.0))
value = 5000,(Random % 3)
channel = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 5000,(Random % 3)
channel = 0
ignoreHitPause = 1

[State -3, Cheap KO]
type = ChangeState
trigger1 = !Alive && (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo = [150,153])
value = 5950
ignoreHitPause = 1

[State -3, Assert: NoKOsnd (Cheap KO)]
type = AssertSpecial
trigger1 = (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo=[150,153])
flag = NoKOsnd
ignoreHitPause = 1

[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger3 = StateNo = 810
trigger4 = StateNo = 820
trigger5 = StateNo = 861
trigger6 = NumHelper(1105)
trigger7 = StateNo = 1301
trigger8 = StateNo = 1303
trigger9 = P2StateNo = 1461
trigger10 = NumHelper(1504)
trigger11 = NumHelper(1506)
trigger12 = NumHelper(1508)
trigger13 = StateNo = 1540
trigger14 = StateNo = 1547
trigger15 = StateNo = 1610
trigger16 = StateNo = 1611
trigger17 = StateNo = 1612
helperType = Normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = left
pos = 160, -120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -3, Super Finish]
type = Helper
triggerAll = WinKO
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := StateNo
trigger2 = (StateNo = [3000,3099])
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3100,3199])
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = (StateNo = [3300,3399])
trigger5 = var(23) := 3300
helperType = Normal
stateNo = 8600
ID = 8600
name = "Super Finish"
posType = left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

