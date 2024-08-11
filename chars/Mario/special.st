;Light Fireball
[statedef 1000]
type = s
movetype = A
physics = s
anim = 1002
velset = 0,0
sprpriority = 2
poweradd = 72 * !var(20)
ctrl = 0
facep2 = 1

[state 1000, sound]
type = playsnd
trigger1 = animelem = 6
value = 1000,1

[state 1000, helper]
type = helper
trigger1 = animelem = 6
stateno = 1001
id = 1000
name = "Fireball"
pos = floor(27*(const(size.xscale))),0

[state 1000, idle]
type = statetypeset
trigger1 = animelem = 7
movetype = I

[state 1000, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcf_z", 3, ifelse(command = "qcf_y", 2, 1))

;-----------------------------------------------------
;Light Firebal Projectile
[statedef 1001]
type = A
movetype = A
physics = N
anim = 1102
velset = 3,0
sprpriority = 2
ctrl = 0

[state 1001, override]
type = hitoverride
trigger1 = 1
stateno = 1002
attr = SCA, AA, AT, AP

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 6
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 52 < 7, 7, (root, fvar(12)) * 52)), 8
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s6, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), ceil(-37*(const(size.yscale)))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1002
ignorehitpause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1002
ignoreHitPause = 1

[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

;-----------------------
;Fireball Hit
[Statedef 1002]
type = A
physics = N
movetype = I
anim = 1101
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 1006, End]
type = destroyself
trigger1 = !animtime
trigger2 = ishelper(1001) && parent, numhelper(1000)

;------------------------------------------
;Medium Fireball
[statedef 1010]
type = s
movetype = A
physics = s
anim = 1002
velset = 0,0
sprpriority = 2
poweradd = 72 * !var(20)
ctrl = 0
facep2 = 1

[state 1000, sound]
type = playsnd
trigger1 = animelem = 6
value = 1000,1

[state 1000, helper]
type = helper
trigger1 = animelem = 6
stateno = 1011
id = 1000
name = "Fireball"
pos = floor(27*(const(size.xscale))),0

[state 1000, idle]
type = statetypeset
trigger1 = animelem = 7
movetype = I

[state 1000, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcf_z", 3, ifelse(command = "qcf_y", 2, 1))

;-----------------------------------------------------
;Medium Firebal Projectile
[statedef 1011]
type = A
movetype = A
physics = N
anim = 1102
velset = 6,0
sprpriority = 2
ctrl = 0

[state 1001, override]
type = hitoverride
trigger1 = 1
stateno = 1002
attr = SCA, AA, AT, AP

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 6
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 52 < 7, 7, (root, fvar(12)) * 52)), 8
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s6, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), ceil(-37*(const(size.yscale)))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1002
ignorehitpause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1002
ignoreHitPause = 1

[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

;------------------------------------------
;Strong Fireball
[statedef 1020]
type = s
movetype = A
physics = s
anim = 1002
velset = 0,0
sprpriority = 2
poweradd = 72 * !var(20)
ctrl = 0
facep2 = 1

[state 1000, sound]
type = playsnd
trigger1 = animelem = 6
value = 1000,1

[state 1000, helper]
type = helper
trigger1 = animelem = 6
stateno = 1021
id = 1000
name = "Fireball"
pos = floor(27*(const(size.xscale))),0

[state 1000, idle]
type = statetypeset
trigger1 = animelem = 7
movetype = I

[state 1000, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcf_z", 3, ifelse(command = "qcf_y", 2, 1))

;-----------------------------------------------------
;Strong Firebal Projectile
[statedef 1021]
type = A
movetype = A
physics = N
anim = 1100
velset = 9,0
sprpriority = 2
ctrl = 0

[state 1001, override]
type = hitoverride
trigger1 = 1
stateno = 1002
attr = SCA, AA, AT, AP

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 6
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 52 < 7, 7, (root, fvar(12)) * 52)), 8
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s6, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), ceil(-37*(const(size.yscale)))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1002
ignorehitpause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1002
ignoreHitPause = 1

[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

;-----------------------------------------------------
;Strong Firebal Projectile
[statedef 1022]
type = A
movetype = A
physics = N
anim = 3102
velset = 5,0
sprpriority = 2
ctrl = 0

[state 1001, override]
type = hitoverride
trigger1 = 1
stateno = 1023
attr = SCA, AA, AT, AP

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 6
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 32 < 7, 7, (root, fvar(12)) * 32)), 8
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s6, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), ceil(-37*(const(size.yscale)))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1023
ignorehitpause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1023
ignoreHitPause = 1

[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

;-----------------------
;Fireball Hit
[Statedef 1023]
type = A
physics = N
movetype = I
anim = 3103
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 1006, End]
type = destroyself
trigger1 = !animtime
trigger2 = ishelper(1022) && parent, numhelper(3100)


;------------------------------------------
;EX Fireball
[statedef 1030]
type = s
movetype = A
physics = s
anim = 1002
velset = 0,0
sprpriority = 2
ctrl = 0
poweradd = -500
facep2 = 1

[state 1000, sound]
type = playsnd
trigger1 = animelem = 6
value = 1000,1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[state 1000, helper]
type = helper
trigger1 = animelem = 6
stateno = 1031
id = 1001
name = "EX Fireball"
pos = floor(15*(const(size.xscale))),ceil(-3*(const(size.yscale)))

[state 1000, idle]
type = statetypeset
trigger1 = animelem = 7
movetype = I

[state 1000, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1010, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

;-----------------------------------------------------
;EX Firebal Projectile
[statedef 1031]
type = A
movetype = A
physics = N
velset = 9,0
sprpriority = 2
ctrl = 0

[state 1031, anim]
type = changeanim
trigger1 = anim != 1100
value = 1100

[state 1031, lifevar]
type = varadd
trigger1 = !time
var(5) = 1

[state 1001, override]
type = hitoverride
trigger1 = 1
stateno = 1031
attr = SCA, AA, AT, AP

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 6
persistent = 0
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
triggerall = var(5) < 3
trigger1 = !(Root, var(16)) && (Root, var(15) < 5 || Root, var(20))
trigger1 = var(2) < 2
trigger2 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger2 = var(2) = 2
ID = 1015
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * 52 < 7, 7, (root, fvar(12)) * 52)), 8
;damage = ceil(62 * root, fvar(12)), 7
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 2), 6
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s6, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -3.5, -5
ground.cornerpush.veloff = 0
air.velocity = -3.5, -5.35
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
yaccel = 0.45
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1015, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), ceil(-37*(const(size.yscale)))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1031
ignorehitpause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1031
ignoreHitPause = 1

[state 1031, realend]
type = changestate
trigger1 = var(5) >= 3
value = 1002
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

;---------------------------------------------------------
;Light Mario Tornado
[statedef 1100]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1200
velset = 3,0 
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcb_z", 3, ifelse(command = "qcb_y", 2, 1))

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 || animelem = 4 || animelem = 7
attr = S, SA
damage = ceil(ifelse(fvar(12) * 10 < 7, 7, fvar(12) * 10)), 3
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 10, 20)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -85
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7.35
air.cornerpush.veloff = 0
getpower = 36 * !var(20), 18 * !var(20)
givepower = 18, 18
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 29), var(36):= -43
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 9
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 36, 108) * !var(20), 18 * !var(20)
givepower = 18, 18
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -33
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 7
value = 0,0
channel = 1
ignorehitpause = 1

[state 200, swingsnd2]
type = playsnd
trigger1 = animelem = 9
value = 0,2
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,6
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,8
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 11
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------
;Medium Mario Tornado
[statedef 1110]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1201
velset = 6,0 
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcb_z", 3, ifelse(command = "qcb_y", 2, 1))

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 6 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 || animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13
attr = S, SA
damage = ceil(ifelse(fvar(12) * 10 < 7, 7, fvar(12) * 10)), 3
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 10, 20)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -85
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7.35
air.cornerpush.veloff = 0
getpower = 36 * !var(20), 18 * !var(20)
givepower = 18, 18
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 29), var(36):= -43
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 6 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 16
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -1.2, -1.72), -7.5
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2), -8
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 36, 108) * !var(20), 18 * !var(20)
givepower = 18, 18
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -33
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13
value = 0,0
channel = 1
ignorehitpause = 1

[state 200, swingsnd2]
type = playsnd
trigger1 = animelem = 15
value = 0,2
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,6
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,9+(random%3)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 17
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------
;Strong Mario Tornado
[statedef 1120]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1202
velset = 9,0 
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcb_z", 3, ifelse(command = "qcb_y", 2, 1))

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 8 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 || animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16 || animelem = 19
attr = S, SA
damage = ceil(ifelse(fvar(12) * 10 < 7, 7, fvar(12) * 10)), 3
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 10, 20)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -85
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7.35
air.cornerpush.veloff = 0
getpower = 36 * !var(20), 18 * !var(20)
givepower = 18, 18
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 29), var(36):= -43
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 8 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 22
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -4.77, -6.52), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -5.5, -7), -5.5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 36, 108) * !var(20), 18 * !var(20)
givepower = 18, 18
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -33
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16 || animelem = 19
value = 0,0
channel = 1
ignorehitpause = 1

[state 200, swingsnd2]
type = playsnd
trigger1 = animelem = 21
value = 0,2
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,6
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,9+(random%3)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 23
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------
;Light Super Jump Punch
[statedef 1200]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
facep2 = 1
sprpriority = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "dpf_z", 3, ifelse(command = "dpf_y", 2, 1))

[state 1200, invulnerability]
type = nothitby
trigger1 = time <= 4
value = SCA

[state 1200, sound]
type = playsnd
trigger1 = animelem = 1
value = 1000,2

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 1
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, SA
damage = ceil(ifelse(fvar(12) * 85 < 7, 7, fvar(12) * 85)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -14), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 1
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, SA
damage = ceil(ifelse(fvar(12) * 85 < 7, 7, fvar(12) * 85)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -18
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 1
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = S, SA
damage = ceil(ifelse(fvar(12) * 85 < 7, 7, fvar(12) * 85)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1200, jump]
type = changestate
trigger1 = animtime = 0
value = 1201

;-----------------------------------
;Light Super Jump Punch - Air
[statedef 1201]
type = A
physics = N
movetype = A
anim = 1501
ctrl = 0
velset = 5, -5
sprpriority = 1

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 1
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 1 || animelem = 2
attr = A, SA
damage = ceil(ifelse(fvar(12) * 85 < 7, 7, fvar(12) * 85)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1201, newvel]
type = velset
trigger1 = animelem = 3
x = 0
y = 0

[state 1201, grav]
type = veladd
trigger1 = time >= 7
y = .5

[state 1201, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[state 1201, land]
type = changestate
trigger1 = pos y >= 0
trigger1 = time > 1
value = 1202

;--------------------------------------------------
;Super Jump Punch Land
[statedef 1202]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1502
velset = 0,0

[state 1202, ground]
type = posset
trigger1 = pos y != 0
y = 0

[state 1202, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------------------
;SJP Helper
[statedef 1203]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1506
velset = 0,-5
sprpriority = 6

[state 1203, grav]
type = veladd
trigger1 = 1
y = .3

[state 1203, end]
type = destroyself
trigger1 = time = 32

;---------------------------------------------------------------
;Medium Super Jump Punch
[statedef 1210]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
facep2 = 1
sprpriority = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "dpf_z", 3, ifelse(command = "dpf_y", 2, 1))

[state 1200, invulnerability]
type = nothitby
trigger1 = 1
value = SCA

[state 1200, sound]
type = playsnd
trigger1 = animelem = 1
value = 1000,2

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 2
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, SA
damage = ceil(ifelse(fvar(12) * 50 < 7, 7, fvar(12) * 50)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -14), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 2
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, SA
damage = ceil(ifelse(fvar(12) * 50 < 7, 7, fvar(12) * 50)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ceil(ifelse(fvar(12) * 70 < 7, 7, fvar(12) * 70)), 7
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -18
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 2
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = S, SA
damage = ceil(ifelse(fvar(12) * 50 < 7, 7, fvar(12) * 50)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1200, jump]
type = changestate
trigger1 = animtime = 0
value = 1211

;-----------------------------------
;Medium Super Jump Punch - Air
[statedef 1211]
type = A
physics = N
movetype = A
anim = 1503
ctrl = 0
velset = 5, -5
sprpriority = 1

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 2
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
attr = A, SA
damage = ceil(ifelse(fvar(12) * 50 < 7, 7, fvar(12) * 50)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1201, newvel]
type = velset
trigger1 = animelem = 4
x = 0
y = 0

[state 1201, grav]
type = veladd
trigger1 = time >= 10
y = .5

[state 1201, idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[state 1201, land]
type = changestate
trigger1 = pos y >= 0
trigger1 = time > 1
value = 1202

;---------------------------------------------------------------
;Heavy Super Jump Punch
[statedef 1220]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
facep2 = 1
sprpriority = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "dpf_z", 3, ifelse(command = "dpf_y", 2, 1))

[state 1200, invulnerability]
type = nothitby
trigger1 = time <= 2
value = SCA

[state 1200, sound]
type = playsnd
trigger1 = animelem = 1
value = 1000,2

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 3
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -14), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 3
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ceil(ifelse(fvar(12) * 70 < 7, 7, fvar(12) * 60)), 7
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -18
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 3
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1200, jump]
type = changestate
trigger1 = animtime = 0
value = 1221

;-----------------------------------
;Heavy Super Jump Punch - Air
[statedef 1221]
type = A
physics = N
movetype = A
anim = 1505
ctrl = 0
velset = 5, -5
sprpriority = 1

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 3
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
attr = A, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1201, newvel]
type = velset
trigger1 = animelem = 6
x = 0
y = 0

[state 1201, grav]
type = veladd
trigger1 = time >= 13
y = .5

[state 1201, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[state 1201, land]
type = changestate
trigger1 = pos y >= 0
trigger1 = time > 1
value = 1202

;---------------------------------------------------------------
;EX Super Jump Punch
[statedef 1230]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1010, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[state 1200, invulnerability]
type = nothitby
trigger1 = !time
value = SCA
time = 10

[state 1200, sound]
type = playsnd
trigger1 = animelem = 1
value = 1000,2

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 4
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -14), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 4
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -18
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 4
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1200, jump]
type = changestate
trigger1 = animtime = 0
value = 1231

;-----------------------------------
;EX Super Jump Punch - Air
[statedef 1231]
type = A
physics = N
movetype = A
anim = 1505
ctrl = 0
velset = 5, -5
sprpriority = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "dpf_z", 3, ifelse(command = "dpf_y", 2, 1))

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && var(18) < 4
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
attr = A, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1201, newvel]
type = velset
trigger1 = animelem = 6
x = 0
y = 0

[state 1201, grav]
type = veladd
trigger1 = time >= 13
y = .5

[state 1201, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[state 1201, land]
type = changestate
trigger1 = pos y >= 0
trigger1 = time > 1
value = 1202

;------------------------------------------------------------------------
;Light Hammer Strike
[statedef 1300]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1900
velset = 0,0 
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcf_c", 3, ifelse(command = "qcf_b", 2, 1))

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 8
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), 3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1300, idle]
type = statetypeset
trigger1 = animelem = 9
movetype = I

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,2
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,5
channel = 0

[state 1300, swing]
type = playsnd
trigger1 = animelem = 6
value = 0,6
channel = 1

[state 1300, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------
;Medium Hammer Strike
[statedef 1301]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1901
velset = 0,0 
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcf_c", 3, ifelse(command = "qcf_b", 2, 1))

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 8
attr = S, SA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), -1
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), 3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1300, idle]
type = statetypeset
trigger1 = animelem = 9
movetype = I

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,2
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,5
channel = 0

[state 1300, swing]
type = playsnd
trigger1 = animelem = 6
value = 0,6
channel = 1

[state 1300, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------
;Strong Hammer Strike
[statedef 1302]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1901
velset = 0,0 
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
var(10) = ifelse(command = "qcf_c", 3, ifelse(command = "qcf_b", 2, 1))

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 8
attr = S, SA
damage = ceil(ifelse(fvar(12) * 27 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), -1
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), 3
air.cornerpush.veloff = 0
down.hittime = 18 + 4 * var(29)
down.velocity = ifelse(var(20), -2.77, -4.52), -1
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1300, idle]
type = statetypeset
trigger1 = animelem = 9
movetype = I

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,2
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,5
channel = 0

[state 1300, swing]
type = playsnd
trigger1 = animelem = 7
value = 0,6
channel = 1

[state 1300, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------
;EX Hammer Strike
[statedef 1303]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1902
velset = 0,0 
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1010, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 8
attr = S, SA
damage = ceil(ifelse(fvar(12) * 27 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -3.77, -6.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -3
air.cornerpush.veloff = 0
getpower = 0,0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 210, Hit2]
type = hitdef
trigger1 = !var(16) && (var(17) < 4 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 13
attr = S, SA
damage = ceil(ifelse(fvar(12) * 30 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -1.77, -2.52), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 5), var(36) := -96
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1300, idle]
type = statetypeset
trigger1 = animelem = 14
movetype = I

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,2
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,5
channel = 0

[state 1300, swing]
type = playsnd
trigger1 = animelem = 7 || animelem = 12
value = 0,6
channel = 1

[state 1303, vel]
type = velset
trigger1 = animelem = 7 || animelem = 12
x = 7.5

[state 1300, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Light Raccoon Tail
[Statedef 1400]                                   
type = A
movetype = A
poweradd = 65
velset = 0,0
juggle = 5
ctrl = 0
anim = 1700

[State 1300, 0]
type = PlaySnd
trigger1 = Time = 1
value = S55, 0
volume = 60

[State 1300, 0]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = S44, 4
volume = 60

[State 1300, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 10.5

[State 1300, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0
trigger1 = AnimElemTime(6) < 0
x = .95

[State 1300, Velocity]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = .88

[State 1300, 2]
type = hitdef
trigger1 = AnimElem = 3
attr = S, SA
hitflag = MAFD
guardflag = MA
animtype = HEAVY
damage = 55,5
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -5,-4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall = 1
fall.recover = 0      
   
[State 1300, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;Heavy Raccoon Tail
[Statedef 1401]                                   
type = A
movetype = A
poweradd = 65
velset = 0,0
juggle = 5
ctrl = 0
anim = 1700

[State 1301, 0]
type = PlaySnd
trigger1 = Time = 1
value = S55, 0
volume = 60

[State 1301, 0]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = S44, 4
volume = 60

[State 1301, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 13.5

[State 1301, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0
trigger1 = AnimElemTime(6) < 0
x = .95

[State 1301, Velocity]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = .88

[State 1301, 2]
type = hitdef
trigger1 = AnimElem = 3
attr = S, SA
hitflag = MAFD
guardflag = MA
animtype = HEAVY
damage = 98,13
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -6,-5
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall = 1
fall.recover = 0   
   
[State 1301, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;EX Raccoon Tail
[Statedef 1410]                                   
type = A
movetype = A
poweradd = -500
velset = 0,0
juggle = 5
ctrl = 0
anim = 1700

[State 1310, 0] ;Eat Projectiles
type = Projectile
trigger1 = Time = [7,18]
attr = S, HP
hitflag = P
projanim = 10050
projremovetime = 1
projstagebound = 300
projedgebound = 300
velocity = Vel X, Vel Y

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [1,7]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S98,0
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 1310, 0]
type = PlaySnd
trigger1 = Time = 1
value = S55, 0
volume = 60

[State 1310, 0]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = S44, 4
volume = 60

[State 0, PalFXWiz]
type = PalFX
trigger1 = time = 0
time = 2
add = 140,140,40
mul = 256,256,256
sinadd = 100,100,100,3
invertall = 1
color = 0
ignorehitpause = 0
;persistent = 1

[State 1310, Afterimage]
type = AfterImage
trigger1 = animelem = 1
length = 13
PalBright   =  30, 30, 30
PalContrast =  70, 70, 20
PalAdd      = -10,-10,-10
PalMul      = .85,.85,.50
TimeGap  = 1
FrameGap = 2
Trans = Add
time = 25

[State 1310, Velocity]
type = VelSet
trigger1 = AnimElem = 4
x = 16.5

[State 1310, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0
trigger1 = AnimElemTime(8) < 0
x = .95

[State 1310, Velocity]
type = VelMul
trigger1 = AnimElemTime(8) >= 0
x = .88

[State 1310, 1]
type = hitdef
trigger1 = AnimElem = 3 || AnimElem = 5
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = HEAVY
damage = 45, 5
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall.recover = 0
envshake.time = 10
envshake.ampl = 3

[State 1301, 2]
type = hitdef
trigger1 = AnimElem = 7
attr = S, SA
hitflag = MAFD
guardflag = MA
animtype = HEAVY
damage = 45, 5
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -6,-5
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall = 1
fall.recover = 0 
   
[State 1310, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1
;---------------------------------------------------------------------------
;Air Light Raccoon Tail
[Statedef 1403]                                   
type = A
movetype = A
poweradd = 65
velset = 0,0
juggle = 5
ctrl = 0
anim = 1700

[State 1303, 0]
type = PlaySnd
trigger1 = Time = 1
value = S55, 0
volume = 60

[State 1303, 0]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = S44, 4
volume = 60

[State 1303, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 10.5

[State 1303, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0
trigger1 = AnimElemTime(6) < 0
x = .95

[State 1303, Velocity]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = .88

[State 1303, 2]
type = hitdef
trigger1 = AnimElem = 3
attr = S, SA
hitflag = MAFD
guardflag = MA
animtype = HEAVY
damage = 55,5
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -5,-4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall = 1
fall.recover = 0      
   
[State 1303, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 51
ctrl = 1

;---------------------------------------------------------------------------
;Air Heavy Raccoon Tail
[Statedef 1404]                                   
type = A
movetype = A
poweradd = 65
velset = 0,0
juggle = 5
ctrl = 0
anim = 1700

[State 1304, 0]
type = PlaySnd
trigger1 = Time = 1
value = S55, 0
volume = 60

[State 1304, 0]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = S44, 4
volume = 60

[State 1304, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 13.5

[State 1304, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0
trigger1 = AnimElemTime(6) < 0
x = .95

[State 1304, Velocity]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = .88

[State 1304, 2]
type = hitdef
trigger1 = AnimElem = 3
attr = S, SA
hitflag = MAFD
guardflag = MA
animtype = HEAVY
damage = 98,13
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -6,-5
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall = 1
fall.recover = 0   
   
[State 1304, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 51
ctrl = 1

;---------------------------------------------------------------------------
;EX Air Raccoon Tail
[Statedef 1411]                                   
type = A
movetype = A
poweradd = -500
velset = 0,0
juggle = 5
ctrl = 0
anim = 1700

[State 1310, 0] ;Eat Projectiles
type = Projectile
trigger1 = Time = [7,18]
attr = S, HP
hitflag = P
projanim = 10050
projremovetime = 1
projstagebound = 300
projedgebound = 300
velocity = Vel X, Vel Y

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [1,7]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S98,0
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 1311, 0]
type = PlaySnd
trigger1 = Time = 1
value = S55, 0
volume = 60

[State 1311, 0]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = S44, 4
volume = 60

[State 0, PalFXWiz]
type = PalFX
trigger1 = time = 0
time = 2
add = 140,140,40
mul = 256,256,256
sinadd = 100,100,100,3
invertall = 1
color = 0
ignorehitpause = 0
;persistent = 1

[State 1311, Afterimage]
type = AfterImage
trigger1 = animelem = 1
length = 13
PalBright   =  30, 30, 30
PalContrast =  70, 70, 20
PalAdd      = -10,-10,-10
PalMul      = .85,.85,.50
TimeGap  = 1
FrameGap = 2
Trans = Add
time = 25

[State 1311, Velocity]
type = VelSet
trigger1 = AnimElem = 4
x = 16.5

[State 1311, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0
trigger1 = AnimElemTime(8) < 0
x = .95

[State 1311, Velocity]
type = VelMul
trigger1 = AnimElemTime(8) >= 0
x = .88

[State 1311, 2]
type = hitdef
trigger1 = AnimElem = 3 || Animelem = 5 || Animelem = 7
attr = S, SA
hitflag = MAFD
guardflag = MA
animtype = HEAVY
damage = 45, 5
pausetime = 15,20
sparkno = 2
sparkxy = -10,-55
hitsound = S5, 3           
guardsound = 6, 0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -6,-5
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -6.4,-3
air.hittime = 20
fall = 1
fall.recover = 0   
   
[State 1311, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 51
ctrl = 1
