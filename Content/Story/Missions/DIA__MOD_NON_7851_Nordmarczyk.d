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
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_02"); //Nie widaæ?! Wyrabiam orê¿.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO1_15_03"); //Sam? Na tym odludziu? Dla kogo pracujesz?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_04"); //Tak, sam. Masz jakiœ problem czy zlecenie? Pracujê dla kogo chcê. Nie jestem byle jakim kowalem. Pochodzê z Nordmaru.
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
   description	= "Jesteœ Nordmarczykiem? Jak siê tu dosta³eœ?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_01"); //Jesteœ Nordmarczykiem? Jak siê tu dosta³eœ?
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_02"); //Jak to jak?! Z³ama³em prawo, zosta³em z³apany i wtr¹cony do Kolonii. Pewnie zapytasz co zrobi³em... Pomog³em w napadzie na kupca.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_03"); //Nordmarczycy rzadko opuszczaj¹ swoje klany. Co ciê do tego sk³oni³o?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_04"); //Chcia³em spróbowaæ innego ¿ycia w mniej surowych warunkach. Planowa³em wkrótce wróciæ, ale wda³em siê w z³e towarzystwo. 
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_05"); //Wielu chcia³o wykorzystaæ moj¹ si³ê i odwagê. No i tak da³em siê namówiæ na taki skok...
};

//========================================
//-----------------> OLDORESTAB
//========================================

INSTANCE DIA_Nordmarczyk_OLDORESTAB (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_OLDORESTAB_Condition;
   information  = DIA_Nordmarczyk_OLDORESTAB_Info;
   permanent	= 0;
   description	= "Pilnie potrzebujê sztabki stali...";
};

FUNC INT DIA_Nordmarczyk_OLDORESTAB_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Huan_FixMyAxe))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_OLDORESTAB_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_01"); //Pilnie potrzebujê sztabki stali odlanej wed³ug starej metody.
    AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_02"); //Tej z czasów pierwszej wojny z orkami? A po có¿ ci coœ takiego?
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_03"); //Pewien kowal musi naprawiæ bardzo stary orê¿. 
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_04"); //Od lat nie u¿ywa siê tego typu stali.
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_05"); //Masz mo¿e jeden spoœród tych reliktów przesz³oœci na wyposa¿eniu?
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_06"); //Ja? Sk¹d¿e! Ale jest cieñ szansy...
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_07"); //Dawniej kowalstwo rozwija³o siê w dolinie niezwykle prê¿nie. Sam wiesz, kopalnie...
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_08"); //Rudê i inne sk³adniki rzemieœlnicze transportowano po Górniczej Dolinie przy u¿yciu wozów. 
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_09"); //Do dziœ mo¿na spotkaæ ich wraki na starych traktach. Jeden z takich w³aœnie wraków le¿y nieopodal.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_10"); //By³ prze³adowany rud¹ i ¿elazem. Oczywiœcie zabra³em stamt¹d wszystko, co siê da³o, ale mo¿e zosta³y jakieœ resztki dla ciebie.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_11"); //Rozejrzyj siê tam.
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_12"); //Gdzie dok³adnie jest ten wóz?
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_13"); //Za moj¹ wie¿¹ rozci¹ga siê p³askowy¿ na którym ¿yj¹ œcierwojady. PójdŸ tam i skieruj siê na Ziemie Orków.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_14"); //Wóz znajduje siê w uschniêtym zagajniku. Uwa¿aj na czaj¹ce siê tam wilki.
	
	B_LogEntry               (CH1_TorlofsAxe,"Nordmarski kowal poleci³ mi przeszukaæ wrak starego wozu, którym dawniej transportowano sk³adniki rzemieœlnicze. Znajdê go w uschniêtym zagajniku, na p³askowy¿u za wie¿¹ Nordmarczyka. To moja ostatnia szansa.");
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
   description	= "Potrafisz wykonaæ mistrzowsk¹ broñ?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_01"); //Potrafisz wykonaæ mistrzowsk¹ broñ?
    AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_02"); //Mogê zaoferowaæ ci wiêcej ni¿ wszyscy kowale z tej pieprzonej Kolonii razem wziêci. Wykowanie mistrzowskich broni, przekuwanie, osadzanie run... Wszystko!
	AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_03"); //Oczywiœcie nie robiê ABSOULTNIE NIC ZA DARMO. Jasne?
	AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_04"); //Dobrze, dobrze. Jak bêdê mia³ dla ciebie zlecenie na pewno siê odezwê.
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
   description	= "Chcia³bym, abyœ przeku³ dla mnie ten miecz.";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_01"); //Chcia³bym, abyœ przeku³ dla mnie ten miecz.
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_02"); //Poka¿ mi to.
	
	CreateInvItem 			(self, Mythrilklinge01);
	Npc_RemoveInvItem 		(self, ItMw_2H_Axe_Big_01);	
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	Npc_RemoveInvItem 		(self, Mythrilklinge01);	
	EquipItem (self, ItMw_2H_Axe_Big_01);		
	
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_03"); //Wspania³a broñ... Jednak ma na sobie doœæ wyraŸne znamiê przesz³oœci. Osadzono tu jakiœ klejnot.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_04"); //Przy pomocy tego ostrza dokonano wielkich czynów. Znalaz³em je w orkowej œwi¹tyni.
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_05"); //(spogl¹da pytaj¹co) Zapuszczasz siê w takie miejsca?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_06"); //Niewa¿ne. Powiedz mi, co chcesz z tego zrobiæ.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_07"); //Musisz przekuæ to ostrze tak, abym móg³ je swobodnie trzymaæ w jednej rêce. Dasz sobie z tym radê? 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_08"); //Jasne, ¿e dam, jednak nie za darmo. To bêdzie ciê trochê kosztowaæ. Konkretnie 2000 bry³ek rudy. 
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
   description	= "Przekuj dla mnie URIZIEL na miecz jednorêczny (koszt: 2000 bry³ek rudy).";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_01"); //Przekuj dla mnie URIZIEL na miecz jednorêczny. 
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_02"); //No to dawaj rudê, miecz i do roboty!
	
	B_GiveInvItems (hero,self, Mythrilklinge01, 1);
	B_GiveInvItems (hero,self, itminugget, 2000);
	
	CreateInvItem (self, URIZIEL_Touch);
	B_GiveInvItems (self,hero, URIZIEL_Touch, 1);
	
	//PlayVideo ( "ER_NORDMARIAN_SWORD.bik");
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_03"); //Gotowe! Wysz³o naprawdê œwietnie. Niech ci s³u¿y. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_04"); //Dziêki. Mam nadziejê, ¿e nie wyda³em tej rudy na marne. 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_05"); //Chcesz pisemn¹ gwarancjê? 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_06"); //Na ile?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_07"); //Powinieneœ daæ radê zabiæ t¹ broni¹... hmm... powiedzmy, ¿e stu orków. Oczywiœcie musisz regularnie zagl¹daæ do autoryzowanego kowala. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_08"); //Pewnie taki przegl¹d nie jest tani...
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_09"); //Myœlê, ¿e móg³bym daæ ci jak¹œ zni¿kê. No, ale doœæ ju¿ ¿artów. Pewnie masz du¿o do zrobienia.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_10"); //Tak, wielkie dziêki za pomoc. 
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
   description	= "Móg³byœ coœ dla mnie wykuæ?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_CanYouForgeWeapon_15_01"); //Móg³byœ coœ dla mnie wykuæ?
    AI_Output (self, other ,"DIA_Nordmarczyk_CanYouForgeWeapon_03_02"); //Nie robiê nic za darmo! Poza tym potrzebujê sk³adników i planu.

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Nordmarczyk z opuszczonej wie¿y nieopodal chaty Cavalorna wykuwa bronie. Muszê mieæ plan, sk³adniki i rudê na zap³atê.");
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
   description	= "Wykuj dla mnie broñ.";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_ForgeWeapon_15_01"); //Wykuj dla mnie broñ.
    AI_Output (self, other ,"DIA_Nordmarczyk_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end 
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//PORZ¥DNY MIECZ JEDNORÊCZNY
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//B£YSK NOCY
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//D£UGI MIECZ
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//SZTYLET ZABÓJCY
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//PA£ASZ
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
/////////////////////////////////////////
// DRO¯SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWURÊCZNY
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//ŒWIÊTY MŒCICIEL
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//////////////////////////////////////////
// NAJDRO¯SZE MIECZE
//////////////////////////////////////////
//MIECZ KRÓLEWSKI 
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOPÓR BOJOWY
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//TOPÓR WOJENNY
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORKÓW
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
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_INGREDIENTS"); //Przeczytaj dok³adnie plan. Nie masz wszystkich sk³adników!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"NON_7851_Nordmarczyk_NO_ORE_WP"); //Nie staæ ciê na moje us³ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Nordmarczyk_ForgeWeapon);
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,DIALOG_BACK,DIA_Nordmarczyk_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz bojowy (40 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz kowala (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Porz¹dny miecz jednorêczny (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"B³ysk nocy (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Szeroki miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"D³ugi miecz (50 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Sztylet zabójcy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Rapier (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pa³asz (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz rozpaczy (75 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki miecz dwurêczny (150 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Œwiêty Mœciciel (200 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Miecz królewski (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Lekki topór bojowy (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Ostrze bohatera (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Topór wojenny (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Nordmarczyk_ForgeWeapon,"Pogromca orków (300 bry³ek rudy)",DIA_Nordmarczyk_ForgeWeapon_Miecz2H5);
	};
};