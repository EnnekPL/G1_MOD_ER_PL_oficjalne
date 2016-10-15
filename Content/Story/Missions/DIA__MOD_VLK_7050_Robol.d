//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Robol_EXIT(C_INFO)
{
	npc             = VLK_7050_Robol;
	nr              = 999;
	condition	= DIA_Robol_EXIT_Condition;
	information	= DIA_Robol_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Robol_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Robol_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HOWAREU
//========================================

INSTANCE DIA_Robol_HOWAREU (C_INFO)
{
   npc          = VLK_7050_Robol;
   nr           = 1;
   condition    = DIA_Robol_HOWAREU_Condition;
   information  = DIA_Robol_HOWAREU_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Robol_HOWAREU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Robol_HOWAREU_Info()
{
    AI_Output (other, self ,"DIA_Robol_HOWAREU_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Robol_HOWAREU_03_02"); //Zm�czonym cz�owiekiem o imieniu Torkel. Czego chcesz?
    AI_Output (other, self ,"DIA_Robol_HOWAREU_15_03"); //Nad czym tak pracujesz, Torkel?
    AI_Output (self, other ,"DIA_Robol_HOWAREU_03_04"); //Budujemy rusztowanie po kt�rym wkr�tce b�dzie chodzi� kilku kolejnych robotnik�w. Gomez wyda� polecenie odbudowy wie�y.
    AI_Output (self, other ,"DIA_Robol_HOWAREU_03_05"); //Nie wiem po jak� choler�, ale rozkaz to rozkaz.
    AI_Output (other, self ,"DIA_Robol_HOWAREU_15_06"); //To chyba lepsze ni� praca w kopalniach?
    AI_Output (self, other ,"DIA_Robol_HOWAREU_03_07"); //Jasne, �e tak. Przy okazji mo�na dorobi� sprzedaj�c jakie� graty z budowy. Gwo�dzie, kilofy i takie tam. 
    AI_Output (self, other ,"DIA_Robol_HOWAREU_03_08"); //Jakby� kiedy� potrzebowa� kilku sztuk gwo�dzi, to wiesz, gdzie mnie szuka�. 
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Robol_HELLO1 (C_INFO)
{
   npc          = VLK_7050_Robol;
   nr           = 1;
   condition    = DIA_Robol_HELLO1_Condition;
   information  = DIA_Robol_HELLO1_Info;
   permanent	= FALSE;
   description	= "Masz mo�e gwo�dzie?";
};

FUNC INT DIA_Robol_HELLO1_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Firn_Palisada))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robol_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Robol_HELLO1_15_01"); //Masz mo�e gwo�dzie?
    AI_Output (self, other ,"DIA_Robol_HELLO1_03_02"); //Sprzedam ci worek gwo�dzi za 15 bry�ek rudy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Robol_HELLO2 (C_INFO)
{
   npc          = VLK_7050_Robol;
   nr           = 2;
   condition    = DIA_Robol_HELLO2_Condition;
   information  = DIA_Robol_HELLO2_Info;
   permanent	= FALSE;
   description	= "Daj mi te gwo�dzie.";
};

FUNC INT DIA_Robol_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Robol_HELLO1))
    && (Npc_HasItems (hero, ItMiNugget)>=15)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Robol_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Robol_HELLO2_15_01"); //Daj mi te gwo�dzie.
    AI_Output (self, other ,"DIA_Robol_HELLO2_03_02"); //Jasne.
    CreateInvItems (self, ItMi_Worek_Gwozdzie, 1);
    B_GiveInvItems (self, other, ItMi_Worek_Gwozdzie, 1);
    B_GiveInvItems (other, self, ItMiNugget, 15);
    AI_StopProcessInfos	(self);
};