//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Quentin_EXIT(C_INFO)
{
	npc             = BAN_1610_Quentin;
	nr              = 999;
	condition	= DIA_Quentin_EXIT_Condition;
	information	= DIA_Quentin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Quentin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Quentin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Dialogi poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WLADZA
//========================================

INSTANCE DIA_Quentin_WLADZA (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_WLADZA_Condition;
   information  = DIA_Quentin_WLADZA_Info;
   permanent	= FALSE;
   description	= "Ty tu rz�dzisz?";
};

FUNC INT DIA_Quentin_WLADZA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Quentin_WLADZA_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_01"); //Ty tu rz�dzisz?
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_02"); //Wchodzisz tak po prostu do mojego Obozu i pytasz mnie czy tu rz�dz�, tak?
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_03"); //Jakby nie patrze�... to tak. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_04"); //Powiedzia�bym, �e jeste� cholernie bezczelny...
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_05"); //...albo odwa�ny.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_06"); //Nie... bezczelny. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_07"); //Powiem ci tylko, �e nazywam si� Quentin i dowodz� w tym Obozie.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_08"); //Tyle informacji powinno ci wystarczy�.
};

var int log_Quenfight;
//========================================
//-----------------> KnowsNauka
//========================================

INSTANCE DIA_Quentin_KnowsNauka (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 777;
   condition    = DIA_Quentin_KnowsNauka_Condition;
   information  = DIA_Quentin_KnowsNauka_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Quentin_KnowsNauka_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Quentin_KnowsNauka_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KnowsNauka_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Quentin_KnowsNauka_03_02"); //Mog� ci� nauczy� walki broni� jednor�czn�. Oczywi�cie nie za darmo. No i musisz te� nale�e� do Bandy.

	if (log_Quenfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Gdy zostan� Bandyt�, Quentin za kilka bry�ek rudy nauczy mnie walki jednor�cznym or�em.");
		log_Quenfight = TRUE;
	};
	};

/*
//========================================
//-----------------> HELPXD
//========================================

INSTANCE DIA_Quentin_HELPXD (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 10;
   condition    = DIA_Quentin_HELPXD_Condition;
   information  = DIA_Quentin_HELPXD_Info;
   permanent	= TRUE;
   description	= "Kto mo�e mi pom�c?";
};

FUNC INT DIA_Quentin_HELPXD_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELPXD_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELPXD_15_01"); //Kto mo�e mi pom�c?
    AI_Output (self, other ,"DIA_Quentin_HELPXD_03_02"); //Popytaj szwendaj�cych si� po Obozie Bandyt�w. Z ch�ci� wybior� si� na polowanie.
};
*/

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> DRAX
//========================================

INSTANCE DIA_Quentin_DOOBOZU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_DRAX_Condition;
   information  = DIA_Quentin_DRAX_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Drax.";
};

FUNC INT DIA_Quentin_DRAX_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_HasItems (other, itmi_joshpocket) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_DRAX_Info()
{
    AI_Output (other, self ,"DIA_Quentin_DRAX_15_01"); //Przysy�a mnie Drax. Uzna� mnie za Bandyt� i pokaza� drog� do Obozu. Udowodni�em swoj� lojalno�� wykonuj�c dla niego zadania.
    AI_Output (self, other ,"DIA_Quentin_DRAX_03_02"); //Co? Drax przyj�� kogo� nowego bez mojej wiedzy?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_03"); //Powiedzia�, �e zas�uguj� na wasze zaufanie. Kaza� mi si� zg�osi� po rynsztunek. Jestem gotowy do pracy.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_04"); //Nie m�g� mnie tu przyprowadzi� od razu. W ko�cu wasz Ob�z jest ukryty. 
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_05"); //Kaza� ci co� przekaza�?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_06"); //C�, wydarzy�o si� kilka interesuj�cych rzeczy...
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_07"); //M�w, wszystko mo�e mie� znaczenie.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_08"); //Stra�nikom prawie uda�o si� ustali� miejsce po�o�enia waszego Obozu. Niejaki Trip sporz�dzi� notatk� na ten temat. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_09"); //Na jej podstawie Kopacz Graham rozrysowa� potencjaln� map�, kt�ra trafi�a w r�ce Stra�nik�w z placu wymian. Chcieli j� wykorzysta� do planowania obrony.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_10"); //Zdoby�em obydwa te dokumenty. S� teraz w r�kach Draxa. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_11"); //Jeden z waszych ludzi, niejaki Skaza mia� powa�ne problemy w Starym Obozie. Tamtejsi Cienie chcieli go wygry��. Dzi�ki mojej drobnej pomocy stali si� nieszkodliwi. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_12"); //W zamian otrzyma�em od Skazy raport. Stra�nicy �wi�tynni pomagaj� ludziom Gomeza zabija� pe�zacze w Starej Kopalni. Szukaja tam czego� zwi�zanego z ich chor� religi�.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_13"); //Josh nie �yje. Ian dowiedzia� si� o jego machlojkach i kaza� go zabi�. Zanim go pojmali uda�o mi si� odnale�� rud�, kt�r� zdoby� do tej pory. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_14"); //Jest tego 450 bry�ek rudy. By�o wi�cej, ale pewien Kopacz wszed� w posiadanie tej sakwy i wykorzysta� cz�� rudy. Go�� ju� gryzie piach. Oto sakiewka.
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_15"); //Do��, wystarczy... Jestem pod olbrzymim wra�eniem. Drax podj�� dobr� decyzj�. Daj mi chwil� pomy�le�. Musimy podj�� odpowiednie dzia�ania.
	
	
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Uda�o mi dosta� si� do Quentina. Zanim zostan� przyj�ty, musz� wykona� kilka zada� i przy okazji poprawi� swoj� opini� w Obozie.");
};

//========================================
//-----------------> JensIsKiller
//========================================

INSTANCE DIA_Quentin_JensIsKiller (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 10;
   condition    = DIA_Quentin_JensIsKiller_Condition;
   information  = DIA_Quentin_JensIsKiller_Info;
   permanent	= TRUE;
   description	= "Jens jest zab�jc�.";
};

FUNC INT DIA_Quentin_JensIsKiller_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_TalkWithJens)) && (JensIsVictimOfKereth)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_JensIsKiller_Info()
{
    AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_01"); //Jens jest zab�jc�.
    AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_02"); //O czym ty do cholery m�wisz?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_03"); //Pomog�em ustali� Kerethowi kto zabi� jego brata. Okaza�o si�, �e to Jens.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_04"); //Sk�adasz do�� powa�ne oskar�enia. Musisz mie� wi�c twarde dowody. Hmm?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_05"); //Na miejscu zbrodni i w pobli�u regularnie niszczonego grobu znalaz�em od�amki miecza, kt�ry Pun sprzeda� kiedy� Jensowi.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_06"); //Ostrze pokruszy�o si�, gdy Jens niszczy� gr�b. Zrobi� to, bo ma na pie�ku z Kerethem...
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_07"); //Tak si� sk�ada, �e przed chwil� rozmawia�em z Jensem. Przedstawi� mi sw�j punkt widzenia.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_08"); //Pewnie powiedzia� ci, �e kto� mu ukrad� miecz. Zgad�em? 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_09"); //Dok�adnie to powiedzia�.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_10"); //Wierzysz w to?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_11"); //A niby dlaczego mia�bym nie wierzy�? Kereth to niez�y kr�tacz i wszyscy w Obozie dobrze o tym wiedz�.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_12"); //My�l�, �e tym razem Kereth ma racj�.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_13"); //I niestety si� mylisz... Jens przedstawi� kilka innych dowod�w. Mianowicie, zar�wno Doyle jak i jego zmiennik po�wiadczyli, �e Jens nie opuszcza� obozu w dniach, w kt�rych dokonano zbezczeszczenia grobu. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_14"); //Po drugie, Smith stwierdzi�, �e w przeddzie� zab�jstwa by� u niego Jens i prosi� o pomoc w odszukaniu miecza. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_15"); //Po trzecie, Briam widzia� jak Kereth chowa miecz Jensa do swojej skrzyni uprzednio oczyszczaj�c go z ziemi. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_16"); //To by�a zwyczajna intryga, ch�opcze. Po prostu da�e� si� oszuka�. Jeste� m�ody, wi�c pewnie nie pierwszy i nie ostatni raz. 
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_17"); //W takim razie kto zabi� Rayana?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_18"); //Nie mam poj�cia. Pewnie nigdy si� tego nie dowiemy. 
	
	MIS_DestroyedGrave = LOG_FAILED;

    Log_SetTopicStatus       (CH1_DestroyedGrave, LOG_FAILED);
    B_LogEntry               (CH1_DestroyedGrave,"Okaza�o si�, �e zosta�em oszukany przez Keretha. Jens by� niewinny i Quentin przedstawi� mi na to dowody. Kereth porpostu chcia� si� pozby� Jensa z obozu i najpewniej zaj�� jego stanowisko. Chyba policz� si� z tym oszustem.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Przy��czenie do obozu
///////////////////////////////////////////////////////////////////////////////////////////
/*
//========================================
//-----------------> DOOBOZU
//========================================

INSTANCE DIA_Quentin_DOOBOZU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 7;
   condition    = DIA_Quentin_DOOBOZU_Condition;
   information  = DIA_Quentin_DOOBOZU_Info;
   permanent	= FALSE;
   description	= "Co z moim przyj�ciem?";
};

FUNC INT DIA_Quentin_DOOBOZU_Condition()
{
	//DIA_Quentin_OreInMineITD probably doesn't work
	if ((Npc_KnowsInfo (hero, DIA_Quentin_OreInMineITD)) || (MIS_OreInOM == LOG_SUCCESS)) && (Npc_GetTrueGuild(other) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_DOOBOZU_Info()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_15_01"); //Co z moim przyj�ciem?
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_02"); //Odwali�e� od cholery dobrej roboty.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_03"); //Witaj w�r�d Bandyt�w...
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_04"); //Mi�o ci� mie� po swojej stronie.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_07"); //Pami�taj: do��czaj�c do Bandyt�w, stajesz si� nowym cz�owiekiem.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_08"); //Przesz�o�� si� nie liczy. Szczeg�lnie w tych czasach i w tym miejscu.
	
	//guild and quest status
	hero.guild = GIL_BAU;
	Npc_SetTrueGuild (hero,GIL_BAU);
	//HeroJoinToBAN ();
    B_LogEntry                     (CH1_BANDITOS_CAMP,"Od teraz jestem Bandyt�! Czekaj� na mnie nowe wyzwania.");
    Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_SUCCESS);
    MIS_BANDITOS_CAMP = LOG_SUCCESS;
	//esperience
    B_GiveXP (XP_HeroJoinToBandit);
	//logs other quests
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,	"Bandyta nie mo�e do��czy� do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry			(CH1_JoinPsi,	"Bractwo b�dzie musia�o radzi� sobie beze mnie. Od dzi� moim domem jest Ob�z Bandyt�w!");
		
		Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinNC,	"Lares b�dzie musia� o mnie zapomnie�.");
		
		Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_EasyJoinOC,	"Zosta�em Bandyt�. Nic nie wysz�o z mojego u�atwionego przyj�cia do Starego Obozu.");
	};

 /*   AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_09"); //Wi�c, jak chcesz si� nazywa�?

    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Wo�ajcie na mnie Ostrze.", DIA_Quentin_DOOBOZU_BLADE);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Chc� nazywa� si� Rozpruwacz.", DIA_Quentin_DOOBOZU_ROZPRUWACZ);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Drag.", DIA_Quentin_DOOBOZU_DRAG);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Them.", DIA_Quentin_DOOBOZU_THEM);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Dorlas.", DIA_Quentin_DOOBOZU_DORLAS);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Ragnir.", DIA_Quentin_DOOBOZU_RAGNIR);
};

FUNC VOID DIA_Quentin_DOOBOZU_BLADE()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_BLADE_15_01"); //Wo�ajcie na mnie Ostrze.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BLADE_03_02"); //Rozumiem, �e chcesz posi��� wiedze dotycz�c� walki mieczem.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BLADE_03_03"); //Niechaj tak bedzie. Od dzisiaj w bandzie mamy nowego cz�owieka - Ostrze.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_ROZPRUWACZ()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_ROZPRUWACZ_15_01"); //Chc� nazywa� si� Rozpruwacz.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_ROZPRUWACZ_03_02"); //Nie wygl�dasz na tak� bestie.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_ROZPRUWACZ_15_03"); //Witaj w bandzie - Rozpruwaczu.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_DRAG()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_DRAG_15_01"); //Drag.
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_DRAG_15_02"); //Mo�emy nie rozmysla� nad znaczeniami imienia?
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_DRAG_03_03"); //Kr�tkie i proste. Dobry wyb�r.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_DRAG_03_04"); //Witaj w�r�d Bandyt�w Drag.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_THEM()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_THEM_15_01"); //Them.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_THEM_03_02"); //Witaj w�r�d Bandyt�w - Them.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_DORLAS()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_DORLAS_15_01"); //Dorlas.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_DORLAS_03_02"); //Od teraz jeste� jednym z nas, Dorlasie.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_RAGNIR()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_RAGNIR_15_01"); //Ragnir.

    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_RAGNIR_03_02"); //Jeste� teraz jednym z Bandyt�w, Ragnir. Tak b�dziemy ci� nazywa�.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);   
};

*/

//========================================
//-----------------> EQ1
//========================================

INSTANCE DIA_Quentin_EQ1 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 8;
   condition    = DIA_Quentin_EQ1_Condition;
   information  = DIA_Quentin_EQ1_Info;
   permanent	= FALSE;
   description	= "Czy dostan� bro� i pancerz?";
};

FUNC INT DIA_Quentin_EQ1_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_EQ1_Info()
{
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_01"); //Czy dostan� bro� i pancerz? 
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_02"); //Tak. Prosz�, oto one.
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_03"); //To jedyna bro� jak� ci fundujemy. Na lepszy or� b�dziesz musia� sam sobie zapracowa�. Pami�taj, �e z czasem musisz go zmienia�.
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_04"); //Dzi�ki. Na pewno nie zapomn�.
    CreateInvItems (self, ItMw_1H_Mace_03, 1);
    B_GiveInvItems (self, other, ItMw_1H_Mace_03, 1);
    CreateInvItems (self, BAU_ARMOR_L, 1);
    B_GiveInvItems (self, other, BAU_ARMOR_L, 1);
	AI_EquipBestArmor	(hero); 
};

//========================================
//-----------------> EQ2
//========================================

INSTANCE DIA_Quentin_EQ2 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 8;
   condition    = DIA_Quentin_EQ2_Condition;
   information  = DIA_Quentin_EQ2_Info;
   permanent	= 1;
   description	= "Potrzebuj� lepszego pancerza.";
};

FUNC INT DIA_Quentin_EQ2_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_EQ2_Info()
{
    AI_Output (other, self ,"DIA_Quentin_EQ2_15_01"); //Potrzebuj� lepszego pancerza.
	if (kapitel >= 3)
	{
	if (Npc_HasItems (hero, ItMiNugget)>=1800)
	{
    AI_Output (self, other ,"DIA_Quentin_EQ2_03_02"); //To dobry pancerz. Zas�u�y�e� na niego.
    B_GiveInvItems (hero, self, ItMiNugget, 1800);
    CreateInvItems (self, BAU_ARMOR_M, 1);
    B_GiveInvItems (self, other, BAU_ARMOR_M, 1);
	AI_EquipBestArmor	(hero); 
	DIA_Quentin_EQ2.permanent = 0;
	}
	else
	{
	 AI_Output (self, other ,"DIA_Quentin_EQ2_03_03"); //Taki pancerz to nie byle co. Kosztuje 1800 bry�ek rudy. 
	 DIA_Quentin_EQ2.permanent = 1;
	};
	
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_EQ2_03_04"); //Nie zas�u�y�e� jeszcze na ten pancerz.
	DIA_Quentin_EQ2.permanent = 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Zadania dla bandyty
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> QUEST4
//========================================

INSTANCE DIA_Quentin_QUEST4 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 9;
   condition    = DIA_Quentin_QUEST4_Condition;
   information  = DIA_Quentin_QUEST4_Info;
   permanent	= FALSE;
   description	= "Co mam teraz robi�?";
};

FUNC INT DIA_Quentin_QUEST4_Condition()
{
   if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_QUEST4_Info()
{
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_01"); //Co mam teraz robi�?
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_02"); //Chyba b�dziemy musieli zaj�� si� tym Bractwem. Ta sprawa jest niepokoj�ca. Ale zanim porz�dnie we�miemy si� do roboty, to popracujesz troch� tutaj.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_03"); //Powiedzia�e�, �e Stra�nicy z placu wymian chcieli wykorzysta� map� od tego Grahama do zaplanowania obrony... Dobrze, zobaczymy jak im to posz�o.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_04"); //Id� do Doyla. P�jdziecie razem na plac wymian i podenerwujecie ludzi Gomeza. Rabuj�c, przegl�daj skrzynie i zwa�aj na wszelkie dokumenty jakie w nich znajdziesz. 
	AI_Output (self, other ,"DIA_Quentin_QUEST4_03_05"); //Je�li co� znajdziesz, przynie� do mnie. Zapami�tasz?
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_06"); //Jasne.

    MIS_Rozpierdol1 = LOG_RUNNING;

    Log_CreateTopic          (CH1_Rozpierdol1, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_RUNNING);
    B_LogEntry               (CH1_Rozpierdol1,"Razem z Doylem wybieramy si� na plac wymian, �eby podenerwowa� ludzi Gomeza. Doyle'a znajd� przy bramie do Obozu Bandyt�w. Podczas rabunku mam szuka� dokument�w, kt�re mog� le�e� w skrzyniach b�d� przy Stra�nikach.");
	
	backDoyle1 = true;
};

//========================================
//-----------------> UKONCZONE
//========================================

INSTANCE DIA_Quentin_UKONCZONE (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 12;
   condition    = DIA_Quentin_UKONCZONE_Condition;
   information  = DIA_Quentin_UKONCZONE_Info;
   permanent	= false;
   description	= "Byli�my z Doyle'm na placu wymian.";
};

FUNC INT DIA_Quentin_UKONCZONE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_SPADAMY)) && (MIS_Rozpierdol1 == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_UKONCZONE_Info()
{
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_01"); //Byli�my z Doyle'm na placu wymian.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_02"); //To �wietnie! Jak posz�o? Znalaz�e� dokumenty?
	if (Npc_HasItems (other, itmi_plac_doc1) >=1) && (Npc_HasItems (other, itmi_plac_doc2) >=1) && (Npc_HasItems (other, itmi_plac_doc3) >=1) 
	&& (Npc_HasItems (other, itmi_plac_doc4) >=1)
	{
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_03"); //Tak, we� je. Co teraz mam robi�?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_04"); //Wys�a�em ju� jednego z naszych do Bractwa jako szpiega.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_05"); //Powinien wkr�tce wr�ci�. Tymczasem mam dla ciebie jeszcze jedno zadanie.
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_06"); //Co tym razem?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_07"); //Podobno Gomez wysy�a jaki� transport do Starej Kopalni.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_08"); //My�l�, �e to dobra okazja na atak.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_09"); //Rocky zajmuje si� t� akcj�. Id� do niego i powiedz, �e kaza�em ci mu pom�c.
	DIA_Quentin_UKONCZONE.permanent = false;
	MIS_Rozpierdol2 = LOG_RUNNING;
	Log_CreateTopic          (CH1_Rozpierdol2, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Rozpierdol2, LOG_RUNNING);
    B_LogEntry               (CH1_Rozpierdol2,"Tym razem musz� i�� do Rockiego z kt�rym mam zaatakowa� konw�j ze Starego Obozu. Rocky mieszka w tej samej chacie co Quentin.");
	
	B_LogEntry               (CH1_Rozpierdol1,"Poinformowa�em Quentina o pomy�lnie przeprowadzonym ataku i odda�em mu dokumenty.");
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_SUCCESS);
    MIS_Rozpierdol1 = LOG_SUCCESS;
	B_GiveInvItems (other, self,itmi_plac_doc1,1);
	B_GiveInvItems (other, self,itmi_plac_doc2,1);
	B_GiveInvItems (other, self,itmi_plac_doc3,1);
	B_GiveInvItems (other, self,itmi_plac_doc4,1);
	}
	else
	{
	AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_10"); //Wiesz, nie jestem jeszcze pewien. Poszukam jeszcze.
	DIA_Quentin_UKONCZONE.permanent = true;
	};
    //AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POATAKU
//========================================

INSTANCE DIA_Quentin_POATAKU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 13;
   condition    = DIA_Quentin_POATAKU_Condition;
   information  = DIA_Quentin_POATAKU_Info;
   permanent	= FALSE;
   description	= "Zaatakowali�my konw�j.";
};

FUNC INT DIA_Quentin_POATAKU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_WIN_O)) && (Npc_HasItems (hero, eq_z_napadu1) >=1) && (Npc_HasItems (hero, eq_z_napadu2) >=1) && (Npc_HasItems (hero, eq_z_napadu3) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_POATAKU_Info()
{
    AI_Output (other, self ,"DIA_Quentin_POATAKU_15_01"); //Zaatakowali�my konw�j.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_02"); //�wietnie. Rozumiem, �e wam si� uda�o.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_03"); //Zajm� si� ekwipunkiem. Przesortuj� go i oddam Martinowi. 
	B_LogEntry                     (CH1_Rozpierdol2,"Quentin by� bardzo zadowolony z naszych osi�gni��. Przyj�� ode mnie rzeczy z dostawy do Starej Kopalni.");	
	MIS_Rozpierdol2 = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_Rozpierdol2, LOG_SUCCESS);
	B_GiveInvItems (other, self, eq_z_napadu1, 1);
	B_GiveInvItems (other, self, eq_z_napadu2, 1);
	B_GiveInvItems (other, self, eq_z_napadu3, 1);
	/*if (Npc_HasItems (hero, eq_z_napadu1) >=1)
	{
	B_GiveInvItems (other, self, eq_z_napadu1, 1);
	}
	else if (Npc_HasItems (other, ItFoLoaf) >=20) && (Npc_HasItems (other, ItFoApple) >=30) && (Npc_HasItems (other, ItFoCheese) >=10)
	{
	B_GiveInvItems (other, self, ItFoLoaf, 20);
	B_GiveInvItems (other, self, ItFoApple, 30);
	B_GiveInvItems (other, self, ItFoCheese, 10);
	};
	if (Npc_HasItems (other, eq_z_napadu2) >=1)
	{
	B_GiveInvItems (other, self, eq_z_napadu2, 1);
	}
	else if (Npc_HasItems (other, ItMiScoop) >=1) && (Npc_HasItems (other, ItMiBrush) >=1) && (Npc_HasItems (other, ItMwPickaxe) >=5) && (Npc_HasItems (other, ItMiHammer) >=3)
	{
	B_GiveInvItems (other, self, ItMiScoop, 1);
	B_GiveInvItems (other, self, ItMiBrush, 1);
	B_GiveInvItems (other, self, ItMwPickaxe, 5);
	B_GiveInvItems (other, self, ItMiHammer, 3);
	};
	var int eq3_many;
	eq3_many = 
	if (Npc_HasItems (other, eq_z_napadu3) >=1)
	{
	B_GiveInvItems (other, self, eq_z_napadu3, 1);
	}
	else if (Npc_HasItems (other, ItMiJoint_1) >=10) && (Npc_HasItems (other, ItMiJoint_2) >=10) && (Npc_HasItems (other, ItMiJoint_3) >=10) 
	{
	B_GiveInvItems (other, self, ItMiJoint_1, 10);
	B_GiveInvItems (other, self, ItMiJoint_2, 10);
	B_GiveInvItems (other, self, ItMiJoint_3, 10);
	};*/
	};
	
//========================================
//-----------------> QUEST5
//========================================

INSTANCE DIA_Quentin_QUEST5 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 11;
   condition    = DIA_Quentin_QUEST5_Condition;
   information  = DIA_Quentin_QUEST5_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jeszcze jakie� zadanie?";
};

FUNC INT DIA_Quentin_QUEST5_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_QUEST5_Info()
{
    AI_Output (other, self ,"DIA_Quentin_QUEST5_15_01"); //Masz dla mnie jeszcze jakie� zadanie?
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_02"); //Wiesz przecie�, �e zawsze co� si� znajdzie...
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_03"); //Ostatnio wys�ali�my kilku Bandyt�w po dostaw� z Nowego Obozu, jednak do dzi� nie wr�cili.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_04"); //Przypuszczam, �e schowali si� w jakiej� jaskini z towarem i ani my�l� wraca�.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_05"); //Znajd� ich i przynie� stal, kt�ra nie�li. By�o tego ze 30 pr�t�w. 
    MIS_BanditCave = LOG_RUNNING;

    Log_CreateTopic          (CH1_BanditCave, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BanditCave, LOG_RUNNING);
    B_LogEntry               (CH1_BanditCave,"Quentin kaza� mi znale�� Bandyt�w, kt�rzy mieli przynie�� dostaw� stali z Nowego Obozu.");
};

//========================================
//-----------------> FindIron
//========================================

INSTANCE DIA_Quentin_FindIron (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_FindIron_Condition;
   information  = DIA_Quentin_FindIron_Info;
   permanent	= FALSE;
   description	= "Znalaz�em stal.";
};

FUNC INT DIA_Quentin_FindIron_Condition()
{
    if (Npc_HasItems (other, ItQt_IronPack) >=1) && (MIS_BanditCave == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_FindIron_Info()
{
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_01"); //Znalaz�em stal.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_02"); //By�o tak, jak my�la�e�.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_03"); //Ukryli si� w jaskini przy Nowym Obozie, a stal zamkn�li w skrzyni.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_04"); //Daj mi t� stal.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_05"); //Dobra robota.
    B_GiveInvItems (other, self, ItQt_IronPack, 1);
	
    B_LogEntry               (CH1_BanditCave,"Znalezion� w skrzyni stal przynios�em Quentinowi.");
    Log_SetTopicStatus       (CH1_BanditCave, LOG_SUCCESS);
    MIS_BanditCave = LOG_SUCCESS;

    B_GiveXP (XP_DostawaDoNO);
};

//========================================
//-----------------> SzpeszialQuest
//========================================

INSTANCE DIA_Quentin_SzpeszialQuest (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_SzpeszialQuest_Condition;
   information  = DIA_Quentin_SzpeszialQuest_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� specjalne zadanie?";
};

FUNC INT DIA_Quentin_SzpeszialQuest_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_SzpeszialQuest_Info()
{
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_01"); //Masz dla mnie jakie� specjalne zadanie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_02"); //Jest co� takiego.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_03"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_04"); //Magnaci s� w posiadaniu kilku pier�cieni. Pono� te pier�cienie maj� magiczn� moc.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_05"); //Ale nie obchodzi mnie to. Wiem, �e s� bardzo cenne. 
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_06"); //Ci idioci ze Starego Obozu sporo nam za nie zap�ac�.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_07"); //Mam ukra�� pier�cienie i przynie�� je do ciebie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_08"); //Tak. Pogadaj z Miguelem. To nasz cz�owiek w Obozie. Znajdziesz go na targowisku.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_09"); //Go�� zna Stary Ob�z jak w�asn� kiesze�.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_10"); //Dobra. Postaram si� przynie�� ci te pier�cienie jak najszybciej.
    MIS_MagnackiePi4erscienie = LOG_RUNNING;

    Log_CreateTopic            (CH1_MagnackiePi4erscienie, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MagnackiePi4erscienie, LOG_RUNNING);
    B_LogEntry                     (CH1_MagnackiePi4erscienie,"Quentin kaza� mi odszuka� wszystkie magiczne pier�cienie nale��ce do Magnat�w. Pom�c mi w tym ma Miguel. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLORINGS
//========================================

INSTANCE DIA_Quentin_HELLORINGS (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_HELLORINGS_Condition;
   information  = DIA_Quentin_HELLORINGS_Info;
   permanent	= FALSE;
   description	= "Mam pier�cienie.";
};

FUNC INT DIA_Quentin_HELLORINGS_Condition()
{
    if (MIS_MagnackiePi4erscienie == LOG_RUNNING)
    && (Npc_HasItems (other, EBR_Ring1) >=1)
    && (Npc_HasItems (other, EBR_Ring2) >=1)
    && (Npc_HasItems (other, EBR_Ring3) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLORINGS_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_01"); //Mam pier�cienie.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_02"); //Wiedzia�em, �e ci si� uda. 
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_03"); //Te pier�cienie z pewno�ci� si� nam przydadz�.
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_04"); //Co chcesz z nimi zrobi�?
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_05"); //Mam kilka pomys��w, ale musz� to jeszcze przemy�le�.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_06"); //Tymczasem we� swoj� rud�.
    B_LogEntry                     (CH1_MagnackiePi4erscienie,"Odda�em skardzione pier�cienie Quentinowi.");
    Log_SetTopicStatus       (CH1_MagnackiePi4erscienie, LOG_SUCCESS);
    MIS_MagnackiePi4erscienie = LOG_SUCCESS;

    B_GiveXP (XP_EBR_Rings);
	B_GiveInvItems (hero,self, EBR_Ring1, 1);
	B_GiveInvItems (hero,self, EBR_Ring2, 1);
	B_GiveInvItems (hero,self, EBR_Ring3, 1);
	//PrintScreen	("3 przedmioty oddane", -1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_GIVEN);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BRACTWO1
//========================================

INSTANCE DIA_Quentin_BRACTWO1 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 14;
   condition    = DIA_Quentin_BRACTWO1_Condition;
   information  = DIA_Quentin_BRACTWO1_Info;
   permanent	= FALSE;
   description	= "Co z Bractwem?";
};

FUNC INT DIA_Quentin_BRACTWO1_Condition()
{
    if (MIS_Rozpierdol2 == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_BRACTWO1_Info()
{
    AI_Output (other, self ,"DIA_Quentin_BRACTWO1_15_01"); //Co z Bractwem?
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_02"); //Dobrze, �e mi przypomnia�e�. Szpieg powr�ci�.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_03"); //Y'Berion szuka kogo�, kto odnajdzie dla niego jaki� stary artefakt.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_04"); //Poszukuje najemnik�w, poniewa� nikt z Bractwa nie da� rady.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_05"); //Wys�ali chyba jakiego� Nowicjusza. Nuras, czy jaki� tam...
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_06"); //Ale do rzeczy. Za odnalezienie kamienia daje 2000 bry�ek rudy.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_07"); //To bardzo du�o.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_08"); //Id� do Bractwa i przyjmij t� robot�. Przy okazji b�dziesz m�g� tam pow�szy�.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_09"); //Je�eli odnajdziesz kamie� i dostaniesz nagrod�, to podzielimy si� rud�.
   /* AI_Output (other, self ,"DIA_Quentin_BRACTWO1_15_10"); //Je�eli odnajd� kamie�, to ta ruda b�dzie moja.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_11"); //Zapami�taj sobie co�, ch�opcze. Bandyci wszystkim si� dziel�.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_12"); //Pracujesz dla siebie i dla nas. Rozumiesz?
    AI_Output (other, self ,"DIA_Quentin_BRACTWO1_15_13"); //Teraz, tak.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_14"); //Wi�c id� ju�.*/
    MIS_PSIcampWORK = LOG_RUNNING;

    Log_CreateTopic          (CH1_PSIcampWORK, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PSIcampWORK, LOG_RUNNING);
    B_LogEntry               (CH1_PSIcampWORK,"Mam uda� si� do obozu na bagnie i przyj�� prac� od Y'Beriona. Chodzi o odnalezienie jakiego� kamienia. Zadanie powinno by� dziecinnie proste. Za zlecenie mam otrzyma� 2000 bry�ek rudy, kt�re zwr�c� Quentinowi.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GOLDY
//========================================

INSTANCE DIA_Quentin_GOLDY (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 15;
   condition    = DIA_Quentin_GOLDY_Condition;
   information  = DIA_Quentin_GOLDY_Info;
   permanent	= FALSE;
   description	= "Mam rud�.";
};

FUNC INT DIA_Quentin_GOLDY_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Yberion_KASADZIADU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_GOLDY_Info()
{
if (Npc_HasItems(other, ItMiNugget) >= 2000)
{
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_01"); //Mam rud�.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_02"); //Czyli uda�o ci si� wykona� zadanie?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_03"); //Tak. Odnalaz�em kamie� ogniskuj�cy.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_04"); //A ustali�e� ju� fakty?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_05"); //Pracuj� nad tym.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_06"); //Oto twoja dzia�ka.
    B_LogEntry                     (CH1_PSIcampWORK,"Odda�em rud� za zlecenie Quentinowi. Uzyska�em 500 bry�ek wynagrodzenia.");
	B_GiveXP (XP_HelpGUR);
    B_GiveInvItems (other, self, ItMiNugget, 2000);
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
	DIA_Quentin_GOLDY.permanent = false;
	} else {
	AI_Output (other, self ,"DIA_Quentin_GOLDY_15_07"); //Mam rud�. 
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_08"); //Jeste� pewien, �e jest tu tyle ile potrzeba? Chyba nie przepi�e� NASZEJ rudy?!
	DIA_Quentin_GOLDY.permanent = true;
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// R�ne dialogi
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Zdrada
//========================================

INSTANCE DIA_Quentin_Zdrada (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_Zdrada_Condition;
   information  = DIA_Quentin_Zdrada_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_Zdrada_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_HahahaSpierdalaj))
    && C_NpcBelongsToOldCamp(hero)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Zdrada_Info()
{
    AI_Output (self, other ,"DIA_Quentin_Zdrada_03_01"); //Zdradzi�e� nas. Uwierzyli�my, �e chcesz by� jednym z nas.
    AI_Output (self, other ,"DIA_Quentin_Zdrada_03_02"); //Powinni�my si� na ciebie rzuci�, ale pami�tamy co dla nas robi�e�.
    AI_Output (self, other ,"DIA_Quentin_Zdrada_03_03"); //Odejd� i ju� nigdy wi�cej si� tu nie zjawiaj.
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 2
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 3
// W�tek g��wny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO112
//========================================

INSTANCE DIA_Quentin_HELLO112 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 16;
   condition    = DIA_Quentin_HELLO112_Condition;
   information  = DIA_Quentin_HELLO112_Info;
   permanent	= FALSE;
   description	= "Ustali�em fakty!";
};

FUNC INT DIA_Quentin_HELLO112_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Asghan_SZPIEG2))
    && (Npc_KnowsInfo (hero, DIA_GorNaBar_SZPIEG))
    && (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLO112_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_01"); //By�em w Starej Kopalni. Stra�nicy dostaj� rud� w zamian za zabijanie pe�zaczy.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_02"); //Ludzie z Bractwa szukaj� u pe�zaczy czego� szczeg�lnego. 
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_03"); //Dziwnym trafem uda�o mi si� wpl�ta� w t� spraw�.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_04"); //Potrzebna by�a im silniejsza wydzielina, jednak szukali jej w z�ym miejscu.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_05"); //Podj��em si� dla Cor Kaloma odnalezienia tego czego�, tej wydzieliny.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_06"); //Przynios�em mu jaja kr�lowej pe�zaczy, o czym pewnie ju� wiesz.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_07"); //Jestem pe�en podziwu dla twoich czyn�w, ale opowiedz jeszcze o tym kontrakcie.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_08"); //Zasada by�a prosta. Za pomoc Stary Ob�z dostawa� ziele.
    //AI_Output (other, self ,"DIA_Quentin_HELLO112_15_09"); //Pewnie wi�kszo�� przepalili, a cz�� sprzedali do Nowego Obozu.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_10"); //Nie do��, �e Stra�nicy �wi�tynni pomagaj� Gomezowi w t�pieniu pe�zaczy, to jeszcze p�ac� mu za to, �e jego Stra�nicy robi� to samo.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_11"); //We� t� rud�. Spisa�e� si�. 
	//quest log
    B_LogEntry               (CH1_PSIcampWORK,"Zda�em szczeg�owy raport Quentinowi. Wydaj� mi si� jednak, �e to jeszcze nie koniec zawirowa� zwi�zanych z Bractwem i Starym Obozem..");
    Log_SetTopicStatus       (CH1_PSIcampWORK, LOG_SUCCESS);
    MIS_PSIcampWORK = LOG_SUCCESS;
	//prize
	B_GiveInvItems (other, self, ItMiNugget, 155);
    CreateInvItems (self, ItMiNugget, 155);
    B_GiveXP (XP_JobInOldMine);
};

//========================================
//-----------------> LOSY
//========================================

INSTANCE DIA_Quentin_LOSY (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 17;
   condition    = DIA_Quentin_LOSY_Condition;
   information  = DIA_Quentin_LOSY_Info;
   permanent	= FALSE;
   description	= "Co dalej z Bandytami?";
};

FUNC INT DIA_Quentin_LOSY_Condition()
{
    if (MIS_PSIcampWORK == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_LOSY_Info()
{
    AI_Output (other, self ,"DIA_Quentin_LOSY_15_01"); //Co dalej z Bandytami?
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_02"); //Nie wiem, ch�opcze. Ostatnie wydarzenia nape�ni�y mnie niepokojem. Obawiam si� o to, co dzieje si� w Bractwie.
	
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_03"); //C�, pozostaje nam czeka� na rozw�j wydarze�.
   /* AI_Output (other, self ,"DIA_Quentin_LOSY_15_04"); //Tak wi�c zrobimy, a nawet cho�by Gomez przyby� pod Ob�z to stawimy mu op�r.
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_05"); //Tego si� w�a�nie obawiam...*/
};

//========================================
//-----------------> BractwoNews
//========================================

INSTANCE DIA_Quentin_BractwoNews (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 34;
   condition    = DIA_Quentin_BractwoNews_Condition;
   information  = DIA_Quentin_BractwoNews_Info;
   permanent	= FALSE;
   description	= "Przynosz� wie�ci z Bractwa.";
};

FUNC INT DIA_Quentin_BractwoNews_Condition()
{
    if (Npc_KnowsInfo (hero, Info_CorAngar_FindHerb_Success))
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_BractwoNews_Info()
{
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_01"); //Przynosz� wie�ci z Bractwa.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_02"); //Co si� tam dzieje? D�ugo ci� nie by�o.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_03"); //Y'Berion nie �yje. Zgin�� podczas pr�by przywo�ania �ni�cego.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_04"); //Cor Angar dowodzi teraz Bractwem. Mam uda� si� do Nowego Obozu i za wszelk� cen� pom�c Magom Wody.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_05"); //Ta ca�a sytuacja zaczyna mnie niepokoi�. Czy�by ucieczka z tej piekielnej krainy by�a ju� blisko?
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_06"); //Nie mam poj�cia, ale b�d� si� stara� aby�my uciekli st�d jak najpr�dzej.
	//experience
    B_GiveXP (XP_YBerionDeath);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Quentin_HELLO1 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 18;
   condition    = DIA_Quentin_HELLO1_Condition;
   information  = DIA_Quentin_HELLO1_Info;
   permanent	= FALSE;
   description	= "Cor Angar wys�a� mnie do Nowego Obozu.";
};

FUNC INT DIA_Quentin_HELLO1_Condition()
{
    if (CorAngar_SendToNC==TRUE) && (Npc_GetTrueGuild(hero) == GIL_BAU) //***FIX****
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_01"); //Cor Angar wys�a� mnie do Nowego Obozu.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_02"); //W jakim celu?
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_03"); //Jedyn� nadziej� na ucieczk� z Kolonii wydaje si� by� plan Mag�w Wody.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_04"); //Chyba nie mamy wyboru. Musisz spr�bowa�. Marwti mnie tylko jedna rzecz...
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_05"); //Jaka?
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_06"); //Chodzi o Cor Kaloma. To niebezpieczny cz�owiek.
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_07"); //Kalom wyrzek� si� Bractwa. Guru u�wiadomili sobie, �e �ni�cy nie jest tym, za kogo by� uwa�any. Pono� to prastary demon.
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_08"); //Cor Kalom nie chcia� w to wierzy� i odszed� z Obozu.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_09"); //Wiesz mo�e dok�d si� uda�?
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_10"); //Nie mam poj�cia.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_11"); //Przypuszczam, ze udali si� w nieznane nam tereny - na orkowe ziemie.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_12"); //Jest tam ma�y ob�z zapale�c�w, zwanych �owcami ork�w.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_13"); //Mamy z nimi dobre kontakty. Niejednokrotnie handlowali�my.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_14"); //Id� do nich i wypytaj o Kaloma. Mo�liwe, �e go widzieli.
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_15"); //Dlaczego to takie wa�ne?
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_16"); //Kalom jest dla nas zagro�eniem. Mo�e �ci�gn�� na nas wszystkich zgub�.
    //AI_Output (other, self ,"DIA_Quentin_HELLO1_15_17"); //P�jd� do tych �owc�w ork�w.
	//log
    MIS_SearchKalom = LOG_RUNNING;

    Log_CreateTopic         (CH3_SearchKalom, LOG_MISSION);
    Log_SetTopicStatus      (CH3_SearchKalom, LOG_RUNNING);
    B_LogEntry              (CH3_SearchKalom,"Cor Kalom uciek� z Bractwa. Quentin uwa�a, �e to niebezpieczny cz�owiek. Musz� uda� si� do obozu �owc�w ork�w i wypyta� o to czy nie widzieli gdzie� tego �wira.");
};

//========================================
//-----------------> Kalom2
//========================================

INSTANCE DIA_Quentin_Kalom2 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_Kalom2_Condition;
   information  = DIA_Quentin_Kalom2_Info;
   permanent	= FALSE;
   description	= "Kalom uda� si� do miasta ork�w.";
};

FUNC INT DIA_Quentin_Kalom2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_SectTeam))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Kalom2_Info()
{
    AI_Output (other, self ,"DIA_Quentin_Kalom2_15_01"); //Kalom, wraz z kilkoma Stra�nikami �wi�tynnymi uda� si� do Miasta Ork�w.
    AI_Output (other, self ,"DIA_Quentin_Kalom2_15_02"); //�owcy ork�w ostatni raz widzieli go przy bagnie i tajemniczej wie�y.
    AI_Output (self, other ,"DIA_Quentin_Kalom2_03_03"); //Cholera, co ten �wir mo�e planowa�?
    AI_Output (self, other ,"DIA_Quentin_Kalom2_03_04"); //C�... Pozostaje nam tylko mie� nadziej�, �e orkowie zrobi� z nim porz�dek zanim zrobi co� g�upiego.
	//log
    B_LogEntry                     (CH3_SearchKalom,"Powiedzia�em Quentinowi, �e �owcy ork�w widzieli Kaloma, kt�ry prawdopodobnie uda� si� na ziemie ork�w. Pozostaje nam mie� nadziej�, �e szalony Guru nie zrobi nic g�upiego.");
    Log_SetTopicStatus       (CH3_SearchKalom, LOG_SUCCESS);
    MIS_SearchKalom = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_AboutKalom);
	//prize
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 4
// W�tek g��wny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO35
//========================================

INSTANCE DIA_Quentin_HELLO35 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 35;
   condition    = DIA_Quentin_HELLO35_Condition;
   information  = DIA_Quentin_HELLO35_Info;
   permanent	= FALSE;
   description	= "Gomez wymordowa� wszystkich Mag�w Ognia!";
};

FUNC INT DIA_Quentin_HELLO35_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
	&& (MIS_RozwalaUBnadytow != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLO35_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_01"); //Gomez wymordowa� wszystkich Mag�w Ognia!
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_02"); //Co? Jak to si� sta�o?! Dopiero co dowiedzia�em si� o problemach w Starej Kopalni.
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_03"); //Po zawaleniu si� kopalni Gomez wpad� w sza�. Jego przysz�o�� jako szefa jest krucha. 
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_04"); //Wys�a� oddzia� Stra�nik�w, kt�rzy maj� poprzez sekretn� �cie�k� przez g�ry dotrze� do Wolnej Kopalni i zaj�� j�!
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_05"); //Nikt nie ma wst�pu do Starego Obozu, a co wi�cej Stra�nicy i atakuj� ka�dego, kto nie nosi na sobie czerwonego pancerza.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_06"); //�a�osny akt desperacji. To w jego stylu. Ale �e nie oszcz�dzi� nawet Mag�w? Hmm...
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_07"); //Co teraz zrobimy?
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_08"); //Skoro ludzie Gomeza atakuj� ka�dego, to tylko kwestia czasu zanim spr�buj� si� dobra� do naszych ty�k�w. B�dziesz mia� teraz du�o pracy.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_09"); //Trzeba powiedzie� wszystkim, �eby wr�cili do Obozu i nie zwracali na sobie uwagi. Musisz porozmawia� z Ratfordem i Draxem. Ka� im si� ukry�. 
	AI_Output (self, other ,"DIA_Quentin_HELLO35_03_10"); //Ostatnio z Obozu znikn�o te� dw�ch Bandyt�w. To dosy� podejrzana sprawa. Mam nadziej�, �e nie wpadli w sid�a Stra�nik�w. 
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_11"); //Niech ostrzeg� naszych �eby si� nie wychylali. Je�li Stra�nicy wzi�liby ich do niewoli mogliby si� wygada� o naszym Obozie.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_12"); //Z obozu znikn�o tak�e kilku moich ludzi. Znajd� ich. Mo�e Ratford i Drax dadz� ci jakie� wskaz�wki.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_13"); //Na razie to wszystko. Zr�b co ci kaza�em. Nie ma czasu do stracenia.
	//log
	//zadanie nie jest ju� rozpoczynane u Draxa
	//if (MIS_RozwalaUBnadytow != LOG_RUNNING)
	//{
        MIS_RozwalaUBnadytow = LOG_RUNNING;
        Log_CreateTopic          (CH1_RozwalaUBnadytow, LOG_MISSION);
        Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_RUNNING);
        B_LogEntry               (CH1_RozwalaUBnadytow,"Sytuacja nie wygl�da zbyt dobrze. W tym ca�ym zamieszaniu Stra�nicy mog� pr�bowa� odnale�� Ob�z Bandyt�w. Musimy powzi�� �rodki ostro�no�ci. Quentin kaza� mi porozmawia� z Draxem i Ratfordem, obaj maj� wr�ci� do Obozu. Pryz okazji mam odnale�� kilku Bandyt�w, kt�rzy znikn�li z Obozu.");  
	//};
	//experience
	B_GiveXP (XP_FireMagesDeath);
	//exit
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DraxInfos
//========================================

INSTANCE DIA_Quentin_DraxInfos (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_DraxInfos_Condition;
   information  = DIA_Quentin_DraxInfos_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Draxem i przy okazji odnalaz�em Bandyt�w!";
};

FUNC INT DIA_Quentin_DraxInfos_Condition()
{
    if (MIS_RozwalaUBnadytow == LOG_RUNNING) //(Npc_KnowsInfo (hero, DIA_Quentin_HELLO35))
	&& (Npc_KnowsInfo (hero, DIA_Drax_WTFCH4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_DraxInfos_Info()
{
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_01"); //Rozmawia�em z Draxem i przy okazji odnalaz�em Bandyt�w!
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_02"); //A wi�c �yj�? Gdzie s�?
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_03"); //Ratford zgin�� z r�k Stra�nik�w, kt�rzy udali si� w kierunku opuszczonej kopalni.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_04"); //Drax postanowi� si� zem�ci� na ludziach Gomeza i organizuje atak na patrole Stra�nik�w.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_05"); //Zwo�a� Bandyt�w i formuj� ma�y oddzia�. Ci, kt�rzy znikn�li z Obozu s� z nim.
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_06"); //Musisz go jak najszybciej od tego odci�gn��. Stra�nicy mog� si� teraz �atwo zorientowa� o po�o�eniu naszego obozu!
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_07"); //Ju� za p�no. Pr�bowa�em przem�wi� mu do rozs�dku, ale jest op�tany ��dz� zemsty.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_08"); //Teraz decyzja nale�y do ciebie. Chcesz mu pom�c, czy nie?
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_09"); //P�jdziemy z nim. Ja, ty i kliku naprawd� dobrych ludzi. Drax nie jest mistrzem wojennego rzemios�a. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_10"); //Gdyby�my zostawili go samego, to tak jakby�my powiedzieli Gomezowi, gdzie jest nasz Ob�z. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_11"); //Id� do niego i powiedz mu, �eby na nas poczeka�. Nie p�jd� mordowa� Stra�nik�w bez przygotowania.
	//log
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Quentin zgodzi� si� pom�c Draxowi. W sumie to nie mia� za du�ego wyboru... Mam wr�ci� do Draxa i powiedzie� mu, �eby poczeka� na wsparcie z Obozu.");
	//exit
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> nextWork22
//========================================

INSTANCE DIA_Quentin_nextWork22 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_nextWork22_Condition;
   information  = DIA_Quentin_nextWork22_Info;
   permanent	= FALSE;
   description	= "Drax zaczeka. Co dalej?";
};

FUNC INT DIA_Quentin_nextWork22_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_QUENTINInfosHelp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_nextWork22_Info()
{
    AI_Output (other, self ,"DIA_Quentin_nextWork22_15_01"); //Drax zaczeka. Co dalej?
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_02"); //Wszystko przemy�la�em. P�jd� ja, ty, Drax i Pun. Reszta naszych ludzi nie nadaje si� do tego zadania, a ci kt�rzy zostan� musz� kontrolowa� sytuacj� podczas mojej nieobecno�ci.
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_03"); //Musisz teraz pogada� z dwiema osobami Jensem i Briamem.
    AI_Output (self, other ,"DIA_Quentin_nextWork22_03_04"); //Jensa popro� o ci�ki pancerz, a Briama o pomocne podczas walki eliksiry.
	//log
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Quentin zezwoli� mi na otrzymanie ci�kiej zbroi Bandyty od Jensa. Briam ponadto da mi kilka eliksir�w. Powinienem bez zw�oki z nimi porozmawia�.");
	//exit
	AI_StopProcessInfos	(self);
	//note
	//Emanuel - dialog about food blocked (if ch=10)
	//Rocky - dialog about armors and skins blocked (if ch=10)
};

//========================================
//-----------------> Idea
//========================================

INSTANCE DIA_Quentin_Idea (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_Idea_Condition;
   information  = DIA_Quentin_Idea_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_Idea_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Idea_Info()
{
    AI_Output (self, other ,"DIA_Quentin_Idea_03_01"); //Zaczekaj! Co� mi si� przypomnia�o.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_02"); //Ca�kiem zapomnia�em, �e mam kilku przyjaci� w obozie �owc�w ork�w.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_03"); //Znali�my si� z ich dow�dc� jeszcze w dalekiej przesz�o�ci.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_04"); //To dobrzy wojownicy. Z pewno�ci� pomog� nam pozby� si� tych Stra�nik�w.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_05"); //Id� do nich i popro� o kilku wojownik�w. Powo�aj si� na moj� znajomo�� z Wilsonem.
	//quest log
    MIS_SupportFromOrcHunters = LOG_RUNNING;
    Log_CreateTopic      (CH4_SupportFromOrcHunters, LOG_MISSION);
    Log_SetTopicStatus   (CH4_SupportFromOrcHunters, LOG_RUNNING);
    B_LogEntry           (CH4_SupportFromOrcHunters,"Mam odnale�� ob�z �owc�w ork�w. Ich szef podobno zna� si� z Quentinem, dlatego ten teraz liczy na jego pomoc. Obozu mam szuka� w jaskini b�d�cej cz�ci� �ciany skalnej oddzielaj�cej Stary Ob�z od Ziem Ork�w.");
	B_LogEntry           (CH1_RozwalaUBnadytow,"Ju� mia�em bra� si� do roboty, gdy nagle ponownie zaczepi� mnie Quentin. Poprosi� o odnalezienie obozu �owc�w ork�w i poproszenie ich o pomoc. Obozu mam szuka� w jaskini b�d�cej cz�ci� �ciany skalnej oddzielaj�cej Stary Ob�z od Ziem Ork�w.");
	//exit
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> QuestOk890976
//========================================

INSTANCE DIA_Quentin_QuestOk890976 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_QuestOk890976_Condition;
   information  = DIA_Quentin_QuestOk890976_Info;
   permanent	= FALSE;
   description	= "Dw�ch ludzi Wilsona ju� tu idzie.";
};

FUNC INT DIA_Quentin_QuestOk890976_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12)) && (MIS_SupportFromOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_QuestOk890976_Info()
{
    AI_Output (other, self ,"DIA_Quentin_QuestOk890976_15_01"); //Dw�ch ludzi Wilsona ju� tu idzie. S� to Rakus i Osko, jedni z najlepszych �owc�w ork�w.
    AI_Output (self, other ,"DIA_Quentin_QuestOk890976_03_02"); //To nie tak �le. Wi�ksza grupa mog�a by wzbudzi� zamieszanie.
	//log
    B_LogEntry               (CH4_SupportFromOrcHunters,"Powiedzia�em Quentinowi, �e uda�o mi si� przekona� Wilsona, aby przys�a� nam kilku ludzi do pomocy. Nasze si�y teraz znacznie wzrosn�.");
	B_LogEntry               (CH1_RozwalaUBnadytow,"Wilson przy�le do obozu dw�ch swoich najlepszych wojownik�w. Powiedzia�em o tym szefowi.");
    Log_SetTopicStatus       (CH4_SupportFromOrcHunters, LOG_SUCCESS);
    MIS_SupportFromOrcHunters = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_HelpHunters);
};

//========================================
//-----------------> WykonanoXD
//========================================

INSTANCE DIA_Quentin_WykonanoXD (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_WykonanoXD_Condition;
   information  = DIA_Quentin_WykonanoXD_Info;
   permanent	= FALSE;
   description	= "Jestem przygotowany!";
};

FUNC INT DIA_Quentin_WykonanoXD_Condition()
{
    if ((Npc_HasItems (hero,BAU_ARMOR_H)>= 1) //warunek zosta� zmieniony poniewa� opcja by�a perm 
    && (Npc_KnowsInfo (hero, DIA_Bandyta_FreePotions))
	&& (Npc_KnowsInfo (hero, DIA_Quentin_QuestOk890976)))
	|| (devmode_dia_WykonanoXD == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_WykonanoXD_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WykonanoXD_15_01"); //Jestem przygotowany!
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_02"); //�wietnie. Ja za ten czas zaj��em si� sprawami organizacyjnymi. Doyle dopilnuje, �eby ten ca�y pierdolnik nie rozpad� si� podczas mojej nieobecno�ci.
	AI_Output (other, self ,"DIA_Quentin_WykonanoXD_15_03"); //My�l�, �e to dobra decyzja.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_04"); //Zostan� te� Rocky i Emanuel. Powinni sobie poradzi�.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_04"); //Nie wiem tylko jaki Drax ma plan ataku. Mam nadziej�, �e wszystko przygotowa�. Lepiej ju� do niego chod�my. 
    B_LogEntry               (CH1_RozwalaUBnadytow,"Przygotowa�em wszystko co by�o trzeba. Teraz musimy uda� si� do Draxa. Quentin powierzy� mu dow�dztwo nad ca�� wypraw�. Widz� jednak, �e nie jest zachwycony ca�� t� wypraw�. Sprawia wra�enie zamy�lonego. By� mo�e obawia si� konsekwencji ataku na ludzi Gomeza.");
    Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_SUCCESS);
    MIS_RozwalaUBnadytow = LOG_SUCCESS;

    B_GiveXP (XP_WeMustHelpDrax);
	AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (BAN_1610_Quentin,"wait");
	Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
	Npc_ExchangeRoutine (NON_2706_Osko,"atak");
	Npc_ExchangeRoutine (NON_2705_Rakus,"atak");
	
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"burdel"); 
	//Npc_ExchangeRoutine (NON_2702_SZEFU,"atak");
	//Npc_ExchangeRoutine (ORG_864_Raeuber,"pupil");
	//Npc_ExchangeRoutine (ORG_869_Raeuber,"pupil");
	//Npc_ExchangeRoutine (BAN_1603_Martin,"wait");
	//Npc_ExchangeRoutine (BAN_1604_Jens,"wait");
	//Npc_ExchangeRoutine (BAN_1606_Josh,"wait");
};

//========================================
//-----------------> AkcjaUkonczona
//========================================

INSTANCE DIA_Quentin_AkcjaUkonczona (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_AkcjaUkonczona_Condition;
   information  = DIA_Quentin_AkcjaUkonczona_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_AkcjaUkonczona_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Pokonani3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_AkcjaUkonczona_Info()
{
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_01"); //Ha Ha! Dawno nie by�o tu takiej rzezi! Dobra robota!
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_02"); //Ch�opaki, zwijajmy si� zanim kto� reszta Stra�nik�w zorientuje si� co si� sta�o. 
    //AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_03"); //A czego si� obawia�e�?
    //AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_04"); //Zasadzki ze strony Gomeza. Ale to ju� nie wa�ne... Stra�nicy z obozu pewnie nawet nas nie dostrzegli.
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_05"); //Chocia� pewnie te dupki s� zbyt zaj�te us�ugiwaniem Gomezowi...
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_06"); //Na mnie ju� pora...
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_07"); //Czekaj, gdzie chcesz i��? 
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_08"); //Mam jeszcze du�o spraw do za�atwienia.
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_09"); //Kilka chwil nic nie zmieni. Chod� z nami do obozu. Trzeba uczci� zwyci�stwo.
    
    AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (BAN_1610_Quentin,"wait");
	BAN_1610_Quentin.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine (NON_2706_Osko,"atak");
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_2705_Rakus,"atak");
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
	BAN_1611_Pun.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine (BAN_1613_Doyle,"zwial");//Doyle ucieka do Nowego Obozu
	
	Npc_ExchangeRoutine (BAN_1605_Rocky,"ucieczka");//Rocky ucieczka przed ob�z
	Npc_RemoveInvItem (BAN_1605_Rocky, BAU_ARMOR_H);//usuni�cie pancerza
	
	//Npc_ExchangeRoutine (BAN_1603_Martin,"wait");
	//Npc_ExchangeRoutine (BAN_1604_Jens,"wait");
	//Npc_ExchangeRoutine (BAN_1606_Josh,"wait");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"atak"); 
	//Npc_ExchangeRoutine (NON_2702_SZEFU,"czekanie");
	//Npc_ExchangeRoutine (ORG_864_Raeuber,"pupil");
	//Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
	//Npc_ExchangeRoutine (ORG_869_Raeuber,"pupil");
	//Npc_ExchangeRoutine (BAN_1603_Martin,"start");
	//Npc_ExchangeRoutine (BAN_1604_Jens,"start");
	//Npc_ExchangeRoutine (BAN_1606_Josh,"start");
	//Npc_ExchangeRoutine (BAN_1604_Jens,"start");
	//Npc_ExchangeRoutine (NON_2702_SZEFU,"wait");
	//Npc_ExchangeRoutine (NON_2705_Rakus ,"wait");
	//Npc_ExchangeRoutine (NON_2706_osko  ,"wait");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"wait"); 

	//K�opoty Bandyt�w jednak si� nie sko�czy�y. Stra�nicy zaj�li Ob�z i zniewolili Bandyt�w. Rocky uciek� i stoi przed Obozem.
	Wld_InsertNpc				(GRD_2271_Stra�nik,"OC1");	
	Wld_InsertNpc				(GRD_2272_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2273_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2274_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2275_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2276_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2277_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2278_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2279_Stra�nik ,"OC1");
	Wld_InsertNpc				(GRD_2283_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2282_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2284_Stra�nik  ,"OC1");
	Wld_InsertNpc				(GRD_2290_Stra�nik  ,"OC1");
	Npc_ExchangeRoutine			(GRD_3935_Hector,"misja"); //boss
	
	B_LogEntry               (CH1_AtakNaSO,"Quentin r�wnie� ucieszy� si� z takiego przebiegu wydarze�. Nie pozosta�o nam nic innego jak zaszy� si� ponownie w g�rskim obozie.");
    Log_SetTopicStatus       (CH1_AtakNaSO, LOG_SUCCESS);
    MIS_AtakNaSO = LOG_SUCCESS;
};

/////////// opcja usuni�ta - dialog z Rockym jest pierwszy
//========================================
//-----------------> DAEADALL
//========================================

INSTANCE DIA_Quentin_DAEADALL (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_DAEADALL_Condition;
   information  = DIA_Quentin_DAEADALL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_DAEADALL_Condition()
{
    if (Npc_GetDistToWP (BAN_1610_Quentin, "QUEN") < 1000) && (Npc_KnowsInfo (hero, DIA_Quentin_AkcjaUkonczona)) && (kapitel == 10)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Quentin_DAEADALL_Info()
{
    AI_Output (self, other ,"DIA_Quentin_DAEADALL_03_01"); //St�j! Nie id� dalej!
    AI_Output (other, self ,"DIA_Quentin_DAEADALL_15_02"); //Co? O co chodzi? Dlaczego nie jeste�cie w Obozie?
    AI_Output (self, other ,"DIA_Quentin_DAEADALL_03_03"); //Stra�nicy znale�li nasz Ob�z! Tylko Rocky uciek�.
    AI_Output (other, self ,"DIA_Quentin_DAEADALL_15_04"); //Musimy odbi� nasz� kryj�wk�!
    AI_Output (self, other ,"DIA_Quentin_DAEADALL_03_05"); //Nie mamy innego wyj�cia. Porozmawiaj uprzednio z Rockym. Nieco go obdarli, ale najwa�niejsze, �e �yje.
	//log
    
	//exit
    AI_StopProcessInfos	(self);
};
///////////

//========================================
//-----------------> Plan
//========================================

INSTANCE DIA_Quentin_Plan (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_Plan_Condition;
   information  = DIA_Quentin_Plan_Info;
   permanent	= FALSE;
   description	= "Masz ju� jaki� plan?";
};

FUNC INT DIA_Quentin_Plan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_WtfRozwalaWobozie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Plan_Info()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_15_01"); //Rozmawia�em z Rocky'm. Masz ju� jaki� plan?
    AI_Output (self, other ,"DIA_Quentin_Plan_03_02"); //Jedynym sensownym wyj�ciem wydaj� mi si� szybki i nag�y atak. Wci�� mamy kilku dobrych ludzi. Je�li Stra�nicy nie zd��� si� zabarykadowa�, to damy rad�.
    AI_Output (other, self ,"DIA_Quentin_Plan_15_03"); //Chyba nie mamy innego wyboru. 
    AI_Output (self, other ,"DIA_Quentin_Plan_03_04"); //Dobrze, �e si� zgadzamy. Niech wszyscy opatrz� rany, zjedz� co� i od razu bierzemy si� do roboty. 
	
	//nieu�ywane
//	AI_Output (self, other ,"DIA_Quentin_Plan_03_05"); //Chcia�bym ci to da�, zanim wyruszymy. 
//	AI_Output (self, other ,"DIA_Quentin_Plan_03_06"); //To nowy pancerz. Z pewno�ci� ci si� przyda. Czeka nas nie�atwa walka.
//	AI_Output (other, self ,"DIA_Quentin_Plan_15_07"); //Dzi�ki. 

	//stara zmienna (by� mo�e u�ywana jeszcze w jakim� dialogu - nie przeszkadza)
	PlanA = true;
	
	B_LogEntry          (CH1_zniewolenie,"Aby odbi� nasz Ob�z, b�dziemy musieli szybko i skutecznie zaatakowa� niespodziewaj�cych si� nas Stra�nik�w. Tak sw�j plan przedstawi� mi Quentin.");
	//Armor daje Jens przed atakiem
	/*CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,BAU_ARMOR_H);
	AI_EquipBestArmor	(other); */
	
	//wybory s� nieu�ywane
	//Info_ClearChoices		(DIA_Quentin_Plan);
	//Info_AddChoice		(DIA_Quentin_Plan, "Uwi�my Stra�nik�w b�d�cych w kanionie.", DIA_Quentin_Plan_PalisadeZbudjmy);
    //Info_AddChoice		(DIA_Quentin_Plan, "Sprowadzimy g�rskie trolle do Obozu.", DIA_Quentin_Plan_Trolllle);
    //Info_AddChoice		(DIA_Quentin_Plan, "Przygnieciemy ich kamieniami.", DIA_Quentin_Plan_Inne);
};

FUNC VOID DIA_Quentin_Plan_PalisadeZbudjmy()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_01"); //Uwi�my Stra�nik�w b�d�cych w kanionie.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_02"); //Jak chcesz to zrobi�?
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_03"); //Zaatakujemy szybko. Wybijemy wszystkich pilnuj�cych wej�cia, po czym w�ski przesmyk zabudujemy.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_04"); //To si� mo�e uda�!
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_05"); //Musimy wszystkich zmobilizowa� do budowy.
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_06"); //Jeszcze nie odbili�my Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_07"); //Ju� widz� jak to zrobili�my.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_08"); //Ch�opcze, chyba zas�ugujesz na tak� zbroj� jak moja.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_09"); //Niech ci s�u�y w walce!
    CreateInvItems (self, BAU_ARMOR_H, 2);
    B_GiveInvItems (self, hero, BAU_ARMOR_H, 1);
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, BAU_ARMOR_H);
	PlanA = true;
    B_LogEntry                     (CH1_zniewolenie,"Postanowi�em, �e po szybkim ataku uwi�zimy pozosta�ych Stra�nik�w w Obozie.");

    B_GiveXP (1000);
    Info_ClearChoices		(DIA_Quentin_Plan);
};

FUNC VOID DIA_Quentin_Plan_Trolllle()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_01"); //Sprowadzimy g�rskie trolle do Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_Trolllle_03_02"); //Jak chcesz to zrobi�?
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_03"); //Skorzystamy z pomocy Mag�w Wody.
    B_LogEntry                     (CH1_zniewolenie,"Postanowi�em poprosi� o pomoc Mag�w Wody. Sprowadzimy g�rskie trolle do Obozu. One z pewno�ci� za�atwi� spraw� za nas.");
    PlanB = true;
    B_GiveXP (500);
    Info_ClearChoices		(DIA_Quentin_Plan);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_Plan_Inne()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_01"); //Przygnieciemy ich kamieniami.
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_02"); //Chcesz wywo�a� lawin�?

    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_03"); //Skorzystam z pomocy jakiego� maga.
    
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_04"); //�ycz� ci powodzenia. Przyjd� jak co� przygotujesz.
	B_LogEntry                     (CH1_zniewolenie,"Uwa�am, �e sprowadzenie lawiny to dobry pomys�. Potrzebuj� tylko jakiego� maga i �r�d�a mocy.");

    B_GiveXP (500);
	Info_ClearChoices	    (DIA_Quentin_Plan);
  AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LetsGo2346567
//========================================

INSTANCE DIA_Quentin_LetsGo2346567 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_LetsGo2346567_Condition;
   information  = DIA_Quentin_LetsGo2346567_Info;
   permanent	= FALSE;
   description	= "Ruszamy?";
};

FUNC INT DIA_Quentin_LetsGo2346567_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Plan))
    && (PlanA == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_LetsGo2346567_Info()
{
    AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_01"); //Ruszamy?
    AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_02"); //Tak, jednak zanim to zrobimy, powiniene� wiedzie� czego mo�na si� tam spodziewa�. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_03"); //Rocky m�wi� o grupie Stra�nik�w...
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_04"); //S�dzisz, �e przyszli tu sami? Jako niezorganizowana ha�astra? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_05"); //W Obozie jest z pewno�ci� jeszcze kto�.
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_06"); //Czy�by sam Thorus?
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_07"); //By� mo�e... Albo kt�ry� z Magnat�w. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_08"); //Chcesz si� wycofa�? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_09"); //Nie, po prostu lepiej zachowa� czujno��. Skup si� na g��wnym przeciwniku. My zajmiemy si� reszt�. 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_10"); //A teraz prowad�. 
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak");

	B_KillNpc (BAN_1614_Drax);
	
	Npc_ExchangeRoutine (BAN_1605_Rocky , "odb");
	BAN_1605_Rocky.aivar[AIV_PARTYMEMBER] = TRUE;
	
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_2705_Rakus , "burdel");
	NON_2705_Rakus.guild = GIL_BAU;
	
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_2706_osko , "burdel");
	NON_2706_osko.guild = GIL_BAU;
	
	//pun
	BAN_1611_Pun.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (BAN_1611_Pun,"help");
	
	//ci dwaj chyba stoj� tam gdzie Ratford i Drax i nie brali udzia�u w walce
	ORG_864_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (ORG_864_Raeuber,"help");
	
	ORG_869_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (ORG_869_Raeuber,"help");
	
    AI_StopProcessInfos	(self);
	
	//nieu�ywane od 1.2
	//BAN_1603_Martin.aivar[AIV_PARTYMEMBER] = TRUE;
    //Npc_ExchangeRoutine (BAN_1603_Martin , "atak");
	//BAN_1606_Josh.aivar[AIV_PARTYMEMBER] = TRUE;
    //Npc_ExchangeRoutine (BAN_1606_Josh , "atak");
	//BAN_1604_Jens.aivar[AIV_PARTYMEMBER] = TRUE;
    //Npc_ExchangeRoutine (BAN_1604_Jens , "atak");
	//NON_2702_SZEFU.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (NON_2702_SZEFU , "atak");
	//NON_2702_SZEFU.guild = GIL_BAU;
	//NON_2703_MYSLIWY.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY , "burdel");
	//NON_2703_MYSLIWY.guild = GIL_BAU;
};

//========================================
//-----------------> 54
//========================================

INSTANCE DIA_Quentin_54 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_54_Condition;
   information  = DIA_Quentin_54_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_54_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_LetsGo2346567))
    && (Npc_IsDead(GRD_3935_Hector))
	//&& (Npc_IsDead(GRD_2281_Stra�nik))
	//&& (Npc_IsDead(GRD_2282_Stra�nik))
	//&& (Npc_IsDead(GRD_2283_Stra�nik))
	//&& (Npc_IsDead(GRD_2284_Stra�nik))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_54_Info()
{
    AI_Output (self, other ,"DIA_Quentin_54_03_01"); //Dobra robota! To ju� chyba wszyscy. Reszta albo zwieje, albo zaraz bedzie gry�� ziemi�.
    AI_Output (other, self ,"DIA_Quentin_54_15_02"); //Ob�z zn�w jest nasz!
    AI_Output (self, other ,"DIA_Quentin_54_03_03"); //Kim by� dow�dca Stra�nik�w? 
	AI_Output (other, self ,"DIA_Quentin_54_15_04"); //To Skelden, jeden z najbardziej wp�ywowych Stra�nik�w w Starym Obozie. 
	AI_Output (self, other ,"DIA_Quentin_54_03_05"); //To nie lada wyczyn wygra� z kim� takim. Dobrze, �e ten typ ju� gryzie piach. 
	//log
    B_LogEntry               (CH1_zniewolenie,"Podczas gdy Bandyci eliminowali Stra�nik�w, jak skupi�em si� na zabiciu niejakiego Skeldena. To silny i do�wiadczony cz�onek przybocznej stra�y Gomeza. Walka z nim nie by�a �atwa, jednak ostatecznie uda�o mi si� wys�a� go w za�wiaty. Ob�z zn�w jest nasz, jednak teraz czeka nas du�o pracy z przywr�ceniem temu miejscu dawnej �wietno�ci.");
    Log_SetTopicStatus       (CH1_zniewolenie, LOG_SUCCESS);
    MIS_zniewolenie = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_KillAllgardist);
	//powr�t bandyt�w do obozu
	BAN_1610_Quentin.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (BAN_1610_Quentin,"start");
	BAN_1605_Rocky.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (BAN_1605_Rocky , "start");
	
	ORG_864_Raeuber.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (ORG_864_Raeuber,"start");
	BAN_1611_Pun.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (BAN_1611_Pun,"start");
	ORG_869_Raeuber.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (ORG_869_Raeuber,"start");
	
	//powr�t do obozu �owc�w
	Npc_ExchangeRoutine (NON_2705_Rakus , "start");
	Npc_ExchangeRoutine (NON_2706_osko , "start");
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = false;
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = false;
	
	//old stuff
	//Wld_SendTrigger("PULAPKA1");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY , "wait");
	//Npc_ExchangeRoutine (BAN_1603_Martin , "start");
    //Npc_ExchangeRoutine (BAN_1606_Josh , "start");
    //Npc_ExchangeRoutine (BAN_1604_Jens , "start");
    //Npc_ExchangeRoutine (NON_2702_SZEFU , "wait");
	//BAN_1603_Martin.aivar[AIV_PARTYMEMBER] = false;
	//BAN_1606_Josh.aivar[AIV_PARTYMEMBER] = false;
	//BAN_1604_Jens.aivar[AIV_PARTYMEMBER] = false;
	//NON_2702_SZEFU.aivar[AIV_PARTYMEMBER] = false;
	//NON_2703_MYSLIWY.aivar[AIV_PARTYMEMBER] = false;
};

//========================================
//-----------------> findFriends
//========================================

INSTANCE DIA_Quentin_findFriends (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_findFriends_Condition;
   information  = DIA_Quentin_findFriends_Info;
   permanent	= FALSE;
   description	= "Wszystko w porz�dku?";
};

FUNC INT DIA_Quentin_findFriends_Condition()
{
    if (MIS_Zniewolenie == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_findFriends_Info()
{
    AI_Output (other, self ,"DIA_Quentin_findFriends_15_01"); //Wszystko w porz�dku?
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_02"); //Gdzie� mi znikn�� Drax i Doyle. Nikt ich nie widzia�. Cz�� naszych sprawdza trupy, ale tych dw�ch chyba w�r�d nich nie ma.
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_03"); //Poszukaj ich. Mo�e uciekli podobnie jak Rocky?
	AI_Output (other, self ,"DIA_Quentin_findFriends_15_04"); //Chwila, przecie� Drax by� z nami. 
	AI_Output (self, other ,"DIA_Quentin_findFriends_03_05"); //Hmm... To si� zgadza, ale przecie� nie pojawi� si� p�niej. Znikn�� mi z oczu, gdy wracali�my z okolic Starego Obozu. 
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_06"); //Musisz ich jak najszybciej odnale��. Mo�liwe, �e potrzebuj� naszej pomocy.
	//log
    MIS_FindFriends = LOG_RUNNING;
    Log_CreateTopic          (CH1_FindFriends, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindFriends, LOG_RUNNING);
    B_LogEntry               (CH1_FindFriends,"W odbitym Obozie nie znale�li�my Doyla. Mo�liwe, �e gdzie� uciek� lub porwali go Stra�nicy. Ponadto zagin�� Drax. Musz� odnale�� ich obu. Bez �adnych wskaz�wek to nie b�dzie zbyt proste.");
	//story
	B_Story_SoldiersValleyDefense ();
};

//========================================
//-----------------> FoundDrax
//========================================

INSTANCE DIA_Quentin_FoundDrax (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_FoundDrax_Condition;
   information  = DIA_Quentin_FoundDrax_Info;
   permanent	= FALSE;
   description	= "Znalaz�em Draxa.";
};

FUNC INT DIA_Quentin_FoundDrax_Condition()
{
    if (MIS_FindFriends == LOG_RUNNING)
    && (Npc_HasItems (other, ItMi_Listdraxa) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_FoundDrax_Info()
{
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_01"); //Znalaz�em Draxa.
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_02"); //I co z nim? Gdzie jest?
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_03"); //W innym, lepszym �wiecie. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_04"); //Co to znaczy? Nie �yje? 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_05"); //Tak, jednak to nie koniec rewelacji. Wbi� sobie n� prosto w serce, ale zanim to zrobi�, napisa� niezgrabny list. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_06"); //Jaki list? Nie wiedzia�em, �e niekt�rzy spo�r�d moich ludzi potrafi� pisa�. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_07"); //Drax potrafi�. W li�cie przyzna� si� do tego, �e to on zabi� Ratforda, a nie Stra�nicy. P�niej doszed� do w�tpliwego porozumienia ze Stra�nikami. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_08"); //M�w ja�niej, do cholery. Nie jestem jakim� magiem! 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_09"); //Tej historii nie da si� opowiedzie� jednym zdaniem. Daj mi doko�czy�. 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_10"); //Stra�nicy obiecali mu rud� w zamian za wci�gni�cie mnie w pu�apk�. Podwajali nagrod�, je�li przyprowadzi�by r�wnie� ciebie. 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_11"); //Jednak Drax nie spodziewa� si�, �e p�jdzie z nami Pun, oraz ludzie z obozu �owc�w ork�w. Ca�a sprawa mia�a si� zako�czy� ju� na pierwszym posterunku Stra�nik�w. Mieli nas wyko�czy�. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_12"); //Nie uda�o im si�...
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_13"); //Nie wszystko posz�o zgodnie z ich planem. Stra�nicy ze wszystkich trzech posterunk�w mieli si� zjawi� w pierwszym, tak aby mieli znaczn� przewag�. Widocznie si� nie dogadali lub co� stan�o im na drodze. 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_14"); //Ostatecznie pozostali w trzech grupach, co u�atwi�o nam ich eliminacj�. Po wszystkim Drax do reszty zg�upia�. Nie wiedzia�, co ma zrobi�, wi�c po tym wszystkim da� nog�. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_15"); //Nie spodziewa�em si�, �e z niego kawa� takiego sukinsyna. 
	AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_16"); //Zas�u�y� na taki los. 
	//log
	B_LogEntry                     (CH1_FindFriends,"Przyw�dca Bandyt�w by� zaskoczony t� zdrad�. Dali�my si� nie�le oszuka�...");
	//experience
    B_GiveXP (XP_FindDrax);
};

//========================================
//-----------------> iFindDoyle
//========================================

INSTANCE DIA_Quentin_iFindDoyle (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_iFindDoyle_Condition;
   information  = DIA_Quentin_iFindDoyle_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em i sprowadzi�em Doyla.";
};

FUNC INT DIA_Quentin_iFindDoyle_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_backtoCamp)) && (MIS_FindFriends == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_iFindDoyle_Info()
{
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_01"); //Odnalaz�em i sprowadzi�em Doyla.
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_02"); //Postanowi� uda� si� do Nowego Obozu i pom�c Najemnikom w walce ze Stra�nikami.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_03"); //(ironicznie) Wybra� sobie �wietny moment... Czy ju� nikt w tym cholernym Obozie nie u�ywa g�owy?!
	AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_06"); //Kaza�em mu wr�ci� do Obozu.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_07"); //Najwy�sza pora... B�d� mia� dla was jeszcze troch� roboty. 
	//log
    B_LogEntry                     (CH1_FindFriends,"Zg�osi�em Quentinowi, gdzie znalaz�em Doyla. Szef Bandyt�w by� na niego nie�le wkurzony.");
	//experience
    B_GiveXP (XP_FindDoyle);
};

//========================================
//-----------------> PrzejscieDalej
//========================================

INSTANCE DIA_Quentin_PrzejscieDalej (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_PrzejscieDalej_Condition;
   information  = DIA_Quentin_PrzejscieDalej_Info;
   permanent	= FALSE;
   description	= "Dzia�o si� co� podczas mojej nieobecno�ci?";
};

FUNC INT DIA_Quentin_PrzejscieDalej_Condition()
{
    if ((Npc_KnowsInfo (hero, DIA_Quentin_iFindDoyle)) && (Npc_KnowsInfo (hero, DIA_Quentin_FoundDrax)) )
	|| (devmode_dia_DIA_Quentin_PrzejscieDalej == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_PrzejscieDalej_Info()
{
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_01"); //Dzia�o si� co� podczas mojej nieobecno�ci?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_02"); //Wr�ci�o do mnie kilku zwiadowc�w.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_03"); //Czego si� dowiedzieli?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_04"); //Pono� Gomez wys�a� kilkunastu Stra�nik�w wraz z Kopaczami w kierunku placu wymian.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_05"); //Co to mo�e oznacza�?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_06"); //Opuszczona Kopalnia, ch�opcze. Opuszczona Kopalnia...
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_07"); //Przypuszczam, �e chc� wznowi� wydobycie. Nie wiem w jakim stanie jest ta kopalnia, ale to mo�e im si� uda�.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_08"); //W takim razie musimy czym pr�dzej im przeszkodzi�!
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_09"); //Ot� to! Trzeba wys�a� zorganizowana grup� Bandyt�w, kt�rzy oczyszcz� kopalni�.
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_10"); //Zadaliby�my pot�ny cios Gomezowi.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_11"); //I to pewnie ja otrzyma�em ten zaszczyt?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_12"); //Nie raz udowodni�e� mi, �e jeste� dobrym wojownikiem i �wietnym przyw�dc�.
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_13"); //Popro� Doyle'a o pomoc. Eksplorowa� ju� ongi� jakie� podziemia.
	AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_14"); //Dobrze, �e uda�o ci si� go sprowadzi�. 
	//log
	B_LogEntry         (CH1_FindFriends,"Odnalaz�em obu Bandyt�w, co ko�czy moje zadanie.");
    Log_SetTopicStatus (CH1_FindFriends, LOG_SUCCESS);
	MIS_FindFriends = LOG_RUNNING;
	//log 2
    MIS_OdbijanieOpKop = LOG_RUNNING;
    Log_CreateTopic          (CH1_OdbijanieOpKop, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OdbijanieOpKop, LOG_RUNNING);
    B_LogEntry               (CH1_OdbijanieOpKop,"Quentin zn�w ma plan. Tym razem musz� uda� si� wraz z grupk� Bandyt�w do Opuszczonej Kopalni. Mamy pozby� si� Stra�nik�w i zaj�� kopalni� dla siebie. Powinienem uprzednio pogada� z Doylem.");
	//story func
    B_Story_FocusCorristoQuest ();
	//stuff
	//Wld_SendTrigger("KOPALNIAEXIT");
	Wld_InsertNpc				(GRD_2291_Stra�nik,"OC1");
	Wld_InsertNpc				(GRD_2292_Stra�nik,"OC1");
	Wld_InsertNpc				(GRD_2293_Stra�nik,"OC1");
	//prize --don't need
    //CreateInvItems (self, ItMw_2H_Sword_02, 1);
    //B_GiveInvItems (self, other, ItMw_2H_Sword_02, 1);
	//exit
    AI_StopProcessInfos	(BAN_1610_Quentin);
};

//========================================
//-----------------> MineIsClean
//========================================

INSTANCE DIA_Quentin_MineIsClean (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_MineIsClean_Condition;
   information  = DIA_Quentin_MineIsClean_Info;
   permanent	= FALSE;
   description	= "Oczy�ci�em kopalni� ze Stra�nik�w i o�ywie�c�w.";
};

FUNC INT DIA_Quentin_MineIsClean_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_NoNareszcie))
    //&& (HeroMaArtefakt == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_MineIsClean_Info()
{
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_01"); //Oczy�ci�em kopalni� ze Stra�nik�w i o�ywie�c�w.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_02"); //O�ywie�c�w? Co tam do cholery si� dzia�o?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_03"); //Pewien nekromanta urz�dzi� tam sobie koszary dla swojej armii nieumar�ych. Uda�o mi si� go pokona� i odebra� artefakt, kt�ry dawa� mu moc. 
	AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_04"); //Szkoda, �e jak zwykle musia�em wszystko zrobi� sam. 
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_05"); //�eby ci to wynagrodzi� dam ci rud�, kt�r� przeznaczy�em dla Doyle'a. Natychmiast wysy�am oddzia� Bandyt�w do kopalni.
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_06"); //Czym teraz mam si� zaj��?
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_07"); //Potrzebujemy jeszcze jakiego� do�wiadczonego Kopacza, kt�ry pokierowa�by lud�mi.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_08"); //M�g�by� co� zorganizowa�?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_09"); //Postaram si�.
	//log
	MIS_OdbijanieOpKop = LOG_SUCCESS;
    Log_SetTopicStatus       (CH1_OdbijanieOpKop, LOG_SUCCESS);
    B_LogEntry               (CH1_OdbijanieOpKop,"Powiedzia�em Quentinowi o wszystkim, co wydarzy�o si� w opuszczonej kopalni. Moje zadanie dobieg�o ko�ca.");
	//new quest
	MIS_MineChlopy = LOG_RUNNING;
	Log_CreateTopic          (CH1_MineChlopy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MineChlopy, LOG_RUNNING);
    B_LogEntry               (CH1_MineChlopy,"Quentin natychmiast wys�a� oddzia� Bandyt�w do kopalni. Maj� zacz�� tam prac�, jednak najpierw potrzebny jest kto� z do�wiadczeniem, kto pokieruje wydobyciem. Musz� odnale�� odpowiedniego cz�owieka. S�k w tym, �e najlepsi in�ynierowie byli w Starym Obozie... ");
	//npcs
	Wld_InsertNpc				(NON_3040_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3042_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3044_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3045_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3030_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3031_Bandyta,"KOPACZ");
	Wld_InsertNpc				(NON_3032_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(BAN_1608_Kereth,"KOPACZ");
	Wld_InsertNpc				(NON_3038_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3037_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(BAN_1615_Luis,"KOPACZ");//luis
	//Wld_InsertNpc				(BAN_1608_Kereth,"KOPACZ"); kereth fix
	Npc_ExchangeRoutine (BAN_1605_Rocky,"start");
	Npc_ExchangeRoutine (BAN_1613_Doyle,"afterstart");
	Npc_ExchangeRoutine (BAN_1607_Chris,"start");
    B_GiveXP (XP_ClearAbMine);
	
	CreateInvItems (self, ItMiNugget, 1000);
    B_GiveInvItems (self, other, ItMiNugget, 1000);
};

//========================================
//-----------------> GuyWork
//========================================

INSTANCE DIA_Quentin_GuyWork (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_GuyWork_Condition;
   information  = DIA_Quentin_GuyWork_Info;
   permanent	= FALSE;
   description	= "Guy chce dla ciebie pracowa�.";
};

FUNC INT DIA_Quentin_GuyWork_Condition()
{
    if (MIS_MineChlopy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Guy_backToMine))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_GuyWork_Info()
{
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_01"); //Guy chce dla ciebie pracowa�.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_03"); //By�y Kopacz, kt�ry uciek� ze Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_04"); //Z pewno�ci� ma sporo do�wiadczenia.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_05"); //We� t� rud�.
	if (Npc_KnowsInfo (hero, DIA_Quentin_NegocjacieNc))
	{
	AI_Output (self, other ,"DIA_Quentin_GuyWork_03_10"); //Powiedz Lee, �e wy�l� swoich ludzi.
	};
	//log
	MIS_MineChlopy = LOG_SUCCESS;
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry               (CH1_MineChlopy,"Powiedzia�em Quentinowi, �e Guy b�dzie dla niego pracowa�. Ten cz�owiek ma du�e do�wiadczenie.");
	Log_SetTopicStatus       (CH1_MineChlopy, LOG_SUCCESS);
	//npc
	B_ExchangeRoutine	(VLK_530_Guy, "delte");
	Wld_InsertNpc		(VLK_599_GuyMine,"LOCATION_11_08");
	//experience
    B_GiveXP (200);
};

//========================================
//-----------------> Successasd
//========================================

INSTANCE DIA_Quentin_Successasd (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 3;
   condition    = DIA_Quentin_Successasd_Condition;
   information  = DIA_Quentin_Successasd_Info;
   permanent	= FALSE;
   description	= "Mo�na powiedzie�, �e osi�gn�li�my sukces.";
};

FUNC INT DIA_Quentin_Successasd_Condition()
{
    if (MIS_OdbijanieOpKop == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Successasd_Info()
{
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_01"); //Mo�na powiedzie�, �e osi�gn�li�my sukces.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_02"); //Masz racj�. Uda�o nam si� zada� cios Gomezowi.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_03"); //Jednak wci�� musimy by� czujni.
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_04"); //Jaki b�dzie kolejny cel Bandyt�w?
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_05"); //Jak zawsze: prze�y� jak najd�u�ej.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_06"); //Mam nadziej�, �e sytuacja w Kolonii nied�ugo si� uspokoi.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_07"); //A mo�e wreszcie czeka nas wolno��?
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_08"); //Kto wie? Mo�e to ty nas ocalisz?
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_09"); //Chyba zbytnio mnie przeceniacie.
};

//========================================
//-----------------> OldMine
//========================================

INSTANCE DIA_Quentin_OldMine (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_OldMine_Condition;
   information  = DIA_Quentin_OldMine_Info;
   permanent	= FALSE;
   description	= "A co ze Star� Kopalni�?";
};

FUNC INT DIA_Quentin_OldMine_Condition()
{
    if (MIS_OdbijanieOpKop == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_OldMine_Info()
{
    AI_Output (other, self ,"DIA_Quentin_OldMine_15_01"); //A co ze Star� Kopalni�?
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_02"); //Od dawna nie mamy stamt�d �adnych wie�ci.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_03"); //Wybierz si� tam i zobacz, co si� tam wyprawia.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_04"); //Tylko nie id� prosto do obozu. Obserwuj z daleka. Nie chcia�bym �eby po tym wszystkim Stra�nicy przerobili ci� na pasztet.
	//log
    MIS_SytucajaWOM = LOG_RUNNING;
    Log_CreateTopic          (CH1_SytucajaWOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SytucajaWOM, LOG_RUNNING);
    B_LogEntry               (CH1_SytucajaWOM,"Zapyta�em Quentina o to, co si� dzieje w Starej Kopalni. Sadzi�em, �e przyw�dca Bandyt�w b�dzie co� wiedzia� od swoich szpieg�w. Ku mojemu zaskoczeniu niczego nowego nie wiedzia� Zaproponowa� mi, abym si� tam pokr�ci� i czego� dowiedzia�.");
	//story func
	B_Story_BattleInOldMineCamp ();
};

//========================================
//-----------------> TalkAboutMine
//========================================

INSTANCE DIA_Quentin_TalkAboutMine (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_TalkAboutMine_Condition;
   information  = DIA_Quentin_TalkAboutMine_Info;
   permanent	= FALSE;
   description	= "By�em w pobli�u obozu.";
};

FUNC INT DIA_Quentin_TalkAboutMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_Nieidz))
    && (MIS_SytucajaWOM == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_TalkAboutMine_Info()
{
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_01"); //By�em w pobli�u obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_02"); //I co si� tam dzieje?
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_03"); //Podobno Stra�nicy sprzeciwili si� w�adzy Gomeza.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_04"); //Zabili jakiego� Magnata. kt�ry mia� tymczasowo zaj�� si� obozem.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_05"); //Gomez jeszcze nie wie, �e utraci� wp�ywy w obozie przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_06"); //Gdy si� dowie, wpadnie w sza�.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_07"); //I w�a�nie o to nam chodzi, ch�opcze!
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_08"); //Jak dobrze p�jdzie, to wybij� si� sami.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_09"); //Masz jaki� plan?
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_10"); //Musisz znale�� kogo�, kto zaniesie informacje o tym co si� sta�o w kopalni do Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_11"); //Mo�e znasz kogo� kto uciek�, ale wci�� ma dobre kontakty?
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_12"); //Nie wiem. Pomy�l, poszukaj, pogadaj i przyjd� do mnie p�niej.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_13"); //Zobacz� co da si� zrobi�.
	//log
    B_LogEntry                     (CH1_SytucajaWOM,"Quentin ucieszy� si� z takiego obrotu sprawy. Mam znale�� kogo�, kto powie ludziom Gomeza o tym co sta�o si� w obozie przy Starej Kopalni.");
	//story func
	B_Story_BattleInOldMineCamp ();
	//experience
    B_GiveXP (100);
};

//========================================
//-----------------> ZlatwioneXDXD
//========================================

INSTANCE DIA_Quentin_ZlatwioneXDXD (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_ZlatwioneXDXD_Condition;
   information  = DIA_Quentin_ZlatwioneXDXD_Info;
   permanent	= FALSE;
   description	= "Skorpion zaniesie do Starego Obozu informacj� o zdarzeniach z obozu przed kopalni�.";
};

FUNC INT DIA_Quentin_ZlatwioneXDXD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_TalkAboutMine))
    && (przekupionyGRD == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_ZlatwioneXDXD_Info()
{
    AI_Output (other, self ,"DIA_Quentin_ZlatwioneXDXD_15_01"); //Skorpion zaniesie do Starego Obozu informacj� o zdarzeniach z obozu przed kopalni�.
    AI_Output (self, other ,"DIA_Quentin_ZlatwioneXDXD_03_02"); //Dobra robota. Nie wiem jak dogada�e� si� ze Stra�nikiem, ale liczy si� efekt. 
    AI_Output (self, other ,"DIA_Quentin_ZlatwioneXDXD_03_03"); //Teraz skoro Gomez ju� o wszystkim wie, z pewno�ci� wys�a� ju� tam kolejne oddzia�y swoich ludzi.
    AI_Output (self, other ,"DIA_Quentin_ZlatwioneXDXD_03_04"); //Ponownie zakradnij si� w pobli�e kopalni i zobacz co si� tam dzieje. 
	//log
    B_LogEntry                     (CH1_SytucajaWOM,"Pora zobaczy� skutki naszych dzia�a�... Mam wr�ci� w okolice kopalni i si� rozejrze�.");
	//experience
    B_GiveXP (XP_SkorpioWork);
	//exit
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KoniecWatkuBandytow
//========================================

INSTANCE DIA_Quentin_KoniecWatkuBandytow (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_KoniecWatkuBandytow_Condition;
   information  = DIA_Quentin_KoniecWatkuBandytow_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Artegorem z obozu przed kopalni�.";
};

FUNC INT DIA_Quentin_KoniecWatkuBandytow_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_EveryoneDie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_KoniecWatkuBandytow_Info()
{
   // AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_01"); //Uda�o nam si�!
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_02"); //Rozmawia�em z Artegorem z obozu przed kopalni�.
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_03"); //Wszyscy nie �yj�. Stra�nicy wybili si� do nogi. Prze�y� tylko on.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_04"); //Wiedzia�em! Wiedzia�em, �e nam si� uda!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_05"); //Gomez wpakowa� si� w niema�e k�opoty. Zosta�o mu ma�o ludzi do obrony obozu.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_06"); //Wkr�tce sko�czy ze sztyletem w gardle!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_07"); //Nie musimy si� ju� obawia� Starego Obozu. Jest ich zbyt ma�o, aby cokolwiek zdzia�a�. 
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_08"); //A ty, ch�opcze? Czym teraz si� zajmiesz?
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_09"); //Pewnie b�d� pomaga� Magom Wody nam si� st�d wydosta�.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_10"); //W takim razie, powodzenia. Pami�taj, �e tutaj zawsze mo�esz wr�ci�.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_11"); //Masz tu kilka mikstur na drog�. Zrabowa�em je lata temu.
	//log
    B_LogEntry               (CH1_SytucajaWOM,"Pot�ga Gomeza podupad�a na tyle, �e Quentin odetchn�� z ulg�. Ob�z Bandyt�w jest na razie bezpieczny, a moja misja w nim dobiega ko�ca.");
    Log_SetTopicStatus       (CH1_SytucajaWOM, LOG_SUCCESS);
    MIS_SytucajaWOM = LOG_SUCCESS;
	//experience
    B_GiveXP (5000);
	//prize
    CreateInvItems (self, ItFo_Potion_Dex_02, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Dex_02, 1);
	
	CreateInvItems (self, ItFo_Potion_Health_Perma_02, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Health_Perma_02, 1);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 4
// Zadanie z piratami
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RozmowaOPiratach
//========================================

INSTANCE DIA_Quentin_RozmowaOPiratach (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_RozmowaOPiratach_Condition;
   information  = DIA_Quentin_RozmowaOPiratach_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_RozmowaOPiratach_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_PiratArmorDoyle))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_RozmowaOPiratach_Info()
{
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_01"); //Podobno spotka�e� pirat�w w Kolonii.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_02"); //Tak. Spotka�em ich na pla�y niedaleko Wie�y Mgie�.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_03"); //Ich statek si� rozbi� i zostali zaatakowani przez Stra�nik�w.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_04"); //Gomez chyba do reszty zg�upia�.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_05"); //Patroluje ca�� Dolin�.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_06"); //Chcia�e� co� od tych pirat�w?
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_07"); //Dawno temu tak�e by�em piratem.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_08"); //Nie jakim� tam kapitanem. Zwyk�ym szczurem okr�towym.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_09"); //Zawsze chcia�em mie� sw�j w�asny kordelas. Tak jak inni piraci.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_10"); //Jednak zostalem z�apany i wtr�cony tutaj.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_11"); //Da�e� si� tak �atwo z�apa�?
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_12"); //Gdy mnie pochwycili nie by�em ju� piratem, tylko Bandyt�.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_13"); //Mam zdoby� dla ciebie ten kordelas?
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_14"); //By�bym ci bardzo wdzi�czny.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_15"); //Oczywi�cie wynagrodz� ci� rud�.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_16"); //No dobrze. Pogadam z tymi piratami.
    MIS_QuentinsCutlass = LOG_RUNNING;

    Log_CreateTopic            (CH4_QuentinsCutlass, LOG_MISSION);
    Log_SetTopicStatus       (CH4_QuentinsCutlass, LOG_RUNNING);
    B_LogEntry                     (CH4_QuentinsCutlass,"Quentin w m�odo�ci by� piratem. Gdy zobaczy� m�j piracki str�j, wr�ci�y w nim stare wspomnienia. Mam uda� si� do pirat�w i spr�bowa� zdoby� kordelas.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KordelasJest
//========================================

INSTANCE DIA_Quentin_KordelasJest (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_KordelasJest_Condition;
   information  = DIA_Quentin_KordelasJest_Info;
   permanent	= FALSE;
   description	= "Mam kordelas.";
};

FUNC INT DIA_Quentin_KordelasJest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_RozmowaOPiratach))
    && (Npc_HasItems (other, Kordelas) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_KordelasJest_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KordelasJest_15_01"); //Mam kordelas.
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_02"); //Poka� mi go!
    AI_LookForItem (self,Kordelas);
    B_LogEntry                     (CH4_QuentinsCutlass,"Quentin by� bardzo zadowolony z nowej broni.");
    Log_SetTopicStatus       (CH4_QuentinsCutlass, LOG_SUCCESS);
    MIS_QuentinsCutlass = LOG_SUCCESS;

    B_GiveXP (200);
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_03"); //Wspania�e ostrze.
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_04"); //Masz jaja, ch�opcze. Dzi�ki.
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_05"); //Trzymaj swoj� dzia�k�.
    CreateInvItems (self, ItMiNugget, 350);
    B_GiveInvItems (self, other, ItMiNugget, 350);
	B_GiveInvItems (other, self, Kordelas, 1);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 4
// Ob�z bandyt�w oczami innych oboz�w
///////////////////////////////////////////////////////////////////////////////////////////

var int przyjaciel_Bandytow;
//========================================
//-----------------> CO_TY_TU_NAJMENIKU
//========================================

INSTANCE DIA_Quentin_CO_TY_TU_NAJMENIKU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_CO_TY_TU_NAJMENIKU_Condition;
   information  = DIA_Quentin_CO_TY_TU_NAJMENIKU_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_CO_TY_TU_NAJMENIKU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_ZNANY_NAJEMNIK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_CO_TY_TU_NAJMENIKU_Info()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01"); //Co ty tu robisz, Najemniku?
	}
	else if (Npc_GetTrueGuild (hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_GUR"); //Guru? Tutaj? Co sprowadza kogo� takiego jak ty w to niego�cinne miejsce?
	}
	else if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_KDW"); //Mag Wody w naszym Obozie? Co ci� tu sprowadza?
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_OTH"); //Czego szukasz w moim Obozie? 
	};
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_02"); //Przybywam z polecenia Doyle'a.
   // AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_03"); //Jak to?
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_04"); //Poprosi� mnie o sprawdzenie, co si� tu dzieje.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_05"); //Gdzie jest ten dure�?
   // AI_RemoveWeapon (self);
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_06"); //Uda� si� do Nowego Obozu, by wspom�c ludzi Lee w walce ze Stra�nikami.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_07"); //Torlof poprosi� go o pomoc, a ja mia�em zobaczy� czy wszystko u was w porz�dku.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_08"); //Dobrze, �e chocia� ty wykaza�e� si� zdrowym rozs�dkiem. Jak spotkasz Doyla, to powiedz mu, �eby przesta� b�aznowa� i wr�ci� do Obozu.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_09"); //Powiesz mi tak w og�le co si� tu wydarzy�o?
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_10"); //No wi�c poszli�my razem z Draxem i kilkoma dobrymi lud�mi w okolice Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_11"); //Chcieli�my pozby� si� cz�ci patroli, kt�re kr�ci�y si� w okolicy. Jednak zostali�my z�apani w zasadzk�, z kt�rej uda�o nam si� wyj�� ca�o.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_12"); //To ca�a historia.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_13"); //Tyle mi wystarczy. Ostatnio mam ju� tego du�o na g�owie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_14"); //Jeszcze jedno. W naszym Obozie mo�esz si� czu� bezpiecznie. Nikt nie b�dzie ci� tu gn�bi�. Czuj si� tu jak u siebie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_15"); //Gdyby� potrzebowa� ekwipunku, pogadaj z Martinem. 
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_16"); //Bywaj, Quentinie.
    przyjaciel_Bandytow = true;
    B_LogEntry                     (CH4_BanditsInTroubles,"Uda�em si� do Obozu Bandyt�w, gdzie spotka�em ich przyw�dc� - Quentina. Poprosi� mnie, abym przekaza� Doyle'owi, �e ma si� natychmiast pojawi� w Obozie.");

    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NegocjacieNc
//========================================

INSTANCE DIA_Quentin_NegocjacieNc (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_NegocjacieNc_Condition;
   information  = DIA_Quentin_NegocjacieNc_Info;
   permanent	= FALSE;
   description	= "Przyszed�em negocjowa�.";
};

FUNC INT DIA_Quentin_NegocjacieNc_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_BRAK_LUDZI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_NegocjacieNc_Info()
{
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_01"); //Przyszed�em negocjowa�.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_02"); //Negocjowa�? 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_03"); //Przybywam z polecenia Lee. Mam ci z�o�y� propozycj�, w jego imieniu rzecz jasna.
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_04"); //Chcemy wznowi� wydobycie w tym miejscu, jednak nie mamy robotnik�w. 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_05"); //Lee obiecuje wam czwart� cz�� urobku w zamian za robotnik�w.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_06"); //Mam wys�a� moich ludzi do kopalni?
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_07"); //Ju� m�wi�em, �e czwart� wykopan� przez nich cz�� b�dziecie mogli zatrzyma�.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_08"); //No niech b�dzie. Wi�kszo�� tych obibok�w i tak �pi ca�y dzie�...
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_09"); //Powiedz Lee, �e wy�l� kilku ludzi, ale przy okazji b�dziesz musia� co� dla mnie zrobi�.
	AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_10"); //Co takiego? 
	AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_11"); //Przyprowad� do pracy w kopalni jakiego� do�wiadczonego g�rnika. Moi ludzie kompletnie si� na tym nie znaj�.
    //B_LogEntry                     (CH1_NC_Mine,"Quentin niech�tnie, ale zgodzi� si� na nasz� propozycj�.");
	
	Wld_InsertNpc				(NON_3040_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3042_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3044_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3045_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3030_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3031_Bandyta,"KOPACZ");
	Wld_InsertNpc				(NON_3032_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(BAN_1608_Kereth,"KOPACZ");
	Wld_InsertNpc				(NON_3038_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3037_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(BAN_1615_Luis,"KOPACZ");//luis
	//Wld_InsertNpc				(BAN_1608_Kereth,"KOPACZ"); kereth fix
	
	//zadanie
	MIS_MineChlopy = LOG_RUNNING;
    Log_CreateTopic            		(CH1_MineChlopy, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_MineChlopy, LOG_RUNNING);
    B_LogEntry                     	(CH1_MineChlopy,"Quentin zgodzi� si� na propozycj� Lee. Przyw�dca Bandyt�w wy�le kilku swoich ludzi do kopalni, jednak poprosi� mnie w zamian o przys�ug�. Mam przyprowadzi� jakiego� kompetentnego cz�owieka, kt�ry pokieruje jego lud�mi. Tylko gdzie ja teraz znajd� kogo� takiego...");
    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// BAN_1610_Quentin
// Skrypt nauki broni jednor�cznej
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Quentin_START_TRAIN (C_INFO)
{
	npc			= BAN_1610_Quentin;
	nr			= 10;
	condition	= DIA_Quentin_START_TRAIN_Condition;
	information	= DIA_Quentin_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Quentin_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Quentin_KnowsNauka)) && (Npc_GetTrueGuild(hero) == GIL_BAU) 
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Quentin_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Quentin_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};

};

func void DIA_Quentin_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
};

FUNC VOID Quentin_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_01"); //M�dra decyzja. Najbli�sze trzy lekcje obejm� podstawy z kt�rymi powiniene� si� zapozna�.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_02"); //Bronie jednor�czne s� znacznie l�ejsze ni� dwur�czne, a przez to r�wnie� znacznie szybsze. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_03"); //Istnieje podzia� na lekkie bronie jednor�czne i te ci�sze. Ci�sze wymagaj� pewniejszego chwytu, ale te� wi�cej si�y.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_04"); //Je�li chcesz p�ynnie walczy� ci�k� jednor�czn�, poza technik� b�dziesz te� musia� pozna� tajniki balansowania cia�em.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_05"); //O du�ej sile w �apie ju� nawet nie m�wi�. To oczywiste, �e �eby szybko wymachiwa� takim ci�arem b�dziesz musia� posiada� wi�cej si�y ni� potrzeba do podniesienia dobrego dwur�cznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h2 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_06"); //Poka� mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_07"); //Tak jak my�la�em. Zadajesz mniejsze obra�enia ni� faktycznie m�g�by� zada� przy obecnej sile i za�o�onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_08"); //Nie atakuj, gdy jeste� zbyt daleko. Je�li za bardzo si� wychylisz do oddalonego przeciwnika, mo�esz straci� r�wnowag� i si� przewr�ci�.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_09"); //Staraj si� atakowa� z r�nych stron, aby zmyli� przeciwnika. Pami�taj, aby blokowa� uderzenia, je�li nie b�dziesz w stanie zrobi� uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h3 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_10"); //Pami�tasz o balansowaniu cia�em? A o odpowiedniej odleg�o�ci od przeciwnika? 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_11"); //Spr�buj wyczu� ile si�y musisz u�y�, aby bro� uderza�a mocno, a przy tym nie polecia�a bez�adnie przed siebie. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_12"); //Gdy to opanujesz, b�dziemy mogli pomy�le� nad ��czeniem po sobie uderze�. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_14"); //R�ce opadaj�... Nie dwiema, tylko jedn�! Om�wimy to na nast�pnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h4 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h5 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_15"); //�eby zada� wi�ksze obra�enia musisz trafia� w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_16"); //Ci�ko si� tego nauczy�. Wszystko zale�y od postury i pancerza. Najlepiej atakowa� ko�czyny i g�ow�.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_17"); //Naturalnie walka z cz�owiekiem r�ni si� od walki ze zwierz�ciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h6 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_18"); //Pami�tasz jak na pierwszej lekcji omawiali�my podzia� na bronie ci�kie i te l�ejsze?
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_19"); //My�l�, �e jeste� ju� wystarczaj�co silny, aby walczy� ci�kimi jednor�czniakami. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_20"); //O czym musisz pami�ta�? O odpowiednim wyczuciu r�wnowagi ostrza, a tak�e o treningu si�owym, kt�ry jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h7 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Quentin_TRAIN_2h_Info_01_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
		AI_Output (self, other,"DIA_Quentin_TRAIN_2h_Info_01_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
		AI_Output (self, other,"DIA_Quentin_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h8 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h9 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h10 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_26"); //To ju� koniec naszego szkolenia. Szacunek dla ciebie, �e dobrn��e� do ko�ca.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_27"); //Poka�� ci kilka ruch�w, kt�rymi trafisz we wra�liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_28"); //Musisz potrafi� je dostrzec zanim si� do niego zbli�ysz. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� -
// Stuff
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> OdbityOboz
//========================================

INSTANCE DIA_Quentin_OdbityOboz (C_INFO) //WY��CZONE
{
   npc          = BAN_1610_Quentin;
   nr           = 4;
   condition    = DIA_Quentin_OdbityOboz_Condition;
   information  = DIA_Quentin_OdbityOboz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_OdbityOboz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_LetsGo2346567))
    && (Npc_IsDead(GRD_2278_Stra�nik))
    && (Npc_IsDead(GRD_2273_Stra�nik))
    && (Npc_IsDead(GRD_2276_Stra�nik))
    && (Npc_IsDead(GRD_2274_Stra�nik))
    && (Npc_IsDead(GRD_2277_Stra�nik))
	&& (KAPITEL == 10) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_OdbityOboz_Info()
{
    AI_Output (self, other ,"DIA_Quentin_OdbityOboz_03_01"); //�wietnie. To by� perfekcyjny atak.
    AI_Output (other, self ,"DIA_Quentin_OdbityOboz_15_02"); //Teraz we�my si� za t� palisad�. Zago� tych nierob�w do pracy.
    Wld_SendTrigger("PULAPKA1");
   // PlayVideo ("INTRO.BIK");
    B_LogEntry                     (CH1_zniewolenie,"Uda�o nam si� odbi� g�rn� cz�� Obozu. Teraz musimy zbudowa� palisad� i odci�� drog� ucieczki Stra�nikom.");

    B_GiveXP (700);
    AI_Output (self, other ,"DIA_Quentin_OdbityOboz_03_03"); //Palisada gotowa. Ostrzeliwa� ich z g�ry!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EmanuelLife
//========================================

INSTANCE DIA_Quentin_EmanuelLife (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 3;
   condition    = DIA_Quentin_EmanuelLife_Condition;
   information  = DIA_Quentin_EmanuelLife_Info;
   permanent	= FALSE;
   description	= "Co do Emanuela...";
};

FUNC INT DIA_Quentin_EmanuelLife_Condition()
{
    if (MIS_Zniewolenie == LOG_SUCCESS) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_EmanuelLife_Info()
{
    AI_Output (other, self ,"DIA_Quentin_EmanuelLife_15_01"); //Co do Emanuela...
    if (Npc_IsDead(BAN_1602_Emanuel))
    {
        AI_Output (other, self ,"DIA_Quentin_EmanuelLife_15_02"); //Niestety nie �yje.
        AI_Output (self, other ,"DIA_Quentin_EmanuelLife_03_03"); //To ci�ka strata.
        AI_Output (self, other ,"DIA_Quentin_EmanuelLife_03_04"); //Musimy znale�� kogo� na jego miejsce...
    }
    else
    {
        AI_Output (other, self ,"DIA_Quentin_EmanuelLife_15_05"); //Emanuel �yje.
        AI_Output (self, other ,"DIA_Quentin_EmanuelLife_03_06"); //To bardzo dobra wiadomo��. Dobrze, �e jako� mu si� uda�o.
    };
};

//========================================
//-----------------> MamPiczec
//========================================

INSTANCE DIA_Quentin_MamPiczec (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_MamPiczec_Condition;
   information  = DIA_Quentin_MamPiczec_Info;
   permanent	= FALSE;
   description	= "Mam piecz�� z zakl�ciem.";
};

FUNC INT DIA_Quentin_MamPiczec_Condition()
{
    if (Npc_HasItems (other, ItMa_RuneBandit) >=1)
    && (Npc_KnowsInfo (hero, DIA_Cronos_GiveMeRune))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_MamPiczec_Info()
{
    AI_Output (other, self ,"DIA_Quentin_MamPiczec_15_01"); //Mam piecz�� z zakl�ciem.
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_02"); //Teraz musisz jej u�y�.
    AI_Output (other, self ,"DIA_Quentin_MamPiczec_15_03"); //Dobra. Chod�cie za mn�. U�yj� jej przed Obozem.
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_04"); //A co je�eli trole rzuc� si� i na nas?
    AI_Output (other, self ,"DIA_Quentin_MamPiczec_15_05"); //To wyprujemy im flaki. W czym problem?
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_06"); //Dobra, zostawmy ten temat.
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_07"); //Prowad� i postaraj si� nas nie pozabija�.
    B_LogEntry                     (CH1_Zniewolenie,"Musz� podej�� jak najbli�ej Obozu i u�y� czaru. Potem zostanie nam ju� tylko obserwowa� i pozby� si� tego, co zostanie po tym starciu.");
    B_ExchangeRoutine (BAN_1610_Quentin , "atak");
    B_ExchangeRoutine (BAN_1603_Martin , "atak");
    B_ExchangeRoutine (BAN_1606_Josh , "atak");
    B_ExchangeRoutine (BAN_1604_Jens , "atak");
    B_ExchangeRoutine (NON_2702_SZEFU , "atak");
    Npc_ExchangeRoutine (NON_2705_Rakus,"burdel");
    Npc_ExchangeRoutine (NON_2703_MYSLIWY,"burdel");  
	//***FIX****
	Npc_ExchangeRoutine (BAN_1614_Drax, "ded");
	CreateInvItems (BAN_1614_Drax, ItMi_Listdraxa,1);
	B_KillNpc (BAN_1614_Drax);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> UseCZAr
//========================================

INSTANCE DIA_Quentin_UseCZAr (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_UseCZAr_Condition;
   information  = DIA_Quentin_UseCZAr_Info;
   permanent	= FALSE;
   description	= "U�y�em czaru.";
};

FUNC INT DIA_Quentin_UseCZAr_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_GiveMeRune))
    && (HeroUseRuneB == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_UseCZAr_Info()
{
    AI_Output (other, self ,"DIA_Quentin_UseCZAr_15_01"); //U�y�em czaru.
    AI_Output (self, other ,"DIA_Quentin_UseCZAr_03_02"); //Chod�my dalej do Obozu. Zobaczymy co zosta�o ze Stra�nik�w.
    AI_Output (self, other ,"DIA_Quentin_UseCZAr_03_03"); //Trzeba b�dzie si� te� pozby� naszych w�ochatych przyjaci�.
    B_LogEntry                     (CH1_Zniewolenie,"U�y�em piecz�ci. Pora uda� si� do naszego Obozu i sprawdzi� co si� sta�o.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> DedALlQuent
//========================================

INSTANCE DIA_Quentin_DedALlQuent (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_DedALlQuent_Condition;
   information  = DIA_Quentin_DedALlQuent_Info;
   permanent	= FALSE;
   important	 = true;
};

FUNC INT DIA_Quentin_DedALlQuent_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_UseCZAr))
    && (HeroUseRuneB == true) 
	&& (Npc_IsDead(GRD_2280_Stra�nik))
    && (Npc_IsDead(GRD_2281_Stra�nik))
    && (Npc_IsDead(GRD_2282_Stra�nik))
    && (Npc_IsDead(GRD_2283_Stra�nik))
    && (Npc_IsDead(GRD_2284_Stra�nik))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_DedALlQuent_Info()
{
	CreateInvItem		(hero, BAU_ARMOR_H);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
    AI_Output (other, self ,"DIA_Quentin_DedALlQuent_15_01"); //Pokonali�my ich.
    AI_Output (self, other ,"DIA_Quentin_DedALlQuent_03_02"); //Wszystko si� uda�o! Dobra robota!
    AI_Output (self, other ,"DIA_Quentin_DedALlQuent_03_03"); //My�l�, �e zas�u�y�e� ju� na lepszy pancerz. Niech ci dobrze s�u�y.
    B_LogEntry                     (CH1_zniewolenie,"Pozbyli�my si� troli grasuj�cych po Obozie. Wszystko przebieg�o zgodnie z planem.");
    Log_SetTopicStatus       (CH1_zniewolenie, LOG_SUCCESS);
    MIS_zniewolenie = LOG_SUCCESS;
	Npc_ExchangeRoutine (self,"start");
    Npc_ExchangeRoutine (BAN_1603_Martin , "start");
    Npc_ExchangeRoutine (BAN_1606_Josh , "start");
    Npc_ExchangeRoutine (BAN_1604_Jens , "start");
    Npc_ExchangeRoutine (NON_2702_SZEFU , "wait");
	Npc_ExchangeRoutine (BAN_1605_Rocky , "start");
	Npc_ExchangeRoutine (NON_2703_MYSLIWY , "wait");
	Npc_ExchangeRoutine (NON_2705_Rakus , "wait");
	Npc_ExchangeRoutine (NON_2706_osko , "lowcaPoszukiwaczy");
    B_GiveXP (1000);
	AI_EquipBestArmor	(hero); 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POSZUKIWACZE
//========================================
/*
INSTANCE DIA_Quentin_POSZUKIWACZE (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 19;
   condition    = DIA_Quentin_POSZUKIWACZE_Condition;
   information  = DIA_Quentin_POSZUKIWACZE_Info;
   permanent	= FALSE;
   description	= "W Kolonii pojawili si� Poszukiwacze!";
};

FUNC INT DIA_Quentin_POSZUKIWACZE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shawn_POSZUKIWACZE))
    && (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_POSZUKIWACZE_Info()
{
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_01"); //W Kolonii pojawili si� Poszukiwacze!
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_02"); //Co, do kurwy?
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_03"); //Poszukiwacze to wys�annicy Beliara. S� bardzo niebezpieczni.
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_04"); //Zwiastuj� z�e czasy...
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_05"); //Akurat w to nie trudno mi uwierzy�.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_06"); //Nie znam si� za bardzo na tych sprawach magicznych.
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_07"); //Musicie si� strzec. Nigdy nic nie wiadomo.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_08"); //Podobno Doyle widzia� co� podejrzanego w lesie.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_09"); //Pogadaj z nim.

    B_GiveXP (150);
};*/