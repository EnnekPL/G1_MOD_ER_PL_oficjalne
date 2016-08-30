// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Duch_EXIT(C_INFO)
{
	npc             = NON_5632_Duch;
	nr              = 999;
	condition		= DIA_Duch_EXIT_Condition;
	information		= DIA_Duch_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Duch_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Duch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Duch_HELLO1 (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_HELLO1_Condition;
   information  = DIA_Duch_HELLO1_Info;
   permanent	= FALSE;
   description	= "O Innosie! Nieumar�y!";
};

FUNC INT DIA_Duch_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Duch_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Duch_HELLO1_15_01"); //O Innosie! Nieumar�y!
    AI_Output (self, other ,"DIA_Duch_HELLO1_03_02"); //Odejd�, je�eli nie potrafisz mi pom�c!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Duch_HELLO2 (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 2;
   condition    = DIA_Duch_HELLO2_Condition;
   information  = DIA_Duch_HELLO2_Info;
   permanent	= FALSE;
   description	= "Znasz Magnusa?";
};

FUNC INT DIA_Duch_HELLO2_Condition()
{
    if (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_01"); //Znasz Magnusa?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_02"); //Przys�a� ci� tutaj? Ba� si� przyj�� sam?
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_03"); //Jest w szoku po tym co si� sta�o.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_04"); //Jakim cudem ja w og�le z tob� rozmawiam?!
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_05"); //Jeste� iluzj�?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_06"); //Nie. Ostrze, kt�rym zosta�em ugodzony by�o przekl�te.
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_07"); //Wch�on�o moc Beliara.
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_08"); //Ka�dy, kto od niego zginie skazany jest na wieczn� tu�aczk� po �wiecie. 
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_09"); //Mog� w jaki� spos�b uwolni� ci� od kl�twy?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_10"); //Musisz odnale�� i zniszczy� to przekl�te ostrze.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_11"); //Kto jest w jego posiadaniu?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_12"); //To Stra�nik �wi�tynny Gor Na Tokas.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_13"); //To nie b�dzie �atwa walka...
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_14"); //Wiem. Je�eli uda ci si� to zrobi�, b�dziesz musia� odnale�� o�tarz oczyszczenia i zniszczy� miecz.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_15"); //Gdzie znajd� taki o�tarz?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_16"); //Nie mam poj�cia. W zamierzch�ych czasach orkowie budowali takie o�tarze przy cmentarzyskach.
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_17"); //W�tpi�, �eby kt�ry� z nich si� zachowa�...
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_18"); //B�d� szuka� do skutku. 
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_19"); //Powodzenia.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Odnalaz�em my�liwego. Okazuje si�, �e ostrze od kt�rego zgin�� by�o przekl�te. Teraz skazany jest na wieczn� tu�aczk�. Chyba, �e odnajd� Gor Na Tokas'a i zniszcz� zakl�ty miecz, kt�ry posiada."); 

    B_GiveXP (50);
};
//========================================
//-----------------> TokasSwordDuch
//========================================

INSTANCE DIA_Duch_TokasSwordDuch (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_TokasSwordDuch_Condition;
   information  = DIA_Duch_TokasSwordDuch_Info;
   permanent	= FALSE;
   description	= "Mam miecz Tokasa.";
};

FUNC INT DIA_Duch_TokasSwordDuch_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_Sword))
    && (Npc_HasItems (other, Tokas_Sword) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_TokasSwordDuch_Info()
{
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_01"); //Mam miecz Tokasa.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_02"); //Jak uda�o ci si� tego dokona�?!
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_03"); //Zachowam to dla siebie.
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_04"); //Bardziej mnie obchodzi, co mam z tym teraz zrobi�.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_05"); //Masz w r�kach pot�n� i szybk� bro�, ale je�li chcesz uwolni� mnie od kl�twy, musisz j� zniszczy�.
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_06"); //Jak mam to zrobi�?
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_07"); //Musisz porozmawia� z jakim� magiem. Oni ci pomog�.
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_08"); //M�wi�e� co� o jakim� o�tarzu...
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_09"); //Tak. Do zniszczenia broni b�dzie wam potrzebny o�tarz oczyszczenia.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_10"); //I tu jest najwi�kszy problem. Od dawna nikt tych o�tarzy nie widzia�.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_11"); //Zw�aszcza w Kolonii...
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_12"); //Spr�buj� znale�� jaki� spos�b. Tymczasem udam si� do mag�w.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Pokaza�em miecz Biornowi (lub raczej temu czemu�, co po nim zosta�o). Musz� go teraz zanie�� do mag�w, kt�rzy pomog� mi dokona� procesu zniszczenia ostrza. Szkoda, bo to naprawd� dobry miecz..."); 
	CronosTalk_Sword = true;
    B_GiveXP (350);
};

//========================================
//-----------------> TokasFire
//========================================

INSTANCE DIA_Duch_TokasFire (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_TokasFire_Condition;
   information  = DIA_Duch_TokasFire_Info;
   permanent	= FALSE;
   description	= "Tokas kaza� mi ci� spali�.";
};

FUNC INT DIA_Duch_TokasFire_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_Dogadanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_TokasFire_Info()
{
    AI_Output (other, self ,"DIA_Duch_TokasFire_15_01"); //Tokas kaza� mi ci� spali�.
    AI_Output (self, other ,"DIA_Duch_TokasFire_03_02"); //Nie odebra�e� mu miecza?
    AI_Output (other, self ,"DIA_Duch_TokasFire_15_03"); //Nie, jest z nim zbyt silny. 
    AI_Output (self, other ,"DIA_Duch_TokasFire_03_04"); //A co je�eli to nie pomo�e i moja dusza wci�� b�dzie pot�piona?! Skazujesz mnie na wieczne nieszcz�cie!
	AI_Output (self, other ,"DIA_Duch_TokasFire_03_05"); //Nie mog� na to pozwoli�! Dobrze, �e wci�� mam m�j miecz!
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Powiedzia�em Biornowi, �e Gor Na Tokas kaza� mi spali� jego �yj�ce szcz�tki, aby uwolni� go od kl�twy. Niestety Biorn nie uwierzy� w moje intencje i zacz�� mnie atakowa�. Je�li to co m�wi� Tokas jest prawd� bezpo�rednia walka nie ma sensu. Powinienem si� wycofa� i zaatakowa� zwojami czar�w ognia. "); 
    B_GiveXP (350);
	CronosTalk_Sword = false;
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> PorzucMisje
//========================================

INSTANCE DIA_Duch_PorzucMisje (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 2;
   condition    = DIA_Duch_PorzucMisje_Condition;
   information  = DIA_Duch_PorzucMisje_Info;
   permanent	= FALSE;
   description	= "Nie zamierzam ci pomaga�.";
};

FUNC INT DIA_Duch_PorzucMisje_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Duch_TokasSwordDuch))
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    && (Npc_HasItems (other, Tokas_Sword) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_PorzucMisje_Info()
{
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_15_01"); //Nie zamierzam ci pomaga�.
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_15_02"); //Zachowam to ostrze dla siebie.
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_03_03"); //Nie r�b tego. Jego z�a moc ci� op�ta.
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_03_04"); //Trzeba je jak najszybciej zniszczy�.

    Info_ClearChoices		(DIA_Duch_PorzucMisje);
    Info_AddChoice		(DIA_Duch_PorzucMisje, "Tym ostrzem mog� wiele zmieni�. Mo�e pos�u�y� do walki ze z�em!", DIA_Duch_PorzucMisje_NIE);
    Info_AddChoice		(DIA_Duch_PorzucMisje, "Ta bro�... Masz racj�. Musz� j� zniszczy�.", DIA_Duch_PorzucMisje_TAK);
};

FUNC VOID DIA_Duch_PorzucMisje_NIE()
{
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_NIE_15_01"); //Tym ostrzem mog� wiele zmieni�. Mo�e pos�u�y� do walki ze z�em!
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_NIE_03_02"); //Op�ta ci� i zniszczy wszystko, o co dba�e�.
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_NIE_15_03"); //Pr�bujesz mnie oszuka�! To ty jeste� z�y.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Zachowa�em bro� dla siebie skazuj�c Biorna na wieczn� tu�aczk�. Chyba, �e znajd� inny spos�b, jak uwolni� jego dusz� od cierpie�.");
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_FAILED);
    MIS_NieSpelnionaZemsta = LOG_FAILED;
    Info_ClearChoices		(DIA_Duch_PorzucMisje);
    AI_StopProcessInfos	(self);
	CronosTalk_Sword = false;
};

FUNC VOID DIA_Duch_PorzucMisje_TAK()
{
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_TAK_15_01"); //Ta bro�... Masz racj�. Musz� j� zniszczy�.
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_TAK_03_02"); //Ruszaj czym pr�dzej, zanim ta bro� ca�kiem ci� op�ta.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Z�e my�li niemal zaw�adn�y mym umys�em. Jednak w por� uda�o mi si� otrz�sn��. ");
    Info_ClearChoices		(DIA_Duch_PorzucMisje);
    AI_StopProcessInfos	(self);
	CronosTalk_Sword = true;
};

//========================================
//-----------------> ENDMISSION
//========================================

INSTANCE DIA_Duch_ENDMISSION (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_ENDMISSION_Condition;
   information  = DIA_Duch_ENDMISSION_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Duch_ENDMISSION_Condition()
{
    if (SwordClear == true)
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_ENDMISSION_Info()
{
    AI_Output (self, other ,"DIA_Duch_ENDMISSION_03_01"); //Uda�o ci si�.
    AI_Output (other, self ,"DIA_Duch_ENDMISSION_15_02"); //Sk�d wiesz?
    AI_Output (self, other ,"DIA_Duch_ENDMISSION_03_03"); //Czuj� to. Dzi�kuj�, ch�opcze.
    B_GiveXP (450);
	B_LogEntry                     (CH1_NieSpelnionaZemsta,"Biorn mo�e spocz�� w spokoju. Kl�twa zosta�a zdj�ta. Mog� i�� i przekaza� dobr� wiadomo�� Magnusowi.");
    AI_StopProcessInfos	(self); 
	Npc_ExchangeRoutine (self, "die");
};
