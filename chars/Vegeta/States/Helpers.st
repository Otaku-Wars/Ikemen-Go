; __________________
;| Vegeta by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
x = root, facing * ifelse(root,stateno=196,90,-90)
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

;------------------------------------------------------------

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


;---------------------------------------------------
;Grab Blast
[Statedef 823]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 823

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
value = S6,9

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 75 < 50, 50, (root, fvar(12)) * 75)), 0
animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 0, 4
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6.52, -6
ground.cornerpush.veloff = 0
air.velocity = -6, -6
fall = 1
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

[State 3005, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;UpperCut Hand
[Statedef 1054]
type = A
physics = N
movetype = I
anim = 1054
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

;------------------------------------------------------------
;Knee Bash Cont. Blast
[Statedef 1253]
type = A
physics = N
movetype = A
anim = 1253
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1253
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

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
x = 6.5
y = 11.5

[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .5, .5
ignorehitpause = 1

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,9

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
value = 1254
ignorehitpause = 1

[State 1005, End]
type = ChangeState
trigger1 = pos y >= 0
value = 1254

;-------------------------
;-------------------------
;Knee Bash Cont. Blast (Hit Ground)
[Statedef 1254]
type = A
physics = N
movetype = A
anim = 1256
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
trigger1 = 1
value = 90
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1,1.2
ignorehitpause = 1

[State 0, Explosion Snd]
type = PlaySnd
trigger1 = !Time
value = S6,3

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
hitflag = MAFD
guardflag = MA
pausetime = 0,4
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
ground.velocity = -4.25,-8
guard.velocity = -5
ground.cornerpush.veloff = 0
air.velocity = -4.25,-8.25
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
kill = 1
fall.recover = 120
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
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < -20, -20, ifelse(p2dist x < -20, ceil(p2dist x), -20)), -50
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

;-------------------------
;Knee Bash Cont. Blast (If Reversed)
[Statedef 1255]
type = A
physics = N
movetype = I
anim = 1255
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
value = 6, 35
[State 1006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------------------
;Fireball(Normal)
[Statedef 1305]
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
stateno = 1306
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
value = 1305

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
value = S6,9

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 75 < 30, 30, (root, fvar(12)) * 75)), 8
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
value = 1306
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;-------------------------
;Fireball Explosion(Normal)
[Statedef 1306]
type = A
physics = N
movetype = I
anim = 1306
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
value = 6, 34
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Fireball Hand(Normal)
[Statedef 1307]
type = A
physics = N
movetype = I
anim = 1307
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = !time
ID = 1305
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-----------------------------------------
;------------------------------------------------------------
;EX Fireball 1 (Normal)
[Statedef 1308]
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
stateno = 1306
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
value = 1305

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

[State 1005, Hit]
type = hitdef
trigger1 = !Time
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * 75 < 30, 30, (root, fvar(12)) * 75)), 8
animtype = Hard
hitflag = MAFD
guardflag = MAF
pausetime = 0, 28 / ((root, var(20) > 0) + 1)
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
getpower = 0
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
value = 1306
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;------------------------------------------------------------
;EX Fireball 2 (Normal)
[Statedef 1309]
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
stateno = ifelse(var(2) < 2, 1309, 1306)
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
value = 1305

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
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
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
ground.type = Low
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
value = ifelse(var(2) < 2, 1309, 1306)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;---------------------------------------------------
;Fireball (SSJ)
[Statedef 1315]
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
stateno = 1316
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
value = 1315

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
value = S6,9

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 75 < 30, 30, (root, fvar(12)) * 75)), 8
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
value = 1316
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;-------------------------
;Fireball Explosion (SSJ)
[Statedef 1316]
type = A
physics = N
movetype = I
anim = 3106
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = -60
[State 7509, spin]
type=angleset
trigger1 = !time
value = 0
ignorehitpause = 1
persistent = 0
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 34
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Fireball Hand (SSJ)
[Statedef 1317]
type = A
physics = N
movetype = I
anim = 3101
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
value = 40
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

;-----------------------------------------
;------------------------------------------------------------
;EX Fireball 1 (SSJ)
[Statedef 1318]
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
stateno = 1316
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
value = 1315

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

[State 1005, Hit]
type = hitdef
trigger1 = !Time
priority = 4, Hit
attr = S, NA
damage = ceil(ifelse((root, fvar(12)) * 75 < 30, 30, (root, fvar(12)) * 75)), 8
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 28 / ((root, var(20) > 0) + 1)
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
getpower = 0
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
value = 1316
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;------------------------------------------------------------
;EX Fireball 2 (SSJ)
[Statedef 1319]
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
stateno = ifelse(var(2) < 2, 1319, 1316)
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
value = 1315

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
attr = S, NA
damage = ceil(ifelse((root, fvar(12)) * 36 < 35, 35, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 2), 8
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
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
value = ifelse(var(2) < 2, 1319, 1316)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;------------------------------------------------------------
;Air Fireball(Normal)
[Statedef 1405]
type = A
physics = N
movetype = A
anim = 1405
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1406
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

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
y = ifelse(var(2)=1 || time>1,var(6),2)

[State 7509, spin]
type=angleset
trigger1 = !time
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1
[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,9

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = A, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 75 < 30, 30, (root, fvar(12)) * 75)), 8
animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MAF
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -vel x, vel y
down.hittime = 20
down.velocity = 0, 0
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
value = 1406
ignorehitpause = 1

[State 1005, End]
type = ChangeState
trigger1 = pos y > 0
value = 1406

;-------------------------
;Air Fireball Explosion
[Statedef 1406]
type = A
physics = N
movetype = I
anim = 1406
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
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 34
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Air Fireball Hand
[Statedef 1407]
type = A
physics = N
movetype = I
anim = 1407
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
value = -35
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

;------------------------------------------------------------
;Air Fireball(SSJ)
[Statedef 1408]
type = A
physics = N
movetype = A
anim = 3105
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3106
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

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
y = ifelse(var(2)=1 || time>1,var(6),2)

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,9

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !(Root, var(27))
priority = 4, Hit
attr = S, SP
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 75 < 30, 30, (root, fvar(12)) * 75)), 8
animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MAF
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -vel x, vel y
down.hittime = 20
down.velocity = 0, 0
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
value = 3106
ignorehitpause = 1

[State 1005, End]
type = ChangeState
trigger1 = pos y > 0
value = 3106

;-------------------------
;SSJ Air Fireball Hand
[Statedef 1409]
type = A
physics = N
movetype = I
anim = 3101
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Atomic Blast
[Statedef 1555]
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

[State 2010, SPECIAL]   
type = Afterimage
trigger1 = time = 1
length = 9
PalBright = 0,0,0
PalContrast =100,100,0
PalAdd = 0,0,0
PalMul = .5,.5,.5
timeGap = 1
frameGap = 2
trans = add
time = 999
palcolor = 0 

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 1555, 1556)
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
value = 1555

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
x = ifelse((time < 2 && var(2) > 1), 14, 14)
y = 0

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 1555
ID = 1555
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
ontop = 0
scale = .4,.1
sprpriority = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 1555
trans = addalpha
alpha = 256-(18*time),256
ignorehitpause = 1
removeongethit = 1

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
trigger1 = !(Root, var(16)) && (Root, var(15) < 25 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 36 < 20, 20, (root, fvar(12)) * 36)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 3), 6
sparkno = -1
guard.sparkno = -1;guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 3, -10.52, -6), ifelse(var(2) < 3, 0, -6)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -6
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
p2stateno = 8850
P1sprpriority = 0
P2sprpriority = 1
forcestand = 1

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
value = ifelse(var(2) < 3, 1555, 1556)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;-------------------------
;Atomic Blast Explosion
[Statedef 1556]
type = A
physics = N
movetype = I
anim = 4106
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = !time
ID = 1555
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1.5, 1.5
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Big Bang
[Statedef 3005]
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

[State 7509, spin]
type=angleset
trigger1 = !time
value = 30
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1.3, 1
ignorehitpause = 1

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
value = ifelse(var(2) < 5, 3005, 3006)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;-------------------------
;Big Bang Explode
[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 0, PalFXWiz]
type = PalFX
trigger1 = !Time
time = 27
add = 0,0,0
mul = 0,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------------------------------------------
;------------------------------------------------
;Max Big Bang
[Statedef 3055]
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

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3055, 3006)
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

[State 7509, spin]
type=angleset
trigger1 = !time
value = 30
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1.3, 1
ignorehitpause = 1

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
stateno = 7183
ID = 7183
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
value = ifelse(var(2) < 8, 3055, 3006)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]
;========================< BIG BANG SHIELD >=============================
;Big Bang Shield
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

;---------------------------------------------------------------
;Rapid Fireball
[Statedef 3105]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3105
ignorehitpause = 1
[State 1005, HB]
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

[State 1005, Vel]
type = velset
trigger1 = 1
x = 5
y = 5

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,9

[State 1005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = A, SA
;damage = ceil(52 * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 35 < 17,17, (root, fvar(12)) * 35)), 8
animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MAF
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -vel x, vel y
down.hittime = 20
down.velocity = 0, 0
fall.recover = 1
fall.recovertime = 120
getpower = 0
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
type = ChangeState
trigger1 = movecontact
trigger2 = pos Y > 0
value = 3106

;-------------------------
;Rapid Fireball Explode
[Statedef 3106]
type = A
physics = N
movetype = I
anim = 3106
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 7509, spin]
type=angleset
trigger1 = 1
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
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
value = 6, 34
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Rapid Fire Big Ball
[Statedef 3155]
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
stateno = ifelse(var(2) < 1, 3155, 3156)
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
value = 3155

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
[State 1005, Vel]
type = velset
trigger1 = 1
x = 9
y = 9

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

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = !Time
value = S6,5

[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 80 < 50, 50, (root, fvar(12)) * 80)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MAF
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -vel x, vel y
down.hittime = 20
down.velocity = 0, 0
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
value = ifelse(var(2) < 1, 3155, 3156)

[State 3005, End]
type = ChangeState
trigger1 = pos Y > 0
value = 3156

;-------------------------
;Rapid Fireball Explode
[Statedef 3156]
type = A
physics = N
movetype = I
anim = 3156
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 2, 10
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 2, 10
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Galick Gun Form
[Statedef 3201]
type = A
physics = N
movetype = A
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, End]
type = destroyself
trigger1 = time > ifelse(root,stateno=4402,150,38)

;------------------------------------------------
;Galick Gun Hand
[Statedef 3202]
type = A
physics = N
movetype = A
anim = 3202
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, PalFXWiz]
type = PalFX
trigger1 = 1
time = -1
add = 0,-105,0
mul = 256,256,256
sinadd = 40,80,40,10
invertall = 0
color = 0
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = time > 18

;------------------------------------------------
;Galic Gun
[Statedef 3205]
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
stateno = ifelse(var(2) < 5, 3205, 3206)
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
value = 3205

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
trigger1 = timemod = 2,1
anim = 3207
ID = 3207
pos = -5,-68
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
ontop = 1
scale = .6,.35
sprpriority = 1
ownpal = 1
ignorehitpause = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 3207
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 15
id = 3207
ignorehitpause = 1

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
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), -70
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
value = ifelse(var(2) < 5, 3205, 3206)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;-------------------------
;Galic Gun Explode
[Statedef 3206]
type = A
physics = N
movetype = I
anim = 3206
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, PosAdd]
type = PosAdd
trigger1 = !Time
x = 0
y = -70

[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = !time
ID = 3207

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .8, .8
ignorehitpause = 1

[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------------------------------------------
;------------------------------------------------
;Max Galic Gun
[Statedef 3255]
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
stateno = ifelse(var(2) < 8, 3255, 3206)
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
value = 3205

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

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3207
ID = 3207
pos = -5,-68
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
ontop = 1
scale = .6,.35
sprpriority = 1
ownpal = 1
ignorehitpause = 1
removeongethit = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time > 1
ID = 3207
trans = addalpha
alpha = 256-(15*time),256
ignorehitpause = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time > 15
id = 3207
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
trigger1 = !(Root, var(16)) && (Root, var(15) < 25 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 30 < 30, 30, (root, fvar(12)) * 30)), 8
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

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7182) < 1
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
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), -70
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
value = ifelse(var(2) < 8, 3255, 3206)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]


;------------------------------------------------
;Super BBA
[Statedef 3355]
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

[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,16
[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,28
[State 0, Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,16

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3355

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
y = ifelse((time < 2 && var(2) > 1), 1, 9)

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = (-7 -(random / 3000.0))*1.5, (-4 +(random / 2000.0))*1.5
accel =  0.50- (0.001*(random%100)), 0.100- (0.002*(random%100))
anim = 7183
sprpriority = 2
postype = p1
pos = -20, -15
random = 40, 45
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = (-7 -(random / 3000.0))*1.5, (-4 +(random / 2000.0))*1.5
accel =  0.50- (0.001*(random%100)), 0.100- (0.002*(random%100))
anim = 7184
trans = Sub
sprpriority = -1
postype = p1
pos = -20, -15
random = 40, 45
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
channel = 1
persistent = 0
ignorehitpause = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = frontedgedist >= -5
time = 1
id = -1
pos = 0,(abs(enemynear,const(size.mid.pos.y))-5)


[State 3005, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 25 || Root, var(20))
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 10 < 3, 3, (root, fvar(12)) * 10)), 1
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
kill = PARENT,pos y > -vel y
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
trigger1 = PARENT,pos y > -vel y
value = 3356

;---------------------------------------------------------------------------
;Super BBA Explosion
[Statedef 3356]
type = A
physics = N
movetype = A
anim = 3356
ctrl = 0
velset = 0,0
juggle = 0
facep2 = 0
ownpal = 1
hitdefpersist = 0
movehitpersist = 0
hitcountpersist = 0
sprpriority = 3

[State 0, PalFX]
type = PalFX
trigger1 = 1
time = 64
add = 0,0,256
mul = 256,256,256
invertall = 0
color = 256

[State 200,HitDef]
type = HitDef
trigger1 = !time
attr = S,HP
animtype = Light
damage = 90,0
guardflag = MA
hitflag = MAF
priority = 3,Hit
sparkno	= -1
guard.sparkno = -1
sparkxy = 0,0
ground.type = High
ground.slidetime = 13
ground.hittime = 18
ground.velocity = 1,-7
air.velocity= 1,-7
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

[State 4001,2]
type = PlaySnd
trigger1 = !time
value = s6,25

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
anim = 3356
ID = 3608
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 60
scale = .8,.8
ontop = 1
ownpal = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time < 32
ID = 3604
trans = addalpha
alpha = 256-(8*time),256

[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = time >= 32
ID = 3604

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0+(.2*time),0+(.2*time)

[State 0, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 5*time
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = ceil(256-(5.333*time)),256

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0,End]
type = destroyself
trigger1 = time >= 34

;------------------------------------------------
;Super BBA Hand
[Statedef 3358]
type = A
physics = N
movetype = A
anim = 3358
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 48, -65

[State 7509, spin]
type=angleset
trigger1 = 1
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = !animtime

;---------------------------------------------------------------
;Air Super Galick Gun
[Statedef 3401]
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
stateno = 3401
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
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 0, -60

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3401

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
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 35 < 25, 25, (root, fvar(12)) * 35)), 4
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
air.velocity = -2, -.5
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 14
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(ifelse((root, fvar(12)) * 35 < 25, 25, (root, fvar(12)) * 35)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
guardflag = MAF
priority = 4, Hit 
pausetime = 16, 18
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -6, -9
down.velocity = -6, -9
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

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7182) < 1
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
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 0, ceil(p2dist x), 0)), -73
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
type = destroyself
trigger1 = !Animtime

;------------------------------------------------
;Saiyan Beat Down Blast
[Statedef 3505]
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
stateno = ifelse(var(2) < 5, 3505, 3506)
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
value = 3505

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
x = 7
y = 7

[State 3025, particles]
type = explod
trigger1 = 1
vel = (-7 -(random / 3000.0))*1.5, (-4 +(random / 2000.0))*1.5
accel =  0.50- (0.001*(random%100)), 0.100- (0.002*(random%100))
anim = 7185
sprpriority = 2
postype = p1
pos = -20, -15
random = 40, 45
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.2, 0.2
ownpal = 1
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = (-7 -(random / 3000.0))*1.5, (-4 +(random / 2000.0))*1.5
accel =  0.50- (0.001*(random%100)), 0.100- (0.002*(random%100))
anim = 7184
trans = Sub
sprpriority = -1
postype = p1
pos = -20, -15
random = 40, 45
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.2, 0.2
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
;kill = (var(2) = 5)
fall = 1;(var(2) >= 5)
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
trigger1 = movehit && numtarget && numhelper(7185) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7185
ID = 7185
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
value = ifelse(var(2) < 5, 3505, 3506)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;---------------------------------------------------------------------------
;-------------------------
;Saiyan Beat Down Blast Explode
[Statedef 3506]
type = A
physics = N
movetype = A
anim = 3506
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 3, 3
ignorehitpause = 1

[State 3006, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;Maximum Flasher
[Statedef 3605]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
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
stateno = 3606
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Anim]
type = changeanim
trigger1 = !time
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

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 3

[State 0, Helper]
type = Helper
trigger1 = Movehit && NumTarget
trigger1 =(target,Movetype = H)
triggerall = NumHelper (3611) < 1
helpertype = normal
name = "P2 Body Electricity"
ID = 3611
stateno = 3611
pos = 0,0
postype = p2
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 0, Pete]
type = Explod
trigger1 = random <650
anim = 7032+random%5
ID = 7032
pos = -10,0
vel = 0,0;-7+random%4,(-9+random%18)*.1
accel = 0,0
random = 10,30
removetime = -2
pausemovetime = 0
scale = .4,.4
sprpriority = 4+random%2
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = Explod
trigger1 = gametime%5=0
anim = 3603
ID = 3603
pos = -50,floor(-pos y)
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = 0
removeongethit = 1
scale = .5,.1
sprpriority = 3
ownpal = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .6,.7

[State 0, Explod]
type = Explod
trigger1 = timemod = 2,1
anim = 3604
ID = 3604
pos = -20,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
scale = .3,.2
sprpriority = 1
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = moveguarded
id = 3604
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = movereversed
id = 3604

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add

[State 4001,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = !time
x = 16
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,1

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 3
ignorehitpause = 1

[State 4001,HitDef 2]
type = HitDef
trigger1= time = 0
attr = SCA, HP
hitflag = MAF
guardflag = MA
animtype = Hard
priority = 7, Hit
damage = 180,30
pausetime = 0,16
guard.pausetime = 0,32
sparkno = -1;s7040
guard.sparkno = -1; -1;s7040
sparkxy = 0,0
hitsound = -1
guardsound = -1
ground.type = Trip
air.type = Trip
ground.slidetime = 25
ground.hittime = 25
air.hittime = 25
yaccel = 0.35
ground.velocity = -14,-8
guard.velocity = -10
air.velocity = -14,-8
airguard.velocity = -14,-8
ground.cornerpush.veloff = 0
fall = 1
fall.recover = 0
kill = FrontEdgeDist <= 0
palfx.time = 100
palfx.mul = 256,256,256
palfx.add = 255,255,255
palfx.sinadd = -100,-100,-155,40
getpower = 0,0
id = 3213
nochainid = 3213
;p2stateno = 1025

[State 0]
type = EnvShake
trigger1 = gametime%10=0
time = 12
freq = 100
ampl = -6
phase = 85

[State 0, TargetState]
type = TargetState
trigger1 = movehit = 1 && numtarget(3670)
value = 3670
ID = 3213
ignorehitpause = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = frontedgedist >= 0 && movehit
time = 1
id = 3213
pos = 2,45;abs(enemynear,const(size.mid.pos.y));-15)

[State 0, Explocion]
type = ChangeState
trigger1 = moveguarded
value = 3607

[State 0, Explocion]
type = ChangeState
trigger1 = movereversed
value = 3607

[State 0, Explocion]
type = ChangeState
trigger1 = FrontEdgeDist <= 0
trigger2 = time >= 150; Maximum time duration. This is even avoid bugs.
trigger3 = numtarget(3213)
trigger3 = target(3213), movetype != H
value = 3606

;-------------------------
;Maximum Flasher Electricity
[Statedef 3611]
physics = N
velset = 0,0
anim = 3611
sprpriority = 4

[State 8023, AssertSpecial]
type = AssertSpecial
trigger1 = Time >= 0
flag = NoShadow
flag2 =invisible
ignorehitpause = 1

[State 8023, flames]
type = Explod
trigger1 = numexplod(7032)<8
anim = 7032+random%4
ID = 7032
sprpriority = 3
postype = p2
vel = -.2,-.75
pos = (enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))+10
random = 40,40
removetime = -2
scale = .4,.4
ownpal = 1

[State 8023, PosAdd]
type = PosAdd
trigger1 = Time >= 0
x = ceil(p2dist x)
y = ceil(p2dist y)

[State 8023, DestroySelf]
type = DestroySelf
trigger1 = time >= 120
trigger2 = enemynear,ctrl ||(enemynear,movetype!=H) || (enemynear,statetype=L)

;---------------------------------------------------------------------------
;Maximum Flasher Explosion
[Statedef 3606]
type = A
physics = N
movetype = A
anim = 3606
ctrl = 0
velset = 0,0
juggle = 0
facep2 = 0
ownpal = 1
hitdefpersist = 0
movehitpersist = 0
hitcountpersist = 0
sprpriority = 3

[State 200,HitDef]
type = HitDef
trigger1 = time = 0
attr = S,HP
animtype = Light
damage = 90,0
guardflag = MA
hitflag = MAF
priority = 3,Hit
sparkno	= -1
guard.sparkno = -1
sparkxy = 0,0
ground.type = High
ground.slidetime = 13
ground.hittime = 18
ground.velocity = 1,-7
air.velocity= 1,-7
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

[State 4001,2]
type = PlaySnd
trigger1 = time = 0
value = s6,23
;persistent = 0

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
anim = 3608
ID = 3608
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 64
scale = .8,.8
ontop = 1
ownpal = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time < 32
ID = 3604
trans = addalpha
alpha = 256-(8*time),256

[State 0, ModifyExplod]
type = RemoveExplod
trigger1 = time >= 32
ID = 3604

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0+(.2*time),0+(.2*time)

[State 0, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 5*time
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = ceil(256-(5.333*time)),256

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0,End]
type = destroyself
trigger1 = time >= 64

;------------------------------------------------
;-------------------------
;Maximum Flasher Explosion (Guarded)
[Statedef 3607]
type = A
physics = N
movetype = I
anim = 3610
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .5, .5
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;Maximum Flasher Hand Blast Fade
[Statedef 3608]
type = A
physics = N
movetype = I
anim = 3607
ctrl = 0
velset = .6, 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 68, -58

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = Changestate
trigger1 = time >= 40
value = 3609

;-------------------------
;Maximum Flasher Hand Blast Fade
[Statedef 3609]
type = A
physics = N
movetype = I
anim = 3609
ctrl = 0
velset = .6, 0
sprpriority = 4

[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 23
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime
;===========================================================================0===
;Final Flash - P2
[Statedef 3670]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 5030

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = ifelse(time % 2,2,-2)

[State 3162, End]
type = changestate
trigger1 = backedgebodydist < -10
value = 1025

;------------------------------------------------
;Gut Galick Gun
[Statedef 4015]
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
stateno = 4015
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
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 40, -50

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4015

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

[State 0, GG Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,16
[State 0, GG Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,18

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 15 < 15, 15, (root, fvar(12)) * 15)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 1, 6
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = 0, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
kill = 0
fall = 0
fall.recover = 0
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
pausetime = 8, 12
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3,-15
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -3, -15
getpower = 0
givepower = 36, 36
kill = 0
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
trigger1 = movehit && numtarget && numhelper(7182) < 1
helpertype = normal
stateno = 7182
ID = 7182
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
type = Destroyself
trigger1 = !animtime

;------------------------------------------------
;Chest Blast
[Statedef 4016]
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
stateno = 4016
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
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 210, -70

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4016

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

[State 0, GG Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,16
[State 0, GG Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,16
[State 0, GG Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,18
[State 0, GG Blast Snd]
type = PlaySnd
trigger1 = !Time
value = S6,18

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 6
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16 || animelem = 18
trigger2 = animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30 || animelem = 32 
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 10 < 10, 10, (root, fvar(12)) * 10)), 4
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 1, 6
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = 0, 0
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
kill = 0
fall = 0
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelem = 34
attr = S, HP 
damage = ceil(ifelse((root, fvar(12)) * 25 < 25, 25, (root, fvar(12)) * 25)), 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit 
pausetime = 8, 12
sparkno = -1
guard.sparkno = -1
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -8
getpower = 0
givepower = 36, 36
kill = 1
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
pos = ifElse(p2dist x < 0, -10, ifelse(p2dist x < -20, ceil(p2dist x), -20)), -65
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
trigger1 = movehit && numtarget && numhelper(7185) < 1
helpertype = normal
stateno = 7185
ID = 7185
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
type = ChangeState
trigger1 = !Animtime
value = 4017

;-----------------------------------------------------------
;Chest Blast Explode
[Statedef 4017]
type = A
physics = N
movetype = I
ctrl = 0
anim = 4017
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
alpha = ifelse(time>=12,0,256-12*time), 256
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = time >= 12

;------------------------------------------------
;Final Flash Ball Form
[Statedef 4102]
type = A
physics = N
movetype = A
anim = 4102
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = time*3
scale = 0.03 + (0.00125 * root,var(2)), 0.03 + (0.00125 * root,var(2))

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 38
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = time > 120

;------------------------------------------------
;Final Flash Beam
[Statedef 4103]
type = A
physics = N
movetype = A
anim = 4105
ctrl = 0
velset = 0, 0
sprpriority = 12

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 63, -75
ignorehitpause = 1

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4103
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 48
freq = 60
ampl = -4
phase = 90

[State 7509, spin]
type=angleset
trigger1 = !time
value = 15
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 0, FF Release Snd]
type = PlaySnd
trigger1 = !time
value = S6,18
[State 0, FF Release Snd]
type = PlaySnd
trigger1 = !time
value = S6,19
[State 0, FF Release Snd]
type = PlaySnd
trigger1 = !time
value = S6,30
[State 0, FF Release Snd]
type = PlaySnd
trigger1 = !time
value = S6,30

[State 3065, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
trigger3 = animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23
trigger4 = animelem = 24
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) *20 < 10, 10, (root, fvar(11)) *20)), 4
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
ground.type = Low
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -3.52
air.velocity = -2, 0
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
fall = 1
fall.recover = 0
kill = 0
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
trigger1 = animelem = 25 
attr = S, SP
damage = ceil(ifelse((root, fvar(11)) *20 < 10, 10, (root, fvar(11)) *20)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 20,20
sparkno = -1
guard.sparkno = -1
hitsound = s2, 3200
guardsound = s3, 0
ground.type = Low
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -15, -15
ground.cornerpush.veloff = 0
guard.velocity = -3.52
air.velocity = -12, -15
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
fall = 1
fall.recover = 0
kill = 0
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

[State 3025, dizzyfx]
type = helper
trigger1 = movehit && numtarget && numhelper(4133) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 4133
ID = 4133
name = "Dizzy FX"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 3005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), -50
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
type = destroySelf
trigger1 = !animtime

;---------------------------------------------
;Final Flash Theme
[Statedef 4105]
type = S
velset = 0, 0
anim = 9741

[State 8600, Theme Sound]
type = playsnd
trigger1 = !time ;&& matchover
value = 6,38
channel = 1
[State 8600, Theme Sound]
type = playsnd
trigger1 = !time ;&& matchover
value = 6,38
channel = 2
[State 8600, Theme Sound]
type = playsnd
trigger1 = !time ;&& matchover
value = 6,38
channel = 3
[State 8600, Theme Sound]
type = playsnd
trigger1 = !time ;&& matchover
value = 6,38
channel = 4

[State 7600, Snd]
type = assertspecial
trigger1 = 1
flag = nomusic

;========================< DIZZY FX >=============================
;Dizzy
[Statedef 4133]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 3033, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 3033, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State 3033, Snd]
type = playsnd
trigger1 = enemynear, stateno = 5300
value = 0, ifelse(random < 500, 5300, 5301)
persistent = 0
[State 3033, End]
type = destroyself
trigger1 = enemynear, ctrl
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)

;------------------------------------------------
;Final Shine Form
[Statedef 4201]
type = A
physics = N
movetype = A
anim = 4201
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 7509, spin]
type=angleset
trigger1 = !time
value = -35
ignorehitpause = 1
persistent = 0
[State 7509, spin]
type=angledraw
trigger1 = !(root, var(1))
scale = 1, 1
ignorehitpause = 1

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = time*3
scale = 0.3 + (0.00125 * root,var(35)), 0.3 + (0.00125 * root,var(35))

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 3005, End]
type = destroyself
trigger1 = time > 98

;------------------------------------------------
;Final Shine Hand
[Statedef 4202]
type = A
physics = N
movetype = A
anim = 4202
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angleset
trigger1 = 1
value = 45
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = .5, .5
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = time > 90

;------------------------------------------------
;Final Shine Blast
[Statedef 4203]
type = A
physics = N
movetype = A
anim = 4203
ctrl = 0
velset = 0, 0
sprpriority = 4 

[State 7509, spin]
type=angleset
trigger1 = 1
value = 45
ignorehitpause = 1
persistent = 1
[State 7509, spin]
type=angledraw
trigger1 = 1
scale = 1.3, 1.3
ignorehitpause = 1

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4203
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 48
freq = 60
ampl = -4
phase = 90

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3065, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12
attr = S, HP
damage = ceil(ifelse((root, fvar(11)) *25 < 3, 3, (root, fvar(11)) * 25)), 4
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
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -1
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = 0, -1
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
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
trigger1 = animelem = 14
attr = S, HP
damage = ceil(ifelse((root, fvar(11)) *25 < 3, 3, (root, fvar(11)) * 25)), 4
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
pausetime = 18,20
sparkno = -1
guard.sparkno = -1
hitsound = s2, 6
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -7
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -7
p2facing = 1
;p2stateno = 7696
getpower = 0
givePower = 0.5 * 36, 36
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
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 10, ceil(p2dist x), 10)), -50
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

[State 3055, End]
type = destroyself
trigger1 = !animtime

;------------------------------------------------
;SSJ Aura
[Statedef 4204]
type = A
physics = N
movetype = A
anim = 4204
ctrl = 0
velset = 0, 0
sprpriority = 4

;[State 0, Explod]
;type = Explod
;trigger1 = !Time
;anim = 4205
;ID = 4205
;pos = 0,0
;postype = p1  ;p2,front,back,left,right
;facing = 1
;vfacing = 1
;bindtime = -1
;vel = 0,0
;accel = 0,0
;random = 0,0
;removetime = 125
;supermovetime = 255
;scale = .5,.5
;sprpriority = 0
;ontop = 1
;shadow = 0,0,0
;ownpal = 0
;removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,32
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,32

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1056, Trans]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 3005, End]
type = destroyself
trigger1 = time > 125

;-------------------------
;SSJ Transform Aura
[Statedef 4505]
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
[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;SSJ Transform Aura
[Statedef 4506]
type = A
physics = N
movetype = I
anim = 4506
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
;SSJ Transform Armor
[Statedef 4507]
type = A
physics = N
movetype = A
anim = 4502
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 4507
time = -1
ignorehitpause = 1 

[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;SSJ Transform Aura Very Quick
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

;-------------------------
;SSJ Transform Aura (Facing Up) During Attack 
[Statedef 4700]
type = A
physics = N
movetype = I
anim = 4700
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = !Time
time = 8

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
scale = 1, 1.1
ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = !animtime

;-------------------------
;SSJ Transform Aura (Sideways) During Attack 
[Statedef 4701]
type = A
physics = N
movetype = I
anim = 4700
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


; Ki Aura
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
trigger2 = !time && root, stateno = 4003
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
anim = 6013
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
trigger1 = time = 8
value = S730,1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 8
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


;Rushing SSJ Aura
[Statedef 6003]
physics = N
velset = 0, 0
;anim = 3403
anim = 6020
sprpriority = 5

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
sprpriority = 4
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

;Rushing Base Ki Aura
[Statedef 6005]
physics = N
velset = 0, 0
anim = 6040
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 6005
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 6041
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
anim = 6042
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
anim = 6043
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


;Rushing Base Ki Aura
[Statedef 6006]
physics = N
velset = 0, 0
anim = 6040
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && root, stateno = 6005
value = S730,2
loop = 1
channel = 3

[State 0, Energy Charge]
type = Explod
trigger1 = !time
ID = 6000
anim = 6041
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
anim = 6042
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
anim = 6043
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
pos = 0, -10
[State 6000, End]
type = removeexplod
trigger1 = time > 10
ID = 6001
[State 6000, End]
type = removeexplod
trigger1 = time > 10
ID = 6002
[State 6000, End]
type = changestate
trigger1 = time > 10
value = 6001
ctrl = 0

;------------------------------------------------------------
;SSJ Aura FOR THE SUPER BIG BANG ATTACK
[Statedef 6007]
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
trigger1 = time = 8
value = S730,1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 8
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

;---------------------------------
;SSJ Aura For Final Flash Punch
[Statedef 6008]
physics = N
velset = 0, 0
;anim = 3403
anim = 6050
sprpriority = 5

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = root, anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 8
value = S730,1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 8
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
anim = 6051
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
anim = 6052
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
anim = 6053
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
pos = 38, -45
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
;--- GREEN FIRE ---
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

;--- PURPLE FIRE ---
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
anim = 7182
ID = 7182
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

;--- YELLOW FIRE ---
[Statedef 7185]
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
anim = 7185
ID = 7185
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
;----------------------------------------------------------------
[Statedef 7652]
physics = N
velset = 0, 0
anim = 9741
[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 7650, End]
type = destroyself
trigger1 = root, stateno = 0

;========================< Super Galick Gun Gut Punch >=============================
;Super Galick Gun Gut Punch 
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
x = -15

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

;========================<SPARKS>=============================
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
ID = 8330

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
vel= ((rootdist x+1)/32.0), ((rootdist y-35)/32.0)
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


;POWER CHARGE MAIN FX 
[Statedef 8332]
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
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,2
loop = 1
channel = 3

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

[State 8330, SSJ Aura]
type = explod
trigger1 = !numexplod(4204)
ID = 4204
anim = 4204
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
type = stopsnd
trigger1 = root, stateno != 730
channel = 3

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8330, End]
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
mul = 128, 128, 128

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

;--- --Level 2 For Maximum Flasher-----
[Statedef 8511]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 10, -85
ignorehitpause = 1

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


;--- Team Lv3 ---
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


;SUPER FINISH
[Statedef 8600]
type = A
velset = 0, 0
anim = 1

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

[State 8600, Move Name: Custom Combo]
type = varset
trigger1 = !time && root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Galick Gun]
type = varset
trigger1 = !time && numhelper(3205);(root, var(23) = [3000, 3099])
trigger2 = !time && numhelper(3255);(root, var(23) = [3000, 3099])
var(0) = 2

[State 8600, Move Name: Super Galick Gun]
type = varset
trigger1 = !time && numhelper(3401)
var(0) = 3

[State 8600, Move Name: Big Bang Attack]
type = varset
trigger1 = !time && numhelper(3005);(root, var(23) = [3000, 3099])
trigger2 = !time && numhelper(3055);(root, var(23) = [3000, 3099])
var(0) = 4

[State 8600, Move Name: Super Big Bang Attack]
type = varset
trigger1 = !time && numhelper(3355)
var(0) = 5

[State 8600, Move Name: Super Kick]
type = varset
trigger1 = !time && root, var(23) = 3300
var(0) = 6

[State 8600, Move Name: Super Rising Kick]
type = varset
trigger1 = !time && root, var(23) = 3354
var(0) = 7

[State 8600, Move Name: Rapid Fire]
type = varset
trigger1 = !time && numhelper(3105)
trigger2 = !time && numhelper(3155)
var(0) = 8

[State 8600, Move Name: Maximum Flasher]
type = varset
trigger1 = !time && numhelper(3605)
var(0) = 9

[State 8600, Move Name: Dirty Fireworks]
type = varset
trigger1 = !time && root, var(23) = 4003
var(0) = 10

[State 8600, Move Name: Final Flash]
type = varset
trigger1 = !time && root, var(23) = 4150
var(0) = 11

[State 8600, Move Name: Final Shine Attack]
type = varset
trigger1 = !time && root, var(23) = 4209
var(0) = 12

[State 8600, Move Name: Babidi's Trash]
type = varset
trigger1 = !time && root, var(23) = 4008
var(0) = 13

[State 8600, Move Name: Saiyan Beat Down]
type = varset
trigger1 = !time && root, var(23) = 3502
trigger2 = !time && root, var(23) = 3552
var(0) = 14

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
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3

[State 8600, End]
type = destroyself
trigger1 = roundstate < 3

;---------------------------------------------------------------------------
;Atomic Blast Custom State
[Statedef 8850]
type    = A
movetype= H
physics = N
velset = 0,0


[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
value = 5030+(selfanimexist(5051)=1)*21

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 8860

;---------------------------------------------------------------------------
;Atomic Blast Custom Hit State
[Statedef 8851]
type    = A
movetype= H
physics = N
velset = 0,0


[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 8860

;---------------------------------------------------------------------------
;Atomic Blast Custom Hit State
[Statedef 8860]
type    = A
movetype= H
physics = N
ctrl = 0

[State 820, posadd]
type = posadd
trigger1 = anim != [8850,8852]
trigger1 = Time = 0
y = const(size.head.pos.Y)-const(size.mid.pos.Y)

[State -2, ChangeAnim2]
type = ChangeAnim2
trigger1 = anim != [8850,8852]
Trigger1 = Time = 0
value = 8860

[State -2, AngleDraw]
type = AngleDraw
trigger1 = anim != [8850,8852]
trigger1 = 1

[State -2, AngleAdd]
type = AngleAdd
trigger1 = anim != [8850,8852]
trigger1 = time%2 = 0
value = 45

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 4]
type = SelfState
trigger1 = time > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim=[8850,8852]),0,const(size.head.pos.Y)-const(size.mid.pos.Y))
value = 5100

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------
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