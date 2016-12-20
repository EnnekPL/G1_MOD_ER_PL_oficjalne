// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Powodzenia!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch�opcze. Nawzajem.
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jeste�?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jeste�?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca�ych 10 lat. Uwierz mi, du�o ju� tu widzia�em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi�em czo�a wielu niebezpiecze�stwom, ale jako� uda�o mi si� z nich wybrn��.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pami�tam jak pracowali�my jeszcze w pierwszej kopalni, tej, kt�ra teraz stoi pusta. Pewnego dnia nie wytrzyma�y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s�ysza�e� te� o wielu planach ucieczki."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s�ysza�e� te� o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos�uchaj, ch�opcze. Wiem, �e chcia�by� si� st�d wydosta�, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St�d nie ma ucieczki! Widzia�em twarze tych, kt�rzy pr�bowali sforsowa� Barier�.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope�niaj tego samego b��du. Bariera powstrzyma ka�dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chc� sp�dzi� nast�pnych 10 lat mojego �ycia wydobywaj�c rud�!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo�e zostaniesz wielk� szych�, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo�esz pi�� si� do g�ry, ale niewa�ne jak wysokie stanowisko uda ci si� osi�gn�� - Bariera wreszcie ci� zatrzyma.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa�e� kiedy� jako g�rnik, ch�opcze?
};  

instance  VLK_586_Grimes_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_LEARN_Condition;
	information		= VLK_586_Grimes_LEARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kogo�, kto nauczy mnie kopa� rud�."; 
};

FUNC int  VLK_586_Grimes_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0)
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_01"); //Szukam kogo�, kto nauczy mnie kopa� rud�.
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_02"); //Ach, to ciebie Ian ostatnio przyj�� do pracy. Nauka b�dzie ci� kosztowa� kilka bry�ek rudy.
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_03"); //Nic nie mam. Ian wszystko mi zabra�. Powiedzia�, �e mam wykopa� 500 bry�ek rudy.
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_04"); //Jeste� w ci�kiej sytuacji, rozumiem. Tym razem zrobi� wi�c wyj�tek. 
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo�e mnie nauczy� jak wydobywa� rud�. Za nauk� nie musz� nic p�aci�, poniewa� jestem Kopaczem.");
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_06"); //Nauka tego fachu nie jest taka trudna, jednak b�dzie ci� to kosztowa� 60 bry�ek rudy.
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo�e mnie nauczy� jak wydobywa� rud�. Za nauk� musz� zap�aci� 60 bry�ek rudy.");
	};
};

instance  VLK_586_Grimes_START_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_START_LEARN_Condition;
	information		= VLK_586_Grimes_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie kopa� rud�. (5 punkt�w nauki, 60 bry�ek je�li nie jeste� Kopaczem)"; 
};

FUNC int  VLK_586_Grimes_START_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0) 
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_START_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_START_LEARN_Info_15_01"); //Naucz mnie kopa� rud�.
	if (hero.lp >=5)
	{
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	VLK_586_Grimes_START_LEARN.permanent = false;
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintS_Ext ("Nowa umiej�tno��: G�rnictwo",COL_Lime);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=60)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz�tki nie s� zbyt trudne. Musisz umie� odpowiednio uderzy�. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa�niejsza jest rozwaga. WIelu g�rnik�w zgin�o przyci�ni�tych przez ska�y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s�abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbada� ska�� i nieco j� rozbi�. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je�eli b�dziesz mia� troch� szcz�cia szybko wydob�dziesz bry�ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pami�taj, �e ka�da �y�a rudy kiedy� si� sko�czy.
	B_GiveInvItems (other,self, itminugget, 60);
	Npc_RemoveInvItems (self, itminugget,50);
	VLK_586_Grimes_START_LEARN.permanent = false;	
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintS_Ext ("Nowa umiej�tno��: G�rnictwo",COL_Lime);
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_08"); //Pr�bujesz okpi� staruszka? Brakuje ci rudy!
	VLK_586_Grimes_START_LEARN.permanent = true;
	};
	};
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_09"); //Nie mog� ci� niczego nauczy�! Barkuje ci do�wiadczenia. 
	};
};

//========================================
//-----------------> AKSZYN22
//========================================

INSTANCE DIA_Grimes_AKSZYN22 (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_AKSZYN22_Condition;
   information  = DIA_Grimes_AKSZYN22_Info;
   permanent	= FALSE;
   description	= "Przygotuj si�.";
};

FUNC INT DIA_Grimes_AKSZYN22_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_WLAM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_AKSZYN22_Info()
{
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_01"); //Przygotuj si�.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_02"); //Ju� zaczynacie? Gdzie Aleph?
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_03"); //Zrezygnowa�. Ja otworz� zamki. 
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_04"); //Ty tymczasem zatrzymaj tu Iana i jego Stra�nik�w.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_05"); //Spokojnie. B�d� mia� wszystko na oku.
    B_LogEntry     (CH1_ActionOM,"Rozmawia�em z Grimesem o jego zadaniu. Wie, co ma robi�. Nie musz� si� martwi�, �e Ian nagle wpadnie na pomys� zej�cia na dno Kopalni.");
};

//========================================
//-----------------> KILOF
//========================================

INSTANCE DIA_Grimes_KILOF (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 55;
   condition    = DIA_Grimes_KILOF_Condition;
   information  = DIA_Grimes_KILOF_Info;
   permanent	= FALSE;
   description	= "Ten kilof chyba nale�y do ciebie.";
};

FUNC INT DIA_Grimes_KILOF_Condition()
{
    if (Npc_HasItems (other, ItMwPickaxeGrimes) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_KILOF_Info()
{
    AI_Output (other, self ,"DIA_Grimes_KILOF_15_01"); //Ten kilof chyba nale�y do ciebie.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_02"); //Uda�o ci si� go znale��? Wracaj� wspomnienia...
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_03"); //Jestem ci bardzo wdzi�czny, �e mi go przynios�e�.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_04"); //We� to jako zap�at�.
	B_GiveInvItems (other, self, ItMwPickaxeGrimes, 1);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
};

//========================================
// DIALOG USUNI�TY =======================
//========================================

INSTANCE DIA_Grimes_GoldMine (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_GoldMine_Condition;
   information  = DIA_Grimes_GoldMine_Info;
   permanent	= FALSE;
   description	= "Szukam kogo� do pracy w kopalni z�ota.";
};

FUNC INT DIA_Grimes_GoldMine_Condition()
{
    if (MIS_GoldMine == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_GoldMine_Info()
{
    AI_Output (other, self ,"DIA_Grimes_GoldMine_15_01"); //Szukam kogo� do pracy w kopalni z�ota.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_02"); //Kopalnia z�ota?
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_03"); //Niby gdzie?
    AI_Output (other, self ,"DIA_Grimes_GoldMine_15_04"); //Hmm... Chyba nie mog� ci powiedzie�.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_05"); //Dlaczego? 
    AI_Output (other, self ,"DIA_Grimes_GoldMine_15_06"); //Sam nie wiem gdzie jest.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_07"); //Za stary ju� jestem na takie przygody.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_08"); //My�l�, �e Glen b�dzie ch�tny.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_09"); //Jest m�ody i ma wiele si�y.
    B_LogEntry                     (CH2_GoldMine,"Grimes uwa�a, �e Glen b�dzie ch�tny do pracy w kopalni z�ota.");

    B_GiveXP (100);
};


//========================================
//-----------------> KAPITEL4_DIALOG
//========================================

INSTANCE DIA_Grimes_KAPITEL4_DIALOG (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_KAPITEL4_DIALOG_Condition;
   information  = DIA_Grimes_KAPITEL4_DIALOG_Info;
   permanent	= FALSE;
   description	= "Witaj!";
};

FUNC INT DIA_Grimes_KAPITEL4_DIALOG_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_KAPITEL4_DIALOG_Info()
{
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_01"); //Witaj!
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_02"); //Mi�o ci� zn�w widzie�, ch�opcze. Ciesz� si�, �e wci�� �yjesz. Ostatnio �mier� wisi w powietrzu nad ka�dym mieszka�cem Kolonii. 
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_03"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_04"); //A no to, �e zaczyna si� wojna. Magowie Ognia i ludzie pracuj�cy w Starej Kopalni byli jej pierwszymi ofiarami.
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_05"); //Wkr�tce i inne obozy padn� ofiar� szale�czych zap�d�w Gomeza. Nowy Ob�z oberwie jako pierwszy.
};

//========================================
//-----------------> GOMEZ_PLAN
//========================================

INSTANCE DIA_Grimes_GOMEZ_PLAN (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 2;
   condition    = DIA_Grimes_GOMEZ_PLAN_Condition;
   information  = DIA_Grimes_GOMEZ_PLAN_Info;
   permanent	= FALSE;
   description	= "Co wiesz o planach Gomeza?";
};

FUNC INT DIA_Grimes_GOMEZ_PLAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_GOMEZ_PLAN_Info()
{
    AI_Output (other, self ,"DIA_Grimes_GOMEZ_PLAN_15_01"); //Co wiesz o planach Gomeza?
    AI_Output (self, other ,"DIA_Grimes_GOMEZ_PLAN_03_02"); //Nic, jestem tylko Kopaczem. Gdyby nie uratowa�o mnie kilku Stra�nik�w z obozu przed kopalni�, podzieli�bym los innych. Chwa�a Innosowi, �e w chwili upadku kopalni by�em blisko wyj�cia.
};

//========================================
//-----------------> WAR
//========================================

INSTANCE DIA_Grimes_WAR (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 3;
   condition    = DIA_Grimes_WAR_Condition;
   information  = DIA_Grimes_WAR_Info;
   permanent	= FALSE;
   description	= "Sk�d wiesz, �e wybuchnie wojna?";
};

FUNC INT DIA_Grimes_WAR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_WAR_Info()
{
    AI_Output (other, self ,"DIA_Grimes_WAR_15_01"); //Sk�d wiesz, �e wybuchnie wojna?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_02"); //Rozejrzyj si� tylko, ch�opcze. Gomez zosta� pozbawiony �r�d�a dochod�w, przez co jego autorytet w Vengardzie mo�e run�� w ka�dej chwili. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_03"); //Dlatego wys�a� cz�� swoich wojsk, aby uderzyli na Nowy Ob�z. Wiem, �e Lee i jego Najemnicy nie puszcz� mu tego p�azem.
    AI_Output (self, other ,"DIA_Grimes_WAR_03_04"); //Bractwo �ni�cego wesprze Nowy Ob�z, jako �e Gomez nakaza� zabi� wys�annik�w Bractwa rezyduj�cych w Obozie. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_05"); //S�ysza�em, �e Cor Angar niesamowicie si� w�ciek� i gdy tylko zaczn� si� walki, wy�le w ramach zemsty swoich �wi�tynnych Stra�nik�w. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_06"); //Zbiry z g�r tak�e nie s� w dobrym po�o�eniu. Zapewne teraz, gdy zosta�y wys�ane patrole Stra�nik�w ich Ob�z zostanie wykryty. S�ysza�em te� o planach odno�nie Opuszczonej Kopalni.
    AI_Output (other, self ,"DIA_Grimes_WAR_15_07"); //Sk�d ty to wszystko wiesz?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_08"); //Jestem dobrym obserwatorem i mam wielu przyjaci� w Kolonii. St�d dysponuje wieloma informacjami.
};

//========================================
//-----------------> HISTORY
//========================================

INSTANCE DIA_Grimes_HISTORY (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 4;
   condition    = DIA_Grimes_HISTORY_Condition;
   information  = DIA_Grimes_HISTORY_Info;
   permanent	= FALSE;
   description	= "Prze�y�e� a� dwa upadki kopalni. Musisz by� nie�le wstrz��ni�ty.";
};

FUNC INT DIA_Grimes_HISTORY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_HISTORY_Info()
{
    AI_Output (other, self ,"DIA_Grimes_HISTORY_15_01"); //Prze�y�e� a� dwa upadki kopalni. Musisz by� nie�le wstrz��ni�ty.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_02"); //Dzi�kuje za trosk�, m�j ch�opcze, jednak ze mn� wszystko w porz�dku. By�em na to przygotowany.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_03"); //Oczywi�cie sytuacja nie by�a tak dramatyczna po upadku Opuszczonej Kopalni, jak teraz, ale wierz�, �e z pomoc� bog�w damy rad�. 
};

//========================================
//-----------------> SMALLTALK
//========================================

INSTANCE DIA_Grimes_SMALLTALK (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 5;
   condition    = DIA_Grimes_SMALLTALK_Condition;
   information  = DIA_Grimes_SMALLTALK_Info;
   permanent	= TRUE;
   description	= "Co zamierzasz dalej robi�?";
};

FUNC INT DIA_Grimes_SMALLTALK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_SMALLTALK_Info()
{
    AI_Output (other, self ,"DIA_Grimes_SMALLTALK_15_01"); //Co zamierzasz dalej robi�?
    AI_Output (self, other ,"DIA_Grimes_SMALLTALK_03_02"); //Zostan� w jaskini i przeczekam ca�e to zamieszanie. Potem chyba zg�osz� si� na ochotnika do pracy w kt�rej� kopalni.
};