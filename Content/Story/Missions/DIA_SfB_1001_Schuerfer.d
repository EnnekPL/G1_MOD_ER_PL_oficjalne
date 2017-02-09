// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sfb_1001_EXIT(C_INFO)
{
	npc			= SFB_1001_Schuerfer;
	nr			= 999;
	condition	= DIA_Sfb_1001_EXIT_Condition;
	information	= DIA_Sfb_1001_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sfb_1001_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Sfb_1001_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo - PERM
// ************************************************************

INSTANCE DIA_Sfb_1001_Hello(C_INFO)
{
	npc			= SFB_1001_Schuerfer;
	nr			= 1;
	condition	= DIA_Sfb_1001_Hello_Condition;
	information	= DIA_Sfb_1001_Hello_Info;
	permanent	= 1;
	description = "Co s³ychaæ w kopalni?";
};                       

FUNC INT DIA_Sfb_1001_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Sfb_1001_Hello_Info()
{	
	AI_Output (other, self,"DIA_Sfb_1001_Hello_15_00"); //Co s³ychaæ w kopalni?
	AI_Output (self, other,"DIA_Sfb_1001_Hello_02_01"); //Wiêkszoœæ roboty mamy ju¿ za sob¹. Jeszcze tylko kilka tygodni i bêdziemy mieli doœæ.
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Kopalnia
//========================================

INSTANCE DIA_Schuerfer_Kopalnia (C_INFO)
{
   npc          = SFB_1001_Schuerfer;
   nr           = 1;
   condition    = DIA_Schuerfer_Kopalnia_Condition;
   information  = DIA_Schuerfer_Kopalnia_Info;
   permanent	= FALSE;
   description	= "Szukam kogoœ do pracy w kopalni z³ota.";
};

FUNC INT DIA_Schuerfer_Kopalnia_Condition()
{
    if (MIS_GoldMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schuerfer_Kopalnia_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_Kopalnia_15_01"); //Szukam kogoœ do pracy w kopalni z³ota.
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_02"); //Dlaczego przychodzisz z tym do mnie?
    AI_Output (other, self ,"DIA_Schuerfer_Kopalnia_15_03"); //Pomyœla³em, ¿e wolisz kopaæ z³oto ni¿ rudê...
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_04"); //To dobrze myœla³eœ.
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_05"); //Jednak prawie w ogóle mnie nie znasz. Zreszt¹ ja ciebie te¿.
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_06"); //Powinieneœ bardziej uwa¿aæ.
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_07"); //Przyk³adowo taki Swiney wygl¹da na porz¹dnego cz³owieka.
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_08"); //A okazuje siê, ¿e to krêtacz i oszust.
    AI_Output (self, other ,"DIA_Schuerfer_Kopalnia_03_09"); //Gdzie jest ta kopalnia?
    AI_Output (other, self ,"DIA_Schuerfer_Kopalnia_15_10"); //To nie takie proste! 
    AI_Output (other, self ,"DIA_Schuerfer_Kopalnia_15_11"); //Wszyscy zbieramy siê na górnym piêtrze karczmy. Tam ci wszystko wyjaœnimy.
	B_LogEntry                     (CH2_GoldMine,"Zaproponowa³em Shutferowi pracê w kopalni z³ota. Przestrzeg³ mnie przed Swineyem. Na szczêœcie Shutfer to uczciwy cz³owiek, ale na przysz³oœæ powinienem bardziej uwa¿aæ.");
    B_GiveXP (50);
	Npc_ExchangeRoutine (self, "karczma");
};

//========================================
//-----------------> GOR_NA_LIN
//========================================

INSTANCE DIA_Schuerfer_GOR_NA_LIN (C_INFO)
{
   npc          = SFB_1001_Schuerfer;
   nr           = 1;
   condition    = DIA_Schuerfer_GOR_NA_LIN_Condition;
   information  = DIA_Schuerfer_GOR_NA_LIN_Info;
   permanent	= FALSE;
   description	= "Powiesz mi coœ ciekawego o Gor Na Linie?";
};

FUNC INT DIA_Schuerfer_GOR_NA_LIN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaLin_HELLO1))
    && (MIS_MissedSpy == LOG_RUNNING)
	&& ((MIS_GoldMine != LOG_RUNNING) || (MIS_GoldMine != LOG_SUCCESS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schuerfer_GOR_NA_LIN_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_GOR_NA_LIN_15_01"); //Powiesz mi coœ ciekawego o Gor Na Linie?
    AI_Output (self, other ,"DIA_Schuerfer_GOR_NA_LIN_03_02"); //Ja? Ja nic nie wiem.
    AI_Output (self, other ,"DIA_Schuerfer_GOR_NA_LIN_03_03"); //Nie obchodzi mnie ten goœæ. Odczep siê. 
    B_LogEntry                     (CH2_MissedSpy,"Shutfer nie powiedzia³ mi nic ciekawego o Gor Na Linie.");
    AI_StopProcessInfos	(self);
};