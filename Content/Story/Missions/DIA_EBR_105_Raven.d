//poprawione i sprawdzone - Nocturn

// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE) && (Kapitel < 4)
	{ 
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Co mogê dla ciebie zrobiæ?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Kim jesteœ?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
if (Kapitel < 4)
{
	return 1;
	};
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Nazywam siê Kruk. Jestem praw¹ rêk¹ Gomeza. Ka¿dy, kto chce siê spotkaæ z szefem, musi najpierw porozmawiaæ ze mn¹.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Mam trochê bagiennego ziela dla Gomeza od Cor Kaloma.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Mam trochê bagiennego ziela dla Gomeza od Cor Kaloma.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Gomez nie zajmuje siê takimi rzeczami osobiœcie. To dzia³ka Bartholo.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Znajdziesz go w komnacie na prawo od wejœcia, albo w kuchni w du¿ej wie¿y.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Oczywiœcie w nocy pewnie œpi. Na twoim miejscu nie przeszkadza³bym mu do rana.

	B_LogEntry			(CH1_KrautBote,	"Ziele dla Gomeza nale¿y dostarczyæ do Bartholo. Znajdê go w rezydencji Magnatów.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Chcê siê zobaczyæ z Gomezem.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez)) || (Npc_KnowsInfo(hero,DIA_THORUS_FlintFindPath)))
	&& 	((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_VLK) || (Npc_KnowsInfo(hero,DIA_THORUS_FlintFindPath))	) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Chcê siê zobaczyæ z Gomezem. Thorus powiedzia³, ¿e mogê zostaæ Cieniem.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Dobrych ludzi nigdy nie za wielu. Chyba masz wystarczaj¹co równo pod sufitem. Mo¿esz siê nam przydaæ.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Zabiorê ciê do Gomeza. ChodŸ za mn¹, tylko niczego nie dotykaj!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_EnterFireNov (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_EnterFireNov_Condition;
	information	= DIA_Raven_EnterFireNov_Info;
	permanent	= 0;
	description	= "Chcê siê zobaczyæ z Gomezem. Thorus powiedzia³, ¿e mogê zostaæ Cieniem.";
};                       

FUNC int DIA_Raven_EnterFireNov_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Torrez_NOWICJUSZ)) && (Npc_HasItems (other, It_glejtmagow) >=1) && (Npc_GetTrueGuild(other) == GIL_NONE) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_EnterFireNov_Info()
{
	AI_Output (other, self,"DIA_Raven_EnterFireNov_15_00"); //Chcê siê zobaczyæ z Gomezem. Mam aprobatê od Magów Ognia.
	AI_Output (self, other,"DIA_Raven_EnterFireNov_10_01"); //Poka¿ mi j¹.
	CreateInvItem(self, it_GlejtMagow);
	AI_UseItem (self, It_glejtmagow);
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Dobrych ludzi nigdy nie za wielu. Chyba masz wystarczaj¹co równo pod sufitem. Mo¿esz siê nam przydaæ.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Zabiorê ciê do Gomeza. ChodŸ za mn¹, tylko niczego nie dotykaj!
	
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if (( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme)) || ( Npc_KnowsInfo(hero,DIA_Raven_EnterFireNov)))  && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT")  
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez jest tam. Jeœli nie oka¿esz mu nale¿nego szacunku, osobiœcie nauczê ciê dobrych manier. Zrozumiano?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Jak idzie handel rud¹?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Jak idzie handel rud¹?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Stara Kopalnia jakoœ radzi sobie z wydobyciem. Ostatni transport do zewnêtrznego œwiata by³ bardzo du¿y.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez powiedzia³, ¿e siê nadajê.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	if (hero_join_fn == false)
	{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	};
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez powiedzia³, ¿e siê nadajê.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Œwietnie! Tak siê sk³ada, ¿e mo¿esz od razu udowodniæ, na co ciê staæ. Jest dla ciebie robota.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //To nie powinno byæ zbyt trudne, jeœli rzeczywiœcie masz kontakty, o jakich mówi³eœ.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Co mam zrobiæ?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Prowadzimy intensywn¹ wymianê handlow¹ z Bractwem, co nie znaczy, ¿e im do koñca ufamy.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //IdŸ na bagna.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Kiedy dotrzesz do Obozu Bractwa, miej uszy i oczy szeroko otwarte. Ka¿dy strzêpek informacji mo¿e siê okazaæ niezwykle cenny.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Im wiêcej wywêszysz, tym lepiej. Ta misja wymaga odrobiny taktu, jeœli wiesz, co mam na myœli.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Bez obaw. Postaram siê ich nie rozz³oœciæ.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Wiedzia³em, ¿e siê zrozumiemy.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Kruk wys³a³ mnie do Obozu Bractwa. Mam siê tam trochê rozejrzeæ i donieœæ mu o wszystkich podejrzanych wydarzeniach. Mo¿e uda mi siê dowiedzieæ czegoœ ciekawego.");
};

// *********************************************
// 				Ausrüstung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Gdzie mogê dostaæ lepsze wyposa¿enie?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Gdzie mogê dostaæ lepsze wyposa¿enie?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Porozmawiaj z Diego, on da ci jak¹œ zbrojê. Ten pancerz nie tylko uchroni ciê przed œmierci¹, ale bêdzie równie¿ s³u¿y³ jako znak rozpoznawczy.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Dziêki niemu zyskasz dostêp do wszystkich wa¿niejszych miejsc.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Gdybyœ potrzebowa³ broni, porozmawiaj ze Skipem. Znajdziesz go w tej wielkiej szopie, w lewym tylnym rogu zamkowego dziedziñca.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,	"Diego ma lepsze wyposa¿enie dla Cieni Gomeza. Znajdê go przy zamkowej bramie.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,	"Skip, Stra¿nik z tylnego dziedziñca, sprzedaje orê¿, ale tylko ludziom Gomeza.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Pomyœla³em, ¿e zdam ci raport...";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Pomyœla³em, ¿e zdam ci raport...
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //To dobrze. Lubiê byæ informowany na bie¿¹co.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Odby³o siê wielkie przywo³anie.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrze siê spisa³eœ.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Kruk sp³awi³ mnie byle gadk¹. Nie potrzeba mi takich przyjació³. Od tej pory dzia³am na w³asny rachunek.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Teraz Bractwo potrzebuje jaj królowej pe³zaczy. Przygotuj¹ z nich napój, który umo¿liwi im nawi¹zanie kontaktu ze Œni¹cym. Mam te jaja przy sobie.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Hmm, interesuj¹ce. Ciekawe czy to zadzia³a. Zanieœ jaja do œwi¹tyni.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrze siê spisa³eœ.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Kruk sp³awi³ mnie byle gadk¹. Nie potrzeba mi takich przyjació³. Od tej pory dzia³am na w³asny rachunek.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Niestety, jeszcze nie wiem, co planuj¹ ludzie z Bractwa.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //To dlaczego zawracasz mi g³owê?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//========================================
//-----------------> GUEST
//========================================

INSTANCE DIA_Raven_GUEST (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_GUEST_Condition;
   information  = DIA_Raven_GUEST_Info;
   permanent	= FALSE;
   important = 1;
};

FUNC INT DIA_Raven_GUEST_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_GUEST_Info()
{
    AI_Output (self, other ,"DIA_Raven_GUEST_03_01"); //A któ¿ to taki do nas zawita³?
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Raven_GUEST_15_02"); //Tak ci spieszno do grobu?!
    AI_Output (self, other ,"DIA_Raven_GUEST_03_03"); //Spokojnie. W walce ze mn¹ i tak nie mia³byœ najmniejszych szans.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_04"); //Jesteœmy nastawieni pokojowo.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_05"); //Uciekliœmy ze Starego Obozu w poszukiwaniu stabilizacji. Przynajmniej tymczasowej.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_06"); //Postanowi³em zebraæ najcenniejszych ludzi i uciec.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_07"); //Gomez niech sobie rz¹dzi sam.
    AI_RemoveWeapon (other);
};

//========================================
//-----------------> PLANY_RAVENA
//========================================

INSTANCE DIA_Raven_PLANY_RAVENA (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 2;
   condition    = DIA_Raven_PLANY_RAVENA_Condition;
   information  = DIA_Raven_PLANY_RAVENA_Info;
   permanent	= FALSE;
   description	= "Co planujecie dalej?";
};

FUNC INT DIA_Raven_PLANY_RAVENA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raven_GUEST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_PLANY_RAVENA_Info()
{
    AI_Output (other, self ,"DIA_Raven_PLANY_RAVENA_15_01"); //Co planujecie dalej?
    AI_Output (self, other ,"DIA_Raven_PLANY_RAVENA_03_02"); //Czekamy na rozwój wydarzeñ.
    AI_Output (self, other ,"DIA_Raven_PLANY_RAVENA_03_03"); //Marzy mi siê wolnoœæ i jakiœ spokojny k¹t bez w³adzy królewskiej.
    AI_Output (self, other ,"DIA_Raven_PLANY_RAVENA_03_04"); //Chcia³bym znaleŸæ takie miejsce. 
};

//========================================
//-----------------> GOMEZ_BEZCZELNY
//========================================

INSTANCE DIA_Raven_GOMEZ_BEZCZELNY (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_GOMEZ_BEZCZELNY_Condition;
   information  = DIA_Raven_GOMEZ_BEZCZELNY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raven_GOMEZ_BEZCZELNY_Condition()
{
    if (kapitel == 4)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_Ready))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_GOMEZ_BEZCZELNY_Info()
{
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_01"); //Co za sukinsyny! Jak mogli nas zaatakowaæ?! Swoich zwierzchników.
    AI_Output (other, self ,"DIA_Raven_GOMEZ_BEZCZELNY_15_02"); //Ju¿ nie jesteœcie przyjació³mi.
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_03"); //Co z tego! Tyle lat siê mnie s³uchali. Liczyli, ¿e dadz¹ radê we dwóch. Reszta przemknê³a siê obok.
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_04"); //Pewnie udali siê na plac wymian...
    AI_Output (other, self ,"DIA_Raven_GOMEZ_BEZCZELNY_15_05"); //Raczej do Opuszczonej Kopalni. Gomez ma na ni¹ chêæ.
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_06"); //Co za g³upiec. Przecie¿ tam nic nie ma!
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> ZniewolonyAlex
//========================================

INSTANCE DIA_Raven_ZniewolonyAlex (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_ZniewolonyAlex_Condition;
   information  = DIA_Raven_ZniewolonyAlex_Info;
   permanent	= FALSE;
   description	= "Ponoæ zniewoli³eœ myœliwego.";
};

FUNC INT DIA_Raven_ZniewolonyAlex_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_PorwanieMysliwego))
    && (MIS_PorwanieAlexa == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_ZniewolonyAlex_Info()
{
    AI_Output (other, self ,"DIA_Raven_ZniewolonyAlex_15_01"); //Ponoć z twojego rozkazu pojmano myśliwego. 
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_02"); //Ci głupcy odmawiali współpracy ze Starym Obozem. Niech się cieszą, że nie zrównaliśmy ich nędznego oboziku z ziemią. 

    AI_Output (other, self ,"DIA_Raven_ZniewolonyAlex_15_03"); //Czego od niego chcesz?
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_04"); //Chcieliśmy nawiązać korzystną relację handlową z myśliwymi. Jednak zostaliśmy potraktowani jak złodzieje i oszuści!
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_05"); //Ale skoro tak cię to interesuje to pewnie myślisz o tym by go uwolnić. Uprzedzając pytanie tak, to ma swoją cenę. 
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_06"); //Musiałaby starczyć na pokrycie strat jakie Stary Obóz poniósł przez niezawarcie kontraktu z myśliwymi. 
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_07"); //Będzie cię to kosztowło 8000 bryłek rudy.
    AI_Output (other, self ,"DIA_Raven_ZniewolonyAlex_15_08"); //Ile?!
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_09"); //(z ironią) Z pewnością ci chytrzy myśliwi nie omieszkaliby cię sowicie wynagrodzić. I jeszcze jedno, nie próbój żadnych sztuczek. 
    B_LogEntry                     (CH1_PorwanieAlexa,"Kruk ¿yczy sobie 8000 bry³ek rudy za wypuszczenie Alexa.");
};

//========================================
//-----------------> ZaplataZaWolnosc
//========================================

INSTANCE DIA_Raven_ZaplataZaWolnosc (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 2;
   condition    = DIA_Raven_ZaplataZaWolnosc_Condition;
   information  = DIA_Raven_ZaplataZaWolnosc_Info;
   permanent	= FALSE;
   description	= "Chcê, ¿ebyœ go wypuœci³. (8000 bry³ek rudy)";
};

FUNC INT DIA_Raven_ZaplataZaWolnosc_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raven_ZniewolonyAlex))
    && (MIS_PorwanieAlexa == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=8000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_ZaplataZaWolnosc_Info()
{
    AI_Output (other, self ,"DIA_Raven_ZaplataZaWolnosc_15_01"); //Chcê, ¿ebyœ go wypuœci³. 
    AI_Output (self, other ,"DIA_Raven_ZaplataZaWolnosc_03_02"); //Dobrze. Skoro tego sobie ¿yczysz.
    B_LogEntry                     (CH1_PorwanieAlexa,"Poœwiêci³em siê i zap³aci³em 8000 bry³ek rudy za wolnoœæ Alexa.");
    B_GiveInvItems (other, self, ItMiNugget, 8000);

    B_GiveXP (750);
    AI_Output (self, other ,"DIA_Raven_ZaplataZaWolnosc_03_03"); //IdŸ do Stra¿nika lochów i poproœ go o klucz do celi.
    AI_StopProcessInfos	(self);
};
