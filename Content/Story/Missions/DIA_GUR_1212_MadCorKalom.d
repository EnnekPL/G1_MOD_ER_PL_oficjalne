//poprawione i sprawdzone - Nocturn

instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Nareszcie, zn�w si� spotykamy!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //M�j pan uprzedzi� mnie o twoim przybyciu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //On potrafi wyczu�, �e jeste� w pobli�u!
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Wkr�tce znajd� si� bli�ej niego, ni� m�g�by sobie tego �yczy�!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nie pozwolimy, by� pokrzy�owa� nasze plany.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //�wiat do�wiadczy wkr�tce przebudzenia wielkiego Odkupiciela i nikt nie jest w stanie temu zapobiec.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Wszyscy niewierni zap�ac� s�on� cen�.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A ty b�dziesz mia� zaszczyt by� pierwszym z nich.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //�NI�CY, ZBUD� SI�!!!

	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "W �wi�tyni �ni�cego spotka�em oszala�ego Cor Kaloma. Ani troch� mnie to nie zdziwi�o. To chyba moja ostatnia walka z op�tanym s�ugami �ni�cego. Zauwa�y�em, �e dawny Guru dosta� od �ni�cego ma�y prezent, kt�ry skutecznie utrudni mi jego u�miercenie. ");
	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
	
	self.guild = GIL_GRD;
	B_ChangeGuild   		 (self,GIL_GRD);  
	
	NOV_1370_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1370_Novize,GIL_GRD); 
	
	NOV_1369_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1369_Novize,GIL_GRD); 
	
	NOV_1368_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1368_Novize,GIL_GRD);

	NOV_1367_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1367_Novize,GIL_GRD); 

	NOV_1366_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1366_Novize,GIL_GRD); 

	NOV_1365_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1365_Novize,GIL_GRD); 

	NOV_1364_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1364_Novize,GIL_GRD); 

	NOV_1363_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1363_Novize,GIL_GRD); 	
	
	NOV_1362_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1362_Novize,GIL_GRD); 
	
	NOV_1361_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1361_Novize,GIL_GRD); 
	
	NOV_1360_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1360_Novize,GIL_GRD);

	NOV_1359_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1359_Novize,GIL_GRD); 	
};