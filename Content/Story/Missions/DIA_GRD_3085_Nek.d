//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Nek_EXIT(C_INFO)
{
	npc             = GRD_3085_Nek;
	nr              = 999;
	condition	= DIA_Nek_EXIT_Condition;
	information	= DIA_Nek_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Nek_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nek_HELLO1 (C_INFO)
{
   npc          = GRD_3085_Nek;
   nr           = 1;
   condition    = DIA_Nek_HELLO1_Condition;
   information  = DIA_Nek_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nek_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Nek_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Nek_HELLO1_03_01"); //Czego tu szukasz?
	AI_Output (other, self ,"DIA_Nek_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Nek_HELLO1_03_02"); //A co ci� to obchodzi?
	AI_Output (other, self ,"DIA_Nek_HELLO1_15_03"); //No dobra. W takim razie nie przeszkadzam...
    AI_Output (self, other ,"DIA_Nek_HELLO1_03_04"); //Masz racj�! Id� sobie!
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Exposed
//========================================

INSTANCE DIA_Nek_Exposed (C_INFO)
{
   npc          = GRD_3085_Nek;
   nr           = 1;
   condition    = DIA_Nek_Exposed_Condition;
   information  = DIA_Nek_Exposed_Info;
   permanent	= FALSE;
   description	= "W twojej chacie wisi zbroja Stra�nika.";
};

FUNC INT DIA_Nek_Exposed_Condition()
{
	if ((MIS_WheresNek == LOG_RUNNING) && Npc_KnowsInfo(hero,DIA_Fletcher_WoNek2))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nek_Exposed_Info()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_15_01"); //W twojej chacie wisi zbroja Stra�nika.
    AI_Output (self, other ,"DIA_Nek_Exposed_03_02"); //To... trofeum... 
	AI_Output (other, self ,"DIA_Nek_Exposed_15_03"); //Jasne... Daruj sobie, Nek. Przysy�aj� mnie twoi starzy przyjaciele. 
    AI_Output (self, other ,"DIA_Nek_Exposed_03_04"); //Co chcesz zrobi�?
	AI_Output (other, self ,"DIA_Nek_Exposed_15_05"); //Fletcher domaga si� twojej g�owy. Przypuszczam, �e reszta Stra�nik�w r�wnie�. Z kolei Snaf chce po prostu wiedzie�, gdzie jeste�.
	AI_Output (self, other ,"DIA_Nek_Exposed_03_06"); //S�uchaj, nie mam teraz zbyt du�o rudy. 100 bry�ek wystarczy? Nie m�w nikomu, �e mnie widzia�e�.
	
	Info_ClearChoices	(DIA_Nek_Exposed);
	Info_AddChoice		(DIA_Nek_Exposed, "Chc� trupa to b�d� go mieli.", DIA_Nek_Exposed_KILL);
	Info_AddChoice		(DIA_Nek_Exposed, "Umowa stoi. Powiem im, �e nie �yjesz.", DIA_Nek_Exposed_OK);
	Info_AddChoice		(DIA_Nek_Exposed, "To troch� za ma�o.", DIA_Nek_Exposed_MONEY);
	
	B_LogEntry               (CH1_WheresNek,"Znalaz�em Neka w Nowym Obozie. Ukry� si� w chacie Butcha. Na �cianie wisi zbroja cz�onka Starego Obozu. Stra�nik zaproponowa� mi uk�ad: ruda w zamian za �ycie.");	
	
	GRD_3085_Nek.name = "Nek";
};

func void DIA_Nek_Exposed_KILL ()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_KILL_15_01"); //Chc� trupa to b�d� go mieli.
    AI_Output (self, other ,"DIA_Nek_Exposed_KILL_03_02"); //Szkoda, �e nie masz w�asnego rozumu! 
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_LogEntry               (CH1_WheresNek,"Nie mia�em w planach dogadywa� si� z Nekiem. Za swoj� ucieczk� powinien zap�aci� g�ow�.");	
	
	Info_ClearChoices	(DIA_Nek_Exposed);
};

func void DIA_Nek_Exposed_OK ()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_OK_15_01"); //Umowa stoi. Powiem im, �e nie �yjesz.
    AI_Output (self, other ,"DIA_Nek_Exposed_OK_03_02"); //Rozs�dna decyzja. Da�bym ci wi�cej, ale nie mam. Naprawd�, dzi�ki. 
	
	B_LogEntry               (CH1_WheresNek,"Wzi��em od Neka 100 bry�ek rudy w zamian za trzymanie j�zyka za z�bami. Jednak to niczego nie zmienia. Decyzj� o tym, czy wydam Neka podejm� ju� w Starym Obozie.");	
	
	Info_ClearChoices	(DIA_Nek_Exposed);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
};

func void DIA_Nek_Exposed_MONEY ()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_MONEY_15_01"); //To troch� za ma�o.
    AI_Output (self, other ,"DIA_Nek_Exposed_MONEY_03_02"); //Wybacz kolego, ale nie mam ani bry�ki wi�cej. To jak, dogadamy si�?	
};

