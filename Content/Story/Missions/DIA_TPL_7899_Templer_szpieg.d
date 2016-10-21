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
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_04"); //Pos�uchaj, jestem wys�annikiem Cor Kaloma. Mia�em sprawdzi�, co jest w tej �wi�tyni.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_05"); //Jednak ma�o co nie zgin��em od orkowego topora.
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_06"); //Po co Bractwu ta �wi�tynia?
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_07"); //Baalowie stwierdzili, �e mo�e nam wskaza� drog� do �ni�cego.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_08"); //Mo�liwe, �e nie wiesz, ale chcemy go przywo�a�.
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_09"); //Jak d�ugo tu jeste�? Przecie� przywo�anie �ni�cego ju� si� odby�o.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_10"); //CO?!
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_11"); //Wszystko okaza�o si� fiaskiem. �ni�cy to demon! A mistrz Y"Berion zgin��.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_12"); //To... to nie mo�e by� prawd�. K�amiesz, chcesz mnie oszuka�!
    AI_Output (other, self ,"DIA_Templer_HELLO1_15_11"); //Przekonaj si� sam. Wracaj do Bractwa i zobacz, co si� tam dzieje.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_14"); //Nie mog�! Musisz mi pom�c. W nocy pods�ucha�em rozmow� Stra�nik�w.
    AI_Output (self, other ,"DIA_Templer_HELLO1_03_16"); //Jeden z nich powiedzia�, �e je�eli jestem szpiegiem z bagna, to mnie zabij�.

    Info_ClearChoices	(DIA_Templer_HELLO1);
    Info_AddChoice		(DIA_Templer_HELLO1, "Je�li nie oni, to ja!", DIA_Templer_HELLO1_ZGINIESZ);
    Info_AddChoice		(DIA_Templer_HELLO1, "Dobra. Pomog� ci.", DIA_Templer_HELLO1_HELP);
};

FUNC VOID DIA_Templer_HELLO1_ZGINIESZ()
{
    AI_Output (other, self ,"DIA_Templer_HELLO1_ZGINIESZ_15_01"); //Je�li nie oni, to ja!
    AI_Output (self, other ,"DIA_Templer_HELLO1_ZGINIESZ_03_02"); //Nie, nie r�b tego.
	
	MIS_ArmorForSpy = LOG_FAILED;

	// Log_CreateTopic          (CH3_ArmorForSpy, LOG_MISSION);
	// Log_SetTopicStatus       (CH3_ArmorForSpy, LOG_FAILED);
	// B_LogEntry               (CH3_ArmorForSpy,"Zrezygnowa�em z pomagania szpiegom!");
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

    Info_ClearChoices		(DIA_Templer_HELLO1);
	
    B_LogEntry                     (CH3_QuestForHeavyArmor,"Znalaz�em cz�owieka o kt�rym m�wi� mi Morok. Okaza�o si�, �e to szpieg z Bractwa. Postanowi�em si� go pozby�.");
};

FUNC VOID DIA_Templer_HELLO1_HELP()
{
    AI_Output (other, self ,"DIA_Templer_HELLO1_HELP_15_01"); //Dobra. Pomog� ci.
    AI_Output (self, other ,"DIA_Templer_HELLO1_HELP_03_02"); //Znajd� mi jaki� pancerz, a potem id� do swoich koleg�w i powiedz im, �e jestem my�liwym.
    AI_Output (self, other ,"DIA_Templer_HELLO1_HELP_03_03"); //Niby si� zab��ka�em. Wiesz o co chodzi...
    AI_Output (self, other ,"DIA_Templer_HELLO1_HELP_03_04"); //Tylko najpierw pancerz. Najlepiej my�liwski.
    MIS_ArmorForSpy = LOG_RUNNING;

    Log_CreateTopic          (CH3_ArmorForSpy, LOG_MISSION);
    Log_SetTopicStatus       (CH3_ArmorForSpy, LOG_RUNNING);
    B_LogEntry               (CH3_ArmorForSpy,"Musz� znale�� zbroj� dla Stra�nika �wi�tynnego, kt�ry bada �wi�tyni� w dolinie. Je�li tego nie zrobi�, nie b�dzie m�g� opu�ci� tego miejsca i wr�ci� do Bractwa.");
	
	B_LogEntry              (CH3_QuestForHeavyArmor,"Znalaz�em cz�owieka o kt�rym m�wi� mi Morok. Okaza�o si�, �e to szpieg z Bractwa. Zdecydowa�em, �e pomog� mu si� st�d wydosta�.");
	
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
   description	= "Mam dla ciebie str�j.";
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
    AI_Output (other, self ,"DIA_Templer_HELLO2_15_01"); //Mam dla ciebie str�j.
    AI_Output (self, other ,"DIA_Templer_HELLO2_03_02"); //Co mi przynios�e�?
	
	Info_ClearChoices		(DIA_Templer_HELLO2);
	if (Npc_HasItems (hero, NON_LEATHER_ARMOR_L) >=1)
	{
    Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Sk�rzany str�j)", DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give); //ten str�j mo�na kupi� u Jensa
	};
	if (Npc_HasItems (hero, HUN_ARMOR_L) >=1)
	{
    Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Ubranie my�liwego)", DIA_Templer_HELLO1_HUN_ARMOR_L_Give); //ten str�j kupujemy u Alexa (najs�abszy)
	};
	if (Npc_HasItems (hero, NON_WOLF_ARMOR) >=1)
	{
    Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Zbroj� my�liwego)", DIA_Templer_HELLO1_NON_WOLF_ARMOR_Give);	//ci�sza zbroja od Alexa
	};
	if (Npc_HasItems (hero, OldArmor) >=1)
	{
	Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Bardzo stara zbroja)", DIA_Templer_HELLO1_OldArmor_Give); //znaleziona w jaskini
	};
	Info_AddChoice		(DIA_Templer_HELLO2, DIALOG_BACK, DIA_Templer_HELLO1_BACK);
	// skasowane, bo quest jest na 3 rozdzia� Info_AddChoice		(DIA_Templer_HELLO2, "(Oddaj Str�j pirata)", DIA_Templer_HELLO1_PiratArmor_Give); //nagroda od pirat�w
};
   
   func void DIA_Templer_HELLO1_BACK ()
   {
   AI_Output (other, self ,"DIA_Templer_HELLO1_BACK_15_01"); //Jeszcze tu wr�c�.
   Info_ClearChoices		(DIA_Templer_HELLO2);
   };
   
   func void DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give ()
   {
	if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_15_01"); //To nieco zu�yty, sk�rzany str�j. Kupi�em go od my�liwego.
		AI_Output (self, other ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_03_02"); //Wielkie dzi�ki.
			B_GiveXP (200);
			B_GiveInvItems (other, self, NON_LEATHER_ARMOR_L, 1);
			AI_EquipBestArmor (self);
			B_LogEntry          (CH3_ArmorForSpy,"Da�em Stra�nikowi �wi�tynnemu m�j stary pancerz. Musz� uda� si� do Moroka i powiedzie�, �e szpieg by� my�liwym.");
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
		AI_Output (other, self ,"DIA_Templer_HELLO1_HUN_ARMOR_L_Give_15_01"); //Mam tu do�� solidne my�liwskie ubranie.
		AI_Output (self, other ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_03_02"); //Wielkie dzi�ki.
			B_GiveXP (200);
			B_GiveInvItems (other, self, HUN_ARMOR_L, 1);
			AI_EquipBestArmor (self);
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			B_LogEntry          (CH3_ArmorForSpy,"Da�em Stra�nikowi �wi�tynnemu m�j stary pancerz. Musz� uda� si� do Moroka i powiedzie�, �e szpieg by� my�liwym.");
			DIA_Templer_HELLO2.permanent = false;
   };
   
    func void DIA_Templer_HELLO1_NON_WOLF_ARMOR_Give ()
   {
   if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_NON_WOLF_ARMOR_Give_15_01"); //Przynios�em ci bardzo dobre my�liwskie ubranie.
		AI_Output (self, other ,"DIA_Templer_HELLO1_NON_LEATHER_ARMOR_L_Give_03_02"); //Wielkie dzi�ki.
			B_GiveXP (200);
			B_GiveInvItems (other, self, NON_WOLF_ARMOR, 1);
			AI_EquipBestArmor (self);
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			B_LogEntry          (CH3_ArmorForSpy,"Da�em Stra�nikowi �wi�tynnemu m�j stary pancerz. Musz� uda� si� do Moroka i powiedzie�, �e szpieg by� my�liwym.");
			DIA_Templer_HELLO2.permanent = false;
   };   
   
    func void DIA_Templer_HELLO1_OldArmor_Give ()
   {
   
   if (Npc_HasItems (self, TPL_ARMOR_M) >=1) 
	{
	Npc_RemoveInvItems (self, TPL_ARMOR_M, 1);
	};
		AI_Output (other, self ,"DIA_Templer_HELLO1_OldArmor_Give_15_01"); //Mam dla ciebie star� zbroj�.
		AI_Output (self, other ,"DIA_Templer_HELLO1_OldArmor_Give_03_02"); //Naprawd� ciekawy pancerz. Jestem ci bardzo wdzi�czny.
			B_GiveXP (200);
			B_GiveInvItems (other, self, OldArmor, 1);
			AI_EquipBestArmor (self);
			Npc_ExchangeRoutine (self, "camp");
			AI_StopProcessInfos	(self);
			B_LogEntry          (CH3_ArmorForSpy,"Da�em Stra�nikowi �wi�tynnemu m�j stary pancerz. Musz� uda� si� do Moroka i powiedzie�, �e szpieg by� my�liwym.");
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
    AI_Output (self, other ,"DIA_Templer_HELLO2_03_03"); //Teraz id� do swoich koleg�w i powiedz im o mnie.
    B_LogEntry                     (CH3_ArmorForSpy,"Mam uda� si� do Moroka i powiedzie�, �e szpieg by� my�liwym.");
    B_GiveXP (200);
	// Npc_ExchangeRoutine (self, "camp");
    AI_StopProcessInfos	(self);*/
