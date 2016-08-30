//poprawione i sprawdzone - Nocturn

//*****************************************
//				EXIT UNTEN
//*****************************************

// ************************ EXIT **************************

INSTANCE DIA_GRD_219_Stone_Exit (C_INFO)
{
	npc			= GRD_219_Stone;
	nr			= 999;
	condition	= DIA_GRD_219_Stone_Exit_Condition;
	information	= DIA_GRD_219_Stone_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func VOID DIA_GRD_219_Stone_Exit_Info()
{
	if ( Npc_KnowsInfo ( hero,  DIA_GRD_219_Stone4  ))
	{
		AI_StopProcessInfos	( self );
		
		var C_NPC Stone;	Stone = Hlp_GetNpc ( GRD_219_Stone );

		TA_BeginOverlay (Stone);
			TA_Min (Stone, 00, 00, 00, 05, ZS_Position,"OCC_MERCS_HALLWAY_BACK"	);
			TA_Min (Stone, 00, 05, 00, 10, ZS_Position,"OCC_MERCS_ENTRANCE"		);
			TA_Min (Stone, 00, 10, 00, 15, ZS_Position,"OCC_SHADOWS_CORNER"		);	
			TA_Min (Stone, 00, 15, 00, 20, ZS_Position,"OCC_STABLE_ENTRANCE"	);
			TA_Min (Stone, 00, 20, 72, 00, ZS_Position,"OCC_STABLE_LEFT_FRONT"	);	
		TA_EndOverlay (Stone);
		
		AI_Output (self, other,"Info_EXIT_06_02"); //Do zobaczenia.

		AI_StopProcessInfos	( self );
	}
	else {
		AI_Output (self, other,"Info_EXIT_06_03"); //Do zobaczenia.
					
		AI_StopProcessInfos	( self );
	};	
};
// ************************************************************
//							Hello					
// ************************************************************

instance DIA_Stone_Hello (C_INFO)
{
	npc				= Grd_219_Stone;
	nr 				= 1;
	condition		= DIA_Stone_Hello_Condition;
	information		= DIA_Stone_Hello_Info;
	permanent		= 0;
	description		= "Jeste� kowalem, czy� nie?";
};

FUNC int  DIA_Stone_Hello_Condition()
{	
	if	(Kapitel < 4)
	{	
		return TRUE;
	};
};

func void  DIA_Stone_Hello_Info()
{
	AI_Output (other, self,"DIA_Stone_Hello_15_00"); //Jeste� kowalem, czy� nie?
	AI_Output (self, other,"DIA_Stone_Hello_06_01"); //Racja.
};

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Stone_CanYouForgeWeapon (C_INFO)
{
   npc          = Grd_219_Stone;
   nr           = 1;
   condition    = DIA_Stone_CanYouForgeWeapon_Condition;
   information  = DIA_Stone_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "M�g�by� co� dla mnie wyku�?";
};

FUNC INT DIA_Stone_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stone_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Stone_CanYouForgeWeapon_15_01"); //M�g�by� co� dla mnie wyku�?
    AI_Output (self, other ,"DIA_Stone_CanYouForgeWeapon_03_02"); //M�g�bym, ale nie za darmo. Poza zap�at� potrzebuj� rzecz jasna planu i sk�adnik�w.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Stone mo�e wyku� dla mnie bro�, je�li mu zap�ac� i przynios� plan oraz sk�adniki.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Stone_ForgeWeapon (C_INFO)
{
   npc          = Grd_219_Stone;
   nr           = 1;
   condition    = DIA_Stone_ForgeWeapon_Condition;
   information  = DIA_Stone_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie bro�.";
};

FUNC INT DIA_Stone_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_CanYouForgeWeapon)) && ((kapitel >= 5 && (Npc_KnowsInfo (hero, DIA_GRD_219_Stone3))) || kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stone_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Stone_ForgeWeapon_15_01"); //Wykuj dla mnie bro�.
    AI_Output (self, other ,"DIA_Stone_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};

FUNC VOID DIA_Stone_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Stone_ForgeWeapon_Plan1b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 40)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, ItMw_1H_Sword_04);
B_GiveInvItems (self,other,ItMw_1H_Sword_04,1);
//pay
B_GiveInvItems (other,self,itminugget,40);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ KOWALA
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h6 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Wolf_01) >= 1) 
 &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, ItAt_Wolf_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H6);
B_GiveInvItems (self,other,Miecz1H6,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//PORZ�DNY MIECZ JEDNOR�CZNY
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h11 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
//give sword
CreateInvItem (self, Miecz1H11);
B_GiveInvItems (self,other,Miecz1H11,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//B�YSK NOCY
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h15 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItMi_Wood_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, Miecz1H15);
B_GiveInvItems (self,other,Miecz1H15,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//SZEROKI MIECZ
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h7 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//D�UGI MIECZ
FUNC VOID DIA_Stone_ForgeWeapon_Plan1c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 50)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,ItAt_Lurker_02) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) 
&&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 2) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) 
&&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Lurker_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,2);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
//give sword
CreateInvItem (self, Miecz1H7);
B_GiveInvItems (self,other,Miecz1H7,1);
//pay
B_GiveInvItems (other,self,itminugget,50);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZAB�JCY
FUNC VOID DIA_Stone_ForgeWeapon_DaggerOfMurder ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 1) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
//give sword
CreateInvItem (self, ItMw_DaggerOfMurder);
B_GiveInvItems (self,other,ItMw_DaggerOfMurder,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//RAPIER
FUNC VOID DIA_Stone_ForgeWeapon_Rapier ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 2) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Gold01) >= 1) &&(Npc_HasItems (hero,ItAt_Lurker_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItAt_Lurker_01,1);
//give sword
CreateInvItem (self, ItMw_Rapier);
B_GiveInvItems (self,other,ItMw_Rapier,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//PA�ASZ
FUNC VOID DIA_Stone_ForgeWeapon_BanditTrader ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 2) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 1)   &&(Npc_HasItems (hero,Pr_Wegiel) >= 1) &&(Npc_HasItems (hero,ItAt_Dzik_01) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,2);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,1);
Npc_RemoveInvItems (hero, ItAt_Dzik_01,1);
//give sword
CreateInvItem (self, ItMw_Addon_BanditTrader);
B_GiveInvItems (self,other,ItMw_Addon_BanditTrader,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ ROZPACZY
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1H9 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 75)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 4) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 3) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2)   &&(Npc_HasItems (hero,Gold01) >= 2) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) &&(Npc_HasItems (hero,ItAt_Teeth_01) >= 4) &&(Npc_HasItems (hero,ItAt_Claws_02) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,4);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,3);
Npc_RemoveInvItems (hero, Gold01,2);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,4);
Npc_RemoveInvItems (hero, ItAt_Claws_02,1);
//give sword
CreateInvItem (self, Miecz1H9);
B_GiveInvItems (self,other,Miecz1H9,1);
//pay
B_GiveInvItems (other,self,itminugget,75);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO�SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWUR�CZNY
FUNC VOID DIA_Stone_ForgeWeapon_Plan3b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 150)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 6) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) &&(Npc_HasItems (hero,ItAt_Wolf_02) >= 1)   
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1) &&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,6);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,1);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
Npc_RemoveInvItems (hero, Pr_Wegiel,3);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,150);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//�WI�TY M�CICIEL
FUNC VOID DIA_Stone_ForgeWeapon_Miecz1h8 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 200)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaStali) >= 3) && (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 1) &&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 1)   
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 1) &&(Npc_HasItems (hero,ItMi_Wood_02) >= 1)  &&(Npc_HasItems (hero,Gold01) >= 1)  &&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1) 
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,1);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,1);
Npc_RemoveInvItems (hero, ItMi_Wood_02,1);
Npc_RemoveInvItems (hero, Gold01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_01);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,200);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO�SZE MIECZE
//////////////////////////////////////////
//MIECZ KR�LEWSKI 
FUNC VOID DIA_Stone_ForgeWeapon_Plan3 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 7) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 4) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,7);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,4);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_Light_04);
B_GiveInvItems (self,other,ItMw_2H_Sword_Light_04,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOP�R BOJOWY
FUNC VOID DIA_Stone_ForgeWeapon_Plan5c ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if (Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3)   
&&(Npc_HasItems (hero,Pr_Wegiel) >= 3) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 2)  
&&(Npc_HasItems (hero,ItAt_Teeth_01) >= 10)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, pr_Wegiel,3);
Npc_RemoveInvItems (hero, ItAt_Teeth_01,10);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_light_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_light_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Stone_ForgeWeapon_Plan4b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 6) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 2)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)  
&&(Npc_HasItems (hero,ItAt_Troll_02) >= 1)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,6);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,2);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Troll_02,1);
//give sword
CreateInvItem (self, ItMw_2H_Sword_02);
B_GiveInvItems (self,other,ItMw_2H_Sword_02,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//TOP�R WOJENNY
FUNC VOID DIA_Stone_ForgeWeapon_Plan7b ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 8) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 4)   
&&(Npc_HasItems (hero,Pr_SztabkaZlota) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 3)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Swampshark_02) >= 2)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,8);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaZlota,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,3);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Swampshark_02,2);
//give sword
CreateInvItem (self, ItMw_2H_Axe_Heavy_01);
B_GiveInvItems (self,other,ItMw_2H_Axe_Heavy_01,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORK�W
FUNC VOID DIA_Stone_ForgeWeapon_Miecz2H5 ()
{
//ore if
if (Npc_HasItems (hero,itminugget) >= 300)
{
//ingred if
if(Npc_HasItems (hero,Pr_SztabkaMagicznejStali) >= 4) 
&&(Npc_HasItems (hero,Pr_SztabkaCiemnejStali) >= 3) 
&&(Npc_HasItems (hero,Pr_SztabkaStali) >= 5)   
&&(Npc_HasItems (hero,ItAt_Wolf_02) >= 2) 
&&(Npc_HasItems (hero,ItMi_Alchemy_BlueStone) >= 2)  
&&(Npc_HasItems (hero,ItAt_Troll_01) >= 1)
&&(Npc_HasItems (hero,ItAt_Bloodfly_02) >= 5)
{
//remove ingred
Npc_RemoveInvItems (hero, Pr_SztabkaMagicznejStali,4);
Npc_RemoveInvItems (hero, Pr_SztabkaCiemnejStali,3);
Npc_RemoveInvItems (hero, Pr_SztabkaStali,5);
Npc_RemoveInvItems (hero, ItAt_Wolf_02,2);
Npc_RemoveInvItems (hero, ItMi_Alchemy_BlueStone,2);
Npc_RemoveInvItems (hero, ItAt_Troll_01,1);
Npc_RemoveInvItems (hero, ItAt_Bloodfly_02,5);
//give sword
CreateInvItem (self, Miecz2H5);
B_GiveInvItems (self,other,Miecz2H5,1);
//pay
B_GiveInvItems (other,self,itminugget,300);
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"GRD_219_Stone_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Stone_ForgeWeapon);
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,DIALOG_BACK,DIA_Stone_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Stone_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Stone_ForgeWeapon_Miecz2H5);
	};
};

// ************************************************************
//							Kaufen					
// ************************************************************

instance DIA_Stone_NotSelling (C_INFO)
{
	npc				= Grd_219_Stone;
	nr 				= 1;
	condition		= DIA_Stone_NotSelling_Condition;
	information		= DIA_Stone_NotSelling_Info;
	permanent		= 1;
	description		= "Sprzedajesz or� i zbroje?";
};

FUNC int  DIA_Stone_NotSelling_Condition()
{	
	if	(Npc_GetTrueGuild (hero) != GIL_GRD)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};
};

func void  DIA_Stone_NotSelling_Info()
{
	AI_Output (other, self,"DIA_Stone_NotSelling_15_00"); //Sprzedajesz or� i zbroje?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_01"); //Handlem broni� para si� Skip. Ja zajmuj� si� tylko pancerzami.
	AI_Output (other, self,"DIA_Stone_NotSelling_15_02"); //Masz mo�e co� ciekawego na sprzeda�?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_03"); //Tylko pancerze dla Stra�nik�w, a ty nie jeste� jednym z nich. Dlatego b�dziesz musia� poszuka� gdzie indziej.
	AI_StopProcessInfos	( self );
};

//-----------------------------------------------------
// R�STUNG UND SCHWERT ABHOLEN WENN DER SPIELER GARDIST IST
//-----------------------------------------------------
instance  GRD_219_Stone_GETSTUFF (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_GETSTUFF_Condition;
	information		= GRD_219_Stone_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebuj� zbroi."; 
};

FUNC int  GRD_219_Stone_GETSTUFF_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};

};
FUNC void  GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output (other, self,"GRD_219_Stone_GETSTUFF_Info_15_01"); //Potrzebuj� zbroi.
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_02"); //A wi�c Thorus jednak ci� przyj��, co? Gratuluj�!
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_03"); //Jeszcze jeden, kt�remu spieszno przela� krew za Gomeza. A zreszt� - co mnie to obchodzi?
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_04"); //Masz - we� t� zbroj� i miecz. Witamy w stra�y.

	CreateInvItems		(self,ItMw_1H_Sword_03,2);
	B_GiveInvItems      (self,other,ItMw_1H_Sword_03,2);
	Npc_RemoveInvItem   (other,ItMw_1H_Sword_03);
    CreateInvItem		(other,GRD_ARMOR_L);
	AI_EquipBestArmor	(hero);
	AI_EquipBestMeleeWeapon	(hero);

	B_LogEntry		(GE_BecomeGuard,	"Odebra�em z ku�ni moj� pierwsz� zbroj� Stra�nika. Lepsze pancerze s� niestety du�o dro�sze.");

	AI_StopProcessInfos	( self );
};  

//-----------------------------------------------------
// BESSERE R�STUNG
//-----------------------------------------------------
instance  GRD_219_Stone_BETTERARMOR (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_BETTERARMOR_Condition;
	information		= GRD_219_Stone_BETTERARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia�bym dosta� lepszy pancerz."; 
};

FUNC int  GRD_219_Stone_BETTERARMOR_Condition()
{	
	if	(Npc_KnowsInfo (hero,GRD_219_Stone_GETSTUFF))
	&&	(Kapitel < 4)
	{
		return TRUE;
	};
};

FUNC void  GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output				(other, self,"GRD_219_Stone_BETTERARMOR_Info_15_01"); //Chcia�bym dosta� lepszy pancerz.
	AI_Output				(self, other,"GRD_219_Stone_BETTERARMOR_Info_06_02"); //Dostaniesz go, jak przyjdzie czas, i b�dziesz mia� wystarczaj�c� ilo�� rudy...
		
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	DIALOG_BACK							,	GRD_219_Stone_BETTERARMOR_BACK);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR, B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H)	,GRD_219_Stone_BETTERARMOR_H);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M)	,	GRD_219_Stone_BETTERARMOR_M);	
};  

func void GRD_219_Stone_BETTERARMOR_M ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //Chcia�bym dosta� zwyk�y pancerz Stra�nika.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //Thorus powiedzia�, �e musisz si� sprawdzi� jako Stra�nik zanim dostaniesz lepszy pancerz!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_GRD_ARMOR_M)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //Mam na sk�adzie odpowiedni� zbroj�, ale nie masz do�� rudy. Wr��, kiedy b�dzie ci� na ni� sta�!
	}
	else
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //Dobra, masz tu swoj� now� zbroj�. Tylko nie pozw�l, �eby Najemnicy j� porysowali. Ha ha ha!
		B_GiveInvItems	    (hero, self, ItMiNugget, VALUE_GRD_ARMOR_M);
		B_GiveInvItems		(self, hero, GRD_ARMOR_M, 1);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //Chcia�bym dosta� ci�k� zbroj� Stra�nika.
	if (HeroCanBuy_GRDHARMOR == false)
	{
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Tylko najlepsi Stra�nicy mog� je nosi�, a obawiam si�, �e minie jeszcze troch� czasu zanim zostaniesz jednym z nich.
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
	}
	else
	{
	if (Npc_HasItems(hero, ItMiNugget)>=VALUE_GRD_ARMOR_H)
	{
		AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_03"); //Wszyscy s�yszeli o twoich ostatnich dokonaniach. Ja r�wnie� jestem pod wra�eniem. No� ten pancerz z dum�. 
		B_GiveInvItems	    (hero, self, ItMiNugget, VALUE_GRD_ARMOR_H);
		B_GiveInvItems		(self, hero, GRD_ARMOR_H, 1);
		AI_EquipBestArmor	(hero);
		}
		else
		{
		AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_04"); //Z ch�ci� podarowa�bym ci ten pancerz, ale masz za ma�o rudy!
		Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
		};
	};
};

func void GRD_219_Stone_BETTERARMOR_BACK ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //Rozmy�li�em si�.
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //Jak uwa�asz. Wiesz, gdzie mnie znale��!

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

//#####################################################################
//##
//##
//##							KAPITEL 5/6
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Begr��ung
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone_Condition;
	information		= DIA_GRD_219_Stone_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_GRD_219_Stone_Condition()
{
	if (Kapitel >= 5)
	{
 		return 1;
 	};	
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output (self, other, "DIA_GRD_219_Stone_06_01"); //Czego chcesz? Nie wygl�dasz mi na jednego z siepaczy Gomeza.
};

//---------------------------------------------------------------------
//	Info Stone1
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone1 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone1_Condition;
	information		= DIA_GRD_219_Stone1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Masz racj�, nie pracuj� dla Gomeza.";
};

FUNC int DIA_GRD_219_Stone1_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone )) 
	{			
		return 1;
	};	
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_01"); //Masz racj�, nie pracuj� dla Gomeza.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_02"); //Wi�c jak si� tutaj dosta�e�? Tylko Gomez ma klucz do loch�w...
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_03"); //Dosta�em go od niego.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_04"); //Chcesz powiedzie�, �e to ty za�atwi�e� Gomeza?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_05"); //Dok�adnie.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_06"); //Stary, nie wiedzia�em, �e sta� ci� na co� takiego. Ale ciesz� si�, �e ten przekl�ty bandzior dosta� wreszcie co mu si� nale�a�o.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_07"); //Ale dlaczego mnie uwolni�e�?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_08"); //Us�ysza�em, �e siedzisz tu zamkni�ty i pomy�la�em, �e m�g�bym za�atwi� Gomeza i zwr�ci� ci wolno��.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_09"); //C�, wielkie dzi�ki...
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_10"); //... Jestem ci niezmiernie wdzi�czny. Wpadnij kiedy� do mojej ku�ni, to pogadamy.

	Npc_ExchangeRoutine(self, "OTNEW");
};

//---------------------------------------------------------------------
//	Info Stone3
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone3 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone3_Condition;
	information		= DIA_GRD_219_Stone3_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_GRD_219_Stone3_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone1 )) && ( Hlp_StrCmp ( Npc_GetNearestWP ( self ), "OCC_STABLE_LEFT_FRONT" ))
	{
			return 1;
	};	
};

func void DIA_GRD_219_Stone3_Info()
{
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_01"); //Ach, jeste�. Mam u ciebie d�ug wdzi�czno�ci za wypuszczenie mnie z lochu!
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_02"); //Wiesz, tak sobie my�l�: nie mam nic cennego, co m�g�bym ci da�, wi�c mo�e zamiast tego wykuj� dla ciebie co� specjalnego.
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_03"); //Mo�e jaki� pier�cie�, albo co� w tym stylu...
};

//---------------------------------------------------------------------
//	Info Stone2
//---------------------------------------------------------------------
// Warum ist Stone im Kerker
instance DIA_GRD_219_Stone2 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone2_Condition;
	information		= DIA_GRD_219_Stone2_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Dlaczego Gomez kaza� zamkn�� ci� w lochu?";
};

FUNC int DIA_GRD_219_Stone2_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 ))
	{			
		return 1;
	};	
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output (other, self, "DIA_GRD_219_Stone2_15_01"); //Dlaczego Gomez kaza� zamkn�� ci� w lochu?
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_02"); //Ten sukinsyn ubzdura� sobie, �e spiskuj� potajemnie z Magami Ognia. Nie zabi� mnie tylko dlatego, �e jestem najlepszym kowalem w ca�ym Starym Obozie.
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_03"); //No i wrzuci� mnie do tej zapluskwionej celi i wypuszcza� tylko wtedy, gdy by�a dla mnie jaka� robota.
};

//---------------------------------------------------------------------
//	Info Stone4
//---------------------------------------------------------------------
// R�stung verbessern lassen
instance DIA_GRD_219_Stone4 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone4_Condition;
	information		= DIA_GRD_219_Stone4_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mo�esz dla mnie wzmocni� t� magiczn� zbroj�?";
};

FUNC int DIA_GRD_219_Stone4_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( Npc_HasItems ( hero, ORE_ARMOR_M)) && ( KnowStone == 0 )  {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone4_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone4_15_01"); //Mo�esz dla mnie wzmocni� t� magiczn� zbroj�?
		AI_Output (self, other, "DIA_GRD_219_Stone4_06_02"); //Jasne! Daj mi j� i zaczekaj chwil�.
	
		AI_UnequipArmor	  ( hero );
		B_GiveInvItems   (hero, self, ORE_ARMOR_M, 1);
		Npc_RemoveInvItem   (self, ORE_ARMOR_M);

		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		CreateInvItem (self,ORE_ARMOR_H);
		B_GiveInvItems	  (self, hero, ORE_ARMOR_H, 1);	

		AI_Output (self, other, "DIA_GRD_219_Stone4_06_03"); //Oto twoja wzmocniona zbroja. Teraz jeste�my kwita.
		
		KnowStone = 1;
};


// Ring des Lebens
instance DIA_GRD_219_Stone5 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone5_Condition;
	information		= DIA_GRD_219_Stone5_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Przyda�by mi si� pier�cie� wzmacniaj�cy witalno��.";
};

FUNC int DIA_GRD_219_Stone5_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone5_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone5_15_01"); //Przyda�by mi si� pier�cie� wzmacniaj�cy witalno��.
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_02"); //To nie powinno by� zbyt trudne. Zaczekaj.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_03"); //Ten pier�cie� zwi�kszy twoje si�y witalne. My�l�, �e po takim prezencie jeste�my kwita.

		CreateInvItem	  ( self, Ring_des_Lebens2 );	
		B_GiveInvItems	  ( self, other, Ring_des_Lebens2, 1);	
		
		KnowStone = 1;
};


// Schutzring
instance DIA_GRD_219_Stone6 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone6_Condition;
	information		= DIA_GRD_219_Stone6_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia�bym, �eby� wyku� dla mnie pier�cie� ochronny.";
};

FUNC int DIA_GRD_219_Stone6_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ){
			return 1;
	 };	
};

func void DIA_GRD_219_Stone6_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone6_15_01"); //Chcia�bym, �eby� wyku� dla mnie pier�cie� ochronny.
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_02"); //Pier�cie� ochronny? Nie ma sprawy! Od razu wezm� si� do roboty. Zaczekaj chwil�.
		
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
	
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_03"); //Chcia�e� pier�cie� ochronny? Oto on! Teraz jeste�my kwita.

		CreateInvItem	  ( self, Schutzring_Total2 );
		B_GiveInvItems     (self, other, Schutzring_Total2, 1);
		
		KnowStone = 1;
};


instance DIA_GRD_219_Stone7 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone7_Condition;
	information		= DIA_GRD_219_Stone7_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Potrzebuj� czego�, co zwi�kszy moje umiej�tno�ci magiczne.";
};

FUNC int DIA_GRD_219_Stone7_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone7_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone7_15_01"); //Potrzebuj� czego�, co zwi�kszy moje umiej�tno�ci magiczne.
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_02"); //...Zwi�kszy umiej�tno�ci magiczne, powiadasz? Mo�e jaki� amulet! Tak, zrobi� dla ciebie magiczny amulet. To nie potrwa d�ugo.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_03"); //Dobra, amulet gotowy. Musz� przyzna�, �e wyszed� ca�kiem nie�le. Prosz�, teraz jeste�my kwita.

		CreateInvItem	  ( self, Amulett_der_Magie );
		B_GiveInvItems     (self, other, Amulett_der_Magie, 1);	
		
		KnowStone = 1;
};