//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Tondral
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Tondral()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tondral");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Tondral_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Tondral_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	/*AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral1"); //Jeste�my ludem wybranym! To do nas b�dzie nale�e� wolno��. �ni�cy wyzwoli� nas ju� z niewoli fa�szywych kult�w. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral2"); //Wskaza� nam drog� i otworzy� nasze umys�y.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral3"); //Ilu� ludzi tkwi jeszcze w wierze w fa�szywych bog�w, gdy zbli�a si� godzina wyzwolenia? 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral4"); //Blu�niercy i czciciele fa�szywych bog�w zap�acz� wtedy gorzko, gdy� �ni�cy ukarze ich za�lepienie.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral5"); //Zbudzi si� tedy pewnego dnia, wyzwoli swoich poddanych i str�ci niewiernych w najczarniejsze czelu�ci piekie�.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral6"); //Przekl�ci niech b�d� k�amcy i blu�niercy. Ich �garstwa czyni� s�abych ludzi �lepcami. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral7"); //Kto inny chcia�by nosi� niewolnicze jarzmo nak�adane ludziom przez Magnat�w, je�eli nie ludzie s�abi?
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral8"); //Ludzie ci zniewoleni wyrzekaj� si� swojej duszy! Wyrzekasz si� samych siebie! Nie pozw�lcie, by strach wami kierowa�!
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral9"); //Ale �ni�cy jest silniejszy ni� ich k�amstwa! Uwolni� nas spod wp�ywu fa�szywych bog�w. Da� nam moc przejrze� na oczy!
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral10"); //Pokaza� nam jaka moc drzemie w bagiennym zielu i wreszcie obdarzy� niekt�rych z nas darem magii. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral11"); //Magii staro�ytnej i pot�nej. R�nej od tej, kt�r� wykorzystywali dot�d magowie tego kr�lestwa.
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


func void ZS_Teaching_Tondral_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tondral_End");
};
