//poprawione i sprawdzone - Nocturn

//******************************************
//					EXIT	
//******************************************

instance  DIA_Bullit_Exit (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 999;
	condition	= DIA_Bullit_Exit_Condition;
	information	= DIA_Bullit_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Bullit_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					First	
//******************************************

instance  DIA_Bullit_First (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_First_Condition;
	information	= DIA_Bullit_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int  DIA_Bullit_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_First_Info()
{
	AI_Output (self, other,"DIA_Bullit_First_06_00"); //Kogo my tu mamy? Czy to nie ta ofiara, kt�r� ochrzci�em wcze�niej? Czego chcesz? Przyszed�e� po repet�? 
};

//******************************************
//				Aufs Maul
//******************************************

instance  DIA_Bullit_AufsMAul (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_AufsMAul_Condition;
	information	= DIA_Bullit_AufsMAul_Info;
	permanent	= 0;
	description = "Przyszed�em pogruchota� ci szcz�k�.";
};                       

FUNC int  DIA_Bullit_AufsMAul_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_AufsMAul_Info()
{
	AI_Output (other, self,"DIA_Bullit_AufsMAul_15_00"); //Przyszed�em pogruchota� ci szcz�k�.
	AI_Output (self, other,"DIA_Bullit_AufsMAul_06_01"); //Ha! No to chod� tutaj i spr�buj szcz�cia, synku!
	
	//Npc_SetAttitude 		( self, ATT_HOSTILE );
	//Npc_SetTempAttitude 	( self, ATT_HOSTILE );
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other); 
	AI_StartState (self, ZS_Attack, 1, "");
};

//========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_Bullit_FIGHT (C_INFO)
{
   npc          = GRD_203_Bullit;
   nr           = 1;
   condition    = DIA_Bullit_FIGHT_Condition;
   information  = DIA_Bullit_FIGHT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bullit_FIGHT_Condition()
{
    if (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    && (Npc_KnowsInfo (hero, DIA_Bullit_AufsMAul))
	&& (!Npc_KnowsInfo (hero, DIA_Bullit_LOSER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bullit_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Bullit_FIGHT_03_01"); //Ach... Widocznie �le ci� oceni�em.
    AI_Output (other, self ,"DIA_Bullit_FIGHT_15_02"); //Masz racj�. Nie powiniene� by� mnie atakowa�. Mam nadziej�, �e ta lekcja ci� czego� nauczy.
    AI_Output (self, other ,"DIA_Bullit_FIGHT_03_03"); //Tak, tak... A teraz wyno� si� st�d!
    B_LogEntry                     (CH1_Bulit,"Bullit dosta� co mu si� nale�a�o. Moja zemsta si� dokona�a. ");
    Log_SetTopicStatus       (CH1_Bulit, LOG_SUCCESS);
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOSER
//========================================

INSTANCE DIA_Bullit_LOSER (C_INFO)
{
   npc          = GRD_203_Bullit;
   nr           = 2;
   condition    = DIA_Bullit_LOSER_Condition;
   information  = DIA_Bullit_LOSER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bullit_LOSER_Condition()
{
    if (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
	&& (!Npc_KnowsInfo (hero, DIA_Bullit_FIGHT))
    && (Npc_KnowsInfo (hero, DIA_Bullit_AufsMAul))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bullit_LOSER_Info()
{
    AI_Output (self, other ,"DIA_Bullit_LOSER_03_01"); //Czego si� spodziewa�e�?
    AI_Output (self, other ,"DIA_Bullit_LOSER_03_02"); //�e tak po prostu zaczniesz mnie bi� i ci nie oddam? Jeste� �a�osny. Zejd� mi z oczu, ch�ystku. 
    B_LogEntry                     (CH1_Bulit,"Dosta�em niez�e b�cki od Bullita. Mo�e jeszcze kiedy� przyjdzie czas na zemst�. ");
    Log_SetTopicStatus       (CH1_Bulit, LOG_FAILED);
    AI_StopProcessInfos	(self);
};


// *****************************************************
// 				Wartet auf den SC
// *****************************************************

instance  DIA_GRD_203_Bullit_Wait4SC (C_INFO)
{
	npc				= GRD_203_Bullit;
	condition		= DIA_GRD_203_Bullit_Wait4SC_Condition;
	information		= DIA_GRD_203_Bullit_Wait4SC_Info;
	important		= 1;	
	permanent		= 0;
};

FUNC int  DIA_GRD_203_Bullit_Wait4SC_Condition()
{	
	if( Npc_KnowsInfo (hero, Info_Xardas_LOADSWORD02 ) )
	{
		return 1;
	};
};

func void  DIA_GRD_203_Bullit_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //Znowu ty?! Powinienem ci� utopi� w jeziorze podczas naszego pierwszego spotkania!
	AI_Output (other, self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //Wtedy nie mia�em szans - teraz karta si� odwr�ci�a.
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //Ty gnido! Mam tylko nadziej�, �e b�dziesz trudniejszym przeciwnikiem ni� ostatnio!
		
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_GRD;
	Npc_SetTrueGuild	( self, GIL_GRD );	

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );
	
	Npc_SetTarget 	( self, other ); 
	AI_StartState 	( self, ZS_Attack, 1, "");
}; 
//========================================
//-----------------> LACHMYTA
//========================================

INSTANCE DIA_Bullit_LACHMYTA (C_INFO)
{
   npc          = GRD_203_Bullit;
   nr           = 1;
   condition    = DIA_Bullit_LACHMYTA_Condition;
   information  = DIA_Bullit_LACHMYTA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bullit_LACHMYTA_Condition()
{
    if (Npc_GetDistToWP (self, "WP_INTRO_WI06") < 1500)
    //&& (Npc_KnowsInfo (hero, DIA_Cutter_SzukaszBulita)) po co?
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bullit_LACHMYTA_Info()
{
    AI_Output (self, other ,"DIA_Bullit_LACHMYTA_03_01"); //A ty czego tu, �mieciu? Chcesz od�wie�y� wspomnienia? 
    AI_Output (other, self ,"DIA_Bullit_LACHMYTA_15_02"); //Thorus zaczyna si� zastanawia�, dlaczego w Obozie nie pojawiaj� si� nowi ludzie.
    AI_Output (self, other ,"DIA_Bullit_LACHMYTA_03_05"); //Ty jako� wtedy przyszed�e�... Pami�tasz?
	if (Npc_KnowsInfo (hero, DIA_Bullit_FIGHT))
	{
	AI_Output (other, self ,"DIA_Bullit_LACHMYTA_15_07"); //A mo�e ja ci teraz co� przypomn�? Jak skopa�em ci ostatnio dup�, co? Ju� nie pami�tasz? 
	}
	else
	{
    AI_Output (other, self ,"DIA_Bullit_LACHMYTA_15_07"); //Jeszcze za wszystko zap�acisz!
	};
    B_LogEntry  (CH2_BullitBadass,"Na placu wymian spotka�em Bullita. Na szcz�cie nie dosz�o do konfrontacji.");
	Npc_ExchangeRoutine	(GRD_203_Bullit, "start");	
    AI_StopProcessInfos	(self);
};