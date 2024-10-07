; ________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< HELPER STATES >========================================
;==============================================================================================

;========================< PALETTE SELECTOR >=============================
;Palette Selector
[Statedef 256]
physics = N
anim = 256
velset=0,0
sprpriority=99999
 
[State 256, PosSet]
type = PosSet
trigger1 =!time 
x = root, facing * ifelse(root,stateno=190,90,-90)
y = 20
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 256, Reset]
type=varset
trigger1=!time
var(56)=200
[State 256, Pal]
type=varset
trigger1=!time
var(11)=root,var(11)

[State 256, Varset]
type=varset
trigger1=var(11)<1||var(11)>13
var(11)=1+(var(11)<1)*12

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 20
[State 256, PlaySnd]
type = PlaySnd
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(56)<=5
value = S256,1
volumescale = 50
channel = 20
persistent =0 

[State 256, Countdown]
type = VarAdd
trigger1 =1 
var(56)=-1
[State 256, Countdown]
type = VarAdd
trigger1=!var(10)&&var(56)<150
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(56)=25

[State 256, Varadd]
type=varadd
trigger1=!var(10)
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(11)=1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

[State 256, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 256, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 256, End]
type=destroyself
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(56)<=0
trigger3=root,AILevel

;---------------------------------------------------------------------------
;Empty
[Statedef 258]
physics = N
velset = 0,0
ctrl = 0
anim = 9999
[State 258, End]
type=destroyself
trigger1=Roundstate>=2

;------------------------------------------------
;P1 Zoom FX
[Statedef 259]
type = S
velset = 0,0
anim = 9999
sprpriority = 4

[State 259, Explode]
type = Explod
triggerall = NumExplod(259) = 0
trigger1 = time = 0
anim = parent, var(52)
ID = 259
pos = 0,0
ontop = 1
removetime = 30
scale = .01*(var(51)),.01*(var(51))
sprpriority = 4
removeongethit = 0 
ownpal = 0
supermove = 1

[State 259, Modify Explod]
type = ModifyExplod
trigger1 = time > 0
ID = 259
scale = .01*(var(51)),.01*(var(51))
removetime = 30
supermove = 1

[State 259, VarSet]
type = Varset
trigger1 = !time
v =  51
value = 200

[State 259, VarAdd]
type = VarAdd
triggerall = Var(51) > 100
trigger1 = timemod = 1,0
v =  51
value = -5

[State 259, VarSet]
type = Varset
trigger1 = Var(51) <= 100
v =  51
value = 100

[State 259, Remove Explode]
type = RemoveExplod
trigger1 = time = 20
ID = 5301

[State 259, Destroy Self]
type = DestroySelf
trigger1 = time = 20

;========================< Fireball >=============================
;Fireball (Base)
[Statedef 1005]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1005

[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = ifelse(root, var(2) >= 200, 4, ifelse(root, var(2) >= 120, 3, ifelse(root, var(2) >= 60, 2, ifelse(root, var(2) >= 20, 1, 0))))

[State 3025, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3025, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 1 + var(10)

[State 0, Speed Var]
type = VarSet
trigger1 = !time
var(6) = ifelse(root, var(10) = 3, 6, ifelse(root, var(10) = 2, 5.5, 4.375))+var(10)

[State 0, TIME Var]
type = Varadd
trigger1 = time
var(7)= 1
ignorehitpause=0
[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(2)=1 || time>1,var(6),2)

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,2

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 35 < 35, 35, (root, fvar(12)) * 35)), 4
animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 0, 14 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
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
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
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
helperType = Normal
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
value = 1006
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Fireball Explosion (Base)
[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 37
[State 1006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------------------
;EX Fireball (Base) 
[Statedef 1009]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1009, 1006)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1005

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1
[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 5, 8, ifelse(var(10) = 4, 6.5, 5.375))
y = 0

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !time
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 4
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 2), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 2, -10.52, -6), ifelse(var(2) < 2, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), 0
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
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1009, 1006)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;========================< Fireball >=============================
;Fireball (SSJ)
[Statedef 2105]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 2106
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 2105

[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = ifelse(root, var(2) >= 200, 4, ifelse(root, var(2) >= 120, 3, ifelse(root, var(2) >= 60, 2, ifelse(root, var(2) >= 20, 1, 0))))

[State 3025, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3025, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 1 + var(10)

[State 0, Speed Var]
type = VarSet
trigger1 = !time
var(6) = ifelse(root, var(10) = 3, 6, ifelse(root, var(10) = 2, 5.5, 4.375))+var(10)

[State 0, TIME Var]
type = Varadd
trigger1 = time
var(7)= 1
ignorehitpause=0
[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(2)=1 || time>1,var(6),2)

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,2

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 35 < 35, 35, (root, fvar(12)) * 35)), 4
animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 0, 14 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
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
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
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
helperType = Normal
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
value = 2106
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Fireball Explosion (SSJ)
[Statedef 2106]
type = A
physics = N
movetype = I
anim = 2106
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 37
[State 1006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------------------
;EX Fireball (Base) 
[Statedef 2155]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 2155, 2106)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 2105

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1
[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 5, 8, ifelse(var(10) = 4, 6.5, 5.375))
y = 0

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !time
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 4
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 3), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 3, -10.52, -6), ifelse(var(2) < 3, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), 0
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
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 2155, 2106)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;------------------------------------------------
;Kame Ball Formation
[Statedef 3001]
type = S
physics = N
movetype = A
anim = 3001
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 1005, End]
type = destroyself
trigger1 = time > ifelse(root, stateno = 4402, 143, 40)

;------------------------------------------------
;Kame Ball (Base)
[Statedef 3005]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3005, 3006)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1
[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 9)
y = 0

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3007
ID = 3014
pos = -30,-68
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
pausemovetime = 0
scale = .3,.2
sprpriority = 0
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 3014
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 13
id = 3014
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3005, 3006)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]
;-------------------------
;Kame Explode (Base)
[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = !time
ID = 3014

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime
;------------------------------------------------------------------------------------

;========================< KAME SHIELD >=============================
;Kame Shield
[Statedef 3008]
type = A
physics = N
movetype = A
anim = 3008
ctrl = 0
velset = 8, 0
sprpriority = 3
[State 3008, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3008, Bind]
type = varset
trigger1 = !time
var(0) = parent, ID
[State 3008, Bind]
type = bindtoparent
trigger1 = playerIDexist(var(0))
pos = 10, 0
time = 1
[State 3008, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = (facing != parent, facing)
[State 3008, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = playerIDexist(var(0))
trigger2 = parent, stateno != 1351

;========================< SUPER KAME SHIELD >=============================
;Super Kame Shield
[Statedef 3009]
type = A
physics = N
movetype = A
anim = 3008
ctrl = 0
velset = 8, 0
sprpriority = 3
[State 3008, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3008, Bind]
type = varset
trigger1 = !time
var(0) = parent, ID
[State 3008, Bind]
type = bindtoparent
trigger1 = playerIDexist(var(0))
pos = 10, 0
time = 1
[State 3008, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = (facing != parent, facing)
[State 3008, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = playerIDexist(var(0))
trigger2 = parent, stateno != 1351

;------------------------------------------------
;Max Kame Ball
[Statedef 3015]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 3015, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 3015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3015, 3006)
ignorehitpause = 1
[State 3015, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3015, Strength]
type = varset
trigger1 = 1
var(10) = 5
[State 3015, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = ifelse(root,stateno=4402,4405,3015)

[State 3015, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3015, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3015, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 9)
y = 0

[State 3015, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3015, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3008
ID = 3014
pos = -35,-79
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
pausemovetime = 0
scale = .3,.2
sprpriority = 0
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 3014
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 13
id = 3014
ignorehitpause = 1

[State 3015, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 8), 8
sparkno = -1
numhits = ifelse(anim=4405&&var(2)=8,2,1)
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 8, -10.52, -6), ifelse(var(2) < 8, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall=(var(2)>=8)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3015, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3015, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 3015, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3055, Parent Hit Count]
type = ParentVarAdd
trigger1 = Movehit=1 && NumTarget
var(13) = 1
[State 3015, Self Hit Count]
type = VarAdd
trigger1 = MoveContact=1 && NumTarget
var(15) = 1
[State 3015, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact=1 && NumTarget
var(18) = 1

[State 3015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3015, 3006)
[State 3015, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;------------------------------------------------
;SSJ2 Kame Wave
[Statedef 3022]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3022
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3022

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.5, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5.5, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
trigger1 = animelem = 13
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 20, 20
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 20)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3023

;-----------------------------------------------------------
;SSJ2 Kame Wave Explode
[Statedef 3023]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3023
movehitpersist = 1
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = ifelse(time>=16,0,256-16*time), 256
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = time >= 40

;------------------------------------------------
;SSJ2 Max Kame Wave
[Statedef 3024]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3024
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3022

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.5, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5.5, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 13
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 20, 20
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 20)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3023
;------------------------------------------------
;------------------------------------------------
;SSJ2 Kame Wave
[Statedef 3025]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3025
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3022

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.5, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5.5, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
trigger1 = animelem = 13
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 20, 20
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 20)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3023

;------------------------------------------------
;SSJ2 Max Air Kame Wave
[Statedef 3042]
type = A
physics = N
movetype = A
ctrl = 0 
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3042
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3022

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.5, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5.5, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
trigger1 = animelem = 13
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 20, 20
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 20)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3023

;-------------------------
;Kame Up Head 
[Statedef 3104]
type = S
physics = N
movetype = A
anim = 3003
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 7509, spin]
type=angleset
trigger1 = !time
value = 45
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Kame Up Blast
[Statedef 3105]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3105, 3010)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 12
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3105

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3009
ID = 3014
pos = -100,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
pausemovetime = 0
scale = .2,.2
sprpriority = 0
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 5
ID = 3014
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 30
id = 3014
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = !time
value = 50
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3.375))
y = ifelse(var(10) = -3, -6, ifelse(var(10) = -2, -4.5, -3.375))

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 7 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

;[State 3005, Hit Last]
;type = hitdef
;trigger1 = var(2) = 5
;trigger1 = !(root, var(16)) && var(15) < 6
;trigger1 = root, var(1) != 1
;priority = 4, Hit
;attr = S, HP
;damage = ceil(54 * root, fvar(12)), 8
;animtype = Back
;hitflag = MAF
;guardflag = M
;pausetime = 4 * (var(2) = 5), 8
;sparkno = -1
;guard.sparkno = s7001
;sparkxy = -10, 0
;guardsound = s2, 0
;ground.type = High
;ground.slidetime = 16
;ground.hittime = 16
;ground.velocity = -6, -6;ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -6)
;guard.velocity = -10.52
;ground.cornerpush.veloff = 0
;air.velocity = -6, -6
;fall = 1;(var(2) >= 5)
;fall.recover = 0
;getpower = 0
;givepower = 36, 36
;envshake.time = 16
;envshake.freq = 120
;envshake.ampl = 6
;palfx.sinadd = 64, 64, 64, 4
;palfx.mul = 128, 128, 128
;palfx.time = 32
;sprpriority = 4
;yaccel = 0.5
;forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

;[State 3005, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -(target, const(size.ground.front) -10) * facing + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < -40, -40, ifelse(p2dist x < -40, ceil(p2dist x), -40)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3105, 3108)
[State 3055, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Kame Up Head FX
[Statedef 3106]
type = S
physics = N
movetype = A
anim = 1004
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 7509, spin]
type=angleset
trigger1 = !time
value = 50
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = time > 18

;------------------------------------------------
;Max Kame Up Blast (Base)
[Statedef 3107]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3107, 3010)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 12
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3105

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3009
ID = 3014
pos = -100,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
pausemovetime = 0
scale = .2,.2
sprpriority = 0
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 5
ID = 3014
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 30
id = 3014
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = !time
value = 45
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3.375))
y = ifelse(var(10) = -3, -6, ifelse(var(10) = -2, -4.5, -3.375))

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 8), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 8, -10.52, -6), ifelse(var(2) < 8, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

;[State 3005, Hit Last]
;type = hitdef
;trigger1 = var(2) = 5
;trigger1 = !(root, var(16)) && var(15) < 6
;trigger1 = root, var(1) != 1
;priority = 4, Hit
;attr = S, HP
;damage = ceil(54 * root, fvar(12)), 8
;animtype = Back
;hitflag = MAF
;guardflag = M
;pausetime = 4 * (var(2) = 5), 8
;sparkno = -1
;guard.sparkno = s7001
;sparkxy = -10, 0
;guardsound = s2, 0
;ground.type = High
;ground.slidetime = 16
;ground.hittime = 16
;ground.velocity = -6, -6;ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -6)
;guard.velocity = -10.52
;ground.cornerpush.veloff = 0
;air.velocity = -6, -6
;fall = 1;(var(2) >= 5)
;fall.recover = 0
;getpower = 0
;givepower = 36, 36
;envshake.time = 16
;envshake.freq = 120
;envshake.ampl = 6
;palfx.sinadd = 64, 64, 64, 4
;palfx.mul = 128, 128, 128
;palfx.time = 32
;sprpriority = 4
;yaccel = 0.5
;forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

;[State 3005, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -(target, const(size.ground.front) -10) * facing + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < -40, -40, ifelse(p2dist x < -40, ceil(p2dist x), -40)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3107, 3108)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;-------------------------
;Kame Up Explode
[Statedef 3108]
type = A
physics = N
movetype = I
anim = 3010
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 3014
ignorehitpause = 1

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Kame Up Head SSJ FX
[Statedef 3109]
type = S
physics = N
movetype = A
anim = 1004
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 7509, spin]
type=angleset
trigger1 = !time
value = 35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = time > 18

;------------------------------------------------
;SSJ2 Kame Up Wave
[Statedef 3122]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3122
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3122

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = 1
value = 35
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.5, -5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.5, -5
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S, HP 
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 20, 20
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), -65
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < -5, ceil(P2Dist x), -5)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3123

;-----------------------------------------------------------
;SSJ2 Kame Up Wave Explode
[Statedef 3123]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3023
movehitpersist = 1
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
[State 7509, spin]
type=angleset
trigger1 = 1
value = 35
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = ifelse(time>=16,0,256-16*time), 256
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = time >= 40

;------------------------------------------------
;SSJ2 Max Kame Up Wave
[Statedef 3124]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3124
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3122

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = 1
value = 35
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.5, -5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.5, -5
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 13
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 20, 20
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < -5, ceil(p2dist x), -5)), -65
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3123

;-----------------------------------
;Kame Down Head
[Statedef 3134]
type = S
physics = N
movetype = A
anim = 3003
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 20,0

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 7509, spin]
type=angleset
trigger1 = !time
value = -45
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Kame Down Blast
[Statedef 3135]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3135, 3137)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 12
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3135

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3009
ID = 3014
pos = 20,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
pausemovetime = 0
scale = .15,.15
sprpriority = 0
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 3014
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 13
id = 3014
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = !time
value = -43
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3.375))
y = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3.375))

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 7 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

;[State 3005, Hit Last]
;type = hitdef
;trigger1 = var(2) = 5
;trigger1 = !(root, var(16)) && var(15) < 6
;trigger1 = root, var(1) != 1
;priority = 4, Hit
;attr = S, HP
;damage = ceil(54 * root, fvar(12)), 8
;animtype = Back
;hitflag = MAF
;guardflag = M
;pausetime = 4 * (var(2) = 5), 8
;sparkno = -1
;guard.sparkno = s7001
;sparkxy = -10, 0
;guardsound = s2, 0
;ground.type = High
;ground.slidetime = 16
;ground.hittime = 16
;ground.velocity = -6, -6;ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -6)
;guard.velocity = -10.52
;ground.cornerpush.veloff = 0
;air.velocity = -6, -6
;fall = 1;(var(2) >= 5)
;fall.recover = 0
;getpower = 0
;givepower = 36, 36
;envshake.time = 16
;envshake.freq = 120
;envshake.ampl = 6
;palfx.sinadd = 64, 64, 64, 4
;palfx.mul = 128, 128, 128
;palfx.time = 32
;sprpriority = 4
;yaccel = 0.5
;forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

;[State 3005, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -(target, const(size.ground.front) -10) * facing + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 80, 80, ifelse(p2dist x < 80, ceil(p2dist x), 80)), -25
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3135, 3137)
[State 3005, End]
type = changestate
trigger1 = pos y > 20
value = 3137
;-------------------------
;Kame Down Head FX
[Statedef 3136]
type = S
physics = N
movetype = A
anim = 1004
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 50,-60

[State 7509, spin]
type=angleset
trigger1 = !time
value = -50
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = time > 18

;-------------------------
;Kame Down Explode
[Statedef 3137]
type = A
physics = N
movetype = I
anim = 3136
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 3014
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = !time
value = -43
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;SSJ2 Kame Down Wave
[Statedef 3138]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3138
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3138

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = 1
value = -35
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -1, 0
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S, HP 
damage = ceil(ifelse((root, fvar(12)) * 45 < 25, 25, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 10, 10
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < -5, ceil(p2dist x), -5)), -65
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3139

;-----------------------------------------------------------
;SSJ2 Kame Down Wave Explode
[Statedef 3139]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3023
movehitpersist = 1
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
[State 7509, spin]
type=angleset
trigger1 = 1
value = -35
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = ifelse(time>=16,0,256-16*time), 256
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = time >= 40

;-----------------------------------
;Max Air Kame Down Head
[Statedef 3144]
type = S
physics = N
movetype = A
anim = 3004
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 20,0

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 7509, spin]
type=angleset
trigger1 = !time
value = -45
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Max Air Kame Down Blast
[Statedef 3145]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3145, 3047)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 12
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3135

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3009
ID = 3014
pos = 20,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
pausemovetime = 0
scale = .2,.2
sprpriority = 0
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 3014
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 13
id = 3014
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = !time
value = -43
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3.375))
y = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3.375))

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 15 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 4 * (var(2) < 8), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 8, -10.52, -6), ifelse(var(2) < 8, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

;[State 3005, Hit Last]
;type = hitdef
;trigger1 = var(2) = 5
;trigger1 = !(root, var(16)) && var(15) < 6
;trigger1 = root, var(1) != 1
;priority = 4, Hit
;attr = S, HP
;damage = ceil(54 * root, fvar(12)), 8
;animtype = Back
;hitflag = MAF
;guardflag = M
;pausetime = 4 * (var(2) = 5), 8
;sparkno = -1
;guard.sparkno = s7001
;sparkxy = -10, 0
;guardsound = s2, 0
;ground.type = High
;ground.slidetime = 16
;ground.hittime = 16
;ground.velocity = -6, -6;ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -6)
;guard.velocity = -10.52
;ground.cornerpush.veloff = 0
;air.velocity = -6, -6
;fall = 1;(var(2) >= 5)
;fall.recover = 0
;getpower = 0
;givepower = 36, 36
;envshake.time = 16
;envshake.freq = 120
;envshake.ampl = 6
;palfx.sinadd = 64, 64, 64, 4
;palfx.mul = 128, 128, 128
;palfx.time = 32
;sprpriority = 4
;yaccel = 0.5
;forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

;[State 3005, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -(target, const(size.ground.front) -10) * facing + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 80, 80, ifelse(p2dist x < 80, ceil(p2dist x), 80)), -25
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3145, 3147)
[State 3005, End]
type = changestate
trigger1 = pos y >= 20
value = 3147
[State 3055, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Max Air Kame Down Head FX
[Statedef 3146]
type = S
physics = N
movetype = A
anim = 1004
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 50,-60

[State 7509, spin]
type=angleset
trigger1 = !time
value = -50
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 1005, End]
type = destroyself
trigger1 = time > 18

;-------------------------
;Max Air Kame Down Explode
[Statedef 3147]
type = A
physics = N
movetype = I
anim = 3136
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 3014
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = !time
value = -43
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1
[State 2010, AngleDraw]
type = AngleDraw
trigger1 = 1 
scale =  1,1

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;SSJ2 Max Kame Down Wave
[Statedef 3148]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3148
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3138

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 7509, spin]
type=angleset
trigger1 = 1
value = -35
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.5, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.5, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S, HP 
damage = ceil(ifelse((root, fvar(12)) * 45 < 40, 40, (root, fvar(12)) * 45)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 10, 10
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < -5, ceil(p2dist x), -5)), -65
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 0, ceil(P2Dist x), 0)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = !animtime
value = 3139

;-------------------------
;Kaioken Energy Spark
[Statedef 3203]
type = S
physics = N
movetype = A
anim = 907
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = time = 15

;-------------------------------------------------------------
;Spirit Bomb Particles 
[Statedef 3401]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type=bindtoroot
trigger1= !(time%8)
pos=ceil(-153+(random/3.125)),ceil(82-(random/3.125))

[State 8331, Particle]
type=explod
trigger1= (time%5)=1
anim=3401
sprpriority=ifelse(random<750,5,-1)
postype=p1
vel= ((rootdist x+1)/32.0), ((rootdist y-40)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8331, End]
type = removeexplod
trigger1 = time = 88

[State 8331, End]
type = destroyself
trigger1 = time = 88

;------------------------------------------------
;------------------------------------------------
;Hand Spirit Bomb
[Statedef 3405]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1  

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3405, 3406)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3002

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1
[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 9)
y = 0

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = movehit
anim = 3405
ID = 3405
pos = -10,-65
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 20
pausemovetime = 0
scale = .8,.8
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 25 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 8), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 8, 0, -9), ifelse(var(2) < 8, 0, -9)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -2, -15
p2facing = 1
fall = 1;(var(2) >= 5)
kill = (var(2) >= 8)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 35
palfx.add = 100, 100, 100
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7182
ID = 7182
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), 0
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
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3405, 3406)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Hand Spirit Bomb Explosion
[Statedef 3406]
type = A
physics = N
movetype = I
anim = 3406
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1.8,1.8
;[State 1006, Snd]
;type = playsnd
;trigger1 = !time
;value = 5, 1
;ignorehitpause = 1
;persistent = 0
[State 1006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Hand Spirit Bomb (Continue)
[Statedef 3407]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3405

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 0, BindToTarget]
type = BindToTarget
trigger1 = 1
pos = 0,-70

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 3.1,3.1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 8331, Particle]
type=explod
trigger1= (time%6)=1
anim=3406
sprpriority=ifelse(random<750,5,-1)
postype=p2
vel= ((rootdist x+1)/32.0), ((rootdist y-40)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 3015, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 8), 8
sparkno = -1
numhits = ifelse(anim=4405&&var(2)=8,2,1)
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 8, -4, -9), ifelse(var(2) < 8, -4, -9)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -4, -9
p2facing = 1
fall=(var(2)>=8)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3015, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3015, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3015, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3055, Parent Hit Count]
type = ParentVarAdd
trigger1 = Movehit=1 && NumTarget
var(13) = 1
[State 3015, Self Hit Count]
type = VarAdd
trigger1 = MoveContact=1 && NumTarget
var(15) = 1
[State 3015, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact=1 && NumTarget
var(18) = 1

[State 3015, End]
type = destroyself
trigger1 = time = 40


;========================< Kick Burst >=============================
;Kick Burst
[Statedef 3505]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1251, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3505
ignorehitpause = 1
[State 1251, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1251, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = root, var(10)
[State 1251, movevar]
type = varset
trigger1 = !time && !prevstateno
var(5) = root, stateno
[State 1251, Anim]
type = changeanim
trigger1 = !time
value = 3505

[State 1251, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 30, -70
ignorehitpause = 1
[State 1251, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1251, movehitvar]
type = varset
trigger1 = movehit && numtarget
trigger1 = target, movetype = H
var(3) = 1
ignorehitpause = 1
[State 1251, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time 
value = S6,28

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 1251, hit]
type = hitdef
trigger1 = !Time
trigger1 = !var(16) && (var(15) < 3 || var(20))
attr = S, SA
damage = ceil(ifelse((root, fvar(11)) * 95 < 7, 7, (root, fvar(11)) * 95)), 8
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6 
guard.pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -6
air.type = Low
air.velocity = -8, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2facing = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.5
fall = 1
sparkNo = -1
guard.sparkNo = -1 + 0 * (var(34) := 8001)
;sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1251, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1251, End]
type = destroyself
trigger1 = !animtime

;========================< Max Kick Burst >=============================
;Max Kick Burst
[Statedef 3506]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1251, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3505
ignorehitpause = 1
[State 1251, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1251, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = root, var(10)
[State 1251, movevar]
type = varset
trigger1 = !time && !prevstateno
var(5) = root, stateno
[State 1251, Anim]
type = changeanim
trigger1 = !time
value = 3505

[State 1251, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 30, -70
ignorehitpause = 1
[State 1251, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1251, movehitvar]
type = varset
trigger1 = movehit && numtarget
trigger1 = target, movetype = H
var(3) = 1
ignorehitpause = 1
[State 1251, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time 
value = S6,28

[State 1251, hit]
type = hitdef
trigger1 = Animelem = 1 || Animelem = 2 || Animelem = 3
attr = S, SA
damage = ceil(ifelse((root, fvar(11)) * 25 < 7, 7, (root, fvar(11)) * 25)), 4
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 8 
guard.pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, 0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2facing = 1
forcestand = 1
yaccel = 0.5
kill = 0
fall = 0
sparkNo = -1
guard.sparkNo = -1 + 0 * (var(34) := 8001)
;sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1251, hit]
type = hitdef
trigger1 = Animelem = 4
attr = S, SA
damage = ceil(ifelse((root, fvar(11)) * 25 < 7, 7, (root, fvar(11)) * 25)), 4
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4 
guard.pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -6
air.type = Low
air.velocity = -8, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2facing = 1
forcestand = 1
yaccel = 0.5
fall = 1
sparkNo = -1
guard.sparkNo = -1 + 0 * (var(34) := 8001)
;sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0

[State 1251, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1251, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Meteor Bomb
[Statedef 3605]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3605, 3607)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3605

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = 9
y = -7

[State 3025, particles]
type = explod
trigger1 = 1
vel = (-2 -(random / 3000.0))*1.5, (4 +(random / 2000.0))*1.5
anim = 3608
sprpriority = 2
postype = p1
pos = -20, 0
random = 40, 45
facing = -1 + (random < 50) * 2
vfacing = -1 + (random < 50) * 2
scale = 0.13, 0.13
ownpal = 1
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = (-2 -(random / 3000.0))*1.5, (4 +(random / 2000.0))*1.5
anim = 3609
trans = Sub
sprpriority = -1
postype = p1
pos = -20, 0
random = 40, 45
facing = -1 + (random < 50) * 2
vfacing = -1 + (random < 50) * 2
scale = 0.13, 0.13
ownpal = 1
ignorehitpause = 1

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 20, 20, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -8
p2facing = 1
kill = (var(2) = 5)
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3605, 3607)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Meteor Bomb Explode
[Statedef 3607]
type = A
physics = N
movetype = I
anim = 3607
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 3.7, 3.7
ignorehitpause = 1
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Max Meteor Bomb
[Statedef 3655]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3655, 3656)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3655

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = 13

[State 3025, particles]
type = explod
trigger1 = 1
vel = -7 -(random / 3000.0), 0
accel = 0, 0.100- (0.002*(random%100))
anim = 3608
sprpriority = 2
postype = p1
pos = -20, 0
random = 40, 45
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.4, 0.4
ownpal = 1
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = -7 -(random / 3000.0), 0
accel = 0, 0.100- (0.002*(random%100))
anim = 3609
trans = Sub
sprpriority = -1
postype = p1
pos = -20, 0
random = 40, 45
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.4, 0.4
ownpal = 1
ignorehitpause = 1

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 20, 20, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -8
p2facing = 1
kill = (var(2) = 5)
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3655, 3656)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -320/Camerazoom, 320/Camerazoom]

;-------------------------
;Meteor Bomb Explode
[Statedef 3656]
type = A
physics = N
movetype = I
anim = 3607
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 2.6, 2.6
ignorehitpause = 1
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Dive Bomb Pre-Explosion
[Statedef 3710]
type = A
physics = N
movetype = I
anim = 3610
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1,1
ignorehitpause = 1
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 32
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Dive Bomb Explosion
[Statedef 3755]
type = A
physics = N
movetype = I
anim = 3607
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1.2, 1.2
ignorehitpause = 1
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 5
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;-------------------------------------------------------------
;Super Spirit Bomb Goku Effect 
[StateDef 3901]
type = S
physics = S
ctrl = 0
anim = 3901
sprpriority = -5

[State 0]
type = AngleDraw
trigger1 = 1
scale = 1+(time/45.000),1+(time/30.000)

[State 0]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 150-(time*10),256

[State 0]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0]
type = Destroyself
trigger1 = Time = 15

;---------------------------------------------------------------------------
;Spirit Bomb Form
[StateDef 3902]
type = S
physics = S
ctrl = 0
anim = 3902
sprpriority = -5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 36
value = S6,25

[State 0]
type = Destroyself
trigger1 = Time = 225

;------------------------------------------------
;Super Spirit Bomb
[Statedef 3903]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3903
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 12
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3903

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 4805, VelAdd]
type = Veladd
trigger1 = parent, animelemtime(1) > 1 && p2bodydist x > 0/camerazoom
x = .011/camerazoom

[State 4805, VelAdd]
type = Veladd
trigger1 = parent, animelemtime(1) > 1 && p2bodydist y > -1/camerazoom
y = .011/camerazoom

[State 4805, Turn]
type = Turn
trigger1 = parent, AnimElem = 1 && p2dist X < 0/camerazoom

[State 4805, VelSet]
type = VelSet
trigger1 = p2bodydist x <= 0/camerazoom
x = 0/camerazoom

[State 4805, VelSet]
type = Velset
trigger1 = pos y >= -65/camerazoom
y = 0/camerazoom

[State 4805, EnvShake]
type = EnvShake
triggerall = pos y > -65
trigger1 = gametime%10=0
time = 12
freq = 100
ampl = -6
phase = 85

[State 0, TargetBind]
type = TargetBind
trigger1 = frontedgedist >= -5
time = 1
id = -1
pos = 0,(abs(enemynear,const(size.mid.pos.y))-0)

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 25 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 0 < 0, 0, (root, fvar(12)) * 0)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 1,1
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 30
ground.hittime = 30
ground.velocity = -1,1
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.type = High
air.velocity = -1,1
p2facing = 1
kill = 0
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
down.bounce = 1
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = Changestate
trigger1 = MoveContact
value = 3904

;------------------------------------------------
;Super Spirit Bomb Pause
[Statedef 3904]
type = A
physics = N
movetype = A
anim = 3903
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1200, grow]
type = modifyexplod
trigger1 = numexplod(3903)
ID = 3903
scale = 0.03 + (0.00125 * var(2)), 0.03 + (0.00125 * var(2))

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = frontedgedist >= -5
time = 1
id = -1
pos = 0,(abs(enemynear,const(size.mid.pos.y))-0)

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 50,1
anim = 3906
ID = 3906
pos = 0,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = .4,.4
sprpriority = 0 
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 7,1
anim = 4507
ID = 4507
pos = 0,100
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 21
supermovetime = 255
shadow = 0,0,150
scale = .6,.6
ontop = 1
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = anim = 3905
id = 3906

[State 0, Explod]
type = Explod
trigger1 = time = 200
anim = 3904
ID = 3904
pos = 0,0
postype = p1  ;p2,front,back,left,right
removetime = 55
scale = 1.5,1.5
sprpriority = 2 
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
trans = add

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 25 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 0 < 0, 0, (root, fvar(12)) * 0)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 1,1
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 30
ground.hittime = 30
ground.velocity = -1,1
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.type = High
air.velocity = -1,1
p2facing = 1
kill = 0
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
down.bounce = 1
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, End]
type = Changestate
trigger1 = time = 200
value = 3905

;---------------------------------------------------------------------------
;Super Spirit Bomb Explosion
[Statedef 3905]
type = A
physics = N
movetype = A
anim = 3905
ctrl = 0
velset = 0,0
juggle = 0
facep2 = 0
ownpal = 1
ontop = 1
ignorehitpause = 1
hitdefpersist = 0
movehitpersist = 0
hitcountpersist = 0
sprpriority = 3

[State 0, PalFX]
type = AllPalFX
trigger1 = 1
time = 64
add = 0,0,0
mul = 256,256,256
invertall = 0
color = 256

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,35

[State 200,HitDef]
type = HitDef
trigger1 = animelem = 1 
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 130 < 130, 130, (root, fvar(11)) * 130)), 4
animtype = Hard
damage = 130,0
pausetime = 0,0
guardflag = MA
hitflag = MAF
priority = 3,Hit
sparkno	= -1
guard.sparkno = -1
sparkxy = 0,0
ground.type = High
ground.slidetime = 13
ground.hittime = 18
ground.velocity = 0,0
air.velocity= 0,0
kill = 1
fall = 1
fall.recover = 0
airguard.velocity = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0,0

[State 3025, p2state - killed]
type = targetstate
triggerall = NumEnemy < 1
trigger1 = movehit && numtarget
trigger1 = MatchOver
trigger1 = WinKO
value = 5941
ignorehitpause = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 45
freq = 90
ampl = -4
phase = 90

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 4507
ID = 3905
pos = 0,100
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 21
supermovetime = 255
shadow = 0,0,150
scale = .6,.6
ontop = 1
ownpal = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time < 150
ID = 3905
trans = addalpha
alpha = 256-(8*time),256

[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = time >= 150
ID = 3905

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1.5+(.1*time),1.5+(.1*time)

[State 0, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 5*time
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = time >= 140
trans = addalpha
alpha = ceil(256-(5.333*time)),256

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0,End]
type = destroyself
trigger1 = time >= 150

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Super Spirit Bomb Effect 
[StateDef 3906]
type = S
physics = S
ctrl = 0
anim = 3905
sprpriority = -5

[State 0]
type = AngleDraw
trigger1 = 1
scale = 1+(time/45.000),1+(time/30.000)

[State 0]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 150-(time*10),256

[State 0]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0]
type = Destroyself
trigger1 = Time = 15

;---------------------------------------------
;Spirit Bomb Theme
[Statedef 3907]
type = S
velset = 0, 0
anim = 9741

[State 8600, Theme Sound]
type = playsnd
trigger1 = !time ;&& matchover
value = 6,36
channel = 1

[State 8600, Theme Sound]
type = playsnd
trigger1 = !time ;&& matchover
value = 6,36
channel = 3

[State 7600, Snd]
type = assertspecial
trigger1 = 1
flag = nomusic

;------------------------------------------------
;Meteor Burst Kame
[Statedef 4006]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 2010, SPECIAL]   
type = Afterimage
trigger1 = time = 1
length = 9
PalBright = 0,0,0
PalContrast =0,100,256
PalAdd = 0,0,0
PalMul = .5,.5,.5
timeGap = 1
frameGap = 2
trans = add
time = 999
palcolor = 0 

[State 2010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1 

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4006
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4006

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1
[State 3005, Vel]
type = velset
trigger1 = !Time
y = 7

[State 7509, spin]
type=angleset
trigger1 = 1
value = -90
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,6
[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,14

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 3200
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !Time
priority = 4, Hit
attr = A, HP
damage = ceil(ifelse((root, fvar(12)) *50 < 50, 50, (root, fvar(12)) * 50)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 0,0
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 50
ground.hittime = 50
ground.velocity = 0,-10
guard.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0,-10
p2facing = 1
fall = 1;(var(2) >= 5)
kill = 0
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = 4007
[State 3005, End]
type = changestate
trigger1 = pos y = 0
value = 4007

;-------------------------
;Meteor Break Kame Explosion
[Statedef 4007]
type = A
physics = N
movetype = A
anim = 4007
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 2010, SPECIAL]   
type = Afterimage
trigger1 = time = 1
length = 9
PalBright = 0,0,0
PalContrast =0,100,256
PalAdd = 0,0,0
PalMul = .5,.5,.5
timeGap = 1
frameGap = 2
trans = add
time = 999
palcolor = 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
[State 0, PosAdd]
type = PosAdd
trigger1 = !Time
x = 80
y = 60
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angleset
trigger1 = 1
value = 0
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .6,1.2
ignorehitpause = 1

[State 0, Explosion Snd]
type = PlaySnd
trigger1 = !Time
value = S6,15
[State 0, Explosion Snd]
type = PlaySnd
trigger1 = !Time
value = S6,17

[State 3005, Hit]
type = hitdef
trigger1 = !Time
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 90 < 90, 90, (root, fvar(12)) * 90)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 2,8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
air.type = High
down.hittime = 120
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 12
air.hittime = 120
ground.velocity = 0,-25
guard.velocity = -5
ground.cornerpush.veloff = 0
air.velocity = 0,-25
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
kill = 1
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3015, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3015, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3055, Parent Hit Count]
type = ParentVarAdd
trigger1 = Movehit=1 && NumTarget
var(13) = 1
[State 3015, Self Hit Count]
type = VarAdd
trigger1 = MoveContact=1 && NumTarget
var(15) = 1
[State 3015, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact=1 && NumTarget
var(18) = 1

[State 1006, End]
type = destroyself
trigger1 = !animtime

;--------------------------------
;Meteor Break Hand Kame FX
[Statedef 4008]
type = S
physics = N
movetype = A
anim = 3003
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = -45, -43

[State 7509, spin]
type=angleset
trigger1 = 1
value = -90
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .9, .9
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Warp Kamehameha Wave Diagonal Air
[Statedef 4105]
type = A
physics = N
movetype = A
anim = 4105
ctrl = 0
velset = 0, 0
sprpriority = 4 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4105
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4105

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

;[State 0, Kame Hand FX Explod]
type = Explod
trigger1 = !Time
anim = 3502
ID = 3502
pos = 70,-117
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 74
superMoveTime = 255
scale = .9,.9
sprpriority = 0
ontop = 1
ownpal = 1
removeongethit = 1

;[State 0, Kame Hand FX Explod]
type = Explod
trigger1 = time = 74
anim = 3503
ID = 3503
pos = 70,-117
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 23
superMoveTime = 255
scale = .9,.9
sprpriority = 0
ontop = 1
ownpal = 1
removeongethit = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = !Time
time = 162
pos = 45,-61

[State 7509, spin]
type=angleset
trigger1 = !time
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .9, .9
ignorehitpause = 1

[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,14
[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,18
[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,19

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 123
freq = 60
ampl = -3
phase = 90

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3065, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25 || animelem = 27
trigger3 = animelem = 29 || animelem = 31 || animelem = 33 || animelem = 35 || animelem = 37 || animelem = 39 || animelem = 41
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 10 < 4, 4, (root, fvar(11)) * 10)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 0,0
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = 0, 0
air.type = High
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
kill = 0
fall = 0
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0, 64, 0, 4
palfx.mul = 0, 96, 192
palfx.time = 32
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3065, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 41 
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 10 < 4, 4, (root, fvar(11)) * 10)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 10,12
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -8
air.type = High
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
kill = 1
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0, 64, 0, 4
palfx.mul = 0, 96, 192
palfx.time = 32
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3055, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Warp Kamehameha Wave Horizontal Air
[Statedef 4107]
type = A
physics = N
movetype = A
anim = 4107
ctrl = 0
velset = 0, 0
sprpriority = 4 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4107
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4107

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

;[State 0, Kame Hand FX Explod]
type = Explod
trigger1 = !Time
anim = 3502
ID = 3502
pos = 70,-117
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 74
superMoveTime = 255
scale = .9,.9
sprpriority = 0
ontop = 1
ownpal = 1
removeongethit = 1

;[State 0, Kame Hand FX Explod]
type = Explod
trigger1 = time = 74
anim = 3503
ID = 3503
pos = 70,-117
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 23
superMoveTime = 255
scale = .9,.9
sprpriority = 0
ontop = 1
ownpal = 1
removeongethit = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = !Time
time = 162
pos = 45,-90

[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .9, .9
ignorehitpause = 1

[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,14
[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,18
[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,19

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 123
freq = 60
ampl = -3
phase = 90

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3065, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25 || animelem = 27
trigger3 = animelem = 29 || animelem = 31 || animelem = 33 || animelem = 35 || animelem = 37 || animelem = 39 || animelem = 41
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 10 < 4, 4, (root, fvar(11)) * 10)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 0,0
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = 0, 0
air.type = High
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
kill = 0
fall = 0
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0, 64, 0, 4
palfx.mul = 0, 96, 192
palfx.time = 32
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3065, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 41 
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 10 < 4, 4, (root, fvar(11)) * 10)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 10,12
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -8
air.type = High
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
kill = 1
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0, 64, 0, 4
palfx.mul = 0, 96, 192
palfx.time = 32
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3055, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;SSJ3 Kame Wave
[Statedef 4108]
type = A
physics = N
movetype = A
anim = 4108
ctrl = 0
velset = 0, 0
sprpriority = 4 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4108
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4108

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = !Time
time = 175
pos = 45,-50

[State 7509, spin]
type=angleset
trigger1 = !time
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1.5, 1.5
ignorehitpause = 1

[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,14
[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,18
[State 0, Kame Wave Snd]
type = PlaySnd
trigger1 = !time
value = S6,19

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 123
freq = 60
ampl = -3
phase = 90

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3065, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25 || animelem = 27
trigger3 = animelem = 29 || animelem = 31 || animelem = 33 || animelem = 35 || animelem = 37 || animelem = 39 || animelem = 41
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 10 < 4, 4, (root, fvar(11)) * 10)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 0,6
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1.5, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -1.5, 0
air.type = High
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
kill = 0
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0, 64, 0, 4
palfx.mul = 0, 96, 192
palfx.time = 32
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3065, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 41 
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) * 10 < 4, 4, (root, fvar(11)) * 10)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 10,12
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -8
air.type = High
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
kill = 1
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0, 64, 0, 4
palfx.mul = 0, 96, 192
palfx.time = 32
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3055, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;SSJ2 Transform Aura
[Statedef 4504]
type = A
physics = N
movetype = I
anim = 4505
velset = 0, 0
ctrl = 0
sprpriority = 0
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 0, 10
[State 7509, spin]
type=angleset
trigger1 = !time
value = 90
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .7, .7
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;SSJ2 Transform Aura
[Statedef 4505]
type = A
physics = N
movetype = I
anim = 4504
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angleset
trigger1 = !time
value = 90
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;SSJ2 Transform Aura
[Statedef 4511]
type = A
physics = N
movetype = I
anim = 4511
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = !animtime

;---------------------------------------------------------------
;Dragon Fist
[Statedef 4615]
physics = N
anim=4615
sprpriority=3

[State 3605, BindToParent]
type = BindToParent
trigger1 =1
pos = 90,-105

[State 3605,EX SHADOW FX]
type=afterimage
trigger1=time=2
time=999
TimeGap =2
FrameGap=3
length=15
PalBright=1,1,1
PalContrast=150,150,150
PalAdd=0,0,0
PalMul=.5,.5,.5
trans=add


[State 3605, Explod]
type = Explod
trigger1 = (gametime%12)
anim = 4613
ID = 8180
pos = -50,0
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = -3,6
random = 120,20
removetime = 15
supermove = 99999
pausemovetime = 99999
scale = .06,.06
sprpriority = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 1
trans=add

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,10
channel = 1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,10
channel = 2

[State 0, StopSnd]
type = StopSnd
trigger1 = ANIMELEM = 13
channel = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = ANIMELEM = 13
channel = 2

[State 0, AngleSet]
type = AngleSet
trigger1 = 1
value = 35
ignorehitpause = 1

[State 3605, Trans]
type=trans
trigger1= time>=0
trans=addalpha
alpha=320-(time*32),256

[State 3605, scale]
type=AngleDraw
trigger1=1
scale=1+time*.007,.9+time*.007

[State 3605, DestroySelf]
type = DestroySelf
trigger1=root,stateno!=4602
trigger2=root,stateno=4602 && root,ANIMELEM = 12

;---------------------------------------------------
;Ki Aura
[Statedef 6000]
physics = N
velset = 0, 0
anim = 6010
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 6011
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)
trans = addalpha
alpha = 256, 256
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 6012
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 6010
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 2, 0
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

[Statedef 6001]
physics = N
velset = 0, 0
;anim = 1216
sprpriority = 5
[State 0, StopSnd]
type = StopSnd
trigger1 = !time
channel = 3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,7

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 1+(0.125*time) ,1+(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 128-(16*time),256
;ignorehitpause = 
;persistent = 

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (1-(0.0625*time))*const(size.xscale),(1-(0.0625*time))*const(size.yscale)
trans = addalpha
alpha = 256-(32*time),256

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow
alpha = 255, 255

[State 6000, Bind]
type = bindtoroot
trigger1 = root, anim = 1201
pos = 0, -70
[State 6000, End]
type = removeexplod
trigger1 = time > 8
ID = 6000
[State 6000, End]
type = destroyself
trigger1 = time > 8


;SSJ Aura
[Statedef 6002]
physics = N
velset = 0, 0
;anim = 3403
anim = 6000
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,3
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 6001
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 6003
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = 4
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 6004
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 2, 0
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 2184 && root, animelemtime(5)>=-4 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 2184 && root, animelemtime(5)>=-4 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 2184 && root, animelemtime(5)>=-4 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

; Rushing SSJ Aura
[Statedef 6003]
physics = N
velset = 0, 0
;anim = 3403
anim = 6020
sprpriority = ifelse(root,stateno=2184,-1,5)

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 6021
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 0
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 6023
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 0
removetime = -1
supermovetime = -1
sprpriority = ifelse(root,stateno=2184,-2,4)
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 6024
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 0
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
alpha = 0+(32*time),256

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S5,10
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S5,11
loop = 1
channel = 3

[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 8 && root, stateno = 181
value = 0
scale = 1+(time-8)*0.0015,1+(time-8)*0.0015
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time >= 8 && root, stateno = 181
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
scale = (1+(time-8)*0.0015)*const(size.xscale),(1+(time-8)*0.0015)*const(size.yscale)
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time >= 8 && root, stateno = 181
ID = 6001
postype = p1  ;p2,front,back,left,right
pos = 0, 0
trans = sub
scale = (1+(time-8)*0.0015)*const(size.xscale),(1+(time-8)*0.0015)*const(size.yscale)
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 30, -50
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = (root, anim != var(10)) && var(10) != 1200
trigger2 = var(10)=1200&&(((root,stateno!=[1200,1213])&&(root,stateno!=[893,894])&&(root,stateno!=3701))||root,anim=1201||root,anim=1202&&root,animelemtime(2)>=0)
ID = 6001
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = (root, anim != var(10)) && var(10) != 1200
trigger2 = var(10)=1200&&(((root,stateno!=[1200,1213])&&(root,stateno!=[893,894])&&(root,stateno!=3701))||root,anim=1201||root,anim=1202&&root,animelemtime(2)>=0)
value = 6001
ctrl = 0
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time > 8
value = 0
scale = 1,1

;-------------------------------------------------
;Kaioken Aura
[Statedef 6004]
physics = N
velset = 0, 0
anim = 3205
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 3206
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)

;[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 3207
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 3212
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 2, 0
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;Kaioken End
[Statedef 6005]
physics = N
velset = 0, 0
;anim = 1216
sprpriority = 5
[State 0, StopSnd]
type = StopSnd
trigger1 = !time
channel = 3

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 1+(0.125*time) ,1+(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 128-(16*time),256
;ignorehitpause = 
;persistent = 

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 3208
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (1-(0.0625*time))*const(size.xscale),(1-(0.0625*time))*const(size.yscale)
trans = addalpha
alpha = 256-(32*time),256

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow
alpha = 255, 255

[State 6000, Bind]
type = bindtoroot
trigger1 = root, anim = 1201
pos = 0, -70
[State 6000, End]
type = removeexplod
trigger1 = time > 8
ID = 3208
[State 6000, End]
type = destroyself
trigger1 = time > 8

;-------------------------------------------------
;Kaioken Aura SideWays
[Statedef 6006]
physics = N
velset = 0, 0
anim = 3225
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 3226
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)

;[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 3207
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 3222
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.7+0.0625*time)*const(size.xscale), (0.7+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 4-(0.125*time) ,4-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 55, -20
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;-------------------------------------------------
;Kaioken Aura SideWays
[Statedef 6007]
physics = N
velset = 0, 0
anim = 3225
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 3226
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)

;[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 3207
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 3222
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.7+0.0625*time)*const(size.xscale), (0.7+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 4-(0.125*time) ,4-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 70, -10
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;-------------------------------------------------
;Kaioken Aura Drop Kick
[Statedef 6008]
physics = N
velset = 0, 0
anim = 3205
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 3206
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)

;[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 3207
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 3212
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = -30, 0
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;SSJ Aura
[Statedef 6009]
physics = N
velset = 0, 0
;anim = 3403
anim = 6000
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,3
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 6001
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 6003
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = 4
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 6004
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 15, -20
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 2184 && root, animelemtime(5)>=-4 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 2184 && root, animelemtime(5)>=-4 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 2184 && root, animelemtime(5)>=-4 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;-------------------------------------------------
;Kaioken Aura
[Statedef 6010]
physics = N
velset = 0, 0
anim = 3205
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 3206
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)

;[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 3207
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 3212
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.5+0.0625*time)*const(size.xscale), (0.5+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 2-(0.125*time) ,2-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 8, -20
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;-------------------------------------------------
;Kaioken Aura SideWays
[Statedef 6011]
physics = N
velset = 0, 0
anim = 3225
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 730
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 3226
postype = p1
pos = 0, 0
bindtime = -1
removetime = -1
ownpal = 1
supermovetime = -1
sprpriority = -5
scale = const(size.xscale),const(size.yscale)

;[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6001
anim = 3207
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -1
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6002
anim = 3222
postype = p1
pos = 0, 0
bindtime = -1
ownpal = 1
removetime = -1
supermovetime = -1
sprpriority = -6
scale = const(size.xscale),const(size.yscale)
removeongethit = 0
trans = Sub
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time <= 8
ID = 6000
postype = p1  ;p2,front,back,left,right
pos = 0, 0
scale = (0.7+0.0625*time)*const(size.xscale), (0.7+0.0625*time)*const(size.yscale)
trans = addalpha
sprpriority = -5 + var(37)
alpha = 0+(32*time),256

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 4-(0.125*time) ,4-(0.125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 0+(32*time),256
[State 0, Trans]
type = Trans
trigger1 = time >= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256,256
;ignorehitpause = 
;persistent = 
;
;[State 6000, Shadows]
;type = afterimage
;trigger1 = !time
;time = 999
;timegap = 1
;framegap = 1
;length = 2
;palcontrast = 100, 100, 100
;trans = S

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
pos = 75, -25
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6001
[State 6000, End]
type = removeexplod
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
ID = 6002
[State 6000, End]
type = changestate
triggerall = time > 8
trigger1 = root, anim != var(10)
trigger2 = root, stateno = 4002 && root, time>=235 ;&& (root, anim != [3200,3299])
value = 6001
ctrl = 0

;========================<SPARKS>=============================
;Clash Spark
[StateDef 7000]
type = A
physics = N
moveType = I
anim = 7000
velset = 0,0
sprPriority = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S7,2

[State 0]
type = Destroyself
trigger1 = Time = 23

;========================<P2 FIRE >=============================
;Flames P2
[Statedef 7180]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7180
ID = 7180
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 150

;------------------------------------------------------------
;--- YELLOW FIRE ---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120

;------------------------------------------------------------

;--- Small Spirit Bomb Electricity ---
[Statedef 7182]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 3406
ID = 7182
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.08, 0.08
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120

;------------------------------------------------------------

;--- BLUE FIRE ---
[Statedef 7183]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7183
ID = 7183
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120

;------------------------------------------------------------
;--- Spirit Bomb Eletricity ---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 7180, flames]
type = explod
trigger1 = (time%6)=1
anim = 3406
ID = 7181
sprpriority=ifelse(random<750,3,-1)
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale= ifelse(random<500,.15,-.15), ifelse(random<500,.15,-.15)
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120

;========================< Warp Kame Punch >=============================
;Warp Kame Punch 
[Statedef 7696]
type = U
physics = U
movetype = U
ctrl = 0
velset = 0, 0

[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(3025)
pos = 0, 0
ID = 3025
ignorehitpause = 1

[State 7696, Pos]
type = posset
trigger1 = !time
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = !time 
x = -50

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 5012 && selfanimexist(5012)
value = 5012
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 5012 && !selfanimexist(5012) && selfanimexist(5012)
value = 5012
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(5012) && !selfanimexist(5012)
value = 5012

[State 7696, End]
type = changestate
trigger1 = alive && (anim = 5012) && hitshakeover
trigger2 = alive && (anim != 5012) && hitshakeover
value = 5300
[State 7696, End]
type = selfstate
trigger1 = !alive && (anim != 5012) && hitshakeover
value = 5300

;========================< Super Spirit Bomb Punch >=============================
;Super Spirit Bomb Punch 
[Statedef 7697]
type = U
physics = U
movetype = U
ctrl = 0
velset = 0, 0

[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(3026)
pos = 0, 0
ID = 3026
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time < 0
value = 0
movecamera = 0,0

[State 1113650, NoPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 7696, Pos]
type = posset
trigger1 = !time
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = !time 
x = -50

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 5012 && selfanimexist(5012)
value = 5012
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 5012 && !selfanimexist(5012) && selfanimexist(5012)
value = 5012
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(5012) && !selfanimexist(5012)
value = 5012

[State 7696, End]
type = changestate
trigger1 = alive && (anim = 5012) && hitshakeover
trigger2 = alive && (anim != 5012) && hitshakeover
value = 5300
[State 7696, End]
type = selfstate
trigger1 = !alive && (anim != 5012) && hitshakeover
value = 5300


;========================< Super Spirit Bomb Punch >=============================
;Super Spirit Bomb Punch 
[Statedef 7698]
type = U
physics = U
movetype = U
ctrl = 0
velset = 0, 0

[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(3027)
pos = 0, 0
ID = 3027
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time < 0
value = 0
movecamera = 0,0

[State 1113650, NoPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 7696, Pos]
type = posset
trigger1 = !time
y = 0

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 5012 && selfanimexist(5012)
value = 5012
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 5012 && !selfanimexist(5012) && selfanimexist(5012)
value = 5012
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(5012) && !selfanimexist(5012)
value = 5012

[State 7696, End]
type = changestate
trigger1 = alive && (anim = 5012) && hitshakeover
trigger2 = alive && (anim != 5012) && hitshakeover
value = 5300
[State 7696, End]
type = selfstate
trigger1 = !alive && (anim != 5012) && hitshakeover
value = 5300
;----------------------------------------------------------
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8


;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16


;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16


;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3000,3999]), -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16


;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8



;Jump dust
[Statedef 8100]
type = S
anim = 1
velset = 0, 0

[State 8100, Bind]
type = bindtoroot
trigger1 = time

[State 8100, Dust]
type = explod
trigger1 = !time
anim = 8100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 8101
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, End]
type = destroyself
trigger1 = time >= 7


;Dash dust
[Statedef 8103]
type = A
anim = 1
velset = 0, 0
sprpriority = 5

[State 8103, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 8103, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 8103
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 -(16 * (time -3)), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 -(16 * (time -6)), 256

[State 8103, End]
type = removeexplod
trigger1 = time >= 22

[State 8103, End]
type = destroyself
trigger1 = !numexplod

;-----------------------------------
;Ground Impact 
[Statedef 8110]
type = A
anim = 1
velset = 0, 0
sprpriority = 5

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8110
ID = ifelse(time = 8, 3, ifelse(time = 4, 2, 1))
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8120
ID = 2
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, Scale]
type = modifyexplod
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 -(64 * (time -4))), 256

[State 8110, End]
type = removeexplod
trigger1 = time >= 8

[State 8110, End]
type = destroyself
trigger1 = !numexplod

;WALL IMPACT DUST
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;FLAMES
[Statedef 8150]
type = A
velset = 0, 0
anim = 1

[State 8150, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8150, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 60, 60
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8150, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;RECOVER FX
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)
ignoreHitPause = 1

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17.1 * time), 256
ignoreHitPause = 1

[State 8200, End]
type = destroyself
trigger1 = time >= 15


;COUNTER FX
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 1

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 64
postype = p1
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = time < 8
ID = 8290
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 0

[State 8290, Scale]
type = modifyexplod
trigger1 = time >= 8
ID = 8290
scale = 0.5 + .0625 * (time -8), 0.5 + .0625 * (time -8)
trans = addalpha
alpha = 256 -32 * (time -8), 32 * (time -8)

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16

[State 8290, End]
type = destroyself
trigger1 = time >= 16

;MAX MODE TEXT FX
[StateDef 8291]
type = A
physics = N
velSet = 0,0
anim = 1

[State 8291, "Power Up!" Text Explod]
type = Explod
trigger1 = !NumExplod(8291)
anim = 8291
ID = 8291
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8291
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8291
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8291, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8291, End]
type = DestroySelf
trigger1 = Time >= 16

;POWER CHARGE MAIN FX 
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = 0,0

[State 8330, Snd]
type = playsnd
trigger1 = !time
value = 730,0
channel = 0

[State 8330, Aura]
type = explod
trigger1 = !numexplod(8330)
ID = 8330
anim = 8330
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
channel = 0

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 730


;POWER CHARGE Particles 
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type=bindtoroot
trigger1= !(time%8)
pos=ceil(-153+(random/3.125)),ceil(82-(random/3.125))

[State 8331, Particle]
type=explod
trigger1= (time%8)=1
anim=8331
sprpriority=ifelse(random<750,5,-1)
postype=p1
vel= ((rootdist x+1)/32.0), ((rootdist y-40)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 730


;ZERO COUNTER PAUSE
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8350, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8350, Circle]
type = explod
trigger1 = !time
anim = 8350
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 8350, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8351
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, End]
type = destroyself
trigger1 = time >= 16


;CUSTOM COMBO
[Statedef 8400]
type = A
physics = N
movetype = I
anim = 8400
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8400, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = time < 25
time = 1
mul = 256, 110, 110

[State 8400, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8400, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8400, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
ignoreHitPause = 1

[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256
ignoreHitPause = 1

[State 0, Power Spark Sound Snd]
type = PlaySnd
trigger1 = !time
value = S6,7
[State 0, Power Spark Sound Snd]
type = PlaySnd
trigger1 = !time
value = S6,7
[State 0, Power Spark Sound Snd]
type = PlaySnd
trigger1 = !time
value = S6,7

[State 8400, EnvShake]
type = EnvShake
trigger1 = !time
time = 3
freq = 60
ampl = -4
phase = 90

[State 8400, Kaioken Energy Spark]
type = explod
trigger1 = !time
anim = 907
ID = 907
sprpriority = 5
postype = p1
pos = 0,60
facing = 1
vfacing = 1
scale = 0.8,0.8
removetime = 15
supermovetime = -1
[State 8400, Lines]
type = explod
trigger1 = !time
anim = 8401
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8400, Circle]
type = explod
trigger1 = time = 16
anim = 8402
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 26


;========================< SUPERPAUSE FX >=============================
;--- --Level 1 -----
[Statedef 8500]
type = A
velset = 0, 0
anim = 8500
sprpriority = 5

[State 8500, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 8500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Circle]
type = explod
trigger1 = time = 24
anim = 8502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8500, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 2 -----
[Statedef 8510]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 8510, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 8510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Circle]
type = explod
trigger1 = time = 24
anim = 8512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8510, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 3 -----
[Statedef 8520]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = ifelse(root, var(1), 8526, 8525)
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = ifelse(root, var(1), 8526, 8525)
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40


;-- Team Level 3 --
[Statedef 8521]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time && partner, name != "Broly"
anim = ifelse(root, var(1), 8526, 8525)
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time && partner, name != "Broly"
anim = ifelse(root, var(1), 8526, 8525)
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40

;--- --Level 3 Kame Portrait -----
[Statedef 8522]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = ifelse(root, var(1), 8527, 8525)
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = ifelse(root, var(1), 8527, 8525)
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40

;--- --Level 3 DragonFist Portrait -----
[Statedef 8523]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = ifelse(root, var(1), 8528, 8525)
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = ifelse(root, var(1), 8528, 8525)
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40

;SUPER FINISH
[Statedef 8600]
type = A
velset = 0, 0
anim = 1

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
trigger2 = winko && matchover && enemy, name = "Broly" && enemy, authorname = "Mr.Ansatsuken"
trigger2 = enemy, selfanimexist(3184) && enemy, teammode != simul
flag = nomusic

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 8600,0
channel = 1

[State 8600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24)
time = 1
mul = 32 * (time -16), 32 * (time -16), 32 * (time -16)

[State 8600, Move Name: Kamehameha]
type = varset
trigger1 = !time && numhelper(3005);(Base) Ground/Air
trigger2 = !time && numhelper(3022);(SSJ2) Ground/Air
trigger3 = !time && numhelper(3025);(SSJ2) Ground/Air
trigger4 = !time && numhelper(3105);(Base) Ground/Up
trigger5 = !time && numhelper(3122);(SSJ2) Ground/Up
trigger6 = !time && numhelper(3135);(Base) Air/Down
trigger7 = !time && numhelper(3138);(SSJ2) Air/Down
var(0) = 1

[State 8600, Move Name: Super Kamehameha]
type = varset
trigger1 = !time && numhelper(3015);(Base) Ground
trigger2 = !time && root, var(23) = 3040;(Base) Air
trigger3 = !time && numhelper(3024);(SSJ2) Ground
trigger4 = !time && numhelper(3042);(SSJ2) Air 
trigger5 = !time && root, var(23) = 3150;(Base) Ground/Up 
trigger6 = !time && numhelper(3124);(SSJ2) Ground/Up
trigger7 = !time && numhelper(3145);(Base) Air/Down
trigger8 = !time && numhelper(3148);(SSJ2) Air/Down
var(0) = 2

[State 8600, Move Name: Dragonfist]
type = varset
trigger1 = !time && numhelper(4108)
var(0) = 3

[State 8600, Move Name: Super Spirit Bomb/Genkidama]
type = varset
trigger1 = !time && root, var(23) = 3900
var(0) = 4

[State 8600, Move Name: Hand Spirit Bomb]
type = varset
trigger1 = !time && numhelper(3405)
var(0) = 5

[State 8600, Move Name: Meteor Strike Bomb]
type = varset
trigger1 = !time && numhelper(3605)
trigger2 = !time && numhelper(3655)
var(0) = 6

[State 8600, Move Name: Fierce Rush]
type = varset
trigger1 = !time && root, var(23) = 3705
trigger2 = !time && root, var(23) = 3754
var(0) = 7

[State 8600, Move Name: Kaioken Attack]
type = varset
trigger1 = !time && root, var(23) = 3230
trigger2 = !time && root, var(23) = 3253
var(0) = 8

[State 8600, Move Name: Kick Burst]
type = varset
trigger1 = !time && root, var(23) = 3502
trigger2 = !time && root, var(23) = 3552
var(0) = 9

[State 8600, Move Name: Meteor Break Kamehameha]
type = varset
trigger1 = !time && numhelper(4006)
var(0) = 10

[State 8600, Move Name: Rapid Kicks]
type = varset
trigger1 = !time && root, var(23) = 3302
trigger2 = !time && root, var(23) = 3353
var(0) = 11

[State 8600, Move Name: Warp Kamehameha]
type = varset
trigger1 = !time && numhelper(4105)
trigger2 = !time && numhelper(4107)
var(0) = 12

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), 0.5 + (0.0625 * time)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
under = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG

[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
trigger2 = winko && matchover && enemy, name = "Broly" && enemy, authorname = "Mr.Ansatsuken"
trigger2 = enemy, selfanimexist(3184) && enemy, teammode != simul
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3

[State 8600, End]
type = destroyself
trigger1 = roundstate < 3

;CAMERA CONTROL
[Statedef 8999]
type = S
velset = 0, 0
anim = 1

[State 8999, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
ignoreHitPause = 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2