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
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ)) && (MIS_MagicySzkodnicy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_SZKODNICY_Info()
{
    AI_Output (self, other ,"DIA_Cord_SZKODNICY_03_01"); //Hej! Podobno pomagasz Cronosowi w poszukiwaniach Szkodnik�w. Bardzo dobrze.
    AI_Output (self, other ,"DIA_Cord_SZKODNICY_03_02"); //Mog� ci da� wskaz�wk�: widzia�em dw�ch Szkodnik�w na polanie. My�l�, �e rozbili tam ob�z. 
    AI_Output (other, self ,"DIA_Cord_SZKODNICY_15_03"); //Dzi�ki. Rozpoczn� tam swoje poszukiwania.
    B_LogEntry                     (CH1_MagicySzkodnicy,"Cord widzia� dw�ch Szkodnik�w na polanie nad Nowym Obozem. Powinienem tam poszuka�.");
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
   description	= "Czym si� tutaj zajmujesz poza trenowaniem Najemnik�w?";
};

FUNC INT DIA_Cord_ZAJECIE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Cord_ZAJECIE_Info()
{
    AI_Output (other, self ,"DIA_Cord_ZAJECIE_15_01"); //Czym si� tutaj zajmujesz poza trenowaniem Najemnik�w?
    AI_Output (self, other ,"DIA_Cord_ZAJECIE_03_02"); //C�, jestem przyw�dc� prowizorycznej stra�y. Zajmujemy si� w specjalnymi zadaniami zlecanych przez Lee. 
	AI_Output (self, other ,"DIA_Cord_ZAJECIE_03_03"); //Poza tym chroni� Mag�w Wody najlepiej jak mog�. �wietnie si� dogadujemy i mam nadziej�, �e po upadku Bariery pomimo zako�czenia umowy mi�dzy Lee a Magami, b�d� mia� mo�liwo�� dla nich pracowa�.
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
	description		= "Chcia�bym nauczy� si� walki jednor�cznym or�em."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
		return TRUE;
};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Nie ma sprawy. Ale to ci� b�dzie kosztowa�o 30 bry�ek rudy. Mo�e by�?
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_03"); //Aha, szkol� tylko NASZYCH ludzi!

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,	"Najemnik Cord mo�e mnie nauczy� walki jednor�cznym or�em o ile do��cz� do Nowego Obozu. Za dnia mo�na go znale�� na kamienistej r�wninie, przy jeziorze.");
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
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};

};

func void DIA_Cord_START_TRAINBACK ()
{
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
};

FUNC VOID Cord_nauka1h1 ()
{
	AI_Output (other,self,"DIA_Cord_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_01"); //M�dra decyzja. Najbli�sze trzy lekcje obejm� podstawy z kt�rymi powiniene� si� zapozna�.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_02"); //Bronie jednor�czne s� znacznie l�ejsze ni� dwur�czne, a przez to r�wnie� znacznie szybsze. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_03"); //Istnieje podzia� na lekkie bronie jednor�czne i te ci�sze. Ci�sze wymagaj� pewniejszego chwytu, ale te� wi�cej si�y.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_04"); //Je�li chcesz p�ynnie walczy� ci�k� jednor�czn�, poza technik� b�dziesz te� musia� pozna� tajniki balansowania cia�em.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_05"); //O du�ej sile w �apie ju� nawet nie m�wi�. To oczywiste, �e �eby szybko wymachiwa� takim ci�arem b�dziesz musia� posiada� wi�cej si�y ni� potrzeba do podniesienia dobrego dwur�cznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h2 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_06"); //Poka� mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_07"); //Tak jak my�la�em. Zadajesz mniejsze obra�enia ni� faktycznie m�g�by� zada� przy obecnej sile i za�o�onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_08"); //Nie atakuj, gdy jeste� zbyt daleko. Je�li za bardzo si� wychylisz do oddalonego przeciwnika, mo�esz straci� r�wnowag� i si� przewr�ci�.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_09"); //Staraj si� atakowa� z r�nych stron, aby zmyli� przeciwnika. Pami�taj, aby blokowa� uderzenia, je�li nie b�dziesz w stanie zrobi� uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h3 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_10"); //Pami�tasz o balansowaniu cia�em? A o odpowiedniej odleg�o�ci od przeciwnika? 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_11"); //Spr�buj wyczu� ile si�y musisz u�y�, aby bro� uderza�a mocno, a przy tym nie polecia�a bez�adnie przed siebie. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_12"); //Gdy to opanujesz, b�dziemy mogli pomy�le� nad ��czeniem po sobie uderze�. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_13"); //Poka� mi jeszcze jak wyci�gasz bro�. Robisz jakie� post�py?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_14"); //R�ce opadaj�... Nie dwiema, tylko jedn�! Om�wimy to na nast�pnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
	Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h4 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		B_PracticeCombat	("NC_WATERFALL_TOP01");
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h5 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_15"); //�eby zada� wi�ksze obra�enia musisz trafia� w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_16"); //Ci�ko si� tego nauczy�. Wszystko zale�y od postury i pancerza. Najlepiej atakowa� ko�czyny i g�ow�.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_17"); //Naturalnie walka z cz�owiekiem r�ni si� od walki ze zwierz�ciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h6 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_18"); //Pami�tasz jak na pierwszej lekcji omawiali�my podzia� na bronie ci�kie i te l�ejsze?
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_19"); //My�l�, �e jeste� ju� wystarczaj�co silny, aby walczy� ci�kimi jednor�czniakami. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_20"); //O czym musisz pami�ta�? O odpowiednim wyczuciu r�wnowagi ostrza, a tak�e o treningu si�owym, kt�ry jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h7 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Cord_TRAIN_2h_Info_01_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
		AI_Output (self, other,"DIA_Cord_TRAIN_2h_Info_01_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
		AI_Output (self, other,"DIA_Cord_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h8 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_21"); //Robisz post�py. Skup si� na kolejnych ciosach. ��cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h9 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_22"); //Chc�c najbole�niej zrani� przeciwnika musisz dobrze wymierzy� cios. Gdy masz szans� staraj si� trafia� w g�ow� lub barki.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_23"); //S�abe punkty to tak�e ��cznia zbroi. Je�li przeciwnik ma na sobie sk�rzan� zbroj� to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_24"); //Sk�rzane pancerze �atwo si� rozcina. 
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ci� nauczy�em i stosuj si� do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
	};
};

FUNC VOID Cord_nauka1h10 ()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if (Npc_HasItems(other,itminugget) >= 2500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_26"); //To ju� koniec naszego szkolenia. Szacunek dla ciebie, �e dobrn��e� do ko�ca.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_27"); //Poka�� ci kilka ruch�w, kt�rymi trafisz we wra�liwe punkty twojego wroga.
		AI_Output (self,other,"DIA_Cord_TRAIN_1h_npc_28"); //Musisz potrafi� je dostrzec zanim si� do niego zbli�ysz. 
		B_GiveInvItems(other,self,itminugget,2500);
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};	
Info_ClearChoices	(DIA_Cord_START_TRAIN);
	Info_AddChoice		(DIA_Cord_START_TRAIN,DIALOG_BACK,DIA_Cord_START_TRAINBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 1, 100 bry�ek rudy, 10 PN",Cord_nauka1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 2, 200 bry�ek rudy, 10 PN",Cord_nauka1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 3, 300 bry�ek rudy, 10 PN",Cord_nauka1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 4, 400 bry�ek rudy, 10 PN",Cord_nauka1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 5, 500 bry�ek rudy, 10 PN",Cord_nauka1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 6, 600 bry�ek rudy, 10 PN",Cord_nauka1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 7, 1000 bry�ek rudy, 10 PN",Cord_nauka1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 8, 1500 bry�ek rudy, 10 PN",Cord_nauka1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 9, 2000 bry�ek rudy, 10 PN",Cord_nauka1h9);
	};	
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	{
	Info_AddChoice		(DIA_Cord_START_TRAIN,"Bro� jednor�czna, poziom 10, 2500 bry�ek rudy, 10 PN",Cord_nauka1h10);
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
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if (hero.attribute[ATR_STRENGTH] >= 30)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
	}
	else
	{
	AI_Output			(self,other,"SLD_709_Cord_NO_ENOUGHT_STR_1"); //Je�eli chcesz by� lepszym wojownikiem, najpierw nieco popracuj nad mi�niami. 
	PrintScreen	("Warunek: Si�a 30", -1,-1,"FONT_OLD_20_WHITE.TGA",2);		
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
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.

	if (hero.attribute[ATR_STRENGTH] >= 60)
	{
	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_06"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
	}
	else
	{
	AI_Output			(self,other,"SLD_709_Cord_NO_ENOUGHT_STR_1"); //Je�eli chcesz by� lepszym wojownikiem, najpierw nieco popracuj nad mi�niami. 
	PrintScreen	("Warunek: Si�a 60", -1,-1,"FONT_OLD_20_WHITE.TGA",2);		
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
    if (MIS_PomocQuentinowi == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_SpottedNearMine_Info()
{
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_01"); //No wreszcie jeste�!
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_02"); //Jak sytuacja?
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_03"); //Przys�a� nas Lee. W okolicy kopalni i na �cie�kach kr�ci�o si� sporo Stra�nik�w. Pozbyli�my si� ich. Gdy usiedli�my, by odpocz�� pojawili si� kolejni Stra�nicy i o�ywie�cy.
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_04"); //Byli�cie wewn�trz kopalni?
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_05"); //Oszala�e�?! Przecie� tam roi si� od tych piekielnych istot. Nawet Stra�nicy zacz�li ucieka�. Wpadli w nasz� zasadzk�... he he.
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_06"); //No, dobra, czyli musz� zej�� na d� i zobaczy�, co takiego si� tam dzieje.
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_15_07"); //My zostaniemy tutaj i b�dziemy pilnowa� wej�cia. W ka�dej chwili mog� si� pojawi� kolejni Stra�nicy. Dopilnujemy, �eby nie zaszli ci� od ty�u.
 
	//zadanie - wpis
	B_LogEntry                     (CH1_PomocQuentinowi,"Sytuacja nie wygl�da za dobrze. W okolicy kopalni kr�ci si� sporo Stra�nik�w. B�d� musia� zostawi� Najemnik�w i Bandyt�w na stra�y, a do kopalni zej�� sam.");
    
	//exp 
	B_GiveXP (290);
	
	/*   AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_08"); //Masz ten kamie� przy sobie?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_09"); //Oczywi�cie! Znalaz�em go na dnie kopalni.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_10"); //Skoro kopalnia jest ju� bezpieczna mo�na by wznowi� wydobycie. Magowie Wody byliby zachwyceni.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_11"); //Przeka� im t� wiadomo��.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_12"); //Dobrze.
        MIS_NC_Mine = LOG_RUNNING;

        Log_CreateTopic            (CH1_NC_Mine, LOG_MISSION);
        Log_SetTopicStatus       (CH1_NC_Mine, LOG_RUNNING);
        B_LogEntry                     (CH1_NC_Mine,"Oczy�ci�em kopalni� ze z�ych si�. Cord zaproponowa�, aby podda� Magom Wody pomys� na wznowienie wydobycia.");

        B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_13"); //Nie mam go przy sobie.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_14"); //To wracaj jak najszybciej do kopalni i go przynie�.
        AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_15"); //Ta kopalnia mo�e doprowadzi� nas do wolno�ci!
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_16"); //No dobrze. Wr�c� tam.
        AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_17"); //Pilnujcie wej�cia przed Stra�nikami i o�ywie�cami.
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
   description	= "By�em w kopalni.";
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
    AI_Output (other, self ,"DIA_Cord_IHaveStone_15_01"); //By�em w kopalni.
    AI_Output (self, other ,"DIA_Cord_IHaveStone_03_02"); //Co wydarzy�o si� w �rodku?
    AI_Output (other, self ,"DIA_Cord_IHaveStone_03_03"); //Spotka�em ledwie �ywego Kopacza. Opowiedzia� mi o artefakcie, kt�ry rzekomo ma wp�yw na o�ywie�c�w. W posiadaniu artefaktu by� pewien nekromanta. Zabi�em go i zabra�em kamie�.
    AI_Output (self, other ,"DIA_Cord_IHaveStone_03_04"); //Nekromanta? Cholera jasna, uda�o ci si� pokona� tego skurwiela? Jestem pod wra�eniem. Zawsze trzymam si� z dala od mrocznej magii. 
	AI_Output (other, self ,"DIA_Cord_IHaveStone_03_05"); //Potrzebuj� chwili odpoczynku.
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_06"); //Nic dziwnego! Nale�y ci si� jak psu buda! Wracaj do Obozu, a my sprawdzimy czy nie kr�ci si� tu �aden �mie�. 
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_07"); //W sumie, skoro kopalnia jest ju� w miar� bezpiecznym miejscem, to mo�esz zaproponowa� Lee, aby wys�a� tu paru ludzi. Kolejne �r�d�o rudy da�oby nam przewag�.
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_08"); //Zobacz�, co da si� zrobi�. 
	
	//nowe zadanie 
	MIS_NC_Mine = LOG_RUNNING;

    Log_CreateTopic          (CH1_NC_Mine, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NC_Mine, LOG_RUNNING);
    B_LogEntry               (CH1_NC_Mine,"Oczy�ci�em kopalni� ze z�ych si�. Cord zaproponowa�, aby podda� Lee pomys� na wznowienie wydobycia.");
	
	//stare zadanie z kopalni�
	MIS_PomocQuentinowi = LOG_SUCCESS;
    Log_SetTopicStatus       (CH1_PomocQuentinowi, LOG_SUCCESS);
	B_LogEntry               (CH1_PomocQuentinowi,"Pozby�em si� nekromanty, kt�ry przywo�ywaj o�ywie�c�w w kopalni i opowiedzia�em o tym Cordowi. Moje zadanie dobieg�o ko�ca. Po kolejne instrukcje powinienem si� uda� do Lee.");
	B_GiveXP (500); 
	
    AI_StopProcessInfos	(self);
	//Npc_ExchangeRoutine (SLD_737_Torlof,"start");
	Npc_ExchangeRoutine (SLD_728_Jarvis,"start");
	Npc_ExchangeRoutine (SLD_709_Cord,"start");
	Npc_ExchangeRoutine (BAU_2012_Rocky,"start");
   AI_StopProcessInfos	(self);
};

//#####################################################################################
//####### ROZDZIA� 5
//####### ZAST�PSTWO DLA GORNA
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
   description	= "Przysy�a mnie Lee. Twoja stra� ma zaj�� si� obron� Wolnej Kopalni.";
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
    AI_Output (other, self ,"DIA_Cord_CALL_OF_DUTY_15_01"); //Przysy�a mnie Lee. Twoja stra� ma zaj�� si� obron� Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Cord_CALL_OF_DUTY_03_02"); //W porz�dku i tak mieli�my si� tam uda�.
    AI_Output (self, other ,"DIA_Cord_CALL_OF_DUTY_03_03"); //Gorn jednak by� tak nadgorliwy, �e postanowi� sam zaj�� si� Stra�nikami.
    AI_Output (self, other ,"DIA_Cord_CALL_OF_DUTY_03_04"); //Natychmiast go zmienimy.
    B_LogEntry                     (CH5_ObronaWK,"Przekaza�em wiadomo�� od Lee Cordowi.");

    B_GiveXP (200);
	AI_StopProcessInfos	(self);
	//Rutyny Najemnik�w id�cych do Kot�a.
    Npc_ExchangeRoutine (SLD_709_Cord,"FMDef");
	Npc_ExchangeRoutine (SLD_735_Soeldner,"FMDef");
	Npc_ExchangeRoutine (SLD_736_Soeldner,"FMDef");
};