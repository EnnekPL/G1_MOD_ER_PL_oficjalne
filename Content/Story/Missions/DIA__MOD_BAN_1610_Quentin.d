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
// Rozdzia³ 1
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
   description	= "Ty tu rz¹dzisz?";
};

FUNC INT DIA_Quentin_WLADZA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Quentin_WLADZA_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_01"); //Ty tu rz¹dzisz?
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_02"); //Wchodzisz tak po prostu do mojego Obozu i pytasz mnie czy tu rz¹dzê, tak?
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_03"); //Jakby nie patrzeæ... to tak. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_04"); //Powiedzia³bym, ¿e jesteœ cholernie bezczelny...
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_05"); //...albo odwa¿ny.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_06"); //Nie... bezczelny. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_07"); //Powiem ci tylko, ¿e nazywam siê Quentin i dowodzê w tym Obozie.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_08"); //Tyle informacji powinno ci wystarczyæ.
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Quentin_KnowsNauka_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Quentin_KnowsNauka_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KnowsNauka_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Quentin_KnowsNauka_03_02"); //Mogê ciê nauczyæ walki broni¹ jednorêczn¹. Oczywiœcie nie za darmo. No i musisz te¿ nale¿eæ do Bandy.

	if (log_Quenfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Gdy zostanê Bandyt¹, Quentin za kilka bry³ek rudy nauczy mnie walki jednorêcznym orê¿em.");
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
   description	= "Kto mo¿e mi pomóc?";
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
    AI_Output (other, self ,"DIA_Quentin_HELPXD_15_01"); //Kto mo¿e mi pomóc?
    AI_Output (self, other ,"DIA_Quentin_HELPXD_03_02"); //Popytaj szwendaj¹cych siê po Obozie Bandytów. Z chêci¹ wybior¹ siê na polowanie.
};
*/

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
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
   description	= "Przysy³a mnie Drax.";
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
    AI_Output (other, self ,"DIA_Quentin_DRAX_15_01"); //Przysy³a mnie Drax. Uzna³ mnie za Bandytê i pokaza³ drogê do Obozu. Udowodni³em swoj¹ lojalnoœæ wykonuj¹c dla niego zadania.
    AI_Output (self, other ,"DIA_Quentin_DRAX_03_02"); //Co? Drax przyj¹³ kogoœ nowego bez mojej wiedzy?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_03"); //Powiedzia³, ¿e zas³ugujê na wasze zaufanie. Kaza³ mi siê zg³osiæ po rynsztunek. Jestem gotowy do pracy.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_04"); //Nie móg³ mnie tu przyprowadziæ od razu. W koñcu wasz Obóz jest ukryty. 
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_05"); //Kaza³ ci coœ przekazaæ?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_06"); //Có¿, wydarzy³o siê kilka interesuj¹cych rzeczy...
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_07"); //Mów, wszystko mo¿e mieæ znaczenie.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_08"); //Stra¿nikom prawie uda³o siê ustaliæ miejsce po³o¿enia waszego Obozu. Niejaki Trip sporz¹dzi³ notatkê na ten temat. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_09"); //Na jej podstawie Kopacz Graham rozrysowa³ potencjaln¹ mapê, która trafi³a w rêce Stra¿ników z placu wymian. Chcieli j¹ wykorzystaæ do planowania obrony.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_10"); //Zdoby³em obydwa te dokumenty. S¹ teraz w rêkach Draxa. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_11"); //Jeden z waszych ludzi, niejaki Skaza mia³ powa¿ne problemy w Starym Obozie. Tamtejsi Cienie chcieli go wygryŸæ. Dziêki mojej drobnej pomocy stali siê nieszkodliwi. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_12"); //W zamian otrzyma³em od Skazy raport. Stra¿nicy œwi¹tynni pomagaj¹ ludziom Gomeza zabijaæ pe³zacze w Starej Kopalni. Szukaja tam czegoœ zwi¹zanego z ich chor¹ religi¹.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_13"); //Josh nie ¿yje. Ian dowiedzia³ siê o jego machlojkach i kaza³ go zabiæ. Zanim go pojmali uda³o mi siê odnaleŸæ rudê, któr¹ zdoby³ do tej pory. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_14"); //Jest tego 450 bry³ek rudy. By³o wiêcej, ale pewien Kopacz wszed³ w posiadanie tej sakwy i wykorzysta³ czêœæ rudy. Goœæ ju¿ gryzie piach. Oto sakiewka.
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_15"); //Doœæ, wystarczy... Jestem pod olbrzymim wra¿eniem. Drax podj¹³ dobr¹ decyzjê. Daj mi chwilê pomyœleæ. Musimy podj¹æ odpowiednie dzia³ania.
	
	
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Uda³o mi dostaæ siê do Quentina. Zanim zostanê przyjêty, muszê wykonaæ kilka zadañ i przy okazji poprawiæ swoj¹ opiniê w Obozie.");
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
   description	= "Jens jest zabójc¹.";
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
    AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_01"); //Jens jest zabójc¹.
    AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_02"); //O czym ty do cholery mówisz?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_03"); //Pomog³em ustaliæ Kerethowi kto zabi³ jego brata. Okaza³o siê, ¿e to Jens.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_04"); //Sk³adasz doœæ powa¿ne oskar¿enia. Musisz mieæ wiêc twarde dowody. Hmm?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_05"); //Na miejscu zbrodni i w pobli¿u regularnie niszczonego grobu znalaz³em od³amki miecza, który Pun sprzeda³ kiedyœ Jensowi.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_06"); //Ostrze pokruszy³o siê, gdy Jens niszczy³ grób. Zrobi³ to, bo ma na pieñku z Kerethem...
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_07"); //Tak siê sk³ada, ¿e przed chwil¹ rozmawia³em z Jensem. Przedstawi³ mi swój punkt widzenia.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_08"); //Pewnie powiedzia³ ci, ¿e ktoœ mu ukrad³ miecz. Zgad³em? 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_09"); //Dok³adnie to powiedzia³.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_10"); //Wierzysz w to?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_11"); //A niby dlaczego mia³bym nie wierzyæ? Kereth to niez³y krêtacz i wszyscy w Obozie dobrze o tym wiedz¹.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_12"); //Myœlê, ¿e tym razem Kereth ma racjê.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_13"); //I niestety siê mylisz... Jens przedstawi³ kilka innych dowodów. Mianowicie, zarówno Doyle jak i jego zmiennik poœwiadczyli, ¿e Jens nie opuszcza³ obozu w dniach, w których dokonano zbezczeszczenia grobu. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_14"); //Po drugie, Smith stwierdzi³, ¿e w przeddzieñ zabójstwa by³ u niego Jens i prosi³ o pomoc w odszukaniu miecza. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_15"); //Po trzecie, Briam widzia³ jak Kereth chowa miecz Jensa do swojej skrzyni uprzednio oczyszczaj¹c go z ziemi. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_16"); //To by³a zwyczajna intryga, ch³opcze. Po prostu da³eœ siê oszukaæ. Jesteœ m³ody, wiêc pewnie nie pierwszy i nie ostatni raz. 
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_17"); //W takim razie kto zabi³ Rayana?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_18"); //Nie mam pojêcia. Pewnie nigdy siê tego nie dowiemy. 
	
	MIS_DestroyedGrave = LOG_FAILED;

    Log_SetTopicStatus       (CH1_DestroyedGrave, LOG_FAILED);
    B_LogEntry               (CH1_DestroyedGrave,"Okaza³o siê, ¿e zosta³em oszukany przez Keretha. Jens by³ niewinny i Quentin przedstawi³ mi na to dowody. Kereth porpostu chcia³ siê pozbyæ Jensa z obozu i najpewniej zaj¹æ jego stanowisko. Chyba policzê siê z tym oszustem.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Przy³¹czenie do obozu
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
   description	= "Co z moim przyjêciem?";
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
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_15_01"); //Co z moim przyjêciem?
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_02"); //Odwali³eœ od cholery dobrej roboty.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_03"); //Witaj wœród Bandytów...
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_04"); //Mi³o ciê mieæ po swojej stronie.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_07"); //Pamiêtaj: do³¹czaj¹c do Bandytów, stajesz siê nowym cz³owiekiem.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_08"); //Przesz³oœæ siê nie liczy. Szczególnie w tych czasach i w tym miejscu.
	
	//guild and quest status
	hero.guild = GIL_BAU;
	Npc_SetTrueGuild (hero,GIL_BAU);
	//HeroJoinToBAN ();
    B_LogEntry                     (CH1_BANDITOS_CAMP,"Od teraz jestem Bandyt¹! Czekaj¹ na mnie nowe wyzwania.");
    Log_SetTopicStatus       (CH1_BANDITOS_CAMP, LOG_SUCCESS);
    MIS_BANDITOS_CAMP = LOG_SUCCESS;
	//esperience
    B_GiveXP (XP_HeroJoinToBandit);
	//logs other quests
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,	"Bandyta nie mo¿e do³¹czyæ do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry			(CH1_JoinPsi,	"Bractwo bêdzie musia³o radziæ sobie beze mnie. Od dziœ moim domem jest Obóz Bandytów!");
		
		Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinNC,	"Lares bêdzie musia³ o mnie zapomnieæ.");
		
		Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_EasyJoinOC,	"Zosta³em Bandyt¹. Nic nie wysz³o z mojego u³atwionego przyjêcia do Starego Obozu.");
	};

 /*   AI_Output (self, other ,"DIA_Quentin_DOOBOZU_03_09"); //Wiêc, jak chcesz siê nazywaæ?

    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Wo³ajcie na mnie Ostrze.", DIA_Quentin_DOOBOZU_BLADE);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Chcê nazywaæ siê Rozpruwacz.", DIA_Quentin_DOOBOZU_ROZPRUWACZ);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Drag.", DIA_Quentin_DOOBOZU_DRAG);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Them.", DIA_Quentin_DOOBOZU_THEM);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Dorlas.", DIA_Quentin_DOOBOZU_DORLAS);
    Info_AddChoice		(DIA_Quentin_DOOBOZU, "Ragnir.", DIA_Quentin_DOOBOZU_RAGNIR);
};

FUNC VOID DIA_Quentin_DOOBOZU_BLADE()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_BLADE_15_01"); //Wo³ajcie na mnie Ostrze.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BLADE_03_02"); //Rozumiem, ¿e chcesz posi¹œæ wiedze dotycz¹c¹ walki mieczem.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BLADE_03_03"); //Niechaj tak bedzie. Od dzisiaj w bandzie mamy nowego cz³owieka - Ostrze.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_ROZPRUWACZ()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_ROZPRUWACZ_15_01"); //Chcê nazywaæ siê Rozpruwacz.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_ROZPRUWACZ_03_02"); //Nie wygl¹dasz na tak¹ bestie.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_ROZPRUWACZ_15_03"); //Witaj w bandzie - Rozpruwaczu.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_DRAG()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_DRAG_15_01"); //Drag.
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_DRAG_15_02"); //Mo¿emy nie rozmyslaæ nad znaczeniami imienia?
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_DRAG_03_03"); //Krótkie i proste. Dobry wybór.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_DRAG_03_04"); //Witaj wœród Bandytów Drag.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_THEM()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_THEM_15_01"); //Them.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_THEM_03_02"); //Witaj wœród Bandytów - Them.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_DORLAS()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_DORLAS_15_01"); //Dorlas.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_DORLAS_03_02"); //Od teraz jesteœ jednym z nas, Dorlasie.
    Info_ClearChoices		(DIA_Quentin_DOOBOZU);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_RAGNIR()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_RAGNIR_15_01"); //Ragnir.

    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_RAGNIR_03_02"); //Jesteœ teraz jednym z Bandytów, Ragnir. Tak bêdziemy ciê nazywaæ.
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
   description	= "Czy dostanê broñ i pancerz?";
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
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_01"); //Czy dostanê broñ i pancerz? 
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_02"); //Tak. Proszê, oto one.
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_03"); //To jedyna broñ jak¹ ci fundujemy. Na lepszy orê¿ bêdziesz musia³ sam sobie zapracowaæ. Pamiêtaj, ¿e z czasem musisz go zmieniaæ.
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_04"); //Dziêki. Na pewno nie zapomnê.
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
   description	= "Potrzebujê lepszego pancerza.";
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
    AI_Output (other, self ,"DIA_Quentin_EQ2_15_01"); //Potrzebujê lepszego pancerza.
	if (kapitel >= 3)
	{
	if (Npc_HasItems (hero, ItMiNugget)>=1800)
	{
    AI_Output (self, other ,"DIA_Quentin_EQ2_03_02"); //To dobry pancerz. Zas³u¿y³eœ na niego.
    B_GiveInvItems (hero, self, ItMiNugget, 1800);
    CreateInvItems (self, BAU_ARMOR_M, 1);
    B_GiveInvItems (self, other, BAU_ARMOR_M, 1);
	AI_EquipBestArmor	(hero); 
	DIA_Quentin_EQ2.permanent = 0;
	}
	else
	{
	 AI_Output (self, other ,"DIA_Quentin_EQ2_03_03"); //Taki pancerz to nie byle co. Kosztuje 1800 bry³ek rudy. 
	 DIA_Quentin_EQ2.permanent = 1;
	};
	
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_EQ2_03_04"); //Nie zas³u¿y³eœ jeszcze na ten pancerz.
	DIA_Quentin_EQ2.permanent = 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
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
   description	= "Co mam teraz robiæ?";
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
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_01"); //Co mam teraz robiæ?
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_02"); //Chyba bêdziemy musieli zaj¹æ siê tym Bractwem. Ta sprawa jest niepokoj¹ca. Ale zanim porz¹dnie weŸmiemy siê do roboty, to popracujesz trochê tutaj.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_03"); //Powiedzia³eœ, ¿e Stra¿nicy z placu wymian chcieli wykorzystaæ mapê od tego Grahama do zaplanowania obrony... Dobrze, zobaczymy jak im to posz³o.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_04"); //IdŸ do Doyla. Pójdziecie razem na plac wymian i podenerwujecie ludzi Gomeza. Rabuj¹c, przegl¹daj skrzynie i zwa¿aj na wszelkie dokumenty jakie w nich znajdziesz. 
	AI_Output (self, other ,"DIA_Quentin_QUEST4_03_05"); //Jeœli coœ znajdziesz, przynieœ do mnie. Zapamiêtasz?
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_06"); //Jasne.

    MIS_Rozpierdol1 = LOG_RUNNING;

    Log_CreateTopic          (CH1_Rozpierdol1, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_RUNNING);
    B_LogEntry               (CH1_Rozpierdol1,"Razem z Doylem wybieramy siê na plac wymian, ¿eby podenerwowaæ ludzi Gomeza. Doyle'a znajdê przy bramie do Obozu Bandytów. Podczas rabunku mam szukaæ dokumentów, które mog¹ le¿eæ w skrzyniach b¹dŸ przy Stra¿nikach.");
	
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
   description	= "Byliœmy z Doyle'm na placu wymian.";
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
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_01"); //Byliœmy z Doyle'm na placu wymian.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_02"); //To œwietnie! Jak posz³o? Znalaz³eœ dokumenty?
	if (Npc_HasItems (other, itmi_plac_doc1) >=1) && (Npc_HasItems (other, itmi_plac_doc2) >=1) && (Npc_HasItems (other, itmi_plac_doc3) >=1) 
	&& (Npc_HasItems (other, itmi_plac_doc4) >=1)
	{
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_03"); //Tak, weŸ je. Co teraz mam robiæ?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_04"); //Wys³a³em ju¿ jednego z naszych do Bractwa jako szpiega.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_05"); //Powinien wkrótce wróciæ. Tymczasem mam dla ciebie jeszcze jedno zadanie.
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_06"); //Co tym razem?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_07"); //Podobno Gomez wysy³a jakiœ transport do Starej Kopalni.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_08"); //Myœlê, ¿e to dobra okazja na atak.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_09"); //Rocky zajmuje siê t¹ akcj¹. IdŸ do niego i powiedz, ¿e kaza³em ci mu pomóc.
	DIA_Quentin_UKONCZONE.permanent = false;
	MIS_Rozpierdol2 = LOG_RUNNING;
	Log_CreateTopic          (CH1_Rozpierdol2, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Rozpierdol2, LOG_RUNNING);
    B_LogEntry               (CH1_Rozpierdol2,"Tym razem muszê iœæ do Rockiego z którym mam zaatakowaæ konwój ze Starego Obozu. Rocky mieszka w tej samej chacie co Quentin.");
	
	B_LogEntry               (CH1_Rozpierdol1,"Poinformowa³em Quentina o pomyœlnie przeprowadzonym ataku i odda³em mu dokumenty.");
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
   description	= "Zaatakowaliœmy konwój.";
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
    AI_Output (other, self ,"DIA_Quentin_POATAKU_15_01"); //Zaatakowaliœmy konwój.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_02"); //Œwietnie. Rozumiem, ¿e wam siê uda³o.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_03"); //Zajmê siê ekwipunkiem. Przesortujê go i oddam Martinowi. 
	B_LogEntry                     (CH1_Rozpierdol2,"Quentin by³ bardzo zadowolony z naszych osi¹gniêæ. Przyj¹³ ode mnie rzeczy z dostawy do Starej Kopalni.");	
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
   description	= "Masz dla mnie jeszcze jakieœ zadanie?";
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
    AI_Output (other, self ,"DIA_Quentin_QUEST5_15_01"); //Masz dla mnie jeszcze jakieœ zadanie?
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_02"); //Wiesz przecie¿, ¿e zawsze coœ siê znajdzie...
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_03"); //Ostatnio wys³aliœmy kilku Bandytów po dostawê z Nowego Obozu, jednak do dziœ nie wrócili.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_04"); //Przypuszczam, ¿e schowali siê w jakiejœ jaskini z towarem i ani myœl¹ wracaæ.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_05"); //ZnajdŸ ich i przynieœ stal, która nieœli. By³o tego ze 30 prêtów. 
    MIS_BanditCave = LOG_RUNNING;

    Log_CreateTopic          (CH1_BanditCave, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BanditCave, LOG_RUNNING);
    B_LogEntry               (CH1_BanditCave,"Quentin kaza³ mi znaleŸæ Bandytów, którzy mieli przynieœæ dostawê stali z Nowego Obozu.");
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
   description	= "Znalaz³em stal.";
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
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_01"); //Znalaz³em stal.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_02"); //By³o tak, jak myœla³eœ.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_03"); //Ukryli siê w jaskini przy Nowym Obozie, a stal zamknêli w skrzyni.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_04"); //Daj mi tê stal.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_05"); //Dobra robota.
    B_GiveInvItems (other, self, ItQt_IronPack, 1);
	
    B_LogEntry               (CH1_BanditCave,"Znalezion¹ w skrzyni stal przynios³em Quentinowi.");
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
   description	= "Masz dla mnie jakieœ specjalne zadanie?";
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
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_01"); //Masz dla mnie jakieœ specjalne zadanie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_02"); //Jest coœ takiego.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_03"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_04"); //Magnaci s¹ w posiadaniu kilku pierœcieni. Ponoæ te pierœcienie maj¹ magiczn¹ moc.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_05"); //Ale nie obchodzi mnie to. Wiem, ¿e s¹ bardzo cenne. 
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_06"); //Ci idioci ze Starego Obozu sporo nam za nie zap³ac¹.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_07"); //Mam ukraœæ pierœcienie i przynieœæ je do ciebie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_08"); //Tak. Pogadaj z Miguelem. To nasz cz³owiek w Obozie. Znajdziesz go na targowisku.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_09"); //Goœæ zna Stary Obóz jak w³asn¹ kieszeñ.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_10"); //Dobra. Postaram siê przynieœæ ci te pierœcienie jak najszybciej.
    MIS_MagnackiePi4erscienie = LOG_RUNNING;

    Log_CreateTopic            (CH1_MagnackiePi4erscienie, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MagnackiePi4erscienie, LOG_RUNNING);
    B_LogEntry                     (CH1_MagnackiePi4erscienie,"Quentin kaza³ mi odszukaæ wszystkie magiczne pierœcienie nale¿¹ce do Magnatów. Pomóc mi w tym ma Miguel. ");
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
   description	= "Mam pierœcienie.";
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
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_01"); //Mam pierœcienie.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_02"); //Wiedzia³em, ¿e ci siê uda. 
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_03"); //Te pierœcienie z pewnoœci¹ siê nam przydadz¹.
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_04"); //Co chcesz z nimi zrobiæ?
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_05"); //Mam kilka pomys³ów, ale muszê to jeszcze przemyœleæ.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_06"); //Tymczasem weŸ swoj¹ rudê.
    B_LogEntry                     (CH1_MagnackiePi4erscienie,"Odda³em skardzione pierœcienie Quentinowi.");
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
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_02"); //Dobrze, ¿e mi przypomnia³eœ. Szpieg powróci³.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_03"); //Y'Berion szuka kogoœ, kto odnajdzie dla niego jakiœ stary artefakt.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_04"); //Poszukuje najemników, poniewa¿ nikt z Bractwa nie da³ rady.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_05"); //Wys³ali chyba jakiegoœ Nowicjusza. Nuras, czy jakiœ tam...
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_06"); //Ale do rzeczy. Za odnalezienie kamienia daje 2000 bry³ek rudy.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_07"); //To bardzo du¿o.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_08"); //IdŸ do Bractwa i przyjmij tê robotê. Przy okazji bêdziesz móg³ tam powêszyæ.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_09"); //Je¿eli odnajdziesz kamieñ i dostaniesz nagrodê, to podzielimy siê rud¹.
   /* AI_Output (other, self ,"DIA_Quentin_BRACTWO1_15_10"); //Je¿eli odnajdê kamieñ, to ta ruda bêdzie moja.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_11"); //Zapamiêtaj sobie coœ, ch³opcze. Bandyci wszystkim siê dziel¹.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_12"); //Pracujesz dla siebie i dla nas. Rozumiesz?
    AI_Output (other, self ,"DIA_Quentin_BRACTWO1_15_13"); //Teraz, tak.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_14"); //Wiêc idŸ ju¿.*/
    MIS_PSIcampWORK = LOG_RUNNING;

    Log_CreateTopic          (CH1_PSIcampWORK, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PSIcampWORK, LOG_RUNNING);
    B_LogEntry               (CH1_PSIcampWORK,"Mam udaæ siê do obozu na bagnie i przyj¹æ pracê od Y'Beriona. Chodzi o odnalezienie jakiegoœ kamienia. Zadanie powinno byæ dziecinnie proste. Za zlecenie mam otrzymaæ 2000 bry³ek rudy, które zwrócê Quentinowi.");
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
   description	= "Mam rudê.";
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
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_01"); //Mam rudê.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_02"); //Czyli uda³o ci siê wykonaæ zadanie?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_03"); //Tak. Odnalaz³em kamieñ ogniskuj¹cy.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_04"); //A ustali³eœ ju¿ fakty?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_05"); //Pracujê nad tym.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_06"); //Oto twoja dzia³ka.
    B_LogEntry                     (CH1_PSIcampWORK,"Odda³em rudê za zlecenie Quentinowi. Uzyska³em 500 bry³ek wynagrodzenia.");
	B_GiveXP (XP_HelpGUR);
    B_GiveInvItems (other, self, ItMiNugget, 2000);
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
	DIA_Quentin_GOLDY.permanent = false;
	} else {
	AI_Output (other, self ,"DIA_Quentin_GOLDY_15_07"); //Mam rudê. 
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_08"); //Jesteœ pewien, ¿e jest tu tyle ile potrzeba? Chyba nie przepi³eœ NASZEJ rudy?!
	DIA_Quentin_GOLDY.permanent = true;
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Ró¿ne dialogi
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
    AI_Output (self, other ,"DIA_Quentin_Zdrada_03_01"); //Zdradzi³eœ nas. Uwierzyliœmy, ¿e chcesz byæ jednym z nas.
    AI_Output (self, other ,"DIA_Quentin_Zdrada_03_02"); //Powinniœmy siê na ciebie rzuciæ, ale pamiêtamy co dla nas robi³eœ.
    AI_Output (self, other ,"DIA_Quentin_Zdrada_03_03"); //OdejdŸ i ju¿ nigdy wiêcej siê tu nie zjawiaj.
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 2
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 3
// W¹tek g³ówny
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
   description	= "Ustali³em fakty!";
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
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_01"); //By³em w Starej Kopalni. Stra¿nicy dostaj¹ rudê w zamian za zabijanie pe³zaczy.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_02"); //Ludzie z Bractwa szukaj¹ u pe³zaczy czegoœ szczególnego. 
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_03"); //Dziwnym trafem uda³o mi siê wpl¹taæ w tê sprawê.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_04"); //Potrzebna by³a im silniejsza wydzielina, jednak szukali jej w z³ym miejscu.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_05"); //Podj¹³em siê dla Cor Kaloma odnalezienia tego czegoœ, tej wydzieliny.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_06"); //Przynios³em mu jaja królowej pe³zaczy, o czym pewnie ju¿ wiesz.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_07"); //Jestem pe³en podziwu dla twoich czynów, ale opowiedz jeszcze o tym kontrakcie.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_08"); //Zasada by³a prosta. Za pomoc Stary Obóz dostawa³ ziele.
    //AI_Output (other, self ,"DIA_Quentin_HELLO112_15_09"); //Pewnie wiêkszoœæ przepalili, a czêœæ sprzedali do Nowego Obozu.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_10"); //Nie doœæ, ¿e Stra¿nicy Œwi¹tynni pomagaj¹ Gomezowi w têpieniu pe³zaczy, to jeszcze p³ac¹ mu za to, ¿e jego Stra¿nicy robi¹ to samo.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_11"); //WeŸ tê rudê. Spisa³eœ siê. 
	//quest log
    B_LogEntry               (CH1_PSIcampWORK,"Zda³em szczegó³owy raport Quentinowi. Wydajê mi siê jednak, ¿e to jeszcze nie koniec zawirowañ zwi¹zanych z Bractwem i Starym Obozem..");
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
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_02"); //Nie wiem, ch³opcze. Ostatnie wydarzenia nape³ni³y mnie niepokojem. Obawiam siê o to, co dzieje siê w Bractwie.
	
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_03"); //Có¿, pozostaje nam czekaæ na rozwój wydarzeñ.
   /* AI_Output (other, self ,"DIA_Quentin_LOSY_15_04"); //Tak wiêc zrobimy, a nawet choæby Gomez przyby³ pod Obóz to stawimy mu opór.
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_05"); //Tego siê w³aœnie obawiam...*/
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
   description	= "Przynoszê wieœci z Bractwa.";
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
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_01"); //Przynoszê wieœci z Bractwa.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_02"); //Co siê tam dzieje? D³ugo ciê nie by³o.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_03"); //Y'Berion nie ¿yje. Zgin¹³ podczas próby przywo³ania Œni¹cego.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_04"); //Cor Angar dowodzi teraz Bractwem. Mam udaæ siê do Nowego Obozu i za wszelk¹ cenê pomóc Magom Wody.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_05"); //Ta ca³a sytuacja zaczyna mnie niepokoiæ. Czy¿by ucieczka z tej piekielnej krainy by³a ju¿ blisko?
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_06"); //Nie mam pojêcia, ale bêdê siê stara³ abyœmy uciekli st¹d jak najprêdzej.
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
   description	= "Cor Angar wys³a³ mnie do Nowego Obozu.";
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
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_01"); //Cor Angar wys³a³ mnie do Nowego Obozu.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_02"); //W jakim celu?
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_03"); //Jedyn¹ nadziej¹ na ucieczkê z Kolonii wydaje siê byæ plan Magów Wody.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_04"); //Chyba nie mamy wyboru. Musisz spróbowaæ. Marwti mnie tylko jedna rzecz...
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_05"); //Jaka?
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_06"); //Chodzi o Cor Kaloma. To niebezpieczny cz³owiek.
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_07"); //Kalom wyrzek³ siê Bractwa. Guru uœwiadomili sobie, ¿e Œni¹cy nie jest tym, za kogo by³ uwa¿any. Ponoæ to prastary demon.
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_08"); //Cor Kalom nie chcia³ w to wierzyæ i odszed³ z Obozu.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_09"); //Wiesz mo¿e dok¹d siê uda³?
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_10"); //Nie mam pojêcia.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_11"); //Przypuszczam, ze udali siê w nieznane nam tereny - na orkowe ziemie.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_12"); //Jest tam ma³y obóz zapaleñców, zwanych ³owcami orków.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_13"); //Mamy z nimi dobre kontakty. Niejednokrotnie handlowaliœmy.
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_14"); //IdŸ do nich i wypytaj o Kaloma. Mo¿liwe, ¿e go widzieli.
    AI_Output (other, self ,"DIA_Quentin_HELLO1_15_15"); //Dlaczego to takie wa¿ne?
    AI_Output (self, other ,"DIA_Quentin_HELLO1_03_16"); //Kalom jest dla nas zagro¿eniem. Mo¿e œci¹gn¹æ na nas wszystkich zgubê.
    //AI_Output (other, self ,"DIA_Quentin_HELLO1_15_17"); //Pójdê do tych ³owców orków.
	//log
    MIS_SearchKalom = LOG_RUNNING;

    Log_CreateTopic         (CH3_SearchKalom, LOG_MISSION);
    Log_SetTopicStatus      (CH3_SearchKalom, LOG_RUNNING);
    B_LogEntry              (CH3_SearchKalom,"Cor Kalom uciek³ z Bractwa. Quentin uwa¿a, ¿e to niebezpieczny cz³owiek. Muszê udaæ siê do obozu ³owców orków i wypytaæ o to czy nie widzieli gdzieœ tego œwira.");
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
   description	= "Kalom uda³ siê do miasta orków.";
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
    AI_Output (other, self ,"DIA_Quentin_Kalom2_15_01"); //Kalom, wraz z kilkoma Stra¿nikami Œwi¹tynnymi uda³ siê do Miasta Orków.
    AI_Output (other, self ,"DIA_Quentin_Kalom2_15_02"); //£owcy orków ostatni raz widzieli go przy bagnie i tajemniczej wie¿y.
    AI_Output (self, other ,"DIA_Quentin_Kalom2_03_03"); //Cholera, co ten œwir mo¿e planowaæ?
    AI_Output (self, other ,"DIA_Quentin_Kalom2_03_04"); //Có¿... Pozostaje nam tylko mieæ nadziejê, ¿e orkowie zrobi¹ z nim porz¹dek zanim zrobi coœ g³upiego.
	//log
    B_LogEntry                     (CH3_SearchKalom,"Powiedzia³em Quentinowi, ¿e ³owcy orków widzieli Kaloma, który prawdopodobnie uda³ siê na ziemie orków. Pozostaje nam mieæ nadziejê, ¿e szalony Guru nie zrobi nic g³upiego.");
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
// Rozdzia³ 4
// W¹tek g³ówny
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
   description	= "Gomez wymordowa³ wszystkich Magów Ognia!";
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
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_01"); //Gomez wymordowa³ wszystkich Magów Ognia!
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_02"); //Co? Jak to siê sta³o?! Dopiero co dowiedzia³em siê o problemach w Starej Kopalni.
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_03"); //Po zawaleniu siê kopalni Gomez wpad³ w sza³. Jego przysz³oœæ jako szefa jest krucha. 
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_04"); //Wys³a³ oddzia³ Stra¿ników, którzy maj¹ poprzez sekretn¹ œcie¿kê przez góry dotrzeæ do Wolnej Kopalni i zaj¹æ j¹!
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_05"); //Nikt nie ma wstêpu do Starego Obozu, a co wiêcej Stra¿nicy i atakuj¹ ka¿dego, kto nie nosi na sobie czerwonego pancerza.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_06"); //¯a³osny akt desperacji. To w jego stylu. Ale ¿e nie oszczêdzi³ nawet Magów? Hmm...
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_07"); //Co teraz zrobimy?
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_08"); //Skoro ludzie Gomeza atakuj¹ ka¿dego, to tylko kwestia czasu zanim spróbuj¹ siê dobraæ do naszych ty³ków. Bêdziesz mia³ teraz du¿o pracy.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_09"); //Trzeba powiedzieæ wszystkim, ¿eby wrócili do Obozu i nie zwracali na sobie uwagi. Musisz porozmawiaæ z Ratfordem i Draxem. Ka¿ im siê ukryæ. 
	AI_Output (self, other ,"DIA_Quentin_HELLO35_03_10"); //Ostatnio z Obozu zniknê³o te¿ dwóch Bandytów. To dosyæ podejrzana sprawa. Mam nadziejê, ¿e nie wpadli w sid³a Stra¿ników. 
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_11"); //Niech ostrzeg¹ naszych ¿eby siê nie wychylali. Jeœli Stra¿nicy wziêliby ich do niewoli mogliby siê wygadaæ o naszym Obozie.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_12"); //Z obozu zniknê³o tak¿e kilku moich ludzi. ZnajdŸ ich. Mo¿e Ratford i Drax dadz¹ ci jakieœ wskazówki.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_13"); //Na razie to wszystko. Zrób co ci kaza³em. Nie ma czasu do stracenia.
	//log
	//zadanie nie jest ju¿ rozpoczynane u Draxa
	//if (MIS_RozwalaUBnadytow != LOG_RUNNING)
	//{
        MIS_RozwalaUBnadytow = LOG_RUNNING;
        Log_CreateTopic          (CH1_RozwalaUBnadytow, LOG_MISSION);
        Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_RUNNING);
        B_LogEntry               (CH1_RozwalaUBnadytow,"Sytuacja nie wygl¹da zbyt dobrze. W tym ca³ym zamieszaniu Stra¿nicy mog¹ próbowaæ odnaleŸæ Obóz Bandytów. Musimy powzi¹æ œrodki ostro¿noœci. Quentin kaza³ mi porozmawiaæ z Draxem i Ratfordem, obaj maj¹ wróciæ do Obozu. Pryz okazji mam odnaleŸæ kilku Bandytów, którzy zniknêli z Obozu.");  
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
   description	= "Rozmawia³em z Draxem i przy okazji odnalaz³em Bandytów!";
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
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_01"); //Rozmawia³em z Draxem i przy okazji odnalaz³em Bandytów!
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_02"); //A wiêc ¿yj¹? Gdzie s¹?
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_03"); //Ratford zgin¹³ z r¹k Stra¿ników, którzy udali siê w kierunku opuszczonej kopalni.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_04"); //Drax postanowi³ siê zemœciæ na ludziach Gomeza i organizuje atak na patrole Stra¿ników.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_05"); //Zwo³a³ Bandytów i formuj¹ ma³y oddzia³. Ci, którzy zniknêli z Obozu s¹ z nim.
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_06"); //Musisz go jak najszybciej od tego odci¹gn¹æ. Stra¿nicy mog¹ siê teraz ³atwo zorientowaæ o po³o¿eniu naszego obozu!
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_07"); //Ju¿ za póŸno. Próbowa³em przemówiæ mu do rozs¹dku, ale jest opêtany ¿¹dz¹ zemsty.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_08"); //Teraz decyzja nale¿y do ciebie. Chcesz mu pomóc, czy nie?
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_09"); //Pójdziemy z nim. Ja, ty i kliku naprawdê dobrych ludzi. Drax nie jest mistrzem wojennego rzemios³a. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_10"); //Gdybyœmy zostawili go samego, to tak jakbyœmy powiedzieli Gomezowi, gdzie jest nasz Obóz. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_11"); //IdŸ do niego i powiedz mu, ¿eby na nas poczeka³. Nie pójdê mordowaæ Stra¿ników bez przygotowania.
	//log
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Quentin zgodzi³ siê pomóc Draxowi. W sumie to nie mia³ za du¿ego wyboru... Mam wróciæ do Draxa i powiedzieæ mu, ¿eby poczeka³ na wsparcie z Obozu.");
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
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_02"); //Wszystko przemyœla³em. Pójdê ja, ty, Drax i Pun. Reszta naszych ludzi nie nadaje siê do tego zadania, a ci którzy zostan¹ musz¹ kontrolowaæ sytuacjê podczas mojej nieobecnoœci.
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_03"); //Musisz teraz pogadaæ z dwiema osobami Jensem i Briamem.
    AI_Output (self, other ,"DIA_Quentin_nextWork22_03_04"); //Jensa poproœ o ciê¿ki pancerz, a Briama o pomocne podczas walki eliksiry.
	//log
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Quentin zezwoli³ mi na otrzymanie ciê¿kiej zbroi Bandyty od Jensa. Briam ponadto da mi kilka eliksirów. Powinienem bez zw³oki z nimi porozmawiaæ.");
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
    AI_Output (self, other ,"DIA_Quentin_Idea_03_01"); //Zaczekaj! Coœ mi siê przypomnia³o.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_02"); //Ca³kiem zapomnia³em, ¿e mam kilku przyjació³ w obozie ³owców orków.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_03"); //Znaliœmy siê z ich dowódc¹ jeszcze w dalekiej przesz³oœci.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_04"); //To dobrzy wojownicy. Z pewnoœci¹ pomog¹ nam pozbyæ siê tych Stra¿ników.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_05"); //IdŸ do nich i poproœ o kilku wojowników. Powo³aj siê na moj¹ znajomoœæ z Wilsonem.
	//quest log
    MIS_SupportFromOrcHunters = LOG_RUNNING;
    Log_CreateTopic      (CH4_SupportFromOrcHunters, LOG_MISSION);
    Log_SetTopicStatus   (CH4_SupportFromOrcHunters, LOG_RUNNING);
    B_LogEntry           (CH4_SupportFromOrcHunters,"Mam odnaleŸæ obóz ³owców orków. Ich szef podobno zna³ siê z Quentinem, dlatego ten teraz liczy na jego pomoc. Obozu mam szukaæ w jaskini bêd¹cej czêœci¹ œciany skalnej oddzielaj¹cej Stary Obóz od Ziem Orków.");
	B_LogEntry           (CH1_RozwalaUBnadytow,"Ju¿ mia³em braæ siê do roboty, gdy nagle ponownie zaczepi³ mnie Quentin. Poprosi³ o odnalezienie obozu ³owców orków i poproszenie ich o pomoc. Obozu mam szukaæ w jaskini bêd¹cej czêœci¹ œciany skalnej oddzielaj¹cej Stary Obóz od Ziem Orków.");
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
   description	= "Dwóch ludzi Wilsona ju¿ tu idzie.";
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
    AI_Output (other, self ,"DIA_Quentin_QuestOk890976_15_01"); //Dwóch ludzi Wilsona ju¿ tu idzie. S¹ to Rakus i Osko, jedni z najlepszych ³owców orków.
    AI_Output (self, other ,"DIA_Quentin_QuestOk890976_03_02"); //To nie tak Ÿle. Wiêksza grupa mog³a by wzbudziæ zamieszanie.
	//log
    B_LogEntry               (CH4_SupportFromOrcHunters,"Powiedzia³em Quentinowi, ¿e uda³o mi siê przekonaæ Wilsona, aby przys³a³ nam kilku ludzi do pomocy. Nasze si³y teraz znacznie wzrosn¹.");
	B_LogEntry               (CH1_RozwalaUBnadytow,"Wilson przyœle do obozu dwóch swoich najlepszych wojowników. Powiedzia³em o tym szefowi.");
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
    if ((Npc_HasItems (hero,BAU_ARMOR_H)>= 1) //warunek zosta³ zmieniony poniewa¿ opcja by³a perm 
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
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_02"); //Œwietnie. Ja za ten czas zaj¹³em siê sprawami organizacyjnymi. Doyle dopilnuje, ¿eby ten ca³y pierdolnik nie rozpad³ siê podczas mojej nieobecnoœci.
	AI_Output (other, self ,"DIA_Quentin_WykonanoXD_15_03"); //Myœlê, ¿e to dobra decyzja.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_04"); //Zostan¹ te¿ Rocky i Emanuel. Powinni sobie poradziæ.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_04"); //Nie wiem tylko jaki Drax ma plan ataku. Mam nadziejê, ¿e wszystko przygotowa³. Lepiej ju¿ do niego chodŸmy. 
    B_LogEntry               (CH1_RozwalaUBnadytow,"Przygotowa³em wszystko co by³o trzeba. Teraz musimy udaæ siê do Draxa. Quentin powierzy³ mu dowództwo nad ca³¹ wypraw¹. Widzê jednak, ¿e nie jest zachwycony ca³¹ t¹ wypraw¹. Sprawia wra¿enie zamyœlonego. Byæ mo¿e obawia siê konsekwencji ataku na ludzi Gomeza.");
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
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_01"); //Ha Ha! Dawno nie by³o tu takiej rzezi! Dobra robota!
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_02"); //Ch³opaki, zwijajmy siê zanim ktoœ reszta Stra¿ników zorientuje siê co siê sta³o. 
    //AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_03"); //A czego siê obawia³eœ?
    //AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_04"); //Zasadzki ze strony Gomeza. Ale to ju¿ nie wa¿ne... Stra¿nicy z obozu pewnie nawet nas nie dostrzegli.
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_05"); //Chocia¿ pewnie te dupki s¹ zbyt zajête us³ugiwaniem Gomezowi...
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_06"); //Na mnie ju¿ pora...
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_07"); //Czekaj, gdzie chcesz iœæ? 
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_08"); //Mam jeszcze du¿o spraw do za³atwienia.
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_09"); //Kilka chwil nic nie zmieni. ChodŸ z nami do obozu. Trzeba uczciæ zwyciêstwo.
    
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
	
	Npc_ExchangeRoutine (BAN_1605_Rocky,"ucieczka");//Rocky ucieczka przed obóz
	Npc_RemoveInvItem (BAN_1605_Rocky, BAU_ARMOR_H);//usuniêcie pancerza
	
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

	//K³opoty Bandytów jednak siê nie skoñczy³y. Stra¿nicy zajêli Obóz i zniewolili Bandytów. Rocky uciek³ i stoi przed Obozem.
	Wld_InsertNpc				(GRD_2271_Stra¿nik,"OC1");	
	Wld_InsertNpc				(GRD_2272_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2273_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2274_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2275_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2276_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2277_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2278_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2279_Stra¿nik ,"OC1");
	Wld_InsertNpc				(GRD_2283_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2282_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2284_Stra¿nik  ,"OC1");
	Wld_InsertNpc				(GRD_2290_Stra¿nik  ,"OC1");
	Npc_ExchangeRoutine			(GRD_3935_Hector,"misja"); //boss
	
	B_LogEntry               (CH1_AtakNaSO,"Quentin równie¿ ucieszy³ siê z takiego przebiegu wydarzeñ. Nie pozosta³o nam nic innego jak zaszyæ siê ponownie w górskim obozie.");
    Log_SetTopicStatus       (CH1_AtakNaSO, LOG_SUCCESS);
    MIS_AtakNaSO = LOG_SUCCESS;
};

/////////// opcja usuniêta - dialog z Rockym jest pierwszy
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
    AI_Output (self, other ,"DIA_Quentin_DAEADALL_03_01"); //Stój! Nie idŸ dalej!
    AI_Output (other, self ,"DIA_Quentin_DAEADALL_15_02"); //Co? O co chodzi? Dlaczego nie jesteœcie w Obozie?
    AI_Output (self, other ,"DIA_Quentin_DAEADALL_03_03"); //Stra¿nicy znaleŸli nasz Obóz! Tylko Rocky uciek³.
    AI_Output (other, self ,"DIA_Quentin_DAEADALL_15_04"); //Musimy odbiæ nasz¹ kryjówkê!
    AI_Output (self, other ,"DIA_Quentin_DAEADALL_03_05"); //Nie mamy innego wyjœcia. Porozmawiaj uprzednio z Rockym. Nieco go obdarli, ale najwa¿niejsze, ¿e ¿yje.
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
   description	= "Masz ju¿ jakiœ plan?";
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
    AI_Output (other, self ,"DIA_Quentin_Plan_15_01"); //Rozmawia³em z Rocky'm. Masz ju¿ jakiœ plan?
    AI_Output (self, other ,"DIA_Quentin_Plan_03_02"); //Jedynym sensownym wyjœciem wydajê mi siê szybki i nag³y atak. Wci¹¿ mamy kilku dobrych ludzi. Jeœli Stra¿nicy nie zd¹¿¹ siê zabarykadowaæ, to damy radê.
    AI_Output (other, self ,"DIA_Quentin_Plan_15_03"); //Chyba nie mamy innego wyboru. 
    AI_Output (self, other ,"DIA_Quentin_Plan_03_04"); //Dobrze, ¿e siê zgadzamy. Niech wszyscy opatrz¹ rany, zjedz¹ coœ i od razu bierzemy siê do roboty. 
	
	//nieu¿ywane
//	AI_Output (self, other ,"DIA_Quentin_Plan_03_05"); //Chcia³bym ci to daæ, zanim wyruszymy. 
//	AI_Output (self, other ,"DIA_Quentin_Plan_03_06"); //To nowy pancerz. Z pewnoœci¹ ci siê przyda. Czeka nas nie³atwa walka.
//	AI_Output (other, self ,"DIA_Quentin_Plan_15_07"); //Dziêki. 

	//stara zmienna (byæ mo¿e u¿ywana jeszcze w jakimœ dialogu - nie przeszkadza)
	PlanA = true;
	
	B_LogEntry          (CH1_zniewolenie,"Aby odbiæ nasz Obóz, bêdziemy musieli szybko i skutecznie zaatakowaæ niespodziewaj¹cych siê nas Stra¿ników. Tak swój plan przedstawi³ mi Quentin.");
	//Armor daje Jens przed atakiem
	/*CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,BAU_ARMOR_H);
	AI_EquipBestArmor	(other); */
	
	//wybory s¹ nieu¿ywane
	//Info_ClearChoices		(DIA_Quentin_Plan);
	//Info_AddChoice		(DIA_Quentin_Plan, "UwiêŸmy Stra¿ników bêd¹cych w kanionie.", DIA_Quentin_Plan_PalisadeZbudjmy);
    //Info_AddChoice		(DIA_Quentin_Plan, "Sprowadzimy górskie trolle do Obozu.", DIA_Quentin_Plan_Trolllle);
    //Info_AddChoice		(DIA_Quentin_Plan, "Przygnieciemy ich kamieniami.", DIA_Quentin_Plan_Inne);
};

FUNC VOID DIA_Quentin_Plan_PalisadeZbudjmy()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_01"); //UwiêŸmy Stra¿ników bêd¹cych w kanionie.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_02"); //Jak chcesz to zrobiæ?
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_03"); //Zaatakujemy szybko. Wybijemy wszystkich pilnuj¹cych wejœcia, po czym w¹ski przesmyk zabudujemy.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_04"); //To siê mo¿e udaæ!
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_05"); //Musimy wszystkich zmobilizowaæ do budowy.
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_06"); //Jeszcze nie odbiliœmy Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_07"); //Ju¿ widzê jak to zrobiliœmy.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_08"); //Ch³opcze, chyba zas³ugujesz na tak¹ zbrojê jak moja.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_09"); //Niech ci s³u¿y w walce!
    CreateInvItems (self, BAU_ARMOR_H, 2);
    B_GiveInvItems (self, hero, BAU_ARMOR_H, 1);
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, BAU_ARMOR_H);
	PlanA = true;
    B_LogEntry                     (CH1_zniewolenie,"Postanowi³em, ¿e po szybkim ataku uwiêzimy pozosta³ych Stra¿ników w Obozie.");

    B_GiveXP (1000);
    Info_ClearChoices		(DIA_Quentin_Plan);
};

FUNC VOID DIA_Quentin_Plan_Trolllle()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_01"); //Sprowadzimy górskie trolle do Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_Trolllle_03_02"); //Jak chcesz to zrobiæ?
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_03"); //Skorzystamy z pomocy Magów Wody.
    B_LogEntry                     (CH1_zniewolenie,"Postanowi³em poprosiæ o pomoc Magów Wody. Sprowadzimy górskie trolle do Obozu. One z pewnoœci¹ za³atwi¹ sprawê za nas.");
    PlanB = true;
    B_GiveXP (500);
    Info_ClearChoices		(DIA_Quentin_Plan);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_Plan_Inne()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_01"); //Przygnieciemy ich kamieniami.
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_02"); //Chcesz wywo³aæ lawinê?

    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_03"); //Skorzystam z pomocy jakiegoœ maga.
    
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_04"); //¯yczê ci powodzenia. PrzyjdŸ jak coœ przygotujesz.
	B_LogEntry                     (CH1_zniewolenie,"Uwa¿am, ¿e sprowadzenie lawiny to dobry pomys³. Potrzebujê tylko jakiegoœ maga i Ÿród³a mocy.");

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
    AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_02"); //Tak, jednak zanim to zrobimy, powinieneœ wiedzieæ czego mo¿na siê tam spodziewaæ. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_03"); //Rocky mówi³ o grupie Stra¿ników...
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_04"); //S¹dzisz, ¿e przyszli tu sami? Jako niezorganizowana ha³astra? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_05"); //W Obozie jest z pewnoœci¹ jeszcze ktoœ.
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_06"); //Czy¿by sam Thorus?
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_07"); //Byæ mo¿e... Albo któryœ z Magnatów. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_08"); //Chcesz siê wycofaæ? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_09"); //Nie, po prostu lepiej zachowaæ czujnoœæ. Skup siê na g³ównym przeciwniku. My zajmiemy siê reszt¹. 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_10"); //A teraz prowadŸ. 
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
	
	//ci dwaj chyba stoj¹ tam gdzie Ratford i Drax i nie brali udzia³u w walce
	ORG_864_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (ORG_864_Raeuber,"help");
	
	ORG_869_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (ORG_869_Raeuber,"help");
	
    AI_StopProcessInfos	(self);
	
	//nieu¿ywane od 1.2
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
	//&& (Npc_IsDead(GRD_2281_Stra¿nik))
	//&& (Npc_IsDead(GRD_2282_Stra¿nik))
	//&& (Npc_IsDead(GRD_2283_Stra¿nik))
	//&& (Npc_IsDead(GRD_2284_Stra¿nik))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_54_Info()
{
    AI_Output (self, other ,"DIA_Quentin_54_03_01"); //Dobra robota! To ju¿ chyba wszyscy. Reszta albo zwieje, albo zaraz bedzie gryŸæ ziemiê.
    AI_Output (other, self ,"DIA_Quentin_54_15_02"); //Obóz znów jest nasz!
    AI_Output (self, other ,"DIA_Quentin_54_03_03"); //Kim by³ dowódca Stra¿ników? 
	AI_Output (other, self ,"DIA_Quentin_54_15_04"); //To Skelden, jeden z najbardziej wp³ywowych Stra¿ników w Starym Obozie. 
	AI_Output (self, other ,"DIA_Quentin_54_03_05"); //To nie lada wyczyn wygraæ z kimœ takim. Dobrze, ¿e ten typ ju¿ gryzie piach. 
	//log
    B_LogEntry               (CH1_zniewolenie,"Podczas gdy Bandyci eliminowali Stra¿ników, jak skupi³em siê na zabiciu niejakiego Skeldena. To silny i doœwiadczony cz³onek przybocznej stra¿y Gomeza. Walka z nim nie by³a ³atwa, jednak ostatecznie uda³o mi siê wys³aæ go w zaœwiaty. Obóz znów jest nasz, jednak teraz czeka nas du¿o pracy z przywróceniem temu miejscu dawnej œwietnoœci.");
    Log_SetTopicStatus       (CH1_zniewolenie, LOG_SUCCESS);
    MIS_zniewolenie = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_KillAllgardist);
	//powrót bandytów do obozu
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
	
	//powrót do obozu ³owców
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
   description	= "Wszystko w porz¹dku?";
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
    AI_Output (other, self ,"DIA_Quentin_findFriends_15_01"); //Wszystko w porz¹dku?
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_02"); //Gdzieœ mi znikn¹³ Drax i Doyle. Nikt ich nie widzia³. Czêœæ naszych sprawdza trupy, ale tych dwóch chyba wœród nich nie ma.
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_03"); //Poszukaj ich. Mo¿e uciekli podobnie jak Rocky?
	AI_Output (other, self ,"DIA_Quentin_findFriends_15_04"); //Chwila, przecie¿ Drax by³ z nami. 
	AI_Output (self, other ,"DIA_Quentin_findFriends_03_05"); //Hmm... To siê zgadza, ale przecie¿ nie pojawi³ siê póŸniej. Znikn¹³ mi z oczu, gdy wracaliœmy z okolic Starego Obozu. 
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_06"); //Musisz ich jak najszybciej odnaleŸæ. Mo¿liwe, ¿e potrzebuj¹ naszej pomocy.
	//log
    MIS_FindFriends = LOG_RUNNING;
    Log_CreateTopic          (CH1_FindFriends, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindFriends, LOG_RUNNING);
    B_LogEntry               (CH1_FindFriends,"W odbitym Obozie nie znaleŸliœmy Doyla. Mo¿liwe, ¿e gdzieœ uciek³ lub porwali go Stra¿nicy. Ponadto zagin¹³ Drax. Muszê odnaleŸæ ich obu. Bez ¿adnych wskazówek to nie bêdzie zbyt proste.");
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
   description	= "Znalaz³em Draxa.";
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
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_01"); //Znalaz³em Draxa.
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_02"); //I co z nim? Gdzie jest?
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_03"); //W innym, lepszym œwiecie. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_04"); //Co to znaczy? Nie ¿yje? 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_05"); //Tak, jednak to nie koniec rewelacji. Wbi³ sobie nó¿ prosto w serce, ale zanim to zrobi³, napisa³ niezgrabny list. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_06"); //Jaki list? Nie wiedzia³em, ¿e niektórzy spoœród moich ludzi potrafi¹ pisaæ. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_07"); //Drax potrafi³. W liœcie przyzna³ siê do tego, ¿e to on zabi³ Ratforda, a nie Stra¿nicy. PóŸniej doszed³ do w¹tpliwego porozumienia ze Stra¿nikami. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_08"); //Mów jaœniej, do cholery. Nie jestem jakimœ magiem! 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_09"); //Tej historii nie da siê opowiedzieæ jednym zdaniem. Daj mi dokoñczyæ. 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_10"); //Stra¿nicy obiecali mu rudê w zamian za wci¹gniêcie mnie w pu³apkê. Podwajali nagrodê, jeœli przyprowadzi³by równie¿ ciebie. 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_11"); //Jednak Drax nie spodziewa³ siê, ¿e pójdzie z nami Pun, oraz ludzie z obozu ³owców orków. Ca³a sprawa mia³a siê zakoñczyæ ju¿ na pierwszym posterunku Stra¿ników. Mieli nas wykoñczyæ. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_12"); //Nie uda³o im siê...
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_13"); //Nie wszystko posz³o zgodnie z ich planem. Stra¿nicy ze wszystkich trzech posterunków mieli siê zjawiæ w pierwszym, tak aby mieli znaczn¹ przewagê. Widocznie siê nie dogadali lub coœ stanê³o im na drodze. 
	AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_14"); //Ostatecznie pozostali w trzech grupach, co u³atwi³o nam ich eliminacjê. Po wszystkim Drax do reszty zg³upia³. Nie wiedzia³, co ma zrobiæ, wiêc po tym wszystkim da³ nogê. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_15"); //Nie spodziewa³em siê, ¿e z niego kawa³ takiego sukinsyna. 
	AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_16"); //Zas³u¿y³ na taki los. 
	//log
	B_LogEntry                     (CH1_FindFriends,"Przywódca Bandytów by³ zaskoczony t¹ zdrad¹. Daliœmy siê nieŸle oszukaæ...");
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
   description	= "Odnalaz³em i sprowadzi³em Doyla.";
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
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_01"); //Odnalaz³em i sprowadzi³em Doyla.
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_02"); //Postanowi³ udaæ siê do Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_03"); //(ironicznie) Wybra³ sobie œwietny moment... Czy ju¿ nikt w tym cholernym Obozie nie u¿ywa g³owy?!
	AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_06"); //Kaza³em mu wróciæ do Obozu.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_07"); //Najwy¿sza pora... Bêdê mia³ dla was jeszcze trochê roboty. 
	//log
    B_LogEntry                     (CH1_FindFriends,"Zg³osi³em Quentinowi, gdzie znalaz³em Doyla. Szef Bandytów by³ na niego nieŸle wkurzony.");
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
   description	= "Dzia³o siê coœ podczas mojej nieobecnoœci?";
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
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_01"); //Dzia³o siê coœ podczas mojej nieobecnoœci?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_02"); //Wróci³o do mnie kilku zwiadowców.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_03"); //Czego siê dowiedzieli?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_04"); //Ponoæ Gomez wys³a³ kilkunastu Stra¿ników wraz z Kopaczami w kierunku placu wymian.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_05"); //Co to mo¿e oznaczaæ?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_06"); //Opuszczona Kopalnia, ch³opcze. Opuszczona Kopalnia...
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_07"); //Przypuszczam, ¿e chc¹ wznowiæ wydobycie. Nie wiem w jakim stanie jest ta kopalnia, ale to mo¿e im siê udaæ.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_08"); //W takim razie musimy czym prêdzej im przeszkodziæ!
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_09"); //Otó¿ to! Trzeba wys³aæ zorganizowana grupê Bandytów, którzy oczyszcz¹ kopalniê.
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_10"); //Zadalibyœmy potê¿ny cios Gomezowi.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_11"); //I to pewnie ja otrzyma³em ten zaszczyt?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_12"); //Nie raz udowodni³eœ mi, ¿e jesteœ dobrym wojownikiem i œwietnym przywódc¹.
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_13"); //Poproœ Doyle'a o pomoc. Eksplorowa³ ju¿ ongiœ jakieœ podziemia.
	AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_14"); //Dobrze, ¿e uda³o ci siê go sprowadziæ. 
	//log
	B_LogEntry         (CH1_FindFriends,"Odnalaz³em obu Bandytów, co koñczy moje zadanie.");
    Log_SetTopicStatus (CH1_FindFriends, LOG_SUCCESS);
	MIS_FindFriends = LOG_RUNNING;
	//log 2
    MIS_OdbijanieOpKop = LOG_RUNNING;
    Log_CreateTopic          (CH1_OdbijanieOpKop, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OdbijanieOpKop, LOG_RUNNING);
    B_LogEntry               (CH1_OdbijanieOpKop,"Quentin znów ma plan. Tym razem muszê udaæ siê wraz z grupk¹ Bandytów do Opuszczonej Kopalni. Mamy pozbyæ siê Stra¿ników i zaj¹æ kopalniê dla siebie. Powinienem uprzednio pogadaæ z Doylem.");
	//story func
    B_Story_FocusCorristoQuest ();
	//stuff
	//Wld_SendTrigger("KOPALNIAEXIT");
	Wld_InsertNpc				(GRD_2291_Stra¿nik,"OC1");
	Wld_InsertNpc				(GRD_2292_Stra¿nik,"OC1");
	Wld_InsertNpc				(GRD_2293_Stra¿nik,"OC1");
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
   description	= "Oczyœci³em kopalniê ze Stra¿ników i o¿ywieñców.";
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
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_01"); //Oczyœci³em kopalniê ze Stra¿ników i o¿ywieñców.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_02"); //O¿ywieñców? Co tam do cholery siê dzia³o?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_03"); //Pewien nekromanta urz¹dzi³ tam sobie koszary dla swojej armii nieumar³ych. Uda³o mi siê go pokonaæ i odebraæ artefakt, który dawa³ mu moc. 
	AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_04"); //Szkoda, ¿e jak zwykle musia³em wszystko zrobiæ sam. 
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_05"); //¯eby ci to wynagrodziæ dam ci rudê, któr¹ przeznaczy³em dla Doyle'a. Natychmiast wysy³am oddzia³ Bandytów do kopalni.
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_06"); //Czym teraz mam siê zaj¹æ?
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_07"); //Potrzebujemy jeszcze jakiegoœ doœwiadczonego Kopacza, który pokierowa³by ludŸmi.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_08"); //Móg³byœ coœ zorganizowaæ?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_09"); //Postaram siê.
	//log
	MIS_OdbijanieOpKop = LOG_SUCCESS;
    Log_SetTopicStatus       (CH1_OdbijanieOpKop, LOG_SUCCESS);
    B_LogEntry               (CH1_OdbijanieOpKop,"Powiedzia³em Quentinowi o wszystkim, co wydarzy³o siê w opuszczonej kopalni. Moje zadanie dobieg³o koñca.");
	//new quest
	MIS_MineChlopy = LOG_RUNNING;
	Log_CreateTopic          (CH1_MineChlopy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MineChlopy, LOG_RUNNING);
    B_LogEntry               (CH1_MineChlopy,"Quentin natychmiast wys³a³ oddzia³ Bandytów do kopalni. Maj¹ zacz¹æ tam pracê, jednak najpierw potrzebny jest ktoœ z doœwiadczeniem, kto pokieruje wydobyciem. Muszê odnaleŸæ odpowiedniego cz³owieka. Sêk w tym, ¿e najlepsi in¿ynierowie byli w Starym Obozie... ");
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
   description	= "Guy chce dla ciebie pracowaæ.";
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
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_01"); //Guy chce dla ciebie pracowaæ.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_03"); //By³y Kopacz, który uciek³ ze Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_04"); //Z pewnoœci¹ ma sporo doœwiadczenia.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_05"); //WeŸ tê rudê.
	if (Npc_KnowsInfo (hero, DIA_Quentin_NegocjacieNc))
	{
	AI_Output (self, other ,"DIA_Quentin_GuyWork_03_10"); //Powiedz Lee, ¿e wyœlê swoich ludzi.
	};
	//log
	MIS_MineChlopy = LOG_SUCCESS;
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry               (CH1_MineChlopy,"Powiedzia³em Quentinowi, ¿e Guy bêdzie dla niego pracowa³. Ten cz³owiek ma du¿e doœwiadczenie.");
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
   description	= "Mo¿na powiedzieæ, ¿e osi¹gnêliœmy sukces.";
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
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_01"); //Mo¿na powiedzieæ, ¿e osi¹gnêliœmy sukces.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_02"); //Masz racjê. Uda³o nam siê zadaæ cios Gomezowi.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_03"); //Jednak wci¹¿ musimy byæ czujni.
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_04"); //Jaki bêdzie kolejny cel Bandytów?
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_05"); //Jak zawsze: prze¿yæ jak najd³u¿ej.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_06"); //Mam nadziejê, ¿e sytuacja w Kolonii nied³ugo siê uspokoi.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_07"); //A mo¿e wreszcie czeka nas wolnoœæ?
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_08"); //Kto wie? Mo¿e to ty nas ocalisz?
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
   description	= "A co ze Star¹ Kopalni¹?";
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
    AI_Output (other, self ,"DIA_Quentin_OldMine_15_01"); //A co ze Star¹ Kopalni¹?
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_02"); //Od dawna nie mamy stamt¹d ¿adnych wieœci.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_03"); //Wybierz siê tam i zobacz, co siê tam wyprawia.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_04"); //Tylko nie idŸ prosto do obozu. Obserwuj z daleka. Nie chcia³bym ¿eby po tym wszystkim Stra¿nicy przerobili ciê na pasztet.
	//log
    MIS_SytucajaWOM = LOG_RUNNING;
    Log_CreateTopic          (CH1_SytucajaWOM, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SytucajaWOM, LOG_RUNNING);
    B_LogEntry               (CH1_SytucajaWOM,"Zapyta³em Quentina o to, co siê dzieje w Starej Kopalni. Sadzi³em, ¿e przywódca Bandytów bêdzie coœ wiedzia³ od swoich szpiegów. Ku mojemu zaskoczeniu niczego nowego nie wiedzia³ Zaproponowa³ mi, abym siê tam pokrêci³ i czegoœ dowiedzia³.");
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
   description	= "By³em w pobli¿u obozu.";
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
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_01"); //By³em w pobli¿u obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_02"); //I co siê tam dzieje?
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_03"); //Podobno Stra¿nicy sprzeciwili siê w³adzy Gomeza.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_04"); //Zabili jakiegoœ Magnata. który mia³ tymczasowo zaj¹æ siê obozem.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_05"); //Gomez jeszcze nie wie, ¿e utraci³ wp³ywy w obozie przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_06"); //Gdy siê dowie, wpadnie w sza³.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_07"); //I w³aœnie o to nam chodzi, ch³opcze!
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_08"); //Jak dobrze pójdzie, to wybij¹ siê sami.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_09"); //Masz jakiœ plan?
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_10"); //Musisz znaleŸæ kogoœ, kto zaniesie informacje o tym co siê sta³o w kopalni do Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_11"); //Mo¿e znasz kogoœ kto uciek³, ale wci¹¿ ma dobre kontakty?
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_12"); //Nie wiem. Pomyœl, poszukaj, pogadaj i przyjdŸ do mnie póŸniej.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_13"); //Zobaczê co da siê zrobiæ.
	//log
    B_LogEntry                     (CH1_SytucajaWOM,"Quentin ucieszy³ siê z takiego obrotu sprawy. Mam znaleŸæ kogoœ, kto powie ludziom Gomeza o tym co sta³o siê w obozie przy Starej Kopalni.");
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
   description	= "Skorpion zaniesie do Starego Obozu informacjê o zdarzeniach z obozu przed kopalni¹.";
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
    AI_Output (other, self ,"DIA_Quentin_ZlatwioneXDXD_15_01"); //Skorpion zaniesie do Starego Obozu informacjê o zdarzeniach z obozu przed kopalni¹.
    AI_Output (self, other ,"DIA_Quentin_ZlatwioneXDXD_03_02"); //Dobra robota. Nie wiem jak dogada³eœ siê ze Stra¿nikiem, ale liczy siê efekt. 
    AI_Output (self, other ,"DIA_Quentin_ZlatwioneXDXD_03_03"); //Teraz skoro Gomez ju¿ o wszystkim wie, z pewnoœci¹ wys³a³ ju¿ tam kolejne oddzia³y swoich ludzi.
    AI_Output (self, other ,"DIA_Quentin_ZlatwioneXDXD_03_04"); //Ponownie zakradnij siê w pobli¿e kopalni i zobacz co siê tam dzieje. 
	//log
    B_LogEntry                     (CH1_SytucajaWOM,"Pora zobaczyæ skutki naszych dzia³añ... Mam wróciæ w okolice kopalni i siê rozejrzeæ.");
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
   description	= "Rozmawia³em z Artegorem z obozu przed kopalni¹.";
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
   // AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_01"); //Uda³o nam siê!
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_02"); //Rozmawia³em z Artegorem z obozu przed kopalni¹.
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_03"); //Wszyscy nie ¿yj¹. Stra¿nicy wybili siê do nogi. Prze¿y³ tylko on.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_04"); //Wiedzia³em! Wiedzia³em, ¿e nam siê uda!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_05"); //Gomez wpakowa³ siê w niema³e k³opoty. Zosta³o mu ma³o ludzi do obrony obozu.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_06"); //Wkrótce skoñczy ze sztyletem w gardle!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_07"); //Nie musimy siê ju¿ obawiaæ Starego Obozu. Jest ich zbyt ma³o, aby cokolwiek zdzia³aæ. 
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_08"); //A ty, ch³opcze? Czym teraz siê zajmiesz?
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_09"); //Pewnie bêdê pomaga³ Magom Wody nam siê st¹d wydostaæ.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_10"); //W takim razie, powodzenia. Pamiêtaj, ¿e tutaj zawsze mo¿esz wróciæ.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_11"); //Masz tu kilka mikstur na drogê. Zrabowa³em je lata temu.
	//log
    B_LogEntry               (CH1_SytucajaWOM,"Potêga Gomeza podupad³a na tyle, ¿e Quentin odetchn¹³ z ulg¹. Obóz Bandytów jest na razie bezpieczny, a moja misja w nim dobiega koñca.");
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
// Rozdzia³ 4
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
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_01"); //Podobno spotka³eœ piratów w Kolonii.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_02"); //Tak. Spotka³em ich na pla¿y niedaleko Wie¿y Mgie³.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_03"); //Ich statek siê rozbi³ i zostali zaatakowani przez Stra¿ników.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_04"); //Gomez chyba do reszty zg³upia³.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_05"); //Patroluje ca³¹ Dolinê.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_06"); //Chcia³eœ coœ od tych piratów?
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_07"); //Dawno temu tak¿e by³em piratem.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_08"); //Nie jakimœ tam kapitanem. Zwyk³ym szczurem okrêtowym.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_09"); //Zawsze chcia³em mieæ swój w³asny kordelas. Tak jak inni piraci.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_10"); //Jednak zostalem z³apany i wtr¹cony tutaj.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_11"); //Da³eœ siê tak ³atwo z³apaæ?
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_12"); //Gdy mnie pochwycili nie by³em ju¿ piratem, tylko Bandyt¹.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_13"); //Mam zdobyæ dla ciebie ten kordelas?
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_14"); //By³bym ci bardzo wdziêczny.
    AI_Output (self, other ,"DIA_Quentin_RozmowaOPiratach_03_15"); //Oczywiœcie wynagrodzê ciê rud¹.
    AI_Output (other, self ,"DIA_Quentin_RozmowaOPiratach_15_16"); //No dobrze. Pogadam z tymi piratami.
    MIS_QuentinsCutlass = LOG_RUNNING;

    Log_CreateTopic            (CH4_QuentinsCutlass, LOG_MISSION);
    Log_SetTopicStatus       (CH4_QuentinsCutlass, LOG_RUNNING);
    B_LogEntry                     (CH4_QuentinsCutlass,"Quentin w m³odoœci by³ piratem. Gdy zobaczy³ mój piracki strój, wróci³y w nim stare wspomnienia. Mam udaæ siê do piratów i spróbowaæ zdobyæ kordelas.");
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
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_02"); //Poka¿ mi go!
    AI_LookForItem (self,Kordelas);
    B_LogEntry                     (CH4_QuentinsCutlass,"Quentin by³ bardzo zadowolony z nowej broni.");
    Log_SetTopicStatus       (CH4_QuentinsCutlass, LOG_SUCCESS);
    MIS_QuentinsCutlass = LOG_SUCCESS;

    B_GiveXP (200);
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_03"); //Wspania³e ostrze.
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_04"); //Masz jaja, ch³opcze. Dziêki.
    AI_Output (self, other ,"DIA_Quentin_KordelasJest_03_05"); //Trzymaj swoj¹ dzia³kê.
    CreateInvItems (self, ItMiNugget, 350);
    B_GiveInvItems (self, other, ItMiNugget, 350);
	B_GiveInvItems (other, self, Kordelas, 1);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 4
// Obóz bandytów oczami innych obozów
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
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_GUR"); //Guru? Tutaj? Co sprowadza kogoœ takiego jak ty w to niegoœcinne miejsce?
	}
	else if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_KDW"); //Mag Wody w naszym Obozie? Co ciê tu sprowadza?
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_OTH"); //Czego szukasz w moim Obozie? 
	};
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_02"); //Przybywam z polecenia Doyle'a.
   // AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_03"); //Jak to?
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_04"); //Poprosi³ mnie o sprawdzenie, co siê tu dzieje.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_05"); //Gdzie jest ten dureñ?
   // AI_RemoveWeapon (self);
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_06"); //Uda³ siê do Nowego Obozu, by wspomóc ludzi Lee w walce ze Stra¿nikami.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_07"); //Torlof poprosi³ go o pomoc, a ja mia³em zobaczyæ czy wszystko u was w porz¹dku.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_08"); //Dobrze, ¿e chocia¿ ty wykaza³eœ siê zdrowym rozs¹dkiem. Jak spotkasz Doyla, to powiedz mu, ¿eby przesta³ b³aznowaæ i wróci³ do Obozu.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_09"); //Powiesz mi tak w ogóle co siê tu wydarzy³o?
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_10"); //No wiêc poszliœmy razem z Draxem i kilkoma dobrymi ludŸmi w okolice Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_11"); //Chcieliœmy pozbyæ siê czêœci patroli, które krêci³y siê w okolicy. Jednak zostaliœmy z³apani w zasadzkê, z której uda³o nam siê wyjœæ ca³o.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_12"); //To ca³a historia.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_13"); //Tyle mi wystarczy. Ostatnio mam ju¿ tego du¿o na g³owie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_14"); //Jeszcze jedno. W naszym Obozie mo¿esz siê czuæ bezpiecznie. Nikt nie bêdzie ciê tu gnêbi³. Czuj siê tu jak u siebie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_15"); //Gdybyœ potrzebowa³ ekwipunku, pogadaj z Martinem. 
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_16"); //Bywaj, Quentinie.
    przyjaciel_Bandytow = true;
    B_LogEntry                     (CH4_BanditsInTroubles,"Uda³em siê do Obozu Bandytów, gdzie spotka³em ich przywódcê - Quentina. Poprosi³ mnie, abym przekaza³ Doyle'owi, ¿e ma siê natychmiast pojawiæ w Obozie.");

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
   description	= "Przyszed³em negocjowaæ.";
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
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_01"); //Przyszed³em negocjowaæ.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_02"); //Negocjowaæ? 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_03"); //Przybywam z polecenia Lee. Mam ci z³o¿yæ propozycjê, w jego imieniu rzecz jasna.
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_04"); //Chcemy wznowiæ wydobycie w tym miejscu, jednak nie mamy robotników. 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_05"); //Lee obiecuje wam czwart¹ czêœæ urobku w zamian za robotników.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_06"); //Mam wys³aæ moich ludzi do kopalni?
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_07"); //Ju¿ mówi³em, ¿e czwart¹ wykopan¹ przez nich czêœæ bêdziecie mogli zatrzymaæ.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_08"); //No niech bêdzie. Wiêkszoœæ tych obiboków i tak œpi ca³y dzieñ...
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_09"); //Powiedz Lee, ¿e wyœlê kilku ludzi, ale przy okazji bêdziesz musia³ coœ dla mnie zrobiæ.
	AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_10"); //Co takiego? 
	AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_11"); //PrzyprowadŸ do pracy w kopalni jakiegoœ doœwiadczonego górnika. Moi ludzie kompletnie siê na tym nie znaj¹.
    //B_LogEntry                     (CH1_NC_Mine,"Quentin niechêtnie, ale zgodzi³ siê na nasz¹ propozycjê.");
	
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
    B_LogEntry                     	(CH1_MineChlopy,"Quentin zgodzi³ siê na propozycjê Lee. Przywódca Bandytów wyœle kilku swoich ludzi do kopalni, jednak poprosi³ mnie w zamian o przys³ugê. Mam przyprowadziæ jakiegoœ kompetentnego cz³owieka, który pokieruje jego ludŸmi. Tylko gdzie ja teraz znajdê kogoœ takiego...");
    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// BAN_1610_Quentin
// Skrypt nauki broni jednorêcznej
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
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};

};

func void DIA_Quentin_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
};

FUNC VOID Quentin_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_01"); //M¹dra decyzja. Najbli¿sze trzy lekcje obejm¹ podstawy z którymi powinieneœ siê zapoznaæ.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_02"); //Bronie jednorêczne s¹ znacznie l¿ejsze ni¿ dwurêczne, a przez to równie¿ znacznie szybsze. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_03"); //Istnieje podzia³ na lekkie bronie jednorêczne i te ciê¿sze. Ciê¿sze wymagaj¹ pewniejszego chwytu, ale te¿ wiêcej si³y.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_04"); //Jeœli chcesz p³ynnie walczyæ ciê¿k¹ jednorêczn¹, poza technik¹ bêdziesz te¿ musia³ poznaæ tajniki balansowania cia³em.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_05"); //O du¿ej sile w ³apie ju¿ nawet nie mówiê. To oczywiste, ¿e ¿eby szybko wymachiwaæ takim ciê¿arem bêdziesz musia³ posiadaæ wiêcej si³y ni¿ potrzeba do podniesienia dobrego dwurêcznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h2 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_06"); //Poka¿ mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_07"); //Tak jak myœla³em. Zadajesz mniejsze obra¿enia ni¿ faktycznie móg³byœ zadaæ przy obecnej sile i za³o¿onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_08"); //Nie atakuj, gdy jesteœ zbyt daleko. Jeœli za bardzo siê wychylisz do oddalonego przeciwnika, mo¿esz straciæ równowagê i siê przewróciæ.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_09"); //Staraj siê atakowaæ z ró¿nych stron, aby zmyliæ przeciwnika. Pamiêtaj, aby blokowaæ uderzenia, jeœli nie bêdziesz w stanie zrobiæ uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h3 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_10"); //Pamiêtasz o balansowaniu cia³em? A o odpowiedniej odleg³oœci od przeciwnika? 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_11"); //Spróbuj wyczuæ ile si³y musisz u¿yæ, aby broñ uderza³a mocno, a przy tym nie polecia³a bez³adnie przed siebie. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_12"); //Gdy to opanujesz, bêdziemy mogli pomyœleæ nad ³¹czeniem po sobie uderzeñ. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_14"); //Rêce opadaj¹... Nie dwiema, tylko jedn¹! Omówimy to na nastêpnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h4 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h5 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_15"); //¯eby zadaæ wiêksze obra¿enia musisz trafiaæ w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_16"); //Ciê¿ko siê tego nauczyæ. Wszystko zale¿y od postury i pancerza. Najlepiej atakowaæ koñczyny i g³owê.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_17"); //Naturalnie walka z cz³owiekiem ró¿ni siê od walki ze zwierzêciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h6 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_18"); //Pamiêtasz jak na pierwszej lekcji omawialiœmy podzia³ na bronie ciê¿kie i te l¿ejsze?
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_19"); //Myœlê, ¿e jesteœ ju¿ wystarczaj¹co silny, aby walczyæ ciê¿kimi jednorêczniakami. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_20"); //O czym musisz pamiêtaæ? O odpowiednim wyczuciu równowagi ostrza, a tak¿e o treningu si³owym, który jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h7 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Quentin_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output (self, other,"DIA_Quentin_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output (self, other,"DIA_Quentin_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h8 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h9 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

FUNC VOID Quentin_nauka1h10 ()
{
	AI_Output (other,self,"DIA_Quentin_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_26"); //To ju¿ koniec naszego szkolenia. Szacunek dla ciebie, ¿e dobrn¹³eœ do koñca.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_27"); //Poka¿ê ci kilka ruchów, którymi trafisz we wra¿liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_npc_28"); //Musisz potrafiæ je dostrzec zanim siê do niego zbli¿ysz. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Quentin_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Quentin_START_TRAIN);
	Info_AddChoice		(DIA_Quentin_START_TRAIN,DIALOG_BACK,DIA_Quentin_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Quentin_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Quentin_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Quentin_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Quentin_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Quentin_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Quentin_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Quentin_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Quentin_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Quentin_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Quentin_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Quentin_nauka1h10);
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ -
// Stuff
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> OdbityOboz
//========================================

INSTANCE DIA_Quentin_OdbityOboz (C_INFO) //WY£¥CZONE
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
    && (Npc_IsDead(GRD_2278_Stra¿nik))
    && (Npc_IsDead(GRD_2273_Stra¿nik))
    && (Npc_IsDead(GRD_2276_Stra¿nik))
    && (Npc_IsDead(GRD_2274_Stra¿nik))
    && (Npc_IsDead(GRD_2277_Stra¿nik))
	&& (KAPITEL == 10) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_OdbityOboz_Info()
{
    AI_Output (self, other ,"DIA_Quentin_OdbityOboz_03_01"); //Œwietnie. To by³ perfekcyjny atak.
    AI_Output (other, self ,"DIA_Quentin_OdbityOboz_15_02"); //Teraz weŸmy siê za tê palisadê. Zagoñ tych nierobów do pracy.
    Wld_SendTrigger("PULAPKA1");
   // PlayVideo ("INTRO.BIK");
    B_LogEntry                     (CH1_zniewolenie,"Uda³o nam siê odbiæ górn¹ czêœæ Obozu. Teraz musimy zbudowaæ palisadê i odci¹æ drogê ucieczki Stra¿nikom.");

    B_GiveXP (700);
    AI_Output (self, other ,"DIA_Quentin_OdbityOboz_03_03"); //Palisada gotowa. Ostrzeliwaæ ich z góry!
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
        AI_Output (other, self ,"DIA_Quentin_EmanuelLife_15_02"); //Niestety nie ¿yje.
        AI_Output (self, other ,"DIA_Quentin_EmanuelLife_03_03"); //To ciê¿ka strata.
        AI_Output (self, other ,"DIA_Quentin_EmanuelLife_03_04"); //Musimy znaleŸæ kogoœ na jego miejsce...
    }
    else
    {
        AI_Output (other, self ,"DIA_Quentin_EmanuelLife_15_05"); //Emanuel ¿yje.
        AI_Output (self, other ,"DIA_Quentin_EmanuelLife_03_06"); //To bardzo dobra wiadomoœæ. Dobrze, ¿e jakoœ mu siê uda³o.
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
   description	= "Mam pieczêæ z zaklêciem.";
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
    AI_Output (other, self ,"DIA_Quentin_MamPiczec_15_01"); //Mam pieczêæ z zaklêciem.
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_02"); //Teraz musisz jej u¿yæ.
    AI_Output (other, self ,"DIA_Quentin_MamPiczec_15_03"); //Dobra. ChodŸcie za mn¹. U¿yjê jej przed Obozem.
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_04"); //A co je¿eli trole rzuc¹ siê i na nas?
    AI_Output (other, self ,"DIA_Quentin_MamPiczec_15_05"); //To wyprujemy im flaki. W czym problem?
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_06"); //Dobra, zostawmy ten temat.
    AI_Output (self, other ,"DIA_Quentin_MamPiczec_03_07"); //ProwadŸ i postaraj siê nas nie pozabijaæ.
    B_LogEntry                     (CH1_Zniewolenie,"Muszê podejœæ jak najbli¿ej Obozu i u¿yæ czaru. Potem zostanie nam ju¿ tylko obserwowaæ i pozbyæ siê tego, co zostanie po tym starciu.");
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
   description	= "U¿y³em czaru.";
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
    AI_Output (other, self ,"DIA_Quentin_UseCZAr_15_01"); //U¿y³em czaru.
    AI_Output (self, other ,"DIA_Quentin_UseCZAr_03_02"); //ChodŸmy dalej do Obozu. Zobaczymy co zosta³o ze Stra¿ników.
    AI_Output (self, other ,"DIA_Quentin_UseCZAr_03_03"); //Trzeba bêdzie siê te¿ pozbyæ naszych w³ochatych przyjació³.
    B_LogEntry                     (CH1_Zniewolenie,"U¿y³em pieczêci. Pora udaæ siê do naszego Obozu i sprawdziæ co siê sta³o.");

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
	&& (Npc_IsDead(GRD_2280_Stra¿nik))
    && (Npc_IsDead(GRD_2281_Stra¿nik))
    && (Npc_IsDead(GRD_2282_Stra¿nik))
    && (Npc_IsDead(GRD_2283_Stra¿nik))
    && (Npc_IsDead(GRD_2284_Stra¿nik))
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
    AI_Output (other, self ,"DIA_Quentin_DedALlQuent_15_01"); //Pokonaliœmy ich.
    AI_Output (self, other ,"DIA_Quentin_DedALlQuent_03_02"); //Wszystko siê uda³o! Dobra robota!
    AI_Output (self, other ,"DIA_Quentin_DedALlQuent_03_03"); //Myœlê, ¿e zas³u¿y³eœ ju¿ na lepszy pancerz. Niech ci dobrze s³u¿y.
    B_LogEntry                     (CH1_zniewolenie,"Pozbyliœmy siê troli grasuj¹cych po Obozie. Wszystko przebieg³o zgodnie z planem.");
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
   description	= "W Kolonii pojawili siê Poszukiwacze!";
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
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_01"); //W Kolonii pojawili siê Poszukiwacze!
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_02"); //Co, do kurwy?
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_03"); //Poszukiwacze to wys³annicy Beliara. S¹ bardzo niebezpieczni.
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_04"); //Zwiastuj¹ z³e czasy...
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_05"); //Akurat w to nie trudno mi uwierzyæ.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_06"); //Nie znam siê za bardzo na tych sprawach magicznych.
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_07"); //Musicie siê strzec. Nigdy nic nie wiadomo.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_08"); //Podobno Doyle widzia³ coœ podejrzanego w lesie.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_09"); //Pogadaj z nim.

    B_GiveXP (150);
};*/