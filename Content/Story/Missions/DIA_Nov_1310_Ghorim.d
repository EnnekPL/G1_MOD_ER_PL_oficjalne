//poprawione i sprawdzone - Nocturn

// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Ghorim_Exit (C_INFO)
{
	npc			=  Nov_1310_Ghorim;
	nr			=  999;
	condition	=  DIA_Ghorim_Exit_Condition;
	information	=  DIA_Ghorim_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Ghorim_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

instance  DIA_Ghorim_MissingHarlok (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_MissingHarlok_Condition;
	information	= DIA_Ghorim_MissingHarlok_Info;
	permanent	= 0;
	description	= "Czeœæ, jak leci?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Czeœæ, jak leci?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Ledwie siê trzymam na nogach. Pracujê od dwóch dni, bez chwili przerwy.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok powinien mnie zmieniæ ju¿ dawno temu. Ten cz³owiek nigdy siê nie zmieni.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Pewnie œpi teraz jak zabity w swojej chacie!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Dlaczego nie pójdziesz do niego i nie dasz mu porz¹dnego kopa w ty³ek?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nie mogê st¹d odejœæ, póki Baal Orun wszystkiego pilnuje. Tak, czy inaczej - robota musi zostaæ wykonana!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty móg³byœ tam pójœæ zamiast mnie. Jego chata jest zaraz pod laboratorium Cor Kaloma, ko³o Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Powiedz mu, ¿eby ruszy³ tu swój leniwy ty³ek.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,	"Nowicjusz Ghorim poprosi³ mnie o zmuszenie leniwego Harloka, by zaj¹³ jego miejsce. Harlok krêci siê zwykle w pobli¿u Fortuno.");

	Ghorim_KickHarlok = LOG_RUNNING;
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Ghorim_SUCCESS (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_SUCCESS_Condition;
	information	= DIA_Ghorim_SUCCESS_Info;
	permanent	= 1;
	description	= "No i? Wreszcie ktoœ ciê zluzowa³?";
};                       

FUNC int  DIA_Ghorim_SUCCESS_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS) && (!Npc_KnowsInfo (hero,DIA_Shrat_GoldMine)) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Ghorim_SUCCESS_Info()
{
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //No i? Wreszcie ktoœ ciê zluzowa³?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Tak, nareszcie mogê siê porz¹dnie wyspaæ. Dziêki, stary!
};

// **************************************************
//				Goldmine
// **************************************************

instance  DIA_Shrat_GoldMine (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Shrat_GoldMine_Condition;
	information	= DIA_Shrat_GoldMine_Info;
	permanent	= 0;
	description	= "Poszukujê kogoœ do pracy w kopalni z³ota.";
};                       

FUNC int  DIA_Shrat_GoldMine_Condition()
{
	if (MIS_GoldMine == LOG_RUNNING) && (Ghorim_KickHarlok == LOG_SUCCESS)
	{
	return 1;
	};
};

FUNC VOID  DIA_Shrat_GoldMine_Info()
{
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_00"); //Poszukujê kogoœ do pracy w kopalni z³ota.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_01"); //Widzê, ¿e co poniektórym odbija ju¿ od palenia ziela.	
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_02"); //IdŸ do ³ó¿ka i trochê odpocznij. I nie pal wiêcej ziela!
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_03"); //Ale ja mówiê powa¿nie. Pewien Najemnik z Nowego Obozu ponoæ odnalaz³ z³o¿e z³ota w Kolonii. Nie wiem ile w tym prawdy, ale zaufa³em mu.
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_04"); //Mam odnaleŸæ zaufanych ludzi do pracy.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_05"); //Wiêc dlaczego przyszed³eœ z tym do mnie? Nie jestem nawet górnikiem. Czy¿bym zatem by³ zaufanym cz³owiekiem?
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_06"); //Nie mów, ¿e chcesz wróciæ do pracy przy zielu. Harlok d³ugo tam nie zostanie. Gdy tylko ktoœ go zwolni, nieŸle ciê poobija.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_07"); //Cholera, nie pomyœla³em o tym. Pora siê st¹d zmywaæ. Gdzie ta kopalnia?
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_08"); //Jeszcze nie wiem, gdzie to jest. Wszyscy moi kandydaci musz¹ spotkaæ siê z Willem w Nowym Obozie, w karczmie na jeziorze.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_09"); //Nowy Obóz, karczma na jeziorze... Zapamiêtam. Wkrótce siê tam zjawiê.
	B_LogEntry (CH2_GoldMine,"Nowicjusz Ghorim, któremu kiedyœ pomog³em, zgodzi³ siê pracowaæ w kopalni z³ota Willa. To by³a naprawdê dobra myœl, ¿eby go w to wci¹gn¹æ.");
	Npc_ExchangeRoutine (self,"wait");
    B_GiveXP (150);
	//ShratHaveWork = TRUE;
};
