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
	description	= "Czeœæ! Jestem tu nowy i chcia³bym poznaæ lepiej wasz Obóz.";
};                       

FUNC int  DIA_Darrion_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Hello_Info()
{
	AI_Output (other, self,"DIA_Darrion_Hello_15_00"); //Czeœæ! Jestem tu nowy i chcia³bym poznaæ lepiej wasz Obóz.
	AI_Output (self, other,"DIA_Darrion_Hello_11_01"); //Zatem trafi³eœ nie tam gdzie trzeba. Odk¹d Stra¿nicy Œwi¹tynni rozpoczêli przygotowania do walki, pracujemy dniem i noc¹.
	AI_Output (self, other,"DIA_Darrion_Hello_11_02"); //Nie mam wiele czasu na pogawêdki, wiêc nie zawracaj mi g³owy jeœli nie chcesz niczego kupiæ.
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Nowicjusz Darrion handluje broni¹. Krêci siê zwykle w pobli¿u kuŸni.");
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
	description	= "Chcia³bym coœ kupiæ!";
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
	AI_Output (other, self,"DIA_Darrion_Trade_15_00"); //Chcia³bym coœ kupiæ!
	AI_Output (self, other,"DIA_Darrion_Trade_11_01"); //To œwietnie! Oto broñ, któr¹ mam aktualnie na sk³adzie.

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
   description	= "Masz d³ug u Starkada. Wiesz coœ o tym?";
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
    AI_Output (other, self ,"DIA_Darrion_ORE_15_01"); //Masz d³ug u Starkada. Wiesz coœ o tym?
    AI_Output (self, other ,"DIA_Darrion_ORE_03_02"); //Jasne! A jak mam nie wiedzieæ? Mam tylko pewien problem. Potrzebujê rudy i nie chcê jej teraz oddawaæ Starkadowi.
    AI_Output (other, self ,"DIA_Darrion_ORE_15_03"); //No to mamy problem...
    AI_Output (self, other ,"DIA_Darrion_ORE_03_04"); //Có¿, mo¿e nie. O ile bêdziesz chcia³ pójœæ na pewne ustêpstwa... 
	AI_Output (other, self ,"DIA_Darrion_ORE_15_05"); //Niby jakie?
	AI_Output (self, other ,"DIA_Darrion_ORE_03_06"); //Oddasz te 50 bry³ek rudy za mnie, a ja w zamian dam ci jedn¹ z dwóch broni. Co ty na to? S¹ wiêcej warte ni¿ te 50 bry³ek rudy. Spójrz na nie. 
	Info_ClearChoices	(DIA_Darrion_ORE);
    Info_AddChoice		(DIA_Darrion_ORE, "WeŸ jêzyk topielca (obra¿enia: 14, jednorêczna)", DIA_Darrion_ORE_JEZYK);
	Info_AddChoice		(DIA_Darrion_ORE, "WeŸ laska sêdziowska (obra¿enia: 19, dwurêczna)", DIA_Darrion_ORE_DZIDA);
	Info_AddChoice		(DIA_Darrion_ORE, "Dawaj rudê!", DIA_Darrion_ORE_MONEY);
    
};

func void DIA_Darrion_ORE_JEZYK ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_JEZYK_15_01"); //Daj mi jêzyk topielca. 
	AI_Output (self, other ,"DIA_Darrion_ORE_JEZYK_03_02"); //Naprawdê nie po¿a³ujesz. 
	B_LogEntry     (CH1_OszukanyHandlarz,"Zamiast rudy wzi¹³em od Darriona ca³kiem przyzwoity miecz. Rudê bêdê musia³ oddaæ z w³asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_1H_Sword_Short_03, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Short_03, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_DZIDA ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_DZIDA_15_01"); //Daj mi tê laskê.
	AI_Output (self, other ,"DIA_Darrion_ORE_DZIDA_03_02"); //To dobry wybór. Jest dro¿sza i wytrzymalsza.
	B_LogEntry     (CH1_OszukanyHandlarz,"Zamiast rudy wzi¹³em od Darriona ca³kiem fajny kawa³ek kija. Ciekawe jak siê nim walczy... Rudê bêdê musia³ oddaæ z w³asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_2H_Staff_02, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_02, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_MONEY ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_MONEY_15_01"); //Koniec gierek! Dawaj rudê!
	AI_Output (self, other ,"DIA_Darrion_ORE_MONEY_03_02"); //Naprawdê nie móg³byœ za mnie za³o¿yæ? No có¿. Znowu bêdê musia³ po¿yczyæ...
	B_LogEntry     (CH1_OszukanyHandlarz,"Za¿¹da³em od Darriona rudy. Nie mam zamiaru za niego zak³adaæ.");//fix 1210
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
   description	= "Móg³byœ coœ dla mnie wykuæ?";
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
    AI_Output (other, self ,"DIA_Darrion_CanYouForgeWeapon_15_01"); //Móg³byœ coœ dla mnie wykuæ?
    AI_Output (self, other ,"DIA_Darrion_CanYouForgeWeapon_03_02"); //Nie robiê nic za darmo! Poza tym potrzebujê sk³adników i planu.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Darrion z Bracta Œni¹cego jest kowalem i mo¿e wykuæ dla mnie broñ jeœli bêdê mia³ plan, sk³adniki i rudê.");
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
   description	= "Wykuj dla mnie broñ.";
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
    AI_Output (other, self ,"DIA_Darrion_ForgeWeapon_15_01"); //Wykuj dla mnie broñ.
    AI_Output (self, other ,"DIA_Darrion_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//PORZ¥DNY MIECZ JEDNORÊCZNY
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//B£YSK NOCY
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//D£UGI MIECZ
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZABÓJCY
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//PA£ASZ
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO¯SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWURÊCZNY
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//ŒWIÊTY MŒCICIEL
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO¯SZE MIECZE
//////////////////////////////////////////
//MIECZ KRÓLEWSKI 
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOPÓR BOJOWY
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//TOPÓR WOJENNY
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORKÓW
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
AI_Output				(self, hero,"Nov_1312_Darrion_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"Nov_1312_Darrion_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Darrion_ForgeWeapon);
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,DIALOG_BACK,DIA_Darrion_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Darrion_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Darrion_ForgeWeapon_Miecz2H5);
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
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_01"); //Hej, mia³bym do ciebie ma³y interes.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_02"); //Mianowicie?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_03"); //Kojarzysz pewnego Stra¿nika Œwi¹tynnego, nazywa³ siê Gor Boba.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_04"); //Mo¿e...
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_05"); //To fanatyk. A gdy ten szaleniec Cor Calom opuœci³ nasz Obóz, ten œlepo za nim pod¹¿y³.
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_06"); //Zachowywa³ siê jak ob³¹kaniec. Myœlê, ¿e jego fanatyzm zbyt daleko go nie zaprowadzi. 
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_07"); //To dla mnie niez³a okazja. Ten œwir mia³ przy sobie cenny, z³oty medalion, który niezmiernie mnie interesuje. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_08"); //Sk¹d mam wiedzieæ gdzie jest teraz Gor Boba? I ile mi zap³acisz jeœli oddam ci ten medalion?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_09"); //Nie mam pojêcia gdzie on teraz jest, ale jeœli na niego trafisz i zdobêdziesz to, czego chcê, to zap³acê ci 400 bry³ek rudy. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_10"); //W porz¹dku. Jak wpadnie mi w rêce to zdobêdê dla ciebie amulet. 
	
	MIS_GoldMedallion == LOG_RUNNING;
	
	Log_CreateTopic		(CH4_GoldMedallion, LOG_MISSION);
	Log_SetTopicStatus	(CH4_GoldMedallion, LOG_RUNNING);
    B_LogEntry          (CH4_GoldMedallion,"Darrion powiedzia³ mi, ¿e niejaki Gor Boba razem z Kalomem opuœci³ obóz. Kowal z Bractwa spisuje ich na stratê i powiedzia³, ¿e jeœli kiedyœ spotkam Gor Bobê, to nieŸle mi zap³aci za zabranie jego z³otego medalionu. ");
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
   description	= "Mam medalion, który chcia³eœ.";
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
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_01"); //Mam medalion, który chcia³eœ.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_02"); //Dziêki, jak go zdoby³eœ?
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_03"); //To d³uga historia. Gor Boba wraz z Kalomem zaszed³ a¿ do Miasta Orków. A konkretniej do œwi¹tyni ukrytej pod tym miastem.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_04"); //Œwi¹tyni pod Miastem Orków? O czym ty bredzisz? 
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_05"); //Powiedz po prostu, ¿e spotka³eœ go w jakiejœ melinie i wygra³eœ dla mnie medalion w karty. 
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_06"); //Nie umiem graæ w karty.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_07"); //Niewa¿ne. Oto obiecana ruda.
    B_LogEntry                     (CH4_GoldMedallion,"Odda³em Darrionowi medalion, który znalaz³em przy ciele Gor Boby. ");
    Log_SetTopicStatus       (CH4_GoldMedallion, LOG_SUCCESS);
    MIS_GoldMedallion = LOG_SUCCESS;

    B_GiveXP (450);
    B_GiveInvItems (other, self, ItMi_GoldMedallion, 1);
	CreateInvItems(self, itminugget,400);
	B_GiveInvItems(self, other,itminugget,400);
    AI_StopProcessInfos	(self);
};

