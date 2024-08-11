; __________________
;| Vegeta by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;==============================<NORMAL / SUPER SAIYAN TRANSFORMATION>==========================
;==============================================================================================

;========================< NORMAL / SUPER SAIYAN START SELECTION >=============================
[Statedef 5902]
type = S

[State 0, SSJ Mid-Battle-Transformation]
type = VarSet
trigger1 = 1
var(57) = ifelse(palno = 13 || palno = 22, 0, 1)

[State 0, Normal Vegeta]
type = VarSet
trigger1 = palno = [1,13]
var(1) = 0

[State 0, Super Vegeta]
type = VarSet
trigger1 = palno = [14,22]
var(1) = 1

[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = 190