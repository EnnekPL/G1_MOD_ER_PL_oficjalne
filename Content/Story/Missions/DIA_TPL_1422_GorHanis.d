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
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walcz� ku chwale wielkiego �ni�cego!
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
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta�em wybrany przez moich mistrz�w, by broni� na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przy�wieca mi wi�c wy�szy cel. Walcz�, by pokaza� niewiernym jak wielka jest pot�ga �ni�cego!
};

// **************************************************
//					Schl�fer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Kim jest �ni�cy?";
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
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //W naszym Obozie znajdziesz �wi�tych m��w, kt�rzy odpowiedz� ci na to pytanie znacznie lepiej ni� ja.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Powiem ci tylko tyle: �ni�cy b�dzie naszym zbawicielem. Przyprowadzi� nas tutaj i z jego pomoc� uda si� nam st�d wydosta�.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //Chcesz przez to powiedzie�, �e czekacie a� wasz b�g zwr�ci wam wolno��?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Tak! Nasze oczekiwanie wkr�tce dobiegnie ko�ca. W tej chwili przygotowujemy si� do rytua�u wielkiego przyzwania.
};

// **************************************************
//					Gro�e Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Na czym polega rytua�, kt�ry planujecie?";
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
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Na czym polega rytua�, kt�ry planujecie?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Nasi prorocy przewidzieli, �e wsp�lne przywo�anie �ni�cego jest jedyn� drog� do odzyskania wolno�ci!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Je�li chcesz si� jeszcze czego� dowiedzie�, powiniene� uda� si� do naszego obozu.
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
	description 	= "M�g�by� opisa� mi drog� do waszego Obozu?";
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
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //M�g�by� opisa� mi drog� do waszego Obozu?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, kt�rzy ch�tnie wska�� ci drog� do obozu na bagnie. Znajd� kt�rego� z nich i porozmawiaj z nim!
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
	description 	= "Wyzywam ci� na pojedynek na arenie!";
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
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Wyzywam ci� na pojedynek na arenie!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Zabicie kogo� takiego jak ty raczej nie przysporzy chwa�y �ni�cemu.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Stan� z tob� w szranki dopiero w tedy, gdy oka�esz si� godnym rywalem.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Ale jestem pewien, �e wojownicy z Nowego Obozu nie b�d� mieli takich skrupu��w...
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
	description 	= "Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?";
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
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Nie! Jeste� jeszcze zbyt s�aby. Nie sprostasz mi w walce!
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
   description	= "Mo�esz nauczy� mnie czego� nowego?";
};

FUNC INT DIA_GorHanis_WarriorTeach_Condition()
{
if  (kapitel < 4) {
    return TRUE; };
};

FUNC VOID DIA_GorHanis_WarriorTeach_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_01"); //Mo�esz nauczy� mnie czego� nowego?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_02"); //Szukasz zdolno�ci dost�pnych tylko dla wyznawc�w Bractwa?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_03"); //No dobrze. Naucz� ci�, jak wytrzymywa� wi�ksze obra�enia, ale pod jednym warunkiem.
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_04"); //Jakim warunkiem?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_05"); //Pokonaj kt�rego� z wojownik�w na arenie.
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_06"); //Dlaczego nie mog� walczy� z tob�?
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_07"); //Nie jeste� godzien walki ze mn�. Wygra�bym z �atwo�ci�.
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_08"); //�ni�cy przygarnia sieroty, a nie bije ich.
    AI_Output (other, self ,"DIA_GorHanis_WarriorTeach_15_09"); //Co? Nie jestem sierot�.
    AI_Output (self, other ,"DIA_GorHanis_WarriorTeach_03_10"); //Id� do swoich zaj��.
    MIS_WpierdolNaArenie = LOG_RUNNING;
Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Gor Hanis nauczy mnie wytrzyma�o�ci na r�ne rodzaje obra�e�.");
    Log_CreateTopic            (CH1_WpierdolNaArenie, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WpierdolNaArenie, LOG_RUNNING);
    B_LogEntry                     (CH1_WpierdolNaArenie,"Gor Hanis nauczy mnie nowych umiej�tno�ci, gdy pokonam kt�rego� z wojownik�w na arenie.");
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
   description	= "Pokona�em wojownika.";
};

FUNC INT DIA_GorHanis_IFightWith_Condition()
{
    if ((Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	&& (MIS_WpierdolNaArenie == LOG_RUNNING)
    && (Kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_IFightWith_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_IFightWith_15_01"); //Pokona�em wojownika.
    if (Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_02"); //Masz racj�. Kirgo dosta� niez�y wycisk.
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_03"); //Dobra robota. Naucz� ci� tego co wiem.
		 B_LogEntry                     (CH1_WpierdolNaArenie,"Gor Hanis b�dzie mnie uczy�.");
        Log_SetTopicStatus       (CH1_WpierdolNaArenie, LOG_SUCCESS);
        MIS_WpierdolNaArenie = LOG_SUCCESS;

        B_GiveXP (200);
    }
    else if (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_04"); //Pokaza�e� Kharimowi, gdzie jego miejsce.
        AI_Output (other, self ,"DIA_GorHanis_IFightWith_15_05"); //Czy to znaczy, �e b�dziesz mnie uczy�?
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_06"); //Tak.
        B_LogEntry                     (CH1_WpierdolNaArenie,"Gor Hanis b�dzie mnie uczy�.");
        Log_SetTopicStatus       (CH1_WpierdolNaArenie, LOG_SUCCESS);
        MIS_WpierdolNaArenie = LOG_SUCCESS;

        B_GiveXP (200);
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
   description	= "Czego mo�esz mnie nauczy�?";
};

FUNC INT DIA_GorHanis_HanisTeach_Condition()
{
    if (MIS_WpierdolNaArenie == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HanisTeach_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_15_01"); //Czego mo�esz mnie nauczy�?
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_03_02"); //Przede wszystkim pomog� ci wytrzymywa� wi�kszy wysi�ek.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_03_03"); //Naucz� ci� walki z b�lem.

    Info_ClearChoices		(DIA_GorHanis_HanisTeach);
	if (Knows_EdgeArmor == false)
	{
    Info_AddChoice		(DIA_GorHanis_HanisTeach, "Chc� lepiej znosi� obra�enia fizyczne (5 punkt�w nauki)", DIA_GorHanis_HanisTeach_WarriorSkin);
	};
	if (Knows_FireArmor == false)
	{
    Info_AddChoice		(DIA_GorHanis_HanisTeach, "Chc� lepiej znosi� gor�co (5 punkt�w nauki)", DIA_GorHanis_HanisTeach_FireSkin);
	};
	if (Knows_PointArmor == false)
	{
    Info_AddChoice		(DIA_GorHanis_HanisTeach, "Chc� lepiej znosi� obra�enia od pocisk�w (5 punkt�w nauki)", DIA_GorHanis_HanisTeach_ArcherSkin);
	};
    Info_AddChoice		(DIA_GorHanis_HanisTeach, DIALOG_BACK, DIA_GorHanis_HanisTeach_BACK);
};

FUNC VOID DIA_GorHanis_HanisTeach_WarriorSkin()
{
	if (other.lp >=5)
    {
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_WarriorSkin_15_01"); //Chc� lepiej znosi� obra�enia.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_02"); //Musisz przyzwyczai� si� do b�lu. Pod��aj�c �cie�k� wojownika, b�l b�dzie zawsze z tob�.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_03"); //Musisz by� przygotowany psychicznie.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_04"); //Poza tym dbaj o siebie. �wicz wytrzyma�o��.
	hero.protection [PROT_BLUNT]	=	hero.protection [PROT_BLUNT] + 5;
	hero.protection [PROT_EDGE]	=	hero.protection [PROT_EDGE] + 5;
	Knows_EdgeArmor = true;
PrintScreen	("Nowa umiej�tno��: Wytrzyma�o�� wojownika!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
hero.lp = hero.lp - 5;
} else {
AI_Output (self, other ,"DIA_GorHanis_HanisTeach_WarriorSkin_03_05"); //Masz za ma�o do�wiadczenia.
};
};
FUNC VOID DIA_GorHanis_HanisTeach_FireSkin()
{
if (other.lp >=5) {
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_FireSkin_15_01"); //Chc� lepiej znosi� gor�co.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_FireSkin_03_02"); //Wytrzyma� ognisty atak jest niezwykle trudno.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_FireSkin_03_03"); //Gdy przeciwnik ci� zaatakuje, staraj si� os�oni� twarz i najwa�niejsze cz�ci cia�a.
	hero.protection [PROT_FIRE] 	= hero.protection [PROT_FIRE] +	5;
Knows_FireArmor = true;
PrintScreen	("Nowa umiej�tno��: Wytrzyma�o�� �owcy smok�w!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
hero.lp = hero.lp - 5;
} else {
  AI_Output (self, other ,"DIA_GorHanis_HanisTeach_FireSkin_03_04"); //Wr��, gdy b�dziesz mia� wi�cej do�wiadczenia.
};
};
FUNC VOID DIA_GorHanis_HanisTeach_ArcherSkin()
{
if (other.lp >=5) {
    AI_Output (other, self ,"DIA_GorHanis_HanisTeach_ArcherSkin_15_01"); //Chc� lepiej znosi� obra�enia od pocisk�w.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_ArcherSkin_03_02"); //Potrzebujesz nieco zwinno�ci, by umie� zej�� pociskowi z drogi.
    AI_Output (self, other ,"DIA_GorHanis_HanisTeach_ArcherSkin_03_03"); //Je�li widzisz, �e sytuacja jest beznadziejna, staraj si� chocia�, by strza�a nie przebi�a ci narz�d�w wewn�trznych.
	hero.protection [PROT_POINT] = hero.protection [PROT_POINT] + 5;
Knows_PointArmor = true;
PrintScreen	("Nowa umiej�tno��: Wytrzyma�o�� �ucznika!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
hero.lp = hero.lp - 5;
} else {
  AI_Output (self, other ,"DIA_GorHanis_HanisTeach_ArcherSkin_03_04"); //Wr��, gdy b�dziesz mia� wi�cej do�wiadczenia.
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
	description		= "Ich will helfen den Schl�fer zu erwecken."; 
};

FUNC int Info_TPL_1422_GorHanis1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schl�fer zu erwecken.
	AI_Output (self, other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du l�gst, wird der Hohenpriester dir schon eine Lektion erteilen.
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
	AI_Output (self, other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Gl�ck wirst du nicht haben. Geh nur (lacht).
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
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_01"); //Bracie, c� za rado�� wreszcie ci� ujrze�.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_02"); //O�ywie�cy nie daj� nam spokoju.
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_03"); //Co tutaj robicie?
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_04"); //Przys�a� nas Cor Angar.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_05"); //Dowiedzieli�my si�, �e poszed�e� sam do kopalni.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_06"); //Tak si� sk�ada, �e Cor Angar kaza� nam j� oczy�ci�.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_07"); //Co znajduje si� wewn�trz?
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_08"); //Kurz, troch� rudy i kilka pe�zaczy.
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_09"); //W kopalni znajdowa� si� artefakt, przez kt�ry pojawiali si� tu o�ywie�cy.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_10"); //Masz przy sobie ten artefakt?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_11"); //Oczywi�cie, �e go tu mam.
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_12"); //Jednak nie mog� ci go odda�.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_13"); //Ale� ja go nie potrzebuj�. Wykona�e� za nas ca�� prac�.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_14"); //We� t� rud� jako wynagrodzenie.
        CreateInvItems (self, ItMiNugget, 300);
        B_GiveInvItems (self, other, ItMiNugget, 300);
    B_LogEntry                     (CH1_Bractwo_Kopalnia,"Zdobywaj�c artefakt, oczy�ci�em kopalni� z o�ywie�c�w. Cor Angar b�dzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH1_Bractwo_Kopalnia, LOG_SUCCESS);
    MIS_Bractwo_Kopalnia = LOG_SUCCESS;

    B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_15"); //Nie mam go tutaj.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_16"); //W takim razie p�jd� tam ponownie i przynie� go!
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_17"); //To polecenie samego Cor Angara.
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_18"); //Z tego co mi wiadomo, to wy to mieli�cie zrobi�.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_19"); //Prosz�, bardzo mi na tym zale�y.
        MIS_Bractwo_Kopalnia = LOG_RUNNING;

        Log_CreateTopic            (CH1_Bractwo_Kopalnia, LOG_MISSION);
        Log_SetTopicStatus       (CH1_Bractwo_Kopalnia, LOG_RUNNING);
        B_LogEntry                     (CH1_Bractwo_Kopalnia,"Gor Hanis w imieniu Cor Angara zleci� mi odnalezienie artefaktu z kopalni. W ten spos�b powstrzymam rozprzestrzenianie si� o�ywie�c�w.");
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
   description	= "Mam ten kamie�.";
};

FUNC INT DIA_GorHanis_Guaz_Condition()
{
    if (MIS_Bractwo_Kopalnia == LOG_RUNNING)
    && (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_Guaz_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_01"); //Mam ten kamie�.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_02"); //Czyli kopalnia jest ju� czysta?
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_03"); //Tak.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_04"); //We� go ze sob�. Nam si� nie przyda.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_05"); //Zostaniemy tu na stra�y kopalni, a ty id� do Angara.
    B_LogEntry                     (CH1_Bractwo_Kopalnia,"Zdobywaj�c artefakt, oczy�ci�em kopalni� z o�ywie�c�w. Cor Angar b�dzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH1_Bractwo_Kopalnia, LOG_SUCCESS);
    MIS_Bractwo_Kopalnia = LOG_SUCCESS;
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
   description	= "Uciek�e� ze Starego Obozu?";
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
    AI_Output (other, self ,"DIA_GorHanis_HELLO2212e_15_01"); //Uciek�e� ze Starego Obozu?
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_02"); //W ostatniej chwili! Co to by�a za ucieczka.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_03"); //W nocy us�ysza�em ha�asy. Pomy�la�em, �e �ni�cy chce mi si� objawi�!
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_04"); //Jednak okaza�o si�, �e to Stra�nicy podrzynali gard�o temu barbarzy�cy, Kharimowi.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_05"); //Czym pr�dzej zebra�em swoje rzeczy i uciek�em zanim weszli do mojej chaty.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_06"); //Stary Ob�z to bardzo niebezpieczne miejsce dla obcych.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_07"); //Lepiej tam nie id�.
   
};