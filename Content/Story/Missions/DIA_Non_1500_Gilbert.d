//poprawione i sprawdzone - Nocturn

// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam tu zbyt cz�sto go�ci, he he!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widz�, �e niez�y cwaniak z ciebie. Tak znale�� moj� kryj�wk�, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia�em ju� do�� Starego Obozu. Podpad�em paru ludziom Gomeza. To by�o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju� o mnie nie pami�ta, ale ja si� st�d nie ruszam. Jak na m�j gust - w Starym Obozie wci�� jest za du�o t�pych osi�k�w.
};


//========================================
//-----------------> GoToTondral
//========================================

INSTANCE DIA_Gilbert_GoToTondral (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_GoToTondral_Condition;
   information  = DIA_Gilbert_GoToTondral_Info;
   permanent	= FALSE;
   description	= "Mo�e chcesz p�j�� ze mn� do Bractwa?";
};

FUNC INT DIA_Gilbert_GoToTondral_Condition()
{
    if (BaalTondral_GetNewGuy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Gilbert_Hallo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_GoToTondral_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_01"); //Mo�e chcesz p�j�� ze mn� do Bractwa?
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_02"); //Czemu nie? Chyba czas ju� co� zmieni� w swoim �yciu.
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_03"); //Rozumiem, �e mnie tam zaprowadzisz.
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_04"); //Jasne. Dam ci znak, gdy b�d� gotowy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gilbert_HELLO2 (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_HELLO2_Condition;
   information  = DIA_Gilbert_HELLO2_Info;
   permanent	= FALSE;
   description	= "Ruszajmy.";
};

FUNC INT DIA_Gilbert_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_GoToTondral))
    && (BaalTondral_GetNewGuy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_HELLO2_15_01"); //Ruszajmy.
    AI_Output (self, other ,"DIA_Gilbert_HELLO2_03_02"); //Dobrze. Tylko uwa�aj na ska�y.
    	self.flags = NPC_FLAG_IMMORTAL;
self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "FOLLOW");
    B_LogEntry                     (CH1_RecruitDusty,"Postanowi�em, �e zaprowadz� Gilberta do Bractwa.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Kobieta
//========================================

INSTANCE DIA_Gilbert_Kobieta (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Kobieta_Condition;
   information  = DIA_Gilbert_Kobieta_Info;
   permanent	= FALSE;
   description	= "Co robi kobieta w twojej jaskini?";
};

FUNC INT DIA_Gilbert_Kobieta_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gilbert_Kobieta_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_01"); //Co robi kobieta w twojej jaskini?
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_02"); //Uciek�a ze Starego Obozu. Spotka�em j� w okolicy. B��ka�a si�, szukaj�c schronienia.
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_03"); //Chyba nie jest zbyt rozmowna. 
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_04"); //To tylko pozory. Jest dosy� pyskata, jak si� oswoi. 
};

//========================================
//-----------------> Halasy
//========================================

INSTANCE DIA_Gilbert_Halasy (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_Halasy_Condition;
   information  = DIA_Gilbert_Halasy_Info;
   permanent	= FALSE;
   description	= "Byli�cie ostatnio strasznie g�o�no.";
};

FUNC INT DIA_Gilbert_Halasy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_ThiefInCamp))
    && (!Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Halasy_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_01"); //Byli�cie ostatnio strasznie g�o�no.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_02"); //Co? O co ci chodzi? 
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_03"); //O nic. Po prostu widz�, �e dobrze si� trzymasz, staruszku.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_04"); //Nie rozumiem.
	B_giveXP (100);
};

//========================================
//-----------------> BANG
//========================================

INSTANCE DIA_Gilbert_BANG (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_BANG_Condition;
   information  = DIA_Gilbert_BANG_Info;
   permanent	= FALSE;
   description	= "Podobno zr�czny z ciebie go��.";
};

FUNC INT DIA_Gilbert_BANG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_BANG_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_01"); //Podobno zr�czny z ciebie go��.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_02"); //Hmm? Szukasz nauczyciela z�odziejskich sztuczek? Nie pomog� ci. Nie znam si� na tym.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_03"); //Nie o to mi chodzi. Jeden z �owc�w ork�w stwierdzi�, �e potrafisz sprawnie porusza� si� po ska�ach.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_04"); //Nie ukrywam, �e to ciekawa umeij�tno��.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_05"); //O to chodzi. Tak, znam si� troch� na tych sprawach. Potrafi� sprawnie balansowa� cia�em.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_06"); //Mog� ci� tego nauczy�, jednak b�dziesz musia� mi co� przynie��.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_07"); //Czego potrzebujesz? 
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_08"); //Marz� o zjedzeniu solidnego kawa�ka szynki. M�g�by� podw�dzi� dla mnie co nieco ze Starego Obozu?
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_09"); //Mog� spr�bowa�. 
};

//========================================
//-----------------> MEAT
//========================================

INSTANCE DIA_Gilbert_MEAT (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_MEAT_Condition;
   information  = DIA_Gilbert_MEAT_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie kawa�ek szynki.";
};

FUNC INT DIA_Gilbert_MEAT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_BANG))
    && (Npc_HasItems (other, ItFo_mutton_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_MEAT_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_MEAT_15_01"); //Mam dla ciebie kawa�ek szynki.
    B_GiveInvItems (other, self, ItFo_mutton_01, 1);
    AI_Output (self, other ,"DIA_Gilbert_MEAT_03_02"); //Dzi�kuj�. Ach... cudowny zapach. Teraz mog� ci� uczy�.
    B_LogEntry		(GE_TeacherOW,"Gilbert mo�e mnie uczy� akrobatyki, poniewa� przynios�em mu kawa�ek szynki, o kt�ry mnie prosi�.");
	B_GiveXP (50);
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Gilbert_TEACH (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 3;
   condition    = DIA_Gilbert_TEACH_Condition;
   information  = DIA_Gilbert_TEACH_Info;
   permanent	= 1;
   description	= B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0);
};

FUNC INT DIA_Gilbert_TEACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_MEAT))
    && (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_TEACH_Info()
{
	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
    AI_Output (other, self ,"DIA_Gilbert_TEACH_15_01"); //Naucz mnie akrobatyki. 
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_02"); //Je�li b�dziesz odpowiednio balansowa� cia�em, unikniesz upadku podczas wspinaczki.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_03"); //Pami�taj, �eby dok�adnie obserwowa� drog� po kt�rej chcesz si� wspina�. Zwracaj uwag� na s�absze fragmenty ska�, kt�re mog� odpa��.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_04"); //Nie ka�dy fragment skalny jest w stanie wytrzyma� tw�j ci�ar. 
	};		
};
