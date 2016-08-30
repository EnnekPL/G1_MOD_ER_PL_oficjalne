//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Polykacz18_EXIT(C_INFO)
{
	npc             = STT_3918_Polykacz;
	nr              = 999;
	condition	= DIA_Polykacz18_EXIT_Condition;
	information	= DIA_Polykacz18_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Polykacz18_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Polykacz18_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Polykacz18_HELLO1 (C_INFO)
{
   npc          = STT_3918_Polykacz;
   nr           = 1;
   condition    = DIA_Polykacz18_HELLO1_Condition;
   information  = DIA_Polykacz18_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Polykacz18_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Polykacz18_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Po�ykacz18_ognia_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Po�ykacz18_ognia_HELLO1_03_02"); //Jestem Cieniem, dorabiam sobie jako po�ykacz ognia. Gomez p�aci mi osobi�cie za ka�dy pokaz.
    AI_Output (other, self ,"DIA_Po�ykacz18_ognia_HELLO1_03_03"); //To op�acalne?
    AI_Output (self, other ,"DIA_Po�ykacz18_ognia_HELLO1_03_04"); //Da si� z tego wy�y�, w ko�cu taka szycha jak Gomez te� musi mie� rozrywk� poza siedzeniem na tronie, no nie?
};