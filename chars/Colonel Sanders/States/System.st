; ADD004 BASIC PIEs ReBuilded CNS (01/03/2023)
;==============================================
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==============================================

; _________________________________________
;| Colonel Sanders by IkuTronHD            |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<SYSTEM STATES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------
;STANDING
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

;-------------
;Walking
[StateDef 20]
type = S
physics = S
movetype = I
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 21
;JUMPING
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
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))

[State 40, High Jump]
type = varset
trigger1 = !time && !AIlevel
var(3) = ifelse(command = "highjump", 3, 0)
[State 40, High Jump]
type = varset
trigger1 = !time && AIlevel
var(3) = ifelse((p2bodydist x >= 160 || random < (125 * (AIlevel ** 2 / 64.0))), 3, 0)
[State 40, High Jump]
type = varset
trigger1 = !time && prevstateno = 100
var(3) = 3

[State 40, Low Jump]
type = varset
trigger1 = !AIlevel && command != "holdup" && (var(3) != [1, 2])
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)
[State 40, Low Jump]
type = varset
trigger1 = AIlevel && (var(3) != [1, 2])
trigger1 = (enemynear, statetype = C) && random < 500
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Snd]
type = playsnd
trigger1 = !animtime
value = ifelse((var(3) = [2, 3]), 41, 40), 0
[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)
[State 40, Vel Short]
type = velset
trigger1 = !animtime && var(3) = 1
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.76 * const(velocity.jump.y)
[State 40, Vel Medium]
type = velset
trigger1 = !animtime && var(3) = 2
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.76 * const(velocity.jump.y)
[State 40, Vel Long]
type = velset
trigger1 = !animtime && var(3) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))
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

;Falling
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
trigger1 = anim != 5
flag = NoWalk

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
;=============<Running>====================
;Running
[Statedef 100]
type = S
physics = N
movetype = I
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 6)
value = 100, ifElse((AnimElem = 3), 0, 1)

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Jump]
type = changestate
trigger1 = AIlevel && random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2BodyDist x <= 90
value = 101

;Run Stop
[Statedef 101]
type = S
physics = S
movetype = I
anim = 101
ctrl = 0
sprpriority = 1

[State 101, Snd]
type = playsnd
trigger1 = !time
value = 101,0

[State 101, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, Jump]
type = changestate
trigger1 = !AIlevel && command = "holdup"
value = 40

[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
ctrl = 1


[Statedef 102]
type = S
physics = N
movetype = I
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Snd]
type = playsnd
trigger1 = !time
value = 110,0

[State 102, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, Run]
type = varset
trigger1 = !time
sysvar(1) = 1

[State 102, Run]
type = varset
triggerall = AnimElemTime(2) <= 0
trigger1 = !AIlevel && command != "holdfwd"
sysvar(1) = 0

[State 102, Run]
type = changestate
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 102, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 2
x = 6.75
y = -4

[State 105, 1]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 105, 1]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 102, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 103


;--- LAND ---
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Pos]
type = posset
trigger1 = 1
y = 0

[State 103, Snd]
type = playsnd
trigger1 = !time
value = 100,0

[State 103, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 105]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 105,0

[State 105, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 1]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 105, 1]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.75

[State 110, Type]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 105, Land]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 106


;--- LAND ---
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Snd]
type = playsnd
trigger1 = !time
value = 100,1

[State 106, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1

[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;EVADE
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
ctrl = 0
velset = 0, 0
sprpriority = -2

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 700, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 3
channel = 1

[State 700, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 700, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 221, 250)

[State 700, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && numenemy
trigger1 = (enemynear, movetype != A) && (p2bodydist x = [ -60, 60]) && (p2dist y >= -60)
value = ifelse(random < 666, 221, 250)

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;ROLL Forward 
[Statedef 710]
type = S
physics = N
movetype = I
anim = 710
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 4.5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;ROLL Backward 
[Statedef 715]
type = S
physics = N
movetype = I
anim = 715
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 715, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 715, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 715, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===========<POWER CHARGE>==================
;Power Charge
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
trigger1 = (command = "holdb" && command = "holdy")
value = 5 + ifElse(time < 60, 0, (time - 60) / 12)

[State 730, Voice]
type = PlaySnd
trigger1 = !Time
value = 2200,0
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
pos = 0,0
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
trigger2 = (command != "holdb" || command != "holdy")
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
value = 3,3
channel = 0
persistent = 0

[State 730, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;ZERO COUNTER 
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -1000
facep2 = 1

[State 750, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "412k")
ignorehitpause = 1

[State 750, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 0, ifelse((p2statetype = C), 1, ifelse(random < 500, 0, 1)))
ignorehitpause = 1

[State 750, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 750, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 750, SuperPause FX]
type = helper
trigger1 = !time
stateno = 8350
ID = 8350
name = "Zero Counter"
postype = p1
pos = 35, -83
supermovetime = 255
ownpal = 1

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 15
movetime = 15
p2defmul = 1
anim = -1
sound = s750,0
darken = 0

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(var(10) = 1, 2910, 2900)



;PARRY STANDING
[Statedef 760]
type = S
physics = S
movetype = I
anim = 760
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 760, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 760, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 760, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 760, No walking]
type = varset
trigger1 = 1
var(26) = 7

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

[State 760, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 760, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = 32, -59
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 760, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 760, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;PARRY CROUCHING
[Statedef 761]
type = C
physics = C
movetype = I
anim = 761
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 761, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 761, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 761, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 761, No walking]
type = varset
trigger1 = 1
var(26) = 7

[State 761, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 761, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

[State 761, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 761, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = 36,-40
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 761, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 761, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;PARRY JUMPING 
[Statedef 762]
type = A
physics = N
movetype = I
anim = 762
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 762, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 762, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 762, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 762, Snd]
type = playsnd
trigger1 = !time
value = 4, 0
channel = 0

[State 762, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

[State 762, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 762, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = 28,-73
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 762, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 762, End]
type = changestate
trigger1 = !animtime
value = 763
ctrl = 1

;PARRY JUMP FINISH
[Statedef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)

[State 763, Accel]
type = gravity
trigger1 = 1

[State 763, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


;PARRY HELPER
[StateDef 765]
type = A
physics = N
moveType = I
anim = ifElse(Root, StateType = C, 766, ifElse(Root, StateType = A, 767, 765))
velSet = 0,0
ctrl = 0

[State 765, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 765, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1

[State 765, Change to Crouching]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "down"
trigger2 = Root, AILevel && (Root, StateType != A) && P2StateType = C
value = 766

[State 765, Change to Standing / Jumping]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "fwd"
trigger2 = Root, AILevel && Anim != 766
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Change to Standing / Jumping]
type = ChangeAnim
trigger1 = Anim = 765 || Anim = 767
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Disable]
type = VarSet
trigger1 = Time >= ifElse((Root, StateType = A), 7, 8)
trigger2 = Facing != (Root, Facing)
trigger3 = !(Root, ctrl)
trigger3 = (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
var(0) = 1

[State 765, Disable]
type = VarSet
triggerAll = !(Root, AILevel)
trigger1 = (Root, command = "holdback")
trigger2 = Time < 4 && (Root, command = "holdfwd" + Root, command = "holddown") > 1
trigger3 = Time >= 4 && (Root, command = "holdfwd" || Root, command = "holddown")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && Root, command = "fwd") || (Anim = 766 && Root, command = "down"))
var(0) = 1

[State 765, Disable]
type = ChangeAnim
trigger1 = var(0) = 1
value = 1

[State 765, Standing/Air]
type = ReversalDef
trigger1 = !var(0) && (Anim = 765 || Anim = 767)
trigger1 = (Root, StateNo != 5120) || !(Root, AnimTime)
reversal.attr = SCA,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Crouching]
type = ReversalDef
trigger1 = !var(0) && Anim = 766
reversal.attr = SC,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Disable]
type = ReversalDef
trigger1 = var(0) = 1
reversal.attr =
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, End]
type = DestroySelf
trigger1 = Time >= 18
trigger2 = (Root, MoveType != I)
trigger3 = !(Root, ctrl) && (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
trigger4 = (Root, StateNo = [760,762]) && (Root, Time <= 1)

;PARRY SUCCESS
[StateDef 766]
moveType = I
ctrl = 0

[State 766, Disable]
type = VarSet
trigger1 = 1
var(0) = 1

[State 766, End]
type = DestroySelf
trigger1 = Root, StateNo = [760,762]
trigger2 = Time >= 2

;MAX MODE
[Statedef 770]
type = S
movetype = I
physics = S
anim = 770
ctrl = 0
velset = 0,0

[State 770, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0, 22
channel = 0

[State 770, MAX Snd]
type = PlaySnd
trigger1 = !Time
value = 770, 0

[State 770, Power Up! Text]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8291
ID = 8291
name = "Power Up FX"
posType = P1
pos = ceil(4 * const(size.xScale)), ceil(-62 * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State 770, PowerAdd]
type = PowerAdd
trigger1 = AnimElem = 1
value = -1000

[State 770, PowerSet Var]
type = Varset
trigger1 = Animelem = 1
var(24) = Power

[State 770, MAX Mode Timer]
type = VarSet
trigger1 = AnimElem = 1
var(53) = 1000

[State 770, Max Meter V2]
type = Helper
helpertype = Normal
trigger1 = Animelem = 1 && !NumHelper(780)
id = 780
pos = 0,0
postype = left
name = "Max Meter"
stateno = 780
ignorehitpause = 1
ownpal = 1

[State 770, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;MAX MODE BAR HELPER
[Statedef 780]
type = S
movetype = I
physics = N
anim = 1
sprpriority = 0
ignorehitpause = 1

[State 780, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1
pos = 0,-15

[State 780, Meter BG]
type = Explod
trigger1 = !Time
anim = 780
id = 780
pos = 2,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = -1
ontop = 1
ownpal = 1
removeongethit = 0

[State 780, Meter Fill]
type = Explod
trigger1 = Time = 2
anim = 781
id = 781
pos = 24,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 2
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 780, Meter Container]
type = Explod
trigger1 = Time = 2
anim = 782
id = 782
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 780, ModifyExplod]
type = ModifyExplod
trigger1 = root, Var(53) > 0
id = 781
scale = (5 + root, Var(53)) / 2000.0,.5
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(53) <= 0
id = 780
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(53) <= 0
id = 781
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(53) <= 0
id = 782
ignorehitpause = 1

[State 780, DestroySelf]
type = DestroySelf
trigger1 = root, Var(53) <= 0
ignorehitpause = 1

;CUSTOM COMBO GROUND 
[Statedef 900]
type = S
physics = S
movetype = A
anim = 900
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -1000

[State 900, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 900, Unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

[State 900, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 900, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 900, Var]
type = varset
trigger1 = time >= 4
var(20) = 180

[State 900, Snd]
type = playsnd
trigger1 = time = 4
value = 181,0
channel = 0

[State 900, SuperPause FX]
type = helper
trigger1 = time = 4
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = -14,-52
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 900, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s900,0
p2defmul = 1
darken = 0

[State 900, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;CUSTOM COMBO AIR 
[Statedef 905]
type = A
physics = N
movetype = A
anim = 905
ctrl = 0
sprpriority = 2
poweradd = -1000

[State 905, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 905, Unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

[State 905, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 905, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 905, Var]
type = varset
trigger1 = time >= 4
var(20) = 180

[State 905, Snd]
type = playsnd
trigger1 = time = 4
value = 181,0
channel = 0

[State 905, SuperPause FX]
type = helper
trigger1 = time = 4
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = 2,-90
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 905, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s900,0
p2defmul = 1
darken = 0

[State 905, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 905, End]
type = changestate
trigger1 = !animtime
value = 906
ctrl = 1

;CUSTOM COMBO AIR FINISH
[Statedef 906]
type = A
physics = N
movetype = I
anim = 906
ctrl = 1

[State 906, Accel]
type = gravity
trigger1 = 1

[State 906, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52



;GUARD START 
[Statedef 120]
type = U
physics = U
anim = 120 + (statetype = C) + (statetype = A) * 2
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0
[State 120, High to Low]
type = statetypeset
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 120, Low to High]
type = statetypeset
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
[State 120, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2
[State 120, Stop]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;STAND GUARD (guarding) ---
[Statedef 130]
type = S
physics = S
[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130
[State 130, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131
[State 130, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140
[State 130, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 52,0
[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

;CROUCH GUARD (guarding) ---
[Statedef 131]
type = C
physics = C
[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131
[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130
[State 131, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 131, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;AIR GUARD (guarding) ---
[Statedef 132]
type = A
physics = N
[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132
[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)
[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)
[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 132, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 132, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52
[State 132, stop guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;GUARD (end) ---
[Statedef 140]
type = U
physics = U
ctrl = 1
[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 140, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51

;SGUARDHIT (shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0
[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150
[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 150, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
statetype = C
physics = C
[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
;SGUARDHIT2 (knocked back) ---
[Statedef 151]
type = S
movetype = H
physics = S
anim = 150
[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0
[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 151, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;CGUARDHIT (shaking) ---
[Statedef 152]
type = C
movetype = H
physics = N
velset = 0, 0
[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151
[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 152, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S


;CGUARDHIT2 (knocked back) ---
[Statedef 153]
type = C
movetype = H
physics = C
anim = 151
[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0
[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 153, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;AGUARDHIT (shaking) ---
[Statedef 154]
type = A
movetype = H
physics = N
velset = 0, 0
[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152
[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155


;AGUARDHIT2 (knocked away) ---
[Statedef 155]
type = A
movetype = H
physics = N
anim = 152
[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 155, Vel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)
[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)
[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 155, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52

;LOSE 
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, 7]
type = PlaySnd
trigger1 = animelem = 1
value = 170,0

[State 170, Assert]
type = assertspecial
trigger1 = Time < 200
flag = roundnotover


;DRAW GAME
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0

[State 170, 7]
type = PlaySnd
trigger1 = animelem = 1
value = 170, 0

[State 175, switch]
type = changestate
trigger1 = !time
value = 170

;---------------------------------------------------------------------------
; Win state decider
[Statedef 180]
type = S

[State 180, VictoryQuote]
type = VictoryQuote
trigger1 = !Time
value = 1+(random%13) ; 1~99

[State 180, Victory Quote vs. Donald / Ronald]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Donald" || Enemy, Name="Ronald" || Enemy, Name="Donald McDonald" || Enemy, Name="Ronald McDonald"
value=14
[State 180, Victory Quote vs. Colonel Sanders]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Colonel" && Enemy, AuthorName="peg"
trigger2=Enemy, Name="Colonel Sanders" && Enemy, AuthorName="IkuTronHD"
value=15
[State 180, Victory Quote vs. Miku Hatsune]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="HATSUNE MIKU" || Enemy, Name="Miku Hatsune"
value=16
[State 180, Victory Quote vs. Reimu Hakurei]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Reimu Hakurei" || Enemy, Name="Reimu_RP"
value=17
[State 180, Victory Quote vs. Marisa Kirisame]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Marisa Kirisame" || Enemy, Name="Marisa_RP"
value=18
[State 180, Victory Quote vs. Reimu Hakurei]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Reimu Hakurei" || Enemy, Name="Reimu_RP"
value=17
[State 180, Victory Quote vs. Marisa Kirisame]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Marisa Kirisame" || Enemy, Name="Marisa_RP"
value=18
[State 180, Victory Quote vs. Byakuren Hijiri]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Byakuren Hijiri" || Enemy, Name="Byakuren_RP"
value=19
[State 180, Victory Quote vs. Eirin Yagokoro]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Eirin Yagokoro" || Enemy, Name="Eirin_RP"
value=20
[State 180, Victory Quote vs. Flandre Scarlet]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Flandre Scarlet" || Enemy, Name="Flandre_RP"
value=21
[State 180, Victory Quote vs. Kanako Yasaka]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Kanako Yasaka" || Enemy, Name="Kanako_RP"
value=22
[State 180, Victory Quote vs. Lie Meiling]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Lie Meiling" || Enemy, Name="Lie_RP"
value=24
[State 180, Victory Quote vs. Hong Meiling]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Hong Meiling" || Enemy, Name="Meiling_RP"
value=25
[State 180, Victory Quote vs. Fujiwara no Mokou]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Fujiwara no Mokou" || Enemy, Name="Mokou_RP"
value=26
[State 180, Victory Quote vs. Patchouli Knowledge]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Patchouli Knowledge" || Enemy, Name="Patchouli_RP"
value=27
[State 180, Victory Quote vs. Sakuya Izayoi]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Sakuya Izayoi" || Enemy, Name="Sakuya_RP"
value=28
[State 180, Victory Quote vs. Utsuho Reiuji]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Utsuho Reiuji" || Enemy, Name="Utsuho_RP"
value=29
[State 180, Victory Quote vs. Yukari Yakumo]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Yukari Yakumo" || Enemy, Name="Yukari_RP"
value=30
[State 180, Victory Quote vs. Yuuka Kazami]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Yuuka Kazami" || Enemy, Name="Yuuka_RP"
value=31
[State 180, Victory Quote vs. Yuyuko Saigyouji]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Yuyuko Saigyouji" || Enemy, Name="Yuyuko_RP"
value=32
[State 180, Victory Quote vs. Alice Margatroid]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Alice Margatroid" || Enemy, Name="Alice_RP"
value=33

[State 180, 1]
type = ChangeState
trigger1 = time = 0
value = 181+(random%2)
;---------------------------------------------------------------------------
;winpose1
[Statedef 181]
type = S
physics = S
ctrl = 0
velset = 0,0
anim = 180

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 181]
type = Explod
trigger1 = time = 200
anim = 182
sprpriority = 1
postype = p1
pos = 0,0
under = 0
ownpal = 1

[State 181, ‰¹]
type = PlaySnd
trigger1 = AnimElem = 1
value = s180,0

[State 181, 1]
type = AssertSpecial
trigger1 = Time = [0, 270]
flag = RoundNotOver

;---------------------------------------------------------------------------
;winpose2
[Statedef 182]
type = S
physics = S
ctrl = 0
velset = 0,0
anim = 181

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 182, “ÁŽêŒø‰Ê]
type = AssertSpecial
trigger1 = Time = [0,180]
flag = RoundNotOver

[State 182]
type = PlaySnd
trigger1 = Time = 0
value = s182,0

[State 182]
type = Helper
trigger1 = Time = [30, 60]
trigger1 = Time%3 = 0
trigger1 = NumEnemy
name = "cock"
stateno = 185
pos = ceil(EnemyNear,Pos X - Pos X)*Facing + Random%128-64,0
postype = p1
keyctrl = 0
ownpal = 1
ID = 185

[State 181, 1]
type = AssertSpecial
trigger1 = Time = [0, 270]
flag = RoundNotOver
;---------------------------------------------------------------------------
; Pollo
[Statedef 185]
type = S
ctrl = 0
sprpriority = 2
anim = 501

[state 185]
type = Explod
trigger1 = Time = 1
anim = 4022
postype = p1
pos = 0,0
sprpriority = 5
ownpal = 1
ID = 4023

[state 185]
type = Explod
trigger1 = Time = 100
trigger1 = Anim = 501
anim = 1955
postype = p1
pos = 0,10
sprpriority = 1
ownpal = 1
ID = 1955

[state 185]
type = Explod
trigger1 = Time = 100
trigger1 = Anim = 501
anim = 1955
postype = p1
pos = -7,-7
sprpriority = 1
ownpal = 1
ID = 1955

[state 185]
type = Explod
trigger1 = Time = 100
trigger1 = Anim = 501
anim = 1955
postype = p1
pos = 7,-7
sprpriority = 1
ownpal = 1
ID = 1955

[state 185]
type = PlaySnd
trigger1 = Time = 100
trigger1 = Anim = 501
value = s6,6

[state 185]
type = ChangeAnim
trigger1 = Time = 100
trigger1 = Anim = 501
value = 4300
;---------------------------------------------------------------------------
; Introduction
[Statedef 190]
type = S
ctrl = 0

[State 190, ƒXƒe[ƒg•ÏX]
type = ChangeState
trigger1 = (EnemyNear,Name = "Donald")
value = 191

[State 190, ƒXƒe[ƒg•ÏX]
type = ChangeState
trigger1 = (EnemyNear,Name != "Donald")
value = 194
;---------------------------------------------------------------------------
; Introduction
[Statedef 191]
type = S
ctrl = 0
anim = 192
velset = 0,0

[State 191, “ÁŽêŒø‰Ê]
type = AssertSpecial
trigger1 = 1
flag = Intro;ƒCƒ“ƒgƒ‚Ìó‘Ô

[State 191]
type = ChangeState
trigger1 = (Time = 50)
value = 192

;---------------------------------------------------------------------------
; Introduction
[Statedef 192]
type = S
ctrl = 0
anim = 191
velset = 0,0
sprpriority = 0

[State 192, “ÁŽêŒø‰Ê];ŽŽ‡‚ªŠJŽn‚·‚é‚Ü‚Å‚Í‚±‚ÌƒRƒ“ƒgƒ[ƒ‰‚ðŽg‚¨‚¤
type = AssertSpecial
trigger1 = 1
flag = Intro;ƒCƒ“ƒgƒ‚Ìó‘Ô

[State 192, ƒXƒe[ƒg•ÏX]
type = ChangeState
trigger1 = (AnimTime = 0)
value = 0

[State 192, ‰¹‚ð–Â‚ç‚·]
type = PlaySnd
trigger1 = Time = 0
value = 190,0

[State 192, ‰¹‚ð–Â‚ç‚·]
type = PlaySnd
trigger1 = AnimElem = 5
value = 190,1

[State 192, ‰¹‚ð–Â‚ç‚·]
type = PlaySnd
trigger1 = AnimElem = 6
value = 190,2

[State 192, ‰¹‚ð–Â‚ç‚·]
type = PlaySnd
trigger1 = AnimElem = 7
value = 2,9

[State 192, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = AnimElem = 7
ID = 192
anim = 4401
postype = p1
pos = 16, -110
sprpriority = 10
ownpal = 1
persistent = 0

[State 192, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = AnimElem = 7
ID = 192
anim = 4404
postype = p1
pos = 20, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 192, ƒwƒ‹ƒp[‚ðo‚·];i¦‚Qj
type = Helper
trigger1 = Time = 0
name = "Dona"
stateno = 193
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
size.xscale = const(size.xscale) ;wconst(***)x‚ÍƒRƒ“ƒXƒ^ƒ“ƒcƒtƒ@ƒCƒ‹‚ÌŠeƒpƒ‰ƒ[ƒ^‚ðŽg‚¤–½—ß
size.yscale = const(size.yscale) 
ID = 192
Persistent = 0

[Statedef 193]
type     = A
movetype = I
physics  = N
anim     = 190
ctrl     = 0
velset   = 0,0
sprpriority = -1

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 0, -10
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = -20, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 20, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 0, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = -20, -70
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 20, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 80, -10
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 60, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 100, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 80, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 60, -70
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = RoundState = 2
ID = 193
anim = 4022
postype = p1
pos = 100, -60
sprpriority = 10
ownpal = 1
persistent = 0

;“oêƒGƒtƒFƒNƒg

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 0, -10
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = -20, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 20, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 0, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = -20, -70
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 20, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 80, -10
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 60, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 100, -20
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 80, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 60, -70
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒGƒtƒFƒNƒg]
type = Explod
trigger1 = Time = 0
ID = 193
anim = 4022
postype = p1
pos = 100, -60
sprpriority = 10
ownpal = 1
persistent = 0

[State 193, ƒwƒ‹ƒp[‚ðÁ‚·]
type = DestroySelf
trigger1 = RoundState = 2

;---------------------------------------------------------------------------
ƒCƒ“ƒgƒ(ˆê”Ê)

[Statedef 194];
type = S
ctrl = 0
anim = 194
velset = 0,0
sprpriority = 0

[State 194]
type = PlaySnd
trigger1 = Time = 0
value = 191,0

[State 194]
type = PlaySnd
trigger1 = AnimTime = 0
value = 191,1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = 0,0
postype = P1
sprpriority = 3
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = 5,-20
postype = P1
sprpriority = 3
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = -5,-40
postype = P1
sprpriority = 3
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = 0,-60
postype = P1
sprpriority = 3
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = Time = 0
anim = 193
ID = 193
pos = 0,0
postype = P1
removetime = 80
sprpriority = 2
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = 5,-80
postype = P1
sprpriority = 3
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = -5,-100
postype = P1
sprpriority = 3
ownpal = 1

[State 194, Explod]
type = Explod
trigger1 = AnimTime = 0
anim = 1955
ID = 1955
pos = 0,-120
postype = P1
sprpriority = 3
ownpal = 1

[State 194, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 194]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
;-----------------------------
;Turns Intro
[Statedef 6900]
type = A
anim = 6900
velset = 0,0
ctrl = 0

[State 6900, Intro Assert]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, Camera]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 6900, Camera]
type = Helper
trigger1 = !Numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6900, PosSet]
type=PosSet
trigger1 =!time
x=Ifelse(teamside=1,-320,320)

[State 6900, Velocity]
type = VelSet
trigger1 = !Time
x = (helper(8999),rootdist x)/-40.0
y = -10.25

[State 6900, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = Pos y>-Vel y
value = 6901

;====<Land>======
;Land
[Statedef 6901]
type = S
physics = S
anim = 6901
velset = 0,0

[State 6901, Intro Assert]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 6901, Position]
type = Posset
trigger1 = !time && numhelper(8999)
x = ceil(helper(8999),pos x)

[State 6901, Landing Snd]
type = Playsnd
trigger1 = !Time
value = 52,0

[State 6901, Landing Dust]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, Voice]
type = PlaySnd
trigger1 = animelem = 4
value = S182,0
channel = 1

[State 6901, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;-----------------------
; Taunt
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 2

[State 195, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S182,0
channel = 1


[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Continue?
[Statedef 5500]
type = S
ctrl = 0
anim = 5300
velset = 0,0

[State 5500, 1] ;Use continue animation if available
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5500)
value = 5500

;=============<CHEAP K.O.>=============
;Cheap K.O./Cheese Kill 
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
value = 11,1

[State 5950, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 5000,11
volumescale = 85

[State 5950, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 5950, End]
type = ChangeState
trigger1= !AnimTime
value = ifElse(Alive, 5110, 5150)
;================<AIR HIT TRANSITION>=================
;Air Hit Transition
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


;==========<FALL RECOVERY>==========
;Fall Recovery
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5200, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 10
value = 5201

;==========<FALL RECOVERY Land>==========
;Fall Recovery Land
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
value = 3000,0
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
time=10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-36 * const(size.yScale))
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

;==========<Air RECOVERY>==========
;Air Recovery
[StateDef 5210]
type = A
moveType = I
physics = N
anim = 5210
ctrl = 0
faceP2 = 1

[State 5210, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse((command = "holdfwd" && command != "holdback"), 0, ifElse((command != "holdfwd" && command = "holdback"), -4, -2))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value  = 5200,0
channel = 1

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
pos = 0, ceil(-132 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(7) >= 0
value = 1

[State 5210, Land]
type = ChangeState
trigger1 = pos y > -vel y
value = 52
;==========<FORCED P2 RECOVERY>==========
;Forced P2 Recovery
[StateDef 5025]
type = A
moveType = H
physics = N
velSet = 0,0
faceP2 = 1

[State 5025, HitFallSet]
type = HitFallSet
trigger1 = 1
value = 0

[State 5025, End]
type = SelfState
trigger1 = 1
value = ifElse(pos y, 5020, 5000)

;==========<TARGET SAFE FALL>==========
;Target Safe Fall
[StateDef 5205]
type = A
physics = N
moveType = H

[State 5205, End]
type = SelfState
trigger1 = 1
value = ifElse(pos y < -20, 5210, 5200)

;============<OFF SCREEN STAND BY>=========
;Stand by
[Statedef 7827]
type = S
movetype = I
physics = N
velset = 0,0
ctrl = 0
facep2=1

[State 0, ScreenBound]
type = ScreenBound
trigger1 =1
value =0
ignorehitpause =1
[State 7827]
type = PosSet
trigger1=!time
y = 0
ignorehitpause=1
[State 7827]
type = ChangeState
trigger1 = NumEnemy = [1,2]
trigger1 = Enemy(0),statetype = L || Enemy(0),movetype != H
value = 7828
[State 7827]
type = ChangeState
trigger1 = NumEnemy = 2
trigger1 = Enemy(1),statetype = L || Enemy(1),movetype != H
value = 7828
;============<OFF SCREEN RUN IN>=========
;Off Screen Run In
[Statedef 7828]
type    = S
physics = S
anim = 100
ctrl = 0
facep2=1

[State 7828, SND]
type = playsnd
trigger1 = (animelem = 3 || animelem = 6)
value = 100,0

[State 7828]
type = PosSet
trigger1 = !Time
y = 0
ignorehitpause=1
[State 7828]
type = VelSet
trigger1 = AnimElem = 1
x = 7
ignorehitpause=1
[State 7828]
type = VelSet
trigger1 = AnimElemNo(0) = [1,2]
x = 9
ignorehitpause=1
[State 7828]
type = AssertSpecial
trigger1 = 1
flag = NoWalk
ignorehitpause=1
[State 7828]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn
ignorehitpause=1

[State 7828]
type = ChangeState
trigger1= time>=20
value = 7829
ctrl = 0
;============<OFF SCREEN RUN STOP>=========
;Off Screen Run Stop
[Statedef 7829]
type    = S
physics = S
anim = 101
ctrl = 0

[State 7829,VelMul]
type = VelMul
trigger1 =time=2
x = .5
[State 7829,Dust]
type = MakeDust
trigger1=time%6
pos = 30, 0

[State 7829, SND]
type = playsnd
trigger1 =!time
value = 0, 101
persistent = 0
[State 7829,END]
type = ChangeState
trigger1=!animtime
value = 0
ctrl = 1
;=====================<HIT GROUND(BOUNCE)>===================
;Hit Ground
[Statedef 5100]
type    = L
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10] ;Thud sound for when char hits ground
type = PlaySnd
trigger1 = Time = 1
value = 5000,11

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;================<HIT LIEDOWN>====================
;Hit Liedown
[Statedef 5110]
type    = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6] ;Thud sound for when char hits ground
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 5000,11

[State 5110, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine
;==========<FALL RECOVERY>==========
;Fall Recovery
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5200, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 10
value = 5201

;==========<FALL RECOVERY Land>==========
;Fall Recovery Land
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
value = 3000,0
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
time=10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-36 * const(size.yScale))
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
;---------------------------------------------------------------------------
; Air get-hit (fall recovery in air)
[Statedef 5210]
type = A
moveType = I
physics = N
anim = 5210
ctrl = 0
faceP2 = 1

[State 5210, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse((command = "holdfwd" && command != "holdback"), 0, ifElse((command != "holdfwd" && command = "holdback"), -4, -2))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value  = 5200,0
channel = 1

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
pos = 0, ceil(-132 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(7) >= 0
value = 1

[State 5210, Land]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;==============================================================
;========================================================Syn===
;==============================================================
;DRAMATIC KO PAUSE
[Statedef 9944]
type = s
movetype = i
physics = n

[State 9944, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 9944, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 9944, Dramatic KO Helper]
type = helper
triggerall = (root,alive || enemy,alive)
trigger1 = roundstate = 3 && (root,life <= 0 || enemy,life <= 0)
helpertype = Normal
id = 9955
pos = 0,0
postype = p1
name = "K.O."
stateno = 9955
supermovetime = 9999999999
pausemovetime = 9999999999
persistent = 0
ignorehitpause = 1
;==============================================================
;=======================================================Syn====
;==============================================================
;DRAMATIC KO PAUSE HELPER
[Statedef 9955]
type = s
movetype = i
physics = n

[State 9955, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible
flag3 = nokoslow;<------------optional
ignorehitpause = 1

[State 9955,NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 9955, pause]
type = Pause
trigger1 = 1
time = 28;<---adjust to your likings
ignorehitpause = 1
persistent = 0

[State 9955, DestroySelf]
type = DestroySelf
trigger1 = time >= 28;<---make the time match the time in the pause code above

;===========================================================================
;===============================< -2 STATES >=================================
;===========================================================================
[Statedef -2]

;#ADD004BASIC PIEs#
;##[a4b_-2_start.v20200523]##
;//==========================
;// add004-sctrls-start
;//==========================
;sys::-2::partners_standby ; パートナー待機
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	;;---
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(交替)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(協力)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(割り込み交替)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(順位)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; 割り込み交替
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ライフバー
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

;sys::-2::get_helper::bar004_id ; ID取得
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

;sys::-2::bk/jd_system ; ブロキング/ジャストD
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

;sys::-2::face_d_main ; portrait (顔)
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
;sys::-2::camera_nc ; 焦点変更
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
;sys::-2::guard_crush_fx ; ガードクラッシュ
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
;;--- fadeout when KOed ; KO後消える
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
;;--- <<IKEMENには無用>>
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


[State -2, Victory Quote vs. Donald / Ronald]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Donald" || Enemy, Name="Ronald" || Enemy, Name="Donald McDonald" || Enemy, Name="Ronald McDonald"
value=14
[State -2, Victory Quote vs. Colonel Sanders]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Colonel" && Enemy, AuthorName="peg"
trigger2=Enemy, Name="Colonel Sanders" && Enemy, AuthorName="IkuTronHD"
value=15
[State -2, Victory Quote vs. Miku Hatsune]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="HATSUNE MIKU" || Enemy, Name="Miku Hatsune"
value=16
[State -2, Victory Quote vs. Reimu Hakurei]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Reimu Hakurei" || Enemy, Name="Reimu_RP"
value=17
[State -2, Victory Quote vs. Marisa Kirisame]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Marisa Kirisame" || Enemy, Name="Marisa_RP"
value=18
[State -2, Victory Quote vs. Komachi Onozuka]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Komachi Onozuka" || Enemy, Name="Komachi_RP"
value=23
[State -2, Victory Quote vs. Byakuren Hijiri]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Byakuren Hijiri" || Enemy, Name="Byakuren_RP"
value=19
[State -2, Victory Quote vs. Eirin Yagokoro]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Eirin Yagokoro" || Enemy, Name="Eirin_RP"
value=20
[State -2, Victory Quote vs. Flandre Scarlet]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Flandre Scarlet" || Enemy, Name="Flandre_RP"
value=21
[State -2, Victory Quote vs. Kanako Yasaka]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Kanako Yasaka" || Enemy, Name="Kanako_RP"
value=22
[State -2, Victory Quote vs. Lie Meiling]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Lie Meiling" || Enemy, Name="Lie_RP"
value=24
[State -2, Victory Quote vs. Hong Meiling]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Hong Meiling" || Enemy, Name="Meiling_RP"
value=25
[State -2, Victory Quote vs. Fujiwara no Mokou]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Fujiwara no Mokou" || Enemy, Name="Mokou_RP"
value=26
[State -2, Victory Quote vs. Patchouli Knowledge]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Patchouli Knowledge" || Enemy, Name="Patchouli_RP"
value=27
[State -2, Victory Quote vs. Sakuya Izayoi]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Sakuya Izayoi" || Enemy, Name="Sakuya_RP"
value=28
[State -2, Victory Quote vs. Utsuho Reiuji]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Utsuho Reiuji" || Enemy, Name="Utsuho_RP"
value=29
[State -2, Victory Quote vs. Yukari Yakumo]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Yukari Yakumo" || Enemy, Name="Yukari_RP"
value=30
[State -2, Victory Quote vs. Yuuka Kazami]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Yuuka Kazami" || Enemy, Name="Yuuka_RP"
value=31
[State -2, Victory Quote vs. Yuyuko Saigyouji]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Yuyuko Saigyouji" || Enemy, Name="Yuyuko_RP"
value=32
[State -2, Victory Quote vs. Alice Margatroid]
type=VictoryQuote
triggerall = NumEnemy
trigger1=Enemy, Name="Alice Margatroid" || Enemy, Name="Alice_RP"
value=33
[state -2, Palette]
type = varset
trigger1 = AILevel&&!var(27)
var(27)= palno
ignorehitpause = 1
[state -2, No Clones]
type = remappal
triggerall=numenemy && (var(27)=[1,18])
trigger1=var(28)&&!numhelper(256)
trigger1=enemy,authorname="Colonel Sanders"&&enemy,name="IkuTronHD"&&enemy,var(27)=var(27) 
source = 1, 1
dest = 1, Ifelse(((teamside!=1&&!AILevel&&Enemy,AILevel=0)||(teamside!=1&&AILevel)||(teamside=1&&AILevel&&Enemy,AILevel=0)) && enemynear,Numhelper(256)=0,var(27)+1,var(27))
ignorehitpause = 1
[state -2, No Clones]
type = remappal
triggerall=numenemy && (var(27)=19)
trigger1=var(28)&&!numhelper(256)
trigger1=enemy,authorname="Colonel Sanders"&&enemy,name="IkuTronHD"&&enemy,var(27)=var(27) 
source = 1, 1
dest = 1, Ifelse(((teamside!=1&&!AILevel&&Enemy,AILevel=0)||(teamside!=1&&AILevel)||(teamside=1&&AILevel&&Enemy,AILevel=0)) && enemynear,Numhelper(256)=0,1,var(27))
ignorehitpause = 1
[state -2, Palette]
type = varset
trigger1 = numhelper(256)
trigger1=helper(256),var(27)=[1,19]
var(27)= helper(256),var(27)
ignorehitpause = 1
[state -2, Palette Selection]
type = remappal
trigger1 = numhelper(256)
trigger1=helper(256),var(27)=[1,19]
source = 1, 1
dest = 1, var(27)
ignorehitpause = 1
[state -2, Continue Palette]
type = remappal
trigger1=var(28)&&matchno>1&&var(27)
source = 1, 1
dest = 1, var(27)
ignorehitpause = 1

[State 256, Mode Selector on]
type=helper
triggerall= !numhelper(256) && var(40)=1 && roundstate<2 && !AILevel
triggerall= !numhelper(257) && ((stateno=[190,193])||stateno=0||(stateno=[6900,6901]))
trigger1= roundno = 1 && matchno=1
trigger2=(teammode = turns)
trigger2=!roundsexisted && (enemy,roundsexisted)
id=257
stateno=257
facing=facing
ownpal=1
size.xscale =0.5
size.yscale =0.5
persistent=0

[state -2, Custom Combo or MAX Mode]
type = varset
trigger1 = numhelper(257)
trigger1 = helper(257),time>0
trigger1 =var(40)&&roundstate<2
trigger1=helper(257),var(11)=[0,1]
var(54)= helper(257),var(11)
ignorehitpause = 1

[State -2, Finish]
type = ScreenBound
triggerall = (Life <= 0) || (!Alive) || (Lose)
trigger1 = (StateNo = 5150) && (RoundState = 4)
value = 0
MoveCamera = 0,0
IgnoreHitPause = 1

[State -2,screen]
type=ScreenBound
trigger1=p2stateno=4020&&p2movetype=H
value=p2bodydist x < 30 && BackEdgeDist < 30
[State -2,screen]
type=ChangeState
triggerall=roundstate=2
triggerall=Movetype != H && Stateno != 7827
trigger1=BackEdgeDist < -10 -const(size.ground.front)-const(size.ground.back)
trigger1=StateType != A
value=7827

[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nojugglecheck
IgnoreHitPause = 1

[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1

[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignorehitpause = 1

[State -2, GuardSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = moveguarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignorehitpause = 1

[State -2, Sparks]
type = helper
triggerall = StateNo != 1301 && StateNo != 1331
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && numenemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(34) = 8000 || var(34) = 8001
trigger3 = MoveHit = 1 && NumEnemy
trigger3 = var(33) = 8015 || var(33) = 8016 || var(33) = 8017
stateno = ifelse(moveguarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = p1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Counter FX]
type = helper
triggerAll = movehit = 1 && var(30) = hitpausetime
triggerAll = numenemy && var(9)
trigger1 = !(hitdefattr = SCA, AT) && (enemynear, movereversed != 1)
trigger2 = (EnemyNear, MoveReversed != 1) && StateNo = [1100,1299]
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(9) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Hit Detection]
type = varset
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = varrangeset
trigger1 = movetype = I
trigger2 = movetype = H && time
first = 30
last = 36
value = -1
ignorehitpause = 1

[State -2, P2 Facing]
type = targetfacing
trigger1 = movecontact = 1 && numtarget
trigger1 = !(target, hitshakeover) && !(target, hitfall) && (target, time <= 1)
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 5205
ignorehitpause = 1

[State -2, Prevent Guard]
type = assertspecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) -1)
flag = unguardable
ignorehitpause = 1

[State -2, Hitcount]
type = varadd
trigger1 = !IsHelper
trigger1 = movehit = 1
trigger1 = !HitPauseTime
trigger1 = !(hitdefattr = SCA, AT)
var(13) = 1

[State -2, Hitcount Reset]
type = varset
trigger1 = numenemy && var(13)
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)
var(13) = 0
ignorehitpause = 1

[State -2, Juggle Count]
type=varadd
trigger1= movehit=1
trigger1= !(hitdefattr=SCA,AT)
var(15)=1

[State -2, Juggle Reset Single]
type = varset
triggerall = numenemy = 1 && var(15)
trigger1 = (enemy, statetype != A) && (enemy, stateno != [5100, 5109]) && (enemy, time >= 0)
trigger2 = (enemy, movetype != H) || (enemy, stateno = [120, 155]) || (enemy, ctrl)
var(15) = 0
ignorehitpause = 1

[State -2, Juggle Reset Simul]
type = varset
triggerall = numenemy >= 2 && var(15)
trigger1 = (enemynear(0), statetype != A) && (enemynear(0), time >= 0)
trigger2 = (enemynear(0), movetype != H) || (enemynear(0), stateno = [120, 155]) || (enemynear(0), ctrl)
trigger3 = (enemynear(1), statetype != A) && (enemynear(0), time >= 0)
trigger4 = (enemynear(1), movetype != H) || (enemynear(0), stateno = [120, 155]) || (enemynear(0), ctrl)
var(15) = 0
ignorehitpause = 1

[State -2, Free Juggling]
type = varset
trigger1 = roundstate != 2
var(15) = 0
ignorehitpause = 1

[State -2, Juggle Flag]
type = varset
trigger1 = numenemy && !var(16)
trigger1 = (enemynear, stateno = 5040) && !(enemynear, ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = varset
triggerall = numenemy = 1 && var(16)
trigger1 = (enemy, movetype != H) && (enemy, stateno != 5040)
trigger2 = !(enemy, hitshakeover) || (enemy, statetype = L) || (enemy, ctrl)
var(16) = 0
ignorehitpause = 1

[State -2, Juggle Flag Reset Simul]
type = varset
triggerall = numenemy >= 2 && var(16)
trigger1 = (enemynear(0), movetype != H) && (enemynear(0), stateno != 5040)
trigger2 = !(enemynear(0), hitshakeover) || (enemynear(0), statetype = L) || (enemynear(0), ctrl)
trigger3 = (enemynear(1), movetype != H) && (enemynear(1), stateno != 5040)
trigger4 = !(enemynear(1), hitshakeover) || (enemynear(1), statetype = L) || (enemynear(1), ctrl)
var(16) = 0
ignorehitpause = 1

[State -2, Custom Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
trigger4 = (stateno = [3000, 4999])
var(20) = 0
ignorehitpause = 1

[State -2, Custom Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Custom Combo Asserts]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1

[State -2, Throws Allowed]
type = varset
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
trigger4 = var(20) || var(21) || var(22)
var(38) = 0

[State -2, Special/Super Throws Allowed]
type = VarSet
trigger1 = 1
var(43) = 0

[State -2, Special/Super Throws Disallowed]
type = VarSet
triggerall = NumEnemy
trigger1 = EnemyNear, StateNo = [150,155]
trigger2 = (EnemyNear, StateNo = 51 || EnemyNear, StateNo = 140) && (EnemyNear, PrevStateNo = [150, 155])
trigger3 = (EnemyNear, StateNo = [5020,5040]) && !(EnemyNear, HitFall)
trigger4 = ((EnemyNear, StateNo = 0) || (EnemyNear, StateNo = 52)) && (EnemyNear, PrevStateNo = [5000,5040]) && ((EnemyNear, Time <= 0) || !(EnemyNear, Ctrl))
trigger5 = (EnemyNear, StateNo = 0) && (EnemyNear, PrevStateNo = 52) && ((EnemyNear, Time <= 0) || !(EnemyNear, Ctrl))
trigger6 = (EnemyNear, StateNo = 40) && (EnemyNear, Time >= 1 || EnemyNear, PrevStateNo = 0 || EnemyNear, PrevStateNo = 52)
trigger7 = EnemyNear, StateNo = 5110
var(43) = 1
ignoreHitPause = 1

[State -2, Dampener]
type = varset
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignorehitpause = 1

[State -2, Dampener - Custom Combo]
type = varset
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignorehitpause = 1

[State -2, Dampener - Custom Combo Limiter]
type = varset
trigger1 = var(20)
trigger1 = StateNo = 250
fvar(10) = ifElse(var(13), 0, 0.72)
ignorehitpause = 1

[State -2, Dampener - Supers]
type = varset
trigger1 = (stateno = [3000, 4999])
fvar(10) = ifelse(var(22), 0.6, ifelse(var(21), 0.8, 1.0))
ignorehitpause = 1

[State -2, Dampener Limit]
type = varset
trigger1 = fvar(10) < 0
fvar(10) = 0
ignorehitpause = 1

[State -2, Root Dampener]
type = varset
trigger1 = 1
fvar(11) = fvar(10) * ifelse(var(9), 1.2, 1)
ignorehitpause = 1

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
trigger1 = var(47) >= 35
var(48) = 32

[State -2, Back Charge Buffer Decrement]
type = VarAdd
trigger1 = var(47) < 35 && var(48) > 0
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
trigger1 = var(49) >= 30
var(50) = 32

[State -2, Down Charge Buffer Decrement]
type = VarAdd
trigger1 = var(49) < 30 && var(50) > 0
var(50) = -1

[State -2, MAX Mode End]
type = VarSet
trigger1 = var(53) < 0
trigger2 = RoundState != 2
trigger3 = !Alive
trigger4 = (StateNo = [3000,4999])
var(53) = 0
ignoreHitPause=1

[State -2, MAX Mode Time]
type = VarAdd
trigger1 = var(53) > 0
ignorehitpause = 1
var(53) = -1

[State -2, MAX Mode PowerSet]
type = PowerSet
trigger1 = var(53) > 0
ignorehitpause = 1
value = var(24)

[State -2, MAX Mode PalFX]
type = PalFX
triggerall = var(53) > 0
trigger1 = !(GameTime % 2)
time = 1
add = 60,60,60
ignorehitpause = 1

[State -2, MAX Mode Atk Up]
type = AttackMulSet
trigger1 = var(53) > 0
value = 1.10

[State -2, MAX Mode Atk Reset]
type = AttackMulSet
trigger1 = var(53) <= 0
value = 1

[State -2, MAX Mode Def Up(New)];special thanks to Jesuszilla
type = LifeAdd
triggerall = Alive && MoveType = H
triggerall = var(53) ; MAX Mode 
trigger1 = (FVar(8)-life)>0
value = ifElse((FVar(8)-life)<life,floor((FVar(8)-life)*0.125),0)

[State -2, Life Holder];special thanks to Jesuszilla
type = VarSet
trigger1 = 1
fvar(8) = Life
ignorehitpause = 1

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, collapse/cheese kill snd]
type = playsnd
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = animelem = 10
value = f7, 0

[State -2, collapse/cheese kill FX]
type = explod
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = animelem = 10
anim = f60
postype = p1
pos = 0, 0
sprpriority = -3

[State -2, guard crush/throw escape voice]
type = playsnd
trigger1 = Anim = 5910 || Anim = 5920 || Anim = 5930
trigger1 = animelemtime(1) = 1
trigger2 = Anim = 5940 || Anim = 5945
trigger2 = AnimElem = 2 && StateNo != 890
value = 5940,0
channel = 0
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
text = "\np2bodydist x = %f p2dist y = %f x = %f"
params = p2bodydist x, p2dist y, EnemyNear, const(size.head.pos.y)
text = "\nBy You"
ignoreHitPause = 1

[State -2, Wall Impact Dust]
type = Helper
triggerall=!numhelper(8111) && numenemy
trigger1=P2movetype=H && p2stateno=1127 && enemy,time=1
trigger2=P2movetype=H && p2stateno=4061 && enemy,time=1
stateNo = 8111
ID = 8111
name = "Wall Impact Dust"
posType = P2
facing = -1
pos= floor(-5*const(size.xscale)),ceil(-70*const(size.yscale))
ownPal = 1
ignorehitpause=1

[State -2, Ground Impact Dust];Not used, but still added just incase...
type = Helper
triggerall=!numhelper(8110) && numenemy
trigger1=P2movetype=H && p2stateno=243 && enemy,time=1
trigger2=P2movetype=H && p2stateno=816 && enemy,time=4
stateNo = 8110
ID = 8110
name = "Ground Impact Dust"
posType = P2
facing = -1
pos = 0,0
ownPal = 1
ignorehitpause=1

;---------------------------------------------------------------------------

[State -2, DRAMATIC KO HELPER]
type = null;helper
trigger1 = teammode = single || teammode = turns
trigger1 = enemy, teammode = single || enemy, teammode = turns
trigger1 = roundstate = 2 && !numhelper(9944)
id = 9944
pos = 0,0
postype = p1
name = "DRAMATIC KO HELPER"
stateno = 9944
supermovetime = 9999999999
pausemovetime = 9999999999
;===========================================================================
;===============================< -3 STATES >=================================
;===========================================================================
[Statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

[State -3, ProjContact Reset]
type = varset
triggerall = var(18)
trigger1 = (StateNo != [1000,1030])
trigger1 = StateNo != 1050 && StateNo != 1080
var(18) = 0

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = !NumHelper(1001)
var(39) = 0
ignoreHitPause = 1

[State -3, Chain Reset]
type = varset
trigger1 = 1
var(4) = 0
ignorehitpause = 1

[State -3, Chain Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact
trigger2 = var(20) && (StateNo = [1000,1999]) && StateType != A && (MoveContact || var(18))
trigger2 = StateNo != [1300,1331]
trigger3 = var(20) && (StateNo = 1301 || StateNo = 1331) && StateType != A && (MoveContact || var(18))
trigger3 = (AnimElemTime(41) > 0 && StateNo = 1301) || (AnimElemTime(62) > 0 && StateNo = 1301)
var(4) = 1
ignorehitpause = 1

[State -3, Command Cancel Reset]
type = varset
trigger1 = 1
var(5) = 0
ignorehitpause = 1

[State -3, Command Cancel Check]
type = varset
triggerAll = !var(20)
trigger1 = (StateNo = [200,201]) && MoveContact
trigger2 = StateNo = 211 && MoveContact && AnimElemTime(5) < 0
trigger3 = StateNo = 221 && MoveContact && AnimElemTime(6) < 0
trigger4 = StateNo = 231 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact && AnimElemTime(5) < 0
trigger7 = StateNo = 241 && MoveContact 
trigger8 = StateNo = 430 && MoveContact
trigger9 = StateNo = 450 && MoveContact && AnimElemTime(6) < 0
trigger10 =StateNo = 420 || StateNo = 421 && MoveContact && AnimElemTime(5) < 0
trigger11 = StateNo = 251 && MoveContact && AnimElemTime(6) < 0
var(5) = 1
ignorehitpause = 1

[State -3, Cancel Reset]
type = varset
trigger1 = 1
var(6) = 0
ignorehitpause = 1

[State -3, Cancel Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,1999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = [200,201] 
trigger5 = StateNo = 211 && movecontact&&AnimElemTime(5) < 0
trigger6 = StateNo = 421 && movecontact&& AnimElemTime(5) < 0
trigger7 = StateNo = 231 && movecontact
trigger8 = StateNo = 400
trigger9 = StateNo = 410 && movecontact&& AnimElemTime(5) < 0
trigger10 = StateNo = 430
trigger11 = StateNo = 600
trigger12 = StateNo = 630
trigger13 = StateNo = 221 && MoveContact && AnimElemTime(6) < 0
trigger14 = StateNo = 241 && MoveContact ;&& AnimElemTime(5) < 0  
trigger15 = StateNo = 251 && MoveContact && AnimElemTime(6) < 0
trigger16 = StateNo = 440 && MoveContact && AnimElemTime(5) < 0
var(6) = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = 1
var(7) = 0
ignorehitpause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,1999]) && (MoveContact || var(18))
trigger3= (stateno=[200,221]) && movecontact=[1,10]
trigger4= (stateno=[230,240]) && movecontact=[1,10]
trigger5= (stateno=[400, 450]) && movecontact=[1,10]
trigger6 = Stateno = 1000 
trigger7 = Stateno = 1050
trigger8 = Stateno = 1010
trigger9 = Stateno = 1055
var(7) = 1
ignorehitpause = 1

[State -3, Hyper Cancel Reset]
type = varset
trigger1 = 1
var(8) = 0
ignorehitpause = 1
[State -3, Hyper Cancel Reset]
type = varset
trigger1 = stateno = 3110 && AnimElemTime(87) < 0 && MoveContact
var(8) = 1
ignorehitpause = 1

[State -3, Hyper Cancel Flag Reset]
type = varset
trigger1 = var(22)
trigger1 = (stateno != [3000, 4999]) || movetype = H
var(22) = 0
ignorehitpause = 1

[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2 && !numhelper(765) && !var(20)
triggerall = (movetype = I && ctrl) || (stateno = [760, 762]) || stateno = 5120
triggerall = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AIlevel
trigger1 = !AIlevel && (statetype = S || statetype = C || stateno = 5120) && (command = "fwd" || command = "down")
trigger2 = !AIlevel && statetype = A && (var(3) != 1 && var(3) != 2) && command = "fwd"
trigger3 = AIlevel && (stateno != [760, 762]) && inguarddist && random < 50
trigger4 = AIlevel && (stateno = [760, 762]) && time = 14 && random < 667
stateno = 765
ID = 765
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535

[State -3, Parry Attacks]
type = changestate
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = helper(765), stateno = 766
value = ifelse((helper(765), anim = 767), 762, ifelse((helper(765), anim = 766), 761, 760))
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 765)
attr = SA, AP
stateno = 760
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 766)
attr = C, AP
stateno = 761
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 767)
attr = SCA, AP
stateno = 762
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26) -1)
flag = nowalk
ignoreHitPause = 1

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, GetHitVar(HitShakeTime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Corner Push]
type = varset
triggerAll = MoveType != H
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1

[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = (statetype = S || statetype = C) && numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0

[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, ExFX]
type = varadd
trigger1 = var(25) > 0
var(25) = -1

[State -3, ExFX]
type = varset
trigger1 = (stateno != [1000, 2999]) || movetype = H
var(25) = 0

[State -3, Ex Flash]
type=PalFX
trigger1=!(GameTime % 2) && var(25)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3, Movement Afterimage]
type=AfterImage
triggerAll=Time=1 && !var(20)
trigger1=StateNo=50 && (var(3)=2 || var(3)=3)
trigger2=(StateNo=[700,715])
trigger3=StateNo=5950
time=2
timeGap=1
frameGap=4
length=9
palBright=0,0,0
palContrast=128,128,128
palPostBright=0,0,0
palAdd=0,0,0
palMul=0.9,0.9,0.9
trans=Add1

[State -3, Lv1 Super Afterimage]
type=AfterImage
trigger1=StateNo=3000 && Time=43
trigger2=StateNo=3020 && Time=43
trigger3=(StateNo=[3200,3210])&& Time=3
trigger4=(StateNo=[3030,3036])&& Time=3
time=2
timeGap=1
frameGap=10
length=21
palBright=0,0,0
palContrast=128,128,128
palPostBright=0,0,0
palAdd=0,0,0
palMul=0.75,0.75,0.75
trans=Add1

[State -3, Lv2 Super Afterimage]
type=AfterImage
trigger1=(StateNo=[3500,3531])&& Time=3
time=2
timeGap=1
framegap=10
length=21
palBright=0,0,0
palContrast=32,32,160
palPostBright=0,0,0
palAdd=0,0,0
palMul=0.75,0.75,0.75
trans=Add1

[State -3, Lv3 Super Afterimage]
type=AfterImage
trigger1 =(StateNo=[3200,3206])&& Time=3
time=2
timeGap=1
frameGap=10
length=21
palBright=0,0,0
palContrast=160,32,32
palPostBright=0,0,0
palAdd=0,0,0
palMul= 0.75,0.75,0.75
trans=Add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = stateno = 50 || (stateno = [600, 699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = stateno = [700, 715]
trigger4 = (StateNo = [3000,4999])
time = 2

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State -3, Prevent Crossup]
type = width
trigger1 = movetype != H
edge = 8, 0
ignorehitpause = 1

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A && movetype != H && numenemy
triggerall = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)), 0]
trigger1 = p2statetype = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
value = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < (250 * (AIlevel ** 2 / 64.0))
value = 5000, (random % 3)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, (random % 3)
channel = 0
ignorehitpause = 1

[State -3, Cheap KO]
type=ChangeState
trigger1=!Alive && (StateNo=[5000,5010])
trigger1=(PrevStateNo=[130,131]) || (PrevStateNo=[140,141]) || (PrevStateNo=[150,153])
value=5950
ignoreHitPause=1
[State -3, Assert: NoKOsnd (Cheap KO)]
type=AssertSpecial
trigger1=(StateNo=[5000,5010])
trigger1=(PrevStateNo=[130,131]) || (PrevStateNo=[140,141]) || (PrevStateNo=[150,153])
flag=NoKOsnd
ignoreHitPause=1

[State -3, Stop Guarding Voice]
type = StopSnd
trigger1 = StateNo = [120,155]
channel = 0

[State -3, Special Finish]
type = Helper
triggerall = roundstate >= 2
triggerall = WinKo && NumHelper(8600)=0 &&!var(20)
trigger1 = (stateno = [1000, 2999])&&movetype!=H
trigger2 = NumHelper(1000)
trigger2 = (Helper(1000), StateNo = [1000,1049]) && (Helper(1000), var(18))
trigger3 = NumHelper(1050)
trigger3 = (Helper(1050), StateNo = [1050,1050]) && (Helper(1050), var(18))
trigger4 = NumHelper(1110)
trigger4 = (Helper(1110), StateNo = [1110,1111]) && (Helper(1110), var(18))
ID = 8600
stateno = 8600
postype = back
pos = 0,0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
ownpal = 1
persistent=0

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(8605)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := stateno
trigger2 = (StateNo = [3000,3012])
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3020,3023])
trigger3 = var(23) := 3020
trigger4 = (StateNo = [3030,3036])
trigger4 = var(23) := 3030
trigger5 = (StateNo = [3500,3531])
trigger5 = var(23) := 3500
trigger6 = (StateNo = [3200,3206])
trigger6 = var(23) := 3200
stateno = 8605
ID = 8605
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -3, Special Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [1000,2999])
trigger1 = var(23) := stateno
trigger2 = (StateNo = [1000,1049])
trigger2 = var(23) := 1000
trigger3 = StateNo = 1050
trigger3 = var(23) := 1050
trigger4 = (StateNo = [1110,1011])
trigger4 = var(23) := 1110
trigger5 = StateNo = 1055
trigger5 = var(23) := 1055
stateno = 8600
ID = 8600
name = "Special Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1
