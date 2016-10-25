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
	AI_Output (self, other,"DIA_Bullit_First_06_00"); //Kogo my tu mamy? Czy to nie ta ofiara, któr¹ ochrzci³em wczeœniej? Czego chcesz? Przyszed³eœ po repetê? 
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
	description = "Przyszed³em pogruchotaæ ci szczêkê.";
};                       

FUNC int  DIA_Bullit_AufsMAul_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_AufsMAul_Info()
{
	AI_Output (other, self,"DIA_Bullit_AufsMAul_15_00"); //Przyszed³em pogruchotaæ ci szczêkê.
	AI_Output (self, other,"DIA_Bullit_AufsMAul_06_01"); //Ha! No to chodŸ tutaj i spróbuj szczêœcia, synku!
	
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
    AI_Output (self, other ,"DIA_Bullit_FIGHT_03_01"); //Ach... Widocznie Ÿle ciê oceni³em.
    AI_Output (other, self ,"DIA_Bullit_FIGHT_15_02"); //Masz racjê. Nie powinieneœ by³ mnie atakowaæ. Mam nadziejê, ¿e ta lekcja ciê czegoœ nauczy.
    AI_Output (self, other ,"DIA_Bullit_FIGHT_03_03"); //Tak, tak... A teraz wynoœ siê st¹d!
    B_LogEntry                     (CH1_Bulit,"Bullit dosta³ co mu siê nale¿a³o. Moja zemsta siê dokona³a. ");
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
    AI_Output (self, other ,"DIA_Bullit_LOSER_03_01"); //Czego siê spodziewa³eœ?
    AI_Output (self, other ,"DIA_Bullit_LOSER_03_02"); //¯e tak po prostu zaczniesz mnie biæ i ci nie oddam? Jesteœ ¿a³osny. ZejdŸ mi z oczu, ch³ystku. 
    B_LogEntry                     (CH1_Bulit,"Dosta³em niez³e bêcki od Bullita. Mo¿e jeszcze kiedyœ przyjdzie czas na zemstê. ");
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
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //Znowu ty?! Powinienem ciê utopiæ w jeziorze podczas naszego pierwszego spotkania!
	AI_Output (other, self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //Wtedy nie mia³em szans - teraz karta siê odwróci³a.
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //Ty gnido! Mam tylko nadziejê, ¿e bêdziesz trudniejszym przeciwnikiem ni¿ ostatnio!
		
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
    AI_Output (self, other ,"DIA_Bullit_LACHMYTA_03_01"); //A ty czego tu, œmieciu? Chcesz odœwie¿yæ wspomnienia? 
    AI_Output (other, self ,"DIA_Bullit_LACHMYTA_15_02"); //Thorus zaczyna siê zastanawiaæ, dlaczego w Obozie nie pojawiaj¹ siê nowi ludzie.
    AI_Output (self, other ,"DIA_Bullit_LACHMYTA_03_05"); //Ty jakoœ wtedy przyszed³eœ... Pamiêtasz?
	if (Npc_KnowsInfo (hero, DIA_Bullit_FIGHT))
	{
	AI_Output (other, self ,"DIA_Bullit_LACHMYTA_15_07"); //A mo¿e ja ci teraz coœ przypomnê? Jak skopa³em ci ostatnio dupê, co? Ju¿ nie pamiêtasz? 
	}
	else
	{
    AI_Output (other, self ,"DIA_Bullit_LACHMYTA_15_07"); //Jeszcze za wszystko zap³acisz!
	};
    B_LogEntry  (CH2_BullitBadass,"Na placu wymian spotka³em Bullita. Na szczêœcie nie dosz³o do konfrontacji.");
	Npc_ExchangeRoutine	(GRD_203_Bullit, "start");	
    AI_StopProcessInfos	(self);
};