//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  Vlk_587_Garp_Exit (C_INFO)
{
	npc			=  Vlk_587_Garp;
	nr = 999;
	condition	=  Vlk_587_Garp_Exit_Condition;
	information	=  Vlk_587_Garp_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

FUNC VOID  Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Vlk_587_Garp_ORK (C_INFO)
{
	npc				= Vlk_587_Garp;
	condition		= Vlk_587_Garp_ORK_Condition;
	information		= Vlk_587_Garp_ORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co tu robi ten ork?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //Co tu robi ten ork?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Z³apali go nasi Stra¿nicy. Od tej pory pracuje dla nas.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Przecie¿ nie jest nawet skuty ³añcuchami. Czemu po prostu nie ucieknie?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Raz spróbowa³. Stra¿nicy tak go urz¹dzili, ¿e nie móg³ siê ruszyæ przez parê tygodni. Od tej pory nigdy wiêcej siê nie buntowa³.
};  

//========================================
//-----------------> DOSTAWA
//========================================

INSTANCE DIA_Garp_DOSTAWA (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 1;
   condition    = DIA_Garp_DOSTAWA_Condition;
   information  = DIA_Garp_DOSTAWA_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie dostawê wytrychów.";
};

FUNC INT DIA_Garp_DOSTAWA_Condition()
{
    if MIS_SmallDelivery == LOG_RUNNING
    && (Npc_HasItems (other, ItKeLockpick) >=20)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_DOSTAWA_Info()
{
    AI_Output (other, self ,"DIA_Garp_DOSTAWA_15_01"); //Mam dla ciebie dostawê wytrychów.
    AI_Output (self, other ,"DIA_Garp_DOSTAWA_03_02"); //Nie tak g³oœno, bo Stra¿nicy nas us³ysz¹!
	AI_Output (self, other ,"DIA_Garp_DOSTAWA_03_03"); //Dziêki. 
	
    B_LogEntry               (CH1_SmallDelivery,"Dostarczenie tych wytrychów nie by³o zbyt trudne. Przynajmniej otrzyma³em kilka bry³ek rudy.");
    Log_SetTopicStatus       (CH1_SmallDelivery, LOG_SUCCESS);
    MIS_SmallDelivery = LOG_SUCCESS;

    B_GiveXP (25);
    CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);

};

//========================================
//-----------------> AKSZYN
//========================================

INSTANCE DIA_Garp_AKSZYN (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 2;
   condition    = DIA_Garp_AKSZYN_Condition;
   information  = DIA_Garp_AKSZYN_Info;
   permanent	= FALSE;
   description	= "Czy¿byœcie coœ knuli?";
};

FUNC INT DIA_Garp_AKSZYN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_DOSTAWA)) //|| (Npc_KnowsInfo (hero, DIA_Garp_AkcjaRun))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_AKSZYN_Info()
{
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_01"); //Czy¿byœcie coœ knuli?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_02"); //Nie tak g³oœno. Tak, mamy pewien plan.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_03"); //O co dok³adniej chodzi?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_04"); //Chcemy w³amaæ siê do magazynu i odzyskaæ zarekwirowane przez Stra¿ników przedmioty.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_05"); //Nale¿¹ do was?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_06"); //Wiêkszoœæ tak. To bêdzie nasz pierwszy krok do buntu.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_07"); //Buntu? Czy to nie jest zbyt ryzykowne? Jakie macie szanse?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_08"); //Ty siê ju¿ o to nie martw. Dobra organizacja to podstawa.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_10"); //Do rzeczy... Jak mogê wam pomóc?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_11"); //Wœród Kopaczy tylko Aleph potrafi otwieraæ zamki. 
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_12"); //Ostatnio chcia³ siê podj¹æ tego ryzyka.
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_13"); //Pogadaj z nim i dowiedz siê, czy dalej jest po naszej stronie.
    MIS_ActionOM = LOG_RUNNING;

    Log_CreateTopic           (CH1_ActionOM, LOG_MISSION);
    Log_SetTopicStatus        (CH1_ActionOM, LOG_RUNNING);
    B_LogEntry              		 (CH1_ActionOM,"Garp opowiedzia³ mi o planie dotycz¹cym odzyskania zarekwirowanych rzeczy Kopaczy z magazynu na dnie Kopalni. Mam pogadaæ z Alpehem i dowiedzieæ siê, czy nadal jest sk³onny zaj¹æ siê skrzyniami w magazynie.");
};

//========================================
//-----------------> GADANINA
//========================================

INSTANCE DIA_Garp_GADANINA (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 134;
   condition    = DIA_Garp_GADANINA_Condition;
   information  = DIA_Garp_GADANINA_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Alephem.";
};

FUNC INT DIA_Garp_GADANINA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aleph_MAGZYN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_GADANINA_Info()
{
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_01"); //Rozmawia³em z Alephem.
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_02"); //Tak? I kiedy zaczynamy?
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_03"); //Nigdy.
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_04"); //Powiedzia³, ¿e nie ma zamiaru braæ w tym udzia³u. Wasz plan jest wiêc z góry skazany na pora¿kê. 
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_05"); //Co ten sukinsyn sobie myœli?! Wycofa³ siê w ostatniej chwili!
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_06"); //A co je¿eli skuma³ siê ze Stra¿nikami?! Musimy uwa¿aæ. Ju¿ zbyt du¿o osób o tym wie.
    B_LogEntry                     (CH1_ActionOM,"Przekaza³em odpowiedŸ Alepha Garpowi. Nie by³ zadowolony z takiego obrotu sprawy. Gdybym umia³ otwieraæ zamki, móg³bym zaproponowaæ Garpowi pomoc.");
};

//========================================
//-----------------> WLAM
//========================================

INSTANCE DIA_Garp_WLAM (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 135;
   condition    = DIA_Garp_WLAM_Condition;
   information  = DIA_Garp_WLAM_Info;
   permanent	= FALSE;
   description	= "Mo¿e ja bym siê w³ama³?";
};

FUNC INT DIA_Garp_WLAM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_GADANINA)) && (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) > 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_WLAM_Info()
{
    AI_Output (other, self ,"DIA_Garp_WLAM_15_01"); //Mo¿e ja bym siê w³ama³?
    AI_Output (other, self ,"DIA_Garp_WLAM_15_02"); //Potrafiê otwieraæ zamki.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_03"); //Naprawdê? Zrobisz to?
    AI_Output (other, self ,"DIA_Garp_WLAM_15_04"); //Chyba mogê liczyæ na wasz¹ pomoc?
    AI_Output (self, other ,"DIA_Garp_WLAM_03_05"); //Oczywiœcie. Glen da ci wytrychy, a ja odci¹gnê Stra¿nika.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_06"); //Grimes dopilnuje, aby Ianowi nie przysz³o do g³owy zrobiæ sobie obchód po dnie kopalni.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_07"); //IdŸ do Glena po wytrychy. Powiedz te¿ Grimesowi, ¿eby siê przygotowa³.
    B_LogEntry                     (CH1_ActionOM,"Zaproponowa³em, ¿e to ja otworzê skrzynie w magazynie. Glen da mi kilka wytrychów, a Grimes dopilnuje, by nikt nam nie przerwa³. Mam iœæ i powiedzieæ im, co maja robiæ.");
};

//========================================
//-----------------> KOPACZE
//========================================

INSTANCE DIA_Garp_KOPACZE (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 136;
   condition    = DIA_Garp_KOPACZE_Condition;
   information  = DIA_Garp_KOPACZE_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Kopaczami.";
};

FUNC INT DIA_Garp_KOPACZE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glen_ROBOTKA))
    && (Npc_KnowsInfo (hero, DIA_Grimes_AKSZYN22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_KOPACZE_Info()
{
    AI_Output (other, self ,"DIA_Garp_KOPACZE_15_01"); //Rozmawia³em z Kopaczami.
    AI_Output (other, self ,"DIA_Garp_KOPACZE_15_02"); //Mam wszystko przygotowane. Mo¿emy dzia³aæ.
    AI_Output (self, other ,"DIA_Garp_KOPACZE_03_03"); //Daj znak, gdy bêdziesz gotowy, a ja odci¹gnê Stra¿nika.
    AI_Output (self, other ,"DIA_Garp_KOPACZE_03_04"); //Tylko pamiêtaj o skradaniu.
};

//========================================
//-----------------> AKCJA1
//========================================

INSTANCE DIA_Garp_AKCJA1 (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 1;
   condition    = DIA_Garp_AKCJA1_Condition;
   information  = DIA_Garp_AKCJA1_Info;
   permanent	= FALSE;
   description	= "Zaczynajmy.";
};

FUNC INT DIA_Garp_AKCJA1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_KOPACZE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_AKCJA1_Info()
{
    AI_Output (other, self ,"DIA_Garp_AKCJA1_15_01"); //Zaczynajmy.
    AI_Output (self, other ,"DIA_Garp_AKCJA1_03_02"); //Dobra. Poczekaj, a¿ zagadam Stra¿nika.
    Npc_ExchangeRoutine (GRD_2035_Dracon,"wlam");
    Npc_ExchangeRoutine (Vlk_587_Garp,"wlam");
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> UKONCZONO
//========================================

INSTANCE DIA_Garp_UKONCZONO (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 8;
   condition    = DIA_Garp_UKONCZONO_Condition;
   information  = DIA_Garp_UKONCZONO_Info;
   permanent	= FALSE;
   description	= "(kiwnij porozumiewawczo g³ow¹)";
};

FUNC INT DIA_Garp_UKONCZONO_Condition()
{
    if (Npc_HasItems (other, ItMi_Worek_Garp) >=1)
    && (MIS_ActionOM == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_UKONCZONO_Info()
{
    AI_Output (other, self ,"DIA_Garp_UKONCZONO_15_01"); //Ekhem...
    AI_Output (self, other ,"DIA_Garp_UKONCZONO_15_02"); //Mmmm...
    Npc_ExchangeRoutine (self,"START");
	B_ExchangeRoutine (GRD_2035_Dracon, "start");  
	B_LogEntry        (CH1_ActionOM,"Uda³o mi siê z³amaæ zamki. Teraz muszê oddaæ Kopaczom przedmioty nale¿¹ce do nich, a resztê rzeczy bêdê móg³ zachowaæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SAKWA
//========================================

INSTANCE DIA_Garp_SAKWA (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 9;
   condition    = DIA_Garp_SAKWA_Condition;
   information  = DIA_Garp_SAKWA_Info;
   permanent	= FALSE;
   description	= "Oto twoja sakiewka.";
};

FUNC INT DIA_Garp_SAKWA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_UKONCZONO))
    && (Npc_HasItems (other, ItMi_Worek_Garp) >=1)
    && (MIS_ActionOM == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_SAKWA_Info()
{
    AI_Output (other, self ,"DIA_Garp_SAKWA_15_01"); //Oto twoja sakiewka.
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_02"); //Dziêkujê ci. Naprawdê dziêkujê!
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_03"); //Bêdziesz s³awny w ca³ej Kopalni. Oczywiœcie tylko wœród Kopaczy...
    //AI_Output (other, self ,"DIA_Garp_SAKWA_15_04"); //Chcê wreszcie zanieœæ te 500 bry³ek Ianowi i siê st¹d wydostaæ.
    //AI_Output (self, other ,"DIA_Garp_SAKWA_03_05"); //Mam nadziejê, ¿e teraz ci wystarczy.
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_06"); //Powodzenia, bracie.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH1_ActionOM,"Zdoby³em dosyæ sporo rudy. Otrzyma³em tak¿e wynagrodzenie. Z pewnoœci¹ jeszcze coœ dostanê od innych Kopaczy.");
    Log_SetTopicStatus       (CH1_ActionOM, LOG_SUCCESS);
    MIS_ActionOM = LOG_SUCCESS;
	B_GiveInvItems (other, self, ItMi_Worek_Garp, 1);

    B_GiveXP (XP_OldMineAction);
    AI_StopProcessInfos	(self);
};