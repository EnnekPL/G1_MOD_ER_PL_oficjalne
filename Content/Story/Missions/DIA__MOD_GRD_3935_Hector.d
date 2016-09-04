//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hector_EXIT(C_INFO)
{
	npc             = GRD_3935_Hector;
	nr              = 999;
	condition		= DIA_Hector_EXIT_Condition;
	information		= DIA_Hector_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hector_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hector_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Hector_HELLO1 (C_INFO)
{
   npc          = GRD_3935_Hector;
   nr           = 1;
   condition    = DIA_Hector_HELLO1_Condition;
   information  = DIA_Hector_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Hector_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hector_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hector_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Hector_HELLO1_03_02"); //Nazywam si� Skelden. Jestem dow�dc� �elaznej Garoty. 
	AI_Output (other, self ,"DIA_Hector_HELLO1_15_03"); //Chcia�bym si� dowiedzie� wi�cej o Starym Obozie. M�g�bym z tob� porozmawia�?
	AI_Output (self, other ,"DIA_Hector_HELLO1_03_04"); //W sumie to m�g�by�. Czemu nie? Pytaj o co chcesz.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Hector_HELLO2 (C_INFO)
{
   npc          = GRD_3935_Hector;
   nr           = 2;
   condition    = DIA_Hector_HELLO2_Condition;
   information  = DIA_Hector_HELLO2_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi co� wi�cej o tej �elaznej Garocie.";
};

FUNC INT DIA_Hector_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hector_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hector_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Hector_HELLO2_15_01"); //Opowiedz mi co� wi�cej o tej �elaznej Garocie.
    AI_Output (self, other ,"DIA_Hector_HELLO2_03_02"); //�elazna Garota to formacja sk�adaj�ca si� z najwierniejszych i najlepiej wyszkolonych Stra�nik�w w ca�ym Starym Obozie.
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_03"); //Naszym zadaniem jest dbanie o bezpiecze�stwo Magnat�w i porz�dek w g��wnej sali. Tylko najlepsi mog� nale�e� do grupy. 
	AI_Output (other, self ,"DIA_Hector_HELLO2_15_04"); //Sk�d ta charakterystyczna nazwa?
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_05"); //Wi��e si� z tym ciekawa historia. Nazwa pochodzi od przezwiska Felgora - pierwszego przyw�dcy Garotnik�w.
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_06"); //Wo�ano na niego �elazna Garota, bo podczas buntu zabi� wysokiego oficera armii kr�lewskiej przy u�yciu kajdan. 
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_07"); //Po prostu zarzuci� mu je na szyj� i bezwzgl�dnie go udusi�. Gomez zawsze lubi� Felgora wi�c, gdy organizowa� stra� przyboczn�, postawi� go na jej czele. 
	AI_Output (other, self ,"DIA_Hector_HELLO2_15_08"); //Gdzie jest teraz Felgor?
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_09"); //W innym, lepszym �wiecie. Poprzedzaj�c kolejne pytanie powiem, �e zgin�� podczas wykonywania misji. 
	AI_Output (other, self ,"DIA_Hector_HELLO2_15_10"); //Jakiej misji?
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_11"); //Do�� ju� tych pyta�. Spadaj st�d! Musz� wraca� do pracy. 
};

//========================================
//-----------------> JOB
//========================================

INSTANCE DIA_Hector_JOB (C_INFO)
{
   npc          = GRD_3935_Hector;
   nr           = 2;
   condition    = DIA_Hector_JOB_Condition;
   information  = DIA_Hector_JOB_Info;
   permanent	= FALSE;
   description	= "Czym si� tutaj zajmujesz?";
};

FUNC INT DIA_Hector_JOB_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hector_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hector_JOB_Info()
{
    AI_Output (other, self ,"DIA_Hector_JOB_15_01"); //Czym si� tutaj zajmujesz?
    AI_Output (self, other ,"DIA_Hector_JOB_03_02"); //Do moich obowi�zk�w nale�y taktyczne planowanie atak�w oraz obrony przed bandytami Quentina i tymi z Nowego Obozu.
	if (Npc_GetTrueGuild(hero) != GIL_BAU) || (Npc_GetTrueGuild(hero) != GIL_ORG) || (Npc_GetTrueGuild(hero) != GIL_SLD) ||(Npc_GetTrueGuild(hero) != GIL_KDW) || (Npc_GetTrueGuild(hero) != GIL_SFB)  {
	AI_Output (other, self ,"DIA_Hector_JOB_15_03"); //S� bardzo uci��liwi?
	AI_Output (self, other ,"DIA_Hector_JOB_03_04"); //Czasem daj� si� mocno we znaki morduj�c znienacka ludzi i rabuj�c skrzynie z rud�. Ale kiedy� przyjdzie temu kres...
	};
};
