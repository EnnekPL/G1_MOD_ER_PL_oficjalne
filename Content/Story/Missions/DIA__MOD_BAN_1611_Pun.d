//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RaeuberKowal_EXIT(C_INFO)
{
	npc             = BAN_1611_Pun;
	nr              = 999;
	condition	= DIA_RaeuberKowal_EXIT_Condition;
	information	= DIA_Raeuberkowal_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_RaeuberKowal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RaeuberKowal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia� -
// Dialogi og�lne, fabularne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Raeuber_HELLO1 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_HELLO1_Condition;
   information  = DIA_Raeuber_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jeste� tu kowalem?";
};

FUNC INT DIA_Raeuber_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Raeuber_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO1_15_01"); //Jeste� tu kowalem?
    AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_02"); //Nazywam si� Pun i kuj� or� dla Bandyt�w. Nic szczeg�lnego: proste miecze i maczugi.
	AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_03"); //Kiedy� robi�em wspania�e bronie, ale teraz nie mam sk�adnik�w, ani porz�dnego sprz�tu. Poza tym ludzie w Kolonii maj� inne priorytety dotycz�ce broni.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Raeuber_HELLO2 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 2;
   condition    = DIA_Raeuber_HELLO2_Condition;
   information  = DIA_Raeuber_HELLO2_Info;
   permanent	= FALSE;
   description	= "Widz�, �e znasz si� na tej robocie.";
};

FUNC INT DIA_Raeuber_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO1))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Raeuber_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_01"); //Widz�, �e znasz si� na tej robocie.
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_02"); //Kucie prostych mieczy wcale nie jest takie trudne. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_03"); //Nawet ty z pewno�ci� by� sobie poradzi�. Gorszych obibok�w niegdy� uczy�em.
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_04"); //Gdzie wcze�niej pracowa�e�?
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_05"); //Mia�em ma�� ku�nie w jaskini niedaleko Khornis. Niestety, pewnego dnia nakryli mnie stra�nicy. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_06"); //Trafi�em na miesi�c do lochu, a p�niej tutaj. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_07"); //Od kiedy kucie broni jest nielegalne?
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_08"); //To by�y ci�kie czasy. Stra� miejska potrzebowa�a broni. Ka�dy kowal musia� pracowa� dzie� i noc za ma�e pieni�dze.
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_09"); //Bardziej op�aca�o mi si� potajemnie sprzedawa� bro� bandytom. G��wnie dlatego tutaj trafi�em. Gdybym dogada� si� z kupcami, mo�e moje �ycie potoczy�oby si� inaczej.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Raeuber_HELLO3 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 3;
   condition    = DIA_Raeuber_HELLO3_Condition;
   information  = DIA_Raeuber_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz do�wiadczenie w budowaniu ku�ni.";
};

FUNC INT DIA_Raeuber_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_01"); //Masz do�wiadczenie w budowaniu ku�ni. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_02"); //Sk�d w og�le macie kowad�o w Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_03"); //He he. Wiedzia�em, �e kto� w ko�cu o to zapyta. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_04"); //O ile sprawa w Khorinis by�a prostsza, to tutaj musieli�my ju� si� nag�owi�, jak zdoby� kowad�o.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_05"); //Najpierw opowiem ci o kowadle w jaskini. Gdy by�em na wolno�ci i mia�em zamiar ku� potajemnie bro� dla bandyt�w dowiedzia�em si�, �e do miasta ma przyp�yn�� nowa dostawa z kontynentu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_06"); //Na statku mia�y si� znajdowa� trzy nowiutkie kowad�a. Postanowi�em, �e wykorzystam okazj�.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_07"); //Kiedy stra�nicy wy�adowali kowad�a i poszli napi� si� piwa, szybko wepchn��em jedno z nich na ma��, przygotowan� wcze�niej ��d�.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_08"); //Chyba sam Innos nade mn� czuwa�, bo kowad�o nie zrobi�o dziury w dnie �odzi.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_09"); //Szybko odp�yn��em dalej od miasta i z trudem wyj��em kowad�o na brzeg. P�niej czeka�o mnie tylko przetransportowanie mojej zdobyczy do jaskini.
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_10"); //To ci dopiero historia. A jak to by�o z kowad�em w tym Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_11"); //Tutaj te� mieli�my olbrzymie szcz�cie. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_12"); //Ot� par� lat wstecz Gomez zaplanowa� budow� ku�ni w Starej Kopalni. Stali�my si� na tyle uci��liwi, �e konwoje z kopalni do obozu nie by�y ju� bezpieczne.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_13"); //Kopaczy nios�cych ci�kie skrzynie rudy napa�� by�o znacznie �atwiej. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_14"); //Gomez chyba planowa� ku� bro� bezpo�rednio w kopalni i dopiero wtedy dostarcza� l�ejszy �adunek do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_15"); //Gdy tylko dowiedzieli�my si� kiedy kowad�o b�dzie transportowane do kopalni, przyst�pili�my do dzia�ania. 
	AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_16"); //Wyobra� sobie pi�tnastu Bandyt�w pchaj�cych noc� kowad�o przez las. Magnaci najwyra�niej nie spodziewali si�, �e co� takiego przyjdzie nam do g�owy.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_17"); //Jako obstaw� wys�ali zaledwie pi�ciu Stra�nik�w. Pokonanie ich to pestka. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_18"); //Szczerze to dziwi� si�, �e Gomez jeszcze nas nie zaatakowa�. Nawet nie pr�bowa� si� zem�ci�. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_19"); //Mo�e czeka na odpowiedni moment?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_20"); //Mo�e, ale dzisiaj... wol� o tym nie my�le�.
};

//========================================
//-----------------> SwordElement
//========================================

INSTANCE DIA_Raeuber_SwordElement (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_SwordElement_Condition;
   information  = DIA_Raeuber_SwordElement_Info;
   permanent	= FALSE;
   description	= "Pami�tasz mo�e taki miecz?";
};

FUNC INT DIA_Raeuber_SwordElement_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_FindSwordElement)) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Raeuber_SwordElement_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_01"); //Pami�tasz mo�e taki miecz?
    AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_02"); //Pami�tam. Sk�d to masz?
	AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_03"); //Znalaz�em. Interesuje mnie w�a�ciciel tego miecza.
	AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_03"); //Robi�em miecz o takim ostrzu dla Jensa. Nie wierz�, �e go zniszczy�. Zawsze szanowa� moj� prac�...
	
	B_LogEntry               (CH1_DestroyedGrave,"Pokaza�em Punowi fragment miecza. Powiedzia�, �e sprzeda� takie ostrze Jensowi. Ciekawe co na to Kereth...");
};

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Raeuber_RAYAN (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 2;
   condition    = DIA_Raeuber_RAYAN_Condition;
   information  = DIA_Raeuber_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz co� na temat �mierci Rayana?";
};

FUNC INT DIA_Raeuber_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Raeuber_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_01"); //Wiesz co� na temat �mierci Rayana?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_02"); //Ostatnio dowiedzia�em si�, �e kto� niszczy� jego gr�b przy u�yciu miecza, kt�ry zrobi�em dla Jensa. 
	AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_03"); //Faktycznie tak by�o. Co� wi�cej?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_03"); //Nic, a nic. Jestem zaj�ty prac�. Ostatnio nie zwraca�em uwagi na to co si� dzieje w Obozie.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia� 4
// Wa�ne dialogi dla w�tk�w fabularnych innych oboz�w
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> VERY_IMPORTATN
//========================================
//**** PRAWDOPODOBNIE NIEAKTUALNE***
INSTANCE DIA_Raeuber_VERY_IMPORTATN (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_VERY_IMPORTATN_Condition;
   information  = DIA_Raeuber_VERY_IMPORTATN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_VERY_IMPORTATN_Condition()
{
    if (inicjacja_HeroMustHelpBandit == true)
    && (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_VERY_IMPORTATN_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_01"); //Zaczekaj. Drax chce zaatakowa� patrole Gomeza. 
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_15_02"); //Wiem. Ju� z nim rozmawia�em. Co z tym zrobimy?
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_03"); //Musisz nam za�atwi� wsparcie. Sami nie damy rady.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_04"); //Id� do obozu �owc�w ork�w i pogadaj z ich przyw�dc�. To stary znajomy Quentina.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_05"); //Popro� go o pomoc. Zap�ac� ci z g�ry, tylko si� spiesz.
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_15_06"); //A ile mi zap�acisz?
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_03_07"); //Cholera, 100 bry�ek rudy,
    MIS_HuntersSupport = LOG_RUNNING;

    Log_CreateTopic          (CH4_HuntersSupport, LOG_MISSION);
    Log_SetTopicStatus       (CH4_HuntersSupport, LOG_RUNNING);
    B_LogEntry               (CH4_HuntersSupport,"Mam jak najszybciej odnale�� �owc�w ork�w i poprosi� ich przyw�dc� o pomoc Bandytom.");

    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    Info_AddChoice		(DIA_Raeuber_VERY_IMPORTATN, "Dobra. Wyrusz� najszybciej jak si� da.", DIA_Raeuber_VERY_IMPORTATN_DEAL);
    Info_AddChoice		(DIA_Raeuber_VERY_IMPORTATN, "Chc� 200 bry�ek rudy.", DIA_Raeuber_VERY_IMPORTATN_CHCE_200);
    Info_AddChoice		(DIA_Raeuber_VERY_IMPORTATN, "300 bry�ek rudy, albo sobie p�jd�.", DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE);
};

FUNC VOID DIA_Raeuber_VERY_IMPORTATN_DEAL()
{
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_DEAL_15_01"); //Dobra. Wyrusz� najszybciej jak si� da.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_DEAL_03_02"); //�wietnie. Oto bry�ki.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_VERY_IMPORTATN_CHCE_200()
{
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_CHCE_200_15_01"); //Chc� 200 bry�ek rudy.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_CHCE_200_03_02"); //Szlag by to! Masz. Tylko szybko.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE()
{
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_15_01"); //300 bry�ek rudy, albo sobie p�jd�.
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_03_02"); //Innos ci� opu�ci�, czy co?! 
    AI_Output (self, other ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_03_03"); //Masz, ale ruszaj si�.
    CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
    AI_Output (other, self ,"DIA_Raeuber_VERY_IMPORTATN_TARGUJ_SIE_15_04"); //Tak jest.
    Info_ClearChoices		(DIA_Raeuber_VERY_IMPORTATN);
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia� -
// Wykuwanie broni
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> CanYouForgeWeapon
//========================================

INSTANCE DIA_Pun_CanYouForgeWeapon (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_CanYouForgeWeapon_Condition;
   information  = DIA_Pun_CanYouForgeWeapon_Info;
   permanent	= FALSE;
   description	= "M�g�by� co� dla mnie wyku�?";
};

FUNC INT DIA_Pun_CanYouForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pun_CanYouForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Pun_CanYouForgeWeapon_15_01"); //M�g�by� co� dla mnie wyku�?
    AI_Output (self, other ,"DIA_Pun_CanYouForgeWeapon_03_02"); //A masz jakie� plany kowalskie i sk�adniki? M�g�bym co� stworzy�, ale nic zaawansowanego.
	AI_Output (self, other ,"DIA_Pun_CanYouForgeWeapon_03_03"); //Nie mam tu zbyt porz�dnej ku�ni, wi�c tylko jakie� proste ostrza. Lepsz� ku�nie znajdziesz w Bractwie, albo u Huana w Nowym Obozie. 

	Log_CreateTopic   	(GE_Smitch,LOG_NOTE);
    B_LogEntry			(GE_Smitch, "Pun mo�e wyku� podstawowe i nieco lepsze bronie. Je�li b�d� potrzebowa� bardzo z�o�onych ostrzy musze poszuka� kogo� innego.");
};

//========================================
//-----------------> ForgeWeapon
//========================================

INSTANCE DIA_Pun_ForgeWeapon (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_ForgeWeapon_Condition;
   information  = DIA_Pun_ForgeWeapon_Info;
   permanent	= TRUE;
   description	= "Wykuj dla mnie bro�.";
};

FUNC INT DIA_Pun_ForgeWeapon_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pun_CanYouForgeWeapon))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pun_ForgeWeapon_Info()
{
    AI_Output (other, self ,"DIA_Pun_ForgeWeapon_15_01"); //Wykuj dla mnie bro�.
    AI_Output (self, other ,"DIA_Pun_ForgeWeapon_03_02"); //Czego potrzebujesz?
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};

FUNC VOID DIA_Pun_ForgeWeapon_back ()
{
Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
};
//////////////////////////////////////////////////
// MIECZE TANIE
//////////////////////////////////////////////////
//MIECZ BOJOWY
FUNC VOID DIA_Pun_ForgeWeapon_Plan1b ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end 
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//MIECZ KOWALA
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h6 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//PORZ�DNY MIECZ JEDNOR�CZNY
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h11 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//B�YSK NOCY
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h15 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//SZEROKI MIECZ
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h7 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//D�UGI MIECZ
FUNC VOID DIA_Pun_ForgeWeapon_Plan1c ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//SZTYLET ZAB�JCY
FUNC VOID DIA_Pun_ForgeWeapon_DaggerOfMurder ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//RAPIER
FUNC VOID DIA_Pun_ForgeWeapon_Rapier ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//PA�ASZ
FUNC VOID DIA_Pun_ForgeWeapon_BanditTrader ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//MIECZ ROZPACZY
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1H9 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};

/////////////////////////////////////////
// DRO�SZE BRONIE
/////////////////////////////////////////
//LEKKI MIECZ DWUR�CZNY
FUNC VOID DIA_Pun_ForgeWeapon_Plan3b ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
//�WI�TY M�CICIEL
FUNC VOID DIA_Pun_ForgeWeapon_Miecz1h8 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
		Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	/*if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};*/
};
/*
//////////////////////////////////////////
// NAJDRO�SZE MIECZE
//////////////////////////////////////////
//MIECZ KR�LEWSKI 
FUNC VOID DIA_Pun_ForgeWeapon_Plan3 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//LEKKI TOP�R BOJOWY
FUNC VOID DIA_Pun_ForgeWeapon_Plan5c ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//OSTRZE BOHATERA
FUNC VOID DIA_Pun_ForgeWeapon_Plan4b ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//TOP�R WOJENNY
FUNC VOID DIA_Pun_ForgeWeapon_Plan7b ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};
//POGROMCA ORK�W
FUNC VOID DIA_Pun_ForgeWeapon_Miecz2H5 ()
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
AI_Output				(self, hero,"ORG_870_Pun_NO_INGREDIENTS"); //Przeczytaj dok�adnie plan. Nie masz wszystkich sk�adnik�w!
};
//ingred if end
}
else
{
AI_Output				(self, hero,"ORG_870_Pun_NO_ORE_WP"); //Nie sta� ci� na moje us�ugi!
};
//ore if end
	Info_ClearChoices 	(DIA_Pun_ForgeWeapon);
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,DIALOG_BACK,DIA_Pun_ForgeWeapon_back);
	if (Npc_HasItems (hero, Plan1b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz bojowy (40 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H6) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kowala (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h6);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H11) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Porz�dny miecz jednor�czny (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h11);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H15) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"B�ysk nocy (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h15);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H7) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Szeroki miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h7);
	};
	if (Npc_HasItems (hero, Plan1c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"D�ugi miecz (50 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan1c);
	};
	if (Npc_HasItems (hero, Plan_DaggerOfMurder) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Sztylet zab�jcy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_DaggerOfMurder);
	};
	if (Npc_HasItems (hero, Plan_Rapier) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Rapier (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Rapier);
	};
	if (Npc_HasItems (hero, Plan_Bandittrader) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pa�asz (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_BanditTrader);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H9) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz rozpaczy (75 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1H9);
	};
	if (Npc_HasItems (hero, Plan3b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki miecz dwur�czny (150 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3b);
	};
	if (Npc_HasItems (hero, Plan_Miecz1H8) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"�wi�ty M�ciciel (200 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz1h8);
	};
	if (Npc_HasItems (hero, Plan3) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Miecz kr�lewski (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan3);
	};
	if (Npc_HasItems (hero, Plan5c) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Lekki top�r bojowy (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan5c);
	};
	if (Npc_HasItems (hero, Plan4b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Ostrze bohatera (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan4b);
	};
	if (Npc_HasItems (hero, Plan7b) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Top�r wojenny (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Plan7b);
	};
	if (Npc_HasItems (hero, Plan_Miecz2H5) >=1)
	{
	Info_Addchoice 		(DIA_Pun_ForgeWeapon,"Pogromca ork�w (300 bry�ek rudy)",DIA_Pun_ForgeWeapon_Miecz2H5);
	};
};*/