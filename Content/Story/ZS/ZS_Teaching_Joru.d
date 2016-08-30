//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Joru
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Joru()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Joru");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Joru_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Joru_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	/*AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru1"); //Dawno temu �ni�cy ukaza� si� Y'Berionowi. Ja�nieo�wiecony by� wtedy jednym z kopaczy i podobnie jak ci co za nim pod��yli pragn�� wolno�ci.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru2"); //On i ci co zaufali s�owu �ni�cego, nie chcieli d�u�ej trwa� w niewoli magnat�w, nie chcieli s�ucha� ich k�amstw. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru3"); //Osiedli wtedy tu - u podn�y staro�ytnej �wi�tyni i miejsce to sta�o si� ich domem. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru4"); //Da� im niezale�no�� - od tej pory �aden z nas nie musi pracowa� pod ziemi�. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru5"); //Od tej pory przybywali tu ludzie, kt�rzy nie chcieli d�u�ej nosi� jarzma nak�adanego na nich przez magnat�w. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru6"); //Ludzie, kt�rzy nie chcieli pozwoli�, by strach nimi kierowa�.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru7"); //A �ni�cy wskaza� im drog�...
	*/
	/*if (guardreaktion >= 900)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_11");
	}
	else if (guardreaktion >= 800)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_15");
	}
	else if (guardreaktion >= 700)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_16");
	}
	else if (guardreaktion >= 600)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_18");
		
	}
	else if (guardreaktion >= 500)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_21");
	}
	else if (guardreaktion >= 400)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_20");
	};*/
	
	AI_Wait				(self,	1);
};


func void ZS_Teaching_Joru_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Joru_End");
};
