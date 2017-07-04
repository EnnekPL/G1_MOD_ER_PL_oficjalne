// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Witaj, magu!";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Witaj, magu!
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum störst du den Hüter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "Mam tu list dla Arcymistrza Magów Ognia.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Mam tu list dla Arcymistrza Magów Ognia.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //My jesteœmy Magami Wody. Magów z Krêgu Ognia znajdziesz w Starym Obozie.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Ale stra¿nicy nie chc¹ mnie wpuœciæ do zamku? Mo¿esz mi jakoœ pomóc?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Có¿, co jakiœ czas wysy³amy kurierów do naszych braci ze Starego Obozu...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ale przesy³ki powierzamy wy³¹cznie ludziom Laresa. Od wielu lat jego ch³opcy dbaj¹ o to, by nasze przesy³ki dociera³y do Magów Ognia nienaruszone.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Cronos z polecenia Magów Wody wysy³a kurierów do Magów Ognia. Przesy³ki jednak powierza tylko ludziom Laresa.");
	};
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Chcecie ponoæ zniszczyæ Magiczn¹ Barierê. Jak zamierzacie tego dokonaæ?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcecie ponoæ zniszczyæ Magiczn¹ Barierê. Jak zamierzacie tego dokonaæ?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Próbujemy zgromadziæ w jednym miejscu mo¿liwie du¿¹ iloœæ magicznej rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Podczas wielkiego rytua³u, ca³a skumulowana w rudzie magiczna energia zostanie wyzwolona i Bariera pryœnie jak mydlana bañka!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Naturalnie tak wielka iloœæ rudy przyci¹ga tutaj ró¿nych w³óczêgów i bandytów!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Dlatego potrzebujemy wielu ludzi do pilnowania naszych zapasów.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "Chcia³bym do was do³¹czyæ!";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Chcia³bym do was do³¹czyæ!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Jeœli chcesz zostaæ jednym z nas, powinieneœ porozmawiaæ z Lee albo z Laresem.
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "Chcia³bym zostaæ magiem!";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Chcia³bym zostaæ magiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nie mo¿emy dzieliæ siê nasz¹ wiedz¹ z przeciwnikiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Dopóki nie przekonasz nas o swojej lojalnoœci, nie masz nawet o czym marzyæ - nie bêdziemy ciê uczyli!
};

////////////////////////
// MOD
////////////////////////

//========================================
//-----------------> CourierFireMage_QuestCont
//========================================

INSTANCE DIA_Cronos_CourierFireMage_QuestCont (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_CourierFireMage_QuestCont_Condition;
   information  = DIA_Cronos_CourierFireMage_QuestCont_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Corristo. Mam dla ciebie paczkê.";
};

FUNC INT DIA_Cronos_CourierFireMage_QuestCont_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Corristo_QUestSucces))
    && (Npc_HasItems (other, ItMis_PaczkaMagowOgnia) >=1)
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_CourierFireMage_QuestCont_Info()
{
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_01"); //Przysy³a mnie Corristo. Mam dla ciebie paczkê.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_02"); //No w koñcu. D³ugo na to czeka³em. 
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_03"); //Co ciê zatrzyma³o?
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_04"); //Poprzedni pos³aniec zosta³ zamordowany i paczka trafi³a w rêce Bandytów.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_05"); //Dziêki Adanosowi, ¿e uda³o wam siê ja odzyskaæ.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_06"); //S¹ w niej niezwykle stare, magiczne pierœcienie.
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_07"); //Oto paczka.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_08"); //Doskonale. Zanim wrócisz do Starego Obozu, udaj siê do karczmy na jeziorze.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_09"); //Czeka tam na ciebie Roscoe, prawa rêka Laresa.
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_10"); //Czego chce?
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_11"); //Nie wiem. Prosi³ mnie tylko, bym ciê do niego przys³a³.
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_12"); //W takim razie pójdê do niego.
    B_LogEntry                     (CH2_CourierFireMage,"Odda³em paczkê Cronosowi. Mag poleci³ mi zajrzeæ do karczmy na jeziorze. Podobno czeka tam na mnie Roscoe - prawa rêka Laresa.");
	Npc_ExchangeRoutine (ORG_840_Roscoe, "spotkanie");
    B_GiveXP (150);
    B_GiveInvItems (other, self, ItMis_PaczkaMagowOgnia, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> JosepAmulet
//========================================

INSTANCE DIA_Cronos_JosepAmulet (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_JosepAmulet_Condition;
   information  = DIA_Cronos_JosepAmulet_Info;
   permanent	= FALSE;
   description	= "Mam przy sobie taki amulet...";
};

FUNC INT DIA_Cronos_JosepAmulet_Condition()
{
    if (Npc_HasItems (other, JosepSamulet) >=1) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_JosepAmulet_Info()
{
    AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_01"); //Mam przy sobie taki amulet...
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_02"); //Mia³ go jeden z myœliwych. Dodam, ¿e zachowywa³ siê dziwnie. Zupe³nie jakby coœ go opêta³o.
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_03"); //Czy to mo¿e mieæ jakiœ zwi¹zek z tym amuletem? Przyznam, ¿e czujê siê nieswojo od kiedy go mam.
    AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_04"); //Poka¿ mi ten artefakt, ch³opcze. 
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_05"); //To niezwykle rzadka rzecz. Móg³ byæ wykuty nawet sto lat temu w kuŸni jakiegoœ szalonego kowala.
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_06"); //Szalonego kowala? Mo¿esz mi powiedzieæ o tym coœ wiêcej?
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_07"); //Widzê tutaj znaki pozwalaj¹ce na skumulowanie czarnej magii. W pierœcieniu, po wykuciu zosta³ zaklêty demon. 
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_08"); //Naprawdê, niesamowite. D³ugo ju¿ go masz?
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_09"); //Jakiœ czas...
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_10"); //Musisz mieæ naprawdê siln¹ duszê, skoro stawia³eœ opór demonowi. Temu myœliwemu siê najwidoczniej nie uda³o. Có¿, nic dziwnego.
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_11"); //Wezmê go i zabezpieczê. Dziêkujê, ¿e z tym do mnie przyszed³eœ.
    B_GiveXP (150);
    B_GiveInvItems (other, self, JosepSamulet, 1);
    Npc_RemoveInvItems (self, JosepSamulet, 1);
};



///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Masz jak¹œ wiadomoœæ dla Magów Ognia?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) ) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jestem teraz jednym z ludzi Laresa. Masz jak¹œ wiadomoœæ dla Magów Ognia, któr¹ móg³bym dostarczyæ do Starego Obozu?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //W rzeczy samej, mam. Ale bez specjalnego znaku kurierskiego ludzie Gomeza nie wpuszcz¹ ciê do zamku.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Masz, oto list i znak. Tylko siê pospiesz!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	Log_CreateTopic		(CH1_KdWCourier, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_KdWCourier, LOG_RUNNING);
    B_LogEntry                (CH1_KdWCourier,"Po do³¹czeniu do Nowego Obozu, Cronos poprosi³ mnie abym zaniós³ list zaadresowany do Magów Ognia. Da³ mi równie¿ amulet kuriera. Œwietnie! Bêdê móg³ upiec dwie pieczenie na jednym ogniu. ");
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "Dostarczy³em twoje pismo!";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_NochEinBrief))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Dostarczy³em twoje pismo!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ach, dobrze! Oto drobny prezent, w nagrodê za twoje trudy...
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	Cronos_Messenger = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_KdWCourier, LOG_SUCCESS);
    B_LogEntry               (CH1_KdWCourier,"Za zabawê w kuriera otrzyma³em od Cronosa trochê rudy. Lepszy rydz ni¿ nic...");

	B_GiveXP(XP_CronosLetter);
};

////////////////////////////////////////////////
// AWANS NA MAGA WODY 
////////////////////////////////////////////////

// *****************************************
//					WannaMage2
// *****************************************

instance  KDW_604_Cronos_WannaMage2 (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage2_Condition;
	information	=  KDW_604_Cronos_WannaMage2_Info;
	permanent	=  0;
	description = "Chcia³bym zostaæ magiem! Lee mnie przys³a³.";
};                       

FUNC int  KDW_604_Cronos_WannaMage2_Condition()
{
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	&& (Npc_GetTrueGuild (hero) == GIL_ORG)
	{
		return TRUE;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage2_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage2_15_00"); //Chcia³bym zostaæ magiem! Lee mnie przys³a³. Zaproponowa³ mi bycie Najemnikiem, jednak mnie interesuje œcie¿ka magii.
	AI_Output (self, other,"DIA_Cronos_WannaMage2_08_01"); //Dowiedzia³em siê czego dokona³eœ w Starej Kopalni. Jesteœ te¿ lojalnym cz³onkiem naszego Obozu. Myœlê, ¿e Saturas przyjmie ciê w poczet Magów Wody.
	AI_Output (self, other,"DIA_Cronos_WannaMage2_08_02"); //Udaj siê do niego. Has³o dla stra¿ników brzmi: TETRIANDOCH.
	player_chose_WaterMages = true;
};
///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam wa¿n¹ wiadomoœæ dla Saturasa!";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	&& (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Mam wa¿n¹ wiadomoœæ dla Saturasa!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Có¿ mo¿e byæ tak wa¿nego, byœ mia³ przeszkadzaæ naszemu wielkiemu przywódcy w jego badaniach?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cor Kalom opuœci³ obóz Bractwa!";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)) && (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opuœci³ obóz Bractwa z grup¹ fanatycznych Stra¿ników Œwi¹tynnych!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Zamierza na w³asn¹ rêkê odnaleŸæ Œni¹cego i przebudziæ go za wszelk¹ cenê.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nigdy nie ufa³em temu cz³owiekowi. Wielki Guru czy nie - to pró¿ny i nieszczery cz³owiek zdolny do wszystkiego.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bractwo da sobie radê i bez niego!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Powtórzê twoje informacje Saturasowi przy najbli¿szej okazji. Mo¿esz ju¿ odejœæ!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y'Berion, duchowy przywódca Bractwa Œni¹cego, nie ¿yje!";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)) && (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Berion, duchowy przywódca Bractwa Œni¹cego, nie ¿yje!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //CO?!? Jak to siê sta³o?!
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bractwo przeprowadzi³o rytua³ przyzwania Œni¹cego.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Wygl¹da na to, ¿e Y'Berion nie by³ w stanie wytrzymaæ tak wielkiego obci¹¿enia.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To smutna wiadomoœæ. Na Y'Berionie zawsze mo¿na by³o polegaæ.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Ale to jeszcze nie powód, ¿eby przeszkadzaæ Saturasowi.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Guru zorientowali siê, ¿e oddawali czeœæ potê¿nemu demonowi z piek³a rodem!";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS)) && (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zorientowali siê, ¿e oddawali czeœæ potê¿nemu demonowi z piek³a rodem!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Raptem doszli do wniosku, ¿e Œni¹cy jest demonem?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //To mi wygl¹da na kolejny szalony pomys³ ludzi z Bractwa, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...Gdyby okaza³o siê, ¿e maj¹ racjê... Ca³a Kolonia znalaz³aby siê w œmiertelnym niebezpieczeñstwie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Powtórzysz te informacje samemu Saturasowi. On zdecyduje co nam wypada czyniæ.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Gdzie znajdê Saturasa?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //WejdŸ na wy¿szy poziom. Powiedz stra¿nikom, ¿e pozwoli³em ci przejœæ.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Has³o brzmi TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturasa znajdziesz przy wielkim pentagramie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //W zasadzie siê stamt¹d nie rusza. Ca³y czas obmyœla sposób na wysadzenie kopca rudy.

	B_LogEntry			(CH3_EscapePlanNC,	"Cronos pozwoli³ mi spotkaæ siê z Saturasem na górnym poziomie. Arcymistrz Krêgu Wody przebywa zwykle w pobli¿u magicznego pentagramu. Has³o, które mam podaæ stra¿nikowi brzmi... Cholera, jak to sz³o?!");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak brzmia³o to has³o?";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS)) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jak brzmia³o to has³o?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Ju¿ moja œwiêtej pamiêci babcia mia³a lepsz¹ pamiêæ od ciebie. Has³o brzmi "TETRIANDOCH".
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas powiedzia³, ¿e masz dla mnie nagrodê.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas powiedzia³, ¿e masz dla mnie nagrodê.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako stra¿nik rudy, chcia³bym podarowaæ ci czêœæ naszego urobku jako nagrodê za zas³ugi dla Nowego Obozu.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Mam nadziejê, ¿e zrobisz z tej rudy równie dobry u¿ytek jak my!

	B_LogEntry		(CH3_BringFoci,	"Dosta³em od Cronosa mnóstwo rudy, chocia¿ w porównaniu z wielkim kopcem nie jest to zbyt wiele.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //M¹drze post¹pi³eœ przystêpuj¹c do Magów Wody. B¹dŸ pozdrowiony, bracie!
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê wiêkszej mocy magicznej."; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Potrzebujê wiêkszej mocy magicznej.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Mogê ci pokazaæ, jak zwiêkszyæ twoje zdolnoœci magiczne. Jak je wykorzystasz zale¿y ju¿ tylko od ciebie.
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 1);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	//&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Poszukujê magicznych ksi¹g.
	
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, magu!"; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Witaj, magu!
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Niech b³ogos³awieñstwo Adanosa zawsze bêdzie z tob¹. Mogê ci pomóc zwiêkszyæ twoje magiczne moce lub zaopatrzyæ ciê w kilka po¿ytecznych przedmiotów.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co mogê dla ciebie zrobiæ?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos sprzedaje magiczne przedmioty, takie jak runy, zwoje i pierœcienie. Znajdê go przy kracie nad wielkim kopcem rudy."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mo¿e mi pomóc w zwiêkszeniu mojej many. Znajdê go przy kracie, nad wielkim kopcem rudy.");
};



//========================================
//-----------------> Ore_Many
//========================================

INSTANCE DIA_Cronos_Ore_Many (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_Ore_Many_Condition;
   information  = DIA_Cronos_Ore_Many_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o kopcu rudy?";
};

FUNC INT DIA_Cronos_Ore_Many_Condition()
{
    if (wiecejOre == true)
    && (Npc_KnowsInfo (hero, DIA_Aidan_BROWAE))
    && (MIS_TestOc == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_Ore_Many_Info()
{
    AI_Output (other, self ,"DIA_Cronos_Ore_Many_15_01"); //Co mo¿esz mi powiedzieæ o kopcu rudy?
    AI_Output (other, self ,"DIA_Cronos_Ore_Many_15_02"); //Du¿o tam tego macie?
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_03"); //Trochê tego jest. Wszystkiego oko³o 50 skrzyñ.
    AI_Output (other, self ,"DIA_Cronos_Ore_Many_15_04"); //Jednak wasz Obóz nie jest zbyt bogaty.
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_05"); //Nie prowadzimy wymiany handlowej ze Œwiatem Zewnêtrznym, wiêc siê nie dziwiê.
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_06"); //Ruda, któr¹ tutaj zbieramy ma okreœlony cel.
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_07"); //IdŸ ju¿.
	B_LogEntry                     (CH1_TestOc,"Nowy Obóz ma 50 skrzyñ rudy z których usypany jest kopiec. ");
    knowsOre = true;
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////
// Theft
///////////////////////////////////////////////

INSTANCE DIA_Cronos_KRADZIEZ (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_KRADZIEZ_Condition;
   information  = DIA_Cronos_KRADZIEZ_Info;
   important	= TRUE;
   permanent 	= FALSE;
};

FUNC INT DIA_Cronos_KRADZIEZ_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_SLD)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_KRADZIEZ_Info()
{
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_01"); //PodejdŸ bli¿ej, Najemniku.
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_02"); //W czym rzecz?
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_03"); //Jesteœ tu od niedawna, a mimo to wielu siê z tob¹ liczy. Mam dla ciebie pewne zadanie.
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_04"); //Jestem tu, by pomagaæ magom. 
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_05"); //Kilka dni temu zosta³em okradziony przez jakiegoœ rzezimieszka. To cz³owiek Laresa, tego jestem pewien. 
	AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_06"); //Wiesz kim jest?
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_07"); //Nie, kradzie¿y dokonano noc¹. Zostawi³em sakiewkê z magicznymi precjozami obok le¿¹cych nieopodal k³ód drewna i oddali³em siê na chwilê.
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_08"); //Z daleka dostrzeg³em jak jakiœ Szkodnik zabiera moj¹ w³asnoœæ. 
	AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_09"); //Pobieg³ z ni¹ pod tamê i zrzuci³ na dó³, a potem znikn¹³ mi z oczu. Ni¿ej prawdopodobnie czeka³ jego wspólnik, który z³apa³ woreczek z precjozami. 
	AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_10"); //Najemnicy stoj¹cy przy bramie zapewnili mnie, ¿e nikt tamtêdy nie wychodzi³ przez ca³¹ noc. Jeden ze z³odziei musi byæ wci¹¿ w obozie. 
	AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_11"); //Spróbuj go znaleŸæ i odzyskaæ sakiewkê. Znajduj¹ siê tam fragmenty rozmaitych artefaktów. W niepowo³anych rêkach s¹ bardzo niebezpieczne. 
    MIS_CronosArtifacts = LOG_RUNNING;

    Log_CreateTopic          (CH1_MagicySzkodnicy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MagicySzkodnicy, LOG_RUNNING);
    B_LogEntry               (CH1_MagicySzkodnicy,"Cronos zosta³ okradziony z magicznych precjozów, które na chwilê nieumyœlnie spuœci³ z oczu. Z³odziejem jest jeden ze Szkodników, oraz jego nieznany wspólnik. Muszê powêszyæ w obozie i poszukaæ wskazówki.");
	
	Npc_ExchangeRoutine (ORG_816_Organisator,"magic");
   // nastêpny dialog!! AI_StopProcessInfos	(self);
};

//========================================
//-----------------> END_QUEST
//========================================

INSTANCE DIA_Cronos_END_QUEST (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 2;
   condition    = DIA_Cronos_END_QUEST_Condition;
   information  = DIA_Cronos_END_QUEST_Info;
   permanent	= FALSE;
   description	= "Znalaz³em twoje skarby.";
};

FUNC INT DIA_Cronos_END_QUEST_Condition()
{
    if (MIS_CronosArtifacts == LOG_RUNNING)  
    && (Npc_HasItems (hero, ItMi_CronosPrecious) ==1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_END_QUEST_Info()
{
    AI_Output (other, self ,"DIA_Cronos_END_QUEST_15_01"); //Znalaz³em twoje skarby.
    AI_Output (self, other ,"DIA_Cronos_END_QUEST_03_02"); //Doskonale. Czy z³odzieje s¹ w obozie?
	AI_Output (other, self ,"DIA_Cronos_END_QUEST_15_03"); //Jeden jest, ale raczej nie uda siê ju¿ z nim porozmawiaæ. Có¿, nie nadaje siê do tego...
    AI_Output (self, other ,"DIA_Cronos_END_QUEST_03_03"); //Rozumiem. WeŸ czêœæ naszego urobku w nagrodê. 
	
    B_LogEntry                     (CH1_MagicySzkodnicy,"Odda³em Cronosowi skradzion¹ w³asnoœæ. Mag wynagrodzi³ mnie rud¹.");
    Log_SetTopicStatus       (CH1_MagicySzkodnicy, LOG_SUCCESS);
    MIS_CronosArtifacts = LOG_SUCCESS;

    B_GiveXP (200);
	CreateInvItems (self, itminugget, 150);
	B_GiveInvItems (self, hero, itminugget, 150);
	
	B_GiveInvItems (hero, self, ItMi_CronosPrecious, 1);
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HERBATKA
//========================================

INSTANCE DIA_Cronos_HERBATKA (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_HERBATKA_Condition;
   information  = DIA_Cronos_HERBATKA_Info;
   permanent	= FALSE;
   description	= "Potrzebna mi herbatka na zatrucia alkoholowe.";
};

FUNC INT DIA_Cronos_HERBATKA_Condition()
{
    if (herbatka_crnonos == true) && (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_HERBATKA_Info()
{
    AI_Output (other, self ,"DIA_Cronos_HERBATKA_15_01"); //Potrzebna mi herbatka na zatrucia alkoholowe.
    AI_Output (self, other ,"DIA_Cronos_HERBATKA_03_02"); //Mam kilka w swojej ofercie. S¹ doœæ drogie. Kosztuj¹ 50 bry³ek rudy, ale warto. 
    CreateInvItems (self, It_HerbatkaNaKaca, 10);

};


