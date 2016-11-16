// ****************************** 
//				EXIT 
// ******************************

INSTANCE   ORG_801_Lares_Exit (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 999;
	condition	= ORG_801_Lares_Exit_Condition;
	information	= ORG_801_Lares_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  ORG_801_Lares_Exit_Condition()
{
	return 1;
};

FUNC VOID  ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************** 
//			Wie hier rein?
// ******************************
	var int Lares_vorbeigemogelt;
// ******************************

INSTANCE ORG_801_Lares_YouHere (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 1;
	condition	= ORG_801_Lares_YouHere_Condition;
	information	= ORG_801_Lares_YouHere_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC int ORG_801_Lares_YouHere_Condition()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ( (Roscoe.aivar[AIV_PASSGATE]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_YouHere_Info()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ( (Npc_IsInState(Roscoe, ZS_MagicSleep)) || (Npc_GetTempAttitude(Roscoe,other)==ATT_FRIENDLY) )
	{
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_00"); //Jak si� tu dosta�e�? Co si� dzieje z Roscoe?
		AI_Output	(other, self,"ORG_801_Lares_YouHere_15_01"); //Wola� nie pr�bowa� mnie powstrzymywa�!
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_02"); //Czego chcesz?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP	(XP_CheatedIntoLaresHut);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	};
};

// ****************************** 
//			Wanna Join
// ******************************

INSTANCE ORG_801_Lares_WannaJoin (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 1;
	condition	= ORG_801_Lares_WannaJoin_Condition;
	information	= ORG_801_Lares_WannaJoin_Info;
	permanent	= 0;
	description = "Chc� do was do��czy�.";
};                       

FUNC int ORG_801_Lares_WannaJoin_Condition()
{
	if	((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK))
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_WannaJoin_Info()
{
	AI_Output (other, self,"ORG_801_Lares_WannaJoin_15_00"); //Chc� do was do��czy�.
	AI_Output (self, other,"ORG_801_Lares_WannaJoin_11_01"); //Tak? A co takiego mo�esz nam zaoferowa�?
};

// ****************************** 
//			Bring List
// ******************************
	var int Lares_BringListBack;
// ******************************

INSTANCE   ORG_801_Lares_BringList (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringList_Condition;
	information	= ORG_801_Lares_BringList_Info;
	permanent	= 0;
	description = "Mam przy sobie list� zam�wie� dla Starej Kopalni.";
};                       

FUNC int ORG_801_Lares_BringList_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Npc_HasItems(hero,TheList)) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringList_Info()
{
	AI_Output (other, self,"ORG_801_Lares_BringList_15_00"); //Mam przy sobie list� zam�wie� dla Starej Kopalni.
	AI_Output (self, other,"ORG_801_Lares_BringList_11_01"); //O niech mnie... Albo jeste� cholernie odwa�ny, albo cholernie g�upi...
	AI_Output (self, other,"ORG_801_Lares_BringList_11_02"); //Poka�!
	AI_Output (other, self,"ORG_801_Lares_BringList_15_03"); //Oto ona...
	B_UseFakeScroll();
	AI_Output (self, other,"ORG_801_Lares_BringList_11_04"); //Rzeczywi�cie! Wiesz, co z ni� teraz zrobimy? Dopiszemy par� rzeczy, a ty zaniesiesz j� do Starego Obozu!
	AI_Output (self, other,"ORG_801_Lares_BringList_11_05"); //A jak ju� dostarcz� wszystko do kopalni, obrabujemy ich ze wszystkiego! To nie zajmie d�ugo... Ha! Masz tu list�. Wiesz, co masz robi�.
	//AI_Output (self, other,"ORG_801_Lares_BringList_11_06"); //Das haben wir gleich ... So! Hier ist die Liste. Du wei�t, was du zu tun hast.
	
	Points_NC = Points_NC + 10;
	
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem		(hero,	TheList);
	CreateInvItem			(hero,	TheListNC);
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Przyw�dca Szkodnik�w by� zaskoczony, gdy wr�czy�em mu list� zam�wie�. Doda� do niej kilka rzeczy i kaza� mi dostarczy� j� Diego.");		
	B_GiveXP				(XP_GiveListToLares);	
};

// ****************************** 
//		List an Diego!
// ******************************

INSTANCE ORG_801_Lares_BringListBack (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringListBack_Condition;
	information	= ORG_801_Lares_BringListBack_Info;
	permanent	= 0;
	description = "Przekaza�em list� Diego.";
};                       

FUNC int ORG_801_Lares_BringListBack_Condition()
{
	if ( (Lares_BringListBack==LOG_RUNNING) && (Diego_BringList==LOG_SUCCESS) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringListBack_Info()
{
	AI_Output			(other, self,"ORG_801_Lares_BringListBack_15_00"); //Przekaza�em list� Diego.
	AI_Output			(self, other,"ORG_801_Lares_BringListBack_11_01"); //�wietnie! Rozmie�ci�em paru ludzi na drodze do Starej Kopalni. Stra�nicy Thorusa pewnie ju� gryz� ziemi�.
		
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;

	B_LogEntry			(CH1_JoinNC, "Ludzie Laresa obrabowali ju� konw�j ze Starego Obozu. Najwyra�niej przyw�dca Szkodnik�w nie zamierza� czeka� do mojego... a raczej NA WYPADEK mojego powrotu!");		

	B_GiveXP			(XP_ReportListDeliveryToLares);
};

// ****************************** 
//		Anteil wegen BringList
// ******************************

INSTANCE   ORG_801_Lares_BringListAnteil (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringListAnteil_Condition;
	information	= ORG_801_Lares_BringListAnteil_Info;
	permanent	= 0;
	description = "Napadli�cie ju� na konw�j?! A gdzie moja dola?!";
};                       

FUNC int ORG_801_Lares_BringListAnteil_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack)) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringListAnteil_Info()
{
	AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_00"); //Napadli�cie ju� na konw�j?! A gdzie moja dola?!
	AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_01"); //Pogadaj z Gornem. On ci co� da.
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	if (gorn.aivar[AIV_FINDABLE]==TRUE)
	{
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_02"); //Znam Gorna, ale on nie nale�y do waszej bandy. Jest Najemnikiem, pracuje dla Mag�w.
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_03"); //Zgadza si�.
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_04"); //To on te� macza� w tym palce?
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_05"); //Czasem lepiej jest nie wiedzie� za du�o. Id� do niego po swoj� nagrod�.
	};
	B_LogEntry(CH1_JoinNC, "Gorn uczestniczy� w jaki� spos�b w napadzie na konw�j. Mam od niego odebra� swoj� dol�.");
	gorn.aivar[AIV_FINDABLE]==TRUE;
};

// ****************************** 
//		Mordrag schickt mich
// ******************************

INSTANCE ORG_801_Lares_MordragSentMe (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_MordragSentMe_Condition;
	information	= ORG_801_Lares_MordragSentMe_Info;
	permanent	= 0;
	description = "Przysy�a mnie Mordrag. Mam dla ciebie pier�cie�.";
};                       

FUNC int ORG_801_Lares_MordragSentMe_Condition()
{
	if 	Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)
	&&	Npc_HasItems(hero,MordragsRing)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_MordragSentMe_Info()
{
    B_GiveInvItems (other,self, MordragsRing, 1);
    
	AI_Output (other, self,"ORG_801_Lares_MordragSentMe_15_00"); //Przysy�a mnie Mordrag. Mam dla ciebie pier�cie�.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_01"); //Cenna b�yskotka. To taki zwyczaj - cz�� �upu oddaje si� szefowi bandy.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_02"); //Ale skoro powierzy� ci ten pier�cie�, musi mie� o tobie wysokie mniemanie.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_03"); //Chc�, �eby� poszed� do niego i przekaza� mu wiadomo�� ode mnie.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_04"); //Powiedz mu, �e potrzebuj� kogo� w obozie na bagnie. Bractwo planuje co� du�ego, a ja chc� wiedzie�, co si� tam b�dzie dzia�o.
	
	Lares_InformMordrag = LOG_RUNNING;
		
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Lares wys�a� mnie do Mordraga. Mam mu przekaza�, �e do Obozu Bractwa nale�y wys�a� szpiega.");	
	B_GiveXP				(XP_GiveRingToLares);	
		
	Points_NC = Points_NC + 10;
};

// ****************************** 
//		Immerhin vorbeigemogelt
// ******************************

INSTANCE   ORG_801_Lares_Vorbeigemogelt (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_Vorbeigemogelt_Condition;
	information	= ORG_801_Lares_Vorbeigemogelt_Info;
	permanent	= 0;
	description = "Uda�o mi si� omin�� twoje stra�e.";
};                       

FUNC int  ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Lares_vorbeigemogelt == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_Vorbeigemogelt_Info()
{
	AI_Output (other, self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Uda�o mi si� omin�� twoje stra�e.
	AI_Output (self, other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //Fakt. Ale to jeszcze za ma�o.
		
	Points_NC = Points_NC + 10;
};
//========================================
//-----------------> OkylQuestOk
//========================================

INSTANCE DIA_Lares_OkylQuestOk (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_OkylQuestOk_Condition;
   information  = DIA_Lares_OkylQuestOk_Info;
   permanent	= FALSE;
   description	= "Okyl mnie przys�a�. ";
};

FUNC INT DIA_Lares_OkylQuestOk_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_KillHim))
    && (Npc_GetTrueGuild(hero) == GIL_SFB)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_OkylQuestOk_Info()
{
    AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_01"); //Okyl mnie przys�a�. 
    AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_03"); //Zabi�em Cienia ze Starego Obozu, kt�ry szpiegowa� w pobli�u Wolnej Kopalni. Jestem tak�e Kretem.	
    AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_04"); //Powiedziano mi, �e mog� z tob� porozmawia� o przyj�ciu.
    AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_05"); //Pokona�e� jednego Cienia, teoretycznie jeste� te� cz�onkiem Obozu, ale to wci�� za ma�o.
    AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_06"); //Takich jak ty mog� mie� na p�czki. Udowodnij, �e jeste� lepszy! Zdob�d� szacunek co najmniej czterech Najemnik�w, a przyjm� ci� w szeregi moich ludzi!
	AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_07"); //Dlaczego maj� mnie poprze� Najemnicy, a nie twoi ludzie?
	AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_08"); //Bo zdecydowana wi�kszo�� moich ludzi jest nic nie warta. Zaufanych ludzi mog� policzy� na palach jednej r�ki...
	AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_09"); //P�jd� ci na r�k� i udziel� wskaz�wki. Jarvis mo�e ci pom�c.
	B_LogEntry               (CH1_AwansJakoKret,"Rozmawia�em z Laresem na temat mojego przyj�cia. Nie chce mnie jeszcze przyj��. Mam zdoby� poparcie czterech Najemnik�w, �eby zosta� Szkodnikiem. Jarvis mo�e mi w tym pom�c.");	
};

//========================================
//-----------------> PoparcieCzterech
//========================================

INSTANCE DIA_Lares_PoparcieCzterech (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_PoparcieCzterech_Condition;
   information  = DIA_Lares_PoparcieCzterech_Info;
   permanent	= FALSE;
   description	= "Mam poparcie czterech Najemnik�w!";
};

FUNC INT DIA_Lares_PoparcieCzterech_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jarvis_LikeIt))
    && (Npc_GetTrueGuild(hero) == GIL_SFB)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_PoparcieCzterech_Info()
{
    AI_Output (other, self ,"DIA_Lares_PoparcieCzterech_15_01"); //Mam poparcie czterech Najemnik�w!
    AI_Output (self, other ,"DIA_Lares_PoparcieCzterech_03_02"); //S�ysza�em ju� o twoich dokonaniach, ch�opcze. 
	AI_Output (self, other ,"DIA_Lares_PoparcieCzterech_03_03"); //Najemnicy s� zadowoleni z twojej pomocy. To dobrze o tobie �wiadczy.
	Points_NC = Points_NC + 30;
	B_LogEntry               (CH1_OpinionInNewCamp,"Lares nie mia� zamiaru dyskutowa� z zasad� poparcia wymy�lon� pono� przez samego Lee. Jeszcze tylko kilka formalno�ci i zostan� cz�onkiem Nowego Obozu. ");
	
};

// ****************************** 
//		Baal Isidro - Get Kraut
// ******************************
	var int Lares_Get400Ore;
// ******************************

INSTANCE   ORG_801_Lares_GetKraut (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 10;
	condition	= ORG_801_Lares_GetKraut_Condition;
	information	= ORG_801_Lares_GetKraut_Info;
	permanent	= 0;
	description = "To co mam zrobi�, �eby ci� przekona�?";
};                       

FUNC int  ORG_801_Lares_GetKraut_Condition()
{
	if	(Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt) || Npc_KnowsInfo(hero,DIA_Lares_OkylQuestOk ))
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_GetKraut_Info()
{
	AI_Output (other, self,"ORG_801_Lares_GetKraut_15_00"); //To co mam zrobi�, �eby ci� przekona�?
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_01"); //Pewien cz�owiek z Sekty, niejaki Baal Isidro, ma przy sobie ziele warte co najmniej 400 bry�ek rudy. Chc�, �eby� mi je przyni�s�. Jak tego dokonasz - to ju� twoja sprawa.
	
	if ( (BaalIsidro_DealerJob==LOG_RUNNING) || (BaalIsidro_DealerJob==LOG_SUCCESS) )
	{
		AI_Output (other, self,"ORG_801_Lares_GetKraut_15_02"); //Je�li masz na my�li t� stert� trawy, to mam j� ju� od dawna.
		AI_Output (self, other,"ORG_801_Lares_GetKraut_11_03"); //Widz�, �e sprytny z ciebie ch�opak!
	};
	
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_04"); //Skoro masz ju� ziele, chc�, �eby� je sprzeda�. Przynie� mi 400 bry�ek rudy.
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_05"); //Wtedy wr�cimy do twojego cz�onkostwa w mojej bandzie.
	Lares_Get400Ore = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Mam zabra� parti� ziela Baalowi Isidro i sprzeda� j� za 400 bry�ek rudy. Zyski maj� trafi� do Laresa.");	
	
	if	(Npc_GetTrueGuild(hero) == GIL_SFB)
	{
	B_LogEntry               (CH1_AwansJakoKret,"Mam zabra� parti� ziela Baalowi Isidro i sprzeda� j� za 400 bry�ek rudy. Zyski maj� trafi� do Laresa. Potem zostan� Szkodnikiem.");
	};
};

// ****************************** 
//			400 Ore
// ******************************

INSTANCE   ORG_801_Lares_400Ore (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_400Ore_Condition;
	information	= ORG_801_Lares_400Ore_Info;
	permanent	= 1;
	description = "Mam dla ciebie 400 bry�ek.";
};                       

FUNC int  ORG_801_Lares_400Ore_Condition()
{
	if ( (Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob==LOG_RUNNING)||(BaalIsidro_DealerJob==LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_400Ore_Info()
{
	AI_Output			(other, self,"ORG_801_Lares_400Ore_15_00"); //Mam dla ciebie 400 bry�ek.
	if (Npc_HasItems(other,itminugget)>=400)
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_11_01"); //Dobrze! �wietnie! To mi chyba wystarczy.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		
		B_GiveInvItems	(other, self, ItMiNugget, 400);
		//wpis dla klasycznego przyj�cia
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
	    B_LogEntry		(CH1_JoinNC, "Lares otrzyma� swoje 400 bry�ek rudy ze sprzeda�y ziela. Wydawa� si� usatysfakcjonowany.");	
		};
		//wpis dla kreta
		if	(Npc_GetTrueGuild(hero) == GIL_SFB)
		{
		B_LogEntry               (CH1_AwansJakoKret,"Lares otrzyma� swoje 400 bry�ek rudy ze sprzeda�y ziela. Wydawa� si� usatysfakcjonowany. Chyba ju� mog� zosta� oficjalnie przyj�ty!");
		};
		B_GiveXP		(XP_BaalIsidroPayLares);	
	}
	else
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Lepiej przelicz jeszcze raz! Mam nadziej�, �e nie wyda�e� ich na gorza��!
	};
};

var int herowas_ORG;
// ****************************** 
//		Reicht das jetzt???
// ******************************

INSTANCE   ORG_801_Lares_Reicht (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 5;
	condition	= ORG_801_Lares_Reicht_Condition;
	information	= ORG_801_Lares_Reicht_Info;
	permanent	= 1;
	description = "Czy to wystarczy, by�cie mnie przyj�li?";
};                       

FUNC int  ORG_801_Lares_Reicht_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) || Npc_KnowsInfo(hero,DIA_Lares_OkylQuestOk))
	&& ( Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList) ||  Npc_KnowsInfo(hero,DIA_Lares_PoparcieCzterech) || Npc_KnowsInfo(hero,DIA_Lares_OkylQuestOk))
	&& ((Npc_GetTrueGuild(other)==GIL_NONE) || (Npc_GetTrueGuild(other)==GIL_SFB) || (Npc_GetTrueGuild(other)==GIL_VLK)) && (Kapitel <2) )
	
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_Reicht_Info()
{
	AI_Output (other, self,"ORG_801_Lares_Reicht_15_00"); //Czy to wystarczy, by�cie mnie przyj�li?
	
	if ( (Points_NC >= 29) && (hero.level >= 5) )
	{
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //My�l�, �e tak!
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //I mam dla ciebie ma�y prezent! Lepszy pancerz. Mo�e nie jest to szczyt marze�, ale zas�u�y�e� na niego.
	
	
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild	(hero,GIL_ORG );
		CreateInvItem		(hero,ORG_ARMOR_L);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
		B_GiveXP			(XP_BecomeBandit);	
		
		HeroJoinToNC (); //empty
		herowas_ORG = true; //important 
		
		if (MIS_AwansJakoKret == LOG_RUNNING)
		{
		MIS_AwansJakoKret = LOG_SUCCESS;
		Log_SetTopicStatus   (CH1_AwansJakoKret, LOG_SUCCESS);
		B_LogEntry               (CH1_AwansJakoKret,"Uda�o mi si� do��czy� do Obozu i awansowa� na Szkodnika. Lares by� zadowolony z moich osi�gni��. O innych Obozach mog� ju� zapomnie�.");
		};
		
		if (MIS_OpinionInNewCamp == LOG_RUNNING)
		{
		MIS_OpinionInNewCamp = LOG_SUCCESS;
		Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_SUCCESS);
		B_LogEntry              		 (CH1_OpinionInNewCamp,"Uda�o mi si� do��czy� do Obozu i zosta� Szkodnikiem. Jarvis okaza� si� by� dobrym przyjacielem. Jestem jego d�u�nikiem.");
		};
		
		B_LogEntry				(CH1_JoinNC,	"Lares przyj�� mnie do swojej bandy. Od dzi� Nowy Ob�z b�dzie moim nowym domem.");
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_SUCCESS);

		// Canceln der anderen Aufnahmen
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_JoinOC,	"Cz�onek bandy Laresa nie mo�e do��czy� do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry				(CH1_JoinPsi,	"Bractwo b�dzie musia�o radzi� sobie beze mnie. Od dzi� moim domem jest Nowy Ob�z!");
		
		Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
		B_LogEntry               (CH1_BANDITOS_CAMP,"Bandyci b�d� musieli si� obje�� beze mnie. No c�. Nie mo�na by� ka�dym. Teraz moim domem jest Nowy Ob�z!");
		
		Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_EasyJoinOC,	"Nic nie wysz�o z mojego u�atwionego przyj�cia do Starego Obozu. Zosta�em cz�onkiem bany Laresa.");
		

		/*
		MIS_Fire_Novize = LOG_FAILED;
		Log_SetTopicStatus       (CH1_Fire_Novize, LOG_FAILED);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_NewsFromSpy,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_OreInOM,	LOG_FAILED);
		*/
	}
	else
	{
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_MordragSentMe))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_02"); //Mordrag opowiedzia� si� za tob�.
		};
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_BringList))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_03"); //Sta�e� si� bardzo popularny, odk�d przynios�e� nam t� list�.
		};
		AI_Output (self, other,"ORG_801_Lares_Reicht_11_04"); //Ale nie jeste� gotowy. Popracuj nad sob� jeszcze troch�.
		
		if (hero.level < 5)
		{
		B_PrintGuildCondition(5);
		}
		else
		{
		PrintScreen	("Zbyt ma�a reputacja!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	};
};

// ****************************** 
//			Goto Kalom
// ******************************

INSTANCE   ORG_801_Lares_GotoKalom (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 10;
	condition	= ORG_801_Lares_GotoKalom_Condition;
	information	= ORG_801_Lares_GotoKalom_Info;
	permanent	= 0;
	description = "I co mam robi� dalej?";
};                       

FUNC int  ORG_801_Lares_GotoKalom_Condition()
{
	if ( Npc_GetTrueGuild(other)==GIL_ORG )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_GotoKalom_Info()
{
	AI_Output (other, self,"ORG_801_Lares_GotoKalom_15_00"); //I co mam robi� dalej?
	AI_Output (self, other,"ORG_801_Lares_GotoKalom_11_01"); //Nale�ysz teraz do naszej bandy. Mo�esz robi�, co ci si� �ywnie podoba.
		
	Log_CreateTopic		(CH1_GotoPsiCamp,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_RUNNING);
	B_LogEntry			(CH1_GotoPsiCamp,	"Bractwo �ni�cego planuje co� du�ego. Lares, przyw�dca Szkodnik�w z Nowego Obozu, chce si� dowiedzie�, co to jest.");

	if	(Lares_InformMordrag == LOG_RUNNING)
	{	
		AI_Output 		(self, other,"ORG_801_Lares_GotoKalom_11_02"); //Je�li chcesz robi� co� po�ytecznego, pogadaj z Mordragiem i pom� mu w sprawie Sekty.
		B_LogEntry		(CH1_GotoPsiCamp,	"Mam pom�c Mordragowi w wyja�nieniu tej sprawy!");
	}
	else
	{
		var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
		if (Npc_IsDead(Mordrag))
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_03"); //Zgin�� Mordrag, jeden z naszych ludzi w Starym Obozie. Przed �mierci� zd��y� przys�a� nam wiadomo��. Wygl�da na to, �e w obozie Sekty dzieje si� co� wa�nego.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_04"); //Chc�, �eby� uda� si� do obozu na bagnie i troch� tam pow�szy�.
			B_LogEntry	(CH1_GotoPsiCamp,	"Wys�a� mnie wprost do Obozu Bractwa.");
		}
		else
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_05"); //Wr�ci� Mordrag, jeden z naszych ludzi w Starym Obozie.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_06"); //Chc�, �eby� z nim porozmawia�. Powiedz mu, �e potrzebuj� wtyczki w obozie Sekty. Bractwo planuje co� du�ego, a ja chc� wiedzie�, co si� tam dzieje.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_07"); //Masz mu pom�c.
			B_LogEntry	(CH1_GotoPsiCamp,	"Ma si� tym zaj�� Szkodnik imieniem Mordrag. Znajd� go w karczmie na jeziorze.");
			
			B_ExchangeRoutine(Org_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};



// ****************************** 
//			Wo lernen?
// ******************************

instance  ORG_801_Lares_WhereLearn (C_INFO)
{
	npc				= ORG_801_Lares;
	nr				= 20;
	condition		= ORG_801_Lares_WhereLearn_Condition;
	information		= ORG_801_Lares_WhereLearn_Info;
	permanent		= 0;
	description		= "Gdzie mog� si� tu czego� nauczy�?"; 
};

FUNC int  ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

FUNC void  ORG_801_Lares_WhereLearn_Info()
{
	AI_Output 		(other, self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Gdzie mog� si� tu czego� nauczy�?
	AI_Output 		(self, other,"ORG_801_Lares_WhereLearn_Info_11_02"); //Na przyk�ad u mnie. Mog� ci pokaza�, jak zwi�kszy� twoj� si�� i zr�czno��.
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Lares mo�e mi pokaza�, jak zwi�kszy� moj� si�� i umiej�tno�ci.");

};  
// ******************************
// 		STR + DEX LERNEN
// ******************************
INSTANCE ORG_801_Lares_Teach(C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 20;
	condition	= ORG_801_Lares_Teach_Condition;
	information	= ORG_801_Lares_Teach_Info;
	permanent	= 1;
	description = "Chc� nauczy� si� czego� nowego.";
};                       

FUNC INT ORG_801_Lares_Teach_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};
FUNC VOID ORG_801_Lares_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Chc� nauczy� si� czego� nowego.
	
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices	(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

//========================================
//-----------------> DRAX_CH4
//========================================

INSTANCE DIA_Lares_DRAX_CH4 (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_DRAX_CH4_Condition;
   information  = DIA_Lares_DRAX_CH4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lares_DRAX_CH4_Condition()
{
    if (kapitel == 4)
    && (Npc_GetTrueGuild(hero) != GIL_BAU)
	//(((Npc_GetTrueGuild(hero) == GIL_SLD)
  //  || (Npc_GetTrueGuild(hero) == GIL_ORG)) || (Npc_GetTrueGuild(hero) == GIL_NONE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_DRAX_CH4_Info()
{
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_01"); //S�uchaj, jest sprawa. 
    AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_02"); //W czym problem?
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_03"); //Trzeba ostrzec naszych znajomych z Obozu Bandyt�w o tym, co si� dzieje. By� mo�e niczego si� jeszcze nie spodziewaj�.
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_04"); //Musimy im przekaza�, �eby zachowali czujno��. Stra�nicy s� teraz zdolni do wszystkiego.
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_05"); //Id� do Draxa, to m�j stary przyjaciel. Powiedz mu co si� dzieje, a przy okazji przynie� mi jakie� wie�ci od niego. 
	
	//log
	MIS_RaportForLares = LOG_RUNNING;
    Log_CreateTopic         (CH4_RaportForLares, LOG_MISSION);
    Log_SetTopicStatus      (CH4_RaportForLares, LOG_RUNNING);
    B_LogEntry              (CH4_RaportForLares,"Lares kaza� mi i�� do Draxa i ostrzec Bandyt�w przed tym, co si� dzieje w Kolonii. ");
		
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded)) //&& (MIS_HuntersSupport == LOG_SUCCESS)
    {
		AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_09"); //Ju� rozmawia�em z Draxem. Spotka�em go przy �cie�ce do placu wymian. 
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_10"); //I co u niego s�ycha�?
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_11"); //Sytuacja nie wygl�da najlepiej. Stra�nicy Gomeza zabili Ratforda podczas polowania.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_12"); //Cholera, Ratford by� w porz�dku.
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_13"); //Drax ma pewien plan. Chce wraz z grup� Bandyt�w zem�ci� si� na Gomezie atakuj�c kr�c�ce si� po okolicy grupy Stra�nik�w.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_14"); //To by�oby bardzo nierozs�dne. Mam nadziej�, �e Quentin go powstrzyma, albo zrobi si� niez�y burdel...
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_15"); //Zreszt� nie mam czasu teraz o tym my�le�. Mamy inne problemy. 
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_16"); //Pos�uchaj: Torlof z kilkoma Najemnikami uda� si� do doliny, w kt�rej przesiaduje Aidan. Chc� wyp�dzi� Stra�nik�w, kt�rzy si� tam rozplenili.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_17"); //Powiniene� i�� im pom�c. Zg�o� si� do Torlofa.
        B_LogEntry                     (CH4_RaportForLares,"Uprzedzi�em polecenie Laresa i ju� wcze�niej rozmawia�em z Draxem. Przekaza�em szefowi Szkodnik�w wszystko, czego si� dowiedzia�em w Obozie. Ostrze�enia nie by�y potrzebne. Bandyci maj� w�asny plan.");
        Log_SetTopicStatus       (CH4_RaportForLares, LOG_SUCCESS);
        MIS_RaportForLares = LOG_SUCCESS;
		
		B_Story_SoldiersValleyDefense ();
		Npc_ExchangeRoutine (BAN_1613_Doyle,"zwial");
	

	
        B_GiveXP (670);
        MIS_TorlofNeedHelp = LOG_RUNNING;

        Log_CreateTopic          (CH4_TorlofNeedHelp, LOG_MISSION);
        Log_SetTopicStatus       (CH4_TorlofNeedHelp, LOG_RUNNING);
        B_LogEntry               (CH4_TorlofNeedHelp,"Lares chce �ebym poszed� do Torlofa i pom�g� mu pozby� si� Stra�nik�w z doliny, w kt�rej zazwyczaj poluje Aidan.");
    }
    else
    {
	AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_06"); //My�l�, �e to nie problem.
    AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_07"); //Jasne. Zrobi� co w mojej mocy.
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_08"); //Dzi�ki, m�ody.  
    };
	
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Spotka�em si� z Laresem. Stosunki pomi�dzy obozami pogarszaj� si�. Musz� stosowa� si� do instrukcji Szkodnika, aby pom�c naszym przyjacio�om w innych obozach.");
	};
	
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> SYTUACJA_W_OB
//========================================

INSTANCE DIA_Lares_SYTUACJA_W_OB (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_SYTUACJA_W_OB_Condition;
   information  = DIA_Lares_SYTUACJA_W_OB_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Draxem.";
};

FUNC INT DIA_Lares_SYTUACJA_W_OB_Condition()
{
    if (MIS_RaportForLares == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Drax_Ded)) //&& (MIS_HuntersSupport == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_SYTUACJA_W_OB_Info()
{
    AI_Output (other, self ,"DIA_Lares_SYTUACJA_W_OB_15_01"); //Rozmawia�em z Draxem.
		AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_10"); //I co u niego s�ycha�?
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_11"); //Sytuacja nie wygl�da najlepiej. Stra�nicy Gomeza zabili Ratforda podczas polowania.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_12"); //Cholera, Ratford by� w porz�dku.
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_13"); //Drax ma pewien plan. Chce wraz z grup� Bandyt�w zem�ci� si� na Gomezie atakuj�c kr�c�ce si� po okolicy grupy Stra�nik�w.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_14"); //To by�oby bardzo nierozs�dne. Mam nadziej�, �e Quentin go powstrzyma, albo zrobi si� niez�y burdel...
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_15"); //Zreszt� nie mam czasu teraz o tym my�le�. Mamy inne problemy. 
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_16"); //Pos�uchaj: Torlof z kilkoma Najemnikami uda� si� do doliny, w kt�rej przesiaduje Aidan. Chc� wyp�dzi� Stra�nik�w, kt�rzy si� tam rozplenili.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_17"); //Powiniene� i�� im pom�c. Zg�o� si� do Torlofa.
		
    B_LogEntry               (CH4_RaportForLares,"Przekaza�em szefowi Szkodnik�w wszystko, czego si� dowiedzia�em od Draxa. Pomimo kiepskiej sytuacji w Obozie Bandyt�w Lares postanowi� zleci� mi inne zadanie. Mam teraz i�� do Torlofa i pom�c mu pozby� si� Stra�nik�w z doliny.");
    Log_SetTopicStatus       (CH4_RaportForLares, LOG_SUCCESS);
    MIS_RaportForLares = LOG_SUCCESS;
	B_Story_SoldiersValleyDefense ();
	Npc_ExchangeRoutine (BAN_1613_Doyle,"zwial");
	B_GiveXP (670);
		
		MIS_TorlofNeedHelp = LOG_RUNNING;

        Log_CreateTopic          (CH4_TorlofNeedHelp, LOG_MISSION);
        Log_SetTopicStatus       (CH4_TorlofNeedHelp, LOG_RUNNING);
        B_LogEntry               (CH4_TorlofNeedHelp,"Lares chce �ebym poszed� do Torlofa i pom�g� mu si� pozby� Stra�nik�w z doliny, w kt�rej zazwyczaj poluje Aidan.");
        AI_StopProcessInfos	(self);
		
};


//========================================
//-----------------> POMOC_TORLOFOWI
//========================================

INSTANCE DIA_Lares_POMOC_TORLOFOWI (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_POMOC_TORLOFOWI_Condition;
   information  = DIA_Lares_POMOC_TORLOFOWI_Info;
   permanent	= FALSE;
   description	= "Pomog�em Torlofowi.";
};

FUNC INT DIA_Lares_POMOC_TORLOFOWI_Condition()
{
    if (MIS_TorlofNeedHelp == LOG_RUNNING)
    && (MIS_helpSld1 == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_POMOC_TORLOFOWI_Info()
{
    AI_Output (other, self ,"DIA_Lares_POMOC_TORLOFOWI_15_01"); //Pomog�em Torlofowi.
    AI_Output (self, other ,"DIA_Lares_POMOC_TORLOFOWI_03_02"); //�wietnie! Id� teraz do Lee. Chyba ma jakie� ambitniejsze plany. Przyda mu si� pomoc.
	
	//zadanie - zako�czenie
	//kluczowe do post�pu (odblokowuje dilaog z Lee)
    B_LogEntry               (CH4_TorlofNeedHelp ,"Poinformowa�em Laresa, �e za�atwi�em spraw� z Torlofem. Musz� si� teraz uda� do Lee. Przyw�dca Najemnik�w ma pono� jakie� plany.");
    Log_SetTopicStatus       (CH4_TorlofNeedHelp , LOG_SUCCESS);
    MIS_TorlofNeedHelp  = LOG_SUCCESS;
	
	//zadanie - wpis dla cz�onk�w bractwa
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Pomog�em Najemnikowi Torlofowi pozby� si� Stra�nik�w Gomeza z doliny. Jednak moje zadanie jeszcze si� nie ko�czy. Musz� porozmawia� z samym Lee.");
	};
	
	//exp [500]
    B_GiveXP (500);
	
	//koniec
    AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////
// DIALOG PO WYKONANIU ZADANIA W OPUSZCZONEJ
////////////////////////////////////////////// 

//========================================
//-----------------> POTZREBNI_LUDZIE
//========================================

INSTANCE DIA_Lares_POTZREBNI_LUDZIE (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_POTZREBNI_LUDZIE_Condition;
   information  = DIA_Lares_POTZREBNI_LUDZIE_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Lee.";
};

FUNC INT DIA_Lares_POTZREBNI_LUDZIE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_CZYSTKA_W_KOPALNI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_POTZREBNI_LUDZIE_Info()
{
    AI_Output (other, self ,"DIA_Lares_POTZREBNI_LUDZIE_15_01"); //Przysy�a mnie Lee. Postanowili�my wznowi� wydobycie w Opuszczonej Kopalni. Co o tym s�dzisz?
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_02"); //Niez�y pomys�. Ruda zawsze si� przyda.
    AI_Output (other, self ,"DIA_Lares_POTZREBNI_LUDZIE_15_03"); //Jest pewien problem, Lee nie ma do�� ludzi, by wys�a� ich do kopalni...
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_04"); //I niby ja mia�bym wys�a� swoich Szkodnik�w, tak? W momencie, gdy ludzie Gomeza bezkarnie zabijaj� naszych my�liwych i lada chwila mog� pojawi� si� w Nowym Obozie?
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_05"); //O nie! Wiem, �e wam zale�y, ale ryzyko jest zbyt du�e.
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_06"); //Pogadaj z przyw�dc� Bandyt�w. Przecie� to on pierwszy chcia� odbija� kopalni� Gomezowi.
    AI_Output (other, self ,"DIA_Lares_POTZREBNI_LUDZIE_15_07"); //Twierdzisz, �e to by�o z�e posuni�cie?
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_08"); //Mo�e tak, a mo�e nie.
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_09"); //Pomy�l, je�li Gomez mia�by nowe �r�d�o rudy z pewno�ci� by si� uspokoi�. By�aby szansa na przynajmniej tymczasowe z�agodzenie konflikt�w.
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_10"); //Zreszt�... czas poka�e jakie to b�dzie mia�o skutki.
    B_LogEntry                     (CH4_NC_Mine,"Lares radzi, �eby i�� do Quentina. Najpierw jednak musz� pogada� z Lee. ");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PLOTKI1
//========================================

INSTANCE DIA_Lares_PLOTKI1 (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 1;
   condition    = DIA_Lares_PLOTKI1_Condition;
   information  = DIA_Lares_PLOTKI1_Info;
   permanent	= FALSE;
   description	= "Jak to jest nale�e� do twojej bandy?";
};

FUNC INT DIA_Lares_PLOTKI1_Condition()
{
    return TRUE;
    
};


FUNC VOID DIA_Lares_PLOTKI1_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTKI1_15_01"); //Jak to jest nale�e� do twojej bandy?
	AI_Output (self, other ,"DIA_Lares_PLOTKI1_03_02"); //A co ci� to obchodzi? Ma�o masz problem�w ��todziobie?
	AI_Output (self, other ,"DIA_Lares_PLOTKI1_03_03"); //Powiem tyle: w mojej bandzie mo�esz robi� co chcesz. 
	AI_Output (self, other ,"DIA_Lares_PLOTKI1_03_04"); //Nie denerwuj tylko Mag�w Wody. Moi ludzie pracuj� dla nich jako kurierzy. Nie chc�, by zrezygnowali z naszych us�ug.
};

//========================================
//-----------------> PLOTECZKI2
//========================================

INSTANCE DIA_Lares_PLOTECZKI2 (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 2;
   condition    = DIA_Lares_PLOTECZKI2_Condition;
   information  = DIA_Lares_PLOTECZKI2_Info;
   permanent	= FALSE;
   description	= "Jak zosta�e� przyw�dc� Szkodnik�w?";
};

FUNC INT DIA_Lares_PLOTECZKI2_Condition()
{

    return TRUE;
    
};


FUNC VOID DIA_Lares_PLOTECZKI2_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTECZKI2_15_01"); //Jak zosta�e� przyw�dc� Szkodnik�w? My�la�em, �e dowodzenie tak� band� nie jest �atwym zadaniem.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_02"); //Przed wrzuceniem za Barier� przez wiele lat para�em si� kradzie��. W Myrtanie cieszy�em si� do�� du�ym szacunkiem w�r�d z�odziei.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_03"); //Nieraz udawa�o mi si� oskuba� niezwykle czujnych kupc�w.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_04"); //Moje zdolno�ci doceniono i tutaj. Dzi�ki nim stan��em na czele Szkodnik�w.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_05"); //A w�a�ciwie po co ja ci to m�wi�? I tak sko�czysz z poder�ni�tym gard�em.
	AI_Output (other, self ,"DIA_Lares_PLOTECZKI2_15_06"); //By�em po prostu ciekawy.
};

//========================================
//-----------------> PLOTECZKI3
//========================================

INSTANCE DIA_Lares_PLOTECZKI3 (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 3;
   condition    = DIA_Lares_PLOTECZKI3_Condition;
   information  = DIA_Lares_PLOTECZKI3_Info;
   permanent	= FALSE;
   description	= "Co my�lisz o Lee i jego Najemnikach?";
};

FUNC INT DIA_Lares_PLOTECZKI3_Condition()
{

    return TRUE;
    
};


FUNC VOID DIA_Lares_PLOTECZKI3_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTECZKI3_15_01"); //Co my�lisz o Lee i jego Najemnikach?
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI3_03_02"); //My�l�, �e Lee to �wietny przyw�dca. Odk�d go tylko pozna�em, zacz��em go darzy� szacunkiem. 
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI3_03_03"); //Niestety moi ludzie to rzezimieszki i nieraz podpadli Najemnikom. Og�lnie nasze gildie za sob� nie przepadaj�.
};

//========================================
//-----------------> PLOTECZKI4
//========================================

INSTANCE DIA_Lares_PLOTECZKI4 (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 4;
   condition    = DIA_Lares_PLOTECZKI4_Condition;
   information  = DIA_Lares_PLOTECZKI4_Info;
   permanent	= FALSE;
   description	= "Gdzie mog� dosta� lepszy pancerz?";
};

FUNC INT DIA_Lares_PLOTECZKI4_Condition()
{
    if ( Npc_GetTrueGuild(other)==GIL_ORG )
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_PLOTECZKI4_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTECZKI4_15_01"); //Gdzie mog� dosta� lepszy pancerz?
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI4_03_02"); //Pogadaj z Wilkiem. To on zajmuje si� takimi rzeczami.
};

//========================================
//-----------------> PLOTECZKI5
//========================================

INSTANCE DIA_Lares_PLOTECZKI5 (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 5;
   condition    = DIA_Lares_PLOTECZKI5_Condition;
   information  = DIA_Lares_PLOTECZKI5_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Lares_PLOTECZKI5_Condition()
{
    if ( Npc_GetTrueGuild(other)==GIL_ORG )
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_PLOTECZKI5_Info()
{
AI_Output (other, self ,"DIA_Lares_PLOTECZKI5_15_01"); //Co s�ycha�?
if (kapitel <= 2)
{  
    AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_02"); //Wszystko w porz�dku, od twojego przyj�cia nie zdarzy�o si� nic specjalnego. 
	}
	else if kapitel == 3
	{
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_03"); //Mordrag powiedzia� mi wszystko co planuje Bractwo. Ciekawy jestem jak to si� potoczy.
	}
	else if kapitel == 3
	{
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_04"); //Te sukinsyny ze Starego Obozu zaj�y nasz� kopalnie. Ale ju� wkr�tce Gomez dostanie to na co zas�uguje. Nie b�dziemy siedzie� bezczynnie.
	}
	else if (Npc_KnowsInfo(hero,DIA_Lee_CZYSTKA_W_KOPALNI))
	{
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_04"); //Dobrze, �e Wolna Kopalnia jest w naszych r�kach. Wilk m�wi�, �e to twoja zas�uga. �wietnie si� spisa�e� przyjacielu. 
	};
};

//========================================
//-----------------> NAJMENIK_BEZI
//========================================

INSTANCE DIA_Lares_NAJMENIK_BEZI (C_INFO)
{
   npc          = ORG_801_Lares;
   nr           = 6;
   condition    = DIA_Lares_NAJMENIK_BEZI_Condition;
   information  = DIA_Lares_NAJMENIK_BEZI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lares_NAJMENIK_BEZI_Condition()
{
    if ( Npc_GetTrueGuild(other)==GIL_SLD )
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lares_NAJMENIK_BEZI_Info()
{
    AI_Output (self, other ,"DIA_Lares_NAJMENIK_BEZI_03_01"); //Widz�, �e Lee przyj�� ci� do Najemnik�w. Spokojnie, nie chowam urazy. 
	if herowas_ORG
	{
	AI_Output (self, other ,"DIA_Lares_NAJMENIK_BEZI_03_02"); //Mam tylko nadziej�, �e nie zapomnisz kim by�e� i nie zaczniesz narzeka� na nas. 
	}
	else 
	{
	AI_Output (self, other ,"DIA_Lares_NAJMENIK_BEZI_03_03"); //Mam nadziej�, �e w razie czego b�dzie mo�na na ciebie liczy�! 
	};
};




