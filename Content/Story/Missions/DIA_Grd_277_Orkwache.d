//poprawione i sprawdzone - Nocturn

/*------------------------------------------------------------------------
							Sitzender Ork									
------------------------------------------------------------------------*/

instance  Grd_277_Gardist_SITTINGORK (C_INFO)
{
	npc				= Grd_277_Gardist;
	condition		= Grd_277_Gardist_SITTINGORK_Condition;
	information		= Grd_277_Gardist_SITTINGORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co to za ork?"; 
};

FUNC int  Grd_277_Gardist_SITTINGORK_Condition()
{	
	if (Ian_gearwheel != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Grd_277_Gardist_SITTINGORK_Info()
{
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Co to za ork?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //To nasz jeniec. Ma sukinsyn szcz�cie, �e p�k�o ko�o z�bate w rozdrabniaczu. Dlatego mo�e sobie troch� odpocz��.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Ale jak tylko naprawimy rozdrabniacz, sko�cz� si� �ajdakowi wakacje!
};  
/*------------------------------------------------------------------------
							WORKINGORK							
------------------------------------------------------------------------*/

instance  Grd_277_Gardist_WORKINGORK (C_INFO)
{
	npc				= Grd_277_Gardist;
	condition		= Grd_277_Gardist_WORKINGORK_Condition;
	information		= Grd_277_Gardist_WORKINGORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Widz�, �e rozdrabniacz jest ju� sprawny."; 
};

FUNC int  Grd_277_Gardist_WORKINGORK_Condition()
{	
	if (Ian_gearwheel == LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Grd_277_Gardist_WORKINGORK_Info()
{
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Widz�, �e rozdrabniacz jest ju� sprawny.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Tak, staramy si�, �eby ludzie nie narzekali tutaj na brak zaj�cia.
};  