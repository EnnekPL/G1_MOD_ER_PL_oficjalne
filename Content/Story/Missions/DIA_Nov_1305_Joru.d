// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "Czym si� tu zajmujesz?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Czym si� tu zajmujesz?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Przekazuj� m�dro�� �ni�cego naszym Nowicjuszom.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Sam jestem jeszcze Nowicjuszem, ale ju� wkr�tce zostan� Baalem - jednym z Guru.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Rozmawia�em nawet z Y'Berionem. To wielki Wybraniec. Powiedzia� mi, �e je�li b�d� pracowa� wystarczaj�co ci�ko, nied�ugo sam zostan� wielkim mistrzem.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Ale to jeszcze przysz�o��. Nie spieszy mi si�, rozumiesz? Zostan� mistrzem, gdy przyjdzie odpowiednia pora.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //Chwilowo jestem bardzo zadowolony z mojej pracy.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "Na czym polega twoja praca?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Na czym polega twoja praca?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Wraz z kolegami testuj� magiczne substancje opracowane przez Cor Kaloma w jego laboratorium.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Jego asystent przynosi nam co kilka dni co� nowego, a my to testujemy.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //To ziele otwiera twoj� dusz�. Po za�yciu odpowiedniej ilo�ci b�dziesz m�g� nawi�za� kontakt ze �ni�cym!
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "A tobie uda�o si� kiedy� stan�� przed obliczem �ni�cego?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //A tobie uda�o si� kiedy� stan�� przed obliczem �ni�cego?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Nie, jeszcze nie! Ale tylko dlatego, �e nie dostajemy wystarczaj�cej ilo�ci ziela.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom zawsze pyta nas o efekty, ale odnosz� wra�enie, �e wcale mu nie zale�y na moim zdaniu.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Je�li jego wynalazki dzia�aj� stymuluj�co, natychmiast trafiaj� do Guru...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Ale nied�ugo ja sam zostan� Guru. Wtedy otrzymam odpowiedni� porcj� ziela i b�d� m�g� osobi�cie wys�ucha� g�osu �ni�cego.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Chcia�bym do��czy� do waszego obozu. Mo�esz mi pom�c?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Chcia�bym do��czy� do waszego obozu. Mo�esz mi pom�c?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Chcesz do nas do��czy�! To �wietnie! Zaczekaj... Tak, chyba m�g�bym ci pom�c!
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Nie jestem jeszcze Guru, ale mam pewne wp�ywy w Bractwie.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Oczywi�cie musia�by� wy�wiadczy� mi drobn� przys�ug�. Rozmawia�e� ju� z Fortuno?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Nie."	,DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Tak."		,DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Zatem masz swoj� dzienn� racj�? Je�li mi j� oddasz, dobijemy targu.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Przemy�l� to sobie.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //W takim razie id� do niego i odbierz swoj� dzienn� racj�. Je�li dasz mi ca�e ziele, kt�re od niego otrzymasz, dobijemy targu.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Przemy�l� to sobie.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi, "Joru chce dosta� moj� dzienn� racj� ziela, kt�r� mog� dosta� od Fortuno.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "Mam ziele przy sobie. Mo�emy zawrze� uk�ad.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Mam ziele przy sobie. Mo�emy zawrze� uk�ad.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Dobrze. Zauwa�y�e� pewnie, �e �aden z Guru nie chce z tob� rozmawia�.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Mo�esz to zmieni�, sprawiaj�c na nich dobre wra�enie. Mog� ci powiedzie�, jak tego dokona�.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Mia� by� Mrok P�nocy a nie jaka� trawa! Przynie� mi to, o co ci� prosi�em, wtedy dobijemy targu!
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "Jak mog� przekona� do siebie Guru?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS) && ( Joru_JoinPsi == FALSE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Jak mog� przekona� do siebie Guru?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar wprowadza Nowicjuszy w tajniki magii.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Je�li chcesz zwr�ci� na siebie jego uwag�, pos�u� si� czarami.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Tylko nie potraktuj go od razu Uderzeniem Wiatru! U�pij kt�rego� z jego uczni�w, albo co� w tym stylu.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib to ten przy bramie. To jeden z najpot�niejszych ludzi w Obozie. Lester b�dzie m�g� ci jako� pom�c. Porozmawiaj z nim jak tylko mistrz oddali si� na chwil�.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Pozostali Guru s� mniej wymagaj�cy. Spr�buj si� im jako� przypodoba�, a raz-dwa - dostaniesz si� do Bractwa!
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Dzi�ki za rad�.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //W ko�cu umowa to umowa, nie?
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi, "Aby zwr�ci� na siebie uwag� Baal Cadara, mam rzuci� zakl�cie snu na jednego z jego uczni�w.");
		B_LogEntry	(CH1_JoinPsi, "Zapytam Lestera, w jaki spos�b zjedna� sobie sympati� Baal Namiba. Musz� to tylko zrobi�, gdy Guru nie b�dzie w pobli�u!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "Jak mog� opanowa� magi� �ni�cego?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE) && (Joru_Tips_Mage == FALSE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,	"Baal Cadar sprzedaje runy i magiczne zwoje.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Jak mog� opanowa� magi� �ni�cego?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar sprzedaje magiczne runy i zwoje z zakl�ciami, ale to dla ciebie niewielka pociecha, bo nie b�dzie chcia� z tob� rozmawia�.
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Mo�e inny Guru b�dzie m�g� ci pom�c.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Wei�t du, es ist ziemlich gut. Es �ffnet deinen Geist f�r die Worte des Schl�fers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit f�r eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.
// dopisek gothic1210: epicka opowie�� o paleniu ziela. ten typek chyba mia� zosta� baalem ;) 
*/ 


	
//========================================
//-----------------> ORE
//========================================

INSTANCE DIA_Joru_ORE (C_INFO)
{
   npc          = Nov_1305_Joru;
   nr           = 6;
   condition    = DIA_Joru_ORE_Condition;
   information  = DIA_Joru_ORE_Info;
   permanent	= FALSE;
   description	= "Przyszed�em po bry�ki Starkada.";
};

FUNC INT DIA_Joru_ORE_Condition()
{
    if (MIS_OszukanyHandlarz == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joru_ORE_Info()
{
    AI_Output (other, self ,"DIA_Joru_ORE_15_01"); //Przyszed�em po bry�ki Starkada. Masz u niego d�ug.
    AI_Output (self, other ,"DIA_Joru_ORE_03_02"); //A co je�eli ci ich nie oddam?
    AI_Output (other, self ,"DIA_Joru_ORE_15_03"); //Najpierw jad�e�, to teraz p�a�. A poza tym nie zgrywaj cwaniaka, bo zapoznasz si� z moim or�em.
    AI_Output (self, other ,"DIA_Joru_ORE_03_04"); //Hmm... Nie chc� burd. Guru bardzo tego nie lubi�. Oddaj� sw�j d�ug.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry     (CH1_OszukanyHandlarz,"Odzyska�em rud� od Joru. Chcia� stawia� op�r, ale w por� si� opami�ta�.");//fix 1210

    //B_GiveXP (50);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> RUNY_INFO
//========================================

INSTANCE DIA_Joru_RUNY_INFO (C_INFO)
{
   npc          = Nov_1305_Joru;
   nr           = 1;
   condition    = DIA_Joru_RUNY_INFO_Condition;
   information  = DIA_Joru_RUNY_INFO_Info;
   permanent	= FALSE;
   description	= "Poszukuj� kilku run magicznych. Wiesz sk�d mog� je wzi��?";
};

FUNC INT DIA_Joru_RUNY_INFO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drago_HELLO3))
    && (kapitel < 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joru_RUNY_INFO_Info()
{
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_15_01"); //Poszukuj� kilku run magicznych. Wiesz sk�d mog� je wzi��?
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_03_02"); // A po co ci one? Przecie� jeste� Magiem Ognia, nie macie w�asnych run?

    Info_ClearChoices		(DIA_Joru_RUNY_INFO);
    Info_AddChoice		(DIA_Joru_RUNY_INFO, "Potrzebuj� ich do bada�. ", DIA_Joru_RUNY_INFO_BADANIA);
    Info_AddChoice		(DIA_Joru_RUNY_INFO, "Jestem kolekcjonerem, zbieram runy z ka�dej dziedziny magii do swojej kolekcji. ", DIA_Joru_RUNY_INFO_KOLEKCJA);
};

FUNC VOID DIA_Joru_RUNY_INFO_BADANIA()
{
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_BADANIA_15_01"); //Potrzebuj� ich do bada�. 
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_BADANIA_03_02"); //Ach tak? To jak tak bardzo potrzebujesz run �ni�cego, to kup je od Baal Cadara, a mnie zostaw w spokoju. 
    Info_ClearChoices		(DIA_Joru_RUNY_INFO);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Joru_RUNY_INFO_KOLEKCJA()
{
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_KOLEKCJA_15_01"); //Jestem kolekcjonerem, zbieram runy z ka�dej dziedziny magii do swojej kolekcji. 
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_KOLEKCJA_03_02"); //No prosz�, prosz�. Rozumiem ci�, sam kiedy� by�em kolekcjonerem trofe�w my�liwskich. My�l�, �e mog� ci pom�c zdoby� run� Pirokinezy, jest to bardzo pot�ny czar nadany nam przez samego �ni�cego.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_KOLEKCJA_03_03"); //Baal Cadar trzyma jeden egzemplarz u siebie, mo�e jak z nim zagadasz sprzeda ci j� po ni�szej cenie.
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_KOLEKCJA_15_04"); //Dzi�ki za pomoc. 
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_KOLEKCJA_03_05"); //Wr�� jeszcze kiedy�, porozmawiamy sobie o naszych kolekcjach.
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_KOLEKCJA_15_06"); //Jasne.
    B_LogEntry                     (CH1_NEW_GOD,"Run� Pirokinezy znajd� w chacie Baal Cadara. ");

    B_GiveXP (50);
    Info_ClearChoices		(DIA_Joru_RUNY_INFO);
    AI_StopProcessInfos	(self);
};

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

INSTANCE DIA_Joru_ParvezInTroubles (C_INFO)
{
   npc          = Nov_1305_Joru;
   nr           = 6;
   condition    = DIA_Joru_ParvezInTroubles_Condition;
   information  = DIA_Joru_ParvezInTroubles_Info;
   permanent	= FALSE;
	important 	= TRUE;

};

FUNC INT DIA_Joru_ParvezInTroubles_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Joru_ParvezInTroubles_Info()
{
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_00"); //Zatrzymaj si�, Nowicjuszu!
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_01"); //O co chodzi? Przecie� ja nic...
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_02"); //Spokojnie, potrzebuj� jedynie twojej pomocy, w imi� naszej duchowej spo�eczno�ci rzecz jasna.
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_03"); //To chyba musi by� co� wa�nego.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_04"); //W rzeczy samej. Nasze Bractwo potrzebuje nowych wyznawc�w tak jak ziemia nasion by da� owocny plon.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_05"); //Dlatego wysy�amy naszych braci do innych oboz�w by g�osili potrzeb� oddania swej duszy w r�ce naszego pot�nego �ni�cego.
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_06"); //No wiec w czym problem?
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_07"); //Kto� przeszkadza jednemu z naszych w prowadzeniu swych nauk. Chodzi o Baala Parveza, otrzyma�em od niego list.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_08"); //Prosi, by przys�ano mu z Bractwa kogo�, kto pomo�e mu wykry� �r�d�o ostatnich nieprzyjemnych wydarze�.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_09"); //Pono� kto� niszczy jego �wi�te ksi�gi, podobnie jak i ca�� reszt� dobytku. Pojawiaj� si� nawet gro�by, a oprawcy domagaj� si� by opu�ci� Stary Ob�z. Parvez obawia si� o swoje �ycie. Czas mu pom�c.
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_10"); //Jak si� domy�lam ju� wybra�e� tego pomocnika...
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_11"); //Tak, jeste� tu nowy. Tacy ludzie maj� wielk� dociekliwo�� i warto to wykorzysta�. Oczywi�cie pr�cz zyskania przychylno�ci �ni�cego, mo�esz te� nieco dorobi�. 
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_12"); //Brzmi dobrze. Zatem udam si� do Baala Parveza.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_13"); //Niech �ni�cy ci� prowadzi.

	MIS_ParvezInTroubles = LOG_RUNNING;

   Log_CreateTopic			(CH1_ParvezInTroubles, LOG_MISSION);
   Log_SetTopicStatus	(CH1_ParvezInTroubles, LOG_RUNNING);
   B_LogEntry					(CH1_ParvezInTroubles, "Zaczepi� mnie Nowicjusz Joru i kaza� uda� si� do Starego Obozu na rozmow� z Baal Parvezem. Nowicjusz jest prze�ladowany i potrzebuje pomocy w pozbyciu si� oprawc�w.");
};