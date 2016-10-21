//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Miguel_EXIT(C_INFO)
{
	npc             = BAN_1600_Miguel;
	nr              = 999;
	condition	= DIA_Miguel_EXIT_Condition;
	information	= DIA_Miguel_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Miguel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Miguel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Miguel_HELLO1 (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_HELLO1_Condition;
   information  = DIA_Miguel_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Miguel_HELLO1_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Miguel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Miguel_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Miguel_HELLO1_03_02"); //Nazywam siê Miguel. Tyle powinno ci wystarczyæ.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Miguel_HELLO2 (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 2;
   condition    = DIA_Miguel_HELLO2_Condition;
   information  = DIA_Miguel_HELLO2_Info;
   permanent	= FALSE;
   description	= "Podobno masz mi pomóc z magnackimi pierœcieniami.";
};

FUNC INT DIA_Miguel_HELLO2_Condition()
{
    if (MIS_BaronsRings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_01"); //Podobno masz mi pomóc z magnackimi pierœcieniami.
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_02"); //Quentin jeszcze sobie nie da³ z nimi spokoju?
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_03"); //NajwyraŸniej nie.
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_04"); //No dobra. Uda³o mi siê namierzyæ jedn¹ z tych b³yskotek.
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_05"); //Zamieniam siê w s³uch.
	if (Npc_KnowsInfo(hero,DIA_Bartholo_DOWODY))
	{
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_06"); //Jeszcze nie skojarzy³eœ?
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_07"); //Jeden z tych pierœcieni odda³eœ Bartholo. Pamiêtasz?
    AI_Output (other, self ,"DIA_Miguel_HELLO2_15_08"); //Cholera! Co teraz?
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_09"); //Spokojnie. Wiem, gdzie go schowa³.
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_10"); //Jest w skrzyni ukrytej nad strzelnic¹. Strzelnica to ta wielka szopa w której znajduj¹ siê tarcze. Byæ mo¿e trzeba bêdzie tam wejœæ przez pokoje Stra¿ników.
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_11"); //Tak siê sk³ada, ¿e ukrad³em ten klucz. Stra¿nicy jednak niezbyt za mn¹ przepadaj¹. Jesteœ nowy, uœpij ich czujnoœæ.
    B_LogEntry                     (CH1_BaronsRings,"Miguel zdradzi³ mi, ¿e jeden z pierœcieni znajduje siê w skrzyni nad dawn¹ sal¹ treningow¹. Gdy odnajdê pierœcieñ, mam go zanieœæ Miguelowi.");
	CreateInvItems (self, ItKe_Miguel, 1);
    B_GiveInvItems (self, other, ItKe_Miguel, 1);
	}
	else 
	{
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_12"); //Pierœcieñ zosta³ ukradziony kilka lat temu przez pewnego Cienia. Wo³aj¹ na niego Œwistak.
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_13"); //Kojarzysz goœcia? Mieszka nieopodal. SprawdŸ jego chatê.
	AI_Output (self, other ,"DIA_Miguel_HELLO2_03_14"); //Wierni ludzie Gomeza. Ha! W³aœnie widaæ. ¯a³osne...
	B_LogEntry                     (CH1_BaronsRings,"Poszukiwania pierœcienia powinienem zacz¹æ od chaty Œwistaka.");
	};
    AI_Output (self, other ,"DIA_Miguel_HELLO2_03_15"); //Jak ju¿ ukradniesz pierœcieñ, przynieœ mi go. Dam ci dalsze wskazówki.
};
//========================================
//-----------------> FindFirstRing
//========================================

INSTANCE DIA_Miguel_FindFirstRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_FindFirstRing_Condition;
   information  = DIA_Miguel_FindFirstRing_Info;
   permanent	= FALSE;
   description	= "Mam pierœcieñ.";
};

FUNC INT DIA_Miguel_FindFirstRing_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_HELLO2))
    && (Npc_HasItems (other, EBR_Ring1) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_FindFirstRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_FindFirstRing_15_01"); //Mam pierœcieñ.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_02"); //Widzisz? To nie by³o takie trudne.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_03"); //Bêdzie z ciebie dobry z³odziej.
    AI_Output (other, self ,"DIA_Miguel_FindFirstRing_15_04"); //Uprzejmoœci potem. Co robimy dalej?
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_05"); //Proponujê przeszukaæ pokoje Magnatów.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_06"); //Na pewno zostawili jakieœ wskazówki. Musisz dok³adnie poszukaæ.
    AI_Output (self, other ,"DIA_Miguel_FindFirstRing_03_07"); //Tylko nie daj siê z³apaæ Stra¿nikom!
    B_LogEntry                     (CH1_BaronsRings,"Kolejne wskazówki dotycz¹ce pierœcieni znajdê w pokojach Magnatów.");

    B_GiveXP (125);
};
//========================================
//-----------------> MagnaciEnter
//========================================

INSTANCE DIA_Miguel_MagnaciEnter (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_MagnaciEnter_Condition;
   information  = DIA_Miguel_MagnaciEnter_Info;
   permanent	= FALSE;
   description	= "Jak niby mam wejœæ do siedziby Magnatów?";
};

FUNC INT DIA_Miguel_MagnaciEnter_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_FindFirstRing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_MagnaciEnter_Info()
{
    AI_Output (other, self ,"DIA_Miguel_MagnaciEnter_15_01"); //Jak niby mam wejœæ do siedziby Magnatów?
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_02"); //Cholera, nie pomyœla³em o tym. Ale spokojnie, zaraz znajdê jakieœ wyjœcie...
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_03"); //Myœlê, ¿e któryœ z wp³ywowych Cieni pomo¿e ci siê tam dostaæ. 
    AI_Output (other, self ,"DIA_Miguel_MagnaciEnter_15_04"); //Sk¹d mam wiedzieæ, który Cieñ mi pomo¿e? I czy zrobi to za darmo? A mo¿e wystarczy przekupiæ Stra¿ników?
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_05"); //Nigdy nie uda nam siê przekupiæ Stra¿ników. 
    AI_Output (other, self ,"DIA_Miguel_MagnaciEnter_15_06"); //S¹ a¿ tak wierni Gomezowi?
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_07"); //Nie, sk¹d¿e. Po prostu s¹ ciêci na Bandytów. Gdy tylko zauwa¿¹, ¿e krêcisz z Quentinem, wydadz¹ ciê w rêce Thorusa. A wtedy czeka ciê rych³a œmieræ.
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_08"); //Co do tego Cienia... hmm... On raczej te¿ nie bêdzie siê pali³ do pomocy. Powinieneœ znaleŸæ na kogoœ haka, zaszanta¿owaæ go.
    AI_Output (self, other ,"DIA_Miguel_MagnaciEnter_03_09"); //Tutejsi informatorzy z pewnoœci¹ ci w tym pomog¹. Pamiêtaj, ¿eby w takich sprawach nie oszczêdzaæ rudy. Ka¿da wiadomoœæ jest cenna i mo¿e ci siê zwróciæ potrójnie.
    B_LogEntry                     (CH1_BaronsRings,"Aby wejœæ do komnat Magnatów, bêdê musia³ zaszanta¿owaæ któregoœ z Cieni, by za mnie porêczy³. Wiêcej informacji uzyskam od lokalnych informatorów.");
};

//========================================
//-----------------> FindSecondRing
//========================================

INSTANCE DIA_Miguel_FindSecondRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 2;
   condition    = DIA_Miguel_FindSecondRing_Condition;
   information  = DIA_Miguel_FindSecondRing_Info;
   permanent	= FALSE;
   description	= "Mam kolejny pierœcieñ.";
};

FUNC INT DIA_Miguel_FindSecondRing_Condition()
{
    if (Npc_HasItems (other, EBR_Ring2) >=1) && (Npc_KnowsInfo (hero, DIA_Miguel_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_FindSecondRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_FindSecondRing_15_01"); //Mam kolejny pierœcieñ.
    AI_Output (other, self ,"DIA_Miguel_FindSecondRing_15_02"); //By³ w komnacie Gomeza.
    AI_Output (self, other ,"DIA_Miguel_FindSecondRing_03_03"); //Pewnie le¿a³ sobie na stole.
    AI_Output (other, self ,"DIA_Miguel_FindSecondRing_15_04"); //Dok³adnie tak.
    AI_Output (self, other ,"DIA_Miguel_FindSecondRing_03_05"); //Ha ha ha. Co za g³upiec!
    AI_Output (self, other ,"DIA_Miguel_FindSecondRing_03_06"); //Dobra robota.
    B_GiveXP (150);
	B_LogEntry      (CH1_BaronsRings,"Odda³em Miguelowi pierœcieñ, który znalaz³em na stole w pokoju Gomeza. Pora poszukaæ ostatniego.");
};

//========================================
//-----------------> AboutThirdRing
//========================================

INSTANCE DIA_Miguel_AboutThirdRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_AboutThirdRing_Condition;
   information  = DIA_Miguel_AboutThirdRing_Info;
   permanent	= FALSE;
   description	= "Gdzie szukaæ trzeciego pierœcienia?";
};

FUNC INT DIA_Miguel_AboutThirdRing_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_FindSecondRing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_AboutThirdRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_AboutThirdRing_15_01"); //Gdzie szukaæ trzeciego pierœcienia?
    AI_Output (self, other ,"DIA_Miguel_AboutThirdRing_03_02"); //Ciê¿ko powiedzieæ. Nie wiem dok³adnie, ale na pewno gdzieœ na zamku.
    AI_Output (self, other ,"DIA_Miguel_AboutThirdRing_03_03"); //Myœlê, ¿e powinieneœ poci¹gn¹æ za jêzyk s³u¿bê Gomeza. Mo¿e ktoœ coœ wie. Lepiej naszykuj sakiewkê.
    B_LogEntry                     (CH1_BaronsRings,"Miguel nie wie, gdzie znajduje siê trzeci pierœcieñ. Aby go odnaleŸæ muszê zasiêgn¹æ jêzyka wœród zamkowego personelu. ");
};

//========================================
//-----------------> IFindThirdRing
//========================================

INSTANCE DIA_Miguel_IFindThirdRing (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_IFindThirdRing_Condition;
   information  = DIA_Miguel_IFindThirdRing_Info;
   permanent	= FALSE;
   description	= "Mam nastêpny pierœcieñ.";
};

FUNC INT DIA_Miguel_IFindThirdRing_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_HELLO2))
    && (Npc_HasItems (other, EBR_Ring3) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_IFindThirdRing_Info()
{
    AI_Output (other, self ,"DIA_Miguel_IFindThirdRing_15_01"); //Mam nastêpny pierœcieñ.
    AI_Output (self, other ,"DIA_Miguel_IFindThirdRing_03_02"); //Œwietnie.
    B_GiveXP (200);
	B_LogEntry                     (CH1_BaronsRings,"Odda³em Miguelowi pierœcieñ, który znalaz³em w kuchni Magnatów. To by³ ju¿ ostatni.");
	
	AI_StopProcessInfos (Self);
};

//========================================
//-----------------> AllRings
//========================================

INSTANCE DIA_Miguel_AllRings (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 2;
   condition    = DIA_Miguel_AllRings_Condition;
   information  = DIA_Miguel_AllRings_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Miguel_AllRings_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_IFindThirdRing))
    && (Npc_KnowsInfo (hero, DIA_Miguel_FindSecondRing))
    && (Npc_KnowsInfo (hero, DIA_Miguel_FindFirstRing))
    && (MIS_BaronsRings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_AllRings_Info()
{
    AI_Output (self, other ,"DIA_Miguel_AllRings_03_01"); //Pokaza³eœ mi wszystkie pierœcienie. Mo¿esz zanieœæ je Quentinowi.
    AI_Output (self, other ,"DIA_Miguel_AllRings_03_02"); //Bêdzie bardzo zadowolony.
    B_LogEntry                     (CH1_BaronsRings,"Odnalezione pierœcienie musz¹ trafiæ do Quentina.");

    B_GiveXP (400);
};

//========================================
//-----------------> QuentinUcieczka
//========================================

INSTANCE DIA_Miguel_QuentinUcieczka (C_INFO)
{
   npc          = BAN_1600_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_QuentinUcieczka_Condition;
   information  = DIA_Miguel_QuentinUcieczka_Info;
   permanent	= FALSE;
   description	= "Nie wróci³eœ do Obozu Bandytów?";
};

FUNC INT DIA_Miguel_QuentinUcieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_QuentinUcieczka_Info()
{
    AI_Output (other, self ,"DIA_Miguel_QuentinUcieczka_15_01"); //Nie wróci³eœ do Obozu Bandytów?
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_02"); //Nie! I nie mam zamiaru...
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_03"); //Dexter namówi³ mnie do ucieczki. Powiedzia³, ¿e z Krukiem mam wiêksze szanse na prze¿ycie ni¿ z Quentinem.
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_04"); //I chyba mia³ trochê racji.
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_05"); //Gdybym wróci³ do Obozu ju¿ gryz³bym ziemiê.
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_06"); //S³ysza³em, ¿e Stra¿nicy wreszcie go odkryli. 
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_07"); //Teraz zosta³o mi tylko czekaæ, a¿ Kruk wróci ze Starego Obozu i liczyæ na pozytywny bieg zdarzeñ.
    AI_Output (other, self ,"DIA_Miguel_QuentinUcieczka_15_08"); //Wiesz po co Kruk tam poszed³?
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_09"); //Nie, to jego sprawy. Gomez nawet nie wie o naszej ucieczce. 
    AI_Output (self, other ,"DIA_Miguel_QuentinUcieczka_03_10"); //Przypuszczam, ¿e Kruk chce wszystko zatuszowaæ, albo jeszcze coœ zrobiæ w Obozie.
};