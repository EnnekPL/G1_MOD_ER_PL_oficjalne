//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Rocky_EXIT(C_INFO)
{
	npc             = BAN_1605_Rocky;
	nr              = 999;
	condition	= DIA_Rocky_EXIT_Condition;
	information	= DIA_Rocky_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rocky_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rocky_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EqDoWalki
//========================================

INSTANCE DIA_Rocky_EqDoWalki (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_EqDoWalki_Condition;
   information  = DIA_Rocky_EqDoWalki_Info;
   permanent	= FALSE;
   description	= "Potrzebujemy ekwipunku.";
};

FUNC INT DIA_Rocky_EqDoWalki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_EqDoWalki_Info()
{
    AI_Output (other, self ,"DIA_Rocky_EqDoWalki_15_01"); //Potrzebujemy ekwipunku.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_02"); //S�ysza�em ju� o waszych ambitnych planach. Jak zwykle musz� zosta� w Obozie.
    AI_Output (other, self ,"DIA_Rocky_EqDoWalki_15_03"); //Daj mi ten ekwipunek.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_04"); //Nie tak pr�dko. My�lisz, �e w godzin� naprawi� 15 sk�rzanych pancerzy?!
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_05"); //Potrzebuj� materia��w.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_06"); //Przynie� mi 30 k��w i 10 wilczych sk�r.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_07"); //Tylko si� po�piesz z tym wszystkim.
	
    MIS_materials4Rocky = LOG_RUNNING;

    Log_CreateTopic            (CH1_materials4Rocky, LOG_MISSION);
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_RUNNING);
    B_LogEntry                     (CH1_materials4Rocky,"Aby Rocky m�g� naprawi� pancerze, potrzebuje 30 k��w oraz 10 wilczych sk�r.");
};
//========================================
//-----------------> Towary
//========================================

INSTANCE DIA_Rocky_Towary (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_Towary_Condition;
   information  = DIA_Rocky_Towary_Info;
   permanent	= FALSE;
   description	= "Mam to, o co prosi�e�.";
};

FUNC INT DIA_Rocky_Towary_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_EqDoWalki))
    && (Npc_HasItems (other, ItAt_Teeth_01) >=30)
    && (Npc_HasItems (other, ItAt_Wolf_01) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_Towary_Info()
{
    AI_Output (other, self ,"DIA_Rocky_Towary_15_01"); //Mam to, o co prosi�e�.
    AI_Output (self, other ,"DIA_Rocky_Towary_03_02"); //�wietnie. Daj mi to.
    B_LogEntry                     (CH1_materials4Rocky,"Przynios�em Rockiemu materia�y potrzebne do naprawienia ekwipunku.");
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_SUCCESS);
    MIS_materials4Rocky = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItAt_Wolf_01, 10);
    B_GiveInvItems (other, self, ItAt_Teeth_01, 30);


    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia� 1
// Pogaduchy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> POGADUCHY
//========================================

INSTANCE DIA_Rocky_POGADUCHY (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_POGADUCHY_Condition;
   information  = DIA_Rocky_POGADUCHY_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Rocky_POGADUCHY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rocky_POGADUCHY_Info()
{
    AI_Output (other, self ,"DIA_Rocky_POGADUCHY_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Rocky_POGADUCHY_03_02"); //Nazywam si� Rocky. By�em marynarzem, ale zszed�em na z�� drog�.
    AI_Output (self, other ,"DIA_Rocky_POGADUCHY_03_03"); //Tak czy inaczej, nie powinno ci� to obchodzi�.
};

//========================================
//-----------------> PAST
//========================================

INSTANCE DIA_Rocky_PAST (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_PAST_Condition;
   information  = DIA_Rocky_PAST_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o swojej przesz�o�ci.";
};

FUNC INT DIA_Rocky_PAST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_PAST_Info()
{
    AI_Output (other, self ,"DIA_Rocky_PAST_15_01"); //Opowiedz mi o swojej przesz�o�ci.
    AI_Output (self, other ,"DIA_Rocky_PAST_03_02"); //C�... Niegdy� by�em marynarzem.
    AI_Output (other, self ,"DIA_Rocky_PAST_15_03"); //Dlaczego trafi�e� do Kolonii?
    AI_Output (self, other ,"DIA_Rocky_PAST_03_04"); //Zacz��em zadawa� si� z piratami. W ko�cu zgarn�li mnie paladyni.
    AI_Output (other, self ,"DIA_Rocky_PAST_15_05"); //Dlaczego w takim razie zszed�e� na l�d?
    AI_Output (self, other ,"DIA_Rocky_PAST_03_06"); //�ycie na morzu by�o ci�kie. Chcia�em si� wyrwa� ze statku. Potrzebowa�em got�wki...
    AI_Output (self, other ,"DIA_Rocky_PAST_03_07"); //Kradzie� by�a jedynym sposobem, by prze�y�.
    AI_Output (other, self ,"DIA_Rocky_PAST_15_08"); //A wi�c znasz si� na tym?
    AI_Output (self, other ,"DIA_Rocky_PAST_03_09"); //Mo�e.
};

//========================================
//-----------------> CHATA
//========================================

INSTANCE DIA_Rocky_CHATA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_CHATA_Condition;
   information  = DIA_Rocky_CHATA_Info;
   permanent	= FALSE;
   description	= "Dlaczego dzielisz chat� z Quentinem?";
};

FUNC INT DIA_Rocky_CHATA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_CHATA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_CHATA_15_01"); //Dlaczego dzielisz chat� z Quentinem?
    AI_Output (self, other ,"DIA_Rocky_CHATA_03_02"); //To proste - jeste�my przyjaci�mi. Pomog�em mu nie raz. Poza tym w Obozie jest zbyt ma�o miejsca na fanaberie.
    AI_Output (self, other ,"DIA_Rocky_CHATA_03_03"); //Quentin to rozumie, dlatego mieszkam u niego.
};

//========================================
//-----------------> ADVENTURE
//========================================

INSTANCE DIA_Rocky_ADVENTURE (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_ADVENTURE_Condition;
   information  = DIA_Rocky_ADVENTURE_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi jedn� z waszych przyg�d.";
};

FUNC INT DIA_Rocky_ADVENTURE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_CHATA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_ADVENTURE_Info()
{
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_01"); //Opowiedz mi jedn� z waszych przyg�d. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_02"); //Chyba najbardziej utkwi�a mi w pami�ci historia odnalezienia doliny. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_03"); //Pewnej wrze�niowej nocy postanowili�my uciec z Nowego Obozu. Wzi�li�my ze sob� kilku zaufanych ludzi i po prostu dali�my nog�.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_04"); //Po drodze spotkali�my Jensa. By� wtedy zwyczajnym �achmyt�. �azi� noc� po lesie. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_05"); //Zgarn�li�my go. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_06"); //Quentin zaproponowa� i�� w g�ry. Pozbyli�my si� z�baczy i poszli�my dalej. W ko�cu naszym oczom ukaza�a si� ta dolina.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_07"); //Usiedli�my na �rodku i przysi�gli�my sobie, �e b�dziemy zawsze trzyma� si� razem, cho�by nie wiem co!
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_08"); //Nikt nigdy nie zostawi swoich kumpli. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_09"); //Wtedy jeden z naszych opar� si� o wielk� ska��. Rozleg� si� g�o�ny ryk, a ziemia zadr�a�a.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_10"); //To by� troll. Zacz�� st�pa� w naszym kierunku. Nie wiedzieli�my, co zrobi�. Razem z Quentinem chwycili�my za bro� i rzucili�my si� na to monstrum.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_11"); //Reszta strzela�a z �uk�w. Wprawdzie nic to nie da�o, ale przynajmniej nie zwiali jak Jens.
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_12"); //Jens uciek�?
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_13"); //Tak. Sp�ywa� gdzie pieprz ro�nie. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_14"); //Z�ama� przysi�g�... zaraz po jej z�o�eniu.
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_15"); //A jednak jest w Obozie.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_16"); //Za kar� kazali�my mu polowa� na wilki i przygotowa� sk�ry na pancerze dla wszystkich Bandyt�w.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_17"); //Tak si� w to wczu�, �e zosta� mistrzem w swoim fachu. 
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_18"); //Ha ha. To ci dopiero historia.
};

//========================================
//-----------------> BUDOWA_OBOZU
//========================================

INSTANCE DIA_Rocky_BUDOWA_OBOZU (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_BUDOWA_OBOZU_Condition;
   information  = DIA_Rocky_BUDOWA_OBOZU_Info;
   permanent	= FALSE;
   description	= "A jak wygl�da�a sprawa z budow� Obozu?";
};

FUNC INT DIA_Rocky_BUDOWA_OBOZU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_ADVENTURE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BUDOWA_OBOZU_Info()
{
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_01"); //A jak wygl�da�a sprawa z budow� Obozu?
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_02"); //C�... Mieli�my bardzo ma�o zasob�w koniecznych do budowy wystarczaj�co du�ej ilo�ci chat.
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_03"); //Ju� teraz jest ma�o miejsca.
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_04"); //Sk�d braki w surowcach? Przecie� drzew w Kolonii pod dostatkiem.
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_05"); //No w�a�nie! Quentin zabroni� nam karczowania lasu. Powiedzia�, �e wtedy ujawnimy swoj� obecno��.
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_06"); //Musieli�my si� pos�u�y� tym, co by�o w dolinie. ��ka zrobili�my z drewnianych desek i suchej trawy. Chaty z drewna, kt�re by�o pod r�k�. 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_07"); //Reszta sprz�t�w "przypadkiem" wpad�a w nasze r�ce.
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_08"); //Ukra�� kowad�o - to dopiero wyczyn! 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_09"); //Ha ha. Racja. O tym ju� pogadaj z Punem. 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_10"); //Dzi�ki m�ody.
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_11"); //Za co?
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_12"); //Sporo sobie przypomnia�em podczas naszych rozm�w. Dobre czasy. 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_13"); //No, dosy� tych wspominek. Zmiataj do jakiej� roboty.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GLUPIEC
//========================================

INSTANCE DIA_Rocky_GLUPIEC (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GLUPIEC_Condition;
   information  = DIA_Rocky_GLUPIEC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_GLUPIEC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_WLADZA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GLUPIEC_Info()
{
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_01"); //Do reszty zg�upia�e�?
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_02"); //Tak si� nie gada z Quentinem. Id� do niego dopiero, gdy masz jaki� wa�ny pow�d. 
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_03"); //Lubi konkrety, nie lubi obcych. Kapujesz?
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAUKA
//========================================
var int log_rocky_nau;
INSTANCE DIA_Rocky_NAUKA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 3;
   condition    = DIA_Rocky_NAUKA_Condition;
   information  = DIA_Rocky_NAUKA_Info;
   permanent	= 1;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Rocky_NAUKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_PAST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_NAUKA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_NAUKA_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Rocky_NAUKA_03_02"); //Poka�� ci, jak zwi�kszy� si�� i naucz� umiej�tno�ci z�odziejskich.
	if (log_rocky_nau == FALSE)
	{
		Log_CreateTopic (GE_TeacherBAN,LOG_NOTE);
		B_LogEntry		(GE_TeacherBAN,"Rocky mo�e mi pom�c zwi�kszy� si�� oraz nauczy� mnie umiej�tno�ci z�odziejskich.");
		log_rocky_nau = TRUE;
	};
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_STR5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_STR1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 1*LPCOST_ATTRIBUTE_STRENGTH);
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_BACK()
{
    Info_ClearChoices	(DIA_Rocky_NAUKA);
};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Rocky_Lehrer (C_INFO)
{
	npc				= BAN_1605_Rocky;
	nr				= 2;
	condition		= DIA_Rocky_Lehrer_Condition;
	information		= DIA_Rocky_Lehrer_Info;
	permanent		= 1;
	description		= "Naucz mnie okrada�."; 
};

FUNC INT DIA_Rocky_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Rocky_PAST))
	{
		return 1;	
	};
};

FUNC VOID DIA_Rocky_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_15_00"); //Naucz mnie okrada�.
	AI_Output (self, other,"DIA_Rocky_Lehrer_05_02"); //Czego konkretnie chcia�by� si� nauczy�?



	Info_ClearChoices	(DIA_Rocky_Lehrer );
	Info_AddChoice		(DIA_Rocky_Lehrer,DIALOG_BACK																,DIA_Rocky_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Rocky_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Rocky_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Rocky_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Rocky_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Rocky_Lehrer_Schleichen);
	};
};


func void DIA_Rocky_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Rocky_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Rocky_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Rocky_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Rocky_Lehrer );
};
///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Rocky_RAYAN (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_RAYAN_Condition;
   information  = DIA_Rocky_RAYAN_Info;
   permanent	= FALSE;
   description	= "Co wiesz o �mierci Rayana?";
};

FUNC INT DIA_Rocky_RAYAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Rocky_RAYAN_15_01"); //Co wiesz o �mierci Rayana?
    AI_Output (self, other ,"DIA_Rocky_RAYAN_03_02"); //Poza tym, �e to mi Quentin kaza� wykopa� gr�b to niezbyt wiele. Okoliczno�ci chyba nie zosta�y wyja�nione. 
	AI_Output (self, other ,"DIA_Rocky_RAYAN_03_03"); //Moim zdaniem napad�a go grupa goblin�w. To by by�o logiczne. Gobliny przecie� nie �rej� ludzi, wi�c obrabowa�y cia�o i je zostawi�y. 
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Zadanie z napadem
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Rocky_QUEST1 (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 4;
   condition    = DIA_Rocky_QUEST1_Condition;
   information  = DIA_Rocky_QUEST1_Info;
   permanent	= FALSE;
   description	= "Podobno szykuje si� napad...";
};

FUNC INT DIA_Rocky_QUEST1_Condition()
{
    if (MIS_Rozpierdol2 == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_01"); //Podobno szykuje si� napad...
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_02"); //Pora si� przyzwyczai�. To jednak b�dzie co� ma�ego, bardziej dyskretnego. 
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_03"); //Dobra, do rzeczy! Mamy zaatakowa� transport towar�w do Starej Kopalni. Ian od czasu do czasu wysy�a list� rzeczy potrzebnych w kopalni. 
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_04"); //Wszystko o co poprosi trafia do kopalni. Najbli�sza dostawa ma by� wyj�tkowo obfita. To szansa dla nas.
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_05"); //O kt�rej zaczynamy?
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_06"); //Przyjd� tutaj o dwunastej. Konw�j wyrusza kilka minut wcze�niej. Nie b�dziemy musieli czeka�.
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_07"); //Dobra. Wkr�tce si� pojawi�.
    B_LogEntry                     (CH1_Rozpierdol2,"Mam zjawi� si� u Rockiego oko�o godziny 12, wtedy te� zaczniemy.");
};

//========================================
//-----------------> ROZPIERDUCHA
//========================================

INSTANCE DIA_Rocky_ROZPIERDUCHA (C_INFO)
{
   npc          		= BAN_1605_Rocky;
   nr           		= 5;
   condition    	= DIA_Rocky_ROZPIERDUCHA_Condition;
   information  	= DIA_Rocky_ROZPIERDUCHA_Info;
   permanent	= FALSE;
   description	= "Ju� czas.";
};

FUNC INT DIA_Rocky_ROZPIERDUCHA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_QUEST1))
    && (Wld_IsTime     (12,00,12,30))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_ROZPIERDUCHA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_ROZPIERDUCHA_15_01"); //Ju� czas.
    AI_Output (self, other ,"DIA_Rocky_ROZPIERDUCHA_03_02"); //Przygotuj miecz i chod� za mn�.
      self.aivar[AIV_PARTYMEMBER] = TRUE;
      Npc_ExchangeRoutine (self,"atak");
	  Npc_ExchangeRoutine (GRD_5054_Gardist,"las");
	  B_ChangeGuild    (GRD_5054_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5053_Gardist,"las");
	  B_ChangeGuild    (GRD_5053_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5055_Eskorta,"las");
	  B_ChangeGuild    (GRD_5055_Eskorta,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5089_Tragaz,"las");
	  CreateInvItems (VLK_5089_Tragaz, eq_z_napadu3, 1);
	  B_ChangeGuild    (VLK_5089_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5090_Tragaz,"las");
	  CreateInvItems (VLK_5090_Tragaz, eq_z_napadu2, 1);
	   B_ChangeGuild    (VLK_5090_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5088_Tragaz,"las"); //1.24
	  CreateInvItems (VLK_5088_Tragaz, eq_z_napadu1, 1); //poprawiony bug 1.4.5.
	  B_ChangeGuild    (VLK_5088_Tragaz,GIL_DMB);
	//Wld_InsertNpc				(GRD_5054_Gardist,"OC1");
	//Wld_InsertNpc				(GRD_5053_Gardist,"OC1");
	//Wld_InsertNpc				(GRD_5055_Eskorta,"OC1"); //resp tragarzy trzeba dopisa�
      AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOTARLI
//========================================

INSTANCE DIA_Rocky_DOTARLI (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 6;
   condition    = DIA_Rocky_DOTARLI_Condition;
   information  = DIA_Rocky_DOTARLI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_DOTARLI_Condition()
{
    if (Npc_GetDistToWP (self, "ATAK009") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Rocky_ROZPIERDUCHA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_DOTARLI_Info()
{
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_01"); //Jeste�my. Zobacz, stoj� tam. Pewnie boj� si� wilk�w.
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_02"); //Przypuszczam, �e si� naradzaj�.
    AI_Output (other, self ,"DIA_Rocky_DOTARLI_15_03"); //Co mamy teraz robi�?
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_04"); //Poczekaj, a� wydam rozkaz.
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_15_05"); //Trzy, dwa, jeden...
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_06"); //ATAKOWA�!!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak2");
	/*GRD_5054_Gardist.guild = GIL_MOLERAT;
	GRD_5053_Gardist.guild = GIL_MOLERAT;
	GRD_5055_Eskorta.guild = GIL_MOLERAT;
	VLK_5089_Tragaz.guild = GIL_MOLERAT;
	VLK_5088_Tragaz.guild = GIL_MOLERAT;
	VLK_5090_Tragaz.guild = GIL_MOLERAT;
		Npc_SetTarget(GRD_5054_Gardist,BAN_1605_Rocky);
		AI_StartState(GRD_5054_Gardist,ZS_ATTACK,1,"");
		Npc_SetTarget(GRD_5053_Gardist,BAN_1605_Rocky);
		AI_StartState(GRD_5053_Gardist,ZS_ATTACK,1,"");
		Npc_SetTarget(GRD_5055_Eskorta,BAN_1605_Rocky);
		AI_StartState(GRD_5055_Eskorta,ZS_ATTACK,1,"");
    Npc_SetTempAttitude	(GRD_5054_Gardist,	ATT_HOSTILE);
	Npc_SetTempAttitude	(GRD_5053_Gardist,	ATT_HOSTILE);
	Npc_SetTempAttitude	(GRD_5055_Eskorta,	ATT_HOSTILE);
    Npc_SetTempAttitude	(VLK_5089_Tragaz,	ATT_HOSTILE);
	Npc_SetTempAttitude	(VLK_5090_Tragaz,	ATT_HOSTILE);
	Npc_SetTempAttitude	(VLK_5088_Tragaz,	ATT_HOSTILE);
	*/
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WIN_O
//========================================

INSTANCE DIA_Rocky_WIN_O (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 7;
   condition    = DIA_Rocky_WIN_O_Condition;
   information  = DIA_Rocky_WIN_O_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_WIN_O_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_DOTARLI))
    && (Npc_IsDead(GRD_5055_Eskorta))
    && (Npc_IsDead(GRD_5054_Gardist))
    && (Npc_IsDead(GRD_5053_Gardist))
	&& (Npc_IsDead(VLK_5089_Tragaz))
    && (Npc_IsDead(VLK_5090_Tragaz))
    && (Npc_IsDead(VLK_5088_Tragaz))
//dopisa� tragarzy      //**** fix 6 sierpie� 2012
{
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_WIN_O_Info()
{
    AI_Output (self, other ,"DIA_Rocky_WIN_O_03_01"); //�wietna robota, ch�opcze. Zabierz wszystko i wracamy.

    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_Rozpierdol2,"Uda�o nam si�. Rozgromili�my Stra�nik�w. Pora wraca� do Quentina.");

    B_GiveXP (XP_AtakNaKonwoj);
};

//========================================
//-----------------> GivEq
//========================================

INSTANCE DIA_Rocky_GivEq (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GivEq_Condition;
   information  = DIA_Rocky_GivEq_Info;
   permanent	= FALSE;
   description	= "Rozda� ekwipunek Bandytom?";
};

FUNC INT DIA_Rocky_GivEq_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_Towary))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GivEq_Info()
{
    AI_Output (other, self ,"DIA_Rocky_GivEq_15_01"); //Rozda� ekwipunek Bandytom?
    AI_Output (self, other ,"DIA_Rocky_GivEq_03_02"); //Nie, sam to zrobi�. Id� do Quentina i powiedz, �e wszystko ju� zrobione.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia� 4
// Odbijanie obozu
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WtfRozwalaWobozie
//========================================

INSTANCE DIA_Rocky_WtfRozwalaWobozie (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_WtfRozwalaWobozie_Condition;
   information  = DIA_Rocky_WtfRozwalaWobozie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_WtfRozwalaWobozie_Condition()
{
    if (MIS_GardistsCheckpoints == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_WtfRozwalaWobozie_Info()
{
   // AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_01"); //Co ci si� do cholery sta�o?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_01"); //Nawet nie wiesz, jak si� ciesz�, �e widz� was w jednym kawa�ku. 
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_02"); //M�g�by� mi wyja�ni� ca�� t� spraw�?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_03"); //Stra�nicy znale�li Ob�z! Ot co si� sta�o!
	AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_04"); //Jak do tego dosz�o?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_05"); //Albo zauwa�yli was, gdy schodzili�cie z g�r, albo kto� nas zdradzi�...
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_06"); //Nie ma teraz czasu szuka� winnych.
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_07"); //Jak du�o Stra�nik�w znajduje si� w Obozie?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_08"); //Ci�ko mi powiedzie�... Musia�em szybko ucieka�. Nie mia�em czasu na zwiady. My�l�, �e jest tam kilkunastu dobrze wyszkolonych �o�nierzy. 
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_09"); //Jaki� plan?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_10"); //Z mojej strony nic... Pogadaj z Quentinem.
	
	MIS_GardistsInBC = LOG_RUNNING;

    Log_CreateTopic          (CH4_GardistsInBC, LOG_MISSION);
    Log_SetTopicStatus       (CH4_GardistsInBC, LOG_RUNNING);
    B_LogEntry               (CH4_GardistsInBC,"Ob�z Bandyt�w zosta� odnaleziony przez Stra�nik�w. Na szcz�cie Rocky'emu uda�o si� w por� uciec i zd��y� nas ostrzec. Musz� porozmawia� z Quentinem o naszych kolejnych krokach.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia� 4
// Kopalnia
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Rocky_GoToMine (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GoToMine_Condition;
   information  = DIA_Rocky_GoToMine_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn� do kopalni?";
};

FUNC INT DIA_Rocky_GoToMine_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GoToMine_Info()
{
    AI_Output (other, self ,"DIA_Rocky_GoToMine_15_01"); //Idziesz ze mn� do kopalni?
    AI_Output (self, other ,"DIA_Rocky_GoToMine_03_02"); //No jasne. Tylko potrzebuj� jakiego� pancerza.
	AI_Output (self, other ,"DIA_Rocky_GoToMine_03_03"); //Skombinuj mi co�, to pogadamy.
	//CreateInvItems  (self,BAU_ARMOR_H,1);
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (self,"pomoc");
	//AI_StopProcessInfos	(self);
	MIS_RockyArmor = LOG_RUNNING;

    Log_CreateTopic      (CH4_RockyArmor, LOG_MISSION);
    Log_SetTopicStatus   (CH4_RockyArmor, LOG_RUNNING);
    B_LogEntry       	 (CH4_RockyArmor,"Je�eli chc�, aby Rocky poszed� ze mn� do kopalni, musz� za�atwi� mu nowy pancerz.");

};
//========================================
//-----------------> AddArmor
//========================================

INSTANCE DIA_Rocky_AddArmor (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_AddArmor_Condition;
   information  = DIA_Rocky_AddArmor_Info;
   permanent	= 1;
   description	= "Mam dla ciebie pancerz...";
};

FUNC INT DIA_Rocky_AddArmor_Condition()
{
    if (MIS_RockyArmor == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_AddArmor_Info()
{
    AI_Output (other, self ,"DIA_Rocky_AddArmor_15_01"); //Mam dla ciebie pancerz...
    AI_Output (self, other ,"DIA_Rocky_AddArmor_03_02"); //�wietnie. Co dla mnie masz?

    Info_ClearChoices		(DIA_Rocky_AddArmor);
	Info_AddChoice		(DIA_Rocky_AddArmor, DIALOG_BACK, DIA_Quentin_DOOBOZU_BACK);
	if (Npc_HasItems (other, NON_ARMOR1) >=1)
    {
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: zdobiona zbroja my�liwego", DIA_Quentin_DOOBOZU_MYSLIWY);
	};
	if (Npc_HasItems (other, BAU_ARMOR_H) >=1)
    {	
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: ci�ka zbroja Bandyty", DIA_Quentin_DOOBOZU_BANDITOSMID);
	};
	if (Npc_HasItems (other, PodroznikArmor) >=1)
    {		
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: zbroja podr�nika", DIA_Quentin_PODROZNIK);
	};
	if (Npc_HasItems (other, PiratArmor) >=1)
    {		
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: str�j pirata", DIA_Quentin_DOOBOZU_PIRAT);
	};

};

FUNC VOID DIA_Quentin_DOOBOZU_BACK ()
{
	Info_ClearChoices		(DIA_Rocky_AddArmor);
};

FUNC VOID DIA_Quentin_DOOBOZU_MYSLIWY()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_MYSLIWY_15_01"); //Oto zdobiona zbroja my�liwego.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_MYSLIWY_03_02"); //Sk�d masz taki pancerz?
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_MYSLIWY_03_03"); //�wietna robota.
	B_giveXP (400);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da�em Rockiemu ozdobn� zbroj� my�liwego. Jest gotowy �eby wyruszy�.");
	B_GiveInvItems      (hero, self, NON_ARMOR1, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Quentin_DOOBOZU_BANDITOSMID()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_BANDITOSMID_15_01"); //Oto moja stara zbroja.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BANDITOSMID_03_02"); //Wprawdzie to nic nadzwyczajnego, ale dzi�ki.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BANDITOSMID_03_03"); //�wietna robota.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da�em Rockiemu moj� star� zbroj�. Jest gotowy �eby wyruszy�.");
	B_GiveInvItems      (hero, self, BAU_ARMOR_H, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Quentin_PODROZNIK()
{
    AI_Output (other, self ,"DIA_Quentin_PODROZNIK_15_01"); //Oto zbroja podr�nika.
    AI_Output (self, other ,"DIA_Quentin_PODROZNIK_03_02"); //Hmm... Ciekawy pancerz.
    AI_Output (self, other ,"DIA_Quentin_PODROZNIK_03_03"); //Podoba mi si�! Dzi�ki.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da�em Rockiemu moj� star� zbroj�. Jest gotowy �eby wyruszy�.");
	B_GiveInvItems      (hero, self, PodroznikArmor, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Quentin_DOOBOZU_PIRAT()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_PIRAT_15_01"); //Oto str�j pirata.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_PIRAT_03_02"); //Pirata? Wygl�da fajnie, ale nie jest to raczej prawdziwy pancerz.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_PIRAT_03_03"); //Wola�bym co� mocniejszego, ale skoro nie masz nic innego. Dzi�ki.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da�em Rockiemu str�j pirata. Jest gotowy �eby wyruszy�.");
	B_GiveInvItems      (hero, self, PiratArmor, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Follow
//========================================

INSTANCE DIA_Rocky_Follow (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_Follow_Condition;
   information  = DIA_Rocky_Follow_Info;
   permanent	= FALSE;
   description	= "Chod� za mn�.";
};

FUNC INT DIA_Rocky_Follow_Condition()
{
    if (MIS_RockyArmor == LOG_SUCCESS) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_Rocky_Follow_Info()
{
    AI_Output (other, self ,"DIA_Rocky_Follow_15_01"); //Chod� za mn�.
    AI_Output (self, other ,"DIA_Rocky_Follow_03_02"); //Jasne!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"odb");
	AI_StopProcessInfos	(self);
	
	//co to za syf?
    RockyRobiZaDoyle  = false;
};

/*
//========================================
//-----------------> BackToCamp
//========================================

INSTANCE DIA_Rocky_BackToCamp (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_BackToCamp_Condition;
   information  = DIA_Rocky_BackToCamp_Info;
   permanent	= FALSE;
   description	= "Wracaj do Obozu.";
};

FUNC INT DIA_Rocky_BackToCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_Follow))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BackToCamp_Info()
{
    AI_Output (other, self ,"DIA_Rocky_BackToCamp_15_01"); //Wracaj do Obozu.
    AI_Output (self, other ,"DIA_Rocky_BackToCamp_03_02"); //W porz�dku.

    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};
*/
//========================================
//-----------------> BackFromMine
//========================================

INSTANCE DIA_Rocky_BackFromMine (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_BackFromMine_Condition;
   information  = DIA_Rocky_BackFromMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_BackFromMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_NoNareszcie))
    && (Npc_GetDistToWP (self, "CAMP01") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BackFromMine_Info()
{
    AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_01"); //Nareszcie wr�ci�e�! Co z kopalni�?
    AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_02"); //Zosta�a zaj�ta przez o�ywie�c�w, kt�rych najprawdopodobniej przywo�uje jaki� magiczny artefakt. 
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_03"); //Mam go przy sobie. Pozby�em si� te� pozosta�ych niedobitk�w. Mo�na teraz bezpiecznie zej�� do szybu.
        AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_04"); //To ju� robota nie dla mnie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_05"); //I co teraz zrobisz?
        AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_06"); //Musz� odszuka� ten artefakt i co� z nim zrobi�.
    };
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////
// INNE GILDIE - NIE BANDYTA
// WTEDY ROCKY ROBI ZA DOYLE'A
// NIE WIEM PO CHUJ, ALE ROBI
//////////////////////////////////////////
/*
//========================================
//-----------------> NoNareszcie
//========================================

INSTANCE DIA_Rocky_NoNareszcie (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_NoNareszcie_Condition;
   information  = DIA_Rocky_NoNareszcie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_NoNareszcie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glest_First)) && (RockyRobiZaDoyle == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_NoNareszcie_Info()
{
    AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_01"); //No nareszcie jeste�. Ju� my�leli�my, �e te potwory rozerwa�y ci� na strz�py.
    AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_02"); //Spokojnie. Nie tak �atwo mnie zabi�.
    AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_03"); //Co widzia�e� w kopalni?
    AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_04"); //Nawet tam nie by�em. Prze�y� tylko jeden Kopacz. Na szcz�cie wzi�� ze sob� artefakt odpowiedzialny za ca�e to zamieszanie.
    AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_05"); //Dobra nasza! Czyli mo�emy zaj�� kopalni�?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_06"); //W sumie to tak. Mam ze sob� kamie�, kt�ry powodowa� to ca�e zamieszanie ze z�ymi si�ami.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_07"); //To �wietnie!
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_08"); //My zostaniemy tutaj i b�dziemy pilnowa� wej�cia.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_09"); //Aha, i zabierz ten kamie� ze sob�. Nie chc� mie� z nim nic wsp�lnego.
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_10"); //My�la�em, �e podaruj� ci go w prezencie. No, ale c�...
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_11"); //Nie denerwuj mnie!
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_12"); //Dobra, ju� dobra. Uwa�aj, bo go wyjm�!
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_13"); //Id� ju�.
		
    //B_LogEntry                     (CH4_BanditsInAbadonedMine,"Wkr�tce po odnalezieniu tajemniczego kamienia z Opuszczonej Kopalni uda�em si� na zewn�trz. Czekali tam ju� na mnie sprzymierze�cy. Bandyta Rocky ");
	HeroMaArtefakt = false;
    B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_14"); //Jeszcze nie. Nie mam przy sobie kamienia, kt�ry znajduje si� gdzie� w kopalni.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_15"); //Jakiego kamienia?
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_16"); //Podobno jaki� tajemniczy artefakt jest przyczyn� pojawiania si� o�ywie�c�w.
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_17"); //Musz� si� go jako� pozby�.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_18"); //No to id� po niego. Poczekamy tu i postaramy si� odeprze� fale o�ywnie�c�w.
		HeroMaArtefakt = true;
    };

    AI_StopProcessInfos	(self);
};*/
/*
//========================================
//-----------------> SYTUACJA
//========================================

INSTANCE DIA_Rocky_SYTUACJA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_SYTUACJA_Condition;
   information  = DIA_Rocky_SYTUACJA_Info;
   permanent	= true;
   description	= "Jak leci?";
};

FUNC INT DIA_Rocky_SYTUACJA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rocky_SYTUACJA_Info()
{
        AI_Output (other, self ,"DIA_Rocky_SYTUACJA_15_01"); //Jak leci?
    if (hero.guild == GIL_BAU)
    {
        if (!Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
        {
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_02"); //Nawet mnie nie znasz. Co ci� to obchodzi?
            AI_Output (other, self ,"DIA_Rocky_SYTUACJA_15_03"); //Chcia�em by� mi�y.
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_04"); //To id� to robi� gdzie� indziej.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
        {
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_05"); //Na razie jest stabilnie. Zajmij si� robot�.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_WIN_O)) 
        {
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_06"); //Ha ha! Nie�le ostatnio rozpieprzyli�my tych gnojk�w ze Starego Obozu. 
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_07"); //Zaczynasz mi si� podoba�, ch�opcze! B�d� z ciebie ludzie.
        }
		  else if (Npc_KnowsInfo (hero,DIA_Quentin_HELLO35)) 
        {   
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_13"); //Podobno ostatnio �le si� dzieje w Kolonii. To morderstwo na Magach Ognia przela�o szal� goryczy.
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_14"); //Postawa Gomeza wcale a� tak bardzo mnie nie zaskoczy�a. Po tym cz�owieku mo�na si� by�o tego spodziewa�.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_EqDoWalki)) 
        {           
			AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_08"); //Cholera! Daj mi spok�j! Mam teraz mas� roboty z tym ekwipunkiem.
            AI_Output (other, self ,"DIA_Rocky_SYTUACJA_15_09"); //Dobrze, dobrze.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_WtfRozwalaWobozie)) 
        {   
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_10"); //Chwil� wstecz i przypominam sobie, jak drwili�my ze Stra�nik�w Gomeza, atakuj�c konw�j. 
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_11"); //Teraz to my stali�my si� ofiar�. Takie �ycie w Kolonii... raz na wozie, raz pod wozem.
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_12"); //Powiem ci jedno: uwa�aj, co m�wisz. Wszystko mo�e si� kiedy� odwr�ci� przeciwko tobie.
        };
      } 
	  else 
	  {
	  AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_13"); //Nie gadam z obcymi. Zje�d�aj!
	  };
    };

*/

//========================================
//-----------------> THX_ZA_ROBOTE
//========================================

INSTANCE DIA_Rocky_THX_ZA_ROBOTE (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_THX_ZA_ROBOTE_Condition;
   information  = DIA_Rocky_THX_ZA_ROBOTE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_THX_ZA_ROBOTE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_IHaveStone))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_THX_ZA_ROBOTE_Info()
{
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_01"); //Stary, kolejny raz ratujesz nam ty�ek. Odda�e� niecenion� pomoc Bandytom.
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_02"); //Wielkie dzi�ki. Kopalnia jest nasza: Bandyt�w i Najemnik�w, nie Gomeza. Dobra robota. 
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_03"); //Masz tu troch� rudy.
    CreateInvItems (self, ItMiNugget, 350);
    B_GiveInvItems (self, other, ItMiNugget, 350);
    AI_StopProcessInfos	(self);
};
