//***************************************************************************
//	Alte Mine - Tor auf der untersten Ebene
//***************************************************************************
var int _STR_MESSAGE_WHEEL_STUCKS_AGAIN;


FUNC int MC_OLDMINE_ASGHAN ()
{	
	PrintDebugNpc	(PD_ITEM_MOBSI,	"MC_OLDMINE_ASGHAN");

	if (Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW) && _STR_MESSAGE_WHEEL_STUCKS_AGAIN==0)
	{
		_STR_MESSAGE_WHEEL_STUCKS_AGAIN=1;
		return TRUE;
	}
	else
	{
		G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
		AI_PlayAni	( HERO, "T_BORINGKICK");
		return FALSE;
	};
};

//***************************************************************************
//	Alte Mine - Eingangstor
//***************************************************************************
func int MC_OLDMINE_ENTRANCE ()
{
	PrintDebugNpc	(PD_ITEM_MOBSI,	"MC_OLDMINE_ENTRANCE");
	PrintGlobals	(PD_ITEM_MOBSI);

	if	(Kapitel >= 4)
	&&	Hlp_IsValidNpc(self)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...blockiert");
		G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
		AI_PlayAni	( HERO, "T_BORINGKICK");
		return 			FALSE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...bedienbar");
		return 			TRUE;
	};
};

//***************************************************************************
//	Klosterruine
//***************************************************************************
FUNC int MC_MONASTERYRUIN_GATE ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_MONASTERYRUIN_GATE");

	if (MonasteryRuin_GateOpen == FALSE)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...noch nie ge�ffnet");
		AI_UseMob		(hero,"VWHEEL",1);
		AI_UseMob		(hero,"VWHEEL",-1);

		MonasteryRuin_GateOpen = TRUE;	
		
		return 			TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...schonmal ge�ffnet");
		return 			TRUE;
	};
};

//***************************************************************************
//	Ork-Friedhof
//***************************************************************************
FUNC int MC_OGY_GATE ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OGY_GATE");

	if (CorAngar_GotoOGY) 
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...closed");

		return 			TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");

		G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
		AI_PlayAni	( HERO, "T_BORINGKICK");
		return 			FALSE;
	};
};

//***************************************************************************
//	Ork-Friedhof
//***************************************************************************

FUNC int MC_FM_GATE ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_FM_GATE");

	if ((Kapitel == 4) && (FM_GateOpen == FALSE)) 
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...closed");
		AI_UseMob		(hero,"VWHEEL",1);
		AI_UseMob		(hero,"VWHEEL",-1);

		FM_GateOpen = TRUE;	
	
		// falls die Gardisten sofort attackiert wurden, Gorn hier auch nochmal zum Tor runterschicken
		B_ExchangeRoutine	(PC_Fighter,	"WaitFM");
		
		return 			TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");

		if	!FM_GateOpen
		{
			G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
			AI_PlayAni	( HERO, "T_BORINGKICK");
		};

		return 			FALSE;
	};
};


//***************************************************************************
//	Trollschlucht
//***************************************************************************
FUNC int EVT_TROLLSCHLUCHT_GATE_TRIGGER ()
{	
	PrintDebugNpc	(PD_ITEM_MOBSI,	"EVT_TROLLSCHLUCHT_GATE_TRIGGER");

	if (Saturas_BringFoci > 0)
	{
		if		(Troll_Wheel == 0)
		{
			G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
			AI_PlayAni	( HERO, "T_BORINGKICK");
			Troll_Wheel = 1;	// SC hat die Winde zum ersten Mal angepackt!
			return FALSE;
		}
		else if	(Troll_Wheel == 1)
		{
			G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
			AI_PlayAni	( HERO, "T_BORINGKICK");
			return FALSE;
		}
		else if	(Troll_Wheel == 2)
		{
			AI_UseMob		(hero,"VWHEEL",1);
			AI_UseMob		(hero,"VWHEEL",-1);

			Troll_Wheel = 3;

	 	    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_13");
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_13");
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_13");
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_13");
		    
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
		    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
	
			return TRUE;
		}
		else	// Troll_Wheel == 3
		{
			return FALSE;
		};
	}
	else
	{
		G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
		AI_PlayAni	( HERO, "T_BORINGKICK");
		
	};	
};

//***************************************************************************
//	Ork-Stadt - gro�es Holztor
//***************************************************************************
var int	OrcCity_GateOpen;
FUNC int MC_OrcCity_Gate ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OrcCity_Gate");

	if ((Kapitel >= 5) && (OrcCity_GateOpen == FALSE)) 
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...closed");
		AI_UseMob		(hero,"VWHEEL",1);
		AI_UseMob		(hero,"VWHEEL",-1);

		OrcCity_GateOpen = TRUE;	
		
		return 			TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");

		if	!OrcCity_GateOpen
		{
			G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
			AI_PlayAni	( HERO, "T_BORINGKICK");
		};

		return 			FALSE;
	};
};

//***************************************************************************
//	Ork-Stadt - �u�eres Tempeltor
//***************************************************************************
FUNC int MC_OrcCity_Sunctum_OuterGate ()	// hei�t absichtlich "Sunctum"
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OrcCity_Sanctum_OuterGate");

	OrcCity_Sanctum_OuterGateTried = TRUE;

	if	(Kapitel >= 5)
	&&	(Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01)) 
	&&	(OrcCity_Sanctum_OuterGateOpen == FALSE)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...closed");

		G_PrintScreen	(_STR_MESSAGE_OCLEVER_MOVES);

		AI_UseMob		(hero,"LEVER",1);
		AI_UseMob		(hero,"LEVER",-1);

		OrcCity_Sanctum_OuterGateOpen = TRUE;	
		
		return 			TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");
		
		if	!OrcCity_Sanctum_OuterGateOpen
		{
			G_PrintScreen	(_STR_MESSAGE_OCLEVER_STUCKS);
			AI_PlayAni	( HERO, "T_BORINGKICK");
		};
		
		return 			FALSE;
	};
};


func void Mod_Abut_GhostSpawn_S1 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLines	( nDocID,  0, "Przywo�ywanie duch�w");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, " "			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Przywo�ywanie duch�w to niezwykle skompilowana sztuka, wi�c nie ka�dy magus potrafi si� sprawnie pos�ugiwa� o�tarzem przywo�ywania. Sztuk� t� do perfekcji opanowali nekromanci od lat trenuj�cy kontrol� nad istotami przyzwanymi. Sprawny nekromanta jest w stanie trzyma� w ryzach przyzwan� istot�, a nawet wymusi� pos�usze�stwo.");
					Doc_PrintLine	( nDocID,  0, "");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Jednak prawdziw� sztuk� nie jest przyzwa� byle jak� form� �ycia lub o�ywi� zgni�e cia�o. Sztuka to przywo�anie duszy zdolnej do rozmowy i wyjawienia magus�w tajemnic, kt�re nieszcz�sna zabra�a do grobu. Wa�ne jest, aby nekromanta mia� ze sob� przedmiot zwi�zany ze zmar�ym. Kluczowa mo�e si� r�wnie� okaza� wiedza na temat okoliczno�ci �mierci. Reszta to ju� czysta czarna magia...");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );		
};	

