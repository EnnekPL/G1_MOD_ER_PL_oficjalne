//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Tyon
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Tyon()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tyon");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Tyon_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Tyon_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	/*AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral1"); //Wiele lat temu �ni�cy przyby� tu i zes�a� ludziom prorocz� wizj�.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral2"); //Jednak ludzie w swym za�lepieniu nie chcieli dostrzec pot�gi �ni�cego. Chciwo�� rudy uczyni�a ich �lepcami.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral3"); //Ale Y'Berion, wraz z nielicznymi us�ucha� g�osu �ni�cego i pod��y� jego �cie�k�.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral4"); //A ci co pod��yli stali si� ludem wybranym. Tak powsta�o Bractwo.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral5"); //�ni�cy wskaza� Y'Berionowi i jego uczniom miejsce, w kt�rym mieli si� osiedli�. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral6"); //Wyruszy� przeto Y'Berion na bagna, gdzie on i wybrani ods�onili prastar� �wi�tyni� i osiedlili u jej podn�y.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral7"); //I wznosili wybrani wok� �wi�tyni ob�z, kt�ry sta� si� domem wyznawc�w �ni�cego.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral8"); //W dniach tych wybrani pracowali bezustannie, niebaczni na niebezpiecze�stwa i zm�czenie.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral9"); //Kolejni ludzie gotowi wys�ucha� nauk �ni�cego przybywali na ziemie u�wi�cone jego kultem. A �ni�cy wskaza� im drog� do wolno�ci!*/
	
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


func void ZS_Teaching_Tyon_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tyon_End");
};
