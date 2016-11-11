//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bonie_EXIT(C_INFO)
{
	npc             = VLK_594_Bonie;
	nr              = 999;
	condition	= DIA_Bonie_EXIT_Condition;
	information	= DIA_Bonie_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bonie_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bonie_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WARN
//========================================

INSTANCE DIA_Bonie_WARN (C_INFO)
{
   npc          = VLK_594_Bonie;
   nr           = 1;
   condition    = DIA_Bonie_WARN_Condition;
   information  = DIA_Bonie_WARN_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Bonie_WARN_Condition()
{
	if ((Npc_GetAttitude(self,other)!=ATT_FRIENDLY) 
	&& 	(self.aivar[AIV_HAS_ERPRESSED]==FALSE) 
	&& 	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)	)
	&& (Npc_GetDistToWP(self, "OCR_TO_HUT_53")<1000)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bonie_WARN_Info()
{
    AI_Output (self, other ,"DIA_Bonie_WARN_03_01"); //Gdzie leziesz?
    AI_Output (other, self ,"DIA_Bonie_WARN_15_02"); //Do tamtych chat?
    AI_Output (self, other ,"DIA_Bonie_WARN_03_03"); //Nikt nie przejdzie bez op³aty w wysokoœci 20 bry³ek rudy. P³acisz albo zje¿d¿aj.

    Info_ClearChoices		(DIA_Bonie_WARN);
    Info_AddChoice		(DIA_Bonie_WARN, "Nie masz prawa pobieraæ op³at!", DIA_Bonie_WARN_LAW);
    Info_AddChoice		(DIA_Bonie_WARN, "Zaraz usunê ciê z drogi!", DIA_Bonie_WARN_FIGHT);
    Info_AddChoice		(DIA_Bonie_WARN, "Oto 20 bry³ek rudy.", DIA_Bonie_WARN_PAY);
};

FUNC VOID DIA_Bonie_WARN_LAW()
{
    AI_Output (other, self ,"DIA_Bonie_WARN_LAW_15_01"); //Nie masz prawa pobieraæ op³at!
    AI_Output (self, other ,"DIA_Bonie_WARN_LAW_03_02"); //Szakal to mój dobry przyjaciel. Mo¿esz go spytaæ, co o tym s¹dzi.
};

FUNC VOID DIA_Bonie_WARN_FIGHT()
{
    AI_Output (other, self ,"DIA_Bonie_WARN_FIGHT_15_01"); //Zaraz usunê ciê z drogi!
    AI_Output (self, other ,"DIA_Bonie_WARN_FIGHT_03_02"); //Ha ha! Kolejny cwaniaczek!
    Info_ClearChoices		(DIA_Bonie_WARN);
	
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Bonie_WARN_PAY()
{
    AI_Output (other, self ,"DIA_Bonie_WARN_PAY_15_01"); //Oto 20 bry³ek rudy.
	if (Npc_HasItems (other,ITMINUGGET) >= 20)
	{
    AI_Output (self, other ,"DIA_Bonie_WARN_PAY_03_02"); //No dobra. Mo¿esz przejœæ.
    B_GiveInvItems (other, self, ItMiNugget, 20);
    Info_ClearChoices		(DIA_Bonie_WARN);
	self.aivar[AIV_HAS_ERPRESSED] = 1;
    AI_StopProcessInfos	(self);
	}
	else
	{
	AI_Output (self, other ,"DIA_Bonie_WARN_PAY_03_03"); //Jak mi przykro... Nie widzê tu 20 bry³ek.
	Info_ClearChoices		(DIA_Bonie_WARN);
	
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
};
// ****************** für HAS_ERPRESSED == 2 (Aufs Maul) *********************

INSTANCE Info_BereitsAufsMaulBonie (C_INFO)
{
	npc			= VLK_594_Bonie;
	nr			= 1;
	condition	= Info_BereitsAufsMaulBonie_Condition;
	information	= Info_BereitsAufsMaulBonie_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_BereitsAufsMaulBonie_Condition()
{
	if ((self.aivar[AIV_HAS_ERPRESSED]==2)
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	&&  (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsAufsMaulBonie_Info()
{
	AI_Output (self, other,"Info_BereitsAufsMaulBonie_Info_13_02"); //Spadaj, wkrótce Szakal ciê dopadnie!
};

// ****************** für HAS_ERPRESSED == 1 (gezahlt) *********************

INSTANCE Info_BereitsBonie (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_BereitsBonie_Condition;
	information	= Info_BereitsBonie_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_BereitsBonie_Condition()
{
	if ( (self.aivar[AIV_HAS_ERPRESSED]==1) && (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsBonie_Info()
{
	AI_Output (self, other,"Info_BereitsBonie_Info_13_02"); //Zap³aci³eœ - mo¿esz przejœæ. No, ruszaj siê!
};