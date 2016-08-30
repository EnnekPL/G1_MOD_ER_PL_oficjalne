//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Clayde_EXIT(C_INFO)
{
	npc             = VLK_595_Clayde;
	nr              = 999;
	condition	= DIA_Clayde_EXIT_Condition;
	information	= DIA_Clayde_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Clayde_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Clayde_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Clayde_HELLO1 (C_INFO)
{
   npc          = VLK_595_Clayde;
   nr           = 1;
   condition    = DIA_Clayde_HELLO1_Condition;
   information  = DIA_Clayde_HELLO1_Info;
   permanent	= FALSE;
   description	= "Cze��!";
};

FUNC INT DIA_Clayde_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Clayde_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Clayde_HELLO1_15_01"); //Cze��!
    if (VLK_594_Bonie.aivar[AIV_WASDEFEATEDBYSC]==FALSE)	
    {
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_02"); //S�uchaj, to nasze podw�rko! Moje i Bonie! 
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_03"); //Zje�d�aj st�d zanim zrobi� z tob� porz�dek!
    }
    else
    {
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_04"); //Bij�c Bonie wpad�e� w powa�ne k�opoty!
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_05"); //Wkr�tce ci� dopadniemy!
        AI_StopProcessInfos	(self);
    };
};

