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
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum st�rst du den H�ter des Erzes?
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
	description = "Mam tu list dla Arcymistrza Mag�w Ognia.";
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
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Mam tu list dla Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //My jeste�my Magami Wody. Mag�w z Kr�gu Ognia znajdziesz w Starym Obozie.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Ale stra�nicy nie chc� mnie wpu�ci� do zamku? Mo�esz mi jako� pom�c?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //C�, co jaki� czas wysy�amy kurier�w do naszych braci ze Starego Obozu...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ale przesy�ki powierzamy wy��cznie ludziom Laresa. Od wielu lat jego ch�opcy dbaj� o to, by nasze przesy�ki dociera�y do Mag�w Ognia nienaruszone.
	if MIS_Massage == LOG_RUNNING
	{
    B_LogEntry               (CH1_Massage,"Cronos z polecenia Mag�w Wody wysy�a kurier�w do Mag�w Ognia. Przesy�ki jednak powierza tylko ludziom Laresa.");
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
	description = "Chcecie pono� zniszczy� Magiczn� Barier�. Jak zamierzacie tego dokona�?";
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
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcecie pono� zniszczy� Magiczn� Barier�. Jak zamierzacie tego dokona�?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Pr�bujemy zgromadzi� w jednym miejscu mo�liwie du�� ilo�� magicznej rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Podczas wielkiego rytua�u, ca�a skumulowana w rudzie magiczna energia zostanie wyzwolona i Bariera pry�nie jak mydlana ba�ka!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Naturalnie tak wielka ilo�� rudy przyci�ga tutaj r�nych w��cz�g�w i bandyt�w!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Dlatego potrzebujemy wielu ludzi do pilnowania naszych zapas�w.
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
	description = "Chcia�bym do was do��czy�!";
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
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Chcia�bym do was do��czy�!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Je�li chcesz zosta� jednym z nas, powiniene� porozmawia� z Lee albo z Laresem.
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
	description = "Chcia�bym zosta� magiem!";
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
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Chcia�bym zosta� magiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nie mo�emy dzieli� si� nasz� wiedz� z przeciwnikiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Dop�ki nie przekonasz nas o swojej lojalno�ci, nie masz nawet o czym marzy� - nie b�dziemy ci� uczyli!
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
   description	= "Przysy�a mnie Corristo. Mam dla ciebie paczk�.";
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
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_01"); //Przysy�a mnie Corristo. Mam dla ciebie paczk�.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_02"); //No w ko�cu. D�ugo na to czeka�em. 
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_03"); //Co ci� zatrzyma�o?
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_04"); //Poprzedni pos�aniec zosta� zamordowany i paczka trafi�a w r�ce Bandyt�w.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_05"); //Dzi�ki Adanosowi, �e uda�o wam si� ja odzyska�.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_06"); //S� w niej niezwykle stare, magiczne pier�cienie.
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_07"); //Oto paczka.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_08"); //Doskonale. Zanim wr�cisz do Starego Obozu, udaj si� do karczmy na jeziorze.
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_09"); //Czeka tam na ciebie Roscoe, prawa r�ka Laresa.
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_10"); //Czego chce?
    AI_Output (self, other ,"DIA_Cronos_CourierFireMage_QuestCont_03_11"); //Nie wiem. Prosi� mnie tylko, bym ci� do niego przys�a�.
    AI_Output (other, self ,"DIA_Cronos_CourierFireMage_QuestCont_15_12"); //W takim razie p�jd� do niego.
    B_LogEntry                     (CH1_CourierFireMage,"Odda�em paczk� Cronosowi. Mag poleci� mi zajrze� do karczmy na jeziorze. Podobno czeka tam na mnie Roscoe - prawa r�ka Laresa.");
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
    if (Npc_HasItems (other, JosepSamulet) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_JosepAmulet_Info()
{
    AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_01"); //Mam przy sobie taki amulet...
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_02"); //Mia� go jeden z my�liwych. Dodam, �e zachowywa� si� dziwnie. Zupe�nie jakby co� go op�ta�o.
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_03"); //Czy to mo�e mie� jaki� zwi�zek z tym amuletem? Przyznam, �e czuj� si� nieswojo od kiedy go mam.
    AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_04"); //Poka� mi ten artefakt, ch�opcze. 
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_05"); //To niezwykle rzadka rzecz. M�g� by� wykuty nawet sto lat temu w ku�ni jakiego� szalonego kowala.
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_06"); //Szalonego kowala? Mo�esz mi powiedzie� o tym co� wi�cej?
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_07"); //Widz� tutaj znaki pozwalaj�ce na skumulowanie czarnej magii. W pier�cieniu, po wykuciu zosta� zakl�ty demon. 
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_08"); //Naprawd�, niesamowite. D�ugo ju� go masz?
	AI_Output (other, self ,"DIA_Cronos_JosepAmulet_15_09"); //Jaki� czas...
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_10"); //Musisz mie� naprawd� siln� dusz�, skoro stawia�e� op�r demonowi. Temu my�liwemu si� najwidoczniej nie uda�o. C�, nic dziwnego.
	AI_Output (self, other ,"DIA_Cronos_JosepAmulet_03_11"); //Wezm� go i zabezpiecz�. Dzi�kuj�, �e z tym do mnie przyszed�e�.
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
	description = "Masz jak�� wiadomo�� dla Mag�w Ognia?";
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
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jestem teraz jednym z ludzi Laresa. Masz jak�� wiadomo�� dla Mag�w Ognia, kt�r� m�g�bym dostarczy� do Starego Obozu?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //W rzeczy samej, mam. Ale bez specjalnego znaku kurierskiego ludzie Gomeza nie wpuszcz� ci� do zamku.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Masz, oto list i znak. Tylko si� pospiesz!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	Log_CreateTopic		(CH1_KdWCourier, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_KdWCourier, LOG_RUNNING);
    B_LogEntry                (CH1_KdWCourier,"Po do��czeniu do Nowego Obozu, Cronos poprosi� mnie abym zani�s� list zaadresowany do Mag�w Ognia. Da� mi r�wnie� amulet kuriera. �wietnie! B�d� m�g� upiec dwie pieczenie na jednym ogniu. ");
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
	description = "Dostarczy�em twoje pismo!";
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
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Dostarczy�em twoje pismo!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ach, dobrze! Oto drobny prezent, w nagrod� za twoje trudy...
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	Cronos_Messenger = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_KdWCourier, LOG_SUCCESS);
    B_LogEntry               (CH1_KdWCourier,"Za zabaw� w kuriera otrzyma�em od Cronosa troch� rudy. Lepszy rydz ni� nic...");

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
	description = "Chcia�bym zosta� magiem! Lee mnie przys�a�.";
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
	AI_Output (other, self,"DIA_Cronos_WannaMage2_15_00"); //Chcia�bym zosta� magiem! Lee mnie przys�a�. Zaproponowa� mi bycie Najemnikiem, jednak mnie interesuje �cie�ka magii.
	AI_Output (self, other,"DIA_Cronos_WannaMage2_08_01"); //Dowiedzia�em si� czego dokona�e� w Starej Kopalni. Jeste� te� lojalnym cz�onkiem naszego Obozu. My�l�, �e Saturas przyjmie ci� w poczet Mag�w Wody.
	AI_Output (self, other,"DIA_Cronos_WannaMage2_08_02"); //Udaj si� do niego. Has�o dla stra�nik�w brzmi: TETRIANDOCH.
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
	description = "Mam wa�n� wiadomo�� dla Saturasa!";
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
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Mam wa�n� wiadomo�� dla Saturasa!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //C� mo�e by� tak wa�nego, by� mia� przeszkadza� naszemu wielkiemu przyw�dcy w jego badaniach?
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
	description = "Cor Kalom opu�ci� ob�z Bractwa!";
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
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opu�ci� ob�z Bractwa z grup� fanatycznych Stra�nik�w �wi�tynnych!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Zamierza na w�asn� r�k� odnale�� �ni�cego i przebudzi� go za wszelk� cen�.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nigdy nie ufa�em temu cz�owiekowi. Wielki Guru czy nie - to pr�ny i nieszczery cz�owiek zdolny do wszystkiego.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bractwo da sobie rad� i bez niego!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Powt�rz� twoje informacje Saturasowi przy najbli�szej okazji. Mo�esz ju� odej��!

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
	description = "Y'Berion, duchowy przyw�dca Bractwa �ni�cego, nie �yje!";
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
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Berion, duchowy przyw�dca Bractwa �ni�cego, nie �yje!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //CO?!? Jak to si� sta�o?!
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bractwo przeprowadzi�o rytua� przyzwania �ni�cego.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Wygl�da na to, �e Y'Berion nie by� w stanie wytrzyma� tak wielkiego obci��enia.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To smutna wiadomo��. Na Y'Berionie zawsze mo�na by�o polega�.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Ale to jeszcze nie pow�d, �eby przeszkadza� Saturasowi.

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
	description = "Guru zorientowali si�, �e oddawali cze�� pot�nemu demonowi z piek�a rodem!";
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
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zorientowali si�, �e oddawali cze�� pot�nemu demonowi z piek�a rodem!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Raptem doszli do wniosku, �e �ni�cy jest demonem?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //To mi wygl�da na kolejny szalony pomys� ludzi z Bractwa, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...Gdyby okaza�o si�, �e maj� racj�... Ca�a Kolonia znalaz�aby si� w �miertelnym niebezpiecze�stwie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Powt�rzysz te informacje samemu Saturasowi. On zdecyduje co nam wypada czyni�.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Gdzie znajd� Saturasa?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Wejd� na wy�szy poziom. Powiedz stra�nikom, �e pozwoli�em ci przej��.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Has�o brzmi TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturasa znajdziesz przy wielkim pentagramie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //W zasadzie si� stamt�d nie rusza. Ca�y czas obmy�la spos�b na wysadzenie kopca rudy.

	B_LogEntry			(CH3_EscapePlanNC,	"Cronos pozwoli� mi spotka� si� z Saturasem na g�rnym poziomie. Arcymistrz Kr�gu Wody przebywa zwykle w pobli�u magicznego pentagramu. Has�o, kt�re mam poda� stra�nikowi brzmi... Cholera, jak to sz�o?!");

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
	description = "Jak brzmia�o to has�o?";
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
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jak brzmia�o to has�o?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Ju� moja �wi�tej pami�ci babcia mia�a lepsz� pami�� od ciebie. Has�o brzmi "TETRIANDOCH".
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
	description = "Saturas powiedzia�, �e masz dla mnie nagrod�.";
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
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas powiedzia�, �e masz dla mnie nagrod�.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako stra�nik rudy, chcia�bym podarowa� ci cz�� naszego urobku jako nagrod� za zas�ugi dla Nowego Obozu.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Mam nadziej�, �e zrobisz z tej rudy r�wnie dobry u�ytek jak my!

	B_LogEntry		(CH3_BringFoci,	"Dosta�em od Cronosa mn�stwo rudy, chocia� w por�wnaniu z wielkim kopcem nie jest to zbyt wiele.");
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
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //M�drze post�pi�e� przyst�puj�c do Mag�w Wody. B�d� pozdrowiony, bracie!
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
	description		= "Potrzebuj� wi�kszej mocy magicznej."; 
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
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Potrzebuj� wi�kszej mocy magicznej.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Mog� ci pokaza�, jak zwi�kszy� twoje zdolno�ci magiczne. Jak je wykorzystasz zale�y ju� tylko od ciebie.
	
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
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Poszukuj� magicznych ksi�g.
	
};  
/*------------------------------------------------------------------------
						BEGR�SSUNG						
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
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Niech b�ogos�awie�stwo Adanosa zawsze b�dzie z tob�. Mog� ci pom�c zwi�kszy� twoje magiczne moce lub zaopatrzy� ci� w kilka po�ytecznych przedmiot�w.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co mog� dla ciebie zrobi�?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos sprzedaje magiczne przedmioty, takie jak runy, zwoje i pier�cienie. Znajd� go przy kracie nad wielkim kopcem rudy."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mo�e mi pom�c w zwi�kszeniu mojej many. Znajd� go przy kracie, nad wielkim kopcem rudy.");
};

//========================================
//-----------------> LIST
//========================================

INSTANCE DIA_Cronos_LIST (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 5;
   condition    = DIA_Cronos_LIST_Condition;
   information  = DIA_Cronos_LIST_Info;
   permanent	= FALSE;
   description	= "Mam list z Bractwa.";
};

FUNC INT DIA_Cronos_LIST_Condition()
{
    if (Npc_HasItems (other, ItMi_ListdoCronosa) >=1)
    && (MIS_ListDoCronosa == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_LIST_Info()
{
    AI_Output (other, self ,"DIA_Cronos_LIST_15_01"); //Mam list z Bractwa.
    AI_Output (self, other ,"DIA_Cronos_LIST_03_02"); //Jaki list? Nie oczekujemy odpowiedzi.
    AI_Output (other, self ,"DIA_Cronos_LIST_15_03"); //To list dotycz�cy podejrzanych op�ta� w Bractwie. Guru potrzebuj� waszych porad.
    AI_Output (self, other ,"DIA_Cronos_LIST_03_04"); //Niepokoi mnie ta wiadomo��. Dzi�kuj� za list. Wkr�tce wy�l� kuriera z odpowiedzi�.
    B_LogEntry                     (CH1_ListDoCronosa,"Zanios�em list Cronosowi. By� wyra�nie zaniepokojony tym, co dzieje si� w Bractwie �ni�cego.");
    Log_SetTopicStatus       (CH1_ListDoCronosa, LOG_SUCCESS);
    MIS_ListDoCronosa = LOG_SUCCESS;
	B_GiveInvItems (other, self, ItMi_ListdoCronosa, 1);
	Npc_RemoveInvItems (self, ItMi_ListdoCronosa, 1);
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
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
   description	= "Co mo�esz mi powiedzie� o kopcu rudy?";
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
    AI_Output (other, self ,"DIA_Cronos_Ore_Many_15_01"); //Co mo�esz mi powiedzie� o kopcu rudy?
    AI_Output (other, self ,"DIA_Cronos_Ore_Many_15_02"); //Du�o tam tego macie?
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_03"); //Troch� tego jest. Wszystkiego oko�o 50 skrzy�.
    AI_Output (other, self ,"DIA_Cronos_Ore_Many_15_04"); //Jednak wasz Ob�z nie jest zbyt bogaty.
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_05"); //Nie prowadzimy wymiany handlowej ze �wiatem Zewn�trznym, wi�c si� nie dziwi�.
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_06"); //Ruda, kt�r� tutaj zbieramy ma okre�lony cel.
    AI_Output (self, other ,"DIA_Cronos_Ore_Many_03_07"); //Id� ju�.
	B_LogEntry                     (CH1_TestOc,"Nowy Ob�z ma 50 skrzy� rudy z kt�rych usypany jest kopiec. ");
    knowsOre = true;
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> FindMage
//========================================

INSTANCE DIA_Cronos_FindMage (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_FindMage_Condition;
   information  = DIA_Cronos_FindMage_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� czaru, kt�ry przywo�a g�rskie trolle.";
};

FUNC INT DIA_Cronos_FindMage_Condition()
{
    if (PlanB == true)
    && (Npc_KnowsInfo (hero, DIA_Quentin_Plan))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_FindMage_Info()
{
    AI_Output (other, self ,"DIA_Cronos_FindMage_15_01"); //Potrzebuj� czaru, kt�ry przywo�a g�rskie trolle.
    AI_Output (self, other ,"DIA_Cronos_FindMage_03_02"); //Co? Po co ci co� takiego?
    AI_Output (other, self ,"DIA_Cronos_FindMage_15_03"); //Stra�nicy zaj�li Ob�z Bandyt�w w g�rach i chcemy si� ich pozby�.
    AI_Output (self, other ,"DIA_Cronos_FindMage_03_04"); //Jeste� dosy� pomys�owy, ch�opcze.
    AI_Output (self, other ,"DIA_Cronos_FindMage_03_05"); //No dobrze. Sporz�dz� ci taki czar, ale potrzebuj� sk�adnik�w.
    AI_Output (other, self ,"DIA_Cronos_FindMage_15_06"); //Co konkretnie?
    AI_Output (self, other ,"DIA_Cronos_FindMage_03_07"); //Potrzebny mi przede wszystkim g�rski mech.
    AI_Output (self, other ,"DIA_Cronos_FindMage_03_08"); //A tak�e jedna kocianka, kamie� runiczny i esencja many.
    AI_Output (self, other ,"DIA_Cronos_FindMage_03_09"); //To wszystko. Przynie� wymienione przeze mnie produkty, a utworz� run�.
    B_LogEntry                     (CH1_Zniewolenie,"Cronos sporz�dzi dla mnie run� przywo�uj�c� g�rskie trolle, gdy przynios� mu: g�rski mech, kociank�, kamie� runiczny i esencj� many.");

    B_GiveXP (200);
};

//========================================
//-----------------> RuneHelp
//========================================

INSTANCE DIA_Cronos_RuneHelp (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_RuneHelp_Condition;
   information  = DIA_Cronos_RuneHelp_Info;
   permanent	= FALSE;
   description	= "Gdzie znajd� pusty kamie� runiczny?";
};

FUNC INT DIA_Cronos_RuneHelp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_FindMage))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_RuneHelp_Info()
{
    AI_Output (other, self ,"DIA_Cronos_RuneHelp_15_01"); //Gdzie znajd� pusty kamie� runiczny?
    AI_Output (self, other ,"DIA_Cronos_RuneHelp_03_02"); //Z tym mo�e by� problem. W Obozie nic takiego nie znajdziesz.
    AI_Output (other, self ,"DIA_Cronos_RuneHelp_15_03"); //Czyli mam szuka� gdzie� indziej?
    AI_Output (self, other ,"DIA_Cronos_RuneHelp_03_04"); //Niestety. Wydaje mi si�, �e w Bractwie uda ci si� co� znale��. Porozmawiaj z Baalami.
    B_LogEntry                     (CH1_Zniewolenie,"Pustego kamienia runicznego powinienem szuka� w Bractwie.");

    B_GiveXP (200);
};
//========================================
//-----------------> AllProducts
//========================================

INSTANCE DIA_Cronos_AllProducts (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 2;
   condition    = DIA_Cronos_AllProducts_Condition;
   information  = DIA_Cronos_AllProducts_Info;
   permanent	= FALSE;
   description	= "Mam wszystkie produkty.";
};

FUNC INT DIA_Cronos_AllProducts_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_FindMage))
    && (Npc_HasItems (other, ItFo_Plants_Nightshadow_02) >=1)
    && (Npc_HasItems (other, ItFo_Plants_mountainmoos_01) >=1)
    && (Npc_HasItems (other, ItFo_Potion_Mana_01) >=1)
    && (Npc_HasItems (other, ItMi_runa0) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_AllProducts_Info()
{
    AI_Output (other, self ,"DIA_Cronos_AllProducts_15_01"); //Mam wszystkie produkty.
    AI_Output (self, other ,"DIA_Cronos_AllProducts_03_02"); //Bardzo dobrze. Piecz�� powinna by� za chwil� gotowa.
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GiveMeRune
//========================================

INSTANCE DIA_Cronos_GiveMeRune (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 3;
   condition    = DIA_Cronos_GiveMeRune_Condition;
   information  = DIA_Cronos_GiveMeRune_Info;
   permanent	= FALSE;
   description	= "Czy piecz�� jest ju� gotowa?";
};

FUNC INT DIA_Cronos_GiveMeRune_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_AllProducts))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_GiveMeRune_Info()
{
    AI_Output (other, self ,"DIA_Cronos_GiveMeRune_15_01"); //Czy piecz�� jest ju� gotowa?
    AI_Output (self, other ,"DIA_Cronos_GiveMeRune_03_02"); //Tak, oto ona.
    AI_Output (self, other ,"DIA_Cronos_GiveMeRune_03_03"); //Pozb�d�cie si� tych �mieci!
    AI_Output (other, self ,"DIA_Cronos_GiveMeRune_15_04"); //Dzi�ki, za s�owo wsparcia.
    AI_Output (self, other ,"DIA_Cronos_GiveMeRune_03_05"); //By�bym zapomnia�. Tej piecz�ci mo�esz u�y� tylko raz!
    AI_Output (self, other ,"DIA_Cronos_GiveMeRune_03_06"); //Jest nietrwa�a.
    AI_Output (other, self ,"DIA_Cronos_GiveMeRune_15_07"); //B�d� pami�ta�.
	CreateInvItems		(self, ItMa_RuneBandit,	1);
	B_GiveInvItems (self, hero, ItMa_RuneBandit,	1);
    B_LogEntry                     (CH1_Zniewolenie,"Cronos wreszcie da� mi piecz��, kt�ra przywo�a g�rskie trolle. Musz� pami�ta�, �e mog� jej u�y� tylko raz.");
    AI_StopProcessInfos	(self);
};

// *****************************************
//					TokasSword
// *****************************************

instance  KDW_604_Cronos_TokasSword (C_INFO)
{
	npc			=  KDW_604_Cronos;	
	condition	=  KDW_604_Cronos_TokasSword_Condition;
	information	=  KDW_604_Cronos_TokasSword_Info;
	description = "Potrafisz zniszczy� magiczn� bro�?";
};                       

FUNC int  KDW_604_Cronos_TokasSword_Condition()
{
    if (CronosTalk_Sword == true)
	&& (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
};
};

FUNC VOID  KDW_604_Cronos_TokasSword_Info()
{
    AI_Output (other, self ,"DIA_Cronos_DelteSword_15_01"); //Potrafisz zniszczy� magiczn� bro�?
    AI_Output (self, other ,"DIA_Cronos_DelteSword_03_02"); //Magiczne bronie s� niezwykle cenne i przydatne. 
    AI_Output (other, self ,"DIA_Cronos_DelteSword_15_03"); //To nie jest zwyk�a bro�. To przekl�ty miecz.
    AI_Output (other, self ,"DIA_Cronos_DelteSword_15_04"); //Skazuje na wieczn� tu�aczk� po �wiecie ka�dego, kto od niego zginie.
    AI_Output (other, self ,"DIA_Cronos_DelteSword_15_05"); //My�liwy Biorn pad� ofiar� tego miecza. Musz� mu pom�c.
    AI_Output (self, other ,"DIA_Cronos_DelteSword_03_06"); //Kto by� w posiadaniu tej broni i dlaczego zaatakowa� ni� my�liwego?
    AI_Output (other, self ,"DIA_Cronos_DelteSword_15_07"); //To cz�owiek z Bractwa - Gor Na Tokas.
    AI_Output (self, other ,"DIA_Cronos_DelteSword_03_08"); //To wiele wyja�nia...
    AI_Output (self, other ,"DIA_Cronos_DelteSword_03_09"); //Musisz porozmawia� z Merdarionem. Pono� kiedy� mia� kontakt z takimi artefaktami.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Musz� porozmawia� z Merdarionem. Tylko on mo�e mi pom�c. ");
    B_GiveXP (200);
	MerdarionTalk_Sword == true;
};

//========================================
//-----------------> DelteSword
//========================================

INSTANCE DIA_Cronos_DelteSword (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_DelteSword_Condition;
   information  = DIA_Cronos_DelteSword_Info;
   permanent	= FALSE;
   description	= "Potrafisz zniszczy� magiczn� bro�?";
};

FUNC INT DIA_Cronos_DelteSword_Condition()
{
   // if (Npc_KnowsInfo (hero, DIA_Duch_TokasSwordDuch))
   // && (Npc_HasItems (hero, Tokas_Sword) >=1)
  //  && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
  //  {
  //  return TRUE;
//};
};


FUNC VOID DIA_Cronos_DelteSword_Info()
{

};
//========================================
//-----------------> KRADZIEZ
//========================================

INSTANCE DIA_Cronos_KRADZIEZ (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_KRADZIEZ_Condition;
   information  = DIA_Cronos_KRADZIEZ_Info;
   permanent	= FALSE;
   description	= "Podobno ci� okradziono.";
};

FUNC INT DIA_Cronos_KRADZIEZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Orik_QUEST1_SUCCESS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_KRADZIEZ_Info()
{
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_01"); //Podobno ci� okradziono.
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_02"); //Tak, Szkodnicy ukradli kilka magicznych amulet�w i zwoj�w. Teraz rozbiegli si� po okolicy i eksperymentuj� z magi�.
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_03"); //Spr�buj� odzyska� twoje artefakty. Gdzie mam szuka� Szkodnik�w?
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_04"); //Wsz�dzie. Rozbiegli si� po okolicy niczym szara�cza. Podobno dw�ch jest jeszcze w Obozie, ale nie mo�emy ustali� kim s�.
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_05"); //Razem z Orikiem pozbyli�my si� jednego magika, kt�ry zabawia� si� magi� przywo�ania w pobli�u wodospadu.
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_06"); //Czyli w Obozie zosta� ju� tylko jeden.
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_07"); //Nie rozumiem, jak mo�ecie nie wiedzie� kim on jest. 
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_08"); //Pos�uchaj, to by�o p�n� noc�. Napadli mnie grup�. Kilku rozpozna�em, ale nie wszystkich.
    AI_Output (other, self ,"DIA_Cronos_KRADZIEZ_15_09"); //Kim by�y osoby, kt�re rozpozna�e�?
    AI_Output (self, other ,"DIA_Cronos_KRADZIEZ_03_10"); //Hmm... Kojarz� Szkodnika Bofura oraz braci Kila i Fila. Dw�ch pozosta�ych nie znam, ale jednego ju� si� pozby�e�, wi�c jego imi� jest nie istotne.
    MIS_MagicySzkodnicy = LOG_RUNNING;

    Log_CreateTopic          (CH1_MagicySzkodnicy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MagicySzkodnicy, LOG_RUNNING);
    B_LogEntry               (CH1_MagicySzkodnicy,"Cronos zosta� okradziony z magicznych artefakt�w, kt�re mia� przy sobie. Z�odzieje to grupa Szkodnik�w. Musz� pozby� si� z�oczy�c�w i znale�� ukradzione artefakty.");
	
	Npc_ExchangeRoutine (ORG_816_Organisator,"magic");
   // nast�pny dialog!! AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CECHY_KRADZIEZY
//========================================

INSTANCE DIA_Cronos_CECHY_KRADZIEZY (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_CECHY_KRADZIEZY_Condition;
   information  = DIA_Cronos_CECHY_KRADZIEZY_Info;
   permanent	= FALSE;
   description	= "Co konkretnie skradziono?";
};

FUNC INT DIA_Cronos_CECHY_KRADZIEZY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_CECHY_KRADZIEZY_Info()
{
    AI_Output (other, self ,"DIA_Cronos_CECHY_KRADZIEZY_15_01"); //Co konkretnie skradziono?
    AI_Output (self, other ,"DIA_Cronos_CECHY_KRADZIEZY_03_02"); //Run� bry�a lodu, Amulet P�omieni, Amulet D�bowej Sk�ry oraz niebieski kryszta� - szczeg�lnie cenny. Dopiero co zacz��em nad nim badania.
    B_LogEntry                     (CH1_MagicySzkodnicy,"Ukradziono: Run� bry�a lodu, Amulet P�omieni, Amulet D�bowej Sk�ry oraz niebieski kryszta�.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> BOFUR_DED
//========================================

INSTANCE DIA_Cronos_BOFUR_DED (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_BOFUR_DED_Condition;
   information  = DIA_Cronos_BOFUR_DED_Info;
   permanent	= FALSE;
   description	= "Zabi�em Bofura.";
};

FUNC INT DIA_Cronos_BOFUR_DED_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ORG_956_Bofur);
    if (MIS_MagicySzkodnicy == LOG_RUNNING)
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_BOFUR_DED_Info()
{
    AI_Output (other, self ,"DIA_Cronos_BOFUR_DED_15_01"); //Zabi�em Bofura.
    AI_Output (self, other ,"DIA_Cronos_BOFUR_DED_03_02"); //Dobra robota. A uda�o ci si� znale�� przy nim jaki� artefakt?
    if (Npc_HasItems (other, ItArRuneIceCube) >=1)
    {
        AI_Output (other, self ,"DIA_Cronos_BOFUR_DED_15_03"); //Tak. Znalaz�em run� Bry�a Lodu. 
        AI_Output (self, other ,"DIA_Cronos_BOFUR_DED_03_04"); //Wspaniale! We� jako wynagrodzenie te 100 bry�ek rudy.
        CreateInvItems (self, ItMiNugget, 100);
        B_GiveInvItems (self, other, ItMiNugget, 100);
		 B_GiveInvItems (other, self, ItArRuneIceCube, 1);
    } else {
	AI_Output (other, self ,"DIA_Cronos_BOFUR_DED_15_05"); //Nie.
	};
    B_LogEntry                     (CH1_MagicySzkodnicy,"Pozby�em si� Szkodnika Bofura. ");

    B_GiveXP (150);
};

//========================================
//-----------------> KIL_DED
//========================================

INSTANCE DIA_Cronos_KIL_DED (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 2;
   condition    = DIA_Cronos_KIL_DED_Condition;
   information  = DIA_Cronos_KIL_DED_Info;
   permanent	= FALSE;
   description	= "Zabi�em Kila.";
};

FUNC INT DIA_Cronos_KIL_DED_Condition()
{
    var C_NPC whodie1; 	whodie1 = Hlp_GetNpc(ORG_954_Kil);
    if (Npc_IsDead(whodie1))
    && (MIS_MagicySzkodnicy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_KIL_DED_Info()
{
    AI_Output (other, self ,"DIA_Cronos_KIL_DED_15_01"); //Zabi�em Kila.
    AI_Output (self, other ,"DIA_Cronos_KIL_DED_03_02"); //Uda�o ci si� znale�� przy nim jaki� artefakt?
    if (Npc_HasItems (other, Schutzamulett_Geschosse) >=1)
    {
        AI_Output (other, self ,"DIA_Cronos_KIL_DED_15_03"); //Znalaz�em Amulet D�bowej Sk�ry.
        AI_Output (self, other ,"DIA_Cronos_KIL_DED_03_04"); //Jest niezwykle cenny. Zap�ac� ci za to znalezisko
        CreateInvItems (self, ItMiNugget, 70);
        B_GiveInvItems (self, other, ItMiNugget, 70);
        B_GiveInvItems (other, self, Schutzamulett_Geschosse, 1);
		B_GiveXP (50);
		B_LogEntry                     (CH1_MagicySzkodnicy,"Cornos otrzyma� ode mnie skradziony przez Kila artefakt.");
    }
    else
    {
        AI_Output (other, self ,"DIA_Cronos_KIL_DED_15_05"); //Niestety, nie.
        AI_Output (self, other ,"DIA_Cronos_KIL_DED_03_06"); //Trudno.
		B_LogEntry                     (CH1_MagicySzkodnicy,"Cornos nie otrzyma� ode mnie skradzionego przez Kila artefaktu.");
    };



};

//========================================
//-----------------> FIL_DED
//========================================

INSTANCE DIA_Cronos_FIL_DED (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 3;
   condition    = DIA_Cronos_FIL_DED_Condition;
   information  = DIA_Cronos_FIL_DED_Info;
   permanent	= FALSE;
   description	= "Zabi�em Fila.";
};

FUNC INT DIA_Cronos_FIL_DED_Condition()
{
    var C_NPC whodie2; 	whodie2 = Hlp_GetNpc(ORG_955_Fil);
    if (MIS_MagicySzkodnicy == LOG_RUNNING)
    && (Npc_IsDead(whodie2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_FIL_DED_Info()
{
    AI_Output (other, self ,"DIA_Cronos_FIL_DED_15_01"); //Zabi�em Fila.
    AI_Output (self, other ,"DIA_Cronos_FIL_DED_03_02"); //Dobra robota. A co z artefaktem?
    if (Npc_HasItems (other, Schutzamulett_Feuer) >=1)
    {
        AI_Output (other, self ,"DIA_Cronos_FIL_DED_15_03"); //Mam przy sobie Amulet P�omieni. 
        AI_Output (self, other ,"DIA_Cronos_FIL_DED_03_04"); //Genialnie!
        B_GiveInvItems (other, self, Schutzamulett_Feuer, 1);
        CreateInvItems (self, ItMiNugget, 70);
        B_GiveInvItems (self, other, ItMiNugget, 70);
		B_LogEntry                     (CH1_MagicySzkodnicy,"Zwr�ci�em Crnonoswi znaleziony przy Filu amulet.");
		B_GiveXP (50);
    }
    else
    {
        AI_Output (other, self ,"DIA_Cronos_FIL_DED_15_05"); //Nie mam go.
		B_LogEntry                     (CH1_MagicySzkodnicy,"Niestety nie przynios�em Cronosowi amuletu, kt�rzy ukrad� Fil.");
    };
};

//========================================
//-----------------> DRANOR_DED
//========================================

INSTANCE DIA_Cronos_DRANOR_DED (C_INFO)
{
   npc          = KDW_604_Cronos;
   nr           = 1;
   condition    = DIA_Cronos_DRANOR_DED_Condition;
   information  = DIA_Cronos_DRANOR_DED_Info;
   permanent	= FALSE;
   description	= "Pokona�em Dranora.";
};

FUNC INT DIA_Cronos_DRANOR_DED_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ORG_816_Organisator);
    if (MIS_MagicySzkodnicy == LOG_RUNNING)
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_DRANOR_DED_Info()
{
    AI_Output (other, self ,"DIA_Cronos_DRANOR_DED_15_01"); //Pokona�em Dranora.
    AI_Output (self, other ,"DIA_Cronos_DRANOR_DED_03_02"); //Nie kojarz� tego cz�owieka.
    AI_Output (other, self ,"DIA_Cronos_DRANOR_DED_15_03"); //To w�a�nie on ca�y czas przebywa� w Obozie. Siedzia� w swojej chacie i trenowa� magiczne zakl�cia.
    AI_Output (self, other ,"DIA_Cronos_DRANOR_DED_03_04"); //Musia� by� bardzo przebieg�y, skoro nikt tak d�ugo go nie rozpracowa�.
    AI_Output (self, other ,"DIA_Cronos_DRANOR_DED_03_05"); //Znalaz�e� co� przy nim?
    if (Npc_HasItems (other, BlueCrystal) >=1)
    {
        AI_Output (other, self ,"DIA_Cronos_DRANOR_DED_15_06"); //Tak. Mam magiczny kryszta�.
        AI_Output (self, other ,"DIA_Cronos_DRANOR_DED_03_07"); //�wietnie. Daj mi go.
        AI_Output (self, other ,"DIA_Cronos_DRANOR_DED_03_08"); //Dobra robota.
        CreateInvItems (self, ItMiNugget, 70);
        B_GiveInvItems (self, other, ItMiNugget, 70);
        B_GiveInvItems (other, self, BlueCrystal, 1);
		B_GiveXP (50);
		B_LogEntry                     (CH1_MagicySzkodnicy,"Cronos odzyska� skradziony przez Dranora kryszta�.");
    }
    else
    {
        AI_Output (other, self ,"DIA_Cronos_DRANOR_DED_15_09"); //Nie.
		B_LogEntry                     (CH1_MagicySzkodnicy,"Cronos nie otrzyma� ode mnie kryszta�u ukradzionego przez Dranora.");
    };
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
   description	= "Pokona�em ju� wszystkich.";
};

FUNC INT DIA_Cronos_END_QUEST_Condition()
{
    if (MIS_MagicySzkodnicy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Cronos_DRANOR_DED))
    && (Npc_KnowsInfo (hero, DIA_Cronos_BOFUR_DED))
    && (Npc_KnowsInfo (hero, DIA_Cronos_KIL_DED))
    && (Npc_KnowsInfo (hero, DIA_Cronos_FIL_DED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_END_QUEST_Info()
{
    AI_Output (other, self ,"DIA_Cronos_END_QUEST_15_01"); //Pokona�em ju� wszystkich.
    AI_Output (self, other ,"DIA_Cronos_END_QUEST_03_02"); //Uda�o ci si� pozby� tych natr�tnych magik�w. Nast�pnym razem musz� bardziej uwa�a� na te artefakty. 
    AI_Output (self, other ,"DIA_Cronos_END_QUEST_03_03"); //Dzi�kuj� ci za wszystko.
    B_LogEntry                     (CH1_MagicySzkodnicy,"Uda�o mi si� pozby� wszystkich Szkodnik�w-magik�w z okolic Nowego Obozu.");
    Log_SetTopicStatus       (CH1_MagicySzkodnicy, LOG_SUCCESS);
    MIS_MagicySzkodnicy = LOG_SUCCESS;

    B_GiveXP (200);
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
    if (herbatka_crnonos == true) && (MIS_ZginalLIN == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cronos_HERBATKA_Info()
{
    AI_Output (other, self ,"DIA_Cronos_HERBATKA_15_01"); //Potrzebna mi herbatka na zatrucia alkoholowe.
    AI_Output (self, other ,"DIA_Cronos_HERBATKA_03_02"); //Mam kilka w swojej ofercie. S� do�� drogie. Kosztuj� 50 bry�ek rudy, ale warto. 
    CreateInvItems (self, It_HerbatkaNaKaca, 10);

};


