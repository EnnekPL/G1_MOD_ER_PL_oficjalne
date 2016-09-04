//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_KwatermistrzPlac_EXIT(C_INFO)
{
	npc             = GRD_5099_Kwatermistrz;
	nr              = 999;
	condition		= DIA_KwatermistrzPlac_EXIT_Condition;
	information		= DIA_KwatermistrzPlac_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_KwatermistrzPlac_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_KwatermistrzPlac_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_KwatermistrzPlac_HELLO1 (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_HELLO1_Condition;
   information  = DIA_KwatermistrzPlac_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jeste�?";
};

FUNC INT DIA_KwatermistrzPlac_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_KwatermistrzPlac_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_KwatermistrzPlac_HELLO1_03_02"); //Nazywam si� Spark, zajmuj� si� rozporz�dzaniem dostawami, organizowaniem konwoj�w, takie tam.
	AI_Output (other, self ,"DIA_KwatermistrzPlac_HELLO1_15_03"); //Wydajesz si� by� milszy ni� pozosta�a cz�� Stra�nik�w. 
	AI_Output (self, other ,"DIA_KwatermistrzPlac_HELLO1_03_04"); //Tak, ch�opcy zgrywaj� twardzieli przed nowymi. W�a�nie dlatego maj� szacunek, poprzez zastraszanie...
	AI_Output (other, self ,"DIA_KwatermistrzPlac_HELLO1_15_05"); //A ciebie szacunek nie obchodzi?
	AI_Output (self, other ,"DIA_KwatermistrzPlac_HELLO1_03_06"); //Obchodzi, ale przyda�aby si� mi twoja pomoc...
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_KwatermistrzPlac_PERM (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_PERM_Condition;
   information  = DIA_KwatermistrzPlac_PERM_Info;
   permanent	= 1;
   description	= "Jak leci?";
};

FUNC INT DIA_KwatermistrzPlac_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_KwatermistrzPlac_PERM_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_PERM_15_01"); //Jak leci?
	if (MIS_FirstQuest == LOG_SUCCESS) 
	{
    AI_Output (self, other ,"DIA_KwatermistrzPlac_PERM_03_02"); //Dobrze! W dalszym ci�gu mam z nich ubaw! Ha ha...
	}
	else
	{
	AI_Output (self, other ,"DIA_KwatermistrzPlac_PERM_03_03"); //Gdyby Stra�nicy mnie nie wkurzali, by�oby lepiej.
	};
};

//========================================
//-----------------> QUEST
//========================================

INSTANCE DIA_KwatermistrzPlac_QUEST (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_QUEST_Condition;
   information  = DIA_KwatermistrzPlac_QUEST_Info;
   permanent	= 0;
   description	= "A wi�c w czym mog� ci pom�c?";
};

FUNC INT DIA_KwatermistrzPlac_QUEST_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_NONE) && (Npc_KnowsInfo (hero, DIA_KwatermistrzPlac_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_KwatermistrzPlac_QUEST_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_QUEST_15_01"); //A wi�c w czym mog� ci pom�c?
    AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_02"); //Jak widzisz mam tu troch� zapas�w. Wszystko, co si� znajduje w skrzyniach i beczkach jest spisane w ksi��kach, kt�re le�� na stole. 
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_03"); //Co jaki� czas musz� to wszystko podlicza�. Praktycznie zawsze wyniki si� nie zgadzaj�, a to dlatego, �e co chwila przy�azi tu jaki� Stra�nik i bierze co� do �arcia.
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_04"); //Podbieraj� nie tylko jab�ka, ale tak�e szynk� dostarczan� prosto od rze�nika z Khorinis. My�l�, �e nie daliby rady zje�� na raz tyle mi�sa.
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_05"); //Na pewno maj� tu gdzie� kryj�wk�, w kt�rej ukrywaj� smako�yki. Poszukasz jej dla mnie? W spisie brakuje mi pi�� du�ych kawa�k�w szynki. 
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_06"); //Przy okazji pozbieraj te� jab�ka, kt�re porozrzucali po okolicy. Zgodnie ze spisem powinno by� ich dziesi�� sztuk. 
	
	//log
	MIS_FirstQuest = LOG_RUNNING;
	Log_CreateTopic          (Ch1_FirstQuest, LOG_MISSION);
    Log_SetTopicStatus       (Ch1_FirstQuest, LOG_RUNNING);
    B_LogEntry               (Ch1_FirstQuest,"Kwatermistrz z placu wymian poprosi� mnie o ma�� przys�ug�. Stra�nicy obs�uguj�cy plac wymian podkradaj� z jego zapas�w jedzenie. Spark twierdzi, �e maj� gdzie� w okolicy kryj�wk�, w kt�rej ukrywaj� smako�yki. Musz� j� odnale�� i przynie�� kilka kawa�k�w szynki, kt�re powinny w niej by�. Powinienem tak�e pozbiera� jab�ka le��ce w okolicy.");
};

//========================================
//-----------------> SUCCESS
//========================================

INSTANCE DIA_KwatermistrzPlac_SUCCESS (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_SUCCESS_Condition;
   information  = DIA_KwatermistrzPlac_SUCCESS_Info;
   permanent	= 0;
   description	= "Mam jab�ka i odnalaz�em kryj�wk�.";
};

FUNC INT DIA_KwatermistrzPlac_SUCCESS_Condition()
{
	if (Npc_GetTrueGuild    (hero) == GIL_NONE) && (MIS_FirstQuest == LOG_RUNNING) && Npc_HasItems (other,itfoapple) >=10 && Npc_HasItems (other,itfo_mutton_01) >= 5
	{
    return TRUE;
	};
};

FUNC VOID DIA_KwatermistrzPlac_SUCCESS_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_SUCCESS_15_01"); //Mam jab�ka i odnalaz�em kryj�wk�.
    AI_Output (self, other ,"DIA_KwatermistrzPlac_SUCCESS_03_02"); //�wietnie, gdzie by�a?
	AI_Output (other, self ,"DIA_KwatermistrzPlac_SUCCESS_15_03"); //W krzakach ko�o bramy.
	AI_Output (self, other ,"DIA_KwatermistrzPlac_SUCCESS_03_04"); //Ha ha, ch�opcy si� nie�le zdziwi�! Dzi�ki za pomoc. B�d� z ciebie ludzie. Masz tu 15 bry�ek rudy.
	
	//items
	B_GiveInvItems (other,self,itfoapple,10);
	B_GiveInvItems (other,self,itfo_mutton_01,5);
	//prize
	B_GiveInvItems (self,other,itminugget,15);
	B_GiveXP (75);
	//log
	MIS_FirstQuest = LOG_SUCCESS;
    Log_SetTopicStatus       (Ch1_FirstQuest, LOG_SUCCESS);
    B_LogEntry               (Ch1_FirstQuest,"Kwatermistrz Spark by� bardzo zadowolony z tego, �e przynios�em mu jab�ka i szynk�.");
};
