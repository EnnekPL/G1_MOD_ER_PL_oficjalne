//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================
//edit by Nocturn

INSTANCE DIA_Raeuber_EXIT(C_INFO)
{
	npc             = NON_5050_Raeuber;
	nr              = 999;
	condition	= DIA_Raeuber_EXIT_Condition;
	information	= DIA_Raeuber_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Raeuber_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Raeuber_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
var int oszukany99;
//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Raeuber_HELLO (C_INFO)
{
   npc          = NON_5050_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_HELLO_Condition;
   information  = DIA_Raeuber_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Raeuber_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_HELLO_03_01"); //Ej, cz�owieku!
    AI_Output (other, self ,"DIA_Raeuber_HELLO_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Raeuber_HELLO_03_03"); //Tam, w jaskini znalaz�em skarb. Jednak stadko kretoszczur�w nie pozwala mi wej��.
    AI_Output (self, other ,"DIA_Raeuber_HELLO_03_04"); //Pom� mi je zabi�, a podziel� si� zyskami.

    Info_ClearChoices		(DIA_Raeuber_HELLO);
    Info_AddChoice		(DIA_Raeuber_HELLO, "Dobra, chod�my.", DIA_Raeuber_HELLO_OK);
    Info_AddChoice		(DIA_Raeuber_HELLO, "Spadaj.", DIA_Raeuber_HELLO_WON);
};

FUNC VOID DIA_Raeuber_HELLO_OK()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO_OK_15_01"); //Dobra. Chod�my.
    AI_Output (self, other ,"DIA_Raeuber_HELLO_OK_03_02"); //Id� za mn�!
    Info_ClearChoices		(DIA_Raeuber_HELLO);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	oszukany99 = true;
    Npc_ExchangeRoutine (self,"go");
    AI_StopProcessInfos	(self);
	
	Npc_SetTrueGuild (NON_5052_Raeuber,GIL_NONE );
	NON_5052_Raeuber.guild = GIL_NONE;
	
	Npc_SetTrueGuild (NON_5051_Raeuber,GIL_NONE );
	NON_5051_Raeuber.guild = GIL_NONE;
};

FUNC VOID DIA_Raeuber_HELLO_WON()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO_WON_15_01"); //Spadaj.
    AI_Output (self, other ,"DIA_Raeuber_HELLO_WON_03_02"); //Jeste� g�upcem.
	oszukany99 = false; 
    Info_ClearChoices		(DIA_Raeuber_HELLO);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DUREN
//========================================

INSTANCE DIA_Raeuber_DUREN (C_INFO)
{
   npc          = NON_5050_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_DUREN_Condition;
   information  = DIA_Raeuber_DUREN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_DUREN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO))
    && (Npc_GetDistToWP (self, "BANDITOS01") < 1000)
    && (oszukany99 == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_DUREN_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_DUREN_03_01"); //Co za dure�! Jeste� strasznie �atwowierny, wiesz? 
    AI_Output (self, other ,"DIA_Raeuber_DUREN_03_02"); //Bra� go ch�opcy!
    AI_Output (other, self ,"DIA_Raeuber_DUREN_15_03"); //Zobaczymy, kto b�dzie zbiera� z�by z pod�ogi.
    AI_DrawWeapon (other);
         
	B_SetPermAttitude	(NON_5050_Raeuber,	ATT_HOSTILE);
	B_SetPermAttitude	(NON_5051_Raeuber,	ATT_HOSTILE);    
	B_SetPermAttitude	(NON_5052_Raeuber,	ATT_HOSTILE);   
	
    AI_StopProcessInfos	(self);
	
	if (kapitel < 4)
	{
	Npc_SetTrueGuild (self,GIL_DMB );
	self.guild = GIL_DMB;
	
	Npc_SetTrueGuild (NON_5052_Raeuber,GIL_DMB );
	NON_5052_Raeuber.guild = GIL_DMB;
	
	Npc_SetTrueGuild (NON_5051_Raeuber,GIL_DMB );
	NON_5051_Raeuber.guild = GIL_DMB;
	}
	else
	{
	Npc_SetTrueGuild (self,GIL_GRD );
	self.guild = GIL_GRD;
	
	Npc_SetTrueGuild (NON_5052_Raeuber,GIL_GRD );
	NON_5052_Raeuber.guild = GIL_GRD;
	
	Npc_SetTrueGuild (NON_5051_Raeuber,GIL_GRD );
	NON_5051_Raeuber.guild = GIL_GRD;
	};
};