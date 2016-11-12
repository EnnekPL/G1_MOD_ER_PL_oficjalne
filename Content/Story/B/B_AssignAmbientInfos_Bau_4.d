// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_4_EXIT_Condition;
	information	= Info_Bau_4_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bau_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_4_WichtigePersonen_Condition;
	information	= Info_Bau_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Macie jakiego� przyw�dc�?";
};                       

FUNC INT Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Macie jakiego� przyw�dc�?
	if (MIS_BuntZbieraczy == LOG_SUCCESS)
	{
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_03"); //Od czasu buntu to Jarvis wykonuje dawniejsze obowi�zki Ry�owego Ksi�cia.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_04"); //Go�� jest naprawd� w porz�dku. Mo�na mu ufa�. Przypuszczam jednak, �e to nie potrwa d�ugo.
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_05"); //Dlaczego?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_06"); //To Najemnik. Lee w ko�cu wezwie go na s�u�b�. My�l�, �e magazynem b�dzie si� zajmowa� Homer.
	}
	else
	{
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //C�, teoretycznie naszym szefem jest Ry�owy Ksi���, ale wi�kszo�� z nas pracuje dla niego tylko ze strachu przed jego siepaczami.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Ja jestem wyj�tkiem. Jestem tu od kilku lat i zd��y�em ju� par� razy oberwa� od Szkodnik�w. Na polach ry�owych jest przynajmniej spokojnie.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
	};
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_4_DasLager_Condition;
	information	= Info_Bau_4_DasLager_Info;
	permanent	= 1;
	description = "Co powinienem wiedzie� o tym miejscu?";
};                       

FUNC INT Info_Bau_4_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //Co powinienem wiedzie� o tym miejscu?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Uwa�aj na siebie, ch�opcze! W Obozie roi si� od morderc�w i rabusi�w. Oni tylko czekaj� na przybycie kogo� takiego jak ty.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_4_DieLage_Condition;
	information	= Info_Bau_4_DieLage_Info;
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT Info_Bau_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //Co s�ycha�?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //Mamy mn�stwo pracy. Do wykarmienia tylu ludzi potrzeba mn�stwa ry�u.
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_4_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_4_Wasser_Condition;
	information	= Info_Bau_4_Wasser_Info;
	permanent	= 1;
	description = "Przysy�a mnie Lewus. Przynios�em ci wod�.";
};                       

FUNC INT Info_Bau_4_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Przysy�a mnie Lewus. Przynios�em ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Dzi�ki, ch�opcze. Pi�kne dzi�ki.
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //Ale nic ci nie zosta�o! No trudno, poszukam u innych.
	};
};

// *************************************************************************
// 									CORRUPTION
// *************************************************************************

INSTANCE Info_Bau_4_Corruption(C_INFO)
{
	nr			= 800;
	condition	= Info_Bau_4_Corruption_Condition;
	information	= Info_Bau_4_Corruption_Info;
	permanent	= 1;
	description = "(przekup)";
};                       

FUNC INT Info_Bau_4_Corruption_Condition()
{
	if	(self.aivar[AIV_MISSION2] == FALSE)
	&& 	(Npc_HasItems(hero, itminugget)>=50)
	&&  (Quest_CorruptRebels == LOG_RUNNING)
	&&  (self.aivar[AIV_MISSION3] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Bau_4_Corruption_Info()
{
	AI_Output(other,self,"Info_Bau_4_Corruption_15_00"); //Mam dla ciebie rud� od Lewusa. Dostaniesz j�, je�li wr�cisz do pracy.
	AI_Output(self,other,"Info_Bau_4_Corruption_12_02"); //Cholera, za tyle rudy b�d� pi� z tydzie�. Dzi�ki.
	
	B_GiveInvItems (hero,self, itminugget, 50);
	Npc_RemoveInvItems (self, itminugget,50);
	
	self.aivar[AIV_MISSION2] = TRUE;
	CorruptedBauers = CorruptedBauers + 1;
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_4(var c_NPC slf)
{
	Info_Bau_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_4_Wasser.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_4_Corruption.npc			= Hlp_GetInstanceID(slf);
};
