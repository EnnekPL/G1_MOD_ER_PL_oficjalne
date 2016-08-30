//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Nordmarczyk_EXIT(C_INFO)
{
	npc             = NON_7851_Nordmarczyk;
	nr              = 999;
	condition		= DIA_Nordmarczyk_EXIT_Condition;
	information		= DIA_Nordmarczyk_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Nordmarczyk_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nordmarczyk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nordmarczyk_HELLO1 (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_HELLO1_Condition;
   information  = DIA_Nordmarczyk_HELLO1_Info;
   permanent	= 0;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Nordmarczyk_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Nordmarczyk_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_HELLO1_15_01"); //Co ty tu robisz?
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_02"); //Nie wida�?! Wyrabiam or�.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO1_15_03"); //Sam? Na tym odludziu? Dla kogo pracujesz?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_04"); //Tak, sam. Masz jaki� problem czy zlecenie? Pracuj� dla kogo chc�. Nie jestem byle jakim kowalem. Pochodz� z Nordmaru.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Nordmarczyk_HELLO2 (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_HELLO2_Condition;
   information  = DIA_Nordmarczyk_HELLO2_Info;
   permanent	= 0;
   description	= "Jeste� Nordmarczykiem? Jak si� tu dosta�e�?";
};

FUNC INT DIA_Nordmarczyk_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_01"); //Jeste� Nordmarczykiem? Jak si� tu dosta�e�?
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_02"); //Jak to jak?! Z�ama�em prawo, zosta�em z�apany i wtr�cony do Kolonii. Pewnie zapytasz co zrobi�em... Pomog�em w napadzie na kupca.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_03"); //Nordmarczycy rzadko opuszczaj� swoje klany. Co ci� do tego sk�oni�o?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_04"); //Chcia�em spr�bowa� innego �ycia w mniej surowych warunkach. Planowa�em wkr�tce wr�ci�, ale wda�em si� w z�e towarzystwo. 
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_05"); //Wielu chcia�o wykorzysta� moj� si�� i odwag�. No i tak da�em si� nam�wi� na taki skok...
};

//========================================
//-----------------> YOURWORK
//========================================

INSTANCE DIA_Nordmarczyk_YOURWORK (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_YOURWORK_Condition;
   information  = DIA_Nordmarczyk_YOURWORK_Info;
   permanent	= 0;
   description	= "Potrafisz wykona� mistrzowsk� bro�?";
};

FUNC INT DIA_Nordmarczyk_YOURWORK_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_YOURWORK_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_01"); //Potrafisz wykona� mistrzowsk� bro�?
    AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_02"); //Mog� zaoferowa� ci wi�cej ni� wszyscy kowale z tej pieprzonej Kolonii razem wzi�ci. Wykowanie mistrzowskich broni, przekuwanie, osadzanie run... Wszystko!
	AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_03"); //Oczywi�cie nie robi� ABSOULTNIE NIC ZA DARMO. Jasne?
	AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_04"); //Dobrze, dobrze. Jak b�d� mia� dla ciebie zlecenie na pewno si� odezw�.
};

//========================================
//-----------------> URIZIEL_1H
//========================================

INSTANCE DIA_Nordmarczyk_URIZIEL_1H (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_URIZIEL_1H_Condition;
   information  = DIA_Nordmarczyk_URIZIEL_1H_Info;
   permanent	= 0;
   description	= "Chcia�bym, aby� przeku� dla mnie ten miecz.";
};

FUNC INT DIA_Nordmarczyk_URIZIEL_1H_Condition()
{
	if (Uriziel1H_possible == true) && ( Npc_HasItems ( hero, Mythrilklinge01 ))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_URIZIEL_1H_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_01"); //Chcia�bym, aby� przeku� dla mnie ten miecz.
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_02"); //Poka� mi to.
	
	CreateInvItem 			(self, Mythrilklinge01);
	Npc_RemoveInvItem 		(self, ItMw_2H_Axe_Big_01);	
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	Npc_RemoveInvItem 		(self, Mythrilklinge01);	
	EquipItem (self, ItMw_2H_Axe_Big_01);		
	
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_03"); //Wspania�a bro�... Jednak ma na sobie do�� wyra�ne znami� przesz�o�ci. Osadzono tu jaki� klejnot.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_04"); //Przy pomocy tego ostrza dokonano wielkich czyn�w. Znalaz�em je w orkowej �wi�tyni.
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_05"); //(spogl�da pytaj�co) Zapuszczasz si� w takie miejsca?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_06"); //Niewa�ne. Powiedz mi, co chcesz z tego zrobi�.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_07"); //Musisz przeku� to ostrze tak, abym m�g� je swobodnie trzyma� w jednej r�ce. Dasz sobie z tym rad�? 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_08"); //Jasne, �e dam, jednak nie za darmo. To b�dzie ci� troch� kosztowa�. Konkretnie 2000 bry�ek rudy. 
};

//========================================
//-----------------> URIZIEL_1H_DECIDE
//========================================

INSTANCE DIA_Nordmarczyk_URIZIEL_1H_DECIDE (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Condition;
   information  = DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Info;
   permanent	= 0;
   description	= "Przekuj dla mnie URIZIEL na miecz jednor�czny (koszt: 2000 bry�ek rudy).";
};

FUNC INT DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_URIZIEL_1H)) && ( Npc_HasItems ( hero, Mythrilklinge01 ))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_01"); //Przekuj dla mnie URIZIEL na miecz jednor�czny. 
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_02"); //No to dawaj rud�, miecz i do roboty!
	
	B_GiveInvItems (hero,self, Mythrilklinge01, 1);
	B_GiveInvItems (hero,self, itminugget, 2000);
	
	CreateInvItem (self, URIZIEL_Touch);
	B_GiveInvItems (self,hero, URIZIEL_Touch, 1);
	
	//PlayVideo ( "ER_NORDMARIAN_SWORD.bik");
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_03"); //Gotowe! Wysz�o naprawd� �wietnie. Niech ci s�u�y. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_04"); //Dzi�ki. Mam nadziej�, �e nie wyda�em tej rudy na marne. 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_05"); //Chcesz pisemn� gwarancj�? 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_06"); //Na ile?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_07"); //Powiniene� da� rad� zabi� t� broni�... hmm... powiedzmy, �e stu ork�w. Oczywi�cie musisz regularnie zagl�da� do autoryzowanego kowala. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_08"); //Pewnie taki przegl�d nie jest tani...
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_09"); //My�l�, �e m�g�bym da� ci jak�� zni�k�. No, ale do�� ju� �art�w. Pewnie masz du�o do zrobienia.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_10"); //Tak, wielkie dzi�ki za pomoc. 
	B_GiveXP (500);
};

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Nordmarczyk_CanYouForgeWeapon (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_CanYouForgeWeapon_Condition;
   information  = DIA_Nordmarczyk_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "M�g�by� co� dla mnie wyku�?";
};

FUNC INT DIA_Nordmarczyk_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Nordmarczyk_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_CanYouForgeWeapon_15_01"); //M�g�by� co� dla mnie wyku�?
    AI_Output (self, other ,"DIA_Nordmarczyk_CanYouForgeWeapon_03_02"); //Nie robi� nic za darmo! Poza tym potrzebuj� sk�adnik�w i planu.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Nordmarczyk z opuszczonej wie�y nieopodal chaty Cavalorna wykuwa bronie. Musz� mie� plan, sk�adniki i rud� na zap�at�.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Nordmarczyk_ForgeWeapon (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_ForgeWeapon_Condition;
   information  = DIA_Nordmarczyk_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie bro�.";
};

FUNC INT DIA_Nordmarczyk_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_CanYouForgeWeapon))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_ForgeWeapon_15_01"); //Wykuj dla mnie bro�.
    AI_Output (self, other ,"DIA_Nordmarczyk_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};

FUNC VOID DIA_Nordmarczyk_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan1b ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ KOWALA
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz1h6 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//PORZ�DNY MIECZ JEDNOR�CZNY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz1h11 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//B�YSK NOCY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz1h15 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//SZEROKI MIECZ
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz1h7 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//D�UGI MIECZ
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan1c ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZAB�JCY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//RAPIER
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Rapier ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//PA�ASZ
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_BanditTrader ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ ROZPACZY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz1H9 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO�SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWUR�CZNY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan3b ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//�WI�TY M�CICIEL
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz1h8 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO�SZE MIECZE
//////////////////////////////////////////
//MIECZ KR�LEWSKI 
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan3 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOP�R BOJOWY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan5c ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan4b ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//TOP�R WOJENNY
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Plan7b ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORK�W
FUNC VOID DIA_Nordmarczyk_ForgeWeapon_Miecz2H5 ()
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};