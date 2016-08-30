// *Script was make in Easy Dialog Maker (EDM)
var int polujvart ;
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Vart_EXIT(C_INFO)
{
	npc             = NON_3071_Vart;
	nr              = 999;
	condition	= DIA_Vart_EXIT_Condition;
	information	= DIA_Vart_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Vart_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Vart_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Vart_HELLO1 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 1;
   condition    = DIA_Vart_HELLO1_Condition;
   information  = DIA_Vart_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jeste� my�liwym?";
};

FUNC INT DIA_Vart_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Vart_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Vart_HELLO1_15_01"); //Jeste� my�liwym?
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_02"); //Tak, jestem czeladnikiem Cavalorna.
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_03"); //Nazywam si� Vart.
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_04"); //Jednak nie mog� ci� niczego nauczy�.
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_05"); //Zbyt s�abo si� na tym znam.
	polujvart = false;
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Vart_HELLO2 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 2;
   condition    = DIA_Vart_HELLO2_Condition;
   information  = DIA_Vart_HELLO2_Info;
   permanent	= FALSE;
   description	= "Sk�d si� tu wzi��e�?";
};

FUNC INT DIA_Vart_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Vart_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Vart_HELLO2_15_01"); //Sk�d si� tu wzi��e�?
    AI_Output (self, other ,"DIA_Vart_HELLO2_03_02"); //Kiedy� by�em Kopaczem, ale uciek�em z kopalni.
    AI_Output (self, other ,"DIA_Vart_HELLO2_03_03"); //Ca�y sw�j urobek odda�em jednemu Stra�nikowi za pomoc w ucieczce.
    AI_Output (other, self ,"DIA_Vart_HELLO2_15_04"); //Kim by� ten Stra�nik?
    AI_Output (self, other ,"DIA_Vart_HELLO2_03_05"); //Nazywa� si� Drake.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Vart_HELLO3 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 3;
   condition    = DIA_Vart_HELLO3_Condition;
   information  = DIA_Vart_HELLO3_Info;
   permanent	= true;
   description	= "Chod�my zapolowa�!";
};

FUNC INT DIA_Vart_HELLO3_Condition()
{
	if (polujvart == false)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Vart_HELLO3_Info()
{
	AI_Output (other, self ,"DIA_Vart_HELLO3_15_01"); //Chod�my zapolowa�!
	if (kapitel >= 2)
	{
    AI_Output (self, other ,"DIA_Vart_HELLO3_03_02"); //Bardzo ch�tnie. Prowad�!
    AI_Output (self, other ,"DIA_Vart_HELLO3_03_03"); //Tylko nie id� zbyt daleko.
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"follow");
	polujvart = true;
	}
	else
	{
	AI_Output (self, other ,"DIA_Vart_HELLO3_03_04"); //Chyba niezbyt wiele wiesz o walce, co? 
	AI_Output (self, other ,"DIA_Vart_HELLO3_03_05"); //Nie mam zamiaru ubija� potwor�w za ciebie.
	AI_Output (self, other ,"DIA_Vart_HELLO3_03_06"); //Przyjd�, gdy b�dziesz silniejszy. 
	};
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Vart_HELLO4 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 4;
   condition    = DIA_Vart_HELLO4_Condition;
   information  = DIA_Vart_HELLO4_Info;
   permanent	= true;
   description	= "Wracaj do domu.";
};

FUNC INT DIA_Vart_HELLO4_Condition()
{
    if (polujvart == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Vart_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Vart_HELLO4_15_01"); //Wracaj do domu.
    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
	self.aivar[AIV_PARTYMEMBER] = false;
	polujvart = false;
};

//========================================
//-----------------> PotionHeal
//========================================

INSTANCE DIA_Ash_PotionHeal (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 1;
   condition    = DIA_Ash_PotionHeal_Condition;
   information  = DIA_Ash_PotionHeal_Info;
   permanent	= true;
   description	= "We� t� mikstur� lecznicz�. ";
};

FUNC INT DIA_Ash_PotionHeal_Condition()
{
    if (polujvart == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ash_PotionHeal_Info()
{
    AI_Output (other, self ,"DIA_Ash_PotionHeal_15_01"); //We� t� mikstur� lecznicz�. 
	Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj �redni� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Big);
    };
	
  //  AI_StopProcessInfos	(self);
};
func void DIA_Ash_PotionHeal_BACK ()
{
Info_ClearChoices	(DIA_Ash_PotionHeal);	
};
func void DIA_Ash_PotionHeal_Small ()
{
        B_GiveInvItems (other, self, ItFo_Potion_Health_01, 1);
		AI_UseItem (self, ItFo_Potion_Health_01);
		Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj �redni� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Big);
    };
};
func void DIA_Ash_PotionHeal_Mid ()
{
        B_GiveInvItems (other, self, ItFo_Potion_Health_02, 1);
		AI_UseItem (self, ItFo_Potion_Health_02);
		Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj �redni� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Big);
    };
};
func void DIA_Ash_PotionHeal_Big ()
{
        B_GiveInvItems (other, self, ItFo_Potion_Health_03, 1);
		AI_UseItem (self, ItFo_Potion_Health_03);
		Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj �redni� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du�� mikstur� lecznicz�" ,DIA_Ash_PotionHeal_Big);
    };
};