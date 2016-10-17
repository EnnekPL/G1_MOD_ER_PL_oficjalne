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
	description = "Czym siê tu zajmujesz?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Czym siê tu zajmujesz?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Przekazujê m¹droœæ Œni¹cego naszym Nowicjuszom.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Sam jestem jeszcze Nowicjuszem, ale ju¿ wkrótce zostanê Baalem - jednym z Guru.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Rozmawia³em nawet z Y'Berionem. To wielki Wybraniec. Powiedzia³ mi, ¿e jeœli bêdê pracowa³ wystarczaj¹co ciê¿ko, nied³ugo sam zostanê wielkim mistrzem.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Ale to jeszcze przysz³oœæ. Nie spieszy mi siê, rozumiesz? Zostanê mistrzem, gdy przyjdzie odpowiednia pora.
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
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Wraz z kolegami testujê magiczne substancje opracowane przez Cor Kaloma w jego laboratorium.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Jego asystent przynosi nam co kilka dni coœ nowego, a my to testujemy.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //To ziele otwiera twoj¹ duszê. Po za¿yciu odpowiedniej iloœci bêdziesz móg³ nawi¹zaæ kontakt ze Œni¹cym!
	
	if (MIS_KalomsNewWeed == LOG_RUNNING)
	{
	B_LogEntry          (CH2_KalomsNewWeed,"Podczas rozmowy z Joru dowiedzia³em siê, ¿e zajmuje siê on testowaniem magicznych substancji dla Guru.");
	};
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
	description = "A tobie uda³o siê kiedyœ stan¹æ przed obliczem Œni¹cego?";
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
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //A tobie uda³o siê kiedyœ stan¹æ przed obliczem Œni¹cego?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Nie, jeszcze nie! Ale tylko dlatego, ¿e nie dostajemy wystarczaj¹cej iloœci ziela.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom zawsze pyta nas o efekty, ale odnoszê wra¿enie, ¿e wcale mu nie zale¿y na moim zdaniu.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Jeœli jego wynalazki dzia³aj¹ stymuluj¹co, natychmiast trafiaj¹ do Guru...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Ale nied³ugo ja sam zostanê Guru. Wtedy otrzymam odpowiedni¹ porcjê ziela i bêdê móg³ osobiœcie wys³uchaæ g³osu Œni¹cego.
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
	description = "Chcia³bym do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?";
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
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Chcia³bym do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Chcesz do nas do³¹czyæ! To œwietnie! Zaczekaj... Tak, chyba móg³bym ci pomóc!
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Nie jestem jeszcze Guru, ale mam pewne wp³ywy w Bractwie.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Oczywiœcie musia³byœ wyœwiadczyæ mi drobn¹ przys³ugê. Rozmawia³eœ ju¿ z Fortuno?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Nie."	,DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Tak."		,DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Zatem masz swoj¹ dzienn¹ racjê? Jeœli mi j¹ oddasz, dobijemy targu.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Przemyœlê to sobie.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //W takim razie idŸ do niego i odbierz swoj¹ dzienn¹ racjê. Jeœli dasz mi ca³e ziele, które od niego otrzymasz, dobijemy targu.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Przemyœlê to sobie.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi, "Joru chce dostaæ moj¹ dzienn¹ racjê ziela, któr¹ mogê dostaæ od Fortuno.");
	
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
	description = "Mam ziele przy sobie. Mo¿emy zawrzeæ uk³ad.";
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
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Mam ziele przy sobie. Mo¿emy zawrzeæ uk³ad.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Dobrze. Zauwa¿y³eœ pewnie, ¿e ¿aden z Guru nie chce z tob¹ rozmawiaæ.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Mo¿esz to zmieniæ, sprawiaj¹c na nich dobre wra¿enie. Mogê ci powiedzieæ, jak tego dokonaæ.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Mia³ byæ Mrok Pó³nocy a nie jakaœ trawa! Przynieœ mi to, o co ciê prosi³em, wtedy dobijemy targu!
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
	description = "Jak mogê przekonaæ do siebie Guru?";
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
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Jak mogê przekonaæ do siebie Guru?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar wprowadza Nowicjuszy w tajniki magii.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Jeœli chcesz zwróciæ na siebie jego uwagê, pos³u¿ siê czarami.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Tylko nie potraktuj go od razu Uderzeniem Wiatru! Uœpij któregoœ z jego uczniów, albo coœ w tym stylu.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib to ten przy bramie. To jeden z najpotê¿niejszych ludzi w Obozie. Lester bêdzie móg³ ci jakoœ pomóc. Porozmawiaj z nim jak tylko mistrz oddali siê na chwilê.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Pozostali Guru s¹ mniej wymagaj¹cy. Spróbuj siê im jakoœ przypodobaæ, a raz-dwa - dostaniesz siê do Bractwa!
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Dziêki za radê.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //W koñcu umowa to umowa, nie?
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi, "Aby zwróciæ na siebie uwagê Baal Cadara, mam rzuciæ zaklêcie snu na jednego z jego uczniów.");
		B_LogEntry	(CH1_JoinPsi, "Zapytam Lestera, w jaki sposób zjednaæ sobie sympatiê Baal Namiba. Muszê to tylko zrobiæ, gdy Guru nie bêdzie w pobli¿u!");
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
	description = "Jak mogê opanowaæ magiê Œni¹cego?";
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
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Jak mogê opanowaæ magiê Œni¹cego?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar sprzedaje magiczne runy i zwoje z zaklêciami, ale to dla ciebie niewielka pociecha, bo nie bêdzie chcia³ z tob¹ rozmawiaæ.
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Mo¿e inny Guru bêdzie móg³ ci pomóc.
};

/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Weißt du, es ist ziemlich gut. Es öffnet deinen Geist für die Worte des Schläfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit für eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.
// dopisek gothic1210: epicka opowieœæ o paleniu ziela. ten typek chyba mia³ zostaæ baalem ;) 
*/ 

///////////////////////////////////////////////////////////////////////////////////////////
// Joru
// Rozdzia³ -
// Pozosta³e zadania
///////////////////////////////////////////////////////////////////////////////////////////
	
//========================================
//-----------------> WeedProposition
//========================================

INSTANCE DIA_Joru_WeedProposition (C_INFO)
{
   npc          = Nov_1305_Joru;
   nr           = 6;
   condition    = DIA_Joru_WeedProposition_Condition;
   information  = DIA_Joru_WeedProposition_Info;
   permanent	= FALSE;
   description	= "A wiêc to ty masz dostêp do receptury Kaloma.";
};

FUNC INT DIA_Joru_WeedProposition_Condition()
{
    if (MIS_KalomsNewWeed == LOG_RUNNING) && (Npc_KnowsInfo (hero,DIA_Joru_Tester))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joru_WeedProposition_Info()
{
    AI_Output (other, self ,"DIA_Joru_WeedProposition_15_01"); //A wiêc to ty masz dostêp do receptury Kaloma.
    AI_Output (self, other ,"DIA_Joru_WeedProposition_03_02"); //O czym ty mówisz?
    AI_Output (other, self ,"DIA_Joru_WeedProposition_15_03"); //Jesteœ testerem magicznych substancji. S³ysza³em, ¿e masz dostêp do najnowszego przepisu Cor Kaloma.
    AI_Output (self, other ,"DIA_Joru_WeedProposition_03_04"); //Nie mam zamiaru z tob¹ wspó³pracowaæ. Chcê zostaæ Guru, nie bêdê wchodzi³ z tob¹ w ciemne interesy!
	AI_Output (other, self ,"DIA_Joru_WeedProposition_15_05"); //Zaoferujê dobr¹ cenê.
	AI_Output (self, other ,"DIA_Joru_WeedProposition_03_06"); //Ommmm...
   
	B_LogEntry          (CH2_KalomsNewWeed,"Joru nie jest sk³onny do wspó³pracy. Bêdê go musia³ jakoœ przekonaæ.");
	 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SecretBook
//========================================

INSTANCE DIA_Joru_SecretBook (C_INFO)
{
   npc          = Nov_1305_Joru;
   nr           = 6;
   condition    = DIA_Joru_SecretBook_Condition;
   information  = DIA_Joru_SecretBook_Info;
   permanent	= FALSE;
   description	= "Mam tu coœ twojego.";
};

FUNC INT DIA_Joru_SecretBook_Condition()
{
    if (MIS_KalomsNewWeed == LOG_RUNNING) && (Npc_HasItems (hero,ItMis_JoruSecretBook) >= 1) && (Npc_HasItems (hero,ItMis_JoruKey) >= 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joru_SecretBook_Info()
{
    AI_Output (other, self ,"DIA_Joru_SecretBook_15_01"); //Mam tu coœ twojego.
    AI_Output (self, other ,"DIA_Joru_SecretBook_03_02"); //Co? Jak wszed³eœ w posiadanie mojego notatnika?!
    AI_Output (other, self ,"DIA_Joru_SecretBook_15_03"); //To bez znaczenia. Chcê ubiæ z tob¹ interes. Notatnik wraz z kluczem do skrzyni, w zamian za przepis.
	AI_Output (other, self ,"DIA_Joru_SecretBook_15_04"); //Przecie¿ ju¿ nie raz tak robi³eœ.
    AI_Output (self, other ,"DIA_Joru_SecretBook_03_05"); //Wiem, ale obawiam siê, ¿e Cor Kalom zacznie coœ podejrzewaæ. Nie mogê straciæ mojej funkcji. To jedyna przepustka do zostania Guru.
	AI_Output (other, self ,"DIA_Joru_SecretBook_15_06"); //Nie narobiê ci k³opotów, tylko daj mi ten przepis. Nikt siê nie dowie sk¹d go mam.
	AI_Output (self, other ,"DIA_Joru_SecretBook_03_07"); //Có¿, chyba nie mam innego wyboru. 
	AI_Output (other, self ,"DIA_Joru_SecretBook_15_08"); //Wszystko bêdzie w porz¹dku.
	AI_Output (self, other ,"DIA_Joru_SecretBook_03_09"); //Trzymam ciê za s³owo.
	
	B_GiveInvItems (hero, self, ItMis_JoruSecretBook,1);
	B_GiveInvItems (hero, self, ItMis_JoruKey,1);
	
	B_GiveInvItems (self, hero, ItMis_RecipeSlepperBreath,1);
   
	B_LogEntry          (CH2_KalomsNewWeed,"Joru zgodzi³ siê wymieniæ swój notatnik i klucz do skrzyni w zamian za przepis. Mogê wróciæ ju¿ ze œwistkiem do Briama.");
	 
    AI_StopProcessInfos	(self);
};

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
   description	= "Przyszed³em po bry³ki Starkada.";
};

FUNC INT DIA_Joru_ORE_Condition()
{
    if (MIS_CheatedMerchant == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Joru_ORE_Info()
{
    AI_Output (other, self ,"DIA_Joru_ORE_15_01"); //Przyszed³em po bry³ki Starkada. Masz u niego d³ug.
    AI_Output (self, other ,"DIA_Joru_ORE_03_02"); //A co je¿eli ci ich nie oddam?
    AI_Output (other, self ,"DIA_Joru_ORE_15_03"); //Najpierw jad³eœ, to teraz p³aæ. A poza tym nie zgrywaj cwaniaka, bo zapoznasz siê z moim orê¿em.
    AI_Output (self, other ,"DIA_Joru_ORE_03_04"); //Hmm... Nie chcê burd. Guru bardzo tego nie lubi¹. Oddajê swój d³ug.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry     (CH1_CheatedMerchant,"Odzyska³em rudê od Joru. Chcia³ stawiaæ opór, ale w porê siê opamiêta³.");//fix 1210

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
   description	= "Poszukujê kilku run magicznych. Wiesz sk¹d mogê je wzi¹æ?";
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
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_15_01"); //Poszukujê kilku run magicznych. Wiesz sk¹d mogê je wzi¹æ?
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_03_02"); // A po co ci one? Przecie¿ jesteœ Magiem Ognia, nie macie w³asnych run?

    Info_ClearChoices		(DIA_Joru_RUNY_INFO);
    Info_AddChoice		(DIA_Joru_RUNY_INFO, "Potrzebujê ich do badañ. ", DIA_Joru_RUNY_INFO_BADANIA);
    Info_AddChoice		(DIA_Joru_RUNY_INFO, "Jestem kolekcjonerem, zbieram runy z ka¿dej dziedziny magii do swojej kolekcji. ", DIA_Joru_RUNY_INFO_KOLEKCJA);
};

FUNC VOID DIA_Joru_RUNY_INFO_BADANIA()
{
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_BADANIA_15_01"); //Potrzebujê ich do badañ. 
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_BADANIA_03_02"); //Ach tak? To jak tak bardzo potrzebujesz run Œni¹cego, to kup je od Baal Cadara, a mnie zostaw w spokoju. 
    Info_ClearChoices		(DIA_Joru_RUNY_INFO);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Joru_RUNY_INFO_KOLEKCJA()
{
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_KOLEKCJA_15_01"); //Jestem kolekcjonerem, zbieram runy z ka¿dej dziedziny magii do swojej kolekcji. 
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_KOLEKCJA_03_02"); //No proszê, proszê. Rozumiem ciê, sam kiedyœ by³em kolekcjonerem trofeów myœliwskich. Myœlê, ¿e mogê ci pomóc zdobyæ runê Pirokinezy, jest to bardzo potê¿ny czar nadany nam przez samego Œni¹cego.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_KOLEKCJA_03_03"); //Baal Cadar trzyma jeden egzemplarz u siebie, mo¿e jak z nim zagadasz sprzeda ci j¹ po ni¿szej cenie.
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_KOLEKCJA_15_04"); //Dziêki za pomoc. 
    AI_Output (self, other ,"DIA_Joru_RUNY_INFO_KOLEKCJA_03_05"); //Wróæ jeszcze kiedyœ, porozmawiamy sobie o naszych kolekcjach.
    AI_Output (other, self ,"DIA_Joru_RUNY_INFO_KOLEKCJA_15_06"); //Jasne.
    B_LogEntry                     (CH2_New_God,"Runê Pirokinezy znajdê w chacie Baal Cadara. ");

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
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_00"); //Zatrzymaj siê, Nowicjuszu!
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_01"); //O co chodzi? Przecie¿ ja nic...
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_02"); //Spokojnie, potrzebujê jedynie twojej pomocy, w imiê naszej duchowej spo³ecznoœci rzecz jasna.
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_03"); //To chyba musi byæ coœ wa¿nego.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_04"); //W rzeczy samej. Nasze Bractwo potrzebuje nowych wyznawców, tak jak ziemia nasion by daæ owocny plon.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_05"); //Dlatego wysy³amy naszych braci do innych obozów by g³osili potrzebê oddania swej duszy w rêce potê¿nego Œni¹cego.
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_06"); //No wiec w czym problem?
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_07"); //Ktoœ przeszkadza jednemu z naszych w prowadzeniu swych nauk. Chodzi o Baala Parveza, otrzyma³em od niego list.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_08"); //Prosi, by przys³ano mu z Bractwa kogoœ, kto pomo¿e mu wykryæ Ÿród³o ostatnich nieprzyjemnych wydarzeñ.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_09"); //Ponoæ ktoœ niszczy jego œwiête ksiêgi, podobnie jak i ca³¹ resztê dobytku. Pojawiaj¹ siê nawet groŸby, a oprawcy domagaj¹ siê by opuœci³ Stary Obóz. Parvez obawia siê o swoje ¿ycie. Czas mu pomóc.
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_10"); //Jak siê domyœlam ju¿ wybra³eœ tego pomocnika...
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_11"); //Tak, jesteœ tu nowy. Tacy ludzie maj¹ wielk¹ dociekliwoœæ i warto to wykorzystaæ. Oczywiœcie prócz zyskania przychylnoœci Œni¹cego, mo¿esz te¿ nieco dorobiæ. 
	AI_Output(other, self, "DIA_Joru_ParvezInTroubles_15_12"); //Brzmi dobrze. Zatem udam siê do Baala Parveza.
	AI_Output(self, other, "DIA_Joru_ParvezInTroubles_03_13"); //Niech Œni¹cy ciê prowadzi.

	MIS_ParvezInTroubles = LOG_RUNNING;

   Log_CreateTopic			(CH1_ParvezInTroubles, LOG_MISSION);
   Log_SetTopicStatus		(CH1_ParvezInTroubles, LOG_RUNNING);
   B_LogEntry				(CH1_ParvezInTroubles, "Zaczepi³ mnie Nowicjusz Joru i kaza³ udaæ siê do Starego Obozu na rozmowê z Baal Parvezem. Nowicjusz jest przeœladowany i potrzebuje pomocy w pozbyciu siê oprawców.");
};