                             	
				 Eri Hasumi By Sennou-Room 
___________________________________________________________  01/05/2020
Contact:	sennouroom@gmail.com
Website:	-
Customized version of Suge9's Eri character, for MUGEN 1.0


=====<Movelist>=====

 U - up          x  - light attack        a  - system move 1
 D - down        y  - medium attack       b  - system move 2
 F - forward     z  - heavy attack        c  - system move 3
 B - back        AT - any attack          SY - any system
 s - start       2AT- two attacks         2SY- two systems
 
 (A)   - Move can be performed in the air also.
 (Air) - Move must be performed in the air.
 (EX)  - Move has an EX version, performed by pressing two attack buttons.
 (MAX) - Use two attack buttons when performing a Super move to power it up.

-IF YOU DON'T WANT CHAIN COMBOS GO TO THE CONFIG AND CHANGE THE VALUE UNDER VAR 55
TO 0 AND SAVE.Turning off the chain combos will give the character more of a 
cvs-ish type damage for normal attacks. 

<NORMAL>

.Knee kick					F + x
.Both feet kick					F + y
.Sliding					DF + y
.Rolling Sobat					F + x			(Air)
.Downhill					z			(Air) (After hit/guard jump medium attack)
.Throw		      		   		F/B + 2AT		(near opponent)

<SPECIAL>

.Bead Smash
  Stage 1 - Forward attack			D,DF,F+AT
    Stage 2 - Upswing punch				    x
	Stage 3	- Roundhouse kick				x
	Stage 3	- Air Spike 					y
	Stage 3	- Hop punch 					z
	Stage 3 - Sliding					D + z
    Stage 2 - Backswing punch				    y
	Stage 3	- High kick					x
	Stage 3	- Air Spike 					y
	Stage 3	- Hop punch 					z
	Stage 3 - Sliding					D + z
    Stage 2 - Downhill					    z
    Stage 2 - Sliding					    D + z
.EX Bead Smash			        	D,DF,F+2AT  POWER>=500
   -Run						F,F
.Air Spike (EX)					D,D+AT
.Feather Roll (EX)				D,DB,B+AT
.Reverse Sobat (EX) 				F,DF,D,DB,B+AT

<SUPERS>

.Stinger Raid Level 1 / 2 (MAX)			D,DF,F,D,DF,F+AT  POWER>=1000
.Air Spike (MAX) 				D,DF,F,D,DB,B+AT  POWER>=1000
.Stinger Rush Level 1 / 2 (MAX)			D,DB,B,D,DB,B+AT  POWER>=1000
.Stinger Raid Level 3				D,DF,F,D,DF,F+3AT  POWER>=3000
.Stinger Rush Level 3				D,DB,B,D,DB,B+3AT  POWER>=3000


<SYSTEM>

.Run:          		        	F, F
.Backward Dash:                 	B, B
.Low Jump:                      	tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a
.Sidestep Attack:            	        AT
.Forward Roll:                  	F + a
.Backward Roll:                 	B + a
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b
.Zero Counter:                  	B, DB, D, AT 		(during standing or crouching guard)
.Custom Combo:                  	c          		(Default Config) = 0 (Air also)
.MAX Mode:                  		c          		(Custom Config) = 1
.Fall Recovery:                 	2AT / 2SY  	    	(while falling and allowed)

=====<Gameplay Notes>=====

COMBO SYSTEM:
 - Normal Attacks are able to chain into other normal attacks.
 - Normal attacks can be canceled into Command, Special and Super moves
 - Some Special moves can be canceled into Super moves
 - Some Lv1 Super moves can be canceled into MAX Super moves
 - Cancelling a Special, Super move or Custom Combo into a Super move resets the juggle points
   but also reduces its damage


CUSTOM COMBO:
 - Removes cancellable attack restrictions and gives you a lot of freedom to combo them
 - Juggle limit is lifted
 - You can only use EX Special or Super moves from the point the character starts flashing faster
   and brighter, and doing so ends Custom Combo
 - Gives you a short invulnerability window at the start


MAX MODE:
 - Your attack and defense is increased while in MAX Mode
 - EX moves can be performed at no power cost, though take away from time sustained in MAX mode
 - All Lv1 supers can be performed at no power cost, though immediately uses up all time in MAX mode
 - All Lv2 supers will cost 0.5 power bar, along with using up all time in MAX mode
 - All Lv3 supers will cost 1 power bar, along with using up all time in MAX mode
 - Even without a power bar, as long as you have time left in MAX mode, you can perform Lv1 supers/EX moves
 - You can not Power Charge/gain power while in MAX mode
 - You can not perform a Zero Counter while in MAX Mode


THANKS TO -

Suge9 - For creating the original character.

Elecbyte-For Making the MUGEN engine.

Virtualtek-For creating Fighter Factory.

P.O.T.S-For all your tutorials and open source coding. One of the best coders in mugen!

Infinite- For all your tutorials and open source coding as with P.O.T.S's.

R@CE AKIR@- I got the advice in the MFG and other various locations!

DivineWolf- For MAX MODE and some codings.

Memo - Your P.O.T.S/Jmorphman Style Template was a perfect base for character template that I used to make this character.

ZSM - I'm allowed to a description of the data and coordinates that you provided in the reference.


THANKS FOR NEW CHARACTER PALETTES
 - ArtistofLegacy
 - Maki Nishikino
 - Raneri
 - Ghost Killer

=====<Disclaimer>=====

 - Eri Hasumi is property of Suge9.
 - Vanguard Princess is property of Suge9.
 - This MUGEN character is a non-profit fan work, it cannot be used for any commercial purposes