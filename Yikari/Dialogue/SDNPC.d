/*Yikari by Shed; Initial Dialogue; Translation "dialogue.tra"*/
/*VERSION 1.5*/

/* SDNPCQuest:
0 Before Yikari joins
1 Yikari joined (silent)
2 Picked up CF
3 Joined with party CF
4 Joined with own CF
5 Enemy
6 Left for home */


BEGIN SDNPC

// Initial Dialogue, party does not have CF
IF      ~!InParty(Myself)
	Global("SDNPCQuest","GLOBAL",0)
	!HasItemEquiped("c2sw1h02",[GOODCUTOFF])
	!HasItemEquiped("sw1h51",[GOODCUTOFF])~
0
  SAY @1
 ++ @2 + 1
 ++ @3 + 2
 ++ @4 EXIT
END

IF ~~ 1
  SAY @5
 ++ @6 + 2
 ++ @7 + 3
 ++ @8 EXIT
END

IF ~~ 2 // from: 3.1 1.0 0.1
  SAY @9
 ++ @10 + 3
 ++ @11 + 4
 ++ @12 EXIT
END

IF ~~ 3 // from: 2.0 1.1
  SAY @13
 ++ @14 + 4
 ++ @15 + 2
 ++ @16 EXIT
END

IF ~~ 4 // from: 3.0 2.1
  SAY @17
 ++ @18 + 5
 ++ @19 EXIT
 ++ @20 + 5
END

IF ~~ 5 // from: 4.2 4.0
  SAY @21
 ++ @22 DO ~SetGlobal("SDNPCQuest","GLOBAL",1)
	GiveItemCreate("sdnpcclk",Myself,1,0,0)
	FillSlot(SLOT_ARMOR)
	JoinParty()~ EXIT
 ++ @23 DO ~SetGlobal("SDNPCQuest","GLOBAL",1)
 	GiveItemCreate("sdnpcclk",Myself,1,0,0)
	FillSlot(SLOT_ARMOR)
	JoinParty()~ EXIT
 ++ @24 EXIT
END

// Initial Dialogue, party has CF
IF      ~Global("SDNPCQuest","GLOBAL",0)
	!InParty(Myself)
	OR(2)
	PartyHasItem("c2sw1h02")
	PartyHasItem("sw1h51")~
 6
  SAY @25
 ++ @26 + 7
 ++ @27 + 7
END

// Interjection on picking up CF
IF ~Global("SDNPCQuest","GLOBAL",2) HasItemEquiped("sdnpccl2",Myself)~ 7 // "I am Yikari..."
  SAY @29 = @30 = @31 = @32 
  IF ~~ THEN + 8
END

IF ~~ 8 // "give me sword"
  SAY @33
 ++ @34 + 9
 ++ @35 DO ~AddexperienceParty(12000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 13
 ++ @36 + 12
END

IF ~~ 9 // "let's agree"
  SAY @37
 ++ @38 + 11 // Exile
 ++ @39 + 11 // property
 ++ @40 + 10 // share
 ++ @41 + 11 // gold
 ++ @42 DO ~AddexperienceParty(12000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 13
 ++ @43 + 12
END

IF ~~ 10 // share
  SAY @44
  + ~CheckStatGT(Player1,16,CHR)~
   + @45 DO ~SetGlobal("SDNPCQuest","GLOBAL",3) // Party CF
	JoinParty()
	AddExperienceParty(20000)~ EXIT
  + ~!PartyHasItem("c2sw1h02")
    PartyHasItem("sw1h51")~
   + @46 DO ~
   SetPlayerSound(Myself,@1000,EXISTANCE5)
	SetGlobal("SDNPCQuest","GLOBAL",4)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	GiveItemCreate("sdnpcsw3","sdnpc",1,1,0)
	JoinParty() // Yikari joins the party as an NPC
	AddExperienceParty(20000)~ EXIT // Yikari CF
  + ~PartyHasItem("c2sw1h02")
    !PartyHasItem("sw1h51")~
   + @46 DO ~
   SetPlayerSound(Myself,@1000,EXISTANCE5)
	SetGlobal("SDNPCQuest","GLOBAL",4)
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")
	GiveItemCreate("sdnpcsw4","sdnpc",1,1,0)
	JoinParty() // Yikari joins the party as an NPC
	AddExperienceParty(20000)~ EXIT // Yikari CF
 ++ @47 + 11
 ++ @48 DO ~AddExperienceParty(12000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 13
END

IF ~~ 11 // gold
  SAY @49 = @50
 ++ @51 + 12
 ++ @52 DO ~GiveGoldForce(4000)
	AddExperienceParty(10000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 13
 ++ @53 + 10
 ++ @54 DO ~AddExperienceParty(12000)
	TakePartyItem("sw1h51")
	DestroyItem("sw1h51")
	TakePartyItem("c2sw1h02")
	DestroyItem("c2sw1h02")~ + 13
END

IF ~~ 12 // fight
  SAY @55
 IF ~~ THEN DO ~LeaveParty()
       Enemy()
       SetGlobal("SDNPCQuest","GLOBAL",5)~ EXIT
END

IF ~~ 13 // thanks leave
  SAY @56
IF ~~ THEN DO ~EscapeArea()
	SetGlobal("SDNPCQuest","GLOBAL",5)~ EXIT
END
