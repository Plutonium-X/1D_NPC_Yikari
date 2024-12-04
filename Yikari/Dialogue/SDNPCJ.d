/*Yikari by Shed; Interjection Dialogue; Translation "dialogue.tra"*/
/*VERSION 1.5*/

BEGIN SDNPCJ
IF ~Global("SDNPCQuest","GLOBAL",2) HasItemEquiped("sdnpccl2",Myself)~ THEN pickupcf
  SAY @1 = @2
  IF ~~ DO ~TakeItemReplace("sdnpcsw2","sdnpcsw",Myself) StartDialogue("sdnpc",[PC])~ EXIT
END

IF ~OR (2) Global("SDNPCQuest","GLOBAL",3) Global("SDNPCQuest","GLOBAL",4)~ PCinit0
SAY @500
 + ~Global("SDNPCQuest","GLOBAL",3)
 OR(2) PartyHasItem("sw1h51") PartyHasItem("c2sw1h02")~
   + @501 + PCinit1
 + ~Global("SDNPCQuest","GLOBAL",4) CheckStatGT(Player1,16,CHR)
 OR(2) PartyHasItem("sdnpcsw3") PartyHasItem("sdnpcsw4")~
   + @502 + PCinit2
 + ~Global("SDNPCQuest","GLOBAL",4) CheckStatLT(Player1,17,CHR)~
   + @502 + PCinit3
++ @503 EXIT
END

IF ~~ PCinit1
SAY @504
IF ~PartyHasItem("sw1h51")~ THEN DO 
		~TakePartyItem("sw1h51")
		DestroyItem("sw1h51")
		GiveItemCreate("sdnpcsw3",Myself,1,0,0)
		SetGlobal("SDNPCQuest","GLOBAL",4)~ EXIT
IF ~PartyHasItem("c2sw1h02")~ THEN DO 
		~TakePartyItem("c2sw1h02")
		DestroyItem("c2sw1h02")
		GiveItemCreate("sdnpcsw4",Myself,1,0,0)
		SetGlobal("SDNPCQuest","GLOBAL",4)~ EXIT
END

IF ~~ PCinit2
SAY @505
IF ~PartyHasItem("sdnpcsw3")~ THEN DO
			~TakePartyItem("sdnpcsw3")
			DestroyItem("sdnpcsw3") // A precaution; Yikari need not be holding his own sword.
			GiveItemCreate("sw1h51",Protagonist,1,0,0)
			SetGlobal("SDNPCQuest","GLOBAL",3)~ EXIT
IF ~PartyHasItem("sdnpcsw4")~ THEN DO
			~TakePartyItem("sdnpcsw4")
			DestroyItem("sdnpcsw4") // A precaution; Yikari need not be holding his own sword.
			GiveItemCreate("c2sw1h02",Protagonist,1,0,0)
			SetGlobal("SDNPCQuest","GLOBAL",3)~ EXIT
END

IF ~~ PCinit3
SAY @506
IF ~~ THEN EXIT
END

// Interjections

I_C_T Tolger 75 SDNPCTolger
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @3
END

// Player 1 Interjections

I_C_T Player1 3 SDNPC_PC_ill
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @4
END

I_C_T Player1 5 SDNPC_PC_slayer
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @5
END

// Tree

EXTEND_BOTTOM Player1 33
IF ~IsValidForPartyDialogue("Yikari") Global("SDNPC_PC_tree","GLOBAL",0)~
THEN DO ~SetGlobal("SDNPC_PC_tree","GLOBAL",1)~ + SDNPC_PC_Tree1
END

APPEND Player1
 IF ~~ SDNPC_PC_Tree1
 SAY @6
  IF ~Global("SDNPCQuest","GLOBAL",3)~ THEN REPLY @7 EXTERN SDNPCJ SDNPC_Tree //player sword
  IF ~Global("SDNPCQuest","GLOBAL",4)~ THEN REPLY @8 EXTERN SDNPCJ SDNPC_Tree //sdnpc sword
  ++ @9 EXTERN SDNPCJ SDNPC_Tree1
 END
END

APPEND SDNPCJ
 IF ~~ SDNPC_Tree
 SAY @10
 COPY_TRANS Player1 33
 END
 
 IF ~~ SDNPC_Tree1
 SAY @11
 COPY_TRANS Player1 33
 END
END

// End Tree

I_C_T Player1 5 SDNPC_PC_irenicus
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @12
END

I_C_T Player1 25 SDNPC_PC_hell
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @13
END

INTERJECT OGHMONK1 0 SDNPC_wisdom // Priest of Oghma
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @14
END

INTERJECT BHOISIG 13 SDNPC_doubtfaith // High Watcher Oisig
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @15
END BHOISIG 14

I_C_T ARAN 53 SDNPC_nohonour // Aran
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @16
END

INTERJECT ARAN 14 SDNPC_vamp
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @17
DO ~SetGlobal("AranJob","GLOBAL",3) SetGlobal("RefusedAran","GLOBAL",0)~
END

INTERJECT BODHI 11 SDNPC_notrust // Bodhi
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @18
END BODHI 17

I_C_T HELLJON 7 SDNPC_taunt // Irenicus final battle
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @19
DO ~ApplySpell(Myself,KENSAI_KIA)~
END

INTERJECT PPSAEM2 12 SDNPC_forktongue // Saemon Havaerian
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @20
END PPSAEM2 16

INTERJECT SUELHAN 2 SDNPC_caution // Elhan in Suldanessar
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @21
END SUELHAN 3

I_C_T FIRKRA01 9 SDNPC_suspicious
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @22
END

I_C_T FIRKRA02 25 SDNPC_ohshit
== SDNPCJ IF ~IsValidForPartyDialogue("Yikari") !HasItemEquiped("sdnpcclk",Myself)~ THEN @23
END

// @24 in kuroisan.d (inlined)
// @25, @26 in c2.d (inlined)