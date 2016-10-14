//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Do boju!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Do zobaczenia.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begr��ung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hej, Nowa twarz.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kim jeste�?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Nazywam si� Gorn. Jestem Najemnikiem w s�u�bie mag�w.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "Czym si� zajmuj� Najemnicy?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Czym si� zajmuj� Najemnicy?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee zawar� z Magami umow�. Zatrudnia najlepszych wojownik�w z ca�ej Kolonii - czyli nas.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Pilnujemy, �eby nikt nie przeszkadza� Kretom w pracy i dbamy o bezpiecze�stwo Mag�w.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Magowie natomiast przygotowuj� plan, kt�ry pozwoli si� nam st�d wyrwa�. Jako wynagrodzenie otrzymujemy troch� rudy.
};

//*************************************
//			H�tte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Czy w Obozie s� jeszcze wolne miejsca?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Czy w Obozie s� jeszcze wolne miejsca, czy b�d� musia� wykopa� kogo� z jego chaty?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Chyba b�dziesz musia�. Je�li naprawd� chcesz to zrobi�, zacznij od Krzykacza.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Z�apa� dla siebie chat� przy samym wej�ciu do jaskini. By�a pusta, ale tak naprawd� nale�a�a do nas.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Nas?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //No nas, Najemnik�w. Najemnicy i Szkodniki staraj� si� nie w�azi� sobie w drog�. Ludzie Laresa nie maj� wst�pu do tej cz�ci obozu.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //W sumie to drobiazg, ale sukinsyn nie zapyta� nawet o pozwolenie. Tym Szkodnikom nie mo�na pozwoli� na zbyt wiele, bo zrobi� si� nie do wytrzymania.

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,	"Najemnik imieniem Gorn opowiedzia� mi o niejakim Krzykaczu, kt�ry przyw�aszczy� sobie jedn� z chat. Jako �e mam pozwolenie Gorna, �aden Najemnik nie b�dzie mi przeszkadza� w 'przekonywaniu' Krzykacza, �eby zmieni� lokal.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			H�tte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Krzykacz przeni�s� si� ju� do innej chaty.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Krzykacz przeni�s� si� ju� do innej chaty.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //�wietnie! Przed chwil� Torlof powiedzia�, �e zamierza pokaza� temu ch�optasiowi, gdzie jest jego miejsce.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,	"Wykopuj�c Krzykacza z jego chaty wprawi�em Gorna w dobry humor. To chyba porz�dny cz�owiek - twardy, ale uczciwy. W przysz�o�ci b�d� si� trzyma� blisko niego.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			S�ldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Co mam zrobi�, �eby zosta� cz�onkiem Nowego Obozu?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Co mam zrobi�, �eby zosta� cz�onkiem Nowego Obozu?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Musisz troch� popracowa� nad swoimi umiej�tno�ciami bojowymi, zanim Lee zgodzi si� ci� przyj��. Niewa�ne w jakiej broni si� specjalizujesz, byle� by� w tym dobry.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Opr�cz tego powiniene� mie� chocia� og�lne poj�cie o �yciu w Kolonii, uk�adach mi�dzy obozami, i takie tam...
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Je�li nie interesuj� ci� inne obozy, spr�buj na pocz�tek do��czy� do Szkodnik�w. Na zostanie Najemnikiem jeszcze przyjdzie czas.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Masz wi�cej tego towaru?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Ca�e mn�stwo. Chcesz kupi�?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Jak to mo�liwe, �e wzi��e� udzia� w jednym z napad�w?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Jak to mo�liwe, �e wzi��e� udzia� w jednym z napad�w zorganizowanych przez t� band�?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //A kto twierdzi, �e wzi��em?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Sk�d m�g�by� wzi�� tak� ilo�� towaru, gdyby� nie uczestniczy� w napadzie.
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Naprawd� my�lisz, �e tak� ilo�� towaru mo�na zebra� po JEDNYM g�upim napadzie?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //To znaczy, �e uczestniczysz w nich regularnie?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Nawet gdyby tak by�o, nie m�g� bym ci o tym powiedzie�. Lee da�by mi zdrowo popali�.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Rozumiem.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig f�r Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ach, to ty! M�j przyjaciel z obozu na bagnie, Lester, doni�s� mi o twoich dokonaniach.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Jak na kogo�, kto jest tu od niedawna, zaszed�e� ca�kiem daleko.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Par� razy zaszed�em nawet na skraj w�asnego grobu.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Mam wa�n� wiadomo�� dla Mag�w Wody!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Mam wa�n� wiadomo�� dla Mag�w Wody!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //W takim razie powiniene� zg�osi� si� do Saturasa. To najwy�szy z Mag�w Wody. Jak go znam, siedzi teraz nad jak�� magiczn� ksi�g� albo czym� w tym stylu.
	if (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Ale niezale�nie od tego jak wa�ne s� wie�ci, kt�re przynosisz, stra�nicy z g�rnego poziomu nie pozwol� ci si� z nim zobaczy�.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //A nie m�g�by� si� za mn� wstawi�?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Ja nie, ale Cronos, stra�nik rudy mo�e udzieli� ci pozwolenia na spotkanie z Saturasem.
	};
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Gdzie znajd� tego 'stra�nika rudy'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES)) && (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Gdzie znajd� tego "stra�nika rudy"?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Id�c st�d trafisz na wielk� jaskini� mieszkaln�, niedaleko tamy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos przebywa zwykle obok kraty broni�cej dost�pu do kopca rudy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Ale to nieco arogancki cz�owiek. B�dziesz musia� go jako� przekona�, �e twoja wiadomo�� jest naprawd� wa�na.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,	"Gorn radzi mi i�� wprost do Arcymistrza Mag�w Wody, niejakiego Saturasa. Cronos, stra�nik rudy, mo�e mi za�atwi� audiencj�. Znajd� go w centrum Obozu, przy kracie nad kopcem rudy."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Cze��, ��todziobie. Jak widzisz Kolonia to bardzo ma�e miejsce.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Ca�y czas wpada si� na tych samych ludzi.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Co tu robisz?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Och, pod��am �ladem pewnej prastarej legendy.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Legendy?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Tak, Milten - m�j kumpel ze Starego Obozu, powiedzia� mi, �e kiedy� ten teren zamieszkiwali mnisi.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Oczywi�cie to by�o na d�ugo przed powstaniem Bariery.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Pono� czczono tutaj b�stwo, kt�re pozwala�o mnichom przybiera� posta� zwierz�t.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Za�o�� si�, �e s� tu jeszcze jakie� skarby pozosta�e po dawnych czasach.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //A co ciebie tu sprowadza?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Szukam magicznego kamienia ogniskuj�cego.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Szukam magicznego kamienia ogniskuj�cego.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Powinien by� gdzie� w okolicy.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Przedmiot, kt�rego szukasz mo�e znajdowa� si� na terenie starego Klasztoru, za tym kanionem.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mogliby�my wybra� si� tam razem.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Mogliby�my wybra� si� tam razem.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Dobry pomys�. Ca�a okolica a� roi si� od z�baczy.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //W pojedynk� nie powinny stwarza� k�opotu wytrawnemu my�liwemu, ale te bestie zwykle poluj� ca�ymi stadami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //A grupa z�baczy potrafi rozerwa� na strz�py nawet bardzo do�wiadczonego wojownika.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Zatem p�jdziemy tam razem?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Dobra, ale zanim przejdziemy po tym pniu, chcia�bym przyjrze� si� uwa�niej temu kanionowi. Lubi� wiedzie�, co mam za plecami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Chod� za mn�. Odkry�em �cie�k�, kt�ra nas tam zaprowadzi.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,	"W pobli�u ruin starego Klasztoru spotka�em Najemnika Gorna. Zamierza rozejrze� si� po ruinach w poszukiwaniu starych skarb�w.");
	B_LogEntry			(CH3_MonasteryRuin,	"Od tej pory b�dziemy podr�owa� razem. Gorn uprzedzi� mnie o stadach z�baczy nawiedzaj�cych te tereny.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //To si� nazywa szcz�cie! Najwyra�niej ta jaskinia by�a wykorzystywana jako sk�adowisko.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Mo�esz teraz prowadzi� do Klasztoru. Chcia�em mie� pewno��, �e nie spotkaj� nas jakie� paskudne niespodzianki w drodze powrotnej.

	B_LogEntry		(CH3_MonasteryRuin,	"Odkryli�my ukryt� jaskini�! Po�r�d innych rzeczy, znale�li�my r�wnie� dwa zwoje z zakl�ciami i klucz!");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Widz�, �e ten stary Klasztor przesta� ci� ju� interesowa�.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Zatem dalej p�jd� sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Gdyby� zmieni� zdanie, mo�esz mnie dogoni�.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Cholerna brama. Pono� nikomu jeszcze nie uda�o si� jej otworzy�.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Te bestyjki pod drugiej stronie s� pewnie jedynymi istotami, kt�rym uda�o si� dosta� do �rodka.

	B_LogEntry		(CH3_MonasteryRuin,	"Stoimy przed zamkni�t� bram�. Wygl�da na to, �e nie da si� jej otworzy� od zewn�trz.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "I co teraz?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //I co teraz?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Musisz znale�� jaki� spos�b na przedostanie si� na drug� stron� bramy.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Na g�rze jest chyba jaka� platforma. Ale w�tpi�, �eby uda�o si� nam wspi�� tak wysoko.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Musimy znale�� inn� drog�.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //To mi wygl�da na jaki� piedesta�.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Mo�e le�a� tu kiedy� artefakt, kt�rego szukasz.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Widz�, �e uda�o ci si� otworzy� t� bram�. To zakl�cie, kt�rego u�y�e� by�o ca�kiem sprytne.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //No, mo�emy i�� dalej.

	B_LogEntry		(CH3_MonasteryRuin,	"Przy pomocy jednego ze zwoj�w znalezionych w jaskini, zamieni�em si� w chrz�szcza. W ten spos�b uda�o mi si� dosta� na teren Klasztoru przez wyrw� w murze.");
	B_LogEntry		(CH3_MonasteryRuin,	"Brama zosta�a otwarta.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Widz�, �e ten stary Klasztor przesta� ci� ju� interesowa�.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Dalej p�jd� sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Gdyby� zmieni� zdanie, mo�esz mnie dogoni�.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //A wi�c znalaz�e� sw�j magiczny artefakt!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Tak. Musz� zanie�� ten kamie� ogniskuj�cy do Mag�w Wody.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //P�jd� kawa�ek z tob�.

	B_LogEntry		(CH3_MonasteryRuin,	"Znalaz�em kamie� ogniskuj�cy! Gorn b�dzie mi jeszcze troch� towarzyszy�.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //O JASNA CHOLERA! A co to za monstrum?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Sk�d si� tu wzi�o co� takiego?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //To mi wygl�da na jednego z tych niezniszczalnych trolli, ale jest troch� mniejsze.
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Trudno, je�li chcemy si� st�d wydosta�, musimy go jako� min��.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Nie by�o �atwo!
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Tak, ale w ko�cu si� nam uda�o! To chyba by� jaki� m�ody troll.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... Wi�c pewnie nie chcia�by� wpa�� na jego rodzic�w, co?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Raczej nie!
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Tutaj nasze drogi si� rozchodz�. Chc� tu troch� zosta� i rozejrze� si� po okolicy.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Ale na pewno jeszcze si� spotkamy. Do zobaczenia, przyjacielu.

	B_LogEntry		(CH3_MonasteryRuin,	"W drodze powrotnej, na dziedzi�cu Klasztoru, spotkali�my m�odego trolla. Stoczyli�my z nim ci�k� walk�, ale koniec ko�c�w - zwyci�yli�my!");
	B_LogEntry		(CH3_MonasteryRuin,	"Nasze drogi tutaj si� rozchodz�. Mam przeczucie, �e ju� nied�ugo spotkamy si� znowu.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Spotka�em Diego i Miltena przed Starym Obozem!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Spotka�em Diego i Miltena przed Starym Obozem!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To dobra wiadomo��!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Maj� si� spotka� z tob� i z Lesterem w zwyk�ym miejscu.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Dzi�ki. W dzisiejszych czasach nie ma nic cenniejszego ni� kilku oddanych przyjaci�.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Jeste� ju� prawie jednym z nas. Udowodni�e�, �e mo�na na tobie polega�!

	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_06"); //Przeka� jednak Diego, �e nie mog� stawi� si� na spotkanie, dop�ki nie zostanie rozwi�zany problem Wolnej Kopalni.
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_07"); //Nie ma sprawy.

	B_GiveXP			(XP_MessageForGorn);
	B_LogEntry			(CH4_4Friends,"Gorn stawi si� na spotkanie, je�eli Nowy Ob�z zdo�a odbi� Woln� Kopalnie. Powinienem przekaza� to Diego."); 
		
/*	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowa�em Lestera i Gorna o spotkaniu z ich przyjaci�mi. Moje zadanie sko�czone. Dalej b�d� musieli radzi� sobie sami..."); 
		//Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
		//MIS_4Friends = true;
	};*/

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co zobaczy�e� w Wolnej Kopalni?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co zobaczy�e� w Wolnej Kopalni?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Po powrocie ze starego Klasztoru chcia�em z�o�y� wizyt� Okylowi, szefowi Wolnej Kopalni.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Ale gdy dotar�em na miejsce, zasta�em tylko stygn�ce cia�a.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Dostrzeg�em kilku Stra�nik�w okopuj�cych si� przy wej�ciu do kopalni.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak to mo�liwe, �e du�y oddzia� Najemnik�w uleg� garstce Stra�nik�w?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //To musia�a by� jaka� zasadzka. W ko�cu kto m�g�by si� spodziewa� ataku od strony g�r?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Element zaskoczenia mo�e zwielokrotni� zdolno�ci bojowe oddzia�u.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co zamierzasz robi� dalej?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co zamierzasz robi� dalej?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Musimy zmieni� ca�� nasz� strategi� obrony. To troch� potrwa.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dop�ki Lee nie zdo�a przeorganizowa� swoich oddzia��w, do��cz� do prowizorycznej stra�y Corda.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Przygotowujecie si� do kontrataku?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Jeszcze nie, ale wkr�tce na pewno to zrobimy.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Gdyby� mnie kiedy� potrzebowa�, zacznij tutaj i id� w stron� kopalni. B�d� tam sta� na stra�y.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	&& (!Npc_KnowsInfo(hero, DIA_PC_Fighter_FREE_AND_FREE))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Jak leci?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Na razie cicho. W Wolnej Kopalni nic si� nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee zajmuje si� jeszcze organizacj� naszej obrony!
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Przybywasz w sam� por�! Przygotowujemy si� do kontruderzenia.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Na pocz�tek spr�bujemy odbi� Woln� Kopalni�.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zamierzacie j� zdoby� we czterech? A gdzie s� wszyscy Najemnicy?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Zamierzacie j� zdoby� we czterech? A gdzie s� wszyscy Najemnicy?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Uderzenie od frontu nie ma szans powodzenia. Ludzie Gomeza za dobrze si� okopali.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Spr�bujemy zaatakowa� po cichu, zabijaj�c jednego Stra�nika po drugim. Mo�e si� uda...
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee kaza� mi przekaza� ci wiadomo��.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden z naszych najlepszych Najemnik�w zosta�e� wyznaczony do udzia�u w tej misji.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Jako Mag z Kr�gu Wody i do�wiadczony wojownik, zosta�e� wybrany do udzia�u w tej misji.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z naszych najlepszych Szkodnik�w zosta�e� wybrany do udzia�u w tej misji.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Cho� nie jeste� jednym z nas, wielokrotnie odda�e� nam nieocenione przys�ugi.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Dlatego chcemy ci� prosi� o udzia� w tej misji.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //P�jd� z tob�. Razem mo�e si� nam uda�.
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "Na pocz�tek? A co zamierzacie robi� p�niej?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Na pocz�tek? A co zamierzacie robi� p�niej?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Jak tylko odbijemy kopalni�, spr�bujemy odnale�� �cie�k�, kt�r� przyszli ludzie Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Kiedy ustawimy przy niej stra�, b�dziemy bezpieczni.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Rozumiem.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Dlaczego w�a�nie ja?!";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Dlaczego w�a�nie ja?!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Wielokrotnie udowodni�e�, �e jeste� silnym i przebieg�ym wojownikiem!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Poza tym znasz Stary Ob�z i jego Stra�nik�w lepiej ni� ktokolwiek z nas.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Trudno o kogo� lepszego ni� ty!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "No dobrze, chod�my. Nauczymy tych nieproszonych go�ci dobrych manier.";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //No dobrze, chod�my. Nauczymy tych nieproszonych go�ci dobrych manier.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Wiedzia�em, �e mo�na na ciebie liczy�.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //We� ten klucz. Otwiera str��wk� przy wej�ciu do kopalni.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Czemu nie. I tak musz� dosta� si� do kopalni!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Czemu nie. I tak musz� dosta� si� do kopalni!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Niewa�ne DLACZEGO to robisz. Ciesz� si�, �e jeste� z nami!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //We� ten klucz. Otwiera str��wk� przy wej�ciu do kopalni.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Ach, prawie zapomnia�em!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wilk chce z tob� koniecznie porozmawia�, zanim ruszymy do kopalni.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF, "To mo�e zaczeka�, mamy teraz wa�niejsze sprawy na g�owie.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF, "Wi�c lepiej do niego zajrz�.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,	"Wilk chce ze mn� porozmawia� zanim rusz� do kopalni. Powinienem chyba do niego zajrze�.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //To mo�e zaczeka�, mamy teraz wa�niejsze sprawy na g�owie.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Jak chcesz!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Wi�c lepiej do niego zajrz�.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //W porz�dku. Zaczekam na ciebie tutaj.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Widz�, �e jednak nie chcesz porozmawia� z Wilkiem!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Idziesz w z�� stron�! Mamy i�� prosto do kopalni!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Zaczekam na ciebie przy prowizorycznym punkcie stra�niczym!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Ruszamy do kopalni!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Ruszamy do kopalni!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Pora przep�dzi� stamt�d ludzi Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Id� przodem. P�jd� za tob�.

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //UWAGA! BRZYTWY!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Poluj� w stadach, jak z�bacze, tylko gryz� znacznie mocniej!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Powinni�my si� najpierw z nimi rozprawi�. Znasz mnie - lubi� wiedzie�, co mam za plecami.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zaczekaj! Widzisz te wszystkie cia�a?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Id� do wej�cia do kopalni. Ja zaczekam tutaj i przypilnuj�, �eby kto� lub co� nie zasz�o nas od ty�u.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Kiedy ju� zejdziesz na d�, p�jd� za tob�.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Us�ysza�em odg�osy walki i przybieg�em najszybciej jak mog�em!
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Stary znajomy... Rachunek wyr�wnany.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Dobra, otwieraj bram�. Je b�d� tu sta� na stra�y!

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Stary, to si� dopiero nazywa trudna walka!
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nie spodziewa�em si�, �e Stra�nicy Gomeza b�d� stawiali tak zaciek�y op�r.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Grunt, �e kopalnia znowu jest w naszych r�kach.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Zostan� tutaj i dopilnuj�, �eby tak ju� zosta�o!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee �ber die befreite Mine informieren.     ***Bj�rn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM) && !Npc_KnowsInfo(hero, DIA_PC_Fighter_FREE_AND_FREE)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Co s�ycha�?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Na razie cicho. W Wolnej Kopalni nic si� nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Lee powinien nied�ugo podes�a� tu posi�ki.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //P�ki co postaram si� tutaj rozgo�ci�.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Masz przy sobie ciekaw� ozd�bk�. Orkowa, prawda?
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //To od tego niewolnika z kopalni?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //To orkowy symbol przyja�ni. Przy jego pomocy zamierzam dosta� si� do miasta ork�w.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Oby tylko orkowie uszanowali to... CO�!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};
//#####################################################################################
//####### ROZDZIA� 1
//####### PRZYJ�CIE DO OBOZU
//#####################################################################################
var int przypakuj_Gorn;
//========================================
//-----------------> HelpMe
//========================================

INSTANCE DIA_PC_Fighter_HelpMe (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 1;
   condition    = DIA_PC_Fighter_HelpMe_Condition;
   information  = DIA_PC_Fighter_HelpMe_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi pom�c do��czy� do Obozu?";
};

FUNC INT DIA_PC_Fighter_HelpMe_Condition()
{
    if (MIS_OpinionInNewCamp == LOG_RUNNING)
    && (Npc_GetTrueGuild(hero) == GIL_SFB)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_HelpMe_15_01"); //Mo�esz mi pom�c do��czy� do Obozu?
    AI_Output (other, self ,"DIA_PC_Fighter_HelpMe_15_02"); //Rozmawia�em z Jarvisem.
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_03_03"); //Szukasz poparcia? Tak?
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_03_04"); //A umiesz walczy�?

    Info_ClearChoices		(DIA_PC_Fighter_HelpMe);
    Info_AddChoice		(DIA_PC_Fighter_HelpMe, "Jestem dosy� silny.", DIA_PC_Fighter_HelpMe_Strong);
    Info_AddChoice		(DIA_PC_Fighter_HelpMe, "A chcesz si� przekona�?", DIA_PC_Fighter_HelpMe_Attack);
    Info_AddChoice		(DIA_PC_Fighter_HelpMe, "Nie jestem zbyt dobrym wojownikiem.", DIA_PC_Fighter_HelpMe_No);
};

FUNC VOID DIA_PC_Fighter_HelpMe_Strong()
{
    AI_Output (other, self ,"DIA_PC_Fighter_HelpMe_Strong_15_01"); //Jestem dosy� silny.
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_Strong_03_02"); //No rzeczywi�cie. Co� tu masz, ale to i tak bardzo ma�o. 
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_Strong_03_03"); //Widz�, �e pracujesz nad sob�. Mo�esz liczy� na moje poparcie.
    B_LogEntry                     (CH1_AwansJakoKret,"Uda�o mi si� sk�oni� do siebie Gorna.");
przypakuj_Gorn = false;
    B_GiveXP (50);
    Info_ClearChoices		(DIA_PC_Fighter_HelpMe);
};

FUNC VOID DIA_PC_Fighter_HelpMe_Attack()
{
    AI_Output (other, self ,"DIA_PC_Fighter_HelpMe_Attack_15_01"); //A chcesz si� przekona�?
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_Attack_03_02"); //Nie mam zamiaru robi� ci krzywdy. Jednak jestem pe�en podziwu twojej odwagi.
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_Attack_03_03"); //Popr� ci�. Jednak pami�taj, �eby nad sob� pracowa�.
    B_LogEntry                     (CH1_AwansJakoKret,"Uda�o mi si� sk�oni� do siebie Gorna.");
przypakuj_Gorn = false;
    B_GiveXP (50);
    Info_ClearChoices		(DIA_PC_Fighter_HelpMe);
};

FUNC VOID DIA_PC_Fighter_HelpMe_No()
{
    AI_Output (other, self ,"DIA_PC_Fighter_HelpMe_No_15_01"); //Nie jestem zbyt dobrym wojownikiem.
    AI_Output (self, other ,"DIA_PC_Fighter_HelpMe_No_03_02"); //Popracuj troch� nad sob� i przyjd� do mnie p�niej.
przypakuj_Gorn = true;
    B_LogEntry                     (CH1_AwansJakoKret,"Musz� jeszcze nad sob� popracowa�.");
//Print ("Wymagane 30 punkt�w si�y/poziom 5");    de faq??
 Info_ClearChoices		(DIA_PC_Fighter_HelpMe);
};

//========================================
//-----------------> LevelUpBitch
//========================================

INSTANCE DIA_PC_Fighter_LevelUpBitch (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 2;
   condition    = DIA_PC_Fighter_LevelUpBitch_Condition;
   information  = DIA_PC_Fighter_LevelUpBitch_Info;
   permanent	= TRUE;
   description	= "Jestem ju� lepszy.";
};

FUNC INT DIA_PC_Fighter_LevelUpBitch_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Fighter_HelpMe))
    && (przypakuj_Gorn == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_LevelUpBitch_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_LevelUpBitch_15_01"); //Jestem ju� lepszy.
    AI_Output (self, other ,"DIA_PC_Fighter_LevelUpBitch_03_02"); //Zobaczmy.
		if (other.attribute[ATR_STRENGTH] >= 30)
        || (Hero.Level >= 5) //1.3 fixed
		{
        AI_Output (self, other ,"DIA_PC_Fighter_LevelUpBitch_03_03"); //No dobra. Jest lepiej. 
        AI_Output (self, other ,"DIA_PC_Fighter_LevelUpBitch_03_04"); //Mo�esz liczy� na moje poparcie.
		przypakuj_Gorn = false;
		B_LogEntry                     (CH1_AwansJakoKret,"Uzyska�em poparcie Gorna.");
        B_GiveXP (50);
		DIA_PC_Fighter_LevelUpBitch.permanent = false;
        }
        else
        {
        AI_Output (self, other ,"DIA_PC_Fighter_LevelUpBitch_03_05"); //Wci�� nie jest z tob� najlepiej. Popracuj jeszcze.
		przypakuj_Gorn = true;
        };
};

//#####################################################################################
//####### ROZDZIA� 5
//####### SPOTKANIE
//#####################################################################################
//---------------------------------------------------------------------
//	Info ZASTEPSTWO
//---------------------------------------------------------------------
INSTANCE Info_Gorn_ZASTEPSTWO (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_ZASTEPSTWO_Condition;
	information	= Info_Gorn_ZASTEPSTWO_Info;
	description = "Problem Wolnej Kopalni zosta� rozwi�zany.";	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_ZASTEPSTWO_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_FOUNDULUMULU) && Npc_KnowsInfo(hero, Info_Gorn_DIEGOMILTEN)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_ZASTEPSTWO_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(hero, self,"Info_Gorn_ZASTEPSTWO_09_01"); //Problem Wolnej Kopalni zosta� rozwi�zany.
	AI_Output 			(hero, self,"Info_Gorn_ZASTEPSTWO_09_02"); //Czy teraz stawisz si� na spotkanie?
	AI_Output 			(self, hero,"Info_Gorn_ZASTEPSTWO_15_03"); //Jasne, ale najpierw musz� poczeka� na posi�ki od Lee.
	AI_Output 			(self, hero,"Info_Gorn_ZASTEPSTWO_09_04"); //Nie mo�emy zostawi� kopalni bez �adnej obrony.
	AI_Output 			(hero, self,"Info_Gorn_ZASTEPSTWO_09_05"); //Mo�e powinienem pom�c Lee?
	AI_Output 			(self, hero,"Info_Gorn_ZASTEPSTWO_09_06"); //Tak, mo�esz. Mo�e uda ci si� wszystko przyspieszy�.
	B_LogEntry			(CH4_4Friends,"Gorn powiedzia�, �e stawi si� spotkanie, je�eli pomog� Lee w organizacji obrony Wolnej Kopalni."); 
	MIS_ObronaWK = LOG_RUNNING;
    Log_CreateTopic         (CH5_ObronaWK, LOG_MISSION);
    Log_SetTopicStatus      (CH5_ObronaWK, LOG_RUNNING);
	B_LogEntry				(CH5_ObronaWK,"Gorn powiedzia�, �e stawi si� spotkanie je�eli pomog� Lee w organizacji obrony Wolnej Kopalni. W tym celu musz� uda� si� do Lee."); 
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> FREE_AND_FREE
//========================================

INSTANCE DIA_PC_Fighter_FREE_AND_FREE (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 1;
   condition    = DIA_PC_Fighter_FREE_AND_FREE_Condition;
   information  = DIA_PC_Fighter_FREE_AND_FREE_Info;
   permanent	= FALSE;
   description	= "Jeste� wolny!";
};

FUNC INT DIA_PC_Fighter_FREE_AND_FREE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_OBRONA_ENDQUEST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_FREE_AND_FREE_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_FREE_AND_FREE_15_01"); //Jeste� wolny!
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_02"); //�wietnie! Nareszcie mog� si� st�d ruszy�.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_03"); //Wiesz co? R�wny z ciebie ch�op.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_04"); //Chod� ze mn� na spotkanie.
    AI_Output (other, self ,"DIA_PC_Fighter_FREE_AND_FREE_15_05"); //A gdzie si� ono odb�dzie?
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_06"); //Niedaleko st�d, w g�rach.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_07"); //W pobli�u tego miejsca znajduje si� kamienny kr�g, a pod nim krypta.
    AI_Output (other, self ,"DIA_PC_Fighter_FREE_AND_FREE_15_08"); //Wiem ju� co to za miejsce. By�em tam z Miltenem.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_09"); //To dobrze, �e wiesz.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_10"); //Ja natychmiast si� tam udam. Ty przyjd�, jak tylko b�dziesz gotowy.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_11"); //Zaczekamy na ciebie. 
    AI_Output (other, self ,"DIA_PC_Fighter_FREE_AND_FREE_15_12"); //Jasne, dzi�ki.
    AI_Output (self, other ,"DIA_PC_Fighter_FREE_AND_FREE_03_13"); //Jasna sprawa brachu.
    B_LogEntry                     (CH4_4Friends,"Gorn powiedzia�, �e spotkanie odb�dzie si� w pobli�u kamiennego kr�gu, kt�ry zwiedzili�my z Miltenem. Powinienem si� tam uda�. W ko�cu nie ma w Kolonii nic cenniejszego, ni� kilku oddanych przyjaci�. ");

    B_GiveXP (200);

	Npc_ExchangeRoutine (PC_FIGHTER,"spotkanie");
	if (Npc_KnowsInfo (hero, DIA_PC_MAGE_SPOTKANIE))
	{
	Npc_ExchangeRoutine (PC_MAGE,"spotkanie");
	};
	Npc_ExchangeRoutine (PC_THIEF,"spotkanie");
	if (Npc_KnowsInfo (hero, Info_Lester_DIEGOMILTEN))
	{
	Npc_ExchangeRoutine (PC_PSIONIC,"spotkanie");
	};
	AI_StopProcessInfos	(self);
//rutyna
};

//========================================
//-----------------> PREZENT_GORN
//========================================

INSTANCE DIA_pc_fighter_PREZENT_GORN (C_INFO)
{
   npc          = pc_fighter;
   nr           = 1;
   condition    = DIA_pc_fighter_PREZENT_GORN_Condition;
   information  = DIA_pc_fighter_PREZENT_GORN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_pc_fighter_PREZENT_GORN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Fighter_FREE_AND_FREE)) && (Npc_GetDistToWP (self, "SPT_GORN") < 2000)//blisko wp - if
    {
    return TRUE;
    };
};


FUNC VOID DIA_pc_fighter_PREZENT_GORN_Info()
{
    AI_Output (self, hero ,"DIA_pc_fighter_PREZENT_GORN_03_01"); //Dobrze, �e jeste�.
    AI_Output (self, hero ,"DIA_pc_fighter_PREZENT_GORN_03_02"); //Lester ju� zacz�� si� obawia�, �e nie przyjdziesz.
    AI_Output (hero, self ,"DIA_pc_fighter_PREZENT_GORN_03_03"); //C�, mia�em kilka spraw na g�owie.
    AI_Output (self, hero ,"DIA_pc_fighter_PREZENT_GORN_03_04"); //To teraz nieistotne. 
	AI_Output (self, hero ,"DIA_pc_fighter_PREZENT_GORN_03_05"); //Mam tu co� dla ciebie. My�l�, �e zas�u�y�e�. 
    AI_Output (hero, self ,"DIA_pc_fighter_PREZENT_GORN_03_06"); //Co to jest?
	AI_Output (self, hero ,"DIA_pc_fighter_PREZENT_GORN_03_07"); //Top�r �aski. Mia�em t� bro� od wielu lat.
	AI_Output (self, hero ,"DIA_pc_fighter_PREZENT_GORN_03_08"); //Znalaz�em j� w starej krypcie. Nigdy jej nie u�ywa�em, wol� sw�j top�r. 
	AI_Output (hero, self ,"DIA_pc_fighter_PREZENT_GORN_03_09"); //Dzi�kuj�, to wspania�y prezent.
	B_LogEntry                     (CH4_4Friends,"Gorn podarowa� mi wspania�y, dwur�czny top�r.");
	//do zmiany
	CreateInvItems (self, Gottfrieds_Axt, 1);
    B_GiveInvItems (self, other,Gottfrieds_Axt , 1);
    //AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FRIENDZONE
//========================================

INSTANCE DIA_PC_Fighter_FRIENDZONE (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 2;
   condition    = DIA_PC_Fighter_FRIENDZONE_Condition;
   information  = DIA_PC_Fighter_FRIENDZONE_Info;
   permanent	= FALSE;
   description	= "Czy d�ugo ju� przyja�nisz si� z pozosta�� tr�jk�?";
};

FUNC INT DIA_PC_Fighter_FRIENDZONE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_pc_fighter_PREZENT_GORN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_FRIENDZONE_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_FRIENDZONE_15_01"); //Czy d�ugo ju� przyja�nisz si� z pozosta�� tr�jk�?
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_02"); //B�dzie ju� par� niez�ych lat.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_03"); //Diego pozna�em pierwszego dnia, kiedy tutaj trafi�em.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_04"); //W sumie razem trafili�my do tej zapchlonej dziury.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_05"); //Diego zawsze by� w porz�dku. M�wi konkretnie i na temat. Mo�na na nim polega�. 
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_06"); //Przez jaki� czas kr�ci�em si� po Starym Obozie, walcz�c troch� na arenie Scatty'ego.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_07"); //W mi�dzyczasie moja przyja�� z Diego nabra�a tempa. 
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_08"); //W tym samym czasie pozna�em Miltena, cz�owieka o ciekawej przesz�o�ci.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_09"); //Z nim te� �y�em w dobrej komitywie.
    AI_Output (other, self ,"DIA_PC_Fighter_FRIENDZONE_15_10"); //A co z Lesterem?
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_11"); //On trafi� do Kolonii nieco p�niej. Pozna�em go jakie� dwa lata temu, r�wnie� dzi�ki Diego.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_12"); //Lester pr�bowa� szcz�cia we wszystkich obozach, jednak ostatecznie uda� si� na bagna.
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_13"); //Chyba mu si� tam spodoba�o. Pono� pomimo rangi Nowicjusza, jest szanowany w Obozie. 
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_14"); //Mimo i� nasze losy potoczy�y si� nieco inaczej, nasza przyja�� przetrwa�a. 
    AI_Output (self, other ,"DIA_PC_Fighter_FRIENDZONE_03_15"); //Ja z kolei wybra�em Nowy Ob�z i prac� dla Mag�w Wody. 
    //AI_Output (other, self ,"DIA_PC_Fighter_FRIENDZONE_15_16"); //Bardzo ciekawe.
};

//========================================
//-----------------> WHY_NEW_CAMP
//========================================

INSTANCE DIA_PC_Fighter_WHY_NEW_CAMP (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 3;
   condition    = DIA_PC_Fighter_WHY_NEW_CAMP_Condition;
   information  = DIA_PC_Fighter_WHY_NEW_CAMP_Info;
   permanent	= FALSE;
   description	= "Jak do��czy�e� do Nowego Obozu?";
};

FUNC INT DIA_PC_Fighter_WHY_NEW_CAMP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_pc_fighter_PREZENT_GORN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_WHY_NEW_CAMP_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_WHY_NEW_CAMP_15_01"); //Jak do��czy�e� do Nowego Obozu?
    AI_Output (self, other ,"DIA_PC_Fighter_WHY_NEW_CAMP_03_02"); //To proste, kr�c�c si� po Starym Obozie z czasem uzna�em, �e to nie jest �ycie dla mnie.
    AI_Output (self, other ,"DIA_PC_Fighter_WHY_NEW_CAMP_03_03"); //Nie chcia�em zosta� s�ugusem Magnat�w, a tym bardziej liza� ty�ka Thorusowi.
    AI_Output (self, other ,"DIA_PC_Fighter_WHY_NEW_CAMP_03_04"); //Pewnego wieczora spotka�em w karczmie jednego ze Szkodnik�w. Sporo mi opowiedzia� o Nowym Obozie. 
    AI_Output (self, other ,"DIA_PC_Fighter_WHY_NEW_CAMP_03_05"); //To by� m�j ostatni dzie� w Starym Obozie. Potem wszystko posz�o z g�rki.
    AI_Output (self, other ,"DIA_PC_Fighter_WHY_NEW_CAMP_03_06"); //Nie musia�em d�ugo stara� si� o przyj�cie w szeregi Najemnik�w. Szkodnikiem by�em do�� kr�tko. Lee od razu doceni� moj� si��.
   // AI_Output (other, self ,"DIA_PC_Fighter_WHY_NEW_CAMP_15_07"); //Rozumiem.
};

//========================================
//-----------------> THORUS
//========================================
//UNLORE!!!! OFF!!
INSTANCE DIA_PC_Fighter_THORUS (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 4;
   condition    = DIA_PC_Fighter_THORUS_Condition;
   information  = DIA_PC_Fighter_THORUS_Info;
   permanent	= FALSE;
   description	= "Co ��czy ci� z Thorusem?";
};

FUNC INT DIA_PC_Fighter_THORUS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Fighter_WHY_NEW_CAMP)) && (KAPITEL == 10) //off
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_THORUS_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_THORUS_15_01"); //Co ��czy ci� z Thorusem?
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_02"); //Nawet mi nie m�w o tym sukinsynie.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_03"); //Pochodzimy z tego samego miejsca - z jeden z Po�udniowych Wysp.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_04"); //Za m�odu przez wiele lat trzymali�my si� razem, walcz�c ze stra�nikami kr�lewskimi, pragn�cymi zaj�� wysp�.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_05"); //Uwa�a�em go za swojego przyjaciela, wiesz?
    AI_Output (other, self ,"DIA_PC_Fighter_THORUS_15_06"); //Wi�c co si� sta�o?
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_07"); //Jak to co? Thorus zbrata� si� z lud�mi Rhobara.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_08"); //Wyda� ca�� nasz� wiosk� na pastw� tych okrutnik�w!
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_09"); //Stra�nicy kr�lewscy wymordowali ca�� moj� rodzin� i wszystkich moich przyjaci�.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_10"); //Tylko ja cudem ocala�em i uda�em si� na inn� wysp�.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_11"); //Tam chcia�em zapomnie� o tym wszystkim.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_12"); //Thorus sam wpad� w pu�apk�. Ludzie Rhobara aresztowali go i zosta� skazany na ci�kie prace w Kolonii G�rniczej.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_13"); //To by�o jeszcze d�ugo przed powstaniem Bariery.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_14"); //Pracuj�c w kopalni, zbrata� si� z Krukiem, praw� r�k� Gomeza.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_15"); //W�a�nie dzi�ki niemu do��czy� do Starego Obozu i zosta� szefem Stra�nik�w. 
    AI_Output (other, self ,"DIA_PC_Fighter_THORUS_15_16"); //Rozumiem.
    AI_Output (self, other ,"DIA_PC_Fighter_THORUS_03_17"); //Kiedy� zap�aci mi za zdrad�. Jeszcze go dopadn�.
};

//========================================
//-----------------> COLONY
//========================================

INSTANCE DIA_PC_Fighter_COLONY (C_INFO)
{
   npc          = PC_Fighter;
   nr           = 5;
   condition    = DIA_PC_Fighter_COLONY_Condition;
   information  = DIA_PC_Fighter_COLONY_Info;
   permanent	= FALSE;
   description	= "W jaki spos�b znalaz�e� si� w Kolonii?";
};

FUNC INT DIA_PC_Fighter_COLONY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_pc_fighter_PREZENT_GORN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Fighter_COLONY_Info()
{
    AI_Output (other, self ,"DIA_PC_Fighter_COLONY_15_01"); //W jaki spos�b znalaz�e� si� w Kolonii?
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_02"); //No c�, to do�� d�uga historia. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_03"); //By�em wtedy jeszcze niedo�wiadczony. Uciek�em z rodzinnej wyspy w poszukiwaniu lepszego �ycia.
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_04"); //Pewien znajomy marynarz pom�g� mi przedosta� si� na wysp� Khorinis. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_05"); //Liczy�em, �e pomimo mrocznych opowie�ci o G�rniczej Dolinie uda mi si� tu jako� u�o�y� sobie wszystko. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_06"); //Na pocz�tku wszystko sz�o �wietnie. Zacz��em prac� w mie�cie. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_07"); //Mia�em w�asne �r�d�o dochodu. Nie by�y to jakie� wielkie sumy, ale starcza�o, �eby si� naje�� i upi� wieczorem w portowej karczmie. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_08"); //Jednak nie wszystkim pasowa�em. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_09"); //Stra�nik Pablo zacz�� w�szy� wok� mojej osoby. Jakim� trafem uda�o mu si� dowiedzie�, �e jestem uciekinierem. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_10"); //By� m�ody, ledwo dosta� si� do stra�y. Pewnie chcia� zab�ysn�� u dow�dcy.
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_11"); //Nie mog�em na to pozwoli�. Dosta� ode mnie porz�dn� lekcj� �ycia. 
    AI_Output (self, other ,"DIA_PC_Fighter_COLONY_03_12"); //O wszystkim doni�s� prze�o�onym. Nast�pnego dnia mnie zgarn�li.
};







