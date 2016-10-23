//poprawione i sprawdzone - Nocturn

// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracuj� dla Ry�owego Ksi�cia.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakie� zaj�cie?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Porozmawiamy innym razem!
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&  (SLD_704_Blade.aivar[AIV_PARTYMEMBER] != TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hej! Jeste� tu nowy, nie? Potrzebuj� kogo�, kto zaniesie wod� naszym zbieraczom ry�u.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //W ten spos�b od razu poznasz kilku ludzi. Zainteresowany?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,	"Lewus, zadufany w sobie Szkodnik z Nowego Obozu, chce, �ebym zani�s� wod� zbieraczom ry�u.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Mo�e innym razem."				,DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Sam sobie no� t� wod�!"	,DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Jasne, ch�tnie wam pomog�."			,DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Jasne, ch�tnie wam pomog�.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //�wietnie! Id� do Ry�owego Ksi�cia. On da ci wod� i powie ci co nale�y zrobi�.
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,	"Nie jest to mo�e zbyt zaszczytne zadanie, ale zyskam kilku przyjaci�. Wod� dostan� od niejakiego Ry�owego Ksi�cia.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Sam sobie no� t� wod�!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Tak si� nie traktuje przyjaci�! Widz�, �e musz� nauczy� ci� dobrych manier!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,	"Lewus nie�le si� w�ciek�, gdy odrzuci�em jego 'propozycj�'! A my�la�em, �e w Starym Obozie by�o niebezpiecznie!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Mo�e innym razem.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Innym razem mog� ci� ju� nie potrzebowa�. Zdecyduj si�: chcesz mi pom�c czy nie?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Hej, ty!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Masz ogromne szcz�cie! Postanowi�em da� ci drug� szans�.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Ale tym razem postaraj si� tego nie spartaczy�! Id� do Ry�owego Ksi�cia, a potem roznie� wod� wszystkim zbieraczom, jasne?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,	"Znowu wpad�em na Lewusa! Kaza� mi zajrze� do Ry�owego Ksi�cia i zanie�� wod� zbieraczom na polach ry�owych.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Przecie� kaza�em ci roznie�� wod� zbieraczom!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nie lubi� ludzi, kt�rzy co� obiecuj�, a potem nie dotrzymuj� s�owa!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,	"Lewus bardzo si� zez�o�ci�, �e nie roznios�em jeszcze wody! Z tym go�ciem b�d� jeszcze k�opoty!");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobra robota! Mo�e b�d� z ciebie ludzie.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Widz�, �e jeste� wprost stworzony do tego zadania! Od tej pory b�dziesz to robi� codziennie. Bierz si� do roboty!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,	"Nie mog� w to uwierzy�! Roznios�em wod� tak, jak mi kazano, ale Lewus oczekuje, �e b�d� to robi� codziennie! Ten dure� powinien chyba dosta� nauczk�.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Od tej pory mo�esz sam sobie biega� z t� wod�!";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Od tej pory mo�esz sam sobie biega� z t� wod�!
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Czy�by? A co - masz co� lepszego do roboty?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Chyba musz� ci przypomnie� kto tu jest szefem!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Co s�ycha�, przyjacielu?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Co s�ycha�, przyjacielu?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Cz�owieku! Czego chcesz?!

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,	"Wyja�ni�em Lewusowi, �e nie zamierzam gania� w t� i z powrotem z wod� dla zbieraczy. Niekt�rzy ludzie musz� oberwa�, zanim zrozumiej�, co si� do nich m�wi.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Chcia�em zobaczy�, co u ciebie s�ycha�."												,DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Zbieracze wygl�daj� na spragnionych."														,DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Mam ochot� roz�adowa� cz�� drzemi�cej we mnie z�o�ci..."	,DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Mia�em paskudny dzie�, i mam ochot� roz�adowa� cz�� drzemi�cej we mnie z�o�ci... Nie ruszaj si� przez chwilk�!
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Zbieracze wygl�daj� na spragnionych.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Zajm� si� tym... Nie ma obawy.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Chcia�em zobaczy�, co u ciebie s�ycha�.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////
//		WhatDidJosep
///////////////////////////////////////////

instance DIA_Lefty_WhatDidJosep (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WhatDidJosep_Condition;
	information	= DIA_Lefty_WhatDidJosep_Info;
	permanent	= 0;
	description	= "Podobno wi�zisz my�liwego Josepa.";
};                       

FUNC int DIA_Lefty_WhatDidJosep_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Josep_Sorry))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WhatDidJosep_Info()
{
	AI_Output (other, self,"DIA_Lefty_WhatDidJosep_15_00"); //Podobno wi�zisz my�liwego Josepa.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_01"); //Sam sobie ten los zgotowa�...
	AI_Output (other, self,"DIA_Lefty_WhatDidJosep_15_02"); //M�g�by� ja�niej?
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_03"); //Sukinsyn pr�bowa� okra�� nasz magazyn. Na szcz�cie go przy�apa�em podczas nocnej warty.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_04"); //Chcia�em od razu odci�� mu �apy, jednak nagle zjawi� si� Torlof i kaza� zostawi� go w spokoju.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_05"); //Powiedzia� tylko, �e ten cz�owiek jest zbyt cenny, �eby robi� mu krzywd�. Podobno to jaki� my�liwy dobrze znaj�cy swoje rzemios�o.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_06"); //Zaprowadzili�my wiec go do Laresa. Szef zaproponowa� mu do��czenie do Szkodnik�w. I wiesz co ten dupek zrobi�?
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_07"); //Odrzuci� propozycj�!
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_08"); //Bezczelny typ. Teraz jest moim robotnikiem. Nie ma szans �ebym go wypu�ci�. Nie po tym co zrobi�.

	B_LogEntry               (CH1_MissedJosep,"Lewus nie ma najmniejszego zamiaru wypu�ci� Josepa. My�liwy za bardzo zaszed� mu za sk�r�. Musz� wymy�li� co� innego. Nie podoba mi si�, �e Josep nie wspomnia�, �e pr�bowa� okra�� magazyn Szkodnik�w.");
};	

///////////////////////////////////////////
//		Zick
///////////////////////////////////////////

instance DIA_Lefty_Zick (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_Zick_Condition;
	information	= DIA_Lefty_Zick_Info;
	permanent	= 0;
	description	= "Lepiej wypu�� Josepa.";
};                       

FUNC int DIA_Lefty_Zick_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Rene_AtPlace))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_Zick_Info()
{
	AI_Output (other, self,"DIA_Lefty_Zick_15_00"); //Lepiej wypu�� Josepa.
	AI_Output (self, other,"DIA_Lefty_Zick_07_01"); //Bo co mi zrobisz?
	AI_Output (other, self,"DIA_Lefty_Zick_15_02"); //Tobie nic, ale tw�j bratanek Zick mo�e ucierpie�. 
	AI_Output (self, other,"DIA_Lefty_Zick_07_03"); //Co? Gdzie on jest?
	AI_Output (other, self,"DIA_Lefty_Zick_15_04"); //Na razie mi�o sp�dza czas z Rene, ale to si� mo�e zmieni�.
	AI_Output (self, other,"DIA_Lefty_Zick_07_04"); //Rene? Ten sukinsyn! Zabieraj tego my�liwego, tylko najpierw ka� temu psychopacie zostawi� Zicka!
	
	B_LogEntry               (CH1_MissedJosep,"Lewus nieco zmi�k�. Pozwoli� mi zabra� Josepa, jednak najpierw mam kaza� wr�ci� Rene i Zickowi do obozu.");
};	

///////////////////////////////////////////
//		Free
///////////////////////////////////////////

instance DIA_Lefty_Free (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_Free_Condition;
	information	= DIA_Lefty_Free_Info;
	permanent	= 0;
	description	= "Tw�j bratanek wr�ci� do obozu.";
};                       

FUNC int DIA_Lefty_Free_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Rene_AfterParty))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_Free_Info()
{
	AI_Output (other, self,"DIA_Lefty_Free_15_00"); //Tw�j bratanek wr�ci� do obozu.
	AI_Output (self, other,"DIA_Lefty_Free_07_01"); //To dobrze...
	AI_Output (other, self,"DIA_Lefty_Free_15_02"); //Co z nasz� umow�?
	AI_Output (self, other,"DIA_Lefty_Free_07_03"); //Dotrzymam jej. Przyjd� jutro do mnie, a wydam ci Josepa.
	AI_Output (other, self,"DIA_Lefty_Free_15_04"); //Czemu nie dzisiaj? Tego nie by�o w umowie.
	AI_Output (self, other,"DIA_Lefty_Free_07_04"); //Ee... Musz� przecie� poinformowa� o tym Laresa. Pomy�l! Po prostu zg�o� si� do mnie jutro.
	
	B_LogEntry               (CH1_MissedJosep,"Lewus kaza� mi odczeka� jeden dzie� zanim b�d� m�g� zabra� Josepa. Mam si� do niego zg�osi� jutro.");
	
	day_LeftyAndZick = Wld_GetDay();
	
};	

///////////////////////////////////////////
//		NowFree
///////////////////////////////////////////

instance DIA_Lefty_NowFree (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NowFree_Condition;
	information	= DIA_Lefty_NowFree_Info;
	permanent	= 0;
	description	= "Wypu�� Josepa!";
};                       

FUNC int DIA_Lefty_NowFree_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Lefty_Free)) && (day_LeftyAndZick != Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NowFree_Info()
{
	AI_Output (other, self,"DIA_Lefty_NowFree_15_00"); //Wypu�� Josepa!
	AI_Output (self, other,"DIA_Lefty_NowFree_07_01"); //Jest wolny. Id� po niego i zabierajcie si� st�d.
	AI_Output (self, other,"DIA_Lefty_NowFree_07_02"); //Je�li jeszcze raz go tu zobacz�, to nie uratuje go nawet wstawiennictwo Mag�w Wody! 
	AI_Output (self, other,"DIA_Lefty_NowFree_07_03"); //A teraz precz!
	
	B_LogEntry               (CH1_MissedJosep,"Zjawi�em si� nast�pnego dnia u Lewusa. Pozwoli� mi zabra� z obozu Josepa.");
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (ORG_823_Zick,"party");
	AI_Teleport (ORG_823_Zick,"OW_PATH_066");
	Wld_InsertNpc (ORG_895_Organisator,"OW_PATH_066");
	Wld_InsertNpc (ORG_896_Organisator,"OW_PATH_066");
};
 
 
//========================================
//-----------------> ALCO_BUNT
//========================================

INSTANCE DIA_Lefty_ALCO_BUNT (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_ALCO_BUNT_Condition;
   information  = DIA_Lefty_ALCO_BUNT_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Homer, mam dla ciebie ry��wk�.";
};

FUNC INT DIA_Lefty_ALCO_BUNT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_Vodka))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_ALCO_BUNT_Info()
{
    AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_01"); //Przysy�a mnie Homer, mam dla ciebie ry��wk�.
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_02"); //No w ko�cu! Ale zaraz...
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_03"); //Od kiedy Homer wysy�a ch�opc�w na posy�ki?
    AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_04"); //Jest bardzo zaj�ty spraw� tamy. S�ysza�e� na pewno o topielcu.
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_05"); //No tak. Niech ci b�dzie.
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_06"); //Dawaj te butelki.
    if (Npc_HasItems (other, ItMi_Alchemy_Alcohol_01) >=3)
    {
        AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_07"); //Trzymaj.
        B_GiveInvItems (other, self, ItMi_Alchemy_Alcohol_01, 3);
		DIA_Lefty_ALCO_BUNT.permanent = false;
        b_givexp (50);
    }
    else
    {
        AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_08"); //Ty sukinsynu! Pr�bujesz mnie oszuka�?! Mia�y by� trzy butelki. 
        AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_09"); //Homer nie b�dzie zadowolony.
        AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_10"); //Spokojnie. Pewnie gdzie� mi wypad�a. Zaraz wr�c�. 
		DIA_Lefty_ALCO_BUNT.permanent = true;
    };
};

//========================================
//-----------------> JARVIS_CO_OP
//========================================

INSTANCE DIA_Lefty_JARVIS_CO_OP (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_JARVIS_CO_OP_Condition;
   information  = DIA_Lefty_JARVIS_CO_OP_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lefty_JARVIS_CO_OP_Condition()
{
    if (wpadka_Flint_Jarvis == true)
    && (MIS_FlintsOffer == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_JARVIS_CO_OP_Info()
{
    AI_Output (self, other ,"DIA_Lefty_JARVIS_CO_OP_03_01"); //Jarvis mi o wszystkim powiedzia�!
    AI_Output (self, other ,"DIA_Lefty_JARVIS_CO_OP_03_02"); //KNUJESZ ZA MOIMI PLECAMI!
    AI_Output (self, other ,"DIA_Lefty_JARVIS_CO_OP_03_03"); //Gdzie jest m�j cz�owiek, sukinsynu?!
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> ANGRY_LEFTY_PAID
//========================================

INSTANCE DIA_Tuersteher_ANGRY_LEFTY_PAID (C_INFO)
{
   npc          = Org_876_Tuersteher;
   nr           = 1;
   condition    = DIA_Tuersteher_ANGRY_LEFTY_PAID_Condition;
   information  = DIA_Tuersteher_ANGRY_LEFTY_PAID_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Tuersteher_ANGRY_LEFTY_PAID_Condition()
{
    if (wpadka_Flint_Jarvis == true)
    && (MIS_FlintsOffer == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Tuersteher_ANGRY_LEFTY_PAID_Info()
{
    AI_Output (self, other ,"DIA_Tuersteher_ANGRY_LEFTY_PAID_03_01"); //Pozdrowienia od Lewusa, �cierwojadzie!
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
