//poprawione i sprawdzone - Nocturn

// ************************************************************
// 			  				   EXIT 
// ************************************************************
//sprawdzone przez gothic1210
INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Przysy�a mnie Lewus. Przynosz� ci wod�.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysy�a mnie Lewus. Przynosz� ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dzi�ki, stary. W g�bie mi ju� zasch�o.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci ju� nie zosta�o. Tylko mi nie m�w, �e znowu wszyscy zd��yli si� napi� opr�cz mnie!
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogo� innego, dobra? Ja tu tylko uprawiam ry�. Na innych rzeczach si� nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najch�tniej powiedzia�bym Ry�owemu Ksi�ciuniowi, �eby sam odwala� swoj� brudn� robot�!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Skoro tak ci to nie odpowiada, dlaczego tu pracujesz? ";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To si� zdarzy�o pierwszego dnia po moim przybyciu. Lewus, jeden z oprych�w pracuj�cych dla Ry�owego Ksi�cia, podszed� do mnie i spyta� czy nie m�g�bym im pom�c na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedzia�em "jasne". W ko�cu by�em tu nowy i zale�a�o mi na znalezieniu sobie przyjaci�.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Nast�pnego dnia, kiedy ucina�em sobie drzemk�, facet znowu si� zjawi�.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedzia�: "Chyba nie chcesz, �eby twoi koledzy odwalali za ciebie ca�� robot�, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedzia�em mu, �e jestem wyczerpany wczorajsz� prac�, i �e potrzebuj� odpoczynku. Ale on mia� to gdzie�.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Z�apa� mnie za ko�nierz i ZACI�GN�� z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czeka� na mnie na progu mojej chaty - dop�ki nie nauczy�em si� sam wychodzi� w pole. Nie chcia�em, �eby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderc�w. Lepiej trzymaj si� od nich z daleka.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 0;
	description	= "Kim jest Ry�owy Ksi���?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello)) && (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ry�owy Ksi���?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //By� jednym z pierwszych ludzi, kt�rzy tutaj trafili. Pomaga� w zak�adaniu Obozu i rozpocz�� upraw� ry�u.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dzi� jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T�usty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


//========================================
//-----------------> BuntKurwa
//========================================

INSTANCE DIA_Rufus_BuntKurwa (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_BuntKurwa_Condition;
   information  = DIA_Rufus_BuntKurwa_Info;
   permanent	= FALSE;
   description	= "Planujecie bunt?";
};

FUNC INT DIA_Rufus_BuntKurwa_Condition()
{
    if (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_BuntKurwa_Info()
{
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_01"); //Planujecie bunt?
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_02"); //Cicho! Sk�d o tym wiesz?
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_03"); //Horacy mi m�wi�.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_04"); //No wi�c by� taki plan. Chcieli�my w ko�cu si� im sprzeciwi�.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_05"); //Pracujemy tu po 14 godzin dziennie. Jeste�my bici, a czasem niekt�rzy z nas gin�.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_06"); //Pami�tam, gdy Lewus zabi� mojego przyjaciela, Dereka.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_07"); //To by�o trzy lata temu...
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_08"); //Musz� wam pom�c. Niewa�ne w jaki spos�b. 
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_09"); //Chcesz ich zabi�?
    AI_Output (other, self ,"DIA_Rufus_BuntKurwa_15_10"); //Je�li to konieczne.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_11"); //Zaczekaj. Musz� to wszystko przemy�le�.
    AI_Output (self, other ,"DIA_Rufus_BuntKurwa_03_12"); //Przyjd� do mnie o p�nocy.
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus faktycznie odpowiada za zaplanowanie rewolucji. Gdy tylko powiedzia�em mu, �e rozmawia�em z Horacym, natychmiast mi zaufa�. Mam zg�osi� si� do niego o p�nocy, aby dowiedzie� si� czego� wi�cej o buncie zbieraczy.");
	DIA_Rufus_Nasi_OFF = false; // 
};

//========================================
//-----------------> Jestem
//========================================

INSTANCE DIA_Rufus_Jestem (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_Jestem_Condition;
   information  = DIA_Rufus_Jestem_Info;
   permanent	= FALSE;
   description	= "Jestem.";
};

FUNC INT DIA_Rufus_Jestem_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_BuntKurwa))
    &&      (Wld_IsTime     (00,00,02,59))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Jestem_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Jestem_15_01"); //Jestem.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_02"); //�wietnie! Obmy�li�em plan.
    AI_Output (other, self ,"DIA_Rufus_Jestem_15_03"); //Co zrobimy?
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_04"); //Wszystko po cichu, noc�.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_05"); //Ty zajmiesz si� Ry�owym Ksi�ciem. Jest najsilniejszy.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_06"); //Zajdziesz go od ty�u, a do magazynu wejdziesz przez chat�.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_07"); //My zajmiemy si� Lewusem.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_08"); //Gdy zabijesz tego wieprza, przyb�dziesz nam na pomoc.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_09"); //Z pewno�ci� z g�ry przylec� pupilki Lewusa.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_10"); //Musimy si� dobrze przygotowa� do walki.
    AI_Output (other, self ,"DIA_Rufus_Jestem_15_11"); //Co teraz mam robi�?
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_12"); //Najpierw musimy wybada�, kt�rzy zbieracze s� z nami.
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_13"); //Nie mo�emy dopu�ci� do zdrady. Wypytaj Horacego, Pocka i Homera. Wprawdzie Horacy nie powinien nam wchodzi� w drog�, ale lepiej si� upewni�. 
    AI_Output (self, other ,"DIA_Rufus_Jestem_03_14"); //Gdy b�dziesz wiedzia�, kto jest po naszej stronie, przyjd� do mnie.
	Homer_Rozpracowany = false; //na razie nie jest rozpracowany
	Horatio_KnowsBunt = false;
	Homer_KnowsBunt = false;
    B_LogEntry                     (CH1_BuntZbieraczy,"Po nocnej rozmowie otrzyma�em zadanie sprawdzenia lojalno�ci Pocka, Homera i Horacego.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};
/*
//========================================
//-----------------> Nasi
//========================================

INSTANCE DIA_Rufus_Nasi (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Nasi_Condition;
   information  = DIA_Rufus_Nasi_Info;
   permanent	= false;
   description	= "Co do naszych ludzi...";
};

FUNC INT DIA_Rufus_Nasi_Condition()
{
 if (Npc_KnowsInfo (hero, DIA_Rufus_Jestem))
 && (MIS_BuntZbieraczy == LOG_RUNNING)      
 //&& (DIA_Rufus_Nasi_OFF == false) 
{
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Nasi_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Nasi_15_01"); //Co do naszych ludzi...
    AI_Output (self, other ,"DIA_Rufus_Nasi_03_02"); //Wi�kszo�� jest z nami, a co z pozosta�ymi?

    Info_ClearChoices		(DIA_Rufus_Nasi);
	if (Npc_KnowsInfo (hero, DIA_Horatio_Bunt))
	{
    Info_AddChoice		(DIA_Rufus_Nasi, "Horacy nam nie pomo�e.", DIA_Rufus_Nasi_Horatio);
	};
	if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	&& (Homer_Rozpracowany == false)
	{
    Info_AddChoice		(DIA_Rufus_Nasi, "Homer nam pomo�e.", DIA_Rufus_Nasi_Homer);
	};
	if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	&& (Homer_Rozpracowany == true)
	{
	Info_AddChoice		(DIA_Rufus_Nasi, "Homer to zdrajca.", DIA_Rufus_Nasi_HomerCipa);
	};
	if (Npc_KnowsInfo (hero, DIA_Pock_BuntujeszSie))
	{
    Info_AddChoice		(DIA_Rufus_Nasi, "Pock jest podejrzany.", DIA_Rufus_Nasi_Pock);
	};
    Info_AddChoice		(DIA_Rufus_Nasi, DIALOG_BACK, DIA_Rufus_Nasi_BACK);
};

func void DIA_Rufus_Nasi_Horatio ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_Horatio_15_01"); //Horacy nam nie pomo�e, ale te� nic nie powie.
AI_Output (self, other ,"DIA_Rufus_Nasi_Horatio_03_02"); //Tego si� spodziewa�em.
Horatio_KnowsBunt = true;
};

func void DIA_Rufus_Nasi_Homer ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_Homer_15_01"); //Homer jest po naszej stronie.
AI_Output (self, other ,"DIA_Rufus_Nasi_Homer_03_02"); //To �wietnie.
Homer_KnowsBunt = true;
};

func void DIA_Rufus_Nasi_HomerCipa ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_HomerCipa_15_01"); //Homer to pupilek Ry�owego Ksi�cia. Najlepiej nic mu nie m�wi�.
AI_Output (self, other ,"DIA_Rufus_Nasi_HomerCipa_03_02"); //Dobrze, �e nas ostrzeg�e�.
B_GiveXP (100);
Homer_KnowsBunt = true;
};

func void DIA_Rufus_Nasi_Pock ()
{
AI_Output (other, self ,"DIA_Rufus_Nasi_Pock_15_01"); //Pock jest podejrzany. Nic nie wiedzia� o buncie. Chcia� wyci�gn�� ode mnie jak najwi�cej informacji.
AI_Output (self, other ,"DIA_Rufus_Nasi_Pock_03_02"); //Dobrze, �e nas ostrzeg�e�.
B_GiveXP (100);
Pock_KnowsBunt = true;
};
func void DIA_Rufus_Nasi_BACK ()
{
 Info_ClearChoices	(DIA_Rufus_Nasi);
 DIA_Rufus_Nasi.permanent = true;
};



//========================================
//-----------------> Next
//========================================

INSTANCE DIA_Rufus_Next (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Next_Condition;
   information  = DIA_Rufus_Next_Info;
   permanent	= FALSE;
   description	= "Co dalej?";
};

FUNC INT DIA_Rufus_Next_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_Nasi))
   // &&  (DIA_Rufus_Nasi_OFF == false)    
{
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Next_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Next_15_01"); //Co dalej?
    if (Homer_KnowsBunt == true)
    || (Horatio_KnowsBunt == true)
    || (Pock_KnowsBunt == true)
    {
  
        AI_Output (self, other ,"DIA_Rufus_Next_03_02"); //Teraz potrzebujemy nieco broni i alkoholu.
        AI_Output (other, self ,"DIA_Rufus_Next_15_03"); //Alkoholu?
        AI_Output (self, other ,"DIA_Rufus_Next_03_04"); //Tak. Pomy�leli�my, �e zast�pimy ry��wk� czystym alkoholem.
        AI_Output (self, other ,"DIA_Rufus_Next_03_05"); //B�dziemy mieli przewag� nad przeciwnikami.
        AI_Output (self, other ,"DIA_Rufus_Next_03_06"); //Upici nie b�d� w stanie tak dobrze walczy�.
        AI_Output (other, self ,"DIA_Rufus_Next_15_07"); //Dobry pomys�! P�jd� do karczmy i postaram si� co� przynie��.
        AI_Output (self, other ,"DIA_Rufus_Next_03_08"); //Je�li chodzi o bro�, to id� do Swineya, do Wolnej Kopalni.
        AI_Output (self, other ,"DIA_Rufus_Next_03_09"); //To m�j bliski znajomy. Z pewno�ci� co� ci da.
        B_LogEntry                     (CH1_BuntZbieraczy,"Pora przygotowa� bro�. Mam przynie�� kilka mieczy od Swineya. Po alkohol mam uda� si� do karczmy.");
        DIA_Rufus_Nasi_OFF = true;
        If_BuyAlco_Jer = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Rufus_Next_03_10"); //Nie masz jeszcze �adnych informacji. Pogadaj ze zbieraczami.
        DIA_Rufus_Nasi_OFF = false;
    };
};
*/

/*
//========================================
//-----------------> HomerHelp
//========================================

INSTANCE DIA_Rufus_HomerHelp (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_HomerHelp_Condition;
   information  = DIA_Rufus_HomerHelp_Info;
   permanent	= FALSE;
   description	= "Homer nam pomo�e!";
};

FUNC INT DIA_Rufus_HomerHelp_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	&& (Homer_Rozpracowany == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HomerHelp_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HomerHelp_15_01"); //Homer nam pomo�e!
    AI_Output (other, self ,"DIA_Rufus_HomerHelp_15_02"); //Rozmawia�em z nim. Zdradzi�em mu te� nasz plan.
    AI_Output (self, other ,"DIA_Rufus_HomerHelp_03_03"); //Dobrze. Mamy kolejnego zbieracza po naszej stronie.
};
*/

//========================================
//-----------------> HomerPrzydupas
//========================================

INSTANCE DIA_Rufus_HomerPrzydupas (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_HomerPrzydupas_Condition;
   information  = DIA_Rufus_HomerPrzydupas_Info;
   permanent	= FALSE;
   description	= "Homer to przydupas Lewusa!";
};

FUNC INT DIA_Rufus_HomerPrzydupas_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_PopieraszBunt)) 
	//&& (Homer_Rozpracowany == true) nieu�ywane od 1.4.6
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HomerPrzydupas_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HomerPrzydupas_15_01"); //Homer darzy szacunkiem Ry�owego Ksi�cia. Lepiej mu o niczym nie m�wi�. 
    AI_Output (self, other ,"DIA_Rufus_HomerPrzydupas_03_02"); //W sumie nigdy nie ukrywa� swojej sympatii do niego. 
	
    //AI_Output (self, other ,"DIA_Rufus_HomerPrzydupas_03_05"); //We� t� nagrod�.
   // CreateInvItems (self, ItMiNugget, 15);
   // B_GiveInvItems (self, other, ItMiNugget, 15);
};

//========================================
//-----------------> HoracyMaWDupie
//========================================

INSTANCE DIA_Rufus_HoracyMaWDupie (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 3;
   condition    = DIA_Rufus_HoracyMaWDupie_Condition;
   information  = DIA_Rufus_HoracyMaWDupie_Info;
   permanent	= FALSE;
   description	= "Horacy nie popiera buntu.";
};

FUNC INT DIA_Rufus_HoracyMaWDupie_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Horatio_Bunt))
	    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HoracyMaWDupie_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HoracyMaWDupie_15_01"); //Horacy nie popiera buntu, ale nie b�dzie nam wchodzi� w drog�.
    AI_Output (self, other ,"DIA_Rufus_HoracyMaWDupie_03_02"); //To by�o do przewidzenia. Szkoda, bo jest pono� bardzo silny.
    //AI_Output (self, other ,"DIA_Rufus_HoracyMaWDupie_03_03"); //
};

//========================================
//-----------------> PockOszust
//========================================

INSTANCE DIA_Rufus_PockOszust (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 4;
   condition    = DIA_Rufus_PockOszust_Condition;
   information  = DIA_Rufus_PockOszust_Info;
   permanent	= FALSE;
   description	= "Pock jest konfidentem!";
};

FUNC INT DIA_Rufus_PockOszust_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Pock_BuntujeszSie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_PockOszust_Info()
{
    AI_Output (other, self ,"DIA_Rufus_PockOszust_15_01"); //Pock jest konfidentem! Donosi na innych zbieraczy. Do tego w�szy wok� twojej osoby. 
    AI_Output (self, other ,"DIA_Rufus_PockOszust_03_02"); //Musimy mie� si� na baczno�ci. Nie mo�e si� niczego dowiedzie�.
};

//========================================
//-----------------> ZbieraczeAll
//========================================

INSTANCE DIA_Rufus_ZbieraczeAll (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 5;
   condition    = DIA_Rufus_ZbieraczeAll_Condition;
   information  = DIA_Rufus_ZbieraczeAll_Info;
   permanent	= FALSE;
   description	= "Co do wi�kszo�ci zbieraczy...";
};

FUNC INT DIA_Rufus_ZbieraczeAll_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_Jestem))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_ZbieraczeAll_Info()
{
    AI_Output (other, self ,"DIA_Rufus_ZbieraczeAll_15_01"); //Co do wi�kszo�ci zbieraczy...
    AI_Output (self, other ,"DIA_Rufus_ZbieraczeAll_03_02"); //Ju� z nimi rozmawia�em. Wi�kszo�� jest po naszej stronie.
    AI_Output (self, other ,"DIA_Rufus_ZbieraczeAll_03_03"); //Ty porozmawiaj Horacym, Pockiem i Homerem. 
    AI_Output (other, self ,"DIA_Rufus_ZbieraczeAll_15_04"); //Dobrze.
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Rufus_HELLO6 (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 6;
   condition    = DIA_Rufus_HELLO6_Condition;
   information  = DIA_Rufus_HELLO6_Info;
   permanent	= FALSE;
   description	= "Co dalej?";
};

FUNC INT DIA_Rufus_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HomerPrzydupas))
    && (Npc_KnowsInfo (hero, DIA_Rufus_HoracyMaWDupie))
    && (Npc_KnowsInfo (hero, DIA_Rufus_PockOszust))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HELLO6_15_01"); //Co dalej?
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_02"); //Teraz potrzebujemy nieco broni i alkoholu.
    AI_Output (other, self ,"DIA_Rufus_HELLO6_15_03"); //Alkoholu?
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_04"); //Tak. Pomy�leli�my, �e zast�pimy ry��wk� czystym alkoholem.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_05"); //B�dziemy mieli przewag� nad przeciwnikami.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_06"); //Upici nie b�d� w stanie tak dobrze walczy�.
    AI_Output (other, self ,"DIA_Rufus_HELLO6_15_07"); //Dobry pomys�! P�jd� do karczmy i postaram si� co� przynie��.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_08"); //Je�li chodzi o bro�, id� do Swineya, do Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Rufus_HELLO6_03_09"); //To m�j bliski znajomy. Z pewno�ci� co� ci da.
	
    B_LogEntry        (CH1_BuntZbieraczy,"Po sprawdzeniu lojalno�ci wszystkich zbieraczy przysz�a kolej na zdobycie broni. Mam si� zg�osi� po dostaw� do Swineya z Wolnej Kopalni. Ponadto Rufus chce, abym zdoby� czysty alkohol od Jeremiasza.");
	If_BuyAlco_Jer = true;
};



//========================================
//-----------------> GivePaczki
//========================================

INSTANCE DIA_Rufus_GivePaczki (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_GivePaczki_Condition;
   information  = DIA_Rufus_GivePaczki_Info;
   permanent	= FALSE;
   description	= "Mam paczki z broni�.";
};

FUNC INT DIA_Rufus_GivePaczki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Swiney_Bron))
    && (Npc_HasItems (other, ItMi_PaczkaMiecze1) >=2) && (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6)) //1.24 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_GivePaczki_Info()
{
    AI_Output (other, self ,"DIA_Rufus_GivePaczki_15_01"); //Mam paczki z broni�.
    AI_Output (self, other ,"DIA_Rufus_GivePaczki_03_02"); //To �wietnie. Zaraz je rozdam naszym ludziom.
    B_GiveInvItems (other, self, ItMi_PaczkaMiecze1, 2);
};

//========================================
//-----------------> Vodka
//========================================

INSTANCE DIA_Rufus_Vodka (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_Vodka_Condition;
   information  = DIA_Rufus_Vodka_Info;
   permanent	= FALSE;
   description	= "Mam alkohol.";
};

FUNC INT DIA_Rufus_Vodka_Condition()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=12) && (Npc_KnowsInfo (hero, DIA_Rufus_HELLO6)) //1.24 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Vodka_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Vodka_15_01"); //Mam alkohol.
    AI_Output (self, other ,"DIA_Rufus_Vodka_03_02"); //�wietnie, ja w mi�dzyczasie opracowa�em plan.
    AI_Output (self, other ,"DIA_Rufus_Vodka_03_03"); //Musimy w jaki� spos�b podrzuci� ludziom Ksi�cia alkohol tak, aby my�leli �e to ry��wka.
	AI_Output (self, other ,"DIA_Rufus_Vodka_03_04"); //Homer, jeden z przydupas�w dostarcza alkohol od Jeremiasza na pola ry�owe.
	AI_Output (self, other ,"DIA_Rufus_Vodka_03_05"); //Z tego co wiem, robi to codziennie.
	AI_Output (self, other ,"DIA_Rufus_Vodka_03_06"); //Id� wieczorem na pola i powiedz ludziom Ksi�cia, �e przysy�a ci� Homer. Jestem pewien, �e na to p�jd�.
    AI_Output (other, self ,"DIA_Rufus_Vodka_15_07"); //Jasne. Ju� id�.
	//1.4
	  B_LogEntry                     (CH1_BuntZbieraczy,"Po zdobyciu alkoholu Rufus poprosi� mnie, bym rozni�s� czysty alkohol ludziom Ry�owego Ksi�cia. Mam m�wi�, �e przychodz� z polecenia Homera.");
};

//========================================
//-----------------> 1.4 chest
//========================================

INSTANCE DIA_Rufus_ChestFull (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_ChestFull_Condition;
   information  = DIA_Rufus_ChestFull_Info;
   permanent	= FALSE;
   description	= "Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.";
};

FUNC INT DIA_Rufus_ChestFull_Condition()
{
    if(Npc_KnowsInfo (hero, DIA_Rufus_Vodka)) && (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) && (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) && (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) && (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT)) //1.4
	//((Mob_HasItems	("SKRZYNIA_GRUBASA", ItMi_Alchemy_Alcohol_01)) == true)//1.24 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_ChestFull_Info()
{
    AI_Output (other, self ,"DIA_Rufus_ChestFull_15_01"); //Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_ChestFull_03_02"); //Doskonale! Czas wtajemniczy� ci� w dalsz� cz�� planu.
	//1.4
	  B_LogEntry                     (CH1_BuntZbieraczy,"Podarowanie alkoholu bandziorom to pestka. Jeste�my ju� prawie gotowi. Wkr�tce Rufus da mi kolejne instrukcje. ");
};

//========================================
//-----------------> ActionGoWhat
//========================================

INSTANCE DIA_Rufus_ActionGoWhat (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 3;
   condition    = DIA_Rufus_ActionGoWhat_Condition;
   information  = DIA_Rufus_ActionGoWhat_Info;
   permanent	= FALSE;
   description	= "Co teraz? Zaczynamy?";
};

FUNC INT DIA_Rufus_ActionGoWhat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_ChestFull)) //1.4 edited by g1210
    && (Npc_KnowsInfo (hero, DIA_Rufus_GivePaczki))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_ActionGoWhat_Info()
{
    AI_Output (other, self ,"DIA_Rufus_ActionGoWhat_15_01"); //Co teraz? Zaczynamy?
   // AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_02"); //Poczekaj. Nie tak pr�dko.
   // AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_03"); //Wy�l� najpierw kogo�, by podmieni� ry��wk� na nasz przysmak.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_04"); //Ty wkraczasz o p�nocy.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_05"); //Wchodzisz do magazynu, potem zabijasz wieprza i p�dzisz do nas.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_06"); //Tylko masz biec, do cholery.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_07"); //Nast�pnie razem wyka�czamy Lewusa i jego siepaczy.
    AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_08"); //Rankiem Najemnicy b�d� musieli znale�� kogo� na ich miejsce. He he.
	AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_09"); //Razem z moimi lud�mi b�d� si� kr�ci� w okolicy. A i jeszcze jedno! 
	AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_10"); //Uwa�aj na Najemnik�w ze stra�nicy. Gdy nas zobacz�, zaczn� strzela�. Po prostu si� wtedy wycofaj.
	AI_Output (self, other ,"DIA_Rufus_ActionGoWhat_03_11"); //W ciemno�ci na pewno nie rozpoznaj� twarzy. Nikt nie powinien ci� potem �ciga�.
	Npc_ExchangeRoutine (Bau_900_Ricelord,"bunt");
	Npc_ExchangeRoutine (BAU_928_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_916_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_923_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_907_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_904_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_903_rufus,"goto");
	BAU_903_rufus.flags = 2;
	Npc_ExchangeRoutine (BAU_902_pock,"goto");
	Npc_ExchangeRoutine (BAU_914_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_915_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_930_Bauer,"goto");
	Npc_ExchangeRoutine (BAU_919_Bauer,"goto");
	var C_NPC Ricelord	; Ricelord 	= Hlp_GetNpc (Bau_900_Ricelord	);
	Npc_ChangeAttribute	(Ricelord,	ATR_HITPOINTS,	275);
	
	var C_NPC Lewus	; Lewus 	= Hlp_GetNpc (ORG_844_Lefty	);
	Npc_ChangeAttribute	(Lewus,	ATR_HITPOINTS,	200);

	
	// dw�ch go�ci przy bramie to bd przyjaciele Lewusa, przybiegn� na pomoc DOPISA�
    B_LogEntry                     (CH1_BuntZbieraczy,"Dzi� w nocy zaczynamy. O p�nocy mam wej�� przez chat� do magazynu i pozby� si� Ry�owego Ksi�cia raz na zawsze. Potem pora na Lewusa. Podczas walki powinienem uwa�a� na �ucznik�w obsadzaj�cych g�rn� bram�. S� bardzo niebezpieczni. Najlepiej, je�li b�d� si� trzyma� blisko magazynu.");
};

//========================================
//-----------------> WINWONWON
//========================================

INSTANCE DIA_Rufus_WINWONWON (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_WINWONWON_Condition;
   information  = DIA_Rufus_WINWONWON_Info;
   permanent	= FALSE;
   description	= "Te sukinsyny nie �yj�!";
};

FUNC INT DIA_Rufus_WINWONWON_Condition()
{
    if (MIS_BuntZbieraczy == LOG_RUNNING)
    && (Npc_IsDead(Bau_900_Ricelord))
    && (Npc_IsDead(ORG_844_Lefty))
	&& (Npc_KnowsInfo (hero, DIA_Rufus_ActionGoWhat))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_WINWONWON_Info()
{
    AI_Output (other, self ,"DIA_Rufus_WINWONWON_15_01"); //Te sukinsyny nie �yj�!
    AI_Output (self, other ,"DIA_Rufus_WINWONWON_03_02"); //Masz racj�! Uda�o si� nam.
    AI_Output (self, other ,"DIA_Rufus_WINWONWON_03_03"); //Dobra robota, stary. Bez ciebie nie daliby�my rady.
    AI_Output (other, self ,"DIA_Rufus_WINWONWON_15_04"); //To zas�uga wsp�lnoty.
	
	BAU_903_rufus.flags = 0;
    B_LogEntry               (CH1_BuntZbieraczy,"Ry�owy Ksi���, Lewus i jego ludzie nie �yj�. Zbieracze nie b�d� ju� ciemi�eni. Wreszcie uda�o im si� wyswobodzi�...");
    Log_SetTopicStatus       (CH1_BuntZbieraczy, LOG_SUCCESS);
    MIS_BuntZbieraczy = LOG_SUCCESS;
	
	Npc_ExchangeRoutine (BAU_928_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_916_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_923_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_907_Bauer,"liba");
	Npc_ExchangeRoutine (BAU_904_Bauer,"liba");
	
	po_buncie = true;
    B_GiveXP (XP_BuntZbieraczy);
	
	if Lefty_Mission == LOG_RUNNING
	{
	Lefty_Mission = LOG_SUCCESS;
	B_LogEntry			(CH1_CarryWater,	"Lewus gryzie piach. Ju� nie b�dzie mi rozkazywa� nosi� za siebie wod�.");
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
	};
};