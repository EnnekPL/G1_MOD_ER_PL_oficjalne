//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_534_Exit (C_INFO)
{
	npc			= Vlk_534_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_534_Exit_Condition;
	information	= DIA_Vlk_534_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_534_LeaveMe (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_LeaveMe_Condition;
	information		= DIA_Vlk_534_LeaveMe_Info;
	permanent		= 0;
	description		= "Dlaczego siedzisz tutaj, a nie w Obozie?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Dlaczego siedzisz tutaj, a nie w Obozie?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Czekam, a� m�j przyjaciel wr�ci z kopalni. Jest mi winien par� bry�ek rudy.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Nie mog� si� pokaza� w Obozie bez rudy - nie sta� mnie na zap�acenie za ochron�, a wol� nie ryzykowa� �yciem.

	//AI_StopProcessInfos	(self);
};

// **************************************************
// 				Your Friend Name
// **************************************************

INSTANCE DIA_Vlk_534_Quest (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_Quest_Condition;
	information		= DIA_Vlk_534_Quest_Info;
	permanent		= 0;
	description		= "Jak si� nazywa� tw�j przyjaciel?";
};

FUNC INT DIA_Vlk_534_Quest_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Vlk_534_LeaveMe)
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_534_Quest_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_Quest_15_00"); //Jak si� nazywa� tw�j przyjaciel?
	AI_Output (self, other,"DIA_Vlk_534_Quest_02_01"); //Danny, spokojny go��. Powiedzia�, �e wkr�tce wykopie swoj� norm� i pojawi si� w Obozie. Czekam i czekam, a jego nie wida�.
	AI_Output (self, other,"DIA_Vlk_534_Quest_02_02"); //Mam nadziej�, �e nie wpad� w �adne k�opoty. 

	MIS_BuddlerDanny = LOG_RUNNING;
	Log_CreateTopic          (CH1_BuddlerDanny, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BuddlerDanny, LOG_RUNNING);
    B_LogEntry               (CH1_BuddlerDanny,"Jeden z Kopaczy siedz�cych przed Starym Obozem zdradzi� mi, �e czeka na kumpla, kt�ry wkr�tce mia� wr�ci� z Kopalni. Co� go jednak powstrzymuje. W sumie to m�g�bym go poszuka�, gdy b�d� w Starej Kopalni.");
};

// **************************************************
// 				Finish Ths Quest
// **************************************************

INSTANCE DIA_Vlk_534_Success (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_Success_Condition;
	information		= DIA_Vlk_534_Success_Info;
	permanent		= 0;
	description		= "Rozmawia�em z twoim kumplem.";
};

FUNC INT DIA_Vlk_534_Success_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Vlk_5070_Quest) && MIS_BuddlerDanny == LOG_RUNNING
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_534_Success_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_Success_15_00"); //Rozmawia�em z twoim kumplem.
	AI_Output (self, other,"DIA_Vlk_534_Success_02_01"); //I co u niego s�ycha�? Kiedy wreszcie ruszy tu swoje dupsko?
	AI_Output (other, self,"DIA_Vlk_534_Success_15_02"); //Niepr�dko. Wpad� w ma�e tarapaty i wybrn�� z nich, ale straci� rud�. B�dziesz musia� poczeka� zanim wykopie wszystko od nowa.
	AI_Output (self, other,"DIA_Vlk_534_Success_02_03"); //O cholera! 

	MIS_BuddlerDanny = LOG_Success;
    Log_SetTopicStatus       (CH1_BuddlerDanny, LOG_Success);
    B_LogEntry               (CH1_BuddlerDanny,"Powiedzia�em Kopaczowi sprzed Obozu, �e jego kumpel straci� ca�� rud�.");
	B_GiveXP (150);
};