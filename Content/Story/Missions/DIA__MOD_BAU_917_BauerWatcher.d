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
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_01"); //Co ty najlepszego zrobi³eœ? Zabi³eœ Mglistego!
	AI_Output (other, self,"DIA_BauerWatcher_UnnecessaryDeath_15_02"); //Rufus podejrzewa³ go o zdradê.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_03"); //Mglisty zawsze trzyma³ nasz¹ stronê. To by³a jakaœ pomy³ka.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_04"); //Wys³a³em go, ¿eby spróbowa³ za³atwiæ nam kilka skrêtów od ch³opaków spod bramy. 
	AI_Output (other, self,"DIA_BauerWatcher_UnnecessaryDeath_15_05"); //A wiêc z nikim nic nie ustala³?
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_06"); //Nie... Prawdziwy zdrajca ju¿ nie ¿yje.
	AI_Output (other, self,"DIA_BauerWatcher_UnnecessaryDeath_15_07"); //Jak to?
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_08"); //A tak to, jeden z naszych chcia³ sprzedaæ Lewusowi informacjê o naszym dostawcy broni. By³ na tyle g³upi, ¿eby mi siê pochwaliæ.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_09"); //Zabi³em go i Rufus ju¿ o tym wie. Wracaj do niego.
	AI_Output (self, other,"DIA_BauerWatcher_UnnecessaryDeath_02_10"); //Ech... Szkoda Mglistego. By³ w porz¹dku...
	AI_StopProcessInfos	(self); 
	
	Npc_ExchangeRoutine (self, "rebel");
	
	Quest_ChceckLoyality = LOG_SUCCESS;
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Okaza³o siê, ¿e przypuszczenia Rufusa by³y b³êdne i zabi³em niewinn¹ osobê. Muszê pogadaæ o tym z Rufusem.");
};