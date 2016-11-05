// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_BauerWatcher_EXIT(C_INFO)
{
	npc			= BAU_921_Bauer ;
	nr			= 999;
	condition	= Info_BauerWatcher_EXIT_Condition;
	information	= Info_BauerWatcher_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_BauerWatcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BauerWatcher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////
//		Unnecessary Death
///////////////////////////////////////////

INSTANCE DIA_BauerWatcher_UnnecessaryDeath (C_INFO)
{
	npc			= BAU_921_Bauer;
	nr			= 1;
	condition	= DIA_BauerWatcher_UnnecessaryDeath_Condition;
	information	= DIA_BauerWatcher_UnnecessaryDeath_Info;
	permanent	= 0;
	important	= TRUE;
};                       

FUNC INT DIA_BauerWatcher_UnnecessaryDeath_Condition()
{
	if (Quest_ChceckLoyality == LOG_RUNNING) && (FoggyKilled)
	{
		return 1;
	};
};

FUNC VOID DIA_BauerWatcher_UnnecessaryDeath_Info()
{	
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_01"); //Co ty najlepszego zrobi�e�? Zabi�e� Mglistego!
	AI_Output (other, self,"DIA_BauerWatcher_UnnecessaryDeath_15_02"); //Rufus podejrzewa� go o zdrad�.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_03"); //Mglisty zawsze trzyma� nasz� stron�. To by�a jaka� pomy�ka.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_04"); //Wys�a�em go, �eby spr�bowa� za�atwi� nam kilka skr�t�w od ch�opak�w spod bramy. 
	AI_Output (other, self,"DIA_BauerWatcher_UnnecessaryDeath_15_05"); //A wi�c z nikim nic nie ustala�?
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_06"); //Nie... Prawdziwy zdrajca ju� nie �yje.
	AI_Output (other, self,"DIA_BauerWatcher_UnnecessaryDeath_15_07"); //Jak to?
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_08"); //A tak to, jeden z naszych chcia� sprzeda� Lewusowi informacj� o naszym dostawcy broni. By� na tyle g�upi, �eby mi si� pochwali�.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_09"); //Zabi�em go i Rufus ju� o tym wie. Wracaj do niego.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_10"); //Ech... Szkoda Mglistego. By� w porz�dku...
	AI_StopProcessInfos	(self); 
	
	Npc_ExchangeRoutine (self, "rebel");
	
	Quest_ChceckLoyality = LOG_SUCCESS;
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Okaza�o si�, �e przypuszczenia Rufusa by�y b��dne i zabi�em niewinn� osob�. Musz� pogada� o tym z Rufusem.");
};