//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Huan_EXIT(C_INFO)
{
	npc             = ORG_9550_Huan;
	nr              = 999;
	condition		= DIA_Huan_EXIT_Condition;
	information		= DIA_Huan_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Huan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Huan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Huan_HELLO1 (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_HELLO1_Condition;
   information  = DIA_Huan_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jesteœ kowalem?";
};

FUNC INT DIA_Huan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Huan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Huan_HELLO1_15_01"); //Jesteœ kowalem?
    AI_Output (self, other ,"DIA_Huan_HELLO1_03_02"); //Tak! Wykonujê proste bronie dla Szkodników i nieco lepsze dla Najemników.
    AI_Output (self, other ,"DIA_Huan_HELLO1_03_03"); //Mam sporo pracy. Ludzie Laresa w ogóle nie szanuj¹ broni.
};

////////////////////////////////////////////
// 		FixMyAxe
////////////////////////////////////////////

INSTANCE DIA_Huan_FixMyAxe (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_FixMyAxe_Condition;
   information  = DIA_Huan_FixMyAxe_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Torlof.";
};

FUNC INT DIA_Huan_FixMyAxe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Torlof_PoparcieNajemnikow)) && (MIS_TorlofsAxe == LOG_RUNNING) && (Npc_HasItems (hero,Torlofs_Axt2) == 1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Huan_FixMyAxe_Info()
{
    AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_01"); //Przysy³a mnie Torlof. Mam tu jego topór.
    AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_02"); //Cholera! Mia³em nadziejê, ¿e zapomnia³.
	AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_03"); //W czym problem?
    AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_04"); //Ten topór jest bardzo przestarza³y. Zosta³ wykuty prawdopodobnie w czasach pierwszej wojny z orkami.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_05"); //Có¿, kowalstwo od tamtego czasu trochê siê zmieni³o. Opracowano nowsze metody odlewu stali.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_06"); //¯eby naprawiæ tê broñ musia³bym mieæ sztabkê stali przygotowan¹ wed³ug starej metody.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_07"); //Od lat takiej nie widzia³em.
	AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_08"); //Muszê do jutra zwróciæ broñ Torlofowi.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_09"); //Czekaj, jest cieñ szansy...
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_10"); //Podobno w kolonii mieszka pewien nordmarski kowal. Jest ponoæ mistrzem w swoim fachu, lecz ma³o kto zagl¹da do jego kuŸni.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_11"); //Jedynie najznamienitsi... Ale to chyba nasza jedyna nadzieja.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_12"); //Byæ mo¿e on bêdzie mia³ na stanie tak¹ stal. Powinieneœ z nim porozmawiaæ.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_13"); //S¹dzê, ¿e to nie bêdzie tania rzecz. A, kowal zajmuje star¹ wie¿ê w dolinie pomiêdzy Starym a Nowym Obozem.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_14"); //Z tego co mi wiadomo, obozuje tam niejaki Cavalorn. Dalej ju¿ sobie poradzisz.
	
	B_LogEntry               (CH1_TorlofsAxe,"Huan powiedzia³ mi, ¿e topór Torlofa jest bardzo stary i ¿eby go naprawiæ bêdzie potrzebna sztabka stali wykonanej wed³ug starej metody. Jeœli nie znajdê nigdzie takiej sztabki, bêdê musia³ poprosiæ o pomoc nordmarskiego kowala. ZNajdê go w starej wie¿y, w dolinie, w której stacjonuje myœliwy Cavalorn.");
};

////////////////////////////////////////////
// 		GetOreStab
////////////////////////////////////////////

INSTANCE DIA_Huan_GetOreStab (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_GetOreStab_Condition;
   information  = DIA_Huan_GetOreStab_Info;
   permanent	= FALSE;
   description	= "Mam sztabkê stali.";
};

FUNC INT DIA_Huan_GetOreStab_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Huan_FixMyAxe)) && (MIS_TorlofsAxe == LOG_RUNNING) && (Npc_HasItems (hero,ItMi_OreStabOldMetode) == 1) && (Npc_HasItems (hero,Torlofs_Axt2) == 1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Huan_GetOreStab_Info()
{
    AI_Output (other, self ,"DIA_Huan_GetOreStab_15_01"); //Mam sztabkê stali.
    AI_Output (self, other ,"DIA_Huan_GetOreStab_03_02"); //A niech mnie! Uda³o ci siê j¹ znaleŸæ. Niesamowite. 
	AI_Output (other, self ,"DIA_Huan_GetOreStab_15_03"); //Mo¿esz ju¿ siê wzi¹æ do roboty. 
    AI_Output (self, other ,"DIA_Huan_GetOreStab_03_04"); //Jasne, to nie potrwa d³ugo.
	
	AI_GotoWp (self,"NO_KOWADLO");
	AI_UseMob (self,"BSANVIL",1);
	AI_UseMob (self,"BSANVIL",-1);
	AI_GotoNpc (self,hero);
	AI_Output (self, other ,"DIA_Huan_GetOreStab_03_05"); //Gotowe. Torlof powinien byæ usatysfakcjonowany. 
	
	B_LogEntry               (CH1_TorlofsAxe,"Przynios³em sztabkê stali Huanowi. Od rêki naprawi³ broñ Torlofa. Mogê ju¿ wróciæ do Najemnika z jego toporem.");
	
	B_GiveInvItems (hero,self,ItMi_OreStabOldMetode,1);
	Npc_RemoveInvItems (self,ItMi_OreStabOldMetode,1);
	B_GiveInvItems (hero,self,Torlofs_Axt2,1);
	Npc_RemoveInvItems (self,Torlofs_Axt2,1);
	CreateInvItem (self,Torlofs_Axt2_Fixed);
	B_GiveInvItems (self,hero,Torlofs_Axt2_Fixed,1);
};

//========================================
//-----------------> HELLO3
//========================================
var int knows_huantrade;
INSTANCE DIA_Huan_HELLO3 (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 3;
   condition    = DIA_Huan_HELLO3_Condition;
   information  = DIA_Huan_HELLO3_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Mo¿esz mi coœ sprzedaæ?";
};

FUNC INT DIA_Huan_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Huan_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Huan_HELLO3_15_01"); //Mo¿esz mi coœ sprzedaæ?
    AI_Output (self, other ,"DIA_Huan_HELLO3_03_02"); //Mam coœ na sk³adzie.
	if (knows_huantrade == false)
	{
	knows_huantrade = true;
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry                     (GE_TraderNC,"Huan jest kowalem i mo¿e mi coœ sprzedaæ.");//fix
	};
};

//========================================
//-----------------> OLD_ARMOR_DEAL
//========================================

INSTANCE DIA_Huan_OLD_ARMOR_DEAL (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_OLD_ARMOR_DEAL_Condition;
   information  = DIA_Huan_OLD_ARMOR_DEAL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huan_OLD_ARMOR_DEAL_Condition()
{
    if (Npc_HasItems (other, OldArmor) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_Info()
{
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_01"); //Hej, przyjacielu! Zaczekaj!
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_03"); //Widzê, ¿e masz przy sobie interesuj¹c¹ zbrojê. Móg³bym j¹ zobaczyæ?
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_04"); //W sumie... czemu nie?
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_05"); //Ta zbroja jest we wspania³ym stanie! Takie pancerze nosili stra¿nicy królewscy w czasach pierwszych wojen myrtañskich.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_06"); //Ten pancerz to UNIKAT!
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_07"); //Gdzie znalaz³eœ to cudeñko?
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_08"); //Ja? Có¿, le¿a³o w jaskini.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_09"); //Te zbroje potrafi³y przetrwaæ wieki. Wspania³y kunszt.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_10"); //Nie chcia³byœ jej sprzedaæ? Zaoferujê ci 500 bry³ek rudy. ¯aden inny kupiec tyle nie zap³aci.
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_11"); //Có¿...

    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Nie chcê jej sprzedaæ!", DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Umowa stoi. 500 bry³ek rudy to uczciwa cena.", DIA_Huan_OLD_ARMOR_DEAL_SELL_500);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Daj 750 bry³ek i jest twoja. ", DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "1000 bry³ek rudy, albo nie mamy o czym rozmawiaæ.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL_15_01"); //Nie chcê jej sprzedaæ!
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL_03_02"); //No szkoda, szkoda. Wiedz, ¿e robisz b³¹d. Ta zbroja wkrótce ci siê nie przyda. Nie jest tak mocna, jak nowe pancerze.
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_SELL_500()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_SELL_500_15_01"); //Umowa stoi. 500 bry³ek rudy to uczciwa cena.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_SELL_500_03_02"); //Mi³o siê robi z tob¹ interesy. Zaopiekujê siê t¹ zbroj¹ jak w³asn¹ matk¹.
	B_GiveInvItems      (hero, self, OldArmor, 1);
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE_15_01"); //Daj 750 bry³ek i jest twoja. 
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE_03_02"); //Twardy z ciebie negocjator. No dobra. Niech stracê.
    CreateInvItems (self, ItMiNugget, 750);
    B_GiveInvItems (self, other, ItMiNugget, 750);
	B_GiveInvItems      (hero, self, OldArmor, 1);
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_15_01"); //1000 bry³ek rudy, albo nie mamy o czym rozmawiaæ.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_03_02"); //Nie przesadzasz trochê? Mogê ci daæ co najwy¿ej 700 bry³ek.
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Do³ó¿ stówkê i mo¿esz j¹ braæ.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Wypchaj siê.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS_15_01"); //Do³ó¿ stówkê i mo¿esz j¹ braæ.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS_03_02"); //Cholera... No, ale niech ci bêdzie. 
	CreateInvItems (self, ItMiNugget, 800);
    B_GiveInvItems (self, other, ItMiNugget, 800);
    B_GiveInvItems      (hero, self, OldArmor, 1);
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL_15_01"); //Wypchaj siê.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL_03_02"); //Pajac.
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Huan_CanYouForgeWeapon (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_CanYouForgeWeapon_Condition;
   information  = DIA_Huan_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "Móg³byœ coœ dla mnie wykuæ?";
};

FUNC INT DIA_Huan_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huan_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huan_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Huan_CanYouForgeWeapon_15_01"); //Móg³byœ coœ dla mnie wykuæ?
    AI_Output (self, other ,"DIA_Huan_CanYouForgeWeapon_03_02"); //Nie robiê nic za darmo! Poza tym potrzebujê sk³adników i planu.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Huan z Nowego Obozu wykuwa bronie. Muszê mieæ plan, sk³adniki i zap³atê.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Huan_ForgeWeapon (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_ForgeWeapon_Condition;
   information  = DIA_Huan_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie broñ.";
};

FUNC INT DIA_Huan_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huan_CanYouForgeWeapon))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huan_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Huan_ForgeWeapon_15_01"); //Wykuj dla mnie broñ.
    AI_Output (self, other ,"DIA_Huan_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};

FUNC VOID DIA_Huan_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Huan_ForgeWeapon_Plan1b ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ KOWALA
FUNC VOID DIA_Huan_ForgeWeapon_Miecz1h6 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//PORZ¥DNY MIECZ JEDNORÊCZNY
FUNC VOID DIA_Huan_ForgeWeapon_Miecz1h11 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//B£YSK NOCY
FUNC VOID DIA_Huan_ForgeWeapon_Miecz1h15 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//SZEROKI MIECZ
FUNC VOID DIA_Huan_ForgeWeapon_Miecz1h7 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//D£UGI MIECZ
FUNC VOID DIA_Huan_ForgeWeapon_Plan1c ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZABÓJCY
FUNC VOID DIA_Huan_ForgeWeapon_DaggerOfMurder ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//RAPIER
FUNC VOID DIA_Huan_ForgeWeapon_Rapier ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//PA£ASZ
FUNC VOID DIA_Huan_ForgeWeapon_BanditTrader ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//MIECZ ROZPACZY
FUNC VOID DIA_Huan_ForgeWeapon_Miecz1H9 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO¯SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWURÊCZNY
FUNC VOID DIA_Huan_ForgeWeapon_Plan3b ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//ŒWIÊTY MŒCICIEL
FUNC VOID DIA_Huan_ForgeWeapon_Miecz1h8 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO¯SZE MIECZE
//////////////////////////////////////////
//MIECZ KRÓLEWSKI 
FUNC VOID DIA_Huan_ForgeWeapon_Plan3 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOPÓR BOJOWY
FUNC VOID DIA_Huan_ForgeWeapon_Plan5c ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Huan_ForgeWeapon_Plan4b ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//TOPÓR WOJENNY
FUNC VOID DIA_Huan_ForgeWeapon_Plan7b ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORKÓW
FUNC VOID DIA_Huan_ForgeWeapon_Miecz2H5 ()
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
AI_Output				(self, hero,"ORG_9550_Huan_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_9550_Huan_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Huan_ForgeWeapon);
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,DIALOG_BACK,DIA_Huan_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Huan_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Huan_ForgeWeapon_Miecz2H5);
	};
};