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
    AI_Output (self, other ,"DIA_Bonie_WARN_03_03"); //Nikt nie przejdzie bez op�aty w wysoko�ci 20 bry�ek rudy. P�acisz albo zje�d�aj.

    Info_ClearChoices		(DIA_Bonie_WARN);
    Info_AddChoice		(DIA_Bonie_WARN, "Nie masz prawa pobiera� op�at!", DIA_Bonie_WARN_LAW);
    Info_AddChoice		(DIA_Bonie_WARN, "Zaraz usun� ci� z drogi!", DIA_Bonie_WARN_FIGHT);
    Info_AddChoice		(DIA_Bonie_WARN, "Oto 20 bry�ek rudy.", DIA_Bonie_WARN_PAY);
};

FUNC VOID DIA_Bonie_WARN_LAW()
{
    AI_Output (other, self ,"DIA_Bonie_WARN_LAW_15_01"); //Nie masz prawa pobiera� op�at!
    AI_Output (self, other ,"DIA_Bonie_WARN_LAW_03_02"); //Szakal to m�j dobry przyjaciel. Mo�esz go spyta�, co o tym s�dzi.
};

FUNC VOID DIA_Bonie_WARN_FIGHT()
{
    AI_Output (other, self ,"DIA_Bonie_WARN_FIGHT_15_01"); //Zaraz usun� ci� z drogi!
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
    AI_Output (other, self ,"DIA_Bonie_WARN_PAY_15_01"); //Oto 20 bry�ek rudy.
	if (Npc_HasItems (other,ITMINUGGET) >= 20)
	{
    AI_Output (self, other ,"DIA_Bonie_WARN_PAY_03_02"); //No dobra. Mo�esz przej��.
    B_GiveInvItems (other, self, ItMiNugget, 20);
    Info_ClearChoices		(DIA_Bonie_WARN);
	self.aivar[AIV_HAS_ERPRESSED] = 1;
    AI_StopProcessInfos	(self);
	}
	else
	{
	AI_Output (self, other ,"DIA_Bonie_WARN_PAY_03_03"); //Jak mi przykro... Nie widz� tu 20 bry�ek.
	Info_ClearChoices		(DIA_Bonie_WARN);
	
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
};
// ****************** f�r HAS_ERPRESSED == 2 (Aufs Maul) *********************

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
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) 
	&&  (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsAufsMaulBonie_Info()
{
	AI_Output (self, other,"Info_BereitsAufsMaulBonie_Info_13_02"); //Spadaj, wkr�tce Szakal ci� dopadnie!
};

// ****************** f�r HAS_ERPRESSED == 1 (gezahlt) *********************

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
	AI_Output (self, other,"Info_BereitsBonie_Info_13_02"); //Zap�aci�e� - mo�esz przej��. No, ruszaj si�!
};