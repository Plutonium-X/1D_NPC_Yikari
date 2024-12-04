/* YIKARI BANTER FILE; TRANSLATION "banter.tra" */
/* VERSION 1.5 */

BEGIN ~BSDNPC~

// Player1

IF
~Global("SDNPC_PC","LOCALS",0)
See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
!HasItemEquiped("sdnpcclk","sdnpc")~  PC_0
SAY @1
 + ~Class(Player1,PALADIN)~   +	@2 		+ PC_good 
 + ~Class(Player1,CLERIC)
   Kit(Player1,GODLATHANDER)~ + @3		+ PC_god 
 + ~Class(Player1,CLERIC)
     Kit(Player1,GODHELM)~    +	@4		+ PC_god 	
 + ~Class(Player1,CLERIC)
      Kit(Player1,GODTALOS)~  +	@5		+ PC_god 
 + ~Class(Player1,CLERIC)
     Kit(Player1,TRUECLASS)~  +	@6 		+ PC_god
 + ~Class(Player1,DRUID)~     +	@7		+ PC_nature
 ++ @8						+ PC_good
 ++ @9 						+ PC_gold
 ++ @10 					+ PC_teach
 ++ @11 					+ PC_tiax
END

IF ~~ PC_good
SAY @12
++ @13 + PC_good1
++ @14 + PC_good2
++ @15 + PC_good2
END

IF ~~ PC_good1
SAY @16
 IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",1)~ EXIT
END

IF ~~ PC_good2
SAY @17
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",1)~ EXIT
END

IF ~~ PC_god
SAY @18
++ @19 + PC_god1
++ @20 + PC_god1
END

IF ~~ PC_god1
SAY @21
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",2)~ EXIT
END

IF ~~ PC_nature
SAY @22
++ @23 + PC_nature1
++ @24 EXIT
END

IF ~~ PC_nature1
SAY @25
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",3)~ EXIT
END

IF ~~ PC_gold
SAY @26 
++ @27 DO ~SetGlobal("SDNPC_PC","LOCALS",4)~ EXIT
++ @28 DO ~SetGlobal("SDNPC_PC","LOCALS",4)~ EXIT
END

IF ~~ PC_teach
SAY @29
++ @30 + PC_teach1
++ @31 + PC_teach1
END

IF ~~ PC_teach1
SAY @32
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",5)~ EXIT
END

IF ~~ PC_tiax
SAY @33
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END

// Second banter

IF ~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("SDNPC_PC","LOCALS",1)~ PC_good3
SAY @261
++ @262 + PC_good4
++ @263 + PC_good4
++ @264 + PC_good5
END

IF ~~ PC_good4
SAY @265
++ @266 + PC_good6
++ @267 + PC_good6
++ @268 + PC_good5
END

IF ~~ PC_good5
SAY @269
++ @270 + PC_good6
++ @271 + PC_good7
END

IF ~~ PC_good6
SAY @272 = @273
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END

IF ~~ PC_good7
SAY @274
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END



// PC talk re: gods

IF
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("SDNPC_PC","LOCALS",2)~ PC_god2
SAY @275
++ @276 + PC_god3
++ @277 + PC_god4
END

IF ~~ PC_god3
SAY @278
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END

IF ~~ PC_god4
SAY @279 = @280
++ @281 + PC_god3
++ @282 + PC_god5
++ @283 + PC_god7
END

IF ~~ PC_god5
SAY @284
++ @285 + PC_god3
++ @286 + PC_god6
END

IF ~~ PC_god6
SAY @287
IF ~~ THEN + PC_god8

END

IF ~~ PC_god7
SAY @288
IF ~~ THEN + PC_god8
END

IF ~~ PC_god8
SAY @289
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END



// PC talk re: Nature

IF
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("SDNPC_PC","LOCALS",3)~ PC_nature2
SAY @290
++ @291 + PC_nature3
++ @292 + PC_god3
END

IF ~~ PC_nature3
SAY @293
++ @294 + PC_nature4
++ @295 + PC_god3
END

IF ~~ PC_nature4
SAY @296
++ @297 + PC_nature5
++ @298 + PC_god3
END

IF ~~ PC_nature5
SAY @299
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END



// PC talk re: gold

IF
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("SDNPC_PC","LOCALS",4)~ PC_gold1
SAY @300
++ @301 + PC_gold2
++ @302 + PC_gold2
++ @303 + PC_gold4
END

IF ~~ PC_gold2
SAY @304
++ @305 + PC_gold3
END

IF ~~ PC_gold3
SAY @306
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END

IF ~~ PC_gold4
SAY @307
IF ~~ THEN + PC_gold2
END



// PC talk re: teach

IF 
~See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("SDNPC_PC","LOCALS",5)~ PC_teach2
SAY @308
++ @309 + PC_god3
++ @310 + PC_teach3
++ @311 + PC_teach5
END

IF ~~ PC_teach3
SAY @312
++ @313 + PC_teach4
++ @314 + PC_teach5
END

IF ~~ PC_teach4
SAY @315 = @316
IF ~~ THEN DO ~SetGlobal("SDNPC_PC","LOCALS",6)~ EXIT
END

IF ~~ PC_teach5
SAY @317
IF ~~ THEN EXIT
END

// Yoshimo

IF ~~ Yo_5
SAY @245 
IF ~~ THEN EXIT
END


// Minsc

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Mi","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BMINSC Mi_1 @34		DO ~SetGlobal("SDNPC_Mi","LOCALS",1)~
==BSDNPC @35 			DO ~SetGlobal("SDNPC_Mi","LOCALS",1)~
==BMINSC @36
==BSDNPC @37
==BMINSC @38
==BSDNPC @39
EXIT

CHAIN IF ~InParty("Minsc")
	See("Minsc")
	!StateCheck("Minsc",STATE_SLEEPING)
	Global("SDNPC_Mi","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Mi_2 @40 		DO ~SetGlobal("SDNPC_Mi","LOCALS",2)~
==BMINSC @41 			DO ~SetGlobal("SDNPC_Mi","LOCALS",2)~
==BSDNPC @42 = @43
==BMINSC @44
==BSDNPC @45
==BMINSC @46
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Mi","LOCALS",2)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BMINSC Mi_3 @47		DO ~SetGlobal("SDNPC_Mi","LOCALS",3)~
==BSDNPC @48			DO ~SetGlobal("SDNPC_Mi","LOCALS",3)~
==BMINSC @49 = @50
==BSDNPC @51 = @52
==BMINSC @53
EXIT

// Imoen

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Im","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN IMOEN2J Im_1 @54 		DO ~SetGlobal("SDNPC_Im","LOCALS",1)~
==BSDNPC @55
==IMOEN2J @56
==BSDNPC @57
==IMOEN2J @58
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Im","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN IMOEN2J Im_1 @59 = @60 	DO ~SetGlobal("SDNPC_Im","LOCALS",2)~
==BSDNPC @61
==IMOEN2J @62
==BSDNPC @63
==IMOEN2J @64
==BSDNPC @65 DO ~RunAwayFrom("imoen2",3)~
EXIT

// Aerie

CHAIN IF ~InParty("Aerie")
	See("Aerie")
	!StateCheck("Aerie",STATE_SLEEPING)
	Global("SDNPC_Ae","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ae_1 @86		DO ~SetGlobal("SDNPC_Ae","LOCALS",1)~
==BAERIE @87
==BSDNPC @88 = @89 = @90
==BAERIE @91
==BSDNPC @92
EXIT

CHAIN IF ~InParty("Aerie")
	See("Aerie")
	!StateCheck("Aerie",STATE_SLEEPING)
	Global("SDNPC_Ae","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ae_2 @93		DO ~SetGlobal("SDNPC_Ae","LOCALS",2)~
==BAERIE @94
==BSDNPC @95
==BAERIE @96
==BSDNPC @97
EXIT

// Nalia

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Na","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BNALIA Na_1 @98		DO ~SetGlobal("SDNPC_Na","LOCALS",1)~
==BSDNPC @99			DO ~SetGlobal("SDNPC_Na","LOCALS",1)~
==BNALIA @100
==BSDNPC @101 = @102
==BNALIA @103
==BSDNPC @104
EXIT

CHAIN IF ~InParty("nalia")
	See("nalia")
	!StateCheck("nalia",STATE_SLEEPING)
	Global("SDNPC_Na","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Na_2 @105		DO ~SetGlobal("SDNPC_Na","LOCALS",2)~
==BNALIA @106
==BSDNPC @107 = @108
==BNALIA @109
==BSDNPC @110
EXIT

// Edwin

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Ed","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")
	Gender(Myself,MALE)~
THEN BEDWIN Ed_1 @111		DO ~SetGlobal("SDNPC_Ed","LOCALS",1)~
==BSDNPC @112			DO ~SetGlobal("SDNPC_Ed","LOCALS",1)~
==BEDWIN @113
==BSDNPC @114
==BEDWIN @115
==BSDNPC @116
==BEDWIN @117
EXIT

CHAIN IF ~InParty("edwin")
	See("edwin")
	!StateCheck("edwin",STATE_SLEEPING)
	Global("SDNPC_Ed","LOCALS",1)
	!HasItemEquiped("sdnpcclk",Myself)
	Gender("edwin",MALE)~
THEN BSDNPC Ed_2 @118		DO ~SetGlobal("SDNPC_Ed","LOCALS",2)~
==BEDWIN @119
==BSDNPC @120
==BEDWIN @121 = @122
==BSDNPC @123
==BEDWIN @124
EXIT

//Edwina

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Edw","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")
	Gender(Myself,FEMALE)~
THEN BEDWIN Edw_1 @125		DO ~SetGlobal("SDNPC_Edw","LOCALS",1)~
==BSDNPC @126 = @127
==BEDWIN @128
==BSDNPC @129
==BEDWIN @130
EXIT

// Jan

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Jan","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BJAN Jan_1 @131		DO ~SetGlobal("SDNPC_Jan","LOCALS",1)~
==BSDNPC @132
==BJAN @133
==BSDNPC @134
==BJAN @135
==BSDNPC @136
==BJAN @137
==BSDNPC @138
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Jan","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BJAN Jan_2 @139		DO ~SetGlobal("SDNPC_Jan","LOCALS",2)~
==BSDNPC @140
==BJAN @141
==BSDNPC @142
==BJAN @143
==BSDNPC @144
EXIT

// Haer'Dalis

CHAIN IF ~InParty("Haer'Dalis")
	See("Haer'Dalis")
	!StateCheck("Haer'Dalis",STATE_SLEEPING)
	Global("SDNPC_Ha","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ha_1 @145		DO ~SetGlobal("SDNPC_Ha","LOCALS",1)~
==BHAERDA @146
==BSDNPC @147 = @148
==BHAERDA @149 =@150
==BSDNPC @151
==BHAERDA @152
EXIT

CHAIN IF ~InParty("Haer'Dalis")
	See("Haer'Dalis")
	!StateCheck("Haer'Dalis",STATE_SLEEPING)
	Global("SDNPC_Ha","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ha_2 @153		DO ~SetGlobal("SDNPC_Ha","LOCALS",2)~
==BHAERDA @154
==BSDNPC @155
==BHAERDA @156 = @157
==BSDNPC @158
==BHAERDA @159
EXIT

// Keldorn

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Ke","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BKELDOR Ke_1 @160		DO ~SetGlobal("SDNPC_Ke","LOCALS",1)~
==BSDNPC @161 = @162
==BKELDOR @163
==BSDNPC @164
==BKELDOR @165
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Ke","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BKELDOR Ke_2 @166		DO ~SetGlobal("SDNPC_Ke","LOCALS",2)~
==BSDNPC @167
==BKELDOR @168
==BSDNPC @169
==BKELDOR @170
==BSDNPC @171
==BKELDOR @172
==BSDNPC @173
EXIT

// Cernd

CHAIN IF ~InParty("Cernd")
	See("Cernd")
	!StateCheck("Cernd",STATE_SLEEPING)
	Global("SDNPC_Ce","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ce_1 @174		DO ~SetGlobal("SDNPC_Ce","LOCALS",1)~
==BCERND @175
==BSDNPC @176
==BCERND @177
==BSDNPC @178
EXIT

CHAIN IF ~InParty("Cernd")
	See("Cernd")
	!StateCheck("Cernd",STATE_SLEEPING)
	Global("SDNPC_Ce","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ce_2 @179		DO ~SetGlobal("SDNPC_Ce","LOCALS",2)~
==BCERND @180
==BSDNPC @181
==BCERND @182
==BSDNPC @183
==BCERND @184
==BSDNPC @185
EXIT

// Viconia

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Vi","LOCALS",0)
	!Global("ViconiaMatch","GLOBAL",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BVICONI Vi_1 @186		DO ~SetGlobal("SDNPC_Vi","LOCALS",1)~
==BSDNPC @187
==BVICONI @188
==BSDNPC @189
==BVICONI @190
==BSDNPC @191
==BVICONI @192
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Vi","LOCALS",1)
	!Global("ViconiaMatch","GLOBAL",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BVICONI Vi_2 @193		DO ~SetGlobal("SDNPC_Vi","LOCALS",2)~
==BSDNPC @194
==BVICONI @195
==BSDNPC @196 = @197
==BVICONI @198
EXIT

// Korgan

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Ko","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BKORGAN Ko_1 @199		DO ~SetGlobal("SDNPC_Ko","LOCALS",1)~
==BSDNPC @200
==BKORGAN @201
==BSDNPC @202
==BKORGAN @203
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Ko","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BKORGAN  Ko_2 @204		DO ~SetGlobal("SDNPC_Ko","LOCALS",2)~
==BSDNPC @205
==BKORGAN @206
==BSDNPC @207
==BKORGAN @208
EXIT

/*
// Anomen

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_An","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BANOMEN An_1 @209		DO ~SetGlobal("SDNPC_An","LOCALS",1)~
==BSDNPC @210			DO ~SetGlobal("SDNPC_An","LOCALS",1)~
==BANOMEN @211
==BSDNPC @212
==BANOMEN @213
==BSDNPC @214
==BANOMEN @215
EXIT

CHAIN IF ~InParty("Anomen")
	See("Anomen")
	!StateCheck("Anomen",STATE_SLEEPING)
	Global("SDNPC_An","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC An_2 @216		DO ~SetGlobal("SDNPC_An","LOCALS",2)~
==BANOMEN @217
==BSDNPC @218
==BSDNPC @219
EXIT
*/

// Mazzy

CHAIN IF ~InParty("Mazzy")
	See("Mazzy")
	!StateCheck("Mazzy",STATE_SLEEPING)
	Global("SDNPC_Ma","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Ma_1 @220		DO ~SetGlobal("SDNPC_Ma","LOCALS",1)~
==BMAZZY @221
==BSDNPC @222
==BMAZZY @223
==BSDNPC @224
==BMAZZY @225
==BSDNPC @226
==BMAZZY @227
==BSDNPC @228
==BMAZZY @229
==BSDNPC @230
==BMAZZY @231 = @232
==BSDNPC @233
==BMAZZY @234
EXIT

// Valygar

CHAIN IF ~InParty("Valygar")
	See("Valygar")
	!StateCheck("Valygar",STATE_SLEEPING)
	Global("SDNPC_Va","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Va_1 @254		DO ~SetGlobal("SDNPC_Va","LOCALS",1)~
==BVALYGA @255
==BSDNPC @256
==BVALYGA @257
==BSDNPC @258
==BVALYGA @259
==BSDNPC @260
EXIT

// Yoshimo



CHAIN IF ~InParty("Yoshimo")
	See("Yoshimo")
	!StateCheck("Yoshimo",STATE_SLEEPING)
	Global("SDNPC_Yo","LOCALS",0)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BSDNPC Yo_1 @235 DO ~SetGlobal("SDNPC_Yo","LOCALS",1)~
==BYOSHIM @236 DO ~SetGlobal("SDNPC_Yo","LOCALS",1)~
==BSDNPC @237
==BYOSHIM @238
==BSDNPC @239
==BYOSHIM @240
==BSDNPC @241
==BYOSHIM @242
END
++ @243 EXTERN BSDNPC Yo_5
++ @244 EXTERN BSDNPC Yo_6

CHAIN IF ~~ THEN BSDNPC Yo_6 @246
==BYOSHIM @247
==BSDNPC @245
END

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC_Yo","LOCALS",1)
	!HasItemEquiped("sdnpcclk","sdnpc")~
THEN BYOSHIM Yo_2 @248		DO ~SetGlobal("SDNPC_Yo","LOCALS",2)~
==BSDNPC @249
==BYOSHIM @250
==BSDNPC @251
==BYOSHIM @252
==BSDNPC @253
EXIT



//---------------------------------------BSDNPC25

BEGIN BSDNPC25

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC25_Im","LOCALS",0)
	PartyRested()~
THEN BIMOEN25 Im_2 @66		 DO ~SetGlobal("SDNPC25_Im","LOCALS",1)~
==BSDNPC25 @67
==BIMOEN25 @68 = @69
==BSDNPC25 @70
==BIMOEN25 @71
==BSDNPC25 @72
==BIMOEN25 @73
==BSDNPC25 @74 = @75 = @76
==BIMOEN25 @77
EXIT

CHAIN IF ~InParty("sdnpc")
	See("sdnpc")
	!StateCheck("sdnpc",STATE_SLEEPING)
	Global("SDNPC25_Im","LOCALS",1)~
THEN BIMOEN25 Im_3 @78 		DO ~SetGlobal("SDNPC25_Im","LOCALS",2)~
==BSDNPC25 @79
==BIMOEN25 @80 = @81
==BSDNPC25 @82
==BIMOEN25 @83
==BSDNPC25 @84
==BIMOEN25 @85
EXIT