//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  STT_300_Alberto_Exit (C_INFO)
{
	npc			=  STT_300_Alberto;
	nr			= 999;
	condition	=  STT_300_Alberto_Exit_Condition;
	information	=  STT_300_Alberto_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_300_Alberto_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  STT_300_Alberto_BUY (C_INFO)
{
	npc				= STT_300_Alberto;
	condition		= STT_300_Alberto_BUY_Condition;
	information		= STT_300_Alberto_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	Trade			= 1;
};

FUNC int  STT_300_Alberto_BUY_Condition()
{
	return 1;
};


FUNC void  STT_300_Alberto_BUY_Info()
{
	AI_Output (other, self,"STT_300_Alberto_BUY_Info_15_01"); //Mo�e masz co�, co chcia�by� sprzeda�?
	AI_Output (self, other,"STT_300_Alberto_BUY_Info_12_02"); //Jasne. Co tylko zechcesz... Je�li masz do�� rudy.
	var int log_tradealberto;
	if log_tradealberto == false
	{
	log_tradealberto = true;
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Kupiec Alberto handluje przedmiotami, kt�re mog� mi si� przyda� w kopalni. Znajd� go w pobli�u Iana."); 
	};
	
};

//========================================
//-----------------> STORY_OF_TRADER
//========================================

INSTANCE DIA_Alberto_STORY_OF_TRADER (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 1;
   condition    = DIA_Alberto_STORY_OF_TRADER_Condition;
   information  = DIA_Alberto_STORY_OF_TRADER_Info;
   permanent	= FALSE;
   description	= "Widz�, �e znasz si� na handlu. Sk�d pochodzisz?";
};

FUNC INT DIA_Alberto_STORY_OF_TRADER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alberto_STORY_OF_TRADER_Info()
{
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_01"); //Widz�, �e znasz si� na handlu. Sk�d pochodzisz?
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_02"); //To prawda, mam �y�k� do interes�w. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_03"); //Pochodz� z Khorinis. Mia�em kiedy� stragan w G�rnym Mie�cie. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_04"); //Handlowa�em najlepsz� �ywno�ci� sprowadzan� z kontynentu. Liczne statki handlowe specjalnie j� dostarcza�y na moje �yczenie.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_05"); //Niestety, pewnego dnia przez pomy�k� sprzeda�em �onie gubernatora Lariusa nie�wie�e owoce.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_06"); //Kobieta si� zatru�a i po kilku tygodniach zmar�a.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_07"); //Gubernator oskar�y� mnie, �e sprzeda�em to z premedytacj�, chc�c pozbawi� go pozycji.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_08"); //Odda� mnie w r�ce Wulfgara, dow�dcy stra�y miejskiej, a po kr�tkim czasie S�dzia skaza� mnie na odsiadk� w Kolonii.
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_09"); //Ech... Te� mia�em "przyjemno��" pozna� S�dziego.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_10"); //No w�a�nie. Ten sukinsyn nigdy nie post�powa� zgodnie ze s�owem Innosa. Zawsze miesza� si� w ciemne interesy.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_11"); //Gdyby nie on, by�bym w stanie wybrn�� z tej sytuacji. Zw�aszcza bior�c pod uwag� to, �e nawalili moi dostawcy, a nie ja. 
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_12"); //Rozumiem.
};

