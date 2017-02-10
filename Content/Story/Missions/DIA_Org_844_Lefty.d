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
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracujê dla Ry¿owego Ksiêcia.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakieœ zajêcie?
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
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hej! Jesteœ tu nowy, nie? Potrzebujê kogoœ, kto zaniesie wodê naszym zbieraczom ry¿u.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //W ten sposób od razu poznasz kilku ludzi. Zainteresowany?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,	"Lewus, zadufany w sobie Szkodnik z Nowego Obozu, chce, ¿ebym zaniós³ wodê zbieraczom ry¿u.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Mo¿e innym razem."				,DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Sam sobie noœ tê wodê!"	,DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Jasne, chêtnie wam pomogê."			,DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Jasne, chêtnie wam pomogê.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Œwietnie! IdŸ do Ry¿owego Ksiêcia. On da ci wodê i powie ci co nale¿y zrobiæ.
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,	"Nie jest to mo¿e zbyt zaszczytne zadanie, ale zyskam kilku przyjació³. Wodê dostanê od niejakiego Ry¿owego Ksiêcia.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Sam sobie noœ tê wodê!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Tak siê nie traktuje przyjació³! Widzê, ¿e muszê nauczyæ ciê dobrych manier!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,	"Lewus nieŸle siê wœciek³, gdy odrzuci³em jego 'propozycjê'! A myœla³em, ¿e w Starym Obozie by³o niebezpiecznie!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Mo¿e innym razem.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Innym razem mogê ciê ju¿ nie potrzebowaæ. Zdecyduj siê: chcesz mi pomóc czy nie?
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
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Masz ogromne szczêœcie! Postanowi³em daæ ci drug¹ szansê.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Ale tym razem postaraj siê tego nie spartaczyæ! IdŸ do Ry¿owego Ksiêcia, a potem roznieœ wodê wszystkim zbieraczom, jasne?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,	"Znowu wpad³em na Lewusa! Kaza³ mi zajrzeæ do Ry¿owego Ksiêcia i zanieœæ wodê zbieraczom na polach ry¿owych.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Przecie¿ kaza³em ci roznieœæ wodê zbieraczom!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nie lubiê ludzi, którzy coœ obiecuj¹, a potem nie dotrzymuj¹ s³owa!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,	"Lewus bardzo siê zez³oœci³, ¿e nie roznios³em jeszcze wody! Z tym goœciem bêd¹ jeszcze k³opoty!");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobra robota! Mo¿e bêd¹ z ciebie ludzie.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Widzê, ¿e jesteœ wprost stworzony do tego zadania! Od tej pory bêdziesz to robi³ codziennie. Bierz siê do roboty!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,	"Nie mogê w to uwierzyæ! Roznios³em wodê tak, jak mi kazano, ale Lewus oczekuje, ¿e bêdê to robi³ codziennie! Ten dureñ powinien chyba dostaæ nauczkê.");
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
	description	= "Od tej pory mo¿esz sam sobie biegaæ z t¹ wod¹!";
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
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Od tej pory mo¿esz sam sobie biegaæ z t¹ wod¹!
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Czy¿by? A co - masz coœ lepszego do roboty?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Chyba muszê ci przypomnieæ kto tu jest szefem!
	
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
	description	= "Co s³ychaæ, przyjacielu?";
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
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Co s³ychaæ, przyjacielu?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Cz³owieku! Czego chcesz?!

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,	"Wyjaœni³em Lewusowi, ¿e nie zamierzam ganiaæ w tê i z powrotem z wod¹ dla zbieraczy. Niektórzy ludzie musz¹ oberwaæ, zanim zrozumiej¹, co siê do nich mówi.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Chcia³em zobaczyæ, co u ciebie s³ychaæ."												,DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Zbieracze wygl¹daj¹ na spragnionych."														,DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Mam ochotê roz³adowaæ czêœæ drzemi¹cej we mnie z³oœci..."	,DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Mia³em paskudny dzieñ, i mam ochotê roz³adowaæ czêœæ drzemi¹cej we mnie z³oœci... Nie ruszaj siê przez chwilkê!
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Zbieracze wygl¹daj¹ na spragnionych.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Zajmê siê tym... Nie ma obawy.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Chcia³em zobaczyæ, co u ciebie s³ychaæ.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////
// Rozdzia³ 1
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
	description	= "Podobno wiêzisz myœliwego Josepa.";
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
	AI_Output (other, self,"DIA_Lefty_WhatDidJosep_15_00"); //Podobno wiêzisz myœliwego Josepa.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_01"); //Sam sobie ten los zgotowa³...
	AI_Output (other, self,"DIA_Lefty_WhatDidJosep_15_02"); //Móg³byœ jaœniej?
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_03"); //Sukinsyn próbowa³ okraœæ nasz magazyn. Na szczêœcie go przy³apa³em podczas nocnej warty.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_04"); //Chcia³em od razu odci¹æ mu ³apy, jednak nagle zjawi³ siê Torlof i kaza³ zostawiæ go w spokoju.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_05"); //Powiedzia³ tylko, ¿e ten cz³owiek jest zbyt cenny, ¿eby robiæ mu krzywdê. Podobno to jakiœ myœliwy dobrze znaj¹cy swoje rzemios³o.
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_06"); //Zaprowadziliœmy wiec go do Laresa. Szef zaproponowa³ mu do³¹czenie do Szkodników. I wiesz co ten dupek zrobi³?
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_07"); //Odrzuci³ propozycjê!
	AI_Output (self, other,"DIA_Lefty_WhatDidJosep_07_08"); //Bezczelny typ. Teraz jest moim robotnikiem. Nie ma szans ¿ebym go wypuœci³. Nie po tym co zrobi³.

	B_LogEntry               (CH1_MissedJosep,"Lewus nie ma najmniejszego zamiaru wypuœciæ Josepa. Myœliwy za bardzo zaszed³ mu za skórê. Muszê wymyœliæ coœ innego. Nie podoba mi siê, ¿e Josep nie wspomnia³, ¿e próbowa³ okraœæ magazyn Szkodników.");
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
	description	= "Lepiej wypuœæ Josepa.";
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
	AI_Output (other, self,"DIA_Lefty_Zick_15_00"); //Lepiej wypuœæ Josepa.
	AI_Output (self, other,"DIA_Lefty_Zick_07_01"); //Bo co mi zrobisz?
	AI_Output (other, self,"DIA_Lefty_Zick_15_02"); //Tobie nic, ale twój bratanek Zick mo¿e ucierpieæ. 
	AI_Output (self, other,"DIA_Lefty_Zick_07_03"); //Co? Gdzie on jest?
	AI_Output (other, self,"DIA_Lefty_Zick_15_04"); //Na razie mi³o spêdza czas z Rene, ale to siê mo¿e zmieniæ.
	AI_Output (self, other,"DIA_Lefty_Zick_07_04"); //Rene? Ten sukinsyn! Zabieraj tego myœliwego, tylko najpierw ka¿ temu psychopacie zostawiæ Zicka!
	
	B_LogEntry               (CH1_MissedJosep,"Lewus nieco zmiêk³. Pozwoli³ mi zabraæ Josepa, jednak najpierw mam kazaæ wróciæ Rene i Zickowi do obozu.");
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
	description	= "Twój bratanek wróci³ do obozu.";
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
	AI_Output (other, self,"DIA_Lefty_Free_15_00"); //Twój bratanek wróci³ do obozu.
	AI_Output (self, other,"DIA_Lefty_Free_07_01"); //To dobrze...
	AI_Output (other, self,"DIA_Lefty_Free_15_02"); //Co z nasz¹ umow¹?
	AI_Output (self, other,"DIA_Lefty_Free_07_03"); //Dotrzymam jej. PrzyjdŸ jutro do mnie, a wydam ci Josepa.
	AI_Output (other, self,"DIA_Lefty_Free_15_04"); //Czemu nie dzisiaj? Tego nie by³o w umowie.
	AI_Output (self, other,"DIA_Lefty_Free_07_04"); //Ee... Muszê przecie¿ poinformowaæ o tym Laresa. Pomyœl! Po prostu zg³oœ siê do mnie jutro.
	
	B_LogEntry               (CH1_MissedJosep,"Lewus kaza³ mi odczekaæ jeden dzieñ zanim bêdê móg³ zabraæ Josepa. Mam siê do niego zg³osiæ jutro.");
	
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
	description	= "Wypuœæ Josepa!";
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
	AI_Output (other, self,"DIA_Lefty_NowFree_15_00"); //Wypuœæ Josepa!
	AI_Output (self, other,"DIA_Lefty_NowFree_07_01"); //Jest wolny. IdŸ po niego i zabierajcie siê st¹d.
	AI_Output (self, other,"DIA_Lefty_NowFree_07_02"); //Jeœli jeszcze raz go tu zobaczê, to nie uratuje go nawet wstawiennictwo Magów Wody! 
	AI_Output (self, other,"DIA_Lefty_NowFree_07_03"); //A teraz precz!
	
	B_LogEntry               (CH1_MissedJosep,"Zjawi³em siê nastêpnego dnia u Lewusa. Pozwoli³ mi zabraæ z obozu Josepa.");
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (ORG_823_Zick,"party");
	AI_Teleport (ORG_823_Zick,"OW_PATH_066");
	Wld_InsertNpc (ORG_895_Organisator,"OW_PATH_066");
	Wld_InsertNpc (ORG_896_Organisator,"OW_PATH_066");
};
 
/////////////////////////////////////////////////////
// Rozdzia³ 4
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
	description = "Co siê tutaj dzieje?";
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
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_01"); //Co siê tutaj dzieje?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_02"); //Pytasz co siê tutaj dzieje? Mamy wszyscy du¿e k³opoty, ot co!
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_03"); //Doprawdy? Ja te¿ mam k³opoty?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_04"); //Przecie¿ powiedzia³em, ¿e wszyscy.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_05"); //Ostatniego poranka Zbieracze odmówili pracy na polach ry¿owych. Za¿¹dali, aby 'moi siepacze' wynieœli siê z pola.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_06"); //Dasz wiarê? Nazwali moich ludzi siepaczami.
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_07"); //Wola³bym, ¿ebyœ skupi³ siê na faktach, a swoje komentarze na razie zachowa³ dla siebie.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_08"); //No, dobra, dobra... Mówi¹c w uproszczeniu domagaj¹ siê tak¿e podwojonych racji ¿ywnoœciowych i krótszego czasu pracy.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_09"); //Nie mogê na to pozwoliæ. Inaczej te sukinsyny wejd¹ nam na g³owê. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_10"); //WyobraŸ sobie co by by³o, gdyby taki nie³ad panowa³ w którejœ z kopalni.
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_11"); //Czyli na razie Zbieracze tylko wstrzymali pracê i przedstawili swoje postulaty? Wci¹¿ nie rozumiem, dlaczego to te¿ mój problem?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_12"); //Taki stan rzeczy nie mo¿e d³ugo trwaæ. Inaczej w obozie skoñczy siê ¿ywnoœæ. Ry¿ jest podstaw¹ w tej czêœci Kolonii.
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_13"); //Zw³aszcza teraz, gdy jesteœmy prawie odciêci od towarów ze Œwiata Zewnêtrznego. Stra¿nicy coraz lepiej zabezpieczaj¹ konwoje, znaj¹ nasze œcie¿ki...
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_14"); //To mo¿e wszystkim powa¿nie zaszkodziæ. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_15"); //Jeœli nie odci¹gniemy Zbieraczy od tego naiwnego buntu, wkrótce dojdzie do konfrontacji. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_16"); //Poleje siê krew, a ja stracê zarówno zaufanych ludzi jak i pracowników. Chcesz na to pozwoliæ?
	AI_Output (other, self,"DIA_Lefty_AbouRebelion_15_17"); //Za³ó¿my, ¿e masz racjê. Co mia³bym zrobiæ, ¿eby to powstrzymaæ?
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_18"); //Buntownicy wybrali Rufusa jako przywódcê. Porozmawiaj z nim. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_19"); //Zaproponuj im dodatkow¹ porcjê miêsa raz w tygodniu, jeœli tylko wróc¹ do pracy. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_20"); //Powiedz te¿, ¿e jeœli przystan¹ na nasze warunki, nie wci¹gniemy ¿adnych konsekwencji.

	Quest_TalkWithRufus = LOG_RUNNING;
	
	if (MIS_BuntZbieraczy != LOG_RUNNING) || (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
	MIS_BuntZbieraczy = LOG_RUNNING;
	Log_CreateTopic     (CH1_BuntZbieraczy, LOG_MISSION);
    Log_SetTopicStatus  (CH1_BuntZbieraczy, LOG_RUNNING);
	B_LogEntry    		(CH1_BuntZbieraczy,"Lewus powiedzia³, ¿e popieraj¹c buntowników pope³niê olbrzymi b³¹d. Jeœli nie chcê dopuœciæ do rozlewu krwi, powinienem porozmawiaæ z Rufusem i przedstawiæ mu pokojow¹ propozycjê Lewusa. Wci¹¿ jeszcze mogê wybraæ, po której stronie konfliktu siê opowiem.");
	}
	else if (MIS_BuntZbieraczy == LOG_RUNNING)
	{
	B_LogEntry    		(CH1_BuntZbieraczy,"Lewus powiedzia³, ¿e popieraj¹c buntowników pope³niê olbrzymi b³¹d. Jeœli nie chcê dopuœciæ do rozlewu krwi, powinienem porozmawiaæ z Rufusem i przedstawiæ mu pokojow¹ propozycjê Lewusa. Wci¹¿ jeszcze mogê wybraæ, po której stronie konfliktu siê opowiem.");
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
   description	= "Twoje dni s¹ policzone.";
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
    AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_15_01"); //Twoje dni s¹ policzone.
    AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_03_02"); //Przyszed³eœ tu ¿eby mi groziæ? A jesteœ chocia¿ w stanie poprzeæ s³owa czynami?
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Jesteœ œmieciem, który zbudowa³ swoj¹ reputacjê na krzywdzie innych...",DIA_Lefty_RufusIsMyFriend_Reputation); //jeœli wybierzemy tê opcjê po wykonaniu zleceñ dla Rufusa Lewus zaatakuje nas za magazynem
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"A czy ty bez swoich siepaczy by³byœ w stanie zrobiæ to samo?",DIA_Lefty_RufusIsMyFriend_Guys);//jeœli wybierzemy tê opcjê po wykonaniu zleceñ dla Rufusa bêdziemy mogli w³amaæ siê do magazynu (tylko Najemnik) lub okraœæ Ksiêcia i sk³óciæ go z Lewusem
};
	
FUNC VOID DIA_Lefty_RufusIsMyFriend_Reputation ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Reputation_15_01"); //Owszem. To ju¿ koniec twojej tyranii. Jesteœ œmieciem, który zbudowa³ swoj¹ reputacjê na krzywdzie innych, s³abszych od siebie.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_02"); //A¿ dziwne, ¿e jeszcze ¿yjesz... Ty chyba nie zdajesz sobie sprawy gdzie jesteœ.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_03"); //Ci ludzie to mordercy, z³odzieje i najgorsze szumowiny jakie chodzi³y po Myrtanie. Niby czemu mia³bym siê nad nimi litowaæ?
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_04"); //Dlaczego mia³by mnie obchodziæ los tych sukinsynów?
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Reputation_15_05"); //A pewnie ty trafi³eœ tu bez powodu?
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_06"); //Uwierz mi, ¿e nie jestem tu najgorszy. Zreszt¹, staj¹c po stronie buntowników udowodni³eœ, ¿e jesteœ za g³upi, ¿eby to zrozumieæ.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Reputation_03_07"); //Altruizm wcale nie pop³aca w tym wielkim wiêzieniu. 
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Masz racjê. (Zostañ stronnikiem Lewusa)",DIA_Lefty_RufusIsMyFriend_LeftyFriend);
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Twoje dni s¹ policzone. (Zostañ buntownikiem)",DIA_Lefty_RufusIsMyFriend_Rebeliant);
	
	Rebel_Consequences = LeftyAndLordDeath;
};
 
FUNC VOID DIA_Lefty_RufusIsMyFriend_Guys ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Guys_15_01"); //A czy ty bez swoich siepaczy by³byœ w stanie zrobiæ to samo?
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Guys_03_02"); //Broni¹ jednych s¹ pieœci, a innych - umys³. Dostrze¿ to!
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Masz racjê. (Zostañ stronnikiem Lewusa)",DIA_Lefty_RufusIsMyFriend_LeftyFriend);
	Info_AddChoice		(DIA_Lefty_RufusIsMyFriend,"Twoje dni s¹ policzone. (Zostañ buntownikiem)",DIA_Lefty_RufusIsMyFriend_Rebeliant);
	
	Rebel_Consequences = LeftyDeath;
};

FUNC VOID DIA_Lefty_RufusIsMyFriend_LeftyFriend ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_15_01"); //Masz racjê.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_02"); //Dobrze, ¿e to zauwa¿y³eœ. Ale czy to znaczy, ¿e mogê na ciebie liczyæ?
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_04"); //W porz¹dku. Spróbujemy to zrobiæ bez niepotrzebnego przelewu krwi. 
	
	if (Quest_TalkWithRufus == LOG_RUNNING)
	{
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_05"); //Pamiêtasz jak ci mówi³em, ¿e powinniœmy pertraktowaæ? Mia³eœ w tym celu pogadaæ z Rufusem. 
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_LeftyFriend_03_06"); //Zrób to.
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Zdecydowa³em siê stan¹æ po stronie Lewusa. Powinienem teraz wykonaæ zadanie, które niedawno mi powierzy³. Mam przekazaæ propozycjê ugody Rufusowi.");
	}
	else
	{
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_18"); //Buntownicy wybrali Rufusa jako przywódcê. Porozmawiaj z nim. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_19"); //Zaproponuj im dodatkow¹ porcjê miêsa raz w tygodniu, jeœli tylko wróc¹ do pracy. 
	AI_Output (self, other,"DIA_Lefty_AbouRebelion_03_20"); //Powiedz te¿, ¿e jeœli przystan¹ na nasze warunki, nie wci¹gniemy ¿adnych konsekwencji.
	
	Quest_TalkWithRufus = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Zdecydowa³em siê stan¹æ po stronie Lewusa. Bunt powinien zostaæ szybko st³umiony bez rozlewu krwi. Powinienem teraz porozmawiaæ z Rufusem i przedstawiæ mu pokojow¹ propozycjê Lewusa. ");
	
	};
	Quest_GiveOffense = LOG_FAILED;
	
	Info_ClearChoices	(DIA_Lefty_RufusIsMyFriend );
	
	Rebel_HerosBoss = Boss_Lefty;
	if !LeftyWasBeaten
	{
	B_LogEntry			(CH1_CarryWater,	"ZaprzyjaŸni³em siê z Lewusem, wiêc nie bêdê ju¿ musia³ nosiæ za niego wody.");
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
	B_GiveXP			(XP_LeftyConfronted);
	};
};

FUNC VOID DIA_Lefty_RufusIsMyFriend_Rebeliant ()
{
	AI_Output (other, self ,"DIA_Lefty_RufusIsMyFriend_Rebeliant_15_01"); //Twoje dni s¹ policzone.
	AI_Output (self, other ,"DIA_Lefty_RufusIsMyFriend_Rebeliant_03_02"); //Przekonamy siê!
	
	Quest_GiveOffense = LOG_SUCCESS;
	
	Quest_TalkWithRufus = LOG_FAILED;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Stan¹³em po stronie buntowników. Ten wyzysk musi siê w wreszcie zakoñczyæ. Obrazi³em Lewusa dziêki czemu zyska³em zaufanie Rufusa. Muszê ponownie z nim pogadaæ.");
	
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
   description	= "Przysy³a mnie Homer, mam dla ciebie ry¿ówkê.";
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
    AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_01"); //Przysy³a mnie Homer, mam dla ciebie ry¿ówkê.
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_02"); //No w koñcu! Ale zaraz...
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_03"); //Od kiedy Homer wysy³a ch³opców na posy³ki?
    AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_04"); //Jest bardzo zajêty spraw¹ tamy. S³ysza³eœ na pewno o topielcu.
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_05"); //No tak. Niech ci bêdzie.
    AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_06"); //Dawaj te butelki. Mam nadziejê, ¿e zm¹drza³eœ i nie zadajesz siê ju¿ z buntownikami.
	AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_0X"); //Gdybyœ mi wtedy pomóg³, pi³byœ teraz z nami.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_07"); //Trzymaj.
        B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
		DIA_Lefty_ALCO_BUNT.permanent = false;
        b_givexp (50);
    }
    else
    {
        AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_08"); //Ty sukinsynu! Próbujesz mnie oszukaæ?! Mia³y byæ trzy butelki. 
        AI_Output (self, other ,"DIA_Lefty_ALCO_BUNT_03_09"); //Homer nie bêdzie zadowolony.
        AI_Output (other, self ,"DIA_Lefty_ALCO_BUNT_15_10"); //Spokojnie. Pewnie gdzieœ mi wypad³a. Zaraz wrócê. 
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
    AI_Output (self, other ,"DIA_Lefty_LastFight_03_01"); //Niczego siê nie nauczy³eœ. Posun¹³eœ siê za daleko.
    AI_Output (self, other ,"DIA_Lefty_LastFight_03_02"); //A to oznacza twój koniec.
    
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
	
	B_LogEntry   (CH1_BuntZbieraczy,"Wœciek³y Lewus rzuci³ siê na mnie. Pora siê z nim zmierzyæ.");
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
   description	= "Rufus odrzuci³ twoj¹ propozycjê.";
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
    AI_Output (other, self ,"DIA_Lefty_RufusRefused_15_01"); //Rufus odrzuci³ twoj¹ propozycjê.
    AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_02"); //Dureñ, œci¹gn¹³ w³aœnie na siebie zgubê. 
	AI_Output (other, self ,"DIA_Lefty_RufusRefused_15_03"); //Chcesz go zabiæ?
	AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_04"); //Dam mu jeszcze jedn¹ szansê. Spróbujemy 'rozbroiæ' ten bunt.
	AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_05"); //Zaczniemy od zredukowania liczby jego przyjació³. Masz tu dwieœcie bry³ek rudy.
	AI_Output (self, other ,"DIA_Lefty_RufusRefused_03_06"); //Na pocz¹tek przekup czterech goœci. Ciekawe czy to go zmiêkczy.
	
	Quest_CorruptRebels = LOG_RUNNING;
	
	CreateInvItems (self, itminugget, 200);
	B_GiveInvItems (self, hero, itminugget, 200);
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Lewus da³ mi dwieœcie bry³ek rudy i kaza³ przekupiæ czterech dowolnych Zbieraczy.");
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
   description	= "Przekupi³em kilku Zbieraczy.";
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
    AI_Output (other, self ,"DIA_Lefty_Corrupted_15_01"); //Przekupi³em kilku Zbieraczy.
    AI_Output (self, other ,"DIA_Lefty_Corrupted_03_02"); //Doskonale, to namiesza buntownikom w g³owach.
	AI_Output (other, self ,"DIA_Lefty_Corrupted_15_03"); //Czy to wystarczy?
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_04"); //Nie s¹dzê. Trzeba im bardziej namieszaæ. Dowiedzia³em siê, ¿e pewien cz³owiek z Kot³a potajemnie gromadzi broñ dla buntowników. 
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_05"); //ZnajdŸ go i nastrasz. Powiedz, ¿e ma zniszczyæ ca³¹ dostawê, inaczej bêdzie mia³ k³opoty.
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_06"); //Goœæ nazywa siê Senyan. Tak siê sk³ada, ¿e akurat jest w karczmie. Chyba przepija zarobion¹ rudê.
	AI_Output (self, other ,"DIA_Lefty_Corrupted_03_07"); //To nie powinno byæ trudne.
	
	Quest_CorruptRebels = LOG_SUCCESS;
	
	Quest_TakeWeaponsDelivery = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Senyan to cz³owiek, który organizuje dostawy broni dla buntowników. Mam go odwiedziæ i nastraszyæ. Podobno jest w karczmie na jeziorze.");
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
   description	= "Broñ nie trafi do buntowników.";
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
    AI_Output (other, self ,"DIA_Lefty_WeaponsDestroyed_15_01"); //Broñ nie trafi do buntowników. Senyan ³atwo da³ siê przekonaæ.
    AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_02"); //Mówi³em, ¿e to nie bêdzie trudne. Czeka ciê jeszcze jedna wyprawa do karczmy.
	AI_Output (other, self ,"DIA_Lefty_WeaponsDestroyed_15_03"); //Po co tym razem?
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_04"); //A to ciê rozbawi. Jeden z tych, których przekupi³eœ opowiedzia³ mi o planie Rufusa.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_05"); //Wiesz, Homer dostarcza nam codziennie po trzy butelki ry¿ówki z karczmy. Buntownicy chcieli tê ry¿ówkê podmieniæ na 'specja³' Jeremiasza.
	AI_Output (other, self ,"DIA_Lefty_WeaponsDestroyed_15_06"); //Co by tym osi¹gnêli?
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_07"); //Liczyli, ¿e pijani pójdziemy spaæ, a wtedy oni poder¿n¹ nam gard³a we œnie. Ha! Ha! Ha!
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_08"); //W ¿yciu wiêkszej g³upoty nie s³ysza³em. Zreszt¹ mam twardsz¹ g³owê, ni¿ im siê wydaje.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_09"); //Zrobisz tak: pójdziesz do Torlofa i powiesz mu, ¿e Jeremiasz ma niezgodnoœæ w iloœci towaru.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_10"); //Torlof jest Najemnikiem odpowiedzialnym za porz¹dek w karczmie. Gdyby Najemnicy tego nie pilnowali, by³by tam niez³y bajzel.
	AI_Output (self, other ,"DIA_Lefty_WeaponsDestroyed_03_11"); //Silas kiedyœ czêstowa³ darmowym napitkiem wszystkich swoich kolesi. Ale to stare dzieje...
	
	Quest_EliminateJeremiah = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Buntownicy maj¹ jakiœ œmieszny plan zwi¹zany z alkoholem i upiciem ludzi Lewusa. Mam to ukróciæ wspominaj¹c Torlofowi o nieœcis³oœciach w karczmie.");
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
   description	= "Rozmawia³em z Torlofem.";
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
    AI_Output (other, self ,"DIA_Lefty_TalkWithTorlof_15_01"); //Rozmawia³em z Torlofem.
    AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_02"); //Zajmie siê tym?
	AI_Output (other, self ,"DIA_Lefty_TalkWithTorlof_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_04"); //Wiêc koñczmy ten ca³y bajzel. Buntownicy prawie dali za wygran¹. Jedynie Rufus ich podburza.
	AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_05"); //Trzeba siê go pozbyæ. Zabij go, a wtedy to wszystko siê wreszcie skoñczy.
	AI_Output (self, other ,"DIA_Lefty_TalkWithTorlof_03_06"); //Nie chcia³ wykorzystaæ swojej szansy, jego sprawa! No, ruszaj siê. 
	
	Quest_KillRufus = LOG_RUNNING;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Moim ostatnim zadaniem jest zabicie Rufusa, przywódcy buntowników. Wed³ug Lewusa to zakoñczy tê ca³¹ farsê.");
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
   description	= "Rufus nie ¿yje.";
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
    AI_Output (other, self ,"DIA_Lefty_RufusDie_15_01"); //Rufus nie ¿yje.
    AI_Output (self, other ,"DIA_Lefty_RufusDie_03_02"); //Nareszcie koniec tej œmiesznej rebelii. Przyznam, ¿e mia³eœ swój du¿y wk³ad w tym, ¿e zginê³a tylko jedna osoba.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_03"); //Gdybym da³ moim ch³opcom woln¹ rêkê, pewnie wyr¿nêliby po³owê tych brudasów.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_04"); //A nowych porwalibyœmy z obozu przy Starej Kopalni. To mog³o byæ niez³e.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_05"); //Damy im dodatkow¹ porcjê miêsa w tygodniu i zobaczysz jacy bêd¹ zadowoleni, he he.
	AI_Output (self, other ,"DIA_Lefty_RufusDie_03_06"); //Pamiêtaj, ¿e co z³ego to nie ja. Masz tu coœ za pomoc, ¿eby ci ³atwiej by³o zapamiêtaæ.
	
	CreateInvItems (self, itminugget, 300);
	B_GiveInvItems (self, hero, itminugget, 300);
	
	B_GiveXP (750);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry                     (CH1_BuntZbieraczy,"Po œmierci Rufusa wszyscy wrócili do pracy, a Lewus i Ry¿owy Ksi¹¿ê wci¹¿ zajmuj¹ siê pilnowaniem wszystkiego na polach ry¿owych.");

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
    AI_Output (self, other ,"DIA_Lefty_JARVIS_CO_OP_03_01"); //Jarvis mi o wszystkim powiedzia³!
    AI_Output (self, other ,"DIA_Lefty_JARVIS_CO_OP_03_02"); //KNUJESZ ZA MOIMI PLECAMI!
    AI_Output (self, other ,"DIA_Lefty_JARVIS_CO_OP_03_03"); //Gdzie jest mój cz³owiek, sukinsynu?!
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
    AI_Output (self, other ,"DIA_Tuersteher_ANGRY_LEFTY_PAID_03_01"); //Pozdrowienia od Lewusa, œcierwojadzie!
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
