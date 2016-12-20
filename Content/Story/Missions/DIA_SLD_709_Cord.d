// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> SZKODNICY
//========================================

INSTANCE DIA_Cord_SZKODNICY (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_SZKODNICY_Condition;
   information  = DIA_Cord_SZKODNICY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cord_SZKODNICY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ)) && (MIS_CronosArtifacts == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_SZKODNICY_Info()
{
    AI_Output (self, other ,"DIA_Cord_SZKODNICY_03_01"); //Hej! Podobno pomagasz Cronosowi w poszukiwaniach Szkodników. Bardzo dobrze.
    AI_Output (self, other ,"DIA_Cord_SZKODNICY_03_02"); //Mogê ci daæ wskazówkê: widzia³em dwóch Szkodników na polanie. Myœlê, ¿e rozbili tam obóz. 
    AI_Output (other, self ,"DIA_Cord_SZKODNICY_15_03"); //Dziêki. Rozpocznê tam swoje poszukiwania.
    B_LogEntry                     (CH1_MagicySzkodnicy,"Cord widzia³ dwóch Szkodników na polanie nad Nowym Obozem. Powinienem tam poszukaæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZAJECIE
//========================================

INSTANCE DIA_Cord_ZAJECIE (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_ZAJECIE_Condition;
   information  = DIA_Cord_ZAJECIE_Info;
   permanent	= FALSE;
   description	= "Czym siê tutaj zajmujesz poza trenowaniem Najemników?";
};

FUNC INT DIA_Cord_ZAJECIE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Cord_ZAJECIE_Info()
{
    AI_Output (other, self ,"DIA_Cord_ZAJECIE_15_01"); //Czym siê tutaj zajmujesz poza trenowaniem Najemników?
    AI_Output (self, other ,"DIA_Cord_ZAJECIE_03_02"); //Có¿, jestem przywódc¹ prowizorycznej stra¿y. Zajmujemy siê w specjalnymi zadaniami zlecanych przez Lee. 
	AI_Output (self, other ,"DIA_Cord_ZAJECIE_03_03"); //Poza tym chroniê Magów Wody najlepiej jak mogê. Œwietnie siê dogadujemy i mam nadziejê, ¿e po upadku Bariery pomimo zakoñczenia umowy miêdzy Lee a Magami, bêdê mia³ mo¿liwoœæ dla nich pracowaæ.
    AI_Output (other, self ,"DIA_Cord_ZAJECIE_15_04"); //Rozumiem.
};


/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³bym nauczyæ siê walki jednorêcznym orê¿em."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
		return TRUE;
};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Nie ma sprawy. Ale to ciê bêdzie kosztowa³o 30 bry³ek rudy. Mo¿e byæ?
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_03"); //Aha, szkolê tylko NASZYCH ludzi!

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,	"Najemnik Cord mo¿e mnie nauczyæ walki jednorêcznym orê¿em o ile do³¹czê do Nowego Obozu. Za dnia mo¿na go znaleŸæ na kamienistej równinie, przy jeziorze.");
};  

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Cord_START_TRAIN (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 10;
	condition	= DIA_Cord_START_TRAIN_Condition;
	information	= DIA_Cord_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Cord_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,SLD_709_Cord_TRAINOFFER)) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_SFB) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || ( (Npc_GetTrueGuild(hero) == GIL_NONE) && (kapitel >= 4)  )  )
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Cord_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Cord_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};

};

func void DIA_Cord_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	var int ilosc;
	ilosc = Npc_hasitems (self, itminugget);
	Npc_RemoveInvItems (self, itminugget, ilosc);
};

FUNC VOID Cord_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Cord_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_01"); //M¹dra decyzja. Najbli¿sze trzy lekcje obejm¹ podstawy z którymi powinieneœ siê zapoznaæ.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_02"); //Bronie jednorêczne s¹ znacznie l¿ejsze ni¿ dwurêczne, a przez to równie¿ znacznie szybsze. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_03"); //Istnieje podzia³ na lekkie bronie jednorêczne i te ciê¿sze. Ciê¿sze wymagaj¹ pewniejszego chwytu, ale te¿ wiêcej si³y.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_04"); //Jeœli chcesz p³ynnie walczyæ ciê¿k¹ jednorêczn¹, poza technik¹ bêdziesz te¿ musia³ poznaæ tajniki balansowania cia³em.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_05"); //O du¿ej sile w ³apie ju¿ nawet nie mówiê. To oczywiste, ¿e ¿eby szybko wymachiwaæ takim ciê¿arem bêdziesz musia³ posiadaæ wiêcej si³y ni¿ potrzeba do podniesienia dobrego dwurêcznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h2 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_06"); //Poka¿ mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_07"); //Tak jak myœla³em. Zadajesz mniejsze obra¿enia ni¿ faktycznie móg³byœ zadaæ przy obecnej sile i za³o¿onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_08"); //Nie atakuj, gdy jesteœ zbyt daleko. Jeœli za bardzo siê wychylisz do oddalonego przeciwnika, mo¿esz straciæ równowagê i siê przewróciæ.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_09"); //Staraj siê atakowaæ z ró¿nych stron, aby zmyliæ przeciwnika. Pamiêtaj, aby blokowaæ uderzenia, jeœli nie bêdziesz w stanie zrobiæ uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h3 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_10"); //Pamiêtasz o balansowaniu cia³em? A o odpowiedniej odleg³oœci od przeciwnika? 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_11"); //Spróbuj wyczuæ ile si³y musisz u¿yæ, aby broñ uderza³a mocno, a przy tym nie polecia³a bez³adnie przed siebie. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_12"); //Gdy to opanujesz, bêdziemy mogli pomyœleæ nad ³¹czeniem po sobie uderzeñ. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_14"); //Rêce opadaj¹... Nie dwiema, tylko jedn¹! Omówimy to na nastêpnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h4 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		B_PracticeCombat	("NC_WATERFALL_TOP01");
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h5 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_15"); //¯eby zadaæ wiêksze obra¿enia musisz trafiaæ w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_16"); //Ciê¿ko siê tego nauczyæ. Wszystko zale¿y od postury i pancerza. Najlepiej atakowaæ koñczyny i g³owê.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_17"); //Naturalnie walka z cz³owiekiem ró¿ni siê od walki ze zwierzêciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h6 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_18"); //Pamiêtasz jak na pierwszej lekcji omawialiœmy podzia³ na bronie ciê¿kie i te l¿ejsze?
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_19"); //Myœlê, ¿e jesteœ ju¿ wystarczaj¹co silny, aby walczyæ ciê¿kimi jednorêczniakami. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_20"); //O czym musisz pamiêtaæ? O odpowiednim wyczuciu równowagi ostrza, a tak¿e o treningu si³owym, który jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h7 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Cord_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output (self, other,"DIA_Cord_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output (self, other,"DIA_Cord_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h8 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h9 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h10 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_26"); //To ju¿ koniec naszego szkolenia. Szacunek dla ciebie, ¿e dobrn¹³eœ do koñca.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_27"); //Poka¿ê ci kilka ruchów, którymi trafisz we wra¿liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_28"); //Musisz potrafiæ je dostrzec zanim siê do niego zbli¿ysz. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Broñ jednorêczna, poziom 10, 2500 bry³ek rudy, 10 PN",Cord_nauka1h10);
	};
};

/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/
/*
instance  SLD_709_Cord_TRAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAIN_Condition;
	information		= SLD_709_Cord_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30); 
};

FUNC int  SLD_709_Cord_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};
FUNC void  SLD_709_Cord_TRAIN_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (hero.attribute[ATR_STRENGTH] >= 30)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //M¹dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneœ nauczyæ siê prawid³owo trzymaæ orê¿ w rêku.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
	}
	else
	{
	AI_Output			(self,other,"SLD_709_Cord_NO_ENOUGHT_STR_1"); //Je¿eli chcesz byæ lepszym wojownikiem, najpierw nieco popracuj nad miêœniami. 
	PrintScreen	("Warunek: Si³a 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);		
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/
/*
instance  SLD_709_Cord_TRAINAGAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINAGAIN_Condition;
	information		= SLD_709_Cord_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50); 
};

FUNC int  SLD_709_Cord_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINAGAIN_Info()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.

	if (hero.attribute[ATR_STRENGTH] >= 60)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Dobrze, podstawy ju¿ znasz. Nieznaczne opuszczenie broni zwiêkszy si³ê twojego pierwszego ciosu.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_06"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
	}
	else
	{
	AI_Output			(self,other,"SLD_709_Cord_NO_ENOUGHT_STR_1"); //Je¿eli chcesz byæ lepszym wojownikiem, najpierw nieco popracuj nad miêœniami. 
	PrintScreen	("Warunek: Si³a 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);		
	};
}; 
*/

//========================================
//-----------------> SpottedNearMine
//========================================

INSTANCE DIA_Cord_SpottedNearMine (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_SpottedNearMine_Condition;
   information  = DIA_Cord_SpottedNearMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cord_SpottedNearMine_Condition()
{
    if (MIS_SupportForQuentin == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_SpottedNearMine_Info()
{
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_01"); //No wreszcie jesteœ!
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_02"); //Jak sytuacja?
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_03"); //Przys³a³ nas Lee. W okolicy kopalni i na œcie¿kach krêci³o siê sporo Stra¿ników. Pozbyliœmy siê ich. Gdy usiedliœmy, by odpocz¹æ pojawili siê kolejni Stra¿nicy i o¿ywieñcy.
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_04"); //Byliœcie wewn¹trz kopalni?
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_05"); //Oszala³eœ?! Przecie¿ tam roi siê od tych piekielnych istot. Nawet Stra¿nicy zaczêli uciekaæ. Wpadli w nasz¹ zasadzkê... he he.
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_06"); //No, dobra, czyli muszê zejœæ na dó³ i zobaczyæ, co takiego siê tam dzieje.
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_15_07"); //My zostaniemy tutaj i bêdziemy pilnowaæ wejœcia. W ka¿dej chwili mog¹ siê pojawiæ kolejni Stra¿nicy. Dopilnujemy, ¿eby nie zaszli ciê od ty³u.
 
	//zadanie - wpis
	B_LogEntry                     (CH4_SupportForQuentin,"Sytuacja nie wygl¹da za dobrze. W okolicy kopalni krêci siê sporo Stra¿ników. Bêdê musia³ zostawiæ Najemników i Bandytów na stra¿y, a do kopalni zejœæ sam.");
    
	//exp 
	B_GiveXP (290);
	
	/*   AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_08"); //Masz ten kamieñ przy sobie?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_09"); //Oczywiœcie! Znalaz³em go na dnie kopalni.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_10"); //Skoro kopalnia jest ju¿ bezpieczna mo¿na by wznowiæ wydobycie. Magowie Wody byliby zachwyceni.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_11"); //Przeka¿ im t¹ wiadomoœæ.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_12"); //Dobrze.
        MIS_NC_Mine = LOG_RUNNING;

        Log_CreateTopic            (CH4_NC_Mine, LOG_MISSION);
        Log_SetTopicStatus       (CH4_NC_Mine, LOG_RUNNING);
        B_LogEntry                     (CH4_NC_Mine,"Oczyœci³em kopalniê ze z³ych si³. Cord zaproponowa³, aby poddaæ Magom Wody pomys³ na wznowienie wydobycia.");

        B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_13"); //Nie mam go przy sobie.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_14"); //To wracaj jak najszybciej do kopalni i go przynieœ.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_15"); //Ta kopalnia mo¿e doprowadziæ nas do wolnoœci!
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_16"); //No dobrze. Wrócê tam.
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_17"); //Pilnujcie wejœcia przed Stra¿nikami i o¿ywieñcami.
    }; */
	
};

//========================================
//-----------------> IHaveStone
//========================================

INSTANCE DIA_Cord_IHaveStone (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 2;
   condition    = DIA_Cord_IHaveStone_Condition;
   information  = DIA_Cord_IHaveStone_Info;
   permanent	= FALSE;
   description	= "By³em w kopalni.";
};

FUNC INT DIA_Cord_IHaveStone_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_SpottedNearMine))
    && (Npc_HasItems (hero, Focus_Corristo) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_IHaveStone_Info()
{
    AI_Output (other, self ,"DIA_Cord_IHaveStone_15_01"); //By³em w kopalni.
    AI_Output (self, other ,"DIA_Cord_IHaveStone_03_02"); //Co wydarzy³o siê w œrodku?
    AI_Output (other, self ,"DIA_Cord_IHaveStone_03_03"); //Spotka³em ledwie ¿ywego Kopacza. Opowiedzia³ mi o artefakcie, który rzekomo ma wp³yw na o¿ywieñców. 
	AI_Output (other, self ,"DIA_Cord_IHaveStone_03_04"); //W posiadaniu artefaktu by³ pewien nekromanta. Zabi³em go i zabra³em kamieñ.
    AI_Output (self, other ,"DIA_Cord_IHaveStone_03_05"); //Nekromanta? Cholera jasna, uda³o ci siê pokonaæ tego skurwiela? 
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_06"); //Jestem pod wra¿eniem. Zawsze trzymam siê z dala od mrocznej magii. 
	AI_Output (other, self ,"DIA_Cord_IHaveStone_03_07"); //Potrzebujê chwili odpoczynku.
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_08"); //Nic dziwnego! Nale¿y ci siê jak psu buda! Wracaj do Obozu, a my sprawdzimy czy nie krêci siê tu ¿aden œmieæ. 
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_09"); //W sumie, skoro kopalnia jest ju¿ w miarê bezpiecznym miejscem, to mo¿esz zaproponowaæ Lee, aby wys³a³ tu paru ludzi. 
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_10"); //Kolejne Ÿród³o rudy da³oby nam przewagê.
	AI_Output (other, self ,"DIA_Cord_IHaveStone_03_11"); //Zobaczê, co da siê zrobiæ. 
	
	//nowe zadanie 
	MIS_NC_Mine = LOG_RUNNING;

    Log_CreateTopic          (CH4_NC_Mine, LOG_MISSION);
    Log_SetTopicStatus       (CH4_NC_Mine, LOG_RUNNING);
    B_LogEntry               (CH4_NC_Mine,"Oczyœci³em kopalniê ze z³ych si³. Cord zaproponowa³, aby poddaæ Lee pomys³ na wznowienie wydobycia.");
	
	//stare zadanie z kopalni¹
	MIS_SupportForQuentin = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_SupportForQuentin, LOG_SUCCESS);
	B_LogEntry               (CH4_SupportForQuentin,"Pozby³em siê nekromanty, który przywo³ywaj o¿ywieñców w kopalni i opowiedzia³em o tym Cordowi. Moje zadanie dobieg³o koñca. Po kolejne instrukcje powinienem siê udaæ do Lee.");
	B_GiveXP (500); 
	
    AI_StopProcessInfos	(self);
	//Npc_ExchangeRoutine (SLD_737_Torlof,"start");
	Npc_ExchangeRoutine (SLD_728_Jarvis,"start");
	Npc_ExchangeRoutine (SLD_709_Cord,"start");
	Npc_ExchangeRoutine (BAN_1605_Rocky,"start");
   AI_StopProcessInfos	(self);
};

//#####################################################################################
//####### ROZDZIA£ 5
//####### ZASTÊPSTWO DLA GORNA
//#####################################################################################
//========================================
//-----------------> CALL_OF_DUTY
//========================================

INSTANCE DIA_Cord_CALL_OF_DUTY (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_CALL_OF_DUTY_Condition;
   information  = DIA_Cord_CALL_OF_DUTY_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Lee. Twoja stra¿ ma zaj¹æ siê obron¹ Wolnej Kopalni.";
};

FUNC INT DIA_Cord_CALL_OF_DUTY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_OBRONA_WK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_CALL_OF_DUTY_Info()
{
    AI_Output (other, self ,"DIA_Cord_CALL_OF_DUTY_15_01"); //Przysy³a mnie Lee. Twoja stra¿ ma zaj¹æ siê obron¹ Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Cord_CALL_OF_DUTY_03_02"); //W porz¹dku i tak mieliœmy siê tam udaæ.
    AI_Output (self, other ,"DIA_Cord_CALL_OF_DUTY_03_03"); //Gorn jednak by³ tak nadgorliwy, ¿e postanowi³ sam zaj¹æ siê Stra¿nikami.
    AI_Output (self, other ,"DIA_Cord_CALL_OF_DUTY_03_04"); //Natychmiast go zmienimy.
    B_LogEntry                     (CH5_ObronaWK,"Przekaza³em wiadomoœæ od Lee Cordowi.");

    B_GiveXP (200);
	AI_StopProcessInfos	(self);
	//Rutyny Najemników id¹cych do Kot³a.
    Npc_ExchangeRoutine (SLD_709_Cord,"FMDef");
	Npc_ExchangeRoutine (SLD_735_Soeldner,"FMDef");
	Npc_ExchangeRoutine (SLD_736_Soeldner,"FMDef");
};