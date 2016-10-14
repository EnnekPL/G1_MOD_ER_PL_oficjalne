//poprawione i sprawdzone - Nocturn

// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Nic nie m�w.";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wygl�dasz mi na kogo�, kto chcia�by nosi� niewolnicze jarzmo nak�adane ludziom przez Magnat�w.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //My�l�, �e jeste� raczej poszukiwaczem - kim�, kto szuka prawdziwej wiary. Czy czujesz, jak ogie� trawi twoje cia�o podczas snu?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Widz�, �e pow�tpiewasz w rzeczy opowiadane ci przez s�ugus�w Magnat�w. Przecie� wiesz, dlaczego nie mo�na im ufa�, prawda? To k�amcy!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Ich �garstwa czyni� s�abych ludzi �lepcami. Ale tw�j duch jest silniejszy ni� ich k�amstwa!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Czy nie odczuwasz pragnienia wolno�ci ka�dego dnia? Nie czujesz, jak z ka�d� godzin� pragnienie to staje si� silniejsze? Pozw�l mu pokierowa� twoim duchem!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Czy wiesz, co robisz, pr�buj�c zag�uszy� w sobie ten g�os? Wyrzekasz si� swojej duszy, wyrzekasz si� samego siebie! Nie pozw�l, by strach tob� kierowa�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Uwolnij si�. Przejrzyj na oczy! �ni�cy zbudzi si� pewnego dnia, wyzwoli swoich poddanych i str�ci niewiernych w najczarniejsze czelu�ci piekie�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Znikn� z tego �wiata jak nieczysto�ci sp�ukane przez deszcz. B�d� b�aga� o lito��, ale wtedy b�dzie ju� dla nich za p�no.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Wtedy zap�ac� cen�. Zap�ac� j� w�asn� krwi�... I w�asnym �yciem.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Hej! Odezwa�e� si� do mnie. Czy to znaczy, �e mog� ju� z tob� rozmawia�?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Odezwa�e� si� do mnie. Czy to znaczy, �e mog� ju� z tob� rozmawia�?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Widz�, �e zaznajomi�e� si� ju� z naszymi zasadami. To dobrze.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Wyczuwam w tobie wielk� si�� ducha. Wkr�tce b�dziesz got�w, by do nas do��czy�.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Przem�wi�em do ciebie, bo chc� da� ci szans� udowodnienia swojej lojalno�ci.
};

// **************************************************
// 				Loyalit�t beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "W jaki spos�b mog� udowodni� swoj� lojalno��?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //W jaki spos�b mog� udowodni� swoj� lojalno��?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Przede wszystkim, potrzebujemy nowych dusz, kt�re zechc� przy��czy� si� do naszej spo�eczno�ci.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Je�li chcesz mnie przekona� o swojej przydatno�ci dla naszego Obozu, przyprowad� mi jeszcze jednego cz�owieka, kt�ry zechce zosta� cz�onkiem Bractwa.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Baal Tondral wys�a� mnie do Starego Obozu, gdzie mam zwerbowa� nowego cz�onka dla Bractwa. To chyba niez�a okazja, �eby zjedna� sobie jego sympati�!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "Gdzie mam szuka� nowych cz�onk�w Bractwa?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Gdzie mam szuka� nowych cz�onk�w Bractwa?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Na pocz�tek rozejrzyj si� w Starym Obozie. Wielu z tamtejszych ludzi ma ju� do�� terroru i k�amstw. Potrzebuj� tylko odrobiny wsparcia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //W Nowym Obozie raczej wiele nie zwojujesz. Mieszkaj� tam sami barbarzy�cy.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Dlaczego tak desperacko szukacie nowych cz�onk�w?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Dlaczego tak desperacko szukacie nowych cz�onk�w?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //�ni�cy przem�wi� do naszego mistrza, oznajmiaj�c, �e ma dla nas niezwykle wa�n� wiadomo��.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Ale nie zebra� jeszcze wszystkich si�. Dlatego potrzebuje NASZEJ si�y, by nawi�za� ostateczny kontakt.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Dlatego przygotowujemy si� do wielkiego przyzwania. Im wi�cej ludzi we�mie w nim udzia�, tym wi�ksze b�d� szanse powodzenia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Je�li chcesz dowiedzie� si� wi�cej na ten temat, id� na �wi�tynny dziedziniec. Tylko nie przeszkadzaj naszemu mistrzowi w medytacji!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Mistrzu, oto kto�, kto chcia�by ci� pozna�!";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Mistrzu, oto kto�, kto chcia�by ci� pozna�!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Kog� mi tu przyprowadzi�e�? Czy jest godzien?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //C�, bez twojego duchowego wsparcia zapewne si� nie ob�dzie, Mistrzu.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Dobrze. Od dzisiaj ten cz�owiek b�dzie moim uczniem.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ka�dego dnia b�dziesz przychodzi� do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt p�no.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Hei�t das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC l�sen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal l�schen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
		if (Npc_GetDistToNpc(self,Non_1500_Gilbert)<2000)
	{
	Non_1500_Gilbert.aivar[AIV_PARTYMEMBER] = FALSE;
	Non_1500_Gilbert.flags = 0;	// Immortal l�schen
	B_ExchangeRoutine	(Non_1500_Gilbert,"start");
	};
	dusty_bractwo = true;
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,	"Dusty zosta� uczniem Baal Tondrala. Moje zadanie sko�czone.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};
//========================================
//-----------------> SuccesHelpG
//========================================

INSTANCE DIA_BaalTondral_SuccesHelpG (C_INFO)
{
   npc          = Gur_1203_BaalTondral;
   nr           = 1;
   condition    = DIA_BaalTondral_SuccesHelpG_Condition;
   information  = DIA_BaalTondral_SuccesHelpG_Info;
   permanent	= FALSE;
   description	= "Mistrzu, przyprowadzi�em ci kogo�. ";
};

FUNC INT DIA_BaalTondral_SuccesHelpG_Condition()
{
    if (BaalTondral_GetNewGuy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2)) && (Npc_GetDistToNpc(self,Non_1500_Gilbert)<1000) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTondral_SuccesHelpG_Info()
{
    AI_Output (other, self ,"DIA_BaalTondral_SuccesHelpG_15_01"); //Mistrzu, przyprowadzi�em ci kogo�.
    AI_Output (self, other ,"DIA_BaalTondral_SuccesHelpG_03_02"); //�wietnie. Gdzie go znalaz�e�?
	AI_Output (other, self ,"DIA_BaalTondral_SuccesHelpG_15_03"); //Koczowa� w jaskini przy Starym Obozie.
    AI_Output (self, other ,"DIA_BaalTondral_SuccesHelpG_03_04"); //Dobra robota. Zajm� si� jego duchowym rozwojem.
	AI_TurnToNpc		(self, Non_1500_Gilbert);
	AI_TurnToNpc		(Non_1500_Gilbert,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_SuccesHelpG_03_05"); //Ka�dego dnia b�dziesz przychodzi� do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt p�no.
	Non_1500_Gilbert.aivar[AIV_PARTYMEMBER] = FALSE;
	Non_1500_Gilbert.flags = 0;	// Immortal l�schen
	Non_1500_Gilbert.guild = GIL_NOV;
	Npc_SetTrueGuild	(Non_1500_Gilbert, GIL_NOV);
	B_ExchangeRoutine	(Non_1500_Gilbert,"CAMP");
    B_LogEntry                     (CH1_RecruitDusty,"Przyprowadzi�em Gilberta do Baal Tondrala.");
    Log_SetTopicStatus       (CH1_RecruitDusty, LOG_SUCCESS);
    BaalTondral_GetNewGuy = LOG_SUCCESS;

    B_GiveXP (300);
	if (Npc_GetDistToNpc(self,Vlk_524_Dusty)<2000)
	{
	Vlk_524_Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Vlk_524_Dusty.flags = 0;	// Immortal l�schen
	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	B_LogEntry			(CH1_RecruitDusty,	"Dusty nie zosta� uczniem Baal Tondrala. Gilbert by� pierwszy.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_FAILED);
	};
    AI_StopProcessInfos	(self);
};


// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Mistrzu! Chcia�bym do��czy� do Bractwa.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistrzu! Chcia�bym do��czy� do Bractwa. Czy mog� liczy� na twoj� przychylno��?
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Udowodni�e�, �e jeste� cz�owiekiem prawym. Cor Kalom powinien ci� przyj��.

	B_LogEntry(CH1_JoinPsi,	"Baal Tondral uwa�a, �e jestem godzien za�o�y� szat� Nowicjusza!");
};

//========================================
//-----------------> GiveMeStaff
//========================================

INSTANCE DIA_BaalTondral_GiveMeStaff (C_INFO)
{
   npc          = Gur_1203_BaalTondral;
   nr           = 1;
   condition    = DIA_BaalTondral_GiveMeStaff_Condition;
   information  = DIA_BaalTondral_GiveMeStaff_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie mag Uturiel.";
};

FUNC INT DIA_BaalTondral_GiveMeStaff_Condition()
{
    if (Npc_KnowsInfo (hero, NON_3933_Uturiel_CRYSTAL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTondral_GiveMeStaff_Info()
{
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_15_01"); //Przysy�a mnie mag Uturiel.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_03_02"); //Czego ode mnie chcecie?
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_15_03"); //Masz pewn� rzecz, kt�ra ma teraz dla nas olbrzymie znaczenie. 
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_15_04"); //Chodzi o pewien kostur, kt�ry by� w twojej rodzinie od pokole�. Uturiel twierdzi, �e w broni nie ma osadzonego �adnego artefaktu...
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_03_05"); //Tak, to prawda. Kostur jest przez to niemal�e bezu�yteczny, wi�c na c� wam on? Tylko m�w szczerze.

    Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    Info_AddChoice		(DIA_BaalTondral_GiveMeStaff, "Chcemy sforsowa� Barier�.", DIA_BaalTondral_GiveMeStaff_Bariera);
    Info_AddChoice		(DIA_BaalTondral_GiveMeStaff, "Tworzymy wspania�� bro�.", DIA_BaalTondral_GiveMeStaff_Weapon);
    Info_AddChoice		(DIA_BaalTondral_GiveMeStaff, "Uturiel chce go zbada�.", DIA_BaalTondral_GiveMeStaff_Lab);
};

FUNC VOID DIA_BaalTondral_GiveMeStaff_Bariera()
{
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_01"); //Chcemy sforsowa� Barier�.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_02"); //Sforsowa� magiczn� Barier�. Ch�opcze, jeste� �wiadom tego co m�wisz? 
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_03"); //Mo�e wypali�e� zbyt du�o ziela?
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_04"); //Nie, m�wi� powa�nie. Uturiel ma plan jak wykorzysta� pewne kryszta�y do zrobienia wyrwy w Barierze.
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_05"); //Jednak potrzebuje czego�, w co m�g�by osadzi� te wyj�tkowe kamienie. 
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_06"); //Ten plan jest naprawd� szalony. Jednak ma pewnie szanse na powodzenie. 
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_07"); //Znam Uturiela. To rozs�dny cz�owiek, kt�ry nie da� sob� manipulowa� i opu�ci� Stary Ob�z.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_08"); //Zaufam wam, jednak zanim oddam ci kostur zrobisz co� na rzecz Obozu.
	AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_09"); //Czego tym razem potrzebujecie?
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_10"); //Kilku Nowicjuszy opu�ci�o Ob�z. Udali si� w kierunku klifu, by wznosi� mod�y do �ni�cego poza spo�eczno�ci�.
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_11"); //Takie niepos�usze�stwo i sprzeciwianie si� naukom Guru mog� szkodliwie wp�yn�� na pozosta�ych. 
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_12"); //Zajmij si� tym. Nak�o� ich do powrotu lub zabij, je�li nic nie wsk�rasz.
	
	B_LogEntry               (CH4_MagicalCrystals,"Powiedzia�em Baal Tondralowi o naszych planach. Zgodzi� si� odda� kostur, ale musz� zaj�� si� najpierw grup� Nowicjuszy, kt�rzy uciekli z Bractwa. Mam ich szuka� na klifie nad Obozem. Je�li nie uda mi si� nak�oni� do powrotu, to mam ich zabi�.");
	
    Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    AI_StopProcessInfos	(self);
	
		//--------- Op�tani nowicjusze---------
	Wld_InsertNpc				(NON_4001_MadNovize,"PSI_START");	
	Wld_InsertNpc				(NON_4002_MadNovize,"PSI_START");
	Wld_InsertNpc				(NON_4003_MadNovize,"PSI_START");	
	Wld_InsertNpc				(NON_4004_MadNovize,"PSI_START");
};

FUNC VOID DIA_BaalTondral_GiveMeStaff_Weapon()
{
	AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Weapon_15_01"); //Tworzymy wspania�� bro�.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Weapon_03_02"); //Wspania�� bro�? Przeciwko komu? Uturiel chce si� zem�ci� na pozosta�ych Magach? A mo�e chce walczy� tym kosturem z orkami?
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Weapon_03_03"); //Nie obchodzi mnie to! Nie przy�o�� do tego r�ki. Odejd�!
	
	//Log_SetTopicStatus	(CH4_MagicalCrystals,	LOG_FAILED);
	B_LogEntry          (CH4_MagicalCrystals,"Sk�ama�em Baal Tndrala. Nie odda mi kostura. Musz� wr�ci� i porozmawia� z Uturielem.");
	MIS_MagicalCrystals = LOG_FAILED;
	
	Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_BaalTondral_GiveMeStaff_Lab()
{
	AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Lab_15_01"); //Uturiel chce go zbada�.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Lab_03_02"); //Po co mia�by bada� bezwarto�ciowy kostur? 
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Lab_03_03"); //Jakby� nie by� oszustem to wiedzia�by�, �e kilka lat temu opowiedzia�em mu absolutnie wszystko na jego temat. Wyno� si�!
	
	//Log_SetTopicStatus	(CH4_MagicalCrystals,	LOG_FAILED);
	B_LogEntry          (CH4_MagicalCrystals,"Sk�ama�em Baal Tndrala. Nie odda mi kostura. Musz� wr�ci� i porozmawia� z Uturielem.");
	MIS_MagicalCrystals = LOG_FAILED;
	
	Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    AI_StopProcessInfos	(self);
	
};

/*------------------------------------------------------------------------
							MULTIKILL							
------------------------------------------------------------------------*/
//edit by Nocturn

instance  Gur_1203_BaalTondral_MULTIKILL (C_INFO)
{
	npc					= Gur_1203_BaalTondral;
	condition		= Gur_1203_BaalTondral_MULTIKILL_Condition;
	information		= Gur_1203_BaalTondral_MULTIKILL_Info;
	permanent		= 1;
	description		= "Co do Nowicjuszy..."; 
};

FUNC int  Gur_1203_BaalTondral_MULTIKILL_Condition()
{	
	if (MIS_MagicalCrystals == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_BaalTondral_GiveMeStaff))
	{
		return TRUE;
	};

};
FUNC void  Gur_1203_BaalTondral_MULTIKILL_Info()
{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_01"); //Co do Nowicjuszy...
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_02"); //Jakie� post�py? 
	if (TondralNovizesBack == false) && (Npc_IsDead(NON_4001_MadNovize)) && (Npc_IsDead(NON_4002_MadNovize)) && (Npc_IsDead(NON_4003_MadNovize)) && (Npc_IsDead(NON_4004_MadNovize)) 
	{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_03"); //Sprawiali k�opoty. Zabi�em ich. 
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_04"); //Skoro to by�o jedyne wyj�cie... Prosz�, we� ten kostur. Jednak...
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_05"); //Tak?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_06"); //Rozmawia�em z pozosta�ymi Guru o planie Uturiela. Je�li by wam si� nie uda�o, a wr�ci�by� z tego w jednym kawa�ku, to zwr�� mi kostur.
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_07"); //Uwa�asz, �e ten plan ma ma�e szanse na powodzenie?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_08"); //Tego nie wiem. Gdyby nie wysz�o, to wiesz gdzie mnie znale��. 
	
	B_LogEntry          (CH4_MagicalCrystals,"Zabi�em Nowicjuszy, kt�rzy uciekli z Obozu. Baal Tondral by� mi wdzi�czny i odda� kostur bez najmniejszego oporu. Zadziwi� mnie jednak jego pesymizm. Powiedzia�, �e je�liby nam si� nie uda�o, a ja bym prze�y�, to mam mu zwr�ci� jego pami�tk�.");
	Gur_1203_BaalTondral_MULTIKILL.permanent = 0;
	
	CreateInvItems (self, ItMi_Mod_TondralStaff, 1);
    B_GiveInvItems (self, other, ItMi_Mod_TondralStaff, 1);
	
	B_GiveXP (250);
	}
	else if (TondralNovizesBack == true)
	{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_09"); //Nam�wi�em ich do powrotu. Nie powinni ju� sprawia� k�opot�w. 
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_10"); //Zaskoczy�e� mnie. Nie spodziewa�em si�, �e wr�c�. Dopilnuj�, aby si� to ju� nie powt�rzy�o. 
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_11"); //Prosz�, we� ten kostur. Jednak...
	
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_05"); //Tak?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_06"); //Rozmawia�em z pozosta�ymi Guru o planie Uturiela. Je�li by wam si� nie uda�o, a wr�ci�by� z tego w jednym kawa�ku, to zwr�� mi kostur.
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_07"); //Uwa�asz, �e ten plan ma ma�e szanse na powodzenie?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_08"); //Tego nie wiem. Gdyby nie wysz�o, to wiesz gdzie mnie znale��. 
	
	B_LogEntry          (CH4_MagicalCrystals,"Sprowadzi�em Nowicjuszy, kt�rzy uciekli z Obozu. Baal Tondral by� mi wdzi�czny i odda� kostur bez najmniejszego oporu. Zadziwi� mnie jednak jego pesymizm. Powiedzia�, �e je�liby nam si� nie uda�o, a ja bym prze�y� to mam mu zwr�ci� jego pami�tk�.");
	Gur_1203_BaalTondral_MULTIKILL.permanent = 0;
	
	CreateInvItems (self, ItMi_Mod_TondralStaff, 1);
    B_GiveInvItems (self, other, ItMi_Mod_TondralStaff, 1);
	
	B_GiveXP (250);
	}
	else
	{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_12"); //Jeszcze nad tym pracuj�.
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_13"); //W porz�dku. Poczekamy.
	};

};

//========================================
//-----------------> ReturnStaff
//========================================

INSTANCE DIA_BaalTondral_ReturnStaff (C_INFO)
{
   npc          = Gur_1203_BaalTondral;
   nr           = 1;
   condition    = DIA_BaalTondral_ReturnStaff_Condition;
   information  = DIA_BaalTondral_ReturnStaff_Info;
   permanent	= FALSE;
   description	= "Zwracam ci tw�j kostur. ";
};

FUNC INT DIA_BaalTondral_ReturnStaff_Condition()
{
    if (Npc_HasItems (other, ItMi_Mod_TondralStaff) >=1)
    && (MIS_MagicalCrystals == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalTondral_ReturnStaff_Info()
{
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_01"); //Zwracam ci tw�j kostur. 
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_02"); //Czyli jednak si� nie uda�o.
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_03"); //Niestety.
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_04"); //Co z Uturielem?
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_05"); //Nie �yje. 
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_06"); //Jak to si� sta�o?
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_07"); //Zosta� ra�ony piorunem. Kryszta� nie wytrzyma� mocy jak� wpompowa�a w niego Bariera.
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_08"); //To naprawd� wielka strata. Coraz mniej zosta�o ludzi, kt�rzy nie dali na siebie narzuci� jarzma. 
    B_GiveInvItems (other, self, ItMi_Mod_TondralStaff, 1);
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_09"); //Dzi�kuj�, �e dotrzyma�e� obietnicy. 
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_10"); //Niech �ni�cy ma ci�... A zreszt�. Nie daj si� zabi�!
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

