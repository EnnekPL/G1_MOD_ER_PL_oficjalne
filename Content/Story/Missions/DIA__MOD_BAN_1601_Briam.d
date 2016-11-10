//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Briam_EXIT(C_INFO)
{
	npc             = BAN_1601_Briam;
	nr              = 999;
	condition		= DIA_Briam_EXIT_Condition;
	information		= DIA_Briam_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Briam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Briam_EXIT_Info()
{
	AI_Output (self, other ,"DIA_Briam_EXIT_03_01"); //Wpadnij jeszcze kiedyœ.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ -
// Dialogi ogólne, handel
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Briam_WhoYou (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Briam_WhoYou_Condition;
   information  = DIA_Briam_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Briam_WhoYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Briam_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Briam_WhoYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_02"); //Nazywam siê Briam, jestem alchemikiem. G³ównie zajmujê siê destylacj¹ gorza³ki i robieniem skrêtów.
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_03"); //Czesem jednak zdarza siê, ¿e przyrz¹dzê jak¹œ miksturê.
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_04"); //Ale to raczej rzadko. Mam tu tylko pospolite sk³adniki, sam wiesz. Kontakty z magami s¹ doœæ ograniczone.
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_05"); //Przygotwywanie u¿ywek to chyba najwa¿niejsza robota w Obozie. Bandyci lubi¹ piæ i paliæ.
    AI_Output (other, self ,"DIA_Briam_WhoYou_15_07"); //Móg³byœ nauczyæ mnie alchemii?
	AI_Output (self, other ,"DIA_Briam_WhoYou_03_08"); //Jasne! Kiedyœ terminowa³em u alchemika Constantino, ale to by³o w czasach kiedy mia³ jeszcze bujne w³osy.

	//log
	Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
	B_LogEntry			(GE_TeacherBAN,"Briam nauczy mnie alchemii. Znajdê go w jaskini w Obozie Bandytów.");
};

//========================================
//-----------------> LifeInCamp
//========================================

INSTANCE DIA_Briam_LifeInCamp (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 2;
   condition    = DIA_Briam_LifeInCamp_Condition;
   information  = DIA_Briam_LifeInCamp_Info;
   permanent	= FALSE;
   description	= "Jak ci siê tu ¿yje?";
};

FUNC INT DIA_Briam_LifeInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Briam_LifeInCamp_Info()
{
    AI_Output (other, self ,"DIA_Briam_LifeInCamp_15_01"); //Jak ci siê tu ¿yje?
    AI_Output (self, other ,"DIA_Briam_LifeInCamp_03_02"); //Nie jest Ÿle. Ka¿dy zajmuje siê swoj¹ robot¹ i nie wchodzi innym w drogê.
    AI_Output (self, other ,"DIA_Briam_LifeInCamp_03_03"); //Quentin dobrze zarz¹dza Obozem i sprawiedliwie dzieli rudê.
    AI_Output (self, other ,"DIA_Briam_LifeInCamp_03_04"); //Zobaczysz, wkrótce siê st¹d wyrwiemy i sprzedamy rudê za z³oto.
};

//========================================
//-----------------> WorkInCamp
//========================================

INSTANCE DIA_Briam_WorkInCamp (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 3;
   condition    = DIA_Briam_WorkInCamp_Condition;
   information  = DIA_Briam_WorkInCamp_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o waszej organizacji pracy.";
};

FUNC INT DIA_Briam_WorkInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Briam_LifeInCamp))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Briam_WorkInCamp_Info()
{
    AI_Output (other, self ,"DIA_Briam_WorkInCamp_15_01"); //Opowiedz mi o waszej organizacji pracy.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_03"); //To proste. Ka¿dy ma wyznaczone jakieœ zadanie.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_04"); //Wiêkszoœæ Bandytów pracuje na rzecz Obozu, a czêœæ wykonuje swoj¹ robotê na zewn¹trz.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_05"); //Dziêki temu mamy jedzenie, wódkê i przedmioty potrzebne do przetrwania
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_06"); //Od czasu do czasu przychodzi tu jakiœ wys³annik z innego obozu.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_07"); //Zazwyczaj prosz¹ nas o wykonanie jakiegoœ zadania, na które szkoda im w³asnych ludzi.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_08"); //Po prostu najmujemy siê do zleceñ, których nikt nie chce ruszyæ.
    AI_Output (other, self ,"DIA_Briam_WorkInCamp_15_09"); //Czy inne obozy wami gardz¹? Tak mam to rozumieæ?
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_10"); //Niby tak, ale czasem zarabiamy po kilka tysiêcy bry³ek. Szczególnie dobrze p³ac¹ Guru.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_11"); //Oczywiœcie, je¿eli uda nam siê prze¿yæ.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_12"); //Najczêœciej jednak wysy³amy doœwiadczonych ludzi takich jak Rocky, Doyle czy Martin. Oni wiedz¹ co robi¹.
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Briam_TRADE (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 4;
   condition    = DIA_Briam_TRADE_Condition;
   information  = DIA_Briam_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê coœ kupiæ.";
};

FUNC INT DIA_Briam_TRADE_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Briam_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Briam_TRADE_15_01"); //Chcê coœ kupiæ.
    AI_Output (self, other ,"DIA_Briam_TRADE_03_02"); //Wybierz sobie.
	
	var int know_briam_sell;
	if (know_briam_sell == false)
	{
	know_briam_sell = true;
	Log_CreateTopic	(GE_Bandit,	LOG_NOTE);
	B_LogEntry		(GE_Bandit,	"Briam handluje ró¿nymi przedmiotami zwi¹zanymi z alchemi¹. Znajdê go w jaskini w g³êbi Obozu Bandytów.");
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Briam_RAYAN (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 3;
   condition    = DIA_Briam_RAYAN_Condition;
   information  = DIA_Briam_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o œmierci Rayana?";
};

FUNC INT DIA_Briam_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Briam_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Briam_RAYAN_15_01"); //Wiesz coœ o œmierci Rayana?
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_02"); //W³aœnie mia³em iœæ pogadaæ na ten temat z Jensem. To prawda, ¿e Kereth coœ kombinuje? 
	AI_Output (other, self ,"DIA_Briam_RAYAN_15_03"); //Tak. Masz jakieœ u¿ytecznie informacje?
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_04"); //Chyba mam. Wczeœniej wydawa³y mi siê niewa¿ne, ale w œwietle tego, co siê dzieje mog¹ byæ kluczowe.
	AI_Output (other, self ,"DIA_Briam_RAYAN_15_05"); //Zamieniam siê w s³uch.
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_06"); //Widzia³em jak Kereth chowa³ do skrzyni miecz Jensa. To by³o póŸnym wieczorem. Wraca³ sk¹dœ. Na pocz¹tku myœla³em, ¿e po prostu odkupi³ tê broñ. 
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_07"); //No, ale skoro s¹ skonfliktowani...
    AI_Output (other, self ,"DIA_Briam_RAYAN_15_08"); //Wychodzi³oby na to, ¿e Kereth sam rujnuje grób swojego brata, ¿eby wykurzyæ Jensa z Obozu. 
	AI_Output (self, other ,"DIA_Briam_RAYAN_03_09"); //Kawa³ sukinsyna z niego. Lepiej szybko naprostujcie tê sprawê. 
	
	B_LogEntry     (CH1_DestroyedGrave,"Briam przedstawi³ doœæ wa¿n¹ sprawê. Twierdzi, ¿e widzia³ jak Kereth póŸn¹ noc¹ chowa do swojej skrzyni miecz Jensa.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 2
// Zadanie: Przepis na nowe ziele 
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> New weed alert
//========================================

INSTANCE DIA_Briam_NewWeedAlert (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Briam_NewWeedAlert_Condition;
   information  = DIA_Briam_NewWeedAlert_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Briam_NewWeedAlert_Condition()
{
    if (Kapitel == 2)
    && (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Briam_NewWeedAlert_Info()
{
    AI_Output (self, other ,"DIA_Briam_NewWeedAlert_03_01"); //Hej! Jak bêdziesz mia³ trochê czasu, to daj mi znaæ.
};

//========================================
//-----------------> New weed run
//========================================

INSTANCE DIA_Briam_NewWeedRun (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 2;
   condition    = DIA_Briam_NewWeedRun_Condition;
   information  = DIA_Briam_NewWeedRun_Info;
   permanent	= FALSE;
   description	= "Czego potrzebujesz?";
};

FUNC INT DIA_Briam_NewWeedRun_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_NewWeedAlert))
    && (Kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Briam_NewWeedRun_Info()
{
    AI_Output (other, self ,"DIA_Briam_NewWeedRun_15_01"); //Czego potrzebujesz?
    AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_02"); //Rozmawia³em ostatnio z moim przyjacielem z Nowego Obozu.
    AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_03"); //Nazywa siê Sharky. Mo¿liwe, ¿e go znasz.
    AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_04"); //W ka¿dym razie dowiedzia³em siê od niego, ¿e niejaki Cor Kalom opracowa³ przepis na niesamowite ziele.
    AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_05"); //Podobno skrêty s¹ perfekcyjne, jednak nie trafi³y na sprzeda¿. Kalom uzna³, ¿e bêd¹ je paliæ wy³¹cznie najwy¿si cz³onkowie Sekty.
	AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_06"); //To gówno musi nieŸle dawaæ w czaszkê, skoro elity trzymaj¹ je wy³¹cznie da siebie.
    AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_07"); //Chcia³bym, abyœ zdoby³ dla mnie ten przepis. Moglibyœmy na tym sporo zarobiæ.
    AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_08"); //Niestety nie mam pojêcia jak dotrzeæ do osoby, która ma przepis na skrêty. 
	AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_09"); //Jedyna poszlaka jak¹ mam jest fakt, ¿e Nowicjusz, który posiada recepturê zajmuje siê testowaniem magicznych substancji dla Guru. 
	AI_Output (self, other ,"DIA_Briam_NewWeedRun_03_10"); //Znasz kogoœ takiego? Có¿, jeœli nie, to bêdziesz musia³ poznaæ. 
	
	//log
    MIS_KalomsNewWeed = LOG_RUNNING;
    Log_CreateTopic     (CH2_KalomsNewWeed, LOG_MISSION);
    Log_SetTopicStatus  (CH2_KalomsNewWeed, LOG_RUNNING);
    B_LogEntry          (CH2_KalomsNewWeed,"Briam opowiedzia³ mi o nowej recepturze na skrêty opracowanej przez samego Cor Kaloma. Bandyta chce, abym zdoby³ tê recepturê. Wiem tylko, ¿e jest ona w posiadaniu pewnego Nowicjusza, który zajmuje siê testowaniem magicznych substancji dla Guru. Muszê sobie przypomnieæ, czy znam kogoœ takiego.");
	
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
	B_LogEntry          (CH2_KalomsNewWeed,"Przypomnia³em sobie! Rozmawia³em kiedyœ na ten temat z Nowicjuszem Joru.");
	};
};

//========================================
//-----------------> DobraRobota
//========================================

INSTANCE DIA_Jens_DobraRobota (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_DobraRobota_Condition;
   information  = DIA_Jens_DobraRobota_Info;
   permanent	= FALSE;
   description	= "Mam recepturê.";
};

FUNC INT DIA_Jens_DobraRobota_Condition()
{
    if (Npc_HasItems (other, ItMis_RecipeSlepperBreath) >=1)
    && (MIS_KalomsNewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_DobraRobota_Info()
{
    AI_Output (other, self ,"DIA_Jens_DobraRobota_15_01"); //Mam recepturê.
    AI_Output (self, other ,"DIA_Jens_DobraRobota_03_02"); //Poka¿ mi j¹!
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Jens_DobraRobota_03_03"); //Hmm... Interesuj¹ce. Spróbujmy ukrêciæ trochê rudy z tego przepisu.
    AI_Output (other, self ,"DIA_Jens_DobraRobota_15_04"); //Co z moj¹ dzia³k¹?
    AI_Output (self, other ,"DIA_Jens_DobraRobota_03_05"); //Trzymaj. Zas³u¿y³eœ.
	//log
    B_LogEntry                     (CH2_KalomsNewWeed,"Briam otrzyma³ recepturê, a ja swoj¹ dolê za wykonanie zadania.");
	//experience
    B_GiveXP (XP_PrzepisNaZiolo);
	CreateInvItems (self, itminugget, 150);
    B_GiveInvItems (self, other, itminugget, 150);
	B_GiveInvItems (hero, self, ItMis_RecipeSlepperBreath, 1);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 2
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ 4
// W¹tek g³ówny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FreePotions
//========================================

INSTANCE DIA_Bandyta_FreePotions (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Bandyta_FreePotions_Condition;
   information  = DIA_Bandyta_FreePotions_Info;
   permanent	= FALSE;
   description	= "Quentin przys³a³ mnie po eliksiry.";
};

FUNC INT DIA_Bandyta_FreePotions_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_FreePotions_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FreePotions_15_01"); //Quentin przys³a³ mnie po eliksiry.
    AI_Output (self, other ,"DIA_Bandyta_FreePotions_03_02"); //Mam tu coœ dla ciebie. Powodzenia.
	//log
	B_LogEntry     (CH4_NewDanger,"Wzi¹³em od Briama eliksiry.");
	//items
	B_GiveInvItems (self,hero, ItFo_Potion_Health_02, 5);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ -
// Nauka alchemii
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_Bandyta_KnowsAlchemy2 (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_02"); //No dobrze. Nauczê ciê warzyæ proste mikstury i alkohole, oraz przygotowywaæ tytoñ.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_05"); //Szczególnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_06"); //Podstawowe mo¿esz próbowaæ uwarzyæ sam.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_07"); //Kieruj siê zdrowym rozs¹dkiem i b¹dŸ spokojny.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_08"); //Ostro¿nie dawkuj sk³adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_Bandyta_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_09"); //Nie mogê ciê tego nauczyæ.
	DIA_Bandyta_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_Bandyta_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_L2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_L2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_L2_15_01"); //Naucz mnie z³o¿onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_02"); //Aby przyrz¹dziæ trudniejsze mikstury bêdziesz potrzebowa³ przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_03"); //Nigdy nie próbuj sam wytwarzaæ silnych mikstur. Wielu alchemików przyp³aci³o to ¿yciem.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_04"); //Wa¿ne s¹ tutaj sk³adniki. To z czym bêdziesz mia³ do czynienia to nie byle ziele - to swoiste pok³ady magicznej energii drzemi¹cej w liœciach i ³odygach.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiejêtnoœci¹ syntezy tej energii.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury bêdziesz móg³ ulepszyæ.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj¹cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_08"); //To tyle. B¹dŸ ostro¿ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Postêp w umiejêtnoœci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_Bandyta_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_09"); //Nie mogê ciê tego nauczyæ.
	DIA_Bandyta_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia³ -
// Stuff
///////////////////////////////////////////////////////////////////////////////////////////



/*
//========================================
//-----------------> Odtrutka
//========================================

INSTANCE DIA_Bandyta_Odtrutka (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Bandyta_Odtrutka_Condition;
   information  = DIA_Bandyta_Odtrutka_Info;
   permanent	= FALSE;
   description	= "Potrzebujê odtrutki.";
};

FUNC INT DIA_Bandyta_Odtrutka_Condition()
{
    if (MIS_lekiDlaAva == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Odtrutka_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_01"); //Potrzebujê odtrutki.
    AI_Output (self, other ,"DIA_Bandyta_Odtrutka_03_02"); //A co siê sta³o?
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_03"); //Jeden z ³owców Poszukiwaczy zosta³ trafiony truj¹cym be³tem.
    AI_Output (other, self ,"DIA_Bandyta_Odtrutka_15_04"); //Umrze, je¿eli mu nie pomogê.
    AI_Output (self, other ,"DIA_Bandyta_Odtrutka_03_05"); //Móg³bym ci uwarzyæ tê miksturê, ale potrzebujê przepisu.
    B_LogEntry                     (CH1_lekiDlaAva,"Briam uwarzy dla mnie miksturê je¿eli przyniosê mu recepturê.");
};

//========================================
//-----------------> Rezepte
//========================================

INSTANCE DIA_Bandyta_Rezepte (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 2;
   condition    = DIA_Bandyta_Rezepte_Condition;
   information  = DIA_Bandyta_Rezepte_Info;
   permanent	= FALSE;
   description	= "Mam recepturê.";
};

FUNC INT DIA_Bandyta_Rezepte_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Odtrutka))
    && (Npc_HasItems (other, Receptura_LekAva) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_Rezepte_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Rezepte_15_01"); //Mam recepturê.
    AI_Output (self, other ,"DIA_Bandyta_Rezepte_03_02"); //Dobra. Daj mi j¹. Zaraz ci przyrz¹dzê.
    B_LogEntry                     (CH1_lekiDlaAva,"Przynios³em recepturê Briamowi. Zaraz dostanê miksturê.");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveLeki
//========================================

INSTANCE DIA_Bandyta_GiveLeki (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 3;
   condition    = DIA_Bandyta_GiveLeki_Condition;
   information  = DIA_Bandyta_GiveLeki_Info;
   permanent	= FALSE;
   description	= "Daj mi to lekarstwo.";
};

FUNC INT DIA_Bandyta_GiveLeki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_Rezepte))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_GiveLeki_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_GiveLeki_15_01"); //Daj mi to lekarstwo.
    AI_Output (self, other ,"DIA_Bandyta_GiveLeki_03_02"); //Oto ono.
    AI_Output (self, other ,"DIA_Bandyta_GiveLeki_03_03"); //Powodzenia.
    CreateInvItems (self, LekAva, 1);
    B_GiveInvItems (self, other, LekAva, 1);
    AI_StopProcessInfos	(self);
};
*/