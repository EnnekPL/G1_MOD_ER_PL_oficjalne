//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Horatio_EXIT (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 999;
	condition	= DIA_Horatio_EXIT_Condition;
	information	= DIA_Horatio_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

INSTANCE Info_Horatio_Wasser(C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 800;
	condition	= Info_Horatio_Wasser_Condition;
	information	= Info_Horatio_Wasser_Info;
	permanent	= 1;
	description = "Przysy�a mnie Lewus. Przynios�em wam wod�.";
};                       

FUNC INT Info_Horatio_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Przysy�a mnie Lewus. Przynios�em wam wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Dzi�ki, kolego. Jeszcze troch�, a zacz��bym pi� z ka�u�y!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Chyba ci si� sko�czy�a! Trudno, wezm� troch� od innych.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

INSTANCE DIA_Horatio_Hello (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Hello_Condition;
	information	= DIA_Horatio_Hello_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Horatio_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_Hello_Info()
{	
	AI_GotoNpc	(self, hero);

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //Co tu robisz? Szukasz k�opot�w?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello, "K�opot�w? A co - grozisz mi, robolu?!",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello, "Spokojnie! Jestem tu nowy."	,DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //Spokojnie! Jestem tu nowy.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //Hmmm... Wygl�dasz w porz�dku. Chocia� nigdy nie wiadomo - zawsze znajdzie si� jaki� nowy, kt�ry wyobra�a sobie niewiadomo co.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //K�opot�w? A co - grozisz mi, robolu?!
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //Tylko dlatego, �e pracuj� w polu, my�lisz, �e nie dam sobie rady z kim� takim jak ty?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //No, je�li szukasz guza, to chod�!
	horatio_trouble = TRUE;
	
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

INSTANCE DIA_Horatio_SORRY (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_SORRY_Condition;
	information	= DIA_Horatio_SORRY_Info;
	permanent	= 1;
	description = "Przepraszam, nie chcia�em by� z�o�liwy.";
};                       

FUNC INT DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_SORRY_Info()
{	
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Przepraszam, nie chcia�em by� z�o�liwy.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //Trzeba by�o pomy�le� o tym wcze�niej, ch�opcze.
};

// ************************************************************
// 					Horatios Story
// ************************************************************

INSTANCE DIA_Horatio_Story (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Story_Condition;
	information	= DIA_Horatio_Story_Info;
	permanent	= 0;
	description = "Co kto� taki jak ty robi w towarzystwie zbieraczy?";
};                       

FUNC INT DIA_Horatio_Story_Condition()
{
	if ( (horatio_trouble==FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Story_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //Co kto� taki jak ty robi w towarzystwie zbieraczy?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Lee te� mnie o to pyta�. Nie chce ju� walczy�, no chyba �e w obronie w�asnej.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Raz zabi�em cz�owieka i jak dla mnie to by�o o jeden raz za du�o. Zreszt� dlatego w�a�nie trafi�em do tej zapchlonej Kolonii.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //Jak to si� sta�o?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Zwyk�a b�jka w karczmie. Nie chcia�em zabi� faceta - chyba po prostu za mocno go waln��em.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //By�em wtedy kowalem. Najwyra�niej nie doceni�em w�asnej si�y.
};

// ************************************************************
// 						Warum hier?
// ************************************************************

INSTANCE DIA_Horatio_WhyHere (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_WhyHere_Condition;
	information	= DIA_Horatio_WhyHere_Info;
	permanent	= 0;
	description = "Dlaczego do��czy�e� w�a�nie do TEGO Obozu?";
};                       

FUNC INT DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_WhyHere_Info()
{	
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //Dlaczego do��czy�e� w�a�nie do TEGO Obozu?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Ju� ci m�wi�: do wyboru mia�em tylko tych �wir�w z Sekty, a nie u�miecha�o mi si� pranie m�zgu, kt�remu chcieli mnie podda�.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //W Starym Obozie mia�bym za du�o k�opot�w ze Stra�nikami, a tutaj Najemnicy i Szkodniki traktuj� mnie z szacunkiem.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //To znaczy - boj� si� ciebie...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Mo�e. Tak, czy inaczej - tutaj znalaz�em spok�j. Radz� ci p�j�� w moje �lady.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

INSTANCE DIA_Horatio_PleaseTeachSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_PleaseTeachSTR_Condition;
	information	= DIA_Horatio_PleaseTeachSTR_Info;
	permanent	= 0;
	description = "Mo�esz mnie wyszkoli� tak bym by� r�wnie silny jak ty?";
};                       

FUNC INT DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_PleaseTeachSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Mo�esz mnie wyszkoli� tak bym by� r�wnie silny jak ty?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Nawet gdybym m�g� - po co ci to?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Chc� wyko�czy� Ry�owego Ksi�cia i jego zbir�w!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Dobre pytanie. Przemy�l� to sobie.",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Do samoobrony!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "�eby pokaza� tym sukinsynom, �e nie mo�na mn� pomiata�.",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,	"Horacy, zbieracz ry�u z Nowego Obozu, mo�e mi pokaza�, jak skuteczniej zadawa� ciosy. Niestety, nie uda�o mi si� jeszcze znale�� odpowiedzi na pytanie DLACZEGO mia�by to zrobi�.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //�eby pokaza� tym sukinsynom, �e nie mo�na mn� pomiata�.
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //I zanim by� si� obejrza�, sam sta�by� si� jednym z tych sukinsyn�w... Nie, drogi panie, to nie jest w�a�ciwa motywacja.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Do samoobrony!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //Do tego potrzeba szybko�ci, a nie si�y. My�lisz, �e gruchotanie ko�ci pomo�e ci wie�� spokojne �ycie?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Dobre pytanie. Przemy�l� to sobie.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Chc� wyko�czy� Ry�owego Ksi�cia i jego zbir�w!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmmm... Wielu ju� pr�bowa�o przed tob�.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

INSTANCE DIA_Horatio_ThoughtSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_ThoughtSTR_Condition;
	information	= DIA_Horatio_ThoughtSTR_Info;
	permanent	= 1;
	description = "Przemy�la�em sobie to wszystko jeszcze raz...";
};                       

FUNC INT DIA_Horatio_ThoughtSTR_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_ThoughtSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //Przemy�la�em sobie to wszystko jeszcze raz...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //No i? Wymy�li�e� co� lepszego?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR, "Nie.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR, "Tak. Chcia�bym przeciwstawi� si� Ry�owemu Ksi�ciu i jego zbirom!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Nie.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Tak my�la�em.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Tak. Chcia�bym przeciwstawi� si� Ry�owemu Ksi�ciu i jego zbirom!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmmm... Wielu ju� pr�bowa�o przed tob�.
	horatio_StrFree = TRUE;
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

// ************************************************************
//					Will Ricelord k�pfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintS_Ext ("Si�a + 5",COL_Lime) ;
		//PrintScreen	("Si�a + 5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("Si�a: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Je�li chcesz mocno uderzy�, musisz najpierw popracowa� nad odpowiedni� technik�. To pierwsza zasada dobrego kowala.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Naucz si� uderza� ca�� r�k� - od ramienia po nadgarstek.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Im lepiej sobie z tym poradzisz, tym silniejszy b�dzie tw�j cios. Sam si� wkr�tce przekonasz...
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "MOG� pokona� Ry�owego Ksi�cia i jego bandyt�w - je�li mi pomo�esz!";
};                       

FUNC INT DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_HelpSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //MOG� pokona� Ry�owego Ksi�cia i jego bandyt�w - je�li mi pomo�esz!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //Dobrze! Przysi�g�em, �e nigdy nie zaatakuj� innego cz�owieka, ale nie powiedzia�em, �e nie poka�� komu� jak to zrobi�!
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //Zamieniam si� w s�uch.
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,	"Horacy pokaza� mi jak efektywnie wykorzysta� moj� si�� w walce. Dobry z niego cz�owiek.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

INSTANCE DIA_Horatio_Thanks (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_Thanks_Condition;
	information	= DIA_Horatio_Thanks_Info;
	permanent	= 1;
	description = "Dzi�ki za pomoc!";
};                       

FUNC INT DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Thanks_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //Dzi�ki za pomoc!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Wykorzystaj t� wiedz� wy��cznie w s�usznej sprawie!
};


////////////////////////////////////////////
//		 Bunt
////////////////////////////////////////////

INSTANCE DIA_Horatio_Bunt (C_INFO)
{
   npc          = Bau_901_Horatio;
   nr           = 1;
   condition    = DIA_Horatio_Bunt_Condition;
   information  = DIA_Horatio_Bunt_Info;
   permanent	= FALSE;
   description	= "Co my�lisz o tym ca�ym buncie?";
};

FUNC INT DIA_Horatio_Bunt_Condition()
{
    if  (MIS_BuntZbieraczy == LOG_RUNNING)      
	{
    return TRUE;
    };
};


FUNC VOID DIA_Horatio_Bunt_Info()
{
    AI_Output (other, self ,"DIA_Horatio_Bunt_15_01"); //Co my�lisz o tym ca�ym buncie?
    AI_Output (self, other ,"DIA_Horatio_Bunt_03_02"); //Mam nadziej�, �e ca�a sprawa wkr�tce ucichnie i obejdzie si� bez niepotrzebnego rozlewu krwi.
    AI_Output (self, other ,"DIA_Horatio_Bunt_03_03"); //Nie jestem zwolennikiem rozwi�za� si�owych. Ju� raz w �yciu przesadzi�em.
};

////////////////////////////////////////////
//		 WithoutBlood
////////////////////////////////////////////

INSTANCE DIA_Horatio_WithoutBlood (C_INFO)
{
   npc          = Bau_901_Horatio;
   nr           = 1;
   condition    = DIA_Horatio_WithoutBlood_Condition;
   information  = DIA_Horatio_WithoutBlood_Info;
   permanent	= FALSE;
   description	= "Podobno chcia�e� ze mn� rozmawia�.";
};

FUNC INT DIA_Horatio_WithoutBlood_Condition()
{
    if  (Quest_TalkWithHoratio == LOG_RUNNING)      
	{
    return TRUE;
    };
};


FUNC VOID DIA_Horatio_WithoutBlood_Info()
{
    AI_Output (other, self ,"DIA_Horatio_WithoutBlood_15_01"); //Podobno chcia�e� ze mn� rozmawia�.
    AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_02"); //Tak, dobrze, �e przyszed�e�. Widz�, �e wszyscy powoli trac� zimn� krew. Chc� �eby� to w ko�cu ukr�ci�.
    AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_03"); //Mam pewien plan.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_04"); //Chc� �eby� w�ama� si� do magazynu. Za jedn� z drabin najdziesz skrzyni�.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_05"); //W �rodku znajduje si� �o�d dla bandzior�w i pier�cie� Ry�owego Ksi�cia. To dla niego wa�na pami�tka.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_06"); //Teraz pozostawiam ci wyb�r. Mo�esz ukra�� tylko pier�cie� i da� go Pock'owi. 
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_07"); //Gdy ju� to zrobisz, powiedz Ry�owemu Ksi�ciu, �e Lewus ukrad� jego pier�cie� i odda� go swojemu nowemu przyjacielowi.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_08"); //To na pewno ich sk��ci. Ry�owy Ksi��� zostanie sam i przystanie na warunki buntownik�w.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_09"); //Z kolei, je�li zabierzesz rud� i pier�cie�, po czym mi to wszystko przyniesiesz, zadbam, aby bandziory pozby�y si� obydw�ch wyzyskiwaczy.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_10"); //Wyb�r pozostawiam tobie.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_11"); //A co do kwestii w�amania... C�, cz�onkowie Nowego Obozu mog� swobodnie chodzi� po magazynie, wi�c nie by�oby k�opotu.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_12"); //W innym wypadku musia�by� si� tam wkra��. Od strony domu na pewno nie wejdziesz. Przesiaduje tam Pock, kt�ry natychmiast ci� dostrze�e.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_13"); //Wprawdzie drugie wej�cie te� jest mocno obstawione, jednak przy odrobinie szcz�cia uda ci si� w�lizgn��.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_14"); //Najlepiej oprze� si� plecami o �cian�, zapali�, udawa�, �e nic si� nie robi. Kiedy wszyscy zaczn� cie ignorowa� po prostu si� przemknij.
	AI_Output (other, self ,"DIA_Horatio_WithoutBlood_15_15"); //Postaram si�. W ko�cu nie pierwszy raz si� skradam.
	AI_Output (self, other ,"DIA_Horatio_WithoutBlood_03_16"); //Tu masz klucz. Powodzenia! I pami�taj, to ty zdecydujesz, ile krwi si� tutaj przeleje. Wybierz m�drze.
	
	Quest_StealRing = LOG_RUNNING;
	Quest_StealOre = LOG_RUNNING;
	
	CreateInvItem (self,ItMi_KeyToChestInStorage);
	B_GiveInvItems (self, hero, ItMi_KeyToChestInStorage,1);
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Horacy chce, �ebym w�ama� si� do magazynu i wykrad� ze skrzyni bandzior�w rud� i pier�cie� Ry�owego Ksi�cia. Mog� z nimi zrobi� dwie rzeczy: odda� Horacemu, a wtedy on na�le siepaczy Lewusa na obu tyran�w lub podarowa� pier�cie� Pockowi, powiedzie� o tym Ry�owemu Ksi�ciu i tym samym sk��ci� obu tyran�w. Wyb�r nale�y do mnie.");
	
	Npc_ExchangeRoutine (BAU_902_Pock,"outside");
};

////////////////////////////////////////////
//		 KillBoth
////////////////////////////////////////////

INSTANCE DIA_Horatio_KillBoth (C_INFO)
{
   npc          = Bau_901_Horatio;
   nr           = 1;
   condition    = DIA_Horatio_KillBoth_Condition;
   information  = DIA_Horatio_KillBoth_Info;
   permanent	= FALSE;
   description	= "Mam tu rud� i pier�cie� ze skrzyni.";
};

FUNC INT DIA_Horatio_KillBoth_Condition()
{
    if (Quest_StealOre == LOG_RUNNING) && (Quest_StealRing == LOG_RUNNING) && (Npc_HasItems (hero,ItMiNugget) >= 500) && (Npc_HasItems (hero,ItMi_RicelordRing) == 1)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Horatio_KillBoth_Info()
{
    AI_Output (other, self ,"DIA_Horatio_KillBoth_15_01"); //Mam tu rud� i pier�cie� ze skrzyni.
    AI_Output (self, other ,"DIA_Horatio_KillBoth_03_02"); //Powiedz Rufusowi, �e ja si� wszystkim zajm�. Niech trzyma w ludzi w ryzach.
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Odda�em �upy Horacemu. Mam o tym powiedzie� Rufusowi, a w tym czasie Horacy zrobi co trzeba.");
	
	Quest_StealRing = LOG_FAILED;
	Quest_StealOre = LOG_SUCCESS;
};