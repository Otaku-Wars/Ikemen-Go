; ________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<NORMAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Standing Light Punch
[Statedef 200]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Anim]
type=changeanim
trigger1=!time
value=200

[State 730, SSJ2Mode]
type = changeanim
triggerall = var(1) = 1
trigger1 = !time
value = 13200

[State 200,Posset]
type=posset
trigger1=!time
y=0

[State 200, Voice Snd]
type=playsnd
trigger1= !time
value= 5,1
[State 200, Voice Snd]
type=playsnd
trigger1= !time
value= 5,1
[State 200, Swing Snd]
type=playsnd
trigger1= !time
value=1,0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -63
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 200, Strong Blow Elbow Dash]
type = ChangeState
trigger1 = movecontact && command = "x" && random>=300
value = 205
ctrl = 1

[State 200, Strong Blow Elbow Dash]
type = ChangeState
trigger1 = movecontact && command = "y" && random>=300
value = 205
ctrl = 1

[State 200, Strong Blow Elbow Dash]
type = ChangeState
trigger1 = movecontact && command = "z" && random>=300
value = 205
ctrl = 1

[State 200, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Strong Blow (Elbow Dash)
[Statedef 205]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 205, Anim]
type=changeanim
trigger1=!time
value=205

[State 730, SSJ2Mode]
type = changeanim
triggerall = var(1) = 1
trigger1 = !time
value = 13205

[State 205,Posset]
type=posset
trigger1=!time
y=0

[State 205, Teleport Snd]
type=playsnd
trigger1= !time
value=6,0
[State 205, Teleport Snd]
type=playsnd
trigger1= !time
value=6,0
[State 205, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 205, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 205, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 205, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 205, Swing Snd]
type=playsnd
trigger1= !time
value=1,0
[State 205, Swing Snd]
type=playsnd
trigger1= Animelem = 4
value=6,1

[State 205, Pause]
type = Pause
trigger1 = movehit
time = 2
movetime = 1
anim = -1
[State 205, EnvShake]
type = EnvShake
trigger1 = movehit
time = 10
freq = 50
ampl = -2
phase = 60

[State 205, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 15

[State 205, Strong Blow FX]
type = Explod
trigger1 = animelem = 4
anim = 206
ID = 206
pos = 35,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 11
scale = 0.8,0.8
ontop = 1
removeongethit = 1

[State 205, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*40<7, 7, fvar(11)*40)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 14, 14), ifelse(var(20), 6, 6)
guard.pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 6, 6)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,3200
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=63), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 205, end]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Anim]
type=changeanim
trigger1=!time
value=210

[State 730, SSJ2Mode]
type = changeanim
triggerall = var(1) = 1
trigger1 = !time
value = 13210

[State 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,50
[State 210, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,50
[State 210, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,50
[State 210, Swing Snd]
type=playsnd
trigger1= animelem=2
value=1,1

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 210, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 210, Strong Blow]
type = ChangeState
trigger1 = movecontact && command = "x" && random>=300
value = 205
ctrl = 1

[State 210, Strong Blow]
type = ChangeState
trigger1 = movecontact && command = "y" && random>=300
value = 205
ctrl = 1

[State 210, Strong Blow]
type = ChangeState
trigger1 = movecontact && command = "z" && random>=300
value = 205
ctrl = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Far Strong Punch
[Statedef 220]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=220

[State 730, SSJ2Mode]
type = changeanim
triggerall = var(1) = 1
trigger1 = !time
value = 13220

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,0
[State 220, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,0
[State 220, Swing Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*60<7, 7, fvar(11)*60)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -8.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 220, Strong Blow]
type = ChangeState
trigger1 = movecontact && command = "x" && random>=300
value = 205
ctrl = 1

[State 220, Strong Blow]
type = ChangeState
trigger1 = movecontact && command = "y" && random>=300
value = 205
ctrl = 1

[State 220, Strong Blow]
type = ChangeState
trigger1 = movecontact && command = "z" && random>=300
value = 205
ctrl = 1

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Light Kick
[Statedef 230]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Anim]
type=changeanim
trigger1=!time
value=230

[State 230, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13230

[State 230,Posset]
type=posset
trigger1=!time
y=0

[State 230, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 230, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 230, Voice Snd]
type=playsnd
trigger1= !time
value= 5,51
[State 230, Swing Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=71), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 230, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 230, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "a" && random>=300
value = 235
ctrl = 1

[State 230, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "b" && random>=300
value = 235
ctrl = 1

[State 230, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "c" && random>=300
value = 235
ctrl = 1

[State 230, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Strong Blow (Knee)
[Statedef 235]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 235, Anim]
type=changeanim
trigger1=!time
value=235

[State 235, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13235

[State 205,Posset]
type=posset
trigger1=!time
y=0

[State 235, Teleport Snd]
type=playsnd
trigger1= !time
value=6,0
[State 235, Teleport Snd]
type=playsnd
trigger1= !time
value=6,0
[State 235, Voice Snd]
type=playsnd
trigger1= !time
value= 5,25
[State 235, Voice Snd]
type=playsnd
trigger1= !time
value= 5,25
[State 235, Swing Snd]
type=playsnd
trigger1= !time
value=1,5

[State 235, Pause]
type = Pause
trigger1 = movehit
time = 2
movetime = 1
anim = -1
[State 235, EnvShake]
type = EnvShake
trigger1 = movehit
time = 10
freq = 50
ampl = -2
phase = 60

[State 235, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 15

[State 235, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*40<7, 7, fvar(11)*40)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 14, 14), ifelse(var(20), 6, 6)
guard.pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 6, 6)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,3200
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=63), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 235, end]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 240]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Anim]
type=changeanim
trigger1=!time
value=240

[State 240, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13240

[State 240,Posset]
type=posset
trigger1=!time
y=0

[State 240, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,64
[State 240, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,64
[State 240, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,64
[State 240, Snd]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=85), var(36):=-88
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 240, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 240, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "a" && random>=300
value = 235
ctrl = 1

[State 240, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "b" && random>=300
value = 235
ctrl = 1

[State 240, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "c" && random>=300
value = 235
ctrl = 1

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Anim]
type=changeanim
trigger1=!time
value=250

[State 250, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13250

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 250, Voice Snd]
type=playsnd
trigger1= animelem=3 
value= 5,65
[State 250, Voice Snd]
type=playsnd
trigger1= animelem=3 
value= 5,65
[State 250, Voice Snd]
type=playsnd
trigger1= animelem=3 
value= 5,65
[State 250, Swing Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*60<7, 7, fvar(11)*60)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -10.52)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -8.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 250, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 250, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "a" && random>=300
value = 235
ctrl = 1

[State 250, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "b" && random>=300
value = 235
ctrl = 1

[State 250, Strong Blow Knee]
type = ChangeState
trigger1 = movecontact && command = "c" && random>=300
value = 235
ctrl = 1

[State 250, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Anim]
type=changeanim
trigger1=!time
value=400

[State 400, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13400

[State 400,Posset]
type=posset
trigger1=!time
y=0

[State 200, Voice Snd]
type=playsnd
trigger1= !time
value= 5,1
[State 200, Voice Snd]
type=playsnd
trigger1= !time
value= 5,1

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*21<7, 7, fvar(11)*21)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=62), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 400, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Anim]
type=changeanim
trigger1=!time
value=410

[State 410, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13410

[State 410,Posset]
type=posset
trigger1=!time
y=0

[State 210, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,50
[State 210, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,50
[State 210, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,50

[State 410, Snd]
type=playsnd
trigger1= !time
value=1,1
channel=1

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=67), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 410, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Anim]
type=changeanim
trigger1=!time
value=420

[State 420, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13420

[State 420,Posset]
type=posset
trigger1=!time
y=0

[State 220, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,0
[State 220, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,0

[State 420, Snd]
type=playsnd
trigger1= !time
value=1,2
channel=1

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*60<7, 7, fvar(11)*60)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=73), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 420, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Anim]
type=changeanim
trigger1=!time
value=430

[State 430, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13430

[State 430,Posset]
type=posset
trigger1=!time
y=0

[State 230, Voice Snd]
type=playsnd
trigger1= animelem = 2
value= 5,51
[State 230, Voice Snd]
type=playsnd
trigger1= animelem = 2
value= 5,51
[State 230, Voice Snd]
type=playsnd
trigger1= animelem = 2
value= 5,51
[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1=  !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-35
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 430, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Anim]
type=changeanim
trigger1=!time
value=440

[State 440, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13440

[State 440,Posset]
type=posset
trigger1=!time
y=0

[State 240, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,64
[State 240, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,64
[State 240, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,64

[State 440, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=76), var(36):=-32
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 440, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 450, Anim]
type=changeanim
trigger1=!time
value=450

[State 450, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13450

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 250, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,65
[State 250, Voice Snd]
type=playsnd
trigger1= animelem=2 
value= 5,65
[State 250, Voice Snd]
type=playsnd
trigger1= animelem=2 
value= 5,65

[State 450, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 450, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 450
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*60<7, 7, fvar(11)*60)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -8.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -9.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=83), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(4) >= 0
moveType = I

[State 450, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 455]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


; Tripped get-hit (knocked away)
[Statedef 456]
type    = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = SelfState
value = 5110


;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Anim]
type=changeanim
trigger1=!time
value=600

[State 600, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13600

[State 200, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,1
[State 200, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,1

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=47), var(36):=-73
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 600, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 600
elem = 4
ignoreHitPause = 1

[State 620, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics  = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Anim]
type=changeanim
trigger1=!time
value=610

[State 610, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13610

[State 210, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,50
[State 210, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,50
[State 210, Voice Snd]
type=playsnd
trigger1= animelem=3
value= 5,50

[State 610, Snd]
type=playsnd
trigger1= animelem=3
value=1,1
channel=1

[State 610, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=50), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 610, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 610
elem = 5
ignoreHitPause = 1

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Anim]
type=changeanim
trigger1=!time
value=620

[State 620, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13620

[State 220, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,0
[State 220, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,0

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= animelem=4
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*60<7, 7, fvar(11)*60)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-30
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Anim]
type=changeanim
trigger1=!time
value=630

[State 630, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13630

[State 230, Voice Snd]
type=playsnd
trigger1= animelem = 2
value= 5,51
[State 230, Voice Snd]
type=playsnd
trigger1= animelem = 2
value= 5,51
[State 230, Voice Snd]
type=playsnd
trigger1= animelem = 2
value= 5,51

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=74), var(36):=-38
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 630
elem = 4
ignoreHitPause = 1

[State 630, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Anim]
type=changeanim
trigger1=!time
value=640

[State 640, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13640

[State 240, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,64
[State 240, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,64
[State 240, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,64

[State 640, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 640, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=54), var(36):=-39
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 640
elem = 4
ignoreHitPause = 1

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 650, Anim]
type=changeanim
trigger1=!time
value=650

[State 650, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13650

[State 250, Voice Snd]
type=playsnd
trigger1= animelem=2
value= 5,65
[State 250, Voice Snd]
type=playsnd
trigger1= animelem=2 
value= 5,65
[State 250, Voice Snd]
type=playsnd
trigger1= animelem=2 
value= 5,65

[State 650, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*60<7, 7, fvar(11)*60)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type=changestate
trigger1= pos y>-vel y
value=52

;===========<Throw Attempt>==========
;Throw Attempt
[Statedef 800]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 800, Anim]
type=changeanim
trigger1=!time
value=800
[State 800, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13800

[State 800,Posset]
type=posset
trigger1=!time
y=0

[State 800, Button]
type=varset
trigger1= !time && !AILevel
var(10)= (command="kk")

[State 800, Button AI]
type=varset
trigger1= !time && AILevel
var(10)= (random<500)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Guard Dist]
type=attackdist
trigger1= 1
value=0

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38)
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",805,810)

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38) && numtarget(3200)
attr=S,NT
hitflag=M
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",810,805)

[State 800, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;---PLAYER TURNS---
[Statedef 805]
type=S
movetype=A
physics=S
ctrl=0
sprpriority=0

[State 805, Anim]
type=changeanim
trigger1=!time
value=805

[State 805,Posset]
type=posset
trigger1=!time
y=0

[State 805, Throw]
type=targetstate
trigger1= !time && numtarget
value=806

[State 805, Throw]
type=targetfacing
trigger1= !time && numtarget
value=-1

[State 805, Width]
type=width
trigger1= 1
edge=24,24
ignoreHitPause = 1

[State 805, Turn]
type=turn
trigger1 = AnimElem = 4

[State 805, facing]
type=targetfacing
trigger1= 1
value=-1

[State 805, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 805, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 42,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 11,0

[State 805, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 0,0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(5) >= 0
value = 1

[State 805, SprPriority 2]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
value = -1

[State 805, End]
type=changestate
trigger1= !numtarget
value=0
ctrl=1

[State 805, End]
type=changestate
trigger1= animelemtime(5)>=0
value=ifelse(var(10),821,810)



;---TARGET---
[Statedef 806]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 806, NHB]
type=nothitby
trigger1= 1
value=SCA
time=1

[State 806, Anim]
type=changeanim2
trigger1= !time
value=806

[State 806, Camera]
type=screenbound
trigger1= 1
value=0
movecamera=1,1
ignoreHitPause = 1

[State 806, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1

;---PLAYER TURNS---
[Statedef 807]
type=S
movetype=A
physics=S
ctrl=0
sprpriority=0

[State 805, Anim]
type=changeanim
trigger1=!time
value=805

[State 805,Posset]
type=posset
trigger1=!time
y=0

[State 805, Throw]
type=targetstate
trigger1= !time && numtarget
value=806

[State 805, Throw]
type=targetfacing
trigger1= !time && numtarget
value=-1

[State 805, Width]
type=width
trigger1= 1
edge=24,24
ignoreHitPause = 1

[State 805, Turn]
type=turn
trigger1 = AnimElem = 4

[State 805, facing]
type=targetfacing
trigger1= 1
value=-1

[State 805, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 805, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 42,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 11,0

[State 805, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 0,0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(5) >= 0
value = 1

[State 805, SprPriority 2]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
value = -1

[State 805, End]
type=changestate
trigger1= !numtarget
value=0
ctrl=1

[State 805, End]
type=changestate
trigger1= animelemtime(5)>=0
value=821

;--------------------------------------------------------------
;Throw Launch Kick
[Statedef 810]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 810, Anim]
type=changeanim
trigger1=!time
value=810
[State 810, SSJ2Mode]
triggerall = var(1) = 1
type=changeanim
trigger1=!time
value=13810

[State 810, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 815

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,12
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,12
[State 0, TeleportSnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,0

[State 215, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NT
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 8, 8), ifElse(var(20), 8, 8)
guard.pauseTime = ifElse(var(20), 4, 6), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -12
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -14
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
kill = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 205), var(36) := -90
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 810, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 811
ctrl = 1
;--------------------------------------------------------------
;Throw (Teleport Kick)
[Statedef 811]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 800, Anim]
type=changeanim
trigger1=!time
value=811
[State 800, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13811

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,4

[State 0, Turn]
type = Turn
trigger1 = !time

[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -75
y = P2Dist Y -0

[State 215, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NT
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 8, 8), ifElse(var(20), 8, 8)
guard.pauseTime = ifElse(var(20), 4, 6), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, 14
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, 6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 205), var(36) := -20
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 810, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 50
ctrl = 1

;===========<THROW PP (TARGET)>==========
;PP Being Thrown
[StateDef 815]
type = S
movetype = H
physics = N
velSet = 0,0
sprPriority = 0

[State 815, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 815, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 815

[State 815, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 805, SelfState]
type = SelfState
trigger1 = Time = 20
value = 0
ctrl = 1 
;----------------------------
;--------------------------------------------------------------
;Throw Attempt
[Statedef 820]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 800, Anim]
type=changeanim
trigger1=!time
value=800
[State 800, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13800

[State 800,Posset]
type=posset
trigger1=!time
y=0

[State 800, Button]
type=varset
trigger1= !time && !AILevel
var(10)= (command="pp")

[State 800, Button AI]
type=varset
trigger1= !time && AILevel
var(10)= (random<500)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Guard Dist]
type=attackdist
trigger1= 1
value=0

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38)
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",807,821)

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38) && numtarget(3200)
attr=S,NT
hitflag=M
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",807,821)

[State 800, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;--------------------------------------------------------
;Throw
[Statedef 821]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 820, Anim]
type=changeanim
trigger1=!time
value=821
[State 820, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=13821

[State 820, hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -120
[State 820, hurt]
type = targetpoweradd
trigger1 = animelem = 4
value = 36
[State 820, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 72

[State 820, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,39

[State 820, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 822

[State 820, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1

;------------------------------------
;Target State
[StateDef 822]
type = S
movetype = H
physics = N
velSet = 0,0
sprPriority = 0

[State 815, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 822

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 8
y = -3

[State 810, hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -ceil(142 * fvar(12))
[State 810, hurt]
type = targetpoweradd
trigger1 = animelem = 4
value = 36
[State 810, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 72

[State 0, Gravity]
type = Gravity
trigger1 = time > 15

[State 815, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 805, SelfState]
type = SelfState
trigger1 = Time = 20
value = 5050
ctrl = 0 

;===========< Target Escaped >==========
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 890, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 0, 0
[State 890, p2state]
type = targetstate
trigger1 = !time && numtarget
value = 895
[State 890, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 890, Pos]
type = posadd
trigger1 = !time
x = 24

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 890, Push]
type = playerpush
trigger1 = 1
value = 0

[State 890, Pos]
type = posset
trigger1 = !time
y = 0
[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 890, Snd]
type = playsnd
trigger1 = time = 2
value = ifelse(var(1) = 2, 5010, 5000), ifelse(var(1) = 2, 1, 4)
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 7, 3

;[State 890, FX]
;type = explod
;trigger1 = !time
;anim = 7000
;ID = 7000
;sprpriority = 5
;postype = p1
;pos = 0, -55
;ownpal = 1
;pausemovetime = -1
;supermovetime = -1

[State 890, hitspark]
type = helper
trigger1 = !time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
posType = P1
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;CLASH
[Statedef 12000]
type    = S
physics = N

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1


[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = root,movetype = I 
movetype = I        
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = root,movetype = A
movetype = A       
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = root, anim
elem = root, animelemNo(0)
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1 

[State 0, ReversalDef]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,0
sparkno = -1
hitsound = S1,0
p1stateno = 12001
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = root,stateNo != [200,650]
trigger1 = root,stateNo != [2200,2690]
trigger1 = root,stateNo != [19200,19690]
trigger1 = root,stateNo != [11200,11700]
ignorehitpause = 1
;persistent = 
;-------------------------------------------------------------------------------
; CLASH
[Statedef 12001]
type    = S
physics = N

;====================
;scenario destruction
[State 0, Explod]
type = Explod
triggerall = pos y >= 0
trigger1 = time = 0
anim = 7060
ID = 7060
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 150
pausemovetime = 0
scale = 1,1
sprpriority = -4
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
ignorehitpause = 999
supermovetime = 999
pausemovetime = 999



[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = 1
movetype = I        
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = root, anim
elem = root, animelemNo(0)
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1 

[State 0, Pause]
type = Pause
trigger1 = !time
time = 10
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 20
ignorehitpause = 1

;-------------------------------------------------------------------------------
; CLash anim - start

[Statedef 12200]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
anim = 12200
sprpriority = 2

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = var(1) = 1
trigger1 = !time
value = 12201

[State 0, Helper]
type = Helper
triggerall = pos y >= 0
trigger1 = time = 0
helpertype = normal ;player
name = "rocks"
ID = 12260
stateno = 12260
pos = 0,-5
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
[State 0, Helper]
type = Helper
triggerall = pos y >= 0
trigger1 = time = 0
helpertype = normal ;player
name = "rocks"
ID = 12260
stateno = 12260
pos = -15,-10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
[State 0, Helper]
type = Helper
triggerall = pos y >= 0
trigger1 = time = 0
helpertype = normal ;player
name = "rocks"
ID = 12260
stateno = 12260
pos = 15,-7
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0

[State 0, VelAdd]
type = VelAdd
trigger1 = command = "a"
trigger2 = command = "b"
trigger3 = command = "c"
x = 3
ignorehitpause = 1 
[State 0, VelAdd]
type = VelAdd
trigger1 = p2bodydist x < 5
x = -3
ignorehitpause = 1 

[State 200, DANO]
type = Explod
trigger1 = command = "a"
trigger2 = command = "b"
trigger3 = command = "c"
trigger1 = 1
anim = 7000
ID = 7001
postype = P2
pos = 35+random%10,-50-random%40
facing = -1
sprpriority = 2
supermove = 1
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.3
removeongethit = 1
ontop = 1
supermovetime 	= 999
ignorehitpause  = 1


[State 0, EnvShake]
type = EnvShake
triggerall = time >= 0
trigger1 = time%5 = 0
time = 5
ampl = -4

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,81
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,81
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,81
[State 0, PlaySnd]
type = PlaySnd
trigger1 = timemod = 5,0
value = S1,0
volume = 40
[State 0, PlaySnd]
type = PlaySnd
trigger1 = timemod = 15,0
value = S1,2
volume = 40

[State 0, PlaySnd]
type = PlaySnd
trigger1 = timemod = 10,0
value = S2,1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 7022
ID = 1051
pos = -20,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = 100
scale = 1, 1
sprpriority = 1
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
pos = 50,p2bodydist y 

[State 0, PosAdd]
type = PosAdd
triggerall = p2bodydist x < 50
trigger1 = 1
x = p2bodydist x -50
y = p2bodydist y

[State 200, Spark CVS]
type = Explod
trigger1 = !time
anim = 7010
ID = 7000
postype = P1
pos = 40+random%10,-45-random%40
facing = -1
sprpriority = 2
supermove = 1
removetime = 100
bindtime = -1
ownpal = 1
scale = 0.6,0.6
removeongethit = 1
ontop = 1
supermovetime 	= 999
ignorehitpause  = 1

[State 0, ChangeState]
type = ChangeState
triggerall = time > 10
trigger1 = enemy,stateno != 12200
value = 12201
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 100
value = 12201
ctrl = 0
;-------------------------------------------------------------------------------
; CLash anim - End
[Statedef 12201]
type    = A
movetype= A
physics = A
juggle  = 2
ctrl = 0
velset = 0,0
anim = 50
sprpriority = 2

[State 3000, Super Charge]
type = Explod
trigger1 = !Time
anim = 206
ID = 1050
pos = 65,-65
sprpriority = 2
supermove = 1
removetime = -2
bindtime = 0
ownpal = 1
scale = 1.3,1.3
removeongethit = 1
ontop = 1
supermovetime 	= 999
ignorehitpause  = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,11
volume = 255
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S7,2
volume = 255

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = -2
y = -5

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 2
value = 50
ctrl = 1

;======================================================================================================
;-------------------------------------------------------------------------------
; CLASH
[Statedef 12250]
type    = S
physics = N

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = root,movetype = I 
movetype = I        
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = root,movetype = A
movetype = A       
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = root, anim
elem = root, animelemNo(0)
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1 

[State 0, ReversalDef]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,0
sparkno = -1
hitsound = S1,0
p1stateno = 12251
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = root,stateNo != [200,799]
ignorehitpause = 1
;-------------------------------------------------------------------------------
; CLASH
[Statedef 12251]
type    = S
physics = N

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = 1
movetype = I        
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = root, anim
elem = root, animelemNo(0)
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1 

[State 0, Pause]
type = Pause
trigger1 = !time
time = 10
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 20
ignorehitpause = 1

;-------------------------------------------------------------------------------
; Rocks
[Statedef 12260]
type    = A
movetype= I
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 7050+random%3
sprpriority = 5

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
;value = 1
scale = 1.3,1.3

[State 0, VelSet]
type = VelSet
triggerall = root,stateno = 12200
trigger1 = 1
x = 0
y = -0.7

[State 0, Veladd]
type = Veladd
triggerall = root,stateno != 12200
trigger1 = 1
x = 0
y = 0.4

[State 0, VelSet]
type = VelSet
triggerall = pos y >= -1
trigger1 = 1
x = 0
y = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 150