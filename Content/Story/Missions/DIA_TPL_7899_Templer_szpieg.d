//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Templer_EXIT(C_INFO)
{
	npc             = TPL_7899_Templer;
	nr              = 999;
	condition	= DIA_Templer_EXIT_Condition;
	information	= DIA_Templer_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Templer_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Templer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Templer_HELLO1 (C_INFO)
{
   npc          = TPL_7899_Templer;
   nr           = 1;
   condition    = DIA_Templer_HELLO1_Condition;
   information  = DIA_Templer_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czego tu szukasz?!";
};

FUNC INT DIA_Templer_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Morok_GomezSendMe))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_01"); //Czego tu szukasz?!
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_02"); //J...ja?
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_03"); //Nie zgrywaj idioty. 
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_04"); //Pos³uchaj, jestem wys³annikiem Cor Kaloma. Mia³em sprawdziæ, co jest w tej œwi¹tyni.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_05"); //Jednak ma³o co nie zgin¹³em od orkowego topora.
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_06"); //Po co Bractwu ta œwi¹tynia?
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_07"); //Baalowie stwierdzili, ¿e mo¿e nam wskazaæ drogê do Œni¹cego.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_08"); //Mo¿liwe, ¿e nie wiesz, ale chcemy go przywo³aæ.
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_09"); //Jak d³ugo tu jesteœ? Przecie¿ przywo³anie Œni¹cego ju¿ siê odby³o.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_10"); //CO?!
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_11"); //Wszystko okaza³o siê fiaskiem. Œni¹cy to demon! A mistrz Y"Berion zgin¹³.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_12"); //To... to nie mo¿e byæ prawd¹. K³amiesz, chcesz mnie oszukaæ!
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_11"); //Przekonaj siê sam. Wracaj do Bractwa i zobacz, co siê tam dzieje.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_14"); //Nie mogê! Musisz mi pomóc. W nocy pods³ucha³em rozmowê Stra¿ników.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_16"); //Jeden z nich powiedzia³, ¿e je¿eli jestem szpiegiem z bagna, to mnie zabij¹.

    Info_ClearChoices	(DIA_Templer_HELLO1);
    Info_AddChoice		(DIA_Templer_HELLO1, "Jeœli nie oni, to ja!", DIA_Templer_HELLO1_ZGINIESZ);
    Info_AddChoice		(DIA_Templer_HELLO1, "Dobra. Pomogê ci.", DIA_Templer_HELLO1_HELP);
};

FUNC VOID DIA_Templer_HELLO1_ZGINIESZ()
{
    AI_Output (other, self ,"DIA_Templer_HELLO1_ZGINIESZ_15_01"); //Jeœli nie oni, to ja!
    AI_Output (self, other ,"DIA_Templer_HELLO1_ZGINIESZ_03_02"); //Nie, nie rób tego.
	
	MIS_ArmorForSpy = LOG_FAILED;

	// Log_CreateTopic          (CH3_ArmorForSpy, LOG_MISSION);
	// Log_SetTopicStatus       (CH3_ArmorForSpy, LOG_FAILED);
	// B_LogEntry               (CH3_ArmorForSpy,"Zrezygnowa³em z pomagania szpiegom!");
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

    Info_ClearChoices		(DIA_Templer_HELLO1);
	
    B_LogEntry                     (CH3_QuestForHeavyArmor,"Znalaz³em cz³owieka o którym mówi³ mi Morok. Okaza³o siê, ¿e to szpieg z Bractwa. Postanowi³em siê go pozbyæ.");
};

FUNC VOID DIA_Templer_HELLO1_HELP()
{
    AI_Output (other, self ,"DIA_Templer_HELLO1_HELP_15_01"); //Dobra. Pomogê ci.
    AI_Output (self, other ,"DIA_Templer_HELLO1_HELP_03_02"); //ZnajdŸ mi jakiœ pancerz, a potem idŸ do swoich kolegów i powiedz im, ¿e jestem myœliwym.
    AI_Output (self, other ,"DIA_Templer_HELLO1_HELP_03_03"); //Niby siê zab³¹ka³em. Wiesz o co chodzi...
    AI_Output (self, other ,"DIA_Templer_HELLO1_HELP_03_04"); //Tylko najpierw pancerz. Najlepiej myœliwski.
    MIS_ArmorForSpy = LOG_RUNNING;

    Log_CreateTopic          (CH3_ArmorForSpy, LOG_MISSION);
    Log_SetTopicStatus       (CH3_ArmorForSpy, LOG_RUNNING);
    B_LogEntry               (CH3_ArmorForSpy,"Muszê znaleŸæ zbrojê dla Stra¿nika Œwi¹tynnego, który bada œwi¹tyniê w dolinie. Jeœli tego nie zrobiê, nie bêdzie móg³ opuœciæ tego miejsca i wróciæ do Bractwa.");
	
	B_LogEntry              (CH3_QuestForHeavyArmor,"Znalaz³em cz³owieka o którym mówi³ mi Morok. Okaza³o siê, ¿e to szpieg z Bractwa. Zdecydowa³em, ¿e pomogê mu siê st¹d wydostaæ.");
	
    Info_ClearChoices		(DIA_Templer_HELLO1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Templer_HELLO2 (C_INFO)
{
   npc          = TPL_7899_Templer;
   nr           = 2;
   condition    = DIA_Templer_HELLO2_Condition;
   information  = DIA_Templer_HELLO2_Info;
   permanent	= true;
   description	= "Mam dla ciebie strój.";
};

FUNC INT DIA_Templer_HELLO2_Condition()
{
    if (MIS_ArmorForSpy == LOG_RUNNING)
   // && (Npc_HasItems (other, NON_LEATHER_ARMOR_L) >=1) || (Npc_HasItems (other, NON_ARMOR1) >=1) || (Npc_HasItems (other, PodroznikArmor) >=1) || (Npc_HasItems (other, PiratArmor) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Templer_HELLO2_15_01"); //Mam dla ciebie strój.
    AI_Output (self, other ,"DIA_Templer_HELLO2_03_02"); //Co mi przynios³eœ?
	
	Info_ClearChoices		(DIA_Templer_HELLO2);
	if (Npc_HasItems (hero, NON_LEATHER_ARMOR_L) >=1)
	{
    Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Skórzany strój)", DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give); //ten strój mo¿na kupiæ u Jensa
	};
	if (Npc_HasItems (hero, HUN_ARMOR_L) >=1)
	{
    Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Ubranie myœliwego)", DIA_Templer_HELLO1_HUN_ARMOR_L_Give); //ten strój kupujemy u Alexa (najs³abszy)
	};
	if (Npc_HasItems (hero, NON_WOLF_ARMOR) >=1)
	{
    Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Zbrojê myœliwego)", DIA_Templer_HELLO1_NON_WOLF_ARMOR_Give);	//ciê¿sza zbroja od Alexa
	};
	if (Npc_HasItems (hero, OldArmor) >=1)
	{
	Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Bardzo stara zbroja)", DIA_Templer_HELLO1_OldArmor_Give); //znaleziona w jaskini
	};
	Info_AddChoice		(DIA_Templer_HELLO2, DIALOG_BACK, DIA_Templer_HELLO1_BACK);
	// skasowane, bo quest jest na 3 rozdzia³ Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Strój pirata)", DIA_Templer_HELLO1_PiratArmor_Give); //nagroda od piratów
};
   
   func void DIA_Templer_HELLO1_BACK ()
   {
   AI_Output (other, self ,"DIA_Templer_HELLO1_BACK_15_01"); //Jeszcze tu wrócê.
   Info_ClearChoices		(DIA_Templer_HELLO2);
   };
   
   func void DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give ()
   {
	if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_15_01"); //To nieco zu¿yty, skórzany strój. Kupi³em go od myœliwego.
		AI_Output (self, other ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_03_02"); //Wielkie dziêki.
			B_GiveXP (200);
			B_GiveInvItems (other, self, NON_LEATHER_ARMOR_L, 1);
			AI_EquipBestArmor (self);
			B_LogEntry          (CH3_ArmorForSpy,"Da³em Stra¿nikowi Œwi¹tynnemu mój stary pancerz. Muszê udaæ siê do Moroka i powiedzieæ, ¿e szpieg by³ myœliwym.");
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			DIA_Templer_HELLO2.permanent = false;
   };
   
    func void DIA_Templer_HELLO1_HUN_ARMOR_L_Give ()
   {
   if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_HUN_ARMOR_L_Give_15_01"); //Mam tu doœæ solidne myœliwskie ubranie.
		AI_Output (self, other ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_03_02"); //Wielkie dziêki.
			B_GiveXP (200);
			B_GiveInvItems (other, self, HUN_ARMOR_L, 1);
			AI_EquipBestArmor (self);
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			B_LogEntry          (CH3_ArmorForSpy,"Da³em Stra¿nikowi Œwi¹tynnemu mój stary pancerz. Muszê udaæ siê do Moroka i powiedzieæ, ¿e szpieg by³ myœliwym.");
			DIA_Templer_HELLO2.permanent = false;
   };
   
    func void DIA_Templer_HELLO1_NON_WOLF_ARMOR_Give ()
   {
   if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_NON_WOLF_ARMOR_Give_15_01"); //Przynios³em ci bardzo dobre myœliwskie ubranie.
		AI_Output (self, other ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_03_02"); //Wielkie dziêki.
			B_GiveXP (200);
			B_GiveInvItems (other, self, NON_WOLF_ARMOR, 1);
			AI_EquipBestArmor (self);
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			B_LogEntry          (CH3_ArmorForSpy,"Da³em Stra¿nikowi Œwi¹tynnemu mój stary pancerz. Muszê udaæ siê do Moroka i powiedzieæ, ¿e szpieg by³ myœliwym.");
			DIA_Templer_HELLO2.permanent = false;
   };   
   
    func void DIA_Templer_HELLO1_OldArmor_Give ()
   {
   
   if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_OldArmor_Give_15_01"); //Mam dla ciebie star¹ zbrojê.
		AI_Output (self, other ,"DIA_Templer_HELLO1_OldArmor_Give_03_02"); //Naprawdê ciekawy pancerz. Jestem ci bardzo wdziêczny.
			B_GiveXP (200);
			B_GiveInvItems (other, self, OldArmor, 1);
			AI_EquipBestArmor (self);
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			B_LogEntry          (CH3_ArmorForSpy,"Da³em Stra¿nikowi Œwi¹tynnemu mój stary pancerz. Muszê udaæ siê do Moroka i powiedzieæ, ¿e szpieg by³ myœliwym.");
			DIA_Templer_HELLO2.permanent = false;
   };     
   
   
   /*
	if (Npc_HasItems (other, NON_LEATHER_ARMOR_L) >=1)
	{
	B_GiveInvItems (other, self, NON_LEATHER_ARMOR_L, 1);
	Mdl_SetVisualBody 				(self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic",64,1,NON_LEATHER_ARMOR_L);
	}
	else if (Npc_HasItems (other, NON_ARMOR1) >=1) 
	{
	B_GiveInvItems (other, self, NON_ARMOR1, 1);
	Mdl_SetVisualBody 				(self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic",64,1,NON_ARMOR1);
	}
	else if (Npc_HasItems (other, PodroznikArmor) >=1)
	{
	B_GiveInvItems (other, self, PodroznikArmor, 1);
	Mdl_SetVisualBody 				(self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic",64,1,PodroznikArmor);
	}
	else if (Npc_HasItems (other, PiratArmor) >=1)
	{
	B_GiveInvItems (other, self, PiratArmor, 1);
	Mdl_SetVisualBody 				(self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic",64,1,PiratArmor);
	};
	// fix 1.24
    AI_Output (self, other ,"DIA_Templer_HELLO2_03_03"); //Teraz idŸ do swoich kolegów i powiedz im o mnie.
    B_LogEntry                     (CH3_ArmorForSpy,"Mam udaæ siê do Moroka i powiedzieæ, ¿e szpieg by³ myœliwym.");
    B_GiveXP (200);
	// Npc_ExchangeRoutine (self, "camp");
    AI_StopProcessInfos	(self);*/
