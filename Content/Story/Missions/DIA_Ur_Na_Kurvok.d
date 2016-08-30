// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Kurvok_EXIT(C_INFO)
{
	npc             = Ur_Na_Kurvok;
	nr              = 999;
	condition	= DIA_Kurvok_EXIT_Condition;
	information	= DIA_Kurvok_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Kurvok_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurvok_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Kurvok_HELLO1 (C_INFO)
{
   npc          = Ur_Na_Kurvok;
   nr           = 1;
   condition    = DIA_Kurvok_HELLO1_Condition;
   information  = DIA_Kurvok_HELLO1_Info;
   permanent	= FALSE;
   description	= "Mog� z tob� walczy�?";
};

FUNC INT DIA_Kurvok_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Kurvok_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Kurvok_HELLO1_15_01"); //Mog� z tob� walczy�?
    AI_Output (self, other ,"DIA_Kurvok_HELLO1_03_02"); //Nie, Obcy! Ty zgin�� raz dwa. Ludzie s�abi!
    AI_Output (self, other ,"DIA_Kurvok_HELLO1_03_03"); //Arena chwa�y tylko dla ork, kt�ry by� s�ug� KRUSHAK.
    AI_StopProcessInfos	(self);
};

