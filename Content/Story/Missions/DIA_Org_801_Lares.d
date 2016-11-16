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
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_00"); //Jak siê tu dosta³eœ? Co siê dzieje z Roscoe?
		AI_Output	(other, self,"ORG_801_Lares_YouHere_15_01"); //Wola³ nie próbowaæ mnie powstrzymywaæ!
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
	description = "Chcê do was do³¹czyæ.";
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
	AI_Output (other, self,"ORG_801_Lares_WannaJoin_15_00"); //Chcê do was do³¹czyæ.
	AI_Output (self, other,"ORG_801_Lares_WannaJoin_11_01"); //Tak? A co takiego mo¿esz nam zaoferowaæ?
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
	description = "Mam przy sobie listê zamówieñ dla Starej Kopalni.";
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
	AI_Output (other, self,"ORG_801_Lares_BringList_15_00"); //Mam przy sobie listê zamówieñ dla Starej Kopalni.
	AI_Output (self, other,"ORG_801_Lares_BringList_11_01"); //O niech mnie... Albo jesteœ cholernie odwa¿ny, albo cholernie g³upi...
	AI_Output (self, other,"ORG_801_Lares_BringList_11_02"); //Poka¿!
	AI_Output (other, self,"ORG_801_Lares_BringList_15_03"); //Oto ona...
	B_UseFakeScroll();
	AI_Output (self, other,"ORG_801_Lares_BringList_11_04"); //Rzeczywiœcie! Wiesz, co z ni¹ teraz zrobimy? Dopiszemy parê rzeczy, a ty zaniesiesz j¹ do Starego Obozu!
	AI_Output (self, other,"ORG_801_Lares_BringList_11_05"); //A jak ju¿ dostarcz¹ wszystko do kopalni, obrabujemy ich ze wszystkiego! To nie zajmie d³ugo... Ha! Masz tu listê. Wiesz, co masz robiæ.
	//AI_Output (self, other,"ORG_801_Lares_BringList_11_06"); //Das haben wir gleich ... So! Hier ist die Liste. Du weißt, was du zu tun hast.
	
	Points_NC = Points_NC + 10;
	
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem		(hero,	TheList);
	CreateInvItem			(hero,	TheListNC);
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Przywódca Szkodników by³ zaskoczony, gdy wrêczy³em mu listê zamówieñ. Doda³ do niej kilka rzeczy i kaza³ mi dostarczyæ j¹ Diego.");		
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
	description = "Przekaza³em listê Diego.";
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
	AI_Output			(other, self,"ORG_801_Lares_BringListBack_15_00"); //Przekaza³em listê Diego.
	AI_Output			(self, other,"ORG_801_Lares_BringListBack_11_01"); //Œwietnie! Rozmieœci³em paru ludzi na drodze do Starej Kopalni. Stra¿nicy Thorusa pewnie ju¿ gryz¹ ziemiê.
		
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;

	B_LogEntry			(CH1_JoinNC, "Ludzie Laresa obrabowali ju¿ konwój ze Starego Obozu. NajwyraŸniej przywódca Szkodników nie zamierza³ czekaæ do mojego... a raczej NA WYPADEK mojego powrotu!");		

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
	description = "Napadliœcie ju¿ na konwój?! A gdzie moja dola?!";
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
	AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_00"); //Napadliœcie ju¿ na konwój?! A gdzie moja dola?!
	AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_01"); //Pogadaj z Gornem. On ci coœ da.
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	if (gorn.aivar[AIV_FINDABLE]==TRUE)
	{
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_02"); //Znam Gorna, ale on nie nale¿y do waszej bandy. Jest Najemnikiem, pracuje dla Magów.
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_03"); //Zgadza siê.
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_04"); //To on te¿ macza³ w tym palce?
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_05"); //Czasem lepiej jest nie wiedzieæ za du¿o. IdŸ do niego po swoj¹ nagrodê.
	};
	B_LogEntry(CH1_JoinNC, "Gorn uczestniczy³ w jakiœ sposób w napadzie na konwój. Mam od niego odebraæ swoj¹ dolê.");
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
	description = "Przysy³a mnie Mordrag. Mam dla ciebie pierœcieñ.";
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
    
	AI_Output (other, self,"ORG_801_Lares_MordragSentMe_15_00"); //Przysy³a mnie Mordrag. Mam dla ciebie pierœcieñ.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_01"); //Cenna b³yskotka. To taki zwyczaj - czêœæ ³upu oddaje siê szefowi bandy.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_02"); //Ale skoro powierzy³ ci ten pierœcieñ, musi mieæ o tobie wysokie mniemanie.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_03"); //Chcê, ¿ebyœ poszed³ do niego i przekaza³ mu wiadomoœæ ode mnie.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_04"); //Powiedz mu, ¿e potrzebujê kogoœ w obozie na bagnie. Bractwo planuje coœ du¿ego, a ja chcê wiedzieæ, co siê tam bêdzie dzia³o.
	
	Lares_InformMordrag = LOG_RUNNING;
		
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Lares wys³a³ mnie do Mordraga. Mam mu przekazaæ, ¿e do Obozu Bractwa nale¿y wys³aæ szpiega.");	
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
	description = "Uda³o mi siê omin¹æ twoje stra¿e.";
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
	AI_Output (other, self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Uda³o mi siê omin¹æ twoje stra¿e.
	AI_Output (self, other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //Fakt. Ale to jeszcze za ma³o.
		
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
   description	= "Okyl mnie przys³a³. ";
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
    AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_01"); //Okyl mnie przys³a³. 
    AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_03"); //Zabi³em Cienia ze Starego Obozu, który szpiegowa³ w pobli¿u Wolnej Kopalni. Jestem tak¿e Kretem.	
    AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_04"); //Powiedziano mi, ¿e mogê z tob¹ porozmawiaæ o przyjêciu.
    AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_05"); //Pokona³eœ jednego Cienia, teoretycznie jesteœ te¿ cz³onkiem Obozu, ale to wci¹¿ za ma³o.
    AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_06"); //Takich jak ty mogê mieæ na pêczki. Udowodnij, ¿e jesteœ lepszy! Zdob¹dŸ szacunek co najmniej czterech Najemników, a przyjmê ciê w szeregi moich ludzi!
	AI_Output (other, self ,"DIA_Lares_OkylQuestOk_15_07"); //Dlaczego maj¹ mnie poprzeæ Najemnicy, a nie twoi ludzie?
	AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_08"); //Bo zdecydowana wiêkszoœæ moich ludzi jest nic nie warta. Zaufanych ludzi mogê policzyæ na palach jednej rêki...
	AI_Output (self, other ,"DIA_Lares_OkylQuestOk_03_09"); //Pójdê ci na rêkê i udzielê wskazówki. Jarvis mo¿e ci pomóc.
	B_LogEntry               (CH1_AwansJakoKret,"Rozmawia³em z Laresem na temat mojego przyjêcia. Nie chce mnie jeszcze przyj¹æ. Mam zdobyæ poparcie czterech Najemników, ¿eby zostaæ Szkodnikiem. Jarvis mo¿e mi w tym pomóc.");	
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
   description	= "Mam poparcie czterech Najemników!";
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
    AI_Output (other, self ,"DIA_Lares_PoparcieCzterech_15_01"); //Mam poparcie czterech Najemników!
    AI_Output (self, other ,"DIA_Lares_PoparcieCzterech_03_02"); //S³ysza³em ju¿ o twoich dokonaniach, ch³opcze. 
	AI_Output (self, other ,"DIA_Lares_PoparcieCzterech_03_03"); //Najemnicy s¹ zadowoleni z twojej pomocy. To dobrze o tobie œwiadczy.
	Points_NC = Points_NC + 30;
	B_LogEntry               (CH1_OpinionInNewCamp,"Lares nie mia³ zamiaru dyskutowaæ z zasad¹ poparcia wymyœlon¹ ponoæ przez samego Lee. Jeszcze tylko kilka formalnoœci i zostanê cz³onkiem Nowego Obozu. ");
	
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
	description = "To co mam zrobiæ, ¿eby ciê przekonaæ?";
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
	AI_Output (other, self,"ORG_801_Lares_GetKraut_15_00"); //To co mam zrobiæ, ¿eby ciê przekonaæ?
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_01"); //Pewien cz³owiek z Sekty, niejaki Baal Isidro, ma przy sobie ziele warte co najmniej 400 bry³ek rudy. Chcê, ¿ebyœ mi je przyniós³. Jak tego dokonasz - to ju¿ twoja sprawa.
	
	if ( (BaalIsidro_DealerJob==LOG_RUNNING) || (BaalIsidro_DealerJob==LOG_SUCCESS) )
	{
		AI_Output (other, self,"ORG_801_Lares_GetKraut_15_02"); //Jeœli masz na myœli tê stertê trawy, to mam j¹ ju¿ od dawna.
		AI_Output (self, other,"ORG_801_Lares_GetKraut_11_03"); //Widzê, ¿e sprytny z ciebie ch³opak!
	};
	
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_04"); //Skoro masz ju¿ ziele, chcê, ¿ebyœ je sprzeda³. Przynieœ mi 400 bry³ek rudy.
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_05"); //Wtedy wrócimy do twojego cz³onkostwa w mojej bandzie.
	Lares_Get400Ore = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Mam zabraæ partiê ziela Baalowi Isidro i sprzedaæ j¹ za 400 bry³ek rudy. Zyski maj¹ trafiæ do Laresa.");	
	
	if	(Npc_GetTrueGuild(hero) == GIL_SFB)
	{
	B_LogEntry               (CH1_AwansJakoKret,"Mam zabraæ partiê ziela Baalowi Isidro i sprzedaæ j¹ za 400 bry³ek rudy. Zyski maj¹ trafiæ do Laresa. Potem zostanê Szkodnikiem.");
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
	description = "Mam dla ciebie 400 bry³ek.";
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
	AI_Output			(other, self,"ORG_801_Lares_400Ore_15_00"); //Mam dla ciebie 400 bry³ek.
	if (Npc_HasItems(other,itminugget)>=400)
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_11_01"); //Dobrze! Œwietnie! To mi chyba wystarczy.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		
		B_GiveInvItems	(other, self, ItMiNugget, 400);
		//wpis dla klasycznego przyjêcia
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
	    B_LogEntry		(CH1_JoinNC, "Lares otrzyma³ swoje 400 bry³ek rudy ze sprzeda¿y ziela. Wydawa³ siê usatysfakcjonowany.");	
		};
		//wpis dla kreta
		if	(Npc_GetTrueGuild(hero) == GIL_SFB)
		{
		B_LogEntry               (CH1_AwansJakoKret,"Lares otrzyma³ swoje 400 bry³ek rudy ze sprzeda¿y ziela. Wydawa³ siê usatysfakcjonowany. Chyba ju¿ mogê zostaæ oficjalnie przyjêty!");
		};
		B_GiveXP		(XP_BaalIsidroPayLares);	
	}
	else
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Lepiej przelicz jeszcze raz! Mam nadziejê, ¿e nie wyda³eœ ich na gorza³ê!
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
	description = "Czy to wystarczy, byœcie mnie przyjêli?";
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
	AI_Output (other, self,"ORG_801_Lares_Reicht_15_00"); //Czy to wystarczy, byœcie mnie przyjêli?
	
	if ( (Points_NC >= 29) && (hero.level >= 5) )
	{
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //Myœlê, ¿e tak!
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //I mam dla ciebie ma³y prezent! Lepszy pancerz. Mo¿e nie jest to szczyt marzeñ, ale zas³u¿y³eœ na niego.
	
	
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
		B_LogEntry               (CH1_AwansJakoKret,"Uda³o mi siê do³¹czyæ do Obozu i awansowaæ na Szkodnika. Lares by³ zadowolony z moich osi¹gniêæ. O innych Obozach mogê ju¿ zapomnieæ.");
		};
		
		if (MIS_OpinionInNewCamp == LOG_RUNNING)
		{
		MIS_OpinionInNewCamp = LOG_SUCCESS;
		Log_SetTopicStatus       (CH1_OpinionInNewCamp, LOG_SUCCESS);
		B_LogEntry              		 (CH1_OpinionInNewCamp,"Uda³o mi siê do³¹czyæ do Obozu i zostaæ Szkodnikiem. Jarvis okaza³ siê byæ dobrym przyjacielem. Jestem jego d³u¿nikiem.");
		};
		
		B_LogEntry				(CH1_JoinNC,	"Lares przyj¹³ mnie do swojej bandy. Od dziœ Nowy Obóz bêdzie moim nowym domem.");
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_SUCCESS);

		// Canceln der anderen Aufnahmen
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_JoinOC,	"Cz³onek bandy Laresa nie mo¿e do³¹czyæ do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry				(CH1_JoinPsi,	"Bractwo bêdzie musia³o radziæ sobie beze mnie. Od dziœ moim domem jest Nowy Obóz!");
		
		Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
		B_LogEntry               (CH1_BANDITOS_CAMP,"Bandyci bêd¹ musieli siê objeœæ beze mnie. No có¿. Nie mo¿na byæ ka¿dym. Teraz moim domem jest Nowy Obóz!");
		
		Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
		B_LogEntry				(CH1_EasyJoinOC,	"Nic nie wysz³o z mojego u³atwionego przyjêcia do Starego Obozu. Zosta³em cz³onkiem bany Laresa.");
		

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
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_02"); //Mordrag opowiedzia³ siê za tob¹.
		};
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_BringList))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_03"); //Sta³eœ siê bardzo popularny, odk¹d przynios³eœ nam tê listê.
		};
		AI_Output (self, other,"ORG_801_Lares_Reicht_11_04"); //Ale nie jesteœ gotowy. Popracuj nad sob¹ jeszcze trochê.
		
		if (hero.level < 5)
		{
		B_PrintGuildCondition(5);
		}
		else
		{
		PrintScreen	("Zbyt ma³a reputacja!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	description = "I co mam robiæ dalej?";
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
	AI_Output (other, self,"ORG_801_Lares_GotoKalom_15_00"); //I co mam robiæ dalej?
	AI_Output (self, other,"ORG_801_Lares_GotoKalom_11_01"); //Nale¿ysz teraz do naszej bandy. Mo¿esz robiæ, co ci siê ¿ywnie podoba.
		
	Log_CreateTopic		(CH1_GotoPsiCamp,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_RUNNING);
	B_LogEntry			(CH1_GotoPsiCamp,	"Bractwo Œni¹cego planuje coœ du¿ego. Lares, przywódca Szkodników z Nowego Obozu, chce siê dowiedzieæ, co to jest.");

	if	(Lares_InformMordrag == LOG_RUNNING)
	{	
		AI_Output 		(self, other,"ORG_801_Lares_GotoKalom_11_02"); //Jeœli chcesz robiæ coœ po¿ytecznego, pogadaj z Mordragiem i pomó¿ mu w sprawie Sekty.
		B_LogEntry		(CH1_GotoPsiCamp,	"Mam pomóc Mordragowi w wyjaœnieniu tej sprawy!");
	}
	else
	{
		var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
		if (Npc_IsDead(Mordrag))
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_03"); //Zgin¹³ Mordrag, jeden z naszych ludzi w Starym Obozie. Przed œmierci¹ zd¹¿y³ przys³aæ nam wiadomoœæ. Wygl¹da na to, ¿e w obozie Sekty dzieje siê coœ wa¿nego.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_04"); //Chcê, ¿ebyœ uda³ siê do obozu na bagnie i trochê tam powêszy³.
			B_LogEntry	(CH1_GotoPsiCamp,	"Wys³a³ mnie wprost do Obozu Bractwa.");
		}
		else
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_05"); //Wróci³ Mordrag, jeden z naszych ludzi w Starym Obozie.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_06"); //Chcê, ¿ebyœ z nim porozmawia³. Powiedz mu, ¿e potrzebujê wtyczki w obozie Sekty. Bractwo planuje coœ du¿ego, a ja chcê wiedzieæ, co siê tam dzieje.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_07"); //Masz mu pomóc.
			B_LogEntry	(CH1_GotoPsiCamp,	"Ma siê tym zaj¹æ Szkodnik imieniem Mordrag. Znajdê go w karczmie na jeziorze.");
			
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
	description		= "Gdzie mogê siê tu czegoœ nauczyæ?"; 
};

FUNC int  ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

FUNC void  ORG_801_Lares_WhereLearn_Info()
{
	AI_Output 		(other, self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Gdzie mogê siê tu czegoœ nauczyæ?
	AI_Output 		(self, other,"ORG_801_Lares_WhereLearn_Info_11_02"); //Na przyk³ad u mnie. Mogê ci pokazaæ, jak zwiêkszyæ twoj¹ si³ê i zrêcznoœæ.
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Lares mo¿e mi pokazaæ, jak zwiêkszyæ moj¹ si³ê i umiejêtnoœci.");

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
	description = "Chcê nauczyæ siê czegoœ nowego.";
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
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Chcê nauczyæ siê czegoœ nowego.
	
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
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_01"); //S³uchaj, jest sprawa. 
    AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_02"); //W czym problem?
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_03"); //Trzeba ostrzec naszych znajomych z Obozu Bandytów o tym, co siê dzieje. Byæ mo¿e niczego siê jeszcze nie spodziewaj¹.
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_04"); //Musimy im przekazaæ, ¿eby zachowali czujnoœæ. Stra¿nicy s¹ teraz zdolni do wszystkiego.
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_05"); //IdŸ do Draxa, to mój stary przyjaciel. Powiedz mu co siê dzieje, a przy okazji przynieœ mi jakieœ wieœci od niego. 
	
	//log
	MIS_RaportForLares = LOG_RUNNING;
    Log_CreateTopic         (CH4_RaportForLares, LOG_MISSION);
    Log_SetTopicStatus      (CH4_RaportForLares, LOG_RUNNING);
    B_LogEntry              (CH4_RaportForLares,"Lares kaza³ mi iœæ do Draxa i ostrzec Bandytów przed tym, co siê dzieje w Kolonii. ");
		
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded)) //&& (MIS_HuntersSupport == LOG_SUCCESS)
    {
		AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_09"); //Ju¿ rozmawia³em z Draxem. Spotka³em go przy œcie¿ce do placu wymian. 
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_10"); //I co u niego s³ychaæ?
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_11"); //Sytuacja nie wygl¹da najlepiej. Stra¿nicy Gomeza zabili Ratforda podczas polowania.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_12"); //Cholera, Ratford by³ w porz¹dku.
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_13"); //Drax ma pewien plan. Chce wraz z grup¹ Bandytów zemœciæ siê na Gomezie atakuj¹c krêc¹ce siê po okolicy grupy Stra¿ników.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_14"); //To by³oby bardzo nierozs¹dne. Mam nadziejê, ¿e Quentin go powstrzyma, albo zrobi siê niez³y burdel...
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_15"); //Zreszt¹ nie mam czasu teraz o tym myœleæ. Mamy inne problemy. 
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_16"); //Pos³uchaj: Torlof z kilkoma Najemnikami uda³ siê do doliny, w której przesiaduje Aidan. Chc¹ wypêdziæ Stra¿ników, którzy siê tam rozplenili.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_17"); //Powinieneœ iœæ im pomóc. Zg³oœ siê do Torlofa.
        B_LogEntry                     (CH4_RaportForLares,"Uprzedzi³em polecenie Laresa i ju¿ wczeœniej rozmawia³em z Draxem. Przekaza³em szefowi Szkodników wszystko, czego siê dowiedzia³em w Obozie. Ostrze¿enia nie by³y potrzebne. Bandyci maj¹ w³asny plan.");
        Log_SetTopicStatus       (CH4_RaportForLares, LOG_SUCCESS);
        MIS_RaportForLares = LOG_SUCCESS;
		
		B_Story_SoldiersValleyDefense ();
		Npc_ExchangeRoutine (BAN_1613_Doyle,"zwial");
	

	
        B_GiveXP (670);
        MIS_TorlofNeedHelp = LOG_RUNNING;

        Log_CreateTopic          (CH4_TorlofNeedHelp, LOG_MISSION);
        Log_SetTopicStatus       (CH4_TorlofNeedHelp, LOG_RUNNING);
        B_LogEntry               (CH4_TorlofNeedHelp,"Lares chce ¿ebym poszed³ do Torlofa i pomóg³ mu pozbyæ siê Stra¿ników z doliny, w której zazwyczaj poluje Aidan.");
    }
    else
    {
	AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_06"); //Myœlê, ¿e to nie problem.
    AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_07"); //Jasne. Zrobiê co w mojej mocy.
    AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_08"); //Dziêki, m³ody.  
    };
	
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Spotka³em siê z Laresem. Stosunki pomiêdzy obozami pogarszaj¹ siê. Muszê stosowaæ siê do instrukcji Szkodnika, aby pomóc naszym przyjacio³om w innych obozach.");
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
   description	= "Rozmawia³em z Draxem.";
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
    AI_Output (other, self ,"DIA_Lares_SYTUACJA_W_OB_15_01"); //Rozmawia³em z Draxem.
		AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_10"); //I co u niego s³ychaæ?
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_11"); //Sytuacja nie wygl¹da najlepiej. Stra¿nicy Gomeza zabili Ratforda podczas polowania.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_12"); //Cholera, Ratford by³ w porz¹dku.
        AI_Output (other, self ,"DIA_Lares_DRAX_CH4_15_13"); //Drax ma pewien plan. Chce wraz z grup¹ Bandytów zemœciæ siê na Gomezie atakuj¹c krêc¹ce siê po okolicy grupy Stra¿ników.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_14"); //To by³oby bardzo nierozs¹dne. Mam nadziejê, ¿e Quentin go powstrzyma, albo zrobi siê niez³y burdel...
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_15"); //Zreszt¹ nie mam czasu teraz o tym myœleæ. Mamy inne problemy. 
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_16"); //Pos³uchaj: Torlof z kilkoma Najemnikami uda³ siê do doliny, w której przesiaduje Aidan. Chc¹ wypêdziæ Stra¿ników, którzy siê tam rozplenili.
        AI_Output (self, other ,"DIA_Lares_DRAX_CH4_03_17"); //Powinieneœ iœæ im pomóc. Zg³oœ siê do Torlofa.
		
    B_LogEntry               (CH4_RaportForLares,"Przekaza³em szefowi Szkodników wszystko, czego siê dowiedzia³em od Draxa. Pomimo kiepskiej sytuacji w Obozie Bandytów Lares postanowi³ zleciæ mi inne zadanie. Mam teraz iœæ do Torlofa i pomóc mu pozbyæ siê Stra¿ników z doliny.");
    Log_SetTopicStatus       (CH4_RaportForLares, LOG_SUCCESS);
    MIS_RaportForLares = LOG_SUCCESS;
	B_Story_SoldiersValleyDefense ();
	Npc_ExchangeRoutine (BAN_1613_Doyle,"zwial");
	B_GiveXP (670);
		
		MIS_TorlofNeedHelp = LOG_RUNNING;

        Log_CreateTopic          (CH4_TorlofNeedHelp, LOG_MISSION);
        Log_SetTopicStatus       (CH4_TorlofNeedHelp, LOG_RUNNING);
        B_LogEntry               (CH4_TorlofNeedHelp,"Lares chce ¿ebym poszed³ do Torlofa i pomóg³ mu siê pozbyæ Stra¿ników z doliny, w której zazwyczaj poluje Aidan.");
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
   description	= "Pomog³em Torlofowi.";
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
    AI_Output (other, self ,"DIA_Lares_POMOC_TORLOFOWI_15_01"); //Pomog³em Torlofowi.
    AI_Output (self, other ,"DIA_Lares_POMOC_TORLOFOWI_03_02"); //Œwietnie! IdŸ teraz do Lee. Chyba ma jakieœ ambitniejsze plany. Przyda mu siê pomoc.
	
	//zadanie - zakoñczenie
	//kluczowe do postêpu (odblokowuje dilaog z Lee)
    B_LogEntry               (CH4_TorlofNeedHelp ,"Poinformowa³em Laresa, ¿e za³atwi³em sprawê z Torlofem. Muszê siê teraz udaæ do Lee. Przywódca Najemników ma ponoæ jakieœ plany.");
    Log_SetTopicStatus       (CH4_TorlofNeedHelp , LOG_SUCCESS);
    MIS_TorlofNeedHelp  = LOG_SUCCESS;
	
	//zadanie - wpis dla cz³onków bractwa
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Pomog³em Najemnikowi Torlofowi pozbyæ siê Stra¿ników Gomeza z doliny. Jednak moje zadanie jeszcze siê nie koñczy. Muszê porozmawiaæ z samym Lee.");
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
   description	= "Przysy³a mnie Lee.";
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
    AI_Output (other, self ,"DIA_Lares_POTZREBNI_LUDZIE_15_01"); //Przysy³a mnie Lee. Postanowiliœmy wznowiæ wydobycie w Opuszczonej Kopalni. Co o tym s¹dzisz?
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_02"); //Niez³y pomys³. Ruda zawsze siê przyda.
    AI_Output (other, self ,"DIA_Lares_POTZREBNI_LUDZIE_15_03"); //Jest pewien problem, Lee nie ma doœæ ludzi, by wys³aæ ich do kopalni...
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_04"); //I niby ja mia³bym wys³aæ swoich Szkodników, tak? W momencie, gdy ludzie Gomeza bezkarnie zabijaj¹ naszych myœliwych i lada chwila mog¹ pojawiæ siê w Nowym Obozie?
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_05"); //O nie! Wiem, ¿e wam zale¿y, ale ryzyko jest zbyt du¿e.
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_06"); //Pogadaj z przywódc¹ Bandytów. Przecie¿ to on pierwszy chcia³ odbijaæ kopalniê Gomezowi.
    AI_Output (other, self ,"DIA_Lares_POTZREBNI_LUDZIE_15_07"); //Twierdzisz, ¿e to by³o z³e posuniêcie?
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_08"); //Mo¿e tak, a mo¿e nie.
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_09"); //Pomyœl, jeœli Gomez mia³by nowe Ÿród³o rudy z pewnoœci¹ by siê uspokoi³. By³aby szansa na przynajmniej tymczasowe z³agodzenie konfliktów.
    AI_Output (self, other ,"DIA_Lares_POTZREBNI_LUDZIE_03_10"); //Zreszt¹... czas poka¿e jakie to bêdzie mia³o skutki.
    B_LogEntry                     (CH4_NC_Mine,"Lares radzi, ¿eby iœæ do Quentina. Najpierw jednak muszê pogadaæ z Lee. ");

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
   description	= "Jak to jest nale¿eæ do twojej bandy?";
};

FUNC INT DIA_Lares_PLOTKI1_Condition()
{
    return TRUE;
    
};


FUNC VOID DIA_Lares_PLOTKI1_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTKI1_15_01"); //Jak to jest nale¿eæ do twojej bandy?
	AI_Output (self, other ,"DIA_Lares_PLOTKI1_03_02"); //A co ciê to obchodzi? Ma³o masz problemów ¿ó³todziobie?
	AI_Output (self, other ,"DIA_Lares_PLOTKI1_03_03"); //Powiem tyle: w mojej bandzie mo¿esz robiæ co chcesz. 
	AI_Output (self, other ,"DIA_Lares_PLOTKI1_03_04"); //Nie denerwuj tylko Magów Wody. Moi ludzie pracuj¹ dla nich jako kurierzy. Nie chcê, by zrezygnowali z naszych us³ug.
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
   description	= "Jak zosta³eœ przywódc¹ Szkodników?";
};

FUNC INT DIA_Lares_PLOTECZKI2_Condition()
{

    return TRUE;
    
};


FUNC VOID DIA_Lares_PLOTECZKI2_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTECZKI2_15_01"); //Jak zosta³eœ przywódc¹ Szkodników? Myœla³em, ¿e dowodzenie tak¹ band¹ nie jest ³atwym zadaniem.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_02"); //Przed wrzuceniem za Barierê przez wiele lat para³em siê kradzie¿¹. W Myrtanie cieszy³em siê doœæ du¿ym szacunkiem wœród z³odziei.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_03"); //Nieraz udawa³o mi siê oskubaæ niezwykle czujnych kupców.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_04"); //Moje zdolnoœci doceniono i tutaj. Dziêki nim stan¹³em na czele Szkodników.
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI2_03_05"); //A w³aœciwie po co ja ci to mówiê? I tak skoñczysz z poder¿niêtym gard³em.
	AI_Output (other, self ,"DIA_Lares_PLOTECZKI2_15_06"); //By³em po prostu ciekawy.
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
   description	= "Co myœlisz o Lee i jego Najemnikach?";
};

FUNC INT DIA_Lares_PLOTECZKI3_Condition()
{

    return TRUE;
    
};


FUNC VOID DIA_Lares_PLOTECZKI3_Info()
{
    AI_Output (other, self ,"DIA_Lares_PLOTECZKI3_15_01"); //Co myœlisz o Lee i jego Najemnikach?
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI3_03_02"); //Myœlê, ¿e Lee to œwietny przywódca. Odk¹d go tylko pozna³em, zacz¹³em go darzyæ szacunkiem. 
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI3_03_03"); //Niestety moi ludzie to rzezimieszki i nieraz podpadli Najemnikom. Ogólnie nasze gildie za sob¹ nie przepadaj¹.
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
   description	= "Gdzie mogê dostaæ lepszy pancerz?";
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
    AI_Output (other, self ,"DIA_Lares_PLOTECZKI4_15_01"); //Gdzie mogê dostaæ lepszy pancerz?
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI4_03_02"); //Pogadaj z Wilkiem. To on zajmuje siê takimi rzeczami.
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
   description	= "Co s³ychaæ?";
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
AI_Output (other, self ,"DIA_Lares_PLOTECZKI5_15_01"); //Co s³ychaæ?
if (kapitel <= 2)
{  
    AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_02"); //Wszystko w porz¹dku, od twojego przyjêcia nie zdarzy³o siê nic specjalnego. 
	}
	else if kapitel == 3
	{
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_03"); //Mordrag powiedzia³ mi wszystko co planuje Bractwo. Ciekawy jestem jak to siê potoczy.
	}
	else if kapitel == 3
	{
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_04"); //Te sukinsyny ze Starego Obozu zajê³y nasz¹ kopalnie. Ale ju¿ wkrótce Gomez dostanie to na co zas³uguje. Nie bêdziemy siedzieæ bezczynnie.
	}
	else if (Npc_KnowsInfo(hero,DIA_Lee_CZYSTKA_W_KOPALNI))
	{
	AI_Output (self, other ,"DIA_Lares_PLOTECZKI5_03_04"); //Dobrze, ¿e Wolna Kopalnia jest w naszych rêkach. Wilk mówi³, ¿e to twoja zas³uga. Œwietnie siê spisa³eœ przyjacielu. 
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
    AI_Output (self, other ,"DIA_Lares_NAJMENIK_BEZI_03_01"); //Widzê, ¿e Lee przyj¹³ ciê do Najemników. Spokojnie, nie chowam urazy. 
	if herowas_ORG
	{
	AI_Output (self, other ,"DIA_Lares_NAJMENIK_BEZI_03_02"); //Mam tylko nadziejê, ¿e nie zapomnisz kim by³eœ i nie zaczniesz narzekaæ na nas. 
	}
	else 
	{
	AI_Output (self, other ,"DIA_Lares_NAJMENIK_BEZI_03_03"); //Mam nadziejê, ¿e w razie czego bêdzie mo¿na na ciebie liczyæ! 
	};
};




