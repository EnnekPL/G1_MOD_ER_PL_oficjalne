//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Co s³ychaæ?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jesteœ tu nowy, co? Zapamiêtaj sobie, ¿eby nigdy nie w³aziæ w drogê Stra¿nikom.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Jak za¿¹daj¹ od ciebie pieniêdzy - zap³aæ. Inaczej œci¹gniesz sobie na g³owê po³owê Obozu.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! S³ysza³em, ¿e nie chcesz p³aciæ Bloodwynowi za ochronê!
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Czego chcesz?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Chcê ciê ostrzec! Bloodwyn zap³aci³ paru ludziom, ¿eby ciê za³atwili.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Widzia³em, jak rozmawia³ z paroma osobami, na przyk³ad z tamtym goœciem, Herekiem. Bóg wie, kogo jeszcze wynaj¹³!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Jeœli chodzi o Hereka, to twoje ostrze¿enie jest nieco spóŸnione.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Na pewno rozmawia³ z kimœ jeszcze, mo¿esz mi wierzyæ. Uwa¿aj na siebie.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Dlaczego opowiedzia³eœ mi o Bloodwynie?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Warn)) //g1210 fixed
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Dlaczego opowiedzia³eœ mi o Bloodwynie?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Bo za przys³ugê nale¿y siê przys³uga. Jesteœ m¹drym ch³opcem. Chyba siê rozumiemy?
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //JA wyœwiadczy³em ci w³aœnie przys³ugê, wiêc teraz TWOJA kolej, ¿eby mi siê odwdziêczyæ!
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Nie jestem ci nic winien!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co dok³adnie masz na myœli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nie jestem ci nic winien!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Wiêc nie mamy o czym mówiæ!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co dok³adnie masz na myœli?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Nie mam ju¿ rudy, a Bloodwyn i mnie zaczyna dobieraæ siê do ty³ka.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Pomog³em ci, wiêc móg³byœ zap³aciæ za mnie te 10 bry³ek, które zalegam, co? Powiedz mu, ¿e to ode mnie!
	//Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Ja, mia³bym zap³aciæ za ciebie? Chyba œnisz!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Zobaczê co siê da zrobiæ.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Zobaczê co siê da zrobiæ.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Dziêki, stary! Ocali³eœ mi ¿ycie! Daj mi znaæ, jak ju¿ wszystko za³atwisz, dobra?
	Jesse_PayForMe = LOG_RUNNING;
	Log_CreateTopic(CH1_HelpJesse, LOG_MISSION); //fix
	Log_SetTopicStatus       (CH1_HelpJesse, LOG_RUNNING);
    B_LogEntry               (CH1_HelpJesse,"Kopacz Jesse ostrzeg³ mnie przed Herekiem i prosi teraz o przys³ugê. Mam zap³aciæ za niego 10 bry³ek rudy u Bloodwyna. ");
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Ja, mia³bym zap³aciæ za ciebie? Chyba œnisz!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Widzê, ¿e myli³em siê co do ciebie. W przysz³oœci nie oczekuj ode mnie pomocy.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Zap³aci³em Bloodwynowi!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Zap³aci³em Bloodwynowi!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? To œwietnie! No to teraz jesteœmy kwita.
	//Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	Log_SetTopicStatus       (CH1_HelpJesse, LOG_SUCCESS);
	B_LogEntry               (CH1_HelpJesse,"Sp³aci³em swój d³ug u Jesse, mimo ¿e jego informacja o Hereku by³a nieco spóŸniona. No có¿, niech siê cieszy. ");
	b_givexp (50);
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COOO??? Wyda³em 10 bry³ek na cynk o którym i tak ju¿ wiedzia³em?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Dok³adnie. Rêka rêkê myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COOO??? Wyda³em 10 bry³ek na cynk o którym i tak ju¿ wiedzia³em?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Na to wygl¹da.
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Dok³adnie. Rêka rêkê myje.
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
//========================================
//-----------------> NEK
//========================================

INSTANCE DIA_Jesse_NEK (C_INFO)
{
   npc          = Vlk_564_Jesse;
   nr           = 8;
   condition    = DIA_Jesse_NEK_Condition;
   information  = DIA_Jesse_NEK_Info;
   permanent	= FALSE;
   description	= "Co wiesz o zabójstwie Neka?";
};

FUNC INT DIA_Jesse_NEK_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_NEK_Info()
{
    AI_Output (other, self ,"DIA_Jesse_NEK_15_01"); //Co wiesz o zabójstwie Neka?
    AI_Output (self, other ,"DIA_Jesse_NEK_03_02"); //Czemu tak wêszysz? Dla kogo pracujesz?
    AI_Output (other, self ,"DIA_Jesse_NEK_15_03"); //Na pewno nie dla Z³ego. S³ysza³em, ¿e ktoœ st¹d by³ œwiadkiem, ale to ukrywa. 
    AI_Output (self, other ,"DIA_Jesse_NEK_03_04"); //Po co ci œwiadek? 
    AI_Output (other, self ,"DIA_Jesse_NEK_15_05"); //Chcê, ¿eby przedstawi³ wszystko Thorusowi. Muszê ubrudziæ Z³ego w b³ocie, jeœli wiesz co mam na myœli.
    AI_Output (self, other ,"DIA_Jesse_NEK_03_06"); //Rozumiem. To faktycznie by³ Z³y. Nie wiem sk¹d o tym wiesz, ale dam ci radê. Dopóki siepacze Z³ego terroryzuj¹ okolicê, nikt ci nic nie poœwiadczy.
    AI_Output (other, self ,"DIA_Jesse_NEK_15_07"); //Dlaczego wczeœniej nie powiedzieliœcie? 
    AI_Output (self, other ,"DIA_Jesse_NEK_03_08"); //To dzia³o siê bardzo szybko. Myœleliœmy o tym, ale te dwa zbiry pojawi³y siê z dnia na dzieñ. Nie wiem sk¹d on ich wytrzasn¹³. 
    AI_Output (other, self ,"DIA_Jesse_NEK_15_09"); //Kto jeszcze o tym wie?
    AI_Output (self, other ,"DIA_Jesse_NEK_03_10"); //Poza mn¹ tylko Kyle i Tippler. Mo¿e oni ci opowiedz¹ jak to by³o. Ja nie mam zamiaru. Przynajmniej do czasu, a¿ tych dwóch nie przestanie czyhaæ na moje ¿ycie. 
    AI_Output (self, other ,"DIA_Jesse_NEK_03_11"); //Poza tym Kyle chyba woli siedzieæ cicho. Ca³a ta sytuacja by³a doœæ dwuznaczna.
    AI_Output (other, self ,"DIA_Jesse_NEK_15_12"); //Lepiej trzymaj ju¿ jêzyk za zêbami. 
    B_LogEntry                     (CH1_SpysProblems,"Kopacze s¹ zastraszani przez Z³ego. Wynaj¹³ siepaczy, aby terroryzowali okolicê. Poza Jesse o zabójstwie wiedz¹ tak¿e Tippler i Kyle.");
	HeroKnowsSlyKillNek = true;
};
//========================================
//-----------------> OKKKKKKK
//========================================

INSTANCE DIA_Jesse_OKKKKKKK (C_INFO)
{
   npc          = Vlk_564_Jesse;
   nr           = 7;
   condition    = DIA_Jesse_OKKKKKKK_Condition;
   information  = DIA_Jesse_OKKKKKKK_Info;
   permanent	= FALSE;
   description	= "Pozby³em siê twoich k³opotów.";
};

FUNC INT DIA_Jesse_OKKKKKKK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jesse_NEK))
    && (MIS_SpysProblems == LOG_RUNNING)
	&& (Npc_IsDead(GRD_2014_Siepacz))
    && (Npc_IsDead(GRD_2013_Siepacz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_OKKKKKKK_Info()
{
    AI_Output (other, self ,"DIA_Jesse_OKKKKKKK_15_01"); //Pozby³em siê twoich k³opotów.
    AI_Output (self, other ,"DIA_Jesse_OKKKKKKK_03_02"); //Twierdzisz, ¿e zabi³eœ tych dryblasów?
    AI_Output (self, other ,"DIA_Jesse_OKKKKKKK_03_03"); //Zaczynam siê ciebie baæ. Nie wiem, czy ci pomogê.
    AI_Output (other, self ,"DIA_Jesse_OKKKKKKK_15_04"); //Ostatnio œpiewa³eœ inaczej. 
    AI_Output (self, other ,"DIA_Jesse_OKKKKKKK_03_05"); //Dobra, dobra. Pójdê do Thorusa.
    B_LogEntry                     (CH1_SpysProblems,"Jesse potwierdzi zabójstwo Neka Thorusowi.");
    AI_StopProcessInfos	(self);
};

//========================================
// Zadanie "Kto komu piasek sypie"
//========================================
INSTANCE DIA_Jesse_Eskel (C_INFO)
{
   npc          = VLK_564_Jesse;
   nr           = 2;
   condition    = DIA_Jesse_Eskel_Condition;
   information  = DIA_Jesse_Eskel_Info;
   important	= TRUE;
   description	= ".";
};

FUNC INT DIA_Jesse_Eskel_Condition()
{
   if (Npc_KnowsInfo(other, DIA_Uscan_Flour) && (UscanDay <= Wld_GetDay()))
   {
		return TRUE;
   };
};

FUNC VOID DIA_Jesse_Eskel_Info()
{
   AI_Output (self, other ,"DIA_Jesse_Eskel_03_00"); //Ha ha ha... S³ysza³eœ?
   AI_Output (other, self ,"DIA_Jesse_Eskel_15_01"); //Co takiego?
	AI_Output (self, other ,"DIA_Jesse_Eskel_03_02"); //Ktoœ dosypa³ Eskelowi piasku do m¹ki zupe³nie jak on za dawnych czasów.
	AI_Output (self, other ,"DIA_Jesse_Eskel_03_03"); //Drañ upiek³ sobie taki chleb i zawy³ z bólu, trac¹c zêby, gdy spróbowa³ go ugryŸæ.
	AI_Output (other, self ,"DIA_Jesse_Eskel_15_04"); //Có¿, kto mieczem wojuje, ten od miecza ginie.
	
	B_LogEntry(CH1_WhoeverPoursSand, "Uda³o siê! Od Jesse dowiedzia³em siê, ¿e Eskel ma teraz problemy z uzêbieniem. Intryga siê powiod³a.");
};

//========================================
//-----------------> ucieczka
//========================================

INSTANCE DIA_Jesse_ucieczka (C_INFO)
{
   npc          = VLK_564_Jesse;
   nr           = 1;
   condition    = DIA_Jesse_ucieczka_Condition;
   information  = DIA_Jesse_ucieczka_Info;
   permanent	= FALSE;
   description	= "Uciek³eœ ze Starego Obozu?";
};

FUNC INT DIA_Jesse_ucieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_ucieczka_Info()
{
    AI_Output (other, self ,"DIA_Jesse_ucieczka_15_01"); //Uciek³eœ ze Starego Obozu?
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_02"); //A co mia³em innego do wyboru?
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_03"); //Zostaæ s³ugusem Gomeza i tyraæ w Opuszczonej Kopalni?!
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_04"); //Powiem ci, ¿e tu te¿ nie jest najlepiej. 
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_05"); //Nawet nie chcieli mnie wpuœciæ do Obozu. 
    AI_Output (other, self ,"DIA_Jesse_ucieczka_15_06"); //Wiêc jakim cudem tu jesteœ?
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_07"); //Zosta³em zbieraczem.
    AI_Output (self, other ,"DIA_Jesse_ucieczka_03_08"); //Najchêtniej to bym st¹d zwia³ do jakiegoœ cichego miejsca.
};

//========================================
//-----------------> gotocav
//========================================

INSTANCE DIA_Jesse_gotocav (C_INFO)
{
   npc          = VLK_564_Jesse;
   nr           = 2;
   condition    = DIA_Jesse_gotocav_Condition;
   information  = DIA_Jesse_gotocav_Info;
   permanent	= FALSE;
   description	= "ChodŸ do Cavalorna!";
};

FUNC INT DIA_Jesse_gotocav_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jesse_ucieczka))
    && (Npc_KnowsInfo (hero, DIA_Cavalorn_Help455675))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jesse_gotocav_Info()
{
    AI_Output (other, self ,"DIA_Jesse_gotocav_15_01"); //ChodŸ do Cavalorna!
    AI_Output (self, other ,"DIA_Jesse_gotocav_03_02"); //Tego Cienia?
    AI_Output (other, self ,"DIA_Jesse_gotocav_15_03"); //Nie jest ju¿ Cieniem. Szuka nowego czeladnika.
    AI_Output (self, other ,"DIA_Jesse_gotocav_03_04"); //Hmm. No dobra. Mo¿e tam bêdzie mi lepiej.

    Npc_ExchangeRoutine (self,"cava");
    B_LogEntry                     (CH1_NowyVart,"Jesse zgodzi³ siê towarzyszyæ Cavalornowi.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
