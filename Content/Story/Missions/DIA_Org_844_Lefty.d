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
	&&	(Rebel_HerosBoss != Boss_Lefty)
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
	&&	(Rebel_HerosBoss != Boss_Lefty)
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
	nr			= 800;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Od tej pory mo�esz sam sobie biega� z t� wod�!";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) ) &&	(Rebel_HerosBoss != Boss_Lefty)
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

///////////////////////////////////////////////
// Rozdzia� 1
// Zadanie z Josepem
// Dialogi kluczowe
///////////////////////////////////////////////

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
 
/////////////////////////////////////////////////////
// Rozdzia� 4
// Bunt zbieraczy
// Dialogi kluczowe
// Zadania
/////////////////////////////////////////////////////

///////////////////////////////////////////////
// 			What's up
///////////////////////////////////////////////

instance DIA_Lefty_AbouRebelion (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_AbouRebelion_Condition;
	information	= DIA_Lefty_AbouRebelion_Info;
	permanent	= 0;
	description = "Co si� tutaj dzieje?";
};                       

FUNC int DIA_Lefty_AbouRebelion_Condition()
{
	if	(Mod_Story_RunRebelInNC == TRUE) && (Quest_TalkWithRufus != LOG_RUNNING) && (MIS_BuntZbieraczy != LOG_SUCCESS) && (!Npc_KnowsInfo (hero,DIA_Rufus_Rebel))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_AbouRebelion_Info()
{
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_01"); //Co si� tutaj dzieje?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_02"); //Pytasz co si� tutaj dzieje? Mamy wszyscy du�e k�opoty, ot co!
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_03"); //Doprawdy? Ja te� mam k�opoty?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_04"); //Przecie� powiedzia�em, �e wszyscy.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_05"); //Ostatniego poranka Zbieracze odm�wili pracy na polach ry�owych. Za��dali, aby 'moi siepacze' wynie�li si� z pola.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_06"); //Dasz wiar�? Nazwali moich ludzi siepaczami.
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_07"); //Wola�bym, �eby� skupi� si� na faktach, a swoje komentarze na razie zachowa� dla siebie.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_08"); //No, dobra, dobra... M�wi�c w uproszczeniu domagaj� si� tak�e podwojonych racji �ywno�ciowych i kr�tszego czasu pracy.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_09"); //Nie mog� na to pozwoli�. Inaczej te sukinsyny wejd� nam na g�ow�. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_10"); //Wyobra� sobie co by by�o, gdyby taki nie�ad panowa� w kt�rej� z kopalni.
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_11"); //Czyli na razie Zbieracze tylko wstrzymali prac� i przedstawili swoje postulaty? Wci�� nie rozumiem, dlaczego to te� m�j problem?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_12"); //Taki stan rzeczy nie mo�e d�ugo trwa�. Inaczej w obozie sko�czy si� �ywno��. Ry� jest podstaw� w tej cz�ci Kolonii.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_13"); //Zw�aszcza teraz, gdy jeste�my prawie odci�ci od towar�w ze �wiata Zewn�trznego. Stra�nicy coraz lepiej zabezpieczaj� konwoje, znaj� nasze �cie�ki...
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_14"); //To mo�e wszystkim powa�nie zaszkodzi�. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_15"); //Je�li nie odci�gniemy Zbieraczy od tego naiwnego buntu, wkr�tce dojdzie do konfrontacji. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_16"); //Poleje si� krew, a ja strac� zar�wno zaufanych ludzi jak i pracownik�w. Chcesz na to pozwoli�?
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_17"); //Za��my, �e masz racj�. Co mia�bym zrobi�, �eby to powstrzyma�?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_18"); //Buntownicy wybrali Rufusa jako przyw�dc�. Porozmawiaj z nim. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_19"); //Zaproponuj im dodatkow� porcj� mi�sa raz w tygodniu, je�li tylko wr�c� do pracy. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_20"); //Powiedz te�, �e je�li przystan� na nasze warunki, nie wci�gniemy �adnych konsekwencji.

	Quest_TalkWithRufus = LOG_RUNNING;
	
	if (MIS_BuntZbieraczy != LOG_RUNNING) || (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
	MIS_BuntZbieraczy = LOG_RUNNING;
	Log_CreateTopic     (CH1_BuntZbieraczy, LOG_MISSION);
    Log_SetTopicStatus  (CH1_BuntZbieraczy, LOG_RUNNING);
	B_LogEntry    		(CH1_BuntZbieraczy,"Lewus powiedzia�, �e popieraj�c buntownik�w pope�ni� olbrzymi b��d. Je�li nie chc� dopu�ci� do rozlewu krwi, powinienem porozmawia� z Rufusem i przedstawi� mu pokojow� propozycj� Lewusa. Wci�� jeszcze mog� wybra�, po kt�rej stronie konfliktu si� opowiem.");
	}
	else if (MIS_BuntZbieraczy == LOG_RUNNING)
	{
	B_LogEntry    		(CH1_BuntZbieraczy,"Lewus powiedzia�, �e popieraj�c buntownik�w pope�ni� olbrzymi b��d. Je�li nie chc� dopu�ci� do rozlewu krwi, powinienem porozmawia� z Rufusem i przedstawi� mu pokojow� propozycj� Lewusa. Wci�� jeszcze mog� wybra�, po kt�rej stronie konfliktu si� opowiem.");
	};	
	
};

///////////////////////////////////////////
//		Rufus is my friend
///////////////////////////////////////////

INSTANCE DIA_Lefty_RufusIsMyFriend (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_RufusIsMyFriend_Condition;
   information  = DIA_Lefty_RufusIsMyFriend_Info;
   permanent	= FALSE;
   description	= "Twoje dni s� policzone.";
};

FUNC INT DIA_Lefty_RufusIsMyFriend_Condition()
{
    if (Quest_GiveOffense == LOG_RUNNING) && (Rebel_HerosBoss != Boss_Lefty) && (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_RufusIsMyFriend_Info()
{
    AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_15_01"); //Twoje dni s� policzone.
    AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_03_02"); //Przyszed�e� tu �eby mi grozi�? A jeste� chocia� w stanie poprze� s�owa czynami?
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Jeste� �mieciem, kt�ry zbudowa� swoj� reputacj� na krzywdzie innych...",DIA_Lefty_RufusIsMyFriend_Reputation); //je�li wybierzemy t� opcj� po wykonaniu zlece� dla Rufusa Lewus zaatakuje nas za magazynem
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"A czy ty bez swoich siepaczy by�by� w stanie zrobi� to samo?",DIA_Lefty_RufusIsMyFriend_Guys);//je�li wybierzemy t� opcj� po wykonaniu zlece� dla Rufusa b�dziemy mogli w�ama� si� do magazynu (tylko Najemnik) lub okra�� Ksi�cia i sk��ci� go z Lewusem
};
	
FUNC VOID DIA_Lefty_RufusIsMyFriend_Reputation ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Reputation_15_01"); //Owszem. To ju� koniec twojej tyranii. Jeste� �mieciem, kt�ry zbudowa� swoj� reputacj� na krzywdzie innych, s�abszych od siebie.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_02"); //A� dziwne, �e jeszcze �yjesz... Ty chyba nie zdajesz sobie sprawy gdzie jeste�.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_03"); //Ci ludzie to mordercy, z�odzieje i najgorsze szumowiny jakie chodzi�y po Myrtanie. Niby czemu mia�bym si� nad nimi litowa�?
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_04"); //Dlaczego mia�by mnie obchodzi� los tych sukinsyn�w?
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Reputation_15_05"); //A pewnie ty trafi�e� tu bez powodu?
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_06"); //Uwierz mi, �e nie jestem tu najgorszy. Zreszt�, staj�c po stronie buntownik�w udowodni�e�, �e jeste� za g�upi, �eby to zrozumie�.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_07"); //Altruizm wcale nie pop�aca w tym wielkim wi�zieniu. 
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Masz racj�. (Zosta� stronnikiem Lewusa)",DIA_Lefty_RufusIsMyFriend_LeftyFriend);
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Twoje dni s� policzone. (Zosta� buntownikiem)",DIA_Lefty_RufusIsMyFriend_Rebeliant);
	
	Rebel_Consequences = LeftyAndLordDeath;
};
 
FUNC VOID DIA_Lefty_RufusIsMyFriend_Guys ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Guys_15_01"); //A czy ty bez swoich siepaczy by�by� w stanie zrobi� to samo?
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Guys_03_02"); //Broni� jednych s� pie�ci, a innych - umys�. Dostrze� to!
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Masz racj�. (Zosta� stronnikiem Lewusa)",DIA_Lefty_RufusIsMyFriend_LeftyFriend);
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Twoje dni s� policzone. (Zosta� buntownikiem)",DIA_Lefty_RufusIsMyFriend_Rebeliant);
	
	Rebel_Consequences = LeftyDeath;
};

FUNC VOID DIA_Lefty_RufusIsMyFriend_LeftyFriend ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_15_01"); //Masz racj�.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_02"); //Dobrze, �e to zauwa�y�e�. Ale czy to znaczy, �e mog� na ciebie liczy�?
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_04"); //W porz�dku. Spr�bujemy to zrobi� bez niepotrzebnego przelewu krwi. 
	
	if (Quest_TalkWithRufus == LOG_RUNNING)
	{
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_05"); //Pami�tasz jak ci m�wi�em, �e powinni�my pertraktowa�? Mia�e� w tym celu pogada� z Rufusem. 
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_06"); //Zr�b to.
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Zdecydowa�em si� stan�� po stronie Lewusa. Powinienem teraz wykona� zadanie, kt�re niedawno mi powierzy�. Mam przekaza� propozycj� ugody Rufusowi.");
	}
	else
	{
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_18"); //Buntownicy wybrali Rufusa jako przyw�dc�. Porozmawiaj z nim. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_19"); //Zaproponuj im dodatkow� porcj� mi�sa raz w tygodniu, je�li tylko wr�c� do pracy. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_20"); //Powiedz te�, �e je�li przystan� na nasze warunki, nie wci�gniemy �adnych konsekwencji.
	
	Quest_TalkWithRufus = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Zdecydowa�em si� stan�� po stronie Lewusa. Bunt powinien zosta� szybko st�umiony bez rozlewu krwi. Powinienem teraz porozmawia� z Rufusem i przedstawi� mu pokojow� propozycj� Lewusa. ");
	
	};
	Quest_GiveOffense = LOG_FAILED;
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	
	Rebel_HerosBoss = Boss_Lefty;
	if !LeftyWasBeaten
	{
	B_LogEntry			(CH1_CarryWater,	"Zaprzyja�ni�em si� z Lewusem, wi�c nie b�d� ju� musia� nosi� za niego wody.");
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
	B_GiveXP			(XP_LeftyConfronted);
	};
};

FUNC VOID DIA_Lefty_RufusIsMyFriend_Rebeliant ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Rebeliant_15_01"); //Twoje dni s� policzone.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Rebeliant_03_02"); //Przekonamy si�!
	
	Quest_GiveOffense = LOG_SUCCESS;
	
	Quest_TalkWithRufus = LOG_FAILED;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Stan��em po stronie buntownik�w. Ten wyzysk musi si� w wreszcie zako�czy�. Obrazi�em Lewusa dzi�ki czemu zyska�em zaufanie Rufusa. Musz� ponownie z nim pogada�.");
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	
	Rebel_HerosBoss = Boss_Rufus;
};

/////////////////////////////////////////////
//		Alcohol
/////////////////////////////////////////////

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
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
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
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_06"); //Dawaj te butelki. Mam nadziej�, �e zm�drza�e� i nie zadajesz si� ju� z buntownikami.
	AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_0X"); //Gdyby� mi wtedy pom�g�, pi�by� teraz z nami.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_07"); //Trzymaj.
        B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
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

/////////////////////////////////////////////
//		Last Fight 
/////////////////////////////////////////////

INSTANCE DIA_Lefty_LastFight (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_LastFight_Condition;
   information  = DIA_Lefty_LastFight_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lefty_LastFight_Condition()
{
    if (Quest_KillLefty == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_LastFight_Info()
{
    AI_Output (self, other ,"DIA_Lefty_LastFight_03_01"); //Niczego si� nie nauczy�e�. Posun��e� si� za daleko.
    AI_Output (self, other ,"DIA_Lefty_LastFight_03_02"); //A to oznacza tw�j koniec.
    
	B_ChangeGuild (self, GIL_DMB);
	
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_ChangeGuild (Org_846_Schlaeger, GIL_DMB);
	B_ChangeGuild (Org_845_Schlaeger, GIL_DMB);
	B_ChangeGuild (BAU_900_Ricelord, GIL_DMB);
	B_ChangeGuild (BAU_908_Bauer, GIL_DMB);
	B_ChangeGuild (BAU_902_Pock, GIL_DMB);
	
	B_ChangeGuild (BAU_920_Bauer, GIL_DMB);
	B_ChangeGuild (BAU_922_Bauer, GIL_DMB);
	B_ChangeGuild (BAU_923_Bauer, GIL_DMB);
	B_ChangeGuild (BAU_924_Bauer, GIL_DMB);
	B_ChangeGuild (BAU_927_Bauer, GIL_DMB);
	
	B_LogEntry   (CH1_BuntZbieraczy,"W�ciek�y Lewus rzuci� si� na mnie. Pora si� z nim zmierzy�.");
};

///////////////////////////////////////////
//		Rufus refused
///////////////////////////////////////////

INSTANCE DIA_Lefty_RufusRefused (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_RufusRefused_Condition;
   information  = DIA_Lefty_RufusRefused_Info;
   permanent	= FALSE;
   description	= "Rufus odrzuci� twoj� propozycj�.";
};

FUNC INT DIA_Lefty_RufusRefused_Condition()
{
    if (Quest_TalkWithRufus == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_RufusRefused_Info()
{
    AI_Output (other, self ,"DIA_Lefty_RufusRefused_15_01"); //Rufus odrzuci� twoj� propozycj�.
    AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_02"); //Dure�, �ci�gn�� w�a�nie na siebie zgub�. 
	AI_Output (other, self ,"DIA_Lefty_RufusRefused_15_03"); //Chcesz go zabi�?
	AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_04"); //Dam mu jeszcze jedn� szans�. Spr�bujemy 'rozbroi�' ten bunt.
	AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_05"); //Zaczniemy od zredukowania liczby jego przyjaci�. Masz tu dwie�cie bry�ek rudy.
	AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_06"); //Na pocz�tek przekup czterech go�ci. Ciekawe czy to go zmi�kczy.
	
	Quest_CorruptRebels = LOG_RUNNING;
	
	CreateInvItems (self, itminugget, 200);
	B_GiveInvItems (self, hero, itminugget, 200);
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Lewus da� mi dwie�cie bry�ek rudy i kaza� przekupi� czterech dowolnych Zbieraczy.");
};

///////////////////////////////////////////
//		Corrupted
///////////////////////////////////////////

INSTANCE DIA_Lefty_Corrupted (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_Corrupted_Condition;
   information  = DIA_Lefty_Corrupted_Info;
   permanent	= FALSE;
   description	= "Przekupi�em kilku Zbieraczy.";
};

FUNC INT DIA_Lefty_Corrupted_Condition()
{
    if (Quest_CorruptRebels == LOG_RUNNING) && (CorruptedBauers >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_Corrupted_Info()
{
    AI_Output (other, self ,"DIA_Lefty_Corrupted_15_01"); //Przekupi�em kilku Zbieraczy.
    AI_Output (self, other ,"DIA_Lefty_Corrupted_03_02"); //Doskonale, to namiesza buntownikom w g�owach.
	AI_Output (other, self ,"DIA_Lefty_Corrupted_15_03"); //Czy to wystarczy?
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_04"); //Nie s�dz�. Trzeba im bardziej namiesza�. Dowiedzia�em si�, �e pewien cz�owiek z Kot�a potajemnie gromadzi bro� dla buntownik�w. 
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_05"); //Znajd� go i nastrasz. Powiedz, �e ma zniszczy� ca�� dostaw�, inaczej b�dzie mia� k�opoty.
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_06"); //Go�� nazywa si� Senyan. Tak si� sk�ada, �e akurat jest w karczmie. Chyba przepija zarobion� rud�.
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_07"); //To nie powinno by� trudne.
	
	Quest_CorruptRebels = LOG_SUCCESS;
	
	Quest_TakeWeaponsDelivery = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Senyan to cz�owiek, kt�ry organizuje dostawy broni dla buntownik�w. Mam go odwiedzi� i nastraszy�. Podobno jest w karczmie na jeziorze.");
};

///////////////////////////////////////////
//		WeaponsDestroyed
///////////////////////////////////////////

INSTANCE DIA_Lefty_WeaponsDestroyed (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_WeaponsDestroyed_Condition;
   information  = DIA_Lefty_WeaponsDestroyed_Info;
   permanent	= FALSE;
   description	= "Bro� nie trafi do buntownik�w.";
};

FUNC INT DIA_Lefty_WeaponsDestroyed_Condition()
{
    if (Quest_TakeWeaponsDelivery == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_WeaponsDestroyed_Info()
{
    AI_Output (other, self ,"DIA_Lefty_WeaponsDestroyed_15_01"); //Bro� nie trafi do buntownik�w. Senyan �atwo da� si� przekona�.
    AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_02"); //M�wi�em, �e to nie b�dzie trudne. Czeka ci� jeszcze jedna wyprawa do karczmy.
	AI_Output (other, self ,"DIA_Lefty_WeaponsDestroyed_15_03"); //Po co tym razem?
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_04"); //A to ci� rozbawi. Jeden z tych, kt�rych przekupi�e� opowiedzia� mi o planie Rufusa.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_05"); //Wiesz, Homer dostarcza nam codziennie po trzy butelki ry��wki z karczmy. Buntownicy chcieli t� ry��wk� podmieni� na 'specja�' Jeremiasza.
	AI_Output (other, self ,"DIA_Lefty_WeaponsDestroyed_15_06"); //Co by tym osi�gn�li?
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_07"); //Liczyli, �e pijani p�jdziemy spa�, a wtedy oni poder�n� nam gard�a we �nie. Ha! Ha! Ha!
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_08"); //W �yciu wi�kszej g�upoty nie s�ysza�em. Zreszt� mam twardsz� g�ow�, ni� im si� wydaje.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_09"); //Zrobisz tak: p�jdziesz do Torlofa i powiesz mu, �e Jeremiasz ma niezgodno�� w ilo�ci towaru.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_10"); //Torlof jest Najemnikiem odpowiedzialnym za porz�dek w karczmie. Gdyby Najemnicy tego nie pilnowali, by�by tam niez�y bajzel.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_11"); //Silas kiedy� cz�stowa� darmowym napitkiem wszystkich swoich kolesi. Ale to stare dzieje...
	
	Quest_EliminateJeremiah = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Buntownicy maj� jaki� �mieszny plan zwi�zany z alkoholem i upiciem ludzi Lewusa. Mam to ukr�ci� wspominaj�c Torlofowi o nie�cis�o�ciach w karczmie.");
};

///////////////////////////////////////////
//		TalkWithTorlof
///////////////////////////////////////////

INSTANCE DIA_Lefty_TalkWithTorlof (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_TalkWithTorlof_Condition;
   information  = DIA_Lefty_TalkWithTorlof_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Torlofem.";
};

FUNC INT DIA_Lefty_TalkWithTorlof_Condition()
{
    if (Quest_EliminateJeremiah == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_TalkWithTorlof_Info()
{
    AI_Output (other, self ,"DIA_Lefty_TalkWithTorlof_15_01"); //Rozmawia�em z Torlofem.
    AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_02"); //Zajmie si� tym?
	AI_Output (other, self ,"DIA_Lefty_TalkWithTorlof_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_04"); //Wi�c ko�czmy ten ca�y bajzel. Buntownicy prawie dali za wygran�. Jedynie Rufus ich podburza.
	AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_05"); //Trzeba si� go pozby�. Zabij go, a wtedy to wszystko si� wreszcie sko�czy.
	AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_06"); //Nie chcia� wykorzysta� swojej szansy, jego sprawa! No, ruszaj si�. 
	
	Quest_KillRufus = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Moim ostatnim zadaniem jest zabicie Rufusa, przyw�dcy buntownik�w. Wed�ug Lewusa to zako�czy t� ca�� fars�.");
};

///////////////////////////////////////////
//		RufusDie
///////////////////////////////////////////

INSTANCE DIA_Lefty_RufusDie (C_INFO)
{
   npc          = Org_844_Lefty;
   nr           = 1;
   condition    = DIA_Lefty_RufusDie_Condition;
   information  = DIA_Lefty_RufusDie_Info;
   permanent	= FALSE;
   description	= "Rufus nie �yje.";
};

FUNC INT DIA_Lefty_RufusDie_Condition()
{
    if (Quest_KillRufus == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lefty_RufusDie_Info()
{
    AI_Output (other, self ,"DIA_Lefty_RufusDie_15_01"); //Rufus nie �yje.
    AI_Output (self, other ,"DIA_Lefty_RufusDie_03_02"); //Nareszcie koniec tej �miesznej rebelii. Przyznam, �e mia�e� sw�j du�y wk�ad w tym, �e zgin�a tylko jedna osoba.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_03"); //Gdybym da� moim ch�opcom woln� r�k�, pewnie wyr�n�liby po�ow� tych brudas�w.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_04"); //A nowych porwaliby�my z obozu przy Starej Kopalni. To mog�o by� niez�e.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_05"); //Damy im dodatkow� porcj� mi�sa w tygodniu i zobaczysz jacy b�d� zadowoleni, he he.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_06"); //Pami�taj, �e co z�ego to nie ja. Masz tu co� za pomoc, �eby ci �atwiej by�o zapami�ta�.
	
	CreateInvItems (self, itminugget, 300);
	B_GiveInvItems (self, hero, itminugget, 300);
	
	B_GiveXP (750);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry                     (CH1_BuntZbieraczy,"Po �mierci Rufusa wszyscy wr�cili do pracy, a Lewus i Ry�owy Ksi��� wci�� zajmuj� si� pilnowaniem wszystkiego na polach ry�owych.");

	B_Story_AfterBauRebellion ();
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
