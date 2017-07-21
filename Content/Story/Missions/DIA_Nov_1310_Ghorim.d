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
	description	= "Cze��, jak leci?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Cze��, jak leci?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Ledwie si� trzymam na nogach. Pracuj� od dw�ch dni, bez chwili przerwy.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok powinien mnie zmieni� ju� dawno temu. Ten cz�owiek nigdy si� nie zmieni.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Pewnie �pi teraz jak zabity w swojej chacie!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Dlaczego nie p�jdziesz do niego i nie dasz mu porz�dnego kopa w ty�ek?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nie mog� st�d odej��, p�ki Baal Orun wszystkiego pilnuje. Tak, czy inaczej - robota musi zosta� wykonana!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty m�g�by� tam p�j�� zamiast mnie. Jego chata jest zaraz pod laboratorium Cor Kaloma, ko�o Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Powiedz mu, �eby ruszy� tu sw�j leniwy ty�ek.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,	"Nowicjusz Ghorim poprosi� mnie o zmuszenie leniwego Harloka, by zaj�� jego miejsce. Harlok kr�ci si� zwykle w pobli�u Fortuno.");

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
	description	= "No i? Wreszcie kto� ci� zluzowa�?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //No i? Wreszcie kto� ci� zluzowa�?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Tak, nareszcie mog� si� porz�dnie wyspa�. Dzi�ki, stary!
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
	description	= "Poszukuj� kogo� do pracy w kopalni z�ota.";
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
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_00"); //Poszukuj� kogo� do pracy w kopalni z�ota.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_01"); //Widz�, �e co poniekt�rym odbija ju� od palenia ziela.	
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_02"); //Id� do ��ka i troch� odpocznij. I nie pal wi�cej ziela!
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_03"); //Ale ja m�wi� powa�nie. Pewien Najemnik z Nowego Obozu pono� odnalaz� z�o�e z�ota w Kolonii. Nie wiem ile w tym prawdy, ale zaufa�em mu.
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_04"); //Mam odnale�� zaufanych ludzi do pracy.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_05"); //Wi�c dlaczego przyszed�e� z tym do mnie? Nie jestem nawet g�rnikiem. Czy�bym zatem by� zaufanym cz�owiekiem?
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_06"); //Nie m�w, �e chcesz wr�ci� do pracy przy zielu. Harlok d�ugo tam nie zostanie. Gdy tylko kto� go zwolni, nie�le ci� poobija.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_07"); //Cholera, nie pomy�la�em o tym. Pora si� st�d zmywa�. Gdzie ta kopalnia?
	AI_Output (other, self,"DIA_Shrat_GoldMine_15_08"); //Jeszcze nie wiem, gdzie to jest. Wszyscy moi kandydaci musz� spotka� si� z Willem w Nowym Obozie, w karczmie na jeziorze.
	AI_Output (self, other,"DIA_Shrat_GoldMine_02_09"); //Nowy Ob�z, karczma na jeziorze... Zapami�tam. Wkr�tce si� tam zjawi�.
	B_LogEntry (CH2_GoldMine,"Nowicjusz Ghorim, kt�remu kiedy� pomog�em, zgodzi� si� pracowa� w kopalni z�ota Willa. To by�a naprawd� dobra my�l, �eby go w to wci�gn��.");
	Npc_ExchangeRoutine (self,"wait");
    B_GiveXP (150);
	//ShratHaveWork = TRUE;
};
