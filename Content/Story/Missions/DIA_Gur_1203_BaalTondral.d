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
	description = "Nic nie mów.";
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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wygl¹dasz mi na kogoœ, kto chcia³by nosiæ niewolnicze jarzmo nak³adane ludziom przez Magnatów.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Myœlê, ¿e jesteœ raczej poszukiwaczem - kimœ, kto szuka prawdziwej wiary. Czy czujesz, jak ogieñ trawi twoje cia³o podczas snu?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Widzê, ¿e pow¹tpiewasz w rzeczy opowiadane ci przez s³ugusów Magnatów. Przecie¿ wiesz, dlaczego nie mo¿na im ufaæ, prawda? To k³amcy!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Ich ³garstwa czyni¹ s³abych ludzi œlepcami. Ale twój duch jest silniejszy ni¿ ich k³amstwa!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Czy nie odczuwasz pragnienia wolnoœci ka¿dego dnia? Nie czujesz, jak z ka¿d¹ godzin¹ pragnienie to staje siê silniejsze? Pozwól mu pokierowaæ twoim duchem!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Czy wiesz, co robisz, próbuj¹c zag³uszyæ w sobie ten g³os? Wyrzekasz siê swojej duszy, wyrzekasz siê samego siebie! Nie pozwól, by strach tob¹ kierowa³.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Uwolnij siê. Przejrzyj na oczy! Œni¹cy zbudzi siê pewnego dnia, wyzwoli swoich poddanych i str¹ci niewiernych w najczarniejsze czeluœci piekie³.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Znikn¹ z tego œwiata jak nieczystoœci sp³ukane przez deszcz. Bêd¹ b³agaæ o litoœæ, ale wtedy bêdzie ju¿ dla nich za póŸno.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Wtedy zap³ac¹ cenê. Zap³ac¹ j¹ w³asn¹ krwi¹... I w³asnym ¿yciem.
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
	description = "Hej! Odezwa³eœ siê do mnie. Czy to znaczy, ¿e mogê ju¿ z tob¹ rozmawiaæ?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Odezwa³eœ siê do mnie. Czy to znaczy, ¿e mogê ju¿ z tob¹ rozmawiaæ?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Widzê, ¿e zaznajomi³eœ siê ju¿ z naszymi zasadami. To dobrze.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Wyczuwam w tobie wielk¹ si³ê ducha. Wkrótce bêdziesz gotów, by do nas do³¹czyæ.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Przemówi³em do ciebie, bo chcê daæ ci szansê udowodnienia swojej lojalnoœci.
};

// **************************************************
// 				Loyalität beweisen
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
	description = "W jaki sposób mogê udowodniæ swoj¹ lojalnoœæ?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //W jaki sposób mogê udowodniæ swoj¹ lojalnoœæ?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Przede wszystkim, potrzebujemy nowych dusz, które zechc¹ przy³¹czyæ siê do naszej spo³ecznoœci.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Jeœli chcesz mnie przekonaæ o swojej przydatnoœci dla naszego Obozu, przyprowadŸ mi jeszcze jednego cz³owieka, który zechce zostaæ cz³onkiem Bractwa.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Baal Tondral wys³a³ mnie do Starego Obozu, gdzie mam zwerbowaæ nowego cz³onka dla Bractwa. To chyba niez³a okazja, ¿eby zjednaæ sobie jego sympatiê!");

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
	description = "Gdzie mam szukaæ nowych cz³onków Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Gdzie mam szukaæ nowych cz³onków Bractwa?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Na pocz¹tek rozejrzyj siê w Starym Obozie. Wielu z tamtejszych ludzi ma ju¿ doœæ terroru i k³amstw. Potrzebuj¹ tylko odrobiny wsparcia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //W Nowym Obozie raczej wiele nie zwojujesz. Mieszkaj¹ tam sami barbarzyñcy.
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
	description = "Dlaczego tak desperacko szukacie nowych cz³onków?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Dlaczego tak desperacko szukacie nowych cz³onków?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Œni¹cy przemówi³ do naszego mistrza, oznajmiaj¹c, ¿e ma dla nas niezwykle wa¿n¹ wiadomoœæ.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Ale nie zebra³ jeszcze wszystkich si³. Dlatego potrzebuje NASZEJ si³y, by nawi¹zaæ ostateczny kontakt.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Dlatego przygotowujemy siê do wielkiego przyzwania. Im wiêcej ludzi weŸmie w nim udzia³, tym wiêksze bêd¹ szanse powodzenia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Jeœli chcesz dowiedzieæ siê wiêcej na ten temat, idŸ na œwi¹tynny dziedziniec. Tylko nie przeszkadzaj naszemu mistrzowi w medytacji!
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
	description = "Mistrzu, oto ktoœ, kto chcia³by ciê poznaæ!";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Mistrzu, oto ktoœ, kto chcia³by ciê poznaæ!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Kogó¿ mi tu przyprowadzi³eœ? Czy jest godzien?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Có¿, bez twojego duchowego wsparcia zapewne siê nie obêdzie, Mistrzu.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Dobrze. Od dzisiaj ten cz³owiek bêdzie moim uczniem.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ka¿dego dnia bêdziesz przychodzi³ do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt póŸno.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
		if (Npc_GetDistToNpc(self,Non_1500_Gilbert)<2000)
	{
	Non_1500_Gilbert.aivar[AIV_PARTYMEMBER] = FALSE;
	Non_1500_Gilbert.flags = 0;	// Immortal löschen
	B_ExchangeRoutine	(Non_1500_Gilbert,"start");
	};
	dusty_bractwo = true;
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,	"Dusty zosta³ uczniem Baal Tondrala. Moje zadanie skoñczone.");
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
   description	= "Mistrzu, przyprowadzi³em ci kogoœ. ";
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
    AI_Output (other, self ,"DIA_BaalTondral_SuccesHelpG_15_01"); //Mistrzu, przyprowadzi³em ci kogoœ.
    AI_Output (self, other ,"DIA_BaalTondral_SuccesHelpG_03_02"); //Œwietnie. Gdzie go znalaz³eœ?
	AI_Output (other, self ,"DIA_BaalTondral_SuccesHelpG_15_03"); //Koczowa³ w jaskini przy Starym Obozie.
    AI_Output (self, other ,"DIA_BaalTondral_SuccesHelpG_03_04"); //Dobra robota. Zajmê siê jego duchowym rozwojem.
	AI_TurnToNpc		(self, Non_1500_Gilbert);
	AI_TurnToNpc		(Non_1500_Gilbert,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_SuccesHelpG_03_05"); //Ka¿dego dnia bêdziesz przychodzi³ do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt póŸno.
	Non_1500_Gilbert.aivar[AIV_PARTYMEMBER] = FALSE;
	Non_1500_Gilbert.flags = 0;	// Immortal löschen
	Non_1500_Gilbert.guild = GIL_NOV;
	Npc_SetTrueGuild	(Non_1500_Gilbert, GIL_NOV);
	B_ExchangeRoutine	(Non_1500_Gilbert,"CAMP");
    B_LogEntry                     (CH1_RecruitDusty,"Przyprowadzi³em Gilberta do Baal Tondrala.");
    Log_SetTopicStatus       (CH1_RecruitDusty, LOG_SUCCESS);
    BaalTondral_GetNewGuy = LOG_SUCCESS;

    B_GiveXP (300);
	if (Npc_GetDistToNpc(self,Vlk_524_Dusty)<2000)
	{
	Vlk_524_Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Vlk_524_Dusty.flags = 0;	// Immortal löschen
	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	B_LogEntry			(CH1_RecruitDusty,	"Dusty nie zosta³ uczniem Baal Tondrala. Gilbert by³ pierwszy.");
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
	description = "Mistrzu! Chcia³bym do³¹czyæ do Bractwa.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistrzu! Chcia³bym do³¹czyæ do Bractwa. Czy mogê liczyæ na twoj¹ przychylnoœæ?
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Udowodni³eœ, ¿e jesteœ cz³owiekiem prawym. Cor Kalom powinien ciê przyj¹æ.

	B_LogEntry(CH1_JoinPsi,	"Baal Tondral uwa¿a, ¿e jestem godzien za³o¿yæ szatê Nowicjusza!");
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
   description	= "Przysy³a mnie mag Uturiel.";
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
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_15_01"); //Przysy³a mnie mag Uturiel.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_03_02"); //Czego ode mnie chcecie?
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_15_03"); //Masz pewn¹ rzecz, która ma teraz dla nas olbrzymie znaczenie. 
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_15_04"); //Chodzi o pewien kostur, który by³ w twojej rodzinie od pokoleñ. Uturiel twierdzi, ¿e w broni nie ma osadzonego ¿adnego artefaktu...
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_03_05"); //Tak, to prawda. Kostur jest przez to niemal¿e bezu¿yteczny, wiêc na có¿ wam on? Tylko mów szczerze.

    Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    Info_AddChoice		(DIA_BaalTondral_GiveMeStaff, "Chcemy sforsowaæ Barierê.", DIA_BaalTondral_GiveMeStaff_Bariera);
    Info_AddChoice		(DIA_BaalTondral_GiveMeStaff, "Tworzymy wspania³¹ broñ.", DIA_BaalTondral_GiveMeStaff_Weapon);
    Info_AddChoice		(DIA_BaalTondral_GiveMeStaff, "Uturiel chce go zbadaæ.", DIA_BaalTondral_GiveMeStaff_Lab);
};

FUNC VOID DIA_BaalTondral_GiveMeStaff_Bariera()
{
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_01"); //Chcemy sforsowaæ Barierê.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_02"); //Sforsowaæ magiczn¹ Barierê. Ch³opcze, jesteœ œwiadom tego co mówisz? 
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_03"); //Mo¿e wypali³eœ zbyt du¿o ziela?
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_04"); //Nie, mówiê powa¿nie. Uturiel ma plan jak wykorzystaæ pewne kryszta³y do zrobienia wyrwy w Barierze.
    AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_05"); //Jednak potrzebuje czegoœ, w co móg³by osadziæ te wyj¹tkowe kamienie. 
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_06"); //Ten plan jest naprawdê szalony. Jednak ma pewnie szanse na powodzenie. 
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_07"); //Znam Uturiela. To rozs¹dny cz³owiek, który nie da³ sob¹ manipulowaæ i opuœci³ Stary Obóz.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_08"); //Zaufam wam, jednak zanim oddam ci kostur zrobisz coœ na rzecz Obozu.
	AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Bariera_15_09"); //Czego tym razem potrzebujecie?
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_10"); //Kilku Nowicjuszy opuœci³o Obóz. Udali siê w kierunku klifu, by wznosiæ mod³y do Œni¹cego poza spo³ecznoœci¹.
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_11"); //Takie niepos³uszeñstwo i sprzeciwianie siê naukom Guru mog¹ szkodliwie wp³yn¹æ na pozosta³ych. 
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Bariera_03_12"); //Zajmij siê tym. Nak³oñ ich do powrotu lub zabij, jeœli nic nie wskórasz.
	
	B_LogEntry               (CH4_MagicalCrystals,"Powiedzia³em Baal Tondralowi o naszych planach. Zgodzi³ siê oddaæ kostur, ale muszê zaj¹æ siê najpierw grup¹ Nowicjuszy, którzy uciekli z Bractwa. Mam ich szukaæ na klifie nad Obozem. Jeœli nie uda mi siê nak³oniæ do powrotu, to mam ich zabiæ.");
	
    Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    AI_StopProcessInfos	(self);
	
		//--------- Opêtani nowicjusze---------
	Wld_InsertNpc				(NON_4001_MadNovize,"PSI_START");	
	Wld_InsertNpc				(NON_4002_MadNovize,"PSI_START");
	Wld_InsertNpc				(NON_4003_MadNovize,"PSI_START");	
	Wld_InsertNpc				(NON_4004_MadNovize,"PSI_START");
};

FUNC VOID DIA_BaalTondral_GiveMeStaff_Weapon()
{
	AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Weapon_15_01"); //Tworzymy wspania³¹ broñ.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Weapon_03_02"); //Wspania³¹ broñ? Przeciwko komu? Uturiel chce siê zemœciæ na pozosta³ych Magach? A mo¿e chce walczyæ tym kosturem z orkami?
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Weapon_03_03"); //Nie obchodzi mnie to! Nie przy³o¿ê do tego rêki. OdejdŸ!
	
	//Log_SetTopicStatus	(CH4_MagicalCrystals,	LOG_FAILED);
	B_LogEntry          (CH4_MagicalCrystals,"Sk³ama³em Baal Tndrala. Nie odda mi kostura. Muszê wróciæ i porozmawiaæ z Uturielem.");
	MIS_MagicalCrystals = LOG_FAILED;
	
	Info_ClearChoices		(DIA_BaalTondral_GiveMeStaff);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_BaalTondral_GiveMeStaff_Lab()
{
	AI_Output (other, self ,"DIA_BaalTondral_GiveMeStaff_Lab_15_01"); //Uturiel chce go zbadaæ.
    AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Lab_03_02"); //Po co mia³by badaæ bezwartoœciowy kostur? 
	AI_Output (self, other ,"DIA_BaalTondral_GiveMeStaff_Lab_03_03"); //Jakbyœ nie by³ oszustem to wiedzia³byœ, ¿e kilka lat temu opowiedzia³em mu absolutnie wszystko na jego temat. Wynoœ siê!
	
	//Log_SetTopicStatus	(CH4_MagicalCrystals,	LOG_FAILED);
	B_LogEntry          (CH4_MagicalCrystals,"Sk³ama³em Baal Tndrala. Nie odda mi kostura. Muszê wróciæ i porozmawiaæ z Uturielem.");
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
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_02"); //Jakieœ postêpy? 
	if (TondralNovizesBack == false) && (Npc_IsDead(NON_4001_MadNovize)) && (Npc_IsDead(NON_4002_MadNovize)) && (Npc_IsDead(NON_4003_MadNovize)) && (Npc_IsDead(NON_4004_MadNovize)) 
	{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_03"); //Sprawiali k³opoty. Zabi³em ich. 
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_04"); //Skoro to by³o jedyne wyjœcie... Proszê, weŸ ten kostur. Jednak...
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_05"); //Tak?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_06"); //Rozmawia³em z pozosta³ymi Guru o planie Uturiela. Jeœli by wam siê nie uda³o, a wróci³byœ z tego w jednym kawa³ku, to zwróæ mi kostur.
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_07"); //Uwa¿asz, ¿e ten plan ma ma³e szanse na powodzenie?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_08"); //Tego nie wiem. Gdyby nie wysz³o, to wiesz gdzie mnie znaleŸæ. 
	
	B_LogEntry          (CH4_MagicalCrystals,"Zabi³em Nowicjuszy, którzy uciekli z Obozu. Baal Tondral by³ mi wdziêczny i odda³ kostur bez najmniejszego oporu. Zadziwi³ mnie jednak jego pesymizm. Powiedzia³, ¿e jeœliby nam siê nie uda³o, a ja bym prze¿y³, to mam mu zwróciæ jego pami¹tkê.");
	Gur_1203_BaalTondral_MULTIKILL.permanent = 0;
	
	CreateInvItems (self, ItMi_Mod_TondralStaff, 1);
    B_GiveInvItems (self, other, ItMi_Mod_TondralStaff, 1);
	
	B_GiveXP (250);
	}
	else if (TondralNovizesBack == true)
	{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_09"); //Namówi³em ich do powrotu. Nie powinni ju¿ sprawiaæ k³opotów. 
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_10"); //Zaskoczy³eœ mnie. Nie spodziewa³em siê, ¿e wróc¹. Dopilnujê, aby siê to ju¿ nie powtórzy³o. 
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_11"); //Proszê, weŸ ten kostur. Jednak...
	
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_05"); //Tak?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_06"); //Rozmawia³em z pozosta³ymi Guru o planie Uturiela. Jeœli by wam siê nie uda³o, a wróci³byœ z tego w jednym kawa³ku, to zwróæ mi kostur.
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_07"); //Uwa¿asz, ¿e ten plan ma ma³e szanse na powodzenie?
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_08"); //Tego nie wiem. Gdyby nie wysz³o, to wiesz gdzie mnie znaleŸæ. 
	
	B_LogEntry          (CH4_MagicalCrystals,"Sprowadzi³em Nowicjuszy, którzy uciekli z Obozu. Baal Tondral by³ mi wdziêczny i odda³ kostur bez najmniejszego oporu. Zadziwi³ mnie jednak jego pesymizm. Powiedzia³, ¿e jeœliby nam siê nie uda³o, a ja bym prze¿y³ to mam mu zwróciæ jego pami¹tkê.");
	Gur_1203_BaalTondral_MULTIKILL.permanent = 0;
	
	CreateInvItems (self, ItMi_Mod_TondralStaff, 1);
    B_GiveInvItems (self, other, ItMi_Mod_TondralStaff, 1);
	
	B_GiveXP (250);
	}
	else
	{
	AI_Output (other, self,"Gur_1203_BaalTondral_MULTIKILL_Info_15_12"); //Jeszcze nad tym pracujê.
	AI_Output (self, other,"Gur_1203_BaalTondral_MULTIKILL_Info_02_13"); //W porz¹dku. Poczekamy.
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
   description	= "Zwracam ci twój kostur. ";
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
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_01"); //Zwracam ci twój kostur. 
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_02"); //Czyli jednak siê nie uda³o.
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_03"); //Niestety.
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_04"); //Co z Uturielem?
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_05"); //Nie ¿yje. 
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_06"); //Jak to siê sta³o?
    AI_Output (other, self ,"DIA_BaalTondral_ReturnStaff_15_07"); //Zosta³ ra¿ony piorunem. Kryszta³ nie wytrzyma³ mocy jak¹ wpompowa³a w niego Bariera.
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_08"); //To naprawdê wielka strata. Coraz mniej zosta³o ludzi, którzy nie dali na siebie narzuciæ jarzma. 
    B_GiveInvItems (other, self, ItMi_Mod_TondralStaff, 1);
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_09"); //Dziêkujê, ¿e dotrzyma³eœ obietnicy. 
    AI_Output (self, other ,"DIA_BaalTondral_ReturnStaff_03_10"); //Niech Œni¹cy ma ciê... A zreszt¹. Nie daj siê zabiæ!
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

