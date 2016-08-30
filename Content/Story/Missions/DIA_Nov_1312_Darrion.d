//poprawione i sprawdzone - Nocturn

// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Darrion_Exit (C_INFO)
{
	npc			=  Nov_1312_Darrion;
	nr			=  999;
	condition	=  DIA_Darrion_Exit_Condition;
	information	=  DIA_Darrion_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Darrion_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Hallo
// **************************************************

instance  DIA_Darrion_Hello (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 1;
	condition	= DIA_Darrion_Hello_Condition;
	information	= DIA_Darrion_Hello_Info;
	permanent	= 0;
	description	= "Cze��! Jestem tu nowy i chcia�bym pozna� lepiej wasz Ob�z.";
};                       

FUNC int  DIA_Darrion_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Hello_Info()
{
	AI_Output (other, self,"DIA_Darrion_Hello_15_00"); //Cze��! Jestem tu nowy i chcia�bym pozna� lepiej wasz Ob�z.
	AI_Output (self, other,"DIA_Darrion_Hello_11_01"); //Zatem trafi�e� nie tam gdzie trzeba. Odk�d Stra�nicy �wi�tynni rozpocz�li przygotowania do walki, pracujemy dniem i noc�.
	AI_Output (self, other,"DIA_Darrion_Hello_11_02"); //Nie mam wiele czasu na pogaw�dki, wi�c nie zawracaj mi g�owy je�li nie chcesz niczego kupi�.
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Nowicjusz Darrion handluje broni�. Kr�ci si� zwykle w pobli�u ku�ni.");
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Darrion_Trade (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 800;
	condition	= DIA_Darrion_Trade_Condition;
	information	= DIA_Darrion_Trade_Info;
	permanent	= 1;
	description	= "Chcia�bym co� kupi�!";
	trade 		= 1;
};                       

FUNC int  DIA_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Darrion_Trade_Info()
{
	AI_Output (other, self,"DIA_Darrion_Trade_15_00"); //Chcia�bym co� kupi�!
	AI_Output (self, other,"DIA_Darrion_Trade_11_01"); //To �wietnie! Oto bro�, kt�r� mam aktualnie na sk�adzie.

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};

//========================================
//-----------------> ORE
//========================================

INSTANCE DIA_Darrion_ORE (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 6;
   condition    = DIA_Darrion_ORE_Condition;
   information  = DIA_Darrion_ORE_Info;
   permanent	= FALSE;
   description	= "Masz d�ug u Starkada. Wiesz co� o tym?";
};

FUNC INT DIA_Darrion_ORE_Condition()
{
    if (MIS_OszukanyHandlarz == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_ORE_Info()
{
    AI_Output (other, self ,"DIA_Darrion_ORE_15_01"); //Masz d�ug u Starkada. Wiesz co� o tym?
    AI_Output (self, other ,"DIA_Darrion_ORE_03_02"); //Jasne! A jak mam nie wiedzie�? Mam tylko pewien problem. Potrzebuj� rudy i nie chc� jej teraz oddawa� Starkadowi.
    AI_Output (other, self ,"DIA_Darrion_ORE_15_03"); //No to mamy problem...
    AI_Output (self, other ,"DIA_Darrion_ORE_03_04"); //C�, mo�e nie. O ile b�dziesz chcia� p�j�� na pewne ust�pstwa... 
	AI_Output (other, self ,"DIA_Darrion_ORE_15_05"); //Niby jakie?
	AI_Output (self, other ,"DIA_Darrion_ORE_03_06"); //Oddasz te 50 bry�ek rudy za mnie, a ja w zamian dam ci jedn� z dw�ch broni. Co ty na to? S� wi�cej warte ni� te 50 bry�ek rudy. Sp�jrz na nie. 
	Info_ClearChoices	(DIA_Darrion_ORE);
    Info_AddChoice		(DIA_Darrion_ORE, "We� j�zyk topielca (obra�enia: 14, jednor�czna)", DIA_Darrion_ORE_JEZYK);
	Info_AddChoice		(DIA_Darrion_ORE, "We� laska s�dziowska (obra�enia: 19, dwur�czna)", DIA_Darrion_ORE_DZIDA);
	Info_AddChoice		(DIA_Darrion_ORE, "Dawaj rud�!", DIA_Darrion_ORE_MONEY);
    
};

func void DIA_Darrion_ORE_JEZYK ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_JEZYK_15_01"); //Daj mi j�zyk topielca. 
	AI_Output (self, other ,"DIA_Darrion_ORE_JEZYK_03_02"); //Naprawd� nie po�a�ujesz. 
	B_LogEntry     (CH1_OszukanyHandlarz,"Zamiast rudy wzi��em od Darriona ca�kiem przyzwoity miecz. Rud� b�d� musia� odda� z w�asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_1H_Sword_Short_03, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Short_03, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_DZIDA ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_DZIDA_15_01"); //Daj mi t� lask�.
	AI_Output (self, other ,"DIA_Darrion_ORE_DZIDA_03_02"); //To dobry wyb�r. Jest dro�sza i wytrzymalsza.
	B_LogEntry     (CH1_OszukanyHandlarz,"Zamiast rudy wzi��em od Darriona ca�kiem fajny kawa�ek kija. Ciekawe jak si� nim walczy... Rud� b�d� musia� odda� z w�asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_2H_Staff_02, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_02, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_MONEY ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_MONEY_15_01"); //Koniec gierek! Dawaj rud�!
	AI_Output (self, other ,"DIA_Darrion_ORE_MONEY_03_02"); //Naprawd� nie m�g�by� za mnie za�o�y�? No c�. Znowu b�d� musia� po�yczy�...
	B_LogEntry     (CH1_OszukanyHandlarz,"Za��da�em od Darriona rudy. Nie mam zamiaru za niego zak�ada�.");//fix 1210
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Darrion_CanYouForgeWeapon (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_CanYouForgeWeapon_Condition;
   information  = DIA_Darrion_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "M�g�by� co� dla mnie wyku�?";
};

FUNC INT DIA_Darrion_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Darrion_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Darrion_CanYouForgeWeapon_15_01"); //M�g�by� co� dla mnie wyku�?
    AI_Output (self, other ,"DIA_Darrion_CanYouForgeWeapon_03_02"); //Nie robi� nic za darmo! Poza tym potrzebuj� sk�adnik�w i planu.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Darrion z Bracta �ni�cego jest kowalem i mo�e wyku� dla mnie bro� je�li b�d� mia� plan, sk�adniki i rud�.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Darrion_ForgeWeapon (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_ForgeWeapon_Condition;
   information  = DIA_Darrion_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie bro�.";
};

FUNC INT DIA_Darrion_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Darrion_CanYouForgeWeapon))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Darrion_ForgeWeapon_15_01"); //Wykuj dla mnie bro�.
    AI_Output (self, other ,"DIA_Darrion_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};

FUNC VOID DIA_Darrion_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Darrion_ForgeWeapon_Plan1b ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ KOWALA
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz1h6 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//PORZ�DNY MIECZ JEDNOR�CZNY
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz1h11 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//B�YSK NOCY
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz1h15 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//SZEROKI MIECZ
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz1h7 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//D�UGI MIECZ
FUNC VOID DIA_Darrion_ForgeWeapon_Plan1c ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZAB�JCY
FUNC VOID DIA_Darrion_ForgeWeapon_DaggerOfMurder ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//RAPIER
FUNC VOID DIA_Darrion_ForgeWeapon_Rapier ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//PA�ASZ
FUNC VOID DIA_Darrion_ForgeWeapon_BanditTrader ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ ROZPACZY
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz1H9 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO�SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWUR�CZNY
FUNC VOID DIA_Darrion_ForgeWeapon_Plan3b ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//�WI�TY M�CICIEL
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz1h8 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO�SZE MIECZE
//////////////////////////////////////////
//MIECZ KR�LEWSKI 
FUNC VOID DIA_Darrion_ForgeWeapon_Plan3 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOP�R BOJOWY
FUNC VOID DIA_Darrion_ForgeWeapon_Plan5c ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Darrion_ForgeWeapon_Plan4b ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//TOP�R WOJENNY
FUNC VOID DIA_Darrion_ForgeWeapon_Plan7b ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORK�W
FUNC VOID DIA_Darrion_ForgeWeapon_Miecz2H5 ()
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};

//========================================
//-----------------> GoldAmullet
//========================================

INSTANCE DIA_Darrion_GoldAmullet (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_GoldAmullet_Condition;
   information  = DIA_Darrion_GoldAmullet_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Darrion_GoldAmullet_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_GoldAmullet_Info()
{
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_01"); //Hej, mia�bym do ciebie ma�y interes.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_02"); //Mianowicie?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_03"); //Kojarzysz pewnego Stra�nika �wi�tynnego, nazywa� si� Gor Boba.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_04"); //Mo�e...
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_05"); //To fanatyk. A gdy ten szaleniec Cor Calom opu�ci� nasz Ob�z, ten �lepo za nim pod��y�.
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_06"); //Zachowywa� si� jak ob��kaniec. My�l�, �e jego fanatyzm zbyt daleko go nie zaprowadzi. 
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_07"); //To dla mnie niez�a okazja. Ten �wir mia� przy sobie cenny, z�oty medalion, kt�ry niezmiernie mnie interesuje. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_08"); //Sk�d mam wiedzie� gdzie jest teraz Gor Boba? I ile mi zap�acisz je�li oddam ci ten medalion?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_09"); //Nie mam poj�cia gdzie on teraz jest, ale je�li na niego trafisz i zdob�dziesz to, czego chc�, to zap�ac� ci 400 bry�ek rudy. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_10"); //W porz�dku. Jak wpadnie mi w r�ce to zdob�d� dla ciebie amulet. 
	
	MIS_GoldMedallion == LOG_RUNNING;
	
	Log_CreateTopic		(CH1_GoldMedallion, LOG_MISSION);
	Log_SetTopicStatus	(CH1_GoldMedallion, LOG_RUNNING);
    B_LogEntry                 (CH1_GoldMedallion,"Darrion powiedzia� mi, �e niejaki Gor Boba razem z Kalomem opu�ci� ob�z. Kowal z Bractwa spisuje ich na strat� i powiedzia�, �e je�li kiedy� spotkam Gor Bob�, to nie�le mi zap�aci za zabranie jego z�otego medalionu. ");

};

//========================================
//-----------------> GiveMedallion
//========================================

INSTANCE DIA_Darrion_GiveMedallion (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 2;
   condition    = DIA_Darrion_GiveMedallion_Condition;
   information  = DIA_Darrion_GiveMedallion_Info;
   permanent	= FALSE;
   description	= "Mam medalion, kt�ry chcia�e�.";
};

FUNC INT DIA_Darrion_GiveMedallion_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Darrion_GoldAmullet))
    && (Npc_HasItems (other, ItMi_GoldMedallion) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_GiveMedallion_Info()
{
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_01"); //Mam medalion, kt�ry chcia�e�.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_02"); //Dzi�ki, jak go zdoby�e�?
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_03"); //To d�uga historia. Gor Boba wraz z Kalomem zaszed� a� do Miasta Ork�w. A konkretniej do �wi�tyni ukrytej pod tym miastem.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_04"); //�wi�tyni pod Miastem Ork�w? O czym ty bredzisz? 
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_05"); //Powiedz po prostu, �e spotka�e� go w jakiej� melinie i wygra�e� dla mnie medalion w karty. 
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_06"); //Nie umiem gra� w karty.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_07"); //Niewa�ne. Oto obiecana ruda.
    B_LogEntry                     (CH1_GoldMedallion,"Odda�em Darrionowi medalion, kt�ry znalaz�em przy ciele Gor Boby. ");
    Log_SetTopicStatus       (CH1_GoldMedallion, LOG_SUCCESS);
    MIS_GoldMedallion = LOG_SUCCESS;

    B_GiveXP (450);
    B_GiveInvItems (other, self, ItMi_GoldMedallion, 1);
	CreateInvItems(self, itminugget,400);
	B_GiveInvItems(self, other,itminugget,400);
    AI_StopProcessInfos	(self);
};

