//poprawione i sprawdzone - Nocturn

// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tu robisz?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
if (kapitel < 4) {
	return 1; };
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tu robisz?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walczê ku chwale wielkiego Œni¹cego!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "Walczysz na arenie?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //Walczysz na arenie?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta³em wybrany przez moich mistrzów, by broniæ na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przyœwieca mi wiêc wy¿szy cel. Walczê, by pokazaæ niewiernym jak wielka jest potêga Œni¹cego!
};

// **************************************************
//					Schläfer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Kim jest Œni¹cy?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Kim jest Œni¹cy?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //W naszym Obozie znajdziesz œwiêtych mê¿ów, którzy odpowiedz¹ ci na to pytanie znacznie lepiej ni¿ ja.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Powiem ci tylko tyle: Œni¹cy bêdzie naszym zbawicielem. Przyprowadzi³ nas tutaj i z jego pomoc¹ uda siê nam st¹d wydostaæ.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //Chcesz przez to powiedzieæ, ¿e czekacie a¿ wasz bóg zwróci wam wolnoœæ?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Tak! Nasze oczekiwanie wkrótce dobiegnie koñca. W tej chwili przygotowujemy siê do rytua³u wielkiego przyzwania.
};

// **************************************************
//					Große Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Na czym polega rytua³, który planujecie?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Na czym polega rytua³, który planujecie?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Nasi prorocy przewidzieli, ¿e wspólne przywo³anie Œni¹cego jest jedyn¹ drog¹ do odzyskania wolnoœci!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Jeœli chcesz siê jeszcze czegoœ dowiedzieæ, powinieneœ udaæ siê do naszego obozu.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "Móg³byœ opisaæ mi drogê do waszego Obozu?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if (( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //Móg³byœ opisaæ mi drogê do waszego Obozu?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, którzy chêtnie wska¿¹ ci drogê do obozu na bagnie. ZnajdŸ któregoœ z nich i porozmawiaj z nim!
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "Wyzywam ciê na pojedynek na arenie!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Wyzywam ciê na pojedynek na arenie!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Zabicie kogoœ takiego jak ty raczej nie przysporzy chwa³y Œni¹cemu.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Stanê z tob¹ w szranki dopiero w tedy, gdy oka¿esz siê godnym rywalem.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Ale jestem pewien, ¿e wojownicy z Nowego Obozu nie bêd¹ mieli takich skrupu³ów...
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "Czy jestem ju¿ doœæ silny, ¿eby siê z tob¹ zmierzyæ?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Czy jestem ju¿ doœæ silny, ¿eby siê z tob¹ zmierzyæ?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Nie! Jesteœ jeszcze zbyt s³aby. Nie sprostasz mi w walce!
};



//========================================
//-----------------> WarriorTeach
//========================================

INSTANCE DIA_GorHanis_WarriorTeach (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 1;
   condition    = DIA_GorHanis_WarriorTeach_Condition;
   information  = DIA_GorHanis_WarriorTeach_Info;
   permanent	= FALSE;
   description	= "Mo¿esz nauczyæ mnie czegoœ nowego?";
};

FUNC INT DIA_GorHanis_WarriorTeach_Condition()
{
if  (kapitel < 4) {
    return TRUE; };
};

FUNC VOID DIA_GorHanis_WarriorTeach_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_01"); //Mo¿esz nauczyæ mnie czegoœ nowego?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_02"); //Szukasz zdolnoœci dostêpnych tylko dla wyznawców Bractwa?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_03"); //No dobrze. Nauczê ciê, jak wytrzymywaæ wiêksze obra¿enia, ale pod jednym warunkiem.
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_04"); //Jakim warunkiem?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_05"); //Pokonaj któregoœ z wojowników na arenie.
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_06"); //Dlaczego nie mogê walczyæ z tob¹?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_07"); //Nie jesteœ godzien walki ze mn¹. Wygra³bym z ³atwoœci¹.
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_08"); //Œni¹cy przygarnia sieroty, a nie bije ich.
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_09"); //Co? Nie jestem sierot¹.
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_10"); //IdŸ do swoich zajêæ.
    MIS_HanisAsTeacher = LOG_RUNNING;
Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Gor Hanis nauczy mnie wytrzyma³oœci na ró¿ne rodzaje obra¿eñ.");
    Log_CreateTopic            (CH1_HanisAsTeacher, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HanisAsTeacher, LOG_RUNNING);
    B_LogEntry                     (CH1_HanisAsTeacher,"Gor Hanis nauczy mnie nowych umiejêtnoœci, gdy pokonam któregoœ z wojowników na arenie.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> IFightWith
//========================================

INSTANCE DIA_GorHanis_IFightWith (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_IFightWith_Condition;
   information  = DIA_GorHanis_IFightWith_Info;
   permanent	= FALSE;
   description	= "Pokona³em wojownika.";
};

FUNC INT DIA_GorHanis_IFightWith_Condition()
{
    if ((Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	&& (MIS_HanisAsTeacher == LOG_RUNNING)
    && (Kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_IFightWith_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_IFightWith_15_01"); //Pokona³em wojownika.
    if (Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_02"); //Masz racjê. Kirgo dosta³ niez³y wycisk.
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_03"); //Dobra robota. Nauczê ciê tego co wiem.
		 B_LogEntry                     (CH1_HanisAsTeacher,"Uda³o mi siê pokonaæ Kirgo, wiêc Gor Hanis bêdzie mnie uczy³.");
        Log_SetTopicStatus       (CH1_HanisAsTeacher, LOG_SUCCESS);
        MIS_HanisAsTeacher = LOG_SUCCESS;

        B_GiveXP (50);
    }
    else if (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_04"); //Pokaza³eœ Kharimowi, gdzie jego miejsce.
        AI_Output (other, self ,"DIA_GorHanis_IFightWith_15_05"); //Czy to znaczy, ¿e bêdziesz mnie uczy³?
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_06"); //Tak.
        B_LogEntry                     (CH1_HanisAsTeacher,"Uda³o mi siê pokonaæ Kharima, wiêc Gor Hanis bêdzie mnie uczy³.");
        Log_SetTopicStatus       (CH1_HanisAsTeacher, LOG_SUCCESS);
        MIS_HanisAsTeacher = LOG_SUCCESS;

        B_GiveXP (75);
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HanisTeach
//========================================

INSTANCE DIA_GorHanis_HanisTeach (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 3;
   condition    = DIA_GorHanis_HanisTeach_Condition;
   information  = DIA_GorHanis_HanisTeach_Info;
   permanent	= TRUE;
   description	= "Czego mo¿esz mnie nauczyæ?";
};

FUNC INT DIA_GorHanis_HanisTeach_Condition()
{
    if (MIS_HanisAsTeacher == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HanisTeach_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_15_01"); //Czego mo¿esz mnie nauczyæ?
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_03_02"); //Przede wszystkim pomogê ci wytrzymywaæ wiêkszy wysi³ek.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_03_03"); //Nauczê ciê walki z bólem.

    Info_ClearChoices		(DIA_GorHanis_HanisTeach);
	if (Knows_EdgeArmor == false)
	{
    Info_AddChoice		(DIA_GorHanis_HanisTeach, "Chcê lepiej znosiæ obra¿enia fizyczne (5 punktów nauki)", DIA_GorHanis_HanisTeach_WarriorSkin);
	};
	if (Knows_FireArmor == false)
	{
    Info_AddChoice		(DIA_GorHanis_HanisTeach, "Chcê lepiej znosiæ gor¹co (5 punktów nauki)", DIA_GorHanis_HanisTeach_FireSkin);
	};
	if (Knows_PointArmor == false)
	{
    Info_AddChoice		(DIA_GorHanis_HanisTeach, "Chcê lepiej znosiæ obra¿enia od pocisków (5 punktów nauki)", DIA_GorHanis_HanisTeach_ArcherSkin);
	};
    Info_AddChoice		(DIA_GorHanis_HanisTeach, DIALOG_BACK, DIA_GorHanis_HanisTeach_BACK);
};

FUNC VOID DIA_GorHanis_HanisTeach_WarriorSkin()
{
	if (other.lp >=5)
    {
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_WarriorSkin_15_01"); //Chcê lepiej znosiæ obra¿enia.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_02"); //Musisz przyzwyczaiæ siê do bólu. Pod¹¿aj¹c œcie¿k¹ wojownika, ból bêdzie zawsze z tob¹.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_03"); //Musisz byæ przygotowany psychicznie.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_04"); //Poza tym dbaj o siebie. Æwicz wytrzyma³oœæ.
	hero.protection [PROT_BLUNT]	=	hero.protection [PROT_BLUNT] + 5;
	hero.protection [PROT_EDGE]	=	hero.protection [PROT_EDGE] + 5;
	Knows_EdgeArmor = true;
PrintScreen	("Nowa umiejêtnoœæ: Wytrzyma³oœæ wojownika!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
hero.lp = hero.lp - 5;
} else {
AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_05"); //Masz za ma³o doœwiadczenia.
};
};
FUNC VOID DIA_GorHanis_HanisTeach_FireSkin()
{
if (other.lp >=5) {
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_FireSkin_15_01"); //Chcê lepiej znosiæ gor¹co.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_FireSkin_03_02"); //Wytrzymaæ ognisty atak jest niezwykle trudno.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_FireSkin_03_03"); //Gdy przeciwnik ciê zaatakuje, staraj siê os³oniæ twarz i najwa¿niejsze czêœci cia³a.
	hero.protection [PROT_FIRE] 	= hero.protection [PROT_FIRE] +	5;
Knows_FireArmor = true;
PrintScreen	("Nowa umiejêtnoœæ: Wytrzyma³oœæ ³owcy smoków!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
hero.lp = hero.lp - 5;
} else {
  AI_Output (self, other ,"DIA_GorHanis_HanisTeach_FireSkin_03_04"); //Wróæ, gdy bêdziesz mia³ wiêcej doœwiadczenia.
};
};
FUNC VOID DIA_GorHanis_HanisTeach_ArcherSkin()
{
if (other.lp >=5) {
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_ArcherSkin_15_01"); //Chcê lepiej znosiæ obra¿enia od pocisków.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_ArcherSkin_03_02"); //Potrzebujesz nieco zwinnoœci, by umieæ zejœæ pociskowi z drogi.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_ArcherSkin_03_03"); //Jeœli widzisz, ¿e sytuacja jest beznadziejna, staraj siê chocia¿, by strza³a nie przebi³a ci narz¹dów wewnêtrznych.
	hero.protection [PROT_POINT] = hero.protection [PROT_POINT] + 5;
Knows_PointArmor = true;
PrintScreen	("Nowa umiejêtnoœæ: Wytrzyma³oœæ ³ucznika!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
hero.lp = hero.lp - 5;
} else {
  AI_Output (self, other ,"DIA_GorHanis_HanisTeach_ArcherSkin_03_04"); //Wróæ, gdy bêdziesz mia³ wiêcej doœwiadczenia.
};
};
FUNC VOID DIA_GorHanis_HanisTeach_BACK()
{
    Info_ClearChoices		(DIA_GorHanis_HanisTeach);
};


/*

// infos 
instance Info_TPL_1422_GorHanis (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis_Condition;
	information		= Info_TPL_1422_GorHanis_Info;
	important			= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1422_GorHanis_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_PC_Mage_LoadSword3 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis_Info()
{
	AI_Output (self, other,"Info_TPL_1422_GorHanis_08_01"); //Was machst du hier?
};


instance Info_TPL_1422_GorHanis1 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis1_Condition;
	information		= Info_TPL_1422_GorHanis1_Info;
	important			= 0;
	permanent		= 0;
	description		= "Ich will helfen den Schläfer zu erwecken."; 
};

FUNC int Info_TPL_1422_GorHanis1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schläfer zu erwecken.
	AI_Output (self, other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du lügst, wird der Hohenpriester dir schon eine Lektion erteilen.
};



instance Info_TPL_1422_GorHanis2 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis2_Condition;
	information		= Info_TPL_1422_GorHanis2_Info;
	important			= 0;
	permanent		= 0;
	description		= "Das geht dich nichts an!"; 
};

FUNC int Info_TPL_1422_GorHanis2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis2_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis2_15_01"); //Das geht dich nichts an!
	AI_Output (self, other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen. 
};


instance Info_TPL_1422_GorHanis3 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis3_Condition;
	information		= Info_TPL_1422_GorHanis3_Info;
	important			= 0;
	permanent		= 0;
	description		= "Wie seit ihr an dem Priester vorbei gekommen?"; 
};

FUNC int Info_TPL_1422_GorHanis3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis2 )) || ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis1 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis3_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis3_15_01"); //Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output (self, other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Glück wirst du nicht haben. Geh nur (lacht).
};

*/
//========================================
//-----------------> Basdasdasd
//========================================

INSTANCE DIA_GorHanis_Basdasdasd (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 1;
   condition    = DIA_GorHanis_Basdasdasd_Condition;
   information  = DIA_GorHanis_Basdasdasd_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorHanis_Basdasdasd_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glest_First)) && (Kapitel == 10) //zastepuja ich najemnicy
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_Basdasdasd_Info()
{
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_01"); //Bracie, có¿ za radoœæ wreszcie ciê ujrzeæ.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_02"); //O¿ywieñcy nie daj¹ nam spokoju.
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_03"); //Co tutaj robicie?
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_04"); //Przys³a³ nas Cor Angar.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_05"); //Dowiedzieliœmy siê, ¿e poszed³eœ sam do kopalni.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_06"); //Tak siê sk³ada, ¿e Cor Angar kaza³ nam j¹ oczyœciæ.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_07"); //Co znajduje siê wewn¹trz?
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_08"); //Kurz, trochê rudy i kilka pe³zaczy.
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_09"); //W kopalni znajdowa³ siê artefakt, przez który pojawiali siê tu o¿ywieñcy.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_10"); //Masz przy sobie ten artefakt?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_11"); //Oczywiœcie, ¿e go tu mam.
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_12"); //Jednak nie mogê ci go oddaæ.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_13"); //Ale¿ ja go nie potrzebujê. Wykona³eœ za nas ca³¹ pracê.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_14"); //WeŸ tê rudê jako wynagrodzenie.
        CreateInvItems (self, ItMiNugget, 300);
        B_GiveInvItems (self, other, ItMiNugget, 300);
    B_LogEntry                     (CH4_PsiAbadonedMine,"Zdobywaj¹c artefakt, oczyœci³em kopalniê z o¿ywieñców. Cor Angar bêdzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;

    B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_15"); //Nie mam go tutaj.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_16"); //W takim razie pójdŸ tam ponownie i przynieœ go!
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_17"); //To polecenie samego Cor Angara.
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_18"); //Z tego co mi wiadomo, to wy to mieliœcie zrobiæ.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_19"); //Proszê, bardzo mi na tym zale¿y.
        MIS_PsiAbadonedMine = LOG_RUNNING;

        Log_CreateTopic            (CH4_PsiAbadonedMine, LOG_MISSION);
        Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_RUNNING);
        B_LogEntry                     (CH4_PsiAbadonedMine,"Gor Hanis w imieniu Cor Angara zleci³ mi odnalezienie artefaktu z kopalni. W ten sposób powstrzymam rozprzestrzenianie siê o¿ywieñców.");
    };

    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Guaz
//========================================

INSTANCE DIA_GorHanis_Guaz (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 1;
   condition    = DIA_GorHanis_Guaz_Condition;
   information  = DIA_GorHanis_Guaz_Info;
   permanent	= FALSE;
   description	= "Mam ten kamieñ.";
};

FUNC INT DIA_GorHanis_Guaz_Condition()
{
    if (MIS_PsiAbadonedMine == LOG_RUNNING)
    && (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_Guaz_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_01"); //Mam ten kamieñ.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_02"); //Czyli kopalnia jest ju¿ czysta?
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_03"); //Tak.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_04"); //WeŸ go ze sob¹. Nam siê nie przyda.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_05"); //Zostaniemy tu na stra¿y kopalni, a ty idŸ do Angara.
    B_LogEntry                     (CH4_PsiAbadonedMine,"Zdobywaj¹c artefakt, oczyœci³em kopalniê z o¿ywieñców. Cor Angar bêdzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;
   B_GiveXP (500);  
  AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO2212e
//========================================

INSTANCE DIA_GorHanis_HELLO2212e (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLO2212e_Condition;
   information  = DIA_GorHanis_HELLO2212e_Info;
   permanent	= FALSE;
   description	= "Uciek³eœ ze Starego Obozu?";
};

FUNC INT DIA_GorHanis_HELLO2212e_Condition()
{
    if (Kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLO2212e_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HELLO2212e_15_01"); //Uciek³eœ ze Starego Obozu?
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_02"); //W ostatniej chwili! Co to by³a za ucieczka.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_03"); //W nocy us³ysza³em ha³asy. Pomyœla³em, ¿e Œni¹cy chce mi siê objawiæ!
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_04"); //Jednak okaza³o siê, ¿e to Stra¿nicy podrzynali gard³o temu barbarzyñcy, Kharimowi.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_05"); //Czym prêdzej zebra³em swoje rzeczy i uciek³em zanim weszli do mojej chaty.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_06"); //Stary Obóz to bardzo niebezpieczne miejsce dla obcych.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_07"); //Lepiej tam nie idŸ.
   
};