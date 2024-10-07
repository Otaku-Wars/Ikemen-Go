;==============================================================================================
;========================================<NORMAL MOVES>========================================
;==============================================================================================

;===========<STANDING LIGHT PUNCH>==========
[StateDef 200]
type = S
physics = S
moveType = A
anim = 200
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3,2
channel = 0

[State 200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givepower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
guard.pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -2.41, -7.50), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -2.41, -7.50)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 0
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 133), var(36):= -63
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48


[State 200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Medium Punch
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 0
;velset = 0,0
ctrl = 0
anim = 210
poweradd = 20
sprpriority = 2
facep2 = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
trigger2 = movecontact
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.97
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 0
[State 200, 1]
type = PlaySnd
trigger1 = animelem = 6
value = 0, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
value = S3,2
channel = 0

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
animtype = medium
guardflag = MA
hitflag = MAFD
pausetime = 5-var(49),4
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -54
hitsound = S2, 1
guardSound = -1 + 0 * (var(32) := 0)
ground.type = high
ground.slidetime = 13
ground.hittime  = 13
ground.velocity = -7.1682395373
guard.velocity = -7.303481116
airguard.velocity = -4.99536,1.21875 * (4.0/3.0) * const(size.yscale)
air.type = low
air.velocity = -5.33333,-0.6875 * (4.0/3.0) * const(size.yscale)
air.hittime = 13;18;24
;air.fall = 1
guard.ctrltime = 13
fall.recovertime = 13;18;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
forcenofall = 1
id = 210
p2facing = 1
[State this method is superior]
type = TargetState
trigger1 = numtarget(210)
trigger1 = var(21) = 1
trigger1 = !(target(210),ishelper) || (PlayerIDExist((target(210),id)) )
trigger1 = target(210),statetype=A
value = 500
ID = 210
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 6
attr = S, NA
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
animtype = medium
guardflag = MA
hitflag = MAFD
pausetime = 9-var(49),8
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -54
hitsound = S2, 1
guardSound = -1 + 0 * (var(32) := 0)
ground.type = high
ground.slidetime = 13
ground.hittime  = 13
ground.velocity = -7.1682395373
guard.velocity = -7.303481116
airguard.velocity = -4.99536,1.21875 * (4.0/3.0) * const(size.yscale)
air.type = low
air.velocity = -5.33333,-0.6875 * (4.0/3.0) * const(size.yscale)
air.hittime = 18;24
;air.fall = 1
guard.ctrltime = 12
fall.recovertime = 18;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
forcenofall = 1
id = 210

[State 210, 3]
type = ChangeAnim
triggerall = AnimElemTime(2) > 0 && AnimElemTime(3) <= 0
trigger1 = var(21) = 1
trigger2 = var(22) = 1
ignorehitpause = 1
;persistent = 0
value = 210
elem = 3

[State 210, 3]
type = ChangeAnim
triggerall = AnimElemTime(6) > 0 && AnimElemTime(7) <= 0
trigger1 = var(21) = 1
trigger2 = var(22) = 1
ignorehitpause = 1
;persistent = 0
value = 210
elem = 7

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 7
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;===========<STANDING MEDIUM PUNCH>==========
[StateDef 215]
type = S
physics = S
moveType = A
anim = 215
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
facep2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 0


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3,2
channel = 0

[State 215, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 3
forceNoFall = !var(20) || !var(14)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getPower = ifElse(!var(13), 144, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
guard.pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 95), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48


[State 215, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 215, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Hard Punch
[Statedef 220]
type    = S
movetype= A
physics = S
juggle  = 0
;velset = 0,0
ctrl = 0
anim = 220
poweradd = 55
sprpriority = 2
facep2 = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
trigger2 = movecontact
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 0, Helper]
type = Helper
trigger1 = time = 0
trigger1 = !numhelper(221)
helpertype = normal
name = "FX"
ID = 221
stateno = 221
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.9
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 0, 6

[State 0, Explod]
type = Explod
triggerall = !numexplod(222)
trigger1 = animelemtime(3) = 0
trigger2 = animelemtime(3) >= 0
trigger2 = animelemtime(12) < 0
;trigger1 = animelem = 3
;trigger2 = animelem = 5
;trigger3 = animelem = 7
;trigger4 = animelem = 9
anim = 222
ID = 222
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 2
removetime = -2
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 0
removeongethit = 1
ignorehitpause = 0

[State 200, 1]
type = HitDef
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(9) < 0
trigger1 = !movecontact
trigger1 = !movereversed
attr = S, NA
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
animtype = hard
guardflag = MA
hitflag = MAFD
pausetime = 11-var(49), 10
sparkXY = -10 + 0 * (var(35) := 145), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
hitsound = S2, 2
guardSound = -1 + 0 * (var(32) := 0)
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
guard.hittime  = 19;28
ground.velocity = -3.82684,-9.71155 * (4.0/3.0) * const(size.yscale)
guard.velocity = -10.3960536745
airguard.velocity = -4.99536,-0.79687 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = -3.82684,-9.71155 * (4.0/3.0) * const(size.yscale)
air.hittime = 19;28
air.fall = 1
fall = 1
guard.ctrltime = 16
fall.recovertime = 19;28
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
sprpriority = 2
id = 220
palfx.time = 30
palfx.add = 100,100,180
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 0
forcenofall = 1
p2facing = 1
[State this method is superior]
type = TargetState
trigger1 = numtarget(220)
trigger1 = var(21) = 1
trigger1 = !(target(220),ishelper) || (PlayerIDExist((target(220),id)) )
;trigger1 = target(220),statetype=A
value = 500
ID = 220
ignorehitpause = 1


[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 9
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; FX
[Statedef 221]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 221
sprpriority = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,anim != 220
trigger3 = parent,anim = 220
trigger3 = parent,animelemtime(12) >= 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add1
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 221
elem = parent,animelemno(0)
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x; + 6
y = parentdist y; - 11
ignorehitpause = 1

;------------------
; Hit by Fast Kung Fu Palm - shaking from the hit
; (a custom gethit state)
; See State 1020 for details
[Statedef 225]
type    = A
movetype= H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1

[State 1025, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = 1
value = 225

[State 1025, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 226

;------------------
; Hit by Fast Kung Fu Palm - flying through the air
; (a custom gethit state)
[Statedef 226]
type    = A
movetype= H
physics = N

[State 1026, Velocity]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 1026, Gravity]
type = VelAdd
trigger1 = 1
y = gethitvar(yaccel);.88

[State 1026, No scroll]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 1026, Hit wall]
type = ChangeState
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist <= 20
trigger2 = FrontEdgeBodyDist <= 20
value = 227

[State 1026, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;------------------
; Hit by Fast Kung Fu Palm - hit wall
; (a custom gethit state)
[Statedef 227]
type    = A
movetype= H
physics = N
velset = 0,0

;[State 1027, Sound]
;type = PlaySnd
;trigger1 = Time = 0
;value = F7,0

[State 1027, Anim]
type = ChangeAnim2
trigger1 = Time = 0
value = 227

[State 1027, Turn]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 30)

[State 1027, Pos]
type = PosAdd
trigger1 = Time = 0
x = 0 - BackEdgeBodyDist

[State 1027, Stop moving]
type = PosFreeze
trigger1 = animelemtime(7) < 0
x = 1
y = 1

[State 1027, No scroll]
type = ScreenBound
trigger1 = animelemtime(7) < 0
value = 1
movecamera = 0,1

;[State 1027, Spark]
;type = Explod
;trigger1 = Time = 0
;anim = F72
;pos = 0, floor (screenpos y) - 50
;postype = back
;sprpriority = 3

[State 1028, Gravity]
type = VelSet
trigger1 = animelemtime(7) = 0
x = 0.123;1.37
y = 0;-9

;[State 1028, Gravity]
;type = VelSet
;trigger1 = animelemtime(7) = 0
;trigger1 = animelemtime(8) < 0
;x = vel x + 0.29

[State 1028, Gravity]
type = VelSet
trigger1 = animelemtime(7) > 0
;x = vel x; + 0.09
y = vel y+gethitvar(yaccel)

[State 1028, Hit ground]
type = SelfState
trigger1 = animelemtime(7) >= 0
trigger1 = (Vel y > 0) && (Pos y >= 20)
value = 5100


;===========<STANDING LIGHT KICK>==========
[StateDef 230]
type = S
physics = S
moveType = A
anim = 230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,3

[State 230, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 3
forceNoFall = !var(20) || !var(14)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 72 * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
guard.pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 230, StateTypeSet: Idle]
type = StateTypeSet
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Stand Medium Kick
[Statedef 240]
type    = S
movetype= A
physics = S
juggle  = 0
;velset = 0,0
ctrl = 0
anim = 245
poweradd = 20
sprpriority = 2
facep2 = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != [100,105]
trigger2 = movecontact
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.94
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 0, 4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S3,2
channel = 0

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
animtype = medium
guardflag = MA
hitflag = MAFD
pausetime = 9-var(49), 8
getpower = (ifElse(!var(13), 144, 72) * !var(20)) || (ifElse(!var(13), 144, 72) * !var(14)), (36* !var(20)) || (36 * !var(14))
givePower = 36, 36
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 123), var(36) := -87
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 13
ground.hittime  = 13
ground.velocity = -7.4373626159
guard.velocity = -7.437358833
airguard.velocity = -4.99536,-0.79687 * (4.0/3.0) * const(size.yscale)
air.type = High
air.velocity = -5.42115,-5.81788 * (4.0/3.0) * const(size.yscale)
air.hittime = 13;18;24
;air.fall = 1
guard.ctrltime = 13
fall.recovertime = 13;18;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
forcenofall = 1
id = 240
p2facing = 1
[State this method is superior]
type = TargetState
trigger1 = numtarget(240)
trigger1 = var(21) = 1
trigger1 = !(target(240),ishelper) || (PlayerIDExist((target(240),id)) )
trigger1 = target(240),statetype=A
value = 500
ID = 240
ignorehitpause = 1


[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 5
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;===========<STANDING MEDIUM KICK>==========
[StateDef 245]
type = S
physics = S
moveType = A
anim = 240
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
faceP2 = 1



[State 245, Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,4
channel = 1

[State 245, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = (ifElse(!var(13), 144, 72) * !var(20)) || (ifElse(!var(13), 144, 72) * !var(14)), (36* !var(20)) || (36 * !var(14))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
guard.pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -5.05, -9.03), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -5.05, -9.03)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 123), var(36) := -87
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 245, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = I

[State 245, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<STANDING HEAVY KICK>==========
[StateDef 250]
type = S
physics = S
moveType = A
anim = 250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
faceP2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S2,16
channel = 0

[State 250, PosAdd]
type = PosAdd
trigger1 = !Time
x = 4

[State 250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 3
forceNoFall = !var(20) || !var(14)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
guard.pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 169), var(36) := -74
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 250, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<CROUCHING LIGHT PUNCH>==========
[StateDef 400]
type = C
physics = C
moveType = A
anim = 400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 0, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 0,1
channel = 0

[State 400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 3
forceNoFall = !var(20) || !var(14)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
guard.pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 0
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 114), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48


[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 400, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING MEDIUM PUNCH>==========
[StateDef 410]
type = C
physics = C
moveType = A
anim = 410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
faceP2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 0,1
channel = 0

[State 410, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getPower = ifElse(!var(13), 144, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
guard.pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), 1.66, 2.51), 0;-4.87
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 410, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING HEAVY PUNCH>==========
[StateDef 420]
type = C
physics = C
moveType = A
anim = 420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
faceP2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 0, 5




[State 420, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 4
forceNoFall = !var(20) || !var(14)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
guard.pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -131
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
forceStand = 1


[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 420, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;===========<CROUCHING LIGHT KICK>==========
[StateDef 430]
type = C
physics = C
moveType = A
anim = 430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1
[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3,1
channel = 0

[State 430, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 72 * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givepower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
guard.pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -7.49, 0
ground.cornerPush.velOff = 0
guard.velocity = -7.49
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -14
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinadd= -255, -255, -255, 48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING MEDIUM KICK>==========
[StateDef 440]
type = C
physics = C
moveType = A
anim = 440
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
faceP2 = 1

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3,2
channel = 0

[State 440, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = ifElse(!var(13), 144, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
guard.pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse((var(20) || var(14)), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -8
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = I

[State 440, End]
type = Changestate
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING HEAVY KICK>==========
[StateDef 450]
type = C
physics = C
moveType = A
anim = 450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))
faceP2 = 1

[State 450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 3.35

[State 450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 1

[State 450, VelSet]
type = VelSet
trigger1 = AnimElemTime (5) >= 0
x = 5.25

[State 450, VelSet]
type = VelSet
trigger1 = AnimElemTime (6) >= 4
x = 1.25

[State 450, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3,3
channel = 0

[State 450, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 4
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givepower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
guard.pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Trip
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.85, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 132), var(36) := -101
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 450, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<JUMPING LIGHT PUNCH>==========
[StateDef 600]
type = A
physics = N
moveType = A
anim = 600
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3,2
channel = 0

[State 600, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 0
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48



[State 600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<JUMPING MEDIUM PUNCH>==========
[StateDef 610]
type = A
physics  = N
moveType = A
anim = 610
ctrl = 0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 3,3
channel = 0

[State 610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getPower = ifElse(!var(13), 144, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
guard.pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2, 1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 73), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48



[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;Jump hard Punch
[Statedef 620]
type    = A
movetype= A
physics = N;A
juggle  = 0;ifelse(var(41) & floor(exp(5*ln(2)) + 0.5) ,1,0)
poweradd= 55
ctrl = 0
anim = 620
sprpriority = 2

[State 0, Apply gravity]
type = VelSet
trigger1 = time > 0
y = ifelse(sysvar(2)=1,ifelse(vel y+(0.6666666667 * const(size.yscale))>=13.375,13.375,vel y+(0.6666666667 * const(size.yscale))),vel y+(0.7222222222 * const(size.yscale)))

[State 0, Superjump autoturn]
type = Turn
triggerall = sysvar(2) = 1
triggerall = ctrl
trigger1 = p2dist x < 0
[State 0, Air Control for Superjumps]
type = VelSet
triggerall = prevstateno = 40
triggerall = sysvar(2) = 1
trigger1 = command = "holdfwd"
x = ifelse(vel x+0.427352>5.332,5.332,vel x+0.427352)
[State 0, Air Control for Superjumps]
type = VelSet
triggerall = prevstateno = 40
triggerall = sysvar(2) = 1
trigger1 = command = "holdback"
x = ifelse(vel x-0.427352<-5,-5,vel x-0.427352)

[State 0, Explod]
type = Explod
triggerall = !numexplod(222)
trigger1 = animelemtime(3) = 0
trigger2 = animelemtime(3) >= 0
trigger2 = animelemtime(14) < 0
;trigger1 = animelem = 3
;trigger2 = animelem = 5
;trigger3 = animelem = 7
;trigger4 = animelem = 9
anim = 622
ID = 222
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 2
removetime = -2
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 0
removeongethit = 1
ignorehitpause = 0

[State 0, Helper]
type = Helper
trigger1 = animelem = 3
trigger1 = !numhelper(621)
helpertype = normal
name = "FX"
ID = 621
stateno = 621
pos = 0,0
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = var(19)

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.9
ignorehitpause = 1

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 0, 2

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 0, 16

[State 600, 2]
type = HitDef
trigger1 = animelemtime(6) >= 0
trigger1 = animelemtime(12) < 0
trigger1 = !movecontact
trigger1 = !movereversed
attr = A, NA
hitflag = MAFD
animtype = hard
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
guardflag = HA
pausetime = 9-var(49),8
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -82
hitsound   = S2,2
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.velocity = -10.0959341968
guard.velocity = -10.0959341968
guard.ctrltime = 17
air.type = low
air.hittime = 18;24
air.velocity = -19.6157,6.05717 * (4.0/3.0) * const(size.yscale)
;air.velocity = -19.6157,6.7120875
airguard.velocity = -4.99072,-0.84375 * (4.0/3.0) * const(size.yscale)
air.fall = (prevstateno=[600,650])&&(sysvar(2)=1)
fall.recovertime = 18;30
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
id = 620
palfx.time = 30
palfx.add = 100,100,180
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 0
p2facing = 1
[State this method is superior]
type = TargetState
trigger1 = numtarget(620)
trigger1 = var(21) = 1
trigger1 = !(target(620),ishelper) || (PlayerIDExist((target(620),id)) )
trigger1 = target(620),statetype=A
value = ifelse((prevstateno=[600,650])&&sysvar(2)=1,624,625)
ID = 620
ignorehitpause = 1
[State time to go offscreen]
type = VarSet
triggerall = var(45) = 0
triggerall = prevstateno = [600,650]
triggerall = sysvar(2)=1
trigger1 = numtarget(620)
trigger1 = var(21) = 1
trigger1 = !(target(620),ishelper) || (PlayerIDExist((target(620),id)) )
trigger1 = target(620),statetype=A
var(45) = 1
ignorehitpause = 1
;persistent = 


[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 15
movetype = I

[State 0, CtrlSet]
type = CtrlSet
trigger1 = var(45) = 0 || backedgebodydist >= 1
trigger1 = sysvar(2) = 1
trigger1 = animelem = 15
value = 1
[State 0, Bad Religion's Fourth Album]
type = CtrlSet
triggerall = ctrl
trigger1 = var(45)>=2
trigger2 = var(45)=1
trigger2 = backedgebodydist < 8
value = 0
ignorehitpause = 1

[State land]
type = ChangeState
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 0
value = 52
ctrl = 0


;---------------------------------------------------------------------------
; FX
[Statedef 621]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 621
sprpriority = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,anim != 620
trigger3 = parent,anim = 620
trigger3 = parent,animelemtime(14) >= 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add1
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = parent,anim = 620
trigger1 = parent,animelemtime(14) < 0
value = 621
elem = parent,animelemno(0) - 2
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

;----------------------------------------------------------------------
; A custom state that just
[Statedef 624]
type = A
movetype = H
physics = N

[State 0, HitVelSet]
type = HitVelSet
trigger1 = time = 0
x = 1
y = 1
ignorehitpause = 1
[State 0, HitFallSet]
type = HitFallSet
trigger1 = time = 0
value = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = !hitshakeover
value = 1
ignorehitpause = 1

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5061),5061,5050)
ignorehitpause = 1
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = vel y > 0
value = anim
elem = animelemno(99)
ignorehitpause = 1
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = !hitshakeover
value = anim
elem = animelemno(0)
ignorehitpause = 1

[State 821, 1] ;Gravity
type = VelAdd
Trigger1 = hitshakeover
y = gethitvar(yaccel)

[State 821, 4] ;Hit ground
type = SelfState;ChangeState
;triggerall = hitfall; || !alive
Trigger1 = hitshakeover
trigger1 = Vel Y > 0
trigger1 = vel y + Pos Y >= 0
value = 5100;616 ;Hit ground

;----------------------------------------------------------------------
; A custom state that just
[Statedef 625]
type = A
movetype = H
physics = N

[State 0, HitVelSet]
type = HitVelSet
trigger1 = time = 0
x = 1
y = 1
ignorehitpause = 1
[State 0, HitFallSet]
type = HitFallSet
trigger1 = time = 0
value = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = !hitshakeover
value = 1
ignorehitpause = 1

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5061),5061,5050)
ignorehitpause = 1
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = vel y >= 0
value = anim
elem = animelemno(99)
ignorehitpause = 1
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = !hitshakeover
value = anim
elem = animelemno(0)
ignorehitpause = 1

[State 821, 1] ;Gravity
type = VelAdd
Trigger1 = hitshakeover
y = gethitvar(yaccel)

[State 821, 4] ;Hit ground
type = ChangeState;ChangeState
triggerall = alive
Trigger1 = hitshakeover
trigger1 = Vel Y > 0
trigger1 = vel y + Pos Y >= 0
value = 626;616 ;Hit ground

[State 821, 4] ;Hit ground
type = SelfState;ChangeState
triggerall = !alive
Trigger1 = hitshakeover
trigger1 = Vel Y > 0
trigger1 = vel y + Pos Y >= 0
value = 5100;616 ;Hit ground

;---------------------------------------------------------------------------
; Downed get-hit (hit ground from fall)
[Statedef 626]
type    = L
movetype= H
physics = N

[State 5100, 2004.04.14 behavior]
type = null;VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x < -1
x = -1

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

;[State 5100, 6] ;Reduce speed
;type = VelMul
;trigger1 = Time = 0
;x = 0.75

;[State 5100, 8]
;type = Explod
;trigger1 = Time = 1
;anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
;postype = none
;pos = pos x + camerapos x, 0
;facing = facing
;sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 0

;[State 5100, 10]
;type = PlaySnd
;trigger1 = Time = 1
;value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = time > 1
value = 627;Downed get-hit (bounce off ground)

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; Downed get-hit (bounce off ground)
[Statedef 627]
type    = A
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5200),5200,5040)

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = 0;Const(movement.down.bounce.offset.y)

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = -5.33333
;y = -1.375 * (4.0/3.0) * 1.07
;ignorehitpause = 
;persistent = 

[State 5101, 6] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = 0.6875; * (16.0/9.0)


[State 5101, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0;Const(movement.down.bounce.groundlevel)
type = SelfState
value = 52;5110


;===========<JUMPING LIGHT KICK>==========
[StateDef 630]
type = A
physics = N
moveType = A
anim = 630
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3,1
channel = 0

[State 630, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
guard.pauseTime = ifElse((var(20) || var(14)), 4, 8), ifElse((var(20) || var(14)), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 103), var(36) := -19
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 630, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 630, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<JUMPING MEDIUM KICK>==========
[StateDef 640]
type = A
physics = N
moveType = A
anim = 640
ctrl = 0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3,2
channel = 0

[State 640, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = ifElse(!var(13), 144, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
guard.pauseTime = ifElse((var(20) || var(14)), 5, 10), ifElse((var(20) || var(14)), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 98), var(36) := -107
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<JUMPING HEAVY KICK>==========
[StateDef 650]
type = A
physics = N
moveType = A
anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 18 * (!var(14) && !var(20))

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3,3
channel = 0

[State 650, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(20) || var(14)))
trigger1 = AnimElem = 2
forceNoFall = !var(20) || !var(14)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
guard.pauseTime = ifElse((var(20) || var(14)), 6, 12), ifElse((var(20) || var(14)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse((var(20) || var(14)), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse((var(20) || var(14)), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -12
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;Jump Dive Kick
[Statedef 655]
type    = A
movetype= A
physics = N
velset = 0,0
juggle  = 0;ifelse(var(42) & floor(exp(4*ln(2)) + 0.5) ,1,0)
poweradd= 11
ctrl = 0
anim = 655
sprpriority = 2

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(2) >= 0
value = ,NP,SP,HP
time = 2
ignorehitpause = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger1 = !numhelper(656)
helpertype = normal
name = "FX"
ID = 656
stateno = 656
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 4 * (4.0/3.0)
y = 8  * (4.0/3.0) * const(size.yscale)
persistent = 0
[State 0, VelSet]
type = VelAdd
trigger1 = animelemtime(2) > 0
trigger1 = sysvar(2) = 1
y = 0.375 * (16.0/9.0) * const(size.yscale)
persistent = 0

[State ProRation]
type = VarSet
trigger1 = var(21) = 1
fvar(13) = fvar(13) * 0.9
ignorehitpause = 1

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 3, 4
channel = 0

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 15
persistent = 0

[State 600, 2]
type = HitDef
trigger1 = !movecontact
trigger1 = !movereversed
attr = A, NA
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getPower = ifElse(!var(13), 216, 72) * (!var(14) && !var(20)), 36 * (!var(14) && !var(20))
givePower = 36, 36
hitflag = MAFPD
guardflag = HA
pausetime = 12-var(49),11
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := 0
ground.type = low
ground.slidetime = 19
ground.hittime  = 19
ground.velocity = -9.7240450217
guard.velocity = -9.9799366893
guard.ctrltime = 19
air.velocity = -8.01388,10.99165 * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99536,0.79687 * (4.0/3.0) * const(size.yscale)
air.fall = (prevstateno=[600,650])&&(sysvar(2)=1)
fall.recovertime = 18;30
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
id = 655
p2facing = 1
[State WHAMO]
type = TargetState
triggerall = numtarget
trigger1 = !target,ishelper
trigger1 = target,statetype=A
trigger1 = var(21)=1
value = ifelse((prevstateno=[600,650])&&sysvar(2)=1,624,625)
ignorehitpause = 1
;persistent = 0
[State time to go offscreen]
type = VarSet
triggerall = var(45) < 0
triggerall = prevstateno = [600,650]
triggerall = sysvar(2)=1
trigger1 = numtarget(655)
trigger1 = var(21) = 1
trigger1 = !(target(655),ishelper) || (PlayerIDExist((target(655),id)) )
trigger1 = target(655),statetype=A
var(45) = 1
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
triggerall = numtarget
triggerall = target,statetype != L
triggerall = pos y <= -16*const(size.yscale)
trigger1 = movecontact = [1,2]
trigger2 = movereversed = [1,2]
value = 658
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 30*const(size.yscale)
value = 52
ctrl = 0

;---------------------------------------------------------------------------
; FX
[Statedef 656]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 656
sprpriority = 4

[State 0, DestroySelf]
type = DestroySelf
;trigger1 = animtime = 0
trigger1 = parent,anim != 655
;trigger3 = parent,anim = 655

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add1
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = parent,hitpausetime
value = 656
elem = animelemno(0)
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

;---------------------------------------------------------------------------
;Bounce
[Statedef 658]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 1203
velset = -3.75,-10 * const(size.yscale)

[State 0, Apply gravity]
type = VelSet
trigger1 = time > 0
y = ifelse(vel y+(0.666666666 * const(size.yscale))>=13.375,13.375,vel y+(0.666666666 * const(size.yscale)))

[State 0, Bad Religion's Fourth Album]
type = CtrlSet
triggerall = ctrl
trigger1 = var(45)>=2
trigger2 = var(45)=1
trigger2 = backedgebodydist < 8
value = 0
ignorehitpause = 1
[State 0, VelSet]
type = CtrlSet
trigger1 = var(45) = 0 || backedgebodydist >= 1
trigger1 = var(45)<2
trigger1 = time = 30
value = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 0
value = 52
ctrl = 0

;-----------------------------------------------------------------

[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
damage = 100
attr = S, NT          ;Attributes: Standing, Normal Throw
hitflag = M          ;Affect only ground people who are not being hit
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
p1sprpriority = 1     ;Draw p1's sprite in front of p2
                      ;p2's sprite priority is set to 0 by default
p1facing = 1;ifelse(command="holdback",-1,1)
p2facing = 1          ;Force p2 to face KFM
p1stateno = 810       ;On success, KFM changes to state 810
;p2stateno = 820       ;Ignore this parm. Within the "actually getting someone to throw" states you'd have to resort to targetstate for putting opponents into custom states
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down
fall.recovertime = 60

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 220
ctrl = 0

;-------------------------------------------------------------
; Tech hit p1 state (tweaked from Kamekaze's Code)
[Statedef 801]
type = A
movetype= A
physics = N
juggle = 0
ctrl = 0
velset=0,0
anim = 801

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(811)
id = 811
ignorehitpause = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(841)
id = 841
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 1
anim = 809
ID = 809
pos = (enemynear,const(size.mid.pos.x)) + floor(enemynear,p2dist x/2),(enemynear,const(size.mid.pos.y))
postype = p2
facing = -1
vfacing = 1
bindtime = 1
removetime = -2
pausemovetime = 65535
supermovetime = 65535
scale = 1,1
sprpriority = 99
ontop = 1
shadow = 0,0,0
ownpal = 1
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S7,3

[State 0, ChangeState]
type = targetState
trigger1= time = 0
value =ifelse(prevstateno=810,803,802)

[State -2 Send the message]
type = Varset
trigger1 = time = 0
var(37) = var(37) | floor(exp(3*ln(2)) + 0.5)
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 =1 
value =0
;ignorehitpause = 
;persistent = 

[State 0, NotHitBy]
type = NotHitBy
trigger1 =1 
value = SCA
;value2 = S,NA
time = 1
;ignorehitpause = 
;persistent = 

[State 0, VelSet]
type = VelSet
trigger1 =animtime=0 
x = -7*(4.0/3.0)
y = -4*(4.0/3.0)

[State 0, ChangeAnim]
type = Changestate
trigger1 =animtime=0 
value =5040
ctrl=0

;-------------------------------------------------------------
; Tech hit p2 state
[Statedef 802]
type = A
movetype= A
physics = N
juggle = 0
ctrl = 0
velset=0,0
[State 0, NotHitBy]
type = NotHitBy
trigger1 =1 
value = SCA
;value2 = S,NA
time = 1
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time=0 
value = 801
[State 0, PlayerPush]
type = PlayerPush
trigger1 =1 
value =0
[State 0, VelSet]
type = VelSet
trigger1 =animtime=0 
x = -7*(4.0/3.0)
y = -4*(4.0/3.0)
[State 0, ChangeAnim]
type = selfstate
trigger1 =animtime=0 
value =5040
ctrl=0

;-------------------------------------------------------------
; Tech hit p2 state
[Statedef 803]
type = A
movetype= A
physics = N
juggle = 0
ctrl = 0
velset=0,0
[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0-const(size.head.pos.x)
y = 0-const(size.head.pos.y)
[State 0, NotHitBy]
type = NotHitBy
trigger1 =1 
value = SCA
;value2 = S,NA
time = 1
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time=0 
value = 801
[State 0, PlayerPush]
type = PlayerPush
trigger1 =1 
value =0
[State 0, VelSet]
type = VelSet
trigger1 =animtime=0 
x = -7*(4.0/3.0)
y = -4*(4.0/3.0)
[State 0, ChangeAnim]
type = selfstate
trigger1 =animtime=0 
value =5040
ctrl=0

;---------------------------------------------------------------------------
;Kung Fu Throw - Throwing the opponent
; Description: In this state, KFM throws the opponent by binding him to
;     various offsets based on his current frame of animation. For
;     example, [State 810, Bind 1] binds the opponent to an offset of
;     28 pixels in front of KFM. That puts him around where KFM's hand
;     is at. Is is important to keep the opponent bound using a
;     TargetBind controller at all times, until you let him go. This
;     is especially important if your player has a Clsn2 box that
;     allows him to get hit while throwing someone. Each time a player
;     gets hit, all his bound targets will be set to a fall state. If
;     the opponent is not bound, then he may get stuck in his thrown
;     state when his attacker is knocked out of the throw halfway.
; Notes: There is a TargetLifeAdd controller to decrease the opponent's
;     life, and a TargetState controller to change his state to a
;     falling state when KFM lets go of him.
[Statedef 810]
type    = S
movetype= A
physics = N
anim = 810
poweradd = 60

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = (command = "holdback")
[State 0, Turn]
type = Turn
trigger1 = time = 0
trigger1 = var(1)=1
[State 0, TargetFacing]
type = TargetFacing
trigger1 = time = 0
trigger1 = var(1)=1
value = -1

[State 0, Width]
type = Width
trigger1 = time = 0
edge = 66,0
player = 0,0
ignorehitpause =  1

[State 810, TargetState] ; This is the sctrl you'd use to put victims into custom states
type = TargetState
trigger1 = time = 0
value = 820

[State 810, Grab Sound]
type = PlaySnd
trigger1 = time = 0
value = 1, 1

[State 0, TECH HIT]
type = changestate
triggerall = time =[1,3]
triggerall = numtarget
trigger1= (target,command="c" || target,command="y" || target,command="b")
value =801

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 3
time = 12
freq = 250
ampl = -6

[State 810, Throw Sound]
type = PlaySnd
trigger1 = time = 6
value = 2, 800
channel = 0


[State 810, Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 2, 2

[State 810, Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0,9;0, 19

[State 810, Throw Sound]
type = PlaySnd
trigger1 = time = 44;AnimElem = 3
value = 0, 19

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 902
ID = 902
pos = floor(87*const(size.xscale)), floor(-152*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = var(19)
scale = 1,1
sprpriority = 66
ontop = 1
ownpal = 1
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 811
ID = 811
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = var(19)
scale = const(size.xscale),const(size.yscale)
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = time = 0
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 3
value = 2

[State 810, Bind 4]
type = TargetBind
trigger1 = animelemtime(2) < 0
pos = floor(54*const(size.xscale)), floor(-91*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = floor(73*const(size.xscale)), floor(-110*const(size.yscale))

[State 810, Bind 6]
type = TargetBind
trigger1 = animelem = 3
pos = floor(87*const(size.xscale)), floor(-152*const(size.yscale))

[State 810, Throw 11]
type = TargetState
trigger1 = AnimElem = 3
value = 821

[State 810, Hurt 11]
type = TargetLifeAdd
trigger1 = AnimElem = 3
value = ceil(-112 * fvar(13))
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = animelem = 3
fvar(13) = fvar(13) * 0.8

[State 810, State End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Thrown by Kung Fu Throw
; (a custom gethit state)
; Description: This is the state that the opponent changes to after being
;     hit by KFM's throw HitDef. The important thing here is to use a
;     ChangeAnim2 controller. The difference between ChangeAnim2 and
;     ChangeAnim is that ChangeAnim2 changes the player's animation to
;     an action in the AIR file of the attacker (in this case, kfm.air),
;     whereas ChangeAnim always changes the player to an action in his
;     own AIR file. Look at Action 820 in kfm.air for some extra
;     comments.
[Statedef 820]
type    = A
movetype= H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignorehitpause = 1

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

;In case attacker loses binding on player for any reason, this controller
;guarantees that the player will never get stuck in this thrown state.
[State 820, 2]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;Thrown by Kung Fu Throw - thrown into the air
[Statedef 821]
type    = A
movetype= H
physics = N
velset = 0,0;-4,-11.11

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0-const(size.head.pos.x)
y = 0-const(size.head.pos.y)

[State 0, VelAdd]
type = VelSet
trigger1 = time = 0
x = -5.10245
y = -14.21957 * (4.0/3.0) * 1.07

[State 0, VelAdd]
type = VelAdd
trigger1 = time
y = 0.5625 * (16.0/9.0) * 1.07

[State 5100, 2]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5052),5052,5030)
;[State 5100, 2]
;type = ChangeAnim
;trigger1 = time < 12
;value = anim
[State 5100, 2]
type = ChangeAnim
;triggerall = time >= 12
trigger1 = anim = [5030,5039]
trigger1 = animtime = 0
value = ifelse(anim=5030&&selfanimexist(5035),5035,5050)

[State 821, 2] ; Recover near ground (use ChangeState)
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER


[State 5100, 7]
type = SelfState
;triggerall = time >= 12
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 10
value = 5100 ;HIT_LIEDOWN



[Statedef 830]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
damage = 100
attr = S, NT          ;Attributes: Standing, Normal Throw
hitflag = M          ;Affect only ground people who are not being hit
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
p1sprpriority = 3     ;Draw p1's sprite in front of p2
                      ;p2's sprite priority is set to 0 by default
p1facing = 1
p2facing = 1          ;Force p2 to face KFM
p1stateno = 840       ;On success, KFM changes to state 810
;p2stateno = 820       ;Ignore this parm. Within the "actually getting someone to throw" states you'd have to resort to targetstate for putting opponents into custom states
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down
fall.xvelocity = -9.42809
fall.yvelocity = -11.31371 * (4.0/3.0) * const(size.yscale)
;yaccel = 1.07421875
fall.recovertime = 60

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 250
ctrl = 0


[Statedef 840]
type    = A
movetype= A
physics = N
anim = 840
poweradd = 60

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = (command = "holdback")
[State 0, Turn]
type = Turn
trigger1 = time = 0
trigger1 = var(1)=1
[State 0, TargetFacing]
type = TargetFacing
trigger1 = time = 0
trigger1 = var(1)=1
value = -1

[State 0, Width]
type = Width
trigger1 = time = 0
edge = 150,0
player = 0,0
ignorehitpause =  1

[State 810, TargetState] ; This is the sctrl you'd use to put victims into custom states
type = TargetState
trigger1 = time = 0
value = 850

[State 0, TECH HIT]
type = changestate
triggerall = time =[1,3]
triggerall = numtarget
trigger1= (target,command="z" || target,command="y" || target,command="b")
value =801

[State 810, Grab Sound]
type = PlaySnd
trigger1 = time = 0
value = 1, 1

[State 810, Grab Sound]
type = PlaySnd
trigger1 = time = 0
value = 0, 25
channel = 2

[State 0, StopSnd]
type = StopSnd
trigger1 = animelemtime(8) = 1;animtime = 0
channel = 2

[State 0, EnvShake]
type = EnvShake
trigger1 = animelemtime(8) = 1;time = 62 ; AnimElem = 8
time = 12
freq = 250
ampl = -6

[State 810, Throw Sound]
type = PlaySnd
trigger1 = time = 6
value = 2, 800
channel = 0

[State 810, Throw Sound]
type = PlaySnd
trigger1 = animelemtime(8) = 1;time = 62 ; AnimElem = 8
value = 5, 14

[State 0, Explod]
type = Explod
trigger1 = animelemtime(8) = 1;time = 62 ; animelem = 8
anim = 902
ID = 902
pos = floor(110*const(size.xscale)), 0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = var(19)
scale = 1,1
sprpriority = 66
ontop = 1
ownpal = 1
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(8) = 1;time = 62 ; animelem = 8
anim = 918
ID = 918
pos = floor(110*const(size.xscale)), 0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = var(19)
scale = 1,1
sprpriority = 62
ontop = 1
ownpal = 1
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 841
ID = 841
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = var(19)
scale = const(size.xscale),const(size.yscale)
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = time = 0
value = -2

[State 810, Bind 4]
type = TargetBind
trigger1 = animelemtime(3) < 0
pos = p2dist x, 0;floor(120*const(size.xscale)), 0

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [8,19]
pos = floor(127*const(size.xscale)), floor(-83*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [19,29]
pos = floor(126*const(size.xscale)), floor(-82*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [29,32]
pos = floor(112*const(size.xscale)), floor(-162*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [32,35]
pos = floor(101*const(size.xscale)), floor(-174*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [35,37]
pos = floor(53*const(size.xscale)), floor(-230*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [37,40]
pos = floor(67*const(size.xscale)), floor(-223*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [40,42]
pos = floor(-2*const(size.xscale)), floor(-253*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [42,48]
pos = floor(-8*const(size.xscale)), floor(-250*const(size.yscale))

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = time = [48,53]
pos = floor(53*const(size.xscale)), floor(-231*const(size.yscale))

[State 810, Bind 6]
type = TargetBind
trigger1 = animelemtime(8) = [0,1];time = 62 ; animelem = 8
pos = floor(143*const(size.xscale)), 0

[State 810, Throw 11]
type = TargetState
trigger1 = animelemtime(8) = [0,1];time = 62 ; AnimElem = 8
value = 851

[State 810, Hurt 11]
type = TargetLifeAdd
trigger1 = animelemtime(8) = 1;time = 62 ; AnimElem = 8
value = ceil(-112 * fvar(13))
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = animelemtime(8) = 1;time = 62 ; animelem = 8
fvar(13) = fvar(13) * 0.75

[State 810, State End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Thrown by Kung Fu Throw
; (a custom gethit state)
; Description: This is the state that the opponent changes to after being
;     hit by KFM's throw HitDef. The important thing here is to use a
;     ChangeAnim2 controller. The difference between ChangeAnim2 and
;     ChangeAnim is that ChangeAnim2 changes the player's animation to
;     an action in the AIR file of the attacker (in this case, kfm.air),
;     whereas ChangeAnim always changes the player to an action in his
;     own AIR file. Look at Action 820 in kfm.air for some extra
;     comments.
[Statedef 850]
type    = A
movetype= H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignorehitpause = 1

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 850

[State 820, 2]
type = SelfState
;trigger1 = time < 4
;trigger1 = !gethitvar(isbound)
trigger1 = time >= 300
value = 5050

[Statedef 851]
type    = A
movetype= H
physics = N
velset = 0,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
sysvar(0) = 0

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = 24

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = ifelse(selfanimexist(5101),5101,5100)

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = anim = 5061
value = anim
elem = animelemno(99)

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

[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F62
postype = p1
pos = 0, 0
facing = facing
sprpriority = 10

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, 2

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 852

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; Downed get-hit (bounce off ground)
[Statedef 852]
type    = L
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = 20;Const(movement.down.bounce.offset.y)

[State 5101, 5]
type = PosAdd
trigger1 = Time = 0
x = 0;Const(movement.down.bounce.offset.x)

[State 5101, 6] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = 0.5625 * (16.0/15.0) * 1.07;Const(movement.down.bounce.yaccel)

[State 5101, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12;Const(movement.down.bounce.groundlevel)
type = SelfState
value = 5110
