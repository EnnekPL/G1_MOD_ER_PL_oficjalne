//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_CoErpresser_EXIT(C_INFO)
{
	npc             = ORG_889_CoErpresser;
	nr              = 999;
	condition		= DIA_CoErpresser_EXIT_Condition;
	information		= DIA_CoErpresser_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_CoErpresser_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CoErpresser_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pogadanka
//========================================

INSTANCE DIA_CoErpresser_Pogadanka (C_INFO)
{
   npc          = ORG_889_CoErpresser;
   nr           = 1;
   condition    = DIA_CoErpresser_Pogadanka_Condition;
   information  = DIA_CoErpresser_Pogadanka_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_CoErpresser_Pogadanka_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CoErpresser_Pogadanka_Info()
{
    AI_Output (other, self ,"DIA_CoErpresser_Pogadanka_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_CoErpresser_Pogadanka_03_02"); //Po co mi dup� zawracasz? Przecie� mo�esz przej��.
    AI_Output (self, other ,"DIA_CoErpresser_Pogadanka_03_03"); //Mi�ej pracy w Wolnej Kopalni!
};

//========================================
//-----------------> Myto
//========================================

INSTANCE DIA_CoErpresser_Myto (C_INFO)
{
   npc          = ORG_889_CoErpresser;
   nr           = 2;
   condition    = DIA_CoErpresser_Myto_Condition;
   information  = DIA_CoErpresser_Myto_Info;
   permanent	= FALSE;
   description	= "Po co w og�le zbieracie myto?";
};

FUNC INT DIA_CoErpresser_Myto_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CoErpresser_Myto_Info()
{
    AI_Output (other, self ,"DIA_CoErpresser_Myto_15_01"); //Po co w og�le zbieracie myto?
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_02"); //A dlaczego nie? Wed�ug nas konwoje ze Starego Obozu s� zbyt rzadko napadane.
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_03"); //A my lubimy dobre burdy, hehe.
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_04"); //Nawet nie masz poj�cia ilu ludzi t�dy przechodzi codziennie. Nie mo�emy jednak pobiera� myta w Obozie.
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_05"); //Lee przekona� Laresa, aby zabroni� nam napad�w na Kret�w. Szef ostatnio troch� za bardzo w�azi w dup� Najemnikom. 
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_06"); //Ale raz si� �yje! Tutaj nikt nas nie z�apie, w pobli�u jest sporo niez�ych kryj�wek.
};

