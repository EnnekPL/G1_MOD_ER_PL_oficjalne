// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_5070_Exit (C_INFO)
{
	npc			= Vlk_5070_Danny;
	nr			= 999;
	condition	= DIA_Vlk_5070_Exit_Condition;
	information	= DIA_Vlk_5070_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_5070_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_5070_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				THANKS
// **************************************************

INSTANCE DIA_Vlk_5070_THANKS (C_INFO)
{
	npc				= Vlk_5070_Danny;
	nr				= 1;
	condition		= DIA_Vlk_5070_THANKS_Condition;
	information		= DIA_Vlk_5070_THANKS_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Vlk_5070_THANKS_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_5070_THANKS_Info()
{
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_01"); //Dzi�ki za pomoc. Jeszcze troch� i by�oby po mnie. Siedz� tu ju� od kilku dni bez wody i jedzenia. 
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_02"); //Dlaczego po prostu nie zejdziesz na d�?
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_03"); //Nie widzia�e� tych pe�zaczy?! Prze�y�em tylko dlatego, �e wszed�em na ten stary podest. Na szcz�cie teraz ju� jestem bezpieczny. 
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_04"); //Uratowa�e� mi �ycie.
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_05"); //(z lekk� drwin�, pewno�ci� siebie) Nie ma za co.
	Npc_ExchangeRoutine (self,"find");
	//AI_StopProcessInfos	(self);
};

// **************************************************
// 				I met your friend
// **************************************************

INSTANCE DIA_Vlk_5070_Quest (C_INFO)
{
	npc				= Vlk_5070_Danny;
	nr				= 1;
	condition		= DIA_Vlk_5070_Quest_Condition;
	information		= DIA_Vlk_5070_Quest_Info;
	permanent		= 0;
	description		= "Tw�j przyjaciel pyta� o ciebie.";
};

FUNC INT DIA_Vlk_5070_Quest_Condition()
{	
	if MIS_BuddlerDanny == LOG_RUNNING
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_5070_Quest_Info()
{
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_00"); //Tw�j przyjaciel pyta� o ciebie.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_01"); //Jaki przyjaciel?
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_02"); //Ten, kt�ry siedzi przed Starym Obozem i czeka na rud�...
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_03"); //No tak, obieca�em mu rud�, ale teraz wszystko straci�em. Jaki� Stra�nik t�dy przechodzi� i zabra� moj� sakiewk�. Nawet nie pom�g� mi si� st�d wydosta�.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_04"); //Wy�mia� mnie tylko i odszed�. Powiedz mojemu kumplowi, �e niepr�dko wr�c�. Musz� kopa� od nowa.

    B_LogEntry               (CH1_BuddlerDanny,"W Kopalni spotka�em Danny'ego. Niestety niepr�dko wr�ci, poniewa� straci� ca�� rud� jak� wydoby�.");
};