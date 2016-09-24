// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_JIM_EXIT(C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 999;
	condition	= DIA_JIM_EXIT_Condition;
	information	= DIA_JIM_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_JIM_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_JIM_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_JIM_Hello (C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 3;
	condition	= DIA_JIM_Hello_Condition;
	information	= DIA_JIM_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_JIM_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_JIM_Hello_Info()
{	
	AI_Output (other, self,"DIA_JIM_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_JIM_Hello_08_01"); //Nazywam siê Jim. Jestem kurierem Magów Ognia.
	AI_Output (self, other,"DIA_JIM_Hello_08_02"); //S³u¿ê pomoc¹ ka¿demu, kto tego potrzebuje. Ponadto sprzedajê mikstury i banda¿e.
	AI_Output (self, other,"DIA_JIM_Hello_08_03"); //Mam bardzo dobre kontakty, wiêc jestem w stanie za³atwiæ sporo spraw.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Kurier magów, Jim, sprzedaje magiczne przedmioty, mikstury i banda¿e. Ponadto ma bardzo dobre kontakty z Magami Ognia."); 
};


// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_JIM_Frau (C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 3;
	condition	= DIA_JIM_Frau_Condition;
	information	= DIA_JIM_Frau_Info;
	permanent	= 0;
	description = "Mogê do³¹czyæ do Magów Ognia?";
};                       

FUNC INT DIA_JIM_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_JIM_Hello)) &&  (Npc_GetTrueGuild(hero) != GIL_KDF) 
	{
		return 1;
	};
};

FUNC VOID DIA_JIM_Frau_Info()
{	
	AI_Output (other, self,"DIA_JIM_Frau_15_00"); //Mogê do³¹czyæ do Magów Ognia?
	AI_Output (self, other,"DIA_JIM_Frau_08_01"); //Ty? Chyba kpisz. Obecnie jesteœ wy³¹cznie zwyczajnym skazañcem. Jednym z brudasów, których jest tutaj pe³no.
	AI_Output (self, other,"DIA_JIM_Frau_08_02"); //Aby zostaæ Magiem Ognia, trzeba wykazaæ siê wielkimi czynami, oraz cechowaæ inteligencj¹, rozwag¹ i wielk¹ mi³oœci¹ do Innosa. 
	AI_Output (other, self,"DIA_JIM_Frau_15_03"); //Za³ó¿my, ¿e w przysz³oœci chcia³bym to osi¹gn¹æ. Co powinienem ju¿ teraz robiæ, ¿eby zbli¿aæ siê do celu?
	AI_Output (self, other,"DIA_JIM_Frau_08_04"); //Doprawdy intrygujesz mnie. Po pierwsze powinieneœ do³¹czyæ do Starego Obozu. 
	AI_Output (self, other,"DIA_JIM_Frau_08_05"); //Jedynych mieszkañców innych obozów jakich toleruj¹ Magowie Ognia to pos³añcy. Zreszt¹ Gomez pewnie by siê wkurzy³ na Corristo, gdyby przyj¹³ jakiegoœ Szkodnika do Krêgu Ognia, he he. 
	AI_Output (other, self,"DIA_JIM_Frau_15_06"); //A co ze szkoleniem bojowym?
	AI_Output (self, other,"DIA_JIM_Frau_08_07"); //Oczywiœcie o nauce krêgów magii nie masz co marzyæ, ale magowie chêtnie naucz¹ ciê kontrolowaæ moc magiczn¹. Mo¿esz sobie æwiczyæ korzystaj¹c ze zwojów. 
	AI_Output (self, other,"DIA_JIM_Frau_08_08"); //Osobiœcie radzê ci jednak teraz siê tym nie zajmowaæ, lecz skupiæ siê na walce wrêcz. Tak, dobrze s³yszysz. 
	AI_Output (self, other,"DIA_JIM_Frau_08_09"); //Magowie w zwarciu korzystaj¹ z kosturów. 
	AI_Output (self, other,"DIA_JIM_Frau_08_10"); //Jeœli teraz nauczysz siê porz¹dnie machaæ dwurêczn¹ broni¹, a do tego wyrobisz sobie krzepê, to jeœli zostaniesz magiem, phi, bêdziesz móg³ siê skupiæ wy³¹cznie na kwestiach run i krêgów.
	AI_Output (self, other,"DIA_JIM_Frau_08_11"); //Walki dwurêczn¹ broni¹ nauczy ciê Thorus. Ja bra³em u niego lekcje i jestem zadowolony. 
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_JIM_PERM (C_INFO)
{
	npc			= STT_2077_Jim;
	nr			= 3;
	condition	= DIA_JIM_PERM_Condition;
	information	= DIA_JIM_PERM_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT DIA_JIM_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_JIM_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_JIM_PERM_Info()
{	
	AI_Output (other, self,"DIA_JIM_PERM_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_JIM_PERM_08_01"); //Nienajgorzej. Interes siê krêci. 
};

//========================================
//-----------------> Leczenie
//========================================

INSTANCE DIA_Jim_Leczenie (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_Leczenie_Condition;
   information  = DIA_Jim_Leczenie_Info;
   permanent	= FALSE;
   description	= "Potrafisz leczyæ siê banda¿ami?";
};

FUNC INT DIA_Jim_Leczenie_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_JIM_Hello)) 
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Jim_Leczenie_Info()
{
    AI_Output (other, self ,"DIA_Jim_Leczenie_15_01"); //Potrafisz leczyæ siê banda¿ami?
    AI_Output (self, other ,"DIA_Jim_Leczenie_03_02"); //Jasne! Mogê ci sprzedaæ kilka. S¹ skuteczne i tañsze od mikstur.
	CreateInvItems (self,ItMi_Bandaz40,20);
};


//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Jim_SELLSTUFF (C_INFO)
{
	npc				= STT_2077_Jim;
	nr				= 900;
	condition		= KDW_604_Jim_SELLSTUFF_Condition;
	information		= KDW_604_Jim_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Jim_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,DIA_JIM_Hello))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Jim_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Jim_SELLSTUFF_Info_15_01"); //Chcê pohandlowaæ. 
	
};  

//========================================
//-----------------> HELP_WARRIOR
//========================================

INSTANCE DIA_Jim_HELP_WARRIOR (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_HELP_WARRIOR_Condition;
   information  = DIA_Jim_HELP_WARRIOR_Info;
   permanent	= FALSE;
   description	= "Potrzebujê mikstury, która ca³kowicie zregeneruje cia³o.";
};

FUNC INT DIA_Jim_HELP_WARRIOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_HELP)) && (Npc_KnowsInfo (hero,DIA_JIM_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_HELP_WARRIOR_Info()
{
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_01"); //Potrzebujê mikstury, która ca³kowicie zregeneruje cia³o.
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_02"); //Mój obecny asortyment obejmuje jedynie to, co widzisz.
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_03"); //Kto wytwarza sprzedawane przez ciebie eliksiry?
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_04"); //Mag Damarok, jednak prawie nigdy nie opuszcza swojej pracowni.
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_05"); //Mimo wszystko muszê z nim porozmawiaæ i zdobyæ ten eliksir. Mo¿esz mi jakoœ w tym pomóc?
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_06"); //Owszem, jednak bêdziesz mi winien przys³ugê.
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_15_07"); //Ehh...
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_03_08"); //Jesteœ wojownikiem, wiêc nie powinno ci to sprawiæ problemu. To jak bêdzie?
    B_LogEntry                     (CH1_RannyWojownik,"Jim mo¿e mi pomóc, jednak bêdê mu winien przys³ugê.");

    Info_ClearChoices		(DIA_Jim_HELP_WARRIOR);
    Info_AddChoice		(DIA_Jim_HELP_WARRIOR, "Niech bêdzie, pomogê ci.", DIA_Jim_HELP_WARRIOR_POMOGE);
    Info_AddChoice		(DIA_Jim_HELP_WARRIOR, "Nie jestem zainteresowany.", DIA_Jim_HELP_WARRIOR_NIE);
};

FUNC VOID DIA_Jim_HELP_WARRIOR_POMOGE()
{
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_POMOGE_15_01"); //Niech bêdzie, pomogê ci.
    B_LogEntry                     (CH1_RannyWojownik,"Przyj¹³em ofertê Jima. Przed œwi¹tyni¹ Innosa mam siê spotkaæ z magiem Damarokiem. Mag jest dostêpny tylko podczas nabo¿eñstwa. Wychodzi wtedy przed kaplicê odprawiaæ mszê.");
	Jim_odrzucilem = false;
    B_GiveXP (50);
    AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_POMOGE_03_02"); //Udaj siê do zamku. Przed œwi¹tyni¹ znajdziesz Damaroka. Z pewnoœci¹ ci pomo¿e.
	AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_POMOGE_03_03"); //Wychodzi na zewn¹trz tylko w godzinie nabo¿eñstwa dla mieszkañców Obozu. Tylko wtedy mo¿na z nim pogadaæ. Nabo¿eñstwo odbywa siê w samo po³udnie.
	AI_Output (self, other ,"DIA_Jim_HELP_WARRIOR_POMOGE_03_04"); //Pamiêtaj, ¿e za tê informacjê w przysz³oœci bêdziesz mi winien przys³ugê. 
    Info_ClearChoices		(DIA_Jim_HELP_WARRIOR);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Jim_HELP_WARRIOR_NIE()
{
	Jim_odrzucilem = true;
    AI_Output (other, self ,"DIA_Jim_HELP_WARRIOR_NIE_15_01"); //Nie jestem zainteresowany.
    B_LogEntry                     (CH1_RannyWojownik,"Odrzuci³em propozycjê Jima. Poszukam kogoœ innego.");
    Info_ClearChoices		(DIA_Jim_HELP_WARRIOR);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Church
//========================================

INSTANCE DIA_Jim_Church (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_Church_Condition;
   information  = DIA_Jim_Church_Info;
   permanent	= FALSE;
   description	= "O jakich nabo¿eñstwach mówi³eœ?";
};

FUNC INT DIA_Jim_Church_Condition()
{
    if (Jim_odrzucilem == FALSE)
    && (Npc_KnowsInfo (hero, DIA_Jim_HELP_WARRIOR))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_Church_Info()
{
    AI_Output (other, self ,"DIA_Jim_Church_15_01"); //O jakich nabo¿eñstwach mówi³eœ?
    AI_Output (self, other ,"DIA_Jim_Church_03_02"); //Tych ku czci Innosa. Ma³o kto na nie przychodzi. Tutejsi ludzie stracili wiarê.
    AI_Output (self, other ,"DIA_Jim_Church_03_03"); //Mimo to Damarok dzieñ w dzieñ wychodzi przed kaplicê, by modliæ siê do Innosa.
};

//========================================
//-----------------> OBIETNICA
//========================================

INSTANCE DIA_Jim_OBIETNICA (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_OBIETNICA_Condition;
   information  = DIA_Jim_OBIETNICA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jim_OBIETNICA_Condition()
{
    if (Jim_odrzucilem == false)
    && (Npc_KnowsInfo (hero, DIA_Jim_HELP_WARRIOR))
    && (MIS_RannyWojownik == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_OBIETNICA_Info()
{
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_03_01"); //Nareszcie! Obowi¹zuje nas umowa, jesteœ mi winien przys³ugê.

    Info_ClearChoices		(DIA_Jim_OBIETNICA);
    Info_AddChoice		(DIA_Jim_OBIETNICA, "Co mam zrobiæ?", DIA_Jim_OBIETNICA_POMOGE);
    Info_AddChoice		(DIA_Jim_OBIETNICA, "Nie zamierzam ci pomagaæ.", DIA_Jim_OBIETNICA_NIE_DAM);
};

FUNC VOID DIA_Jim_OBIETNICA_POMOGE()
{
    AI_Output (other, self ,"DIA_Jim_OBIETNICA_POMOGE_15_01"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_POMOGE_03_02"); //No có¿, gdy tu przyby³em nie by³em zbyt utalentowanym wojownikiem. 
	AI_Output (self, other ,"DIA_Jim_OBIETNICA_POMOGE_03_03"); //Pewnego dnia wybra³em siê na plac wymian, gdy na mej drodze stanê³a wataha wilków. Wola³em ratowaæ siê ucieczk¹, ni¿ zgin¹æ w walce z tymi bestiami. 
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_POMOGE_03_04"); //Niestety, podczas ucieczki zgubi³em mój pierwszy miecz. Nie jest wiele warty, ale ma dla mnie wartoœæ sentymentaln¹.
    AI_Output (other, self ,"DIA_Jim_OBIETNICA_POMOGE_15_05"); //W porz¹dku, spróbujê go odnaleŸæ.
    MIS_JimsSword = LOG_RUNNING;

    Log_CreateTopic            		(CH1_JimsSword, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_JimsSword, LOG_RUNNING);
    B_LogEntry                      (CH1_JimsSword,"Mam odnaleŸæ miecz Jima, który zgubi³ nieopodal placu wymian. To nie powinno byæ zbyt trudne...");
    Info_ClearChoices		(DIA_Jim_OBIETNICA);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Jim_OBIETNICA_NIE_DAM()
{
    AI_Output (other, self ,"DIA_Jim_OBIETNICA_NIE_DAM_15_01"); //Nie zamierzam ci pomagaæ.
    AI_Output (self, other ,"DIA_Jim_OBIETNICA_NIE_DAM_03_02"); //Zap³acisz mi za to, oszuœcie.
    B_LogEntry                     (CH1_JimsSword,"Naiwny Jim naprawdê uwierzy³, ¿e mu pomogê. Mimo wszystko z³ama³em dane s³owo, wiêc muszê pogodziæ siê z pora¿k¹.");
    Log_SetTopicStatus       (CH1_JimsSword, LOG_FAILED);
    MIS_JimsSword = LOG_FAILED;
    Info_ClearChoices		(DIA_Jim_OBIETNICA);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> SWORD_MAM
//========================================

INSTANCE DIA_Jim_SWORD_MAM (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 2;
   condition    = DIA_Jim_SWORD_MAM_Condition;
   information  = DIA_Jim_SWORD_MAM_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em twój miecz.";
};

FUNC INT DIA_Jim_SWORD_MAM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jim_OBIETNICA))
    && (MIS_JimsSword == LOG_RUNNING)
    && (Npc_HasItems (other, ALTESSCHWERT) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_SWORD_MAM_Info()
{
    AI_Output (other, self ,"DIA_Jim_SWORD_MAM_15_01"); //Odnalaz³em twój miecz.
    AI_Output (self, other ,"DIA_Jim_SWORD_MAM_03_02"); //Dziêkujê ci, weŸ ten eliksir.
    B_LogEntry                     (CH1_JimsSword,"Odnalaz³em miecz Jima i trafi³ on ju¿ w jego rêce. Wywi¹za³em siê tym samym z obietnicy, jak¹ mu niegdyœ z³o¿y³em.");
    Log_SetTopicStatus       (CH1_JimsSword, LOG_SUCCESS);
    MIS_JimsSword = LOG_SUCCESS;

    B_GiveXP (50);
    CreateInvItems (self, ItFo_Potion_Health_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 1);
	B_GiveInvItems (hero, self, ALTESSCHWERT, 1);
	Npc_RemoveInvItems (self, ALTESSCHWERT, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zlecenie
//========================================

INSTANCE DIA_Jim_Zlecenie (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 2;
   condition    = DIA_Jim_Zlecenie_Condition;
   information  = DIA_Jim_Zlecenie_Info;
   permanent	= FALSE;
   description	= "Szukam zlecenia.";
};

FUNC INT DIA_Jim_Zlecenie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_JIM_Hello))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Jim_Zlecenie_Info()
{
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_01"); //Szukam zlecenia.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_02"); //Chcesz pomóc magom? Mam ma³e zadanie. Móg³bym ci je odst¹piæ.
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_03"); //Zamieniam siê w s³uch. 
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_04"); //Trzeba zaj¹æ siê starym o³tarzem Beliara w jaskini za Obozem. O³tarz zosta³ sprofanowany przez kilku Kopaczy.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_05"); //Taki sprofanowany o³tarz jest bardzo niebezpieczny. Nie mo¿emy dopuœciæ, ¿eby zalêgli siê tu nieumarli.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_06"); //Dam ci butelkê wody œwiêconej. IdŸ do o³tarza i pokrop go wod¹.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_07"); //Aha. Zajrzyj te¿ na stary cmentarz. Obawiam siê, ¿e i tam dotarli.
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_08"); //Gdzie znajdê ten cmentarz?
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_09"); //Cmentarz poleg³ych Kopaczy znajduje siê nad Opuszczon¹ Kopalni¹. 
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_10"); //Le¿¹ tam g³ównie ci, którzy zginêli w katastrofie. 
    AI_Output (other, self ,"DIA_Jim_Zlecenie_15_11"); //Rozumiem.
    AI_Output (self, other ,"DIA_Jim_Zlecenie_03_12"); //No. Masz tê wodê i wróæ jak skoñczysz. 
    B_Story_JimQuest ();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QUEST_END1
//========================================

INSTANCE DIA_Jim_QUEST_END1 (C_INFO)
{
   npc          = STT_2077_Jim;
   nr           = 1;
   condition    = DIA_Jim_QUEST_END1_Condition;
   information  = DIA_Jim_QUEST_END1_Info;
   permanent	= FALSE;
   description	= "Zrobi³em co kaza³eœ.";
};

FUNC INT DIA_Jim_QUEST_END1_Condition()
{
    if (MIS_ZlecenieJima == LOG_RUNNING)
	// ORYGINA£(Npc_KnowsInfo (hero, DIA_Jim_NOVIZE))
    && (kaplica_oczyszczona == true)
    && (Npc_IsDead(NON_7501_Opetany_Kopacz))
    && (Npc_IsDead(NON_7504_Opetany_Kopacz))
    && (Npc_IsDead(NON_7503_Opetany_Kopacz))
	&& (Npc_IsDead(NON_7502_Opetany_Kopacz))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jim_QUEST_END1_Info()
{
    AI_Output (other, self ,"DIA_Jim_QUEST_END1_15_01"); //Oczyœci³em o³tarz i pozby³em siê Kopaczy z cmentarza.
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_02"); //Naprawdê? Jestem pod wra¿eniem.
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_03"); //Chyba Ÿle ciê oceni³em. WeŸ te sto bry³ek rudy w nagrodê.
	B_Story_JimQuest_Success ();
	/*	if (Npc_GetTrueGuild(hero) == GIL_NONE) 
	{
	AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_04"); //No dobrze. Dam ci specjalny pierœcieñ.
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_05"); //Oka¿ go Thorusowi, a zostaniesz wpuszczony za bramê. 
    AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_06"); //Nastêpnie pogadaj z Torrezem. 
	*/
	AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_07"); //Aha! Mam do ciebie jeszcze jedno pytanie. Znalaz³eœ coœ przy starym o³tarzu? 
	Info_ClearChoices		(DIA_Jim_QUEST_END1);
    Info_AddChoice		(DIA_Jim_QUEST_END1, "Nic nie znalaz³em.", DIA_Jim_QUEST_END1_NIE);
	if  (Npc_HasItems (hero, StoneOfKnowledge) >=1) 
	{
    Info_AddChoice		(DIA_Jim_QUEST_END1, "Mam tu dziwny kamieñ.", DIA_Jim_QUEST_END1_TAK);
	};
   // B_LogEntry                     (CH1_FireNovize,"Uda³o mi siê przekonaæ do siebie Jima. Dosta³em pierœcieñ dziêki któremu Stra¿nicy przy bramie nie bêd¹ mi robiæ k³opotów. Mam siê skontaktowaæ z Torrezem.  ");
    
    //AI_StopProcessInfos	(self);
   // CreateInvItems (self, it_firering, 1);
   // B_GiveInvItems (self, other, it_firering, 1);
	/*}
	else
	{
	AI_Output (self, other ,"DIA_Jim_QUEST_END1_03_06"); //Niestety w miêdzyczasie do³¹czy³eœ do innej gildii. No có¿...
	B_GiveXP (350);
	MIS_Fire_Novize = LOG_FAILED;
	Log_SetTopicStatus       (CH1_Fire_Novize, LOG_FAILED);
    B_LogEntry               (CH1_Fire_Novize,"Pomimo i¿ wykona³em zadanie, jest ju¿ za póŸno na do³¹czenie do kurierów magów.");

	};*/
};

func void DIA_Jim_QUEST_END1_NIE ()
{
AI_Output (other, self ,"DIA_Jim_QUEST_END1_NIE_15_01"); //Nic nie znalaz³em.
AI_Output (self, other ,"DIA_Jim_QUEST_END1_NIE_03_02"); //No dobra. IdŸ ju¿.
Info_ClearChoices		(DIA_Jim_QUEST_END1);
if  (Npc_HasItems (hero, StoneOfKnowledge) >=1) 
{
B_LogEntry                     (CH1_ZlecenieJima,"Jim pyta³ czy czasem czegoœ nie znalaz³em podczas oczyszczania o³tarza. Sposób w jaki to zapyta³ by³ dziwny. Gdybym musia³ coœ znaleŸæ, pewnie by mi o tym powiedzia³ wczeœniej. Postanowi³em, ¿e zachowam Kamieñ Wiedzy dla siebie.");
}
else
{
B_LogEntry                     (CH1_ZlecenieJima,"Jim pyta³ czy czasem czegoœ nie znalaz³em podczas oczyszczania o³tarza. Nic nie przyku³o mojej uwagi.");
};
};

func void DIA_Jim_QUEST_END1_TAK ()
{
AI_Output (other, self ,"DIA_Jim_QUEST_END1_TAK_15_01"); //Znalaz³em dziwny kamieñ.
AI_Output (self, other ,"DIA_Jim_QUEST_END1_TAK_03_02"); //To bardzo niebezpieczny artefakt. Daj mi go.
B_LogEntry   (CH1_ZlecenieJima,"Ledwie wspomnia³em o kamieniu, który znalaz³em na cmentarzu Kopaczy, a ju¿ by³ on w rêkach Jima. To podejrzane, ale to nie mój problem.");
 B_GiveInvItems (other, self, StoneOfKnowledge, 1);
 Npc_RemoveInvItems (self, StoneOfKnowledge, 1);
 Info_ClearChoices		(DIA_Jim_QUEST_END1);
};
