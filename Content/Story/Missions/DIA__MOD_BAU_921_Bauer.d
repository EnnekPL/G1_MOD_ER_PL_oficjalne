///////////////////////////////////////////
//		Traitor
///////////////////////////////////////////

INSTANCE DIA_BauerTraitor_Kill (C_INFO)
{
	npc			= BAU_921_Bauer;
	nr			= 1;
	condition	= DIA_BauerTraitor_Kill_Condition;
	information	= DIA_BauerTraitor_Kill_Info;
	permanent	= 0;
	description	= "To tw�j koniec.";
};                       

FUNC INT DIA_BauerTraitor_Kill_Condition()
{
	if (Quest_ChceckLoyality == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BauerTraitor_Kill_Info()
{	
	self.guild = GIL_NONE;
	
	AI_Output (other, self,"DIA_BauerTraitor_Kill_15_00"); //To tw�j koniec. Przy�apa�em ci�.
	AI_Output (self, other,"DIA_BauerTraitor_Kill_02_01"); //Co? Ja tylko chcia�em, �eby kole� mnie pocz�stowa� skr�tem!
	AI_Output (other, self,"DIA_BauerTraitor_Kill_15_02"); //Jasne...
	AI_Output (other, self,"DIA_BauerTraitor_Kill_15_03"); //ODDAWAJ MOJ� RUD�. JESTE� MI WINNY 200 BRY�EK RUDY.
	AI_Output (self, other,"DIA_BauerTraitor_Kill_02_04"); //O czym ty m�wisz?! Nie mam tyle!
	AI_Output (other, self,"DIA_BauerTraitor_Kill_15_05"); //A WI�C JU� PO TOBIE!
	
	AI_StopProcessInfos	(self); 
	
	B_ChangeGuild    (self,GIL_NONE);  
	self.guild = GIL_NONE;
	Npc_SetPermAttitude (self, ATT_HOSTILE);
	Npc_SetTarget (self,hero);
    AI_StartState (self,ZS_ATTACK,1,"");
	
	Npc_ExchangeRoutine (Org_834_Organisator, "start");
	Npc_ExchangeRoutine (Bau_917_Bauer, "watch");
};