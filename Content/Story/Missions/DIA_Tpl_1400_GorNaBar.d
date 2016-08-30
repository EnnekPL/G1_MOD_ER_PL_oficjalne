//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  Tpl_1400_GorNaBar_Exit (C_INFO)
{
	npc			= Tpl_1400_GorNaBar;
	nr			= 999;
	condition	= Tpl_1400_GorNaBar_Exit_Condition;
	information	= Tpl_1400_GorNaBar_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1400_GorNaBar_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1400_GorNaBar_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //Niech �ni�cy zawsze b�dzie z tob�!
	AI_StopProcessInfos	( self );
};




// ***************** TEMPLER SAMMELN  *****************************

instance  Tpl_1400_GorNaBar_SUGGEST (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_SUGGEST_Condition;
	information		= Tpl_1400_GorNaBar_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebuj� twojej pomocy."; 
};

FUNC int  Tpl_1400_GorNaBar_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1400_GorNaBar_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Potrzebuj� twojej pomocy.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Szukam wydzieliny pe�zaczy dla Kaloma i chyba wiem ju�, gdzie znajduje si� gniazdo tych drapie�c�w.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Mo�emy na ciebie liczy�, kiedy ju� odblokujemy prowadz�ce do niego przej�cie?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //Gniazdo pe�zaczy! Nareszcie! M�j miecz jest na twoje us�ugi.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaBar);

	B_LogEntry		(CH2_MCEggs,	"Na wzmiank� o gnie�dzie pe�zaczy, Gor Na Bar zgodzi� si� do��czy� do oddzia�u przy bramie Asghana.");
};

// ***************** Infos *****************************

instance  Tpl_1400_GorNaBar_INFO (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_INFO_Condition;
	information		= Tpl_1400_GorNaBar_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co mo�esz mi powiedzie� o pe�zaczach?";
};

FUNC int  Tpl_1400_GorNaBar_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1400_GorNaBar_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //Co mo�esz mi powiedzie� o pe�zaczach?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Te bestie musz� mie� gdzie� tutaj swoje gniazdo. Gdyby uda�o si� je znale��, mogliby�my wyt�pi� je za jednym zamachem!
};    


// EIER AM START
instance  Tpl_1400_GorNaBar_VICTORY (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_VICTORY_Condition;
	information		= Tpl_1400_GorNaBar_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em gniazdo kr�lowej!"; 
};

FUNC int  Tpl_1400_GorNaBar_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1400_GorNaBar_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //Znalaz�em gniazdo kr�lowej!
	AI_Output			(self, other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Wykaza�e� si� odwag� i hartem ducha. Potrzebujemy ludzi takich jak ty!
	
	if (Npc_GetTrueGuild (hero) == GIL_NOV) {
	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Po dostarczeniu jaj powinienem porozmawia� z Cor Angarem. Mo�e pozwoli mi do��czy� do Stra�y �wi�tynnej..."); };
};  
//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_GorNaBar_SZPIEG (C_INFO)
{
   npc          = Tpl_1400_GorNaBar;
   nr           = 1;
   condition    = DIA_GorNaBar_SZPIEG_Condition;
   information  = DIA_GorNaBar_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Co robicie w kopalni?";
};

FUNC INT DIA_GorNaBar_SZPIEG_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaBar_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_GorNaBar_SZPIEG_15_01"); //Co robicie w kopalni?
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_02"); //Polujemy na pe�zacze. Ich wydzielina jest potrzebna Cor Kalomowi.
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_03"); //Jednak ostatnio sobie nie radzimy.
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_04"); //Pe�zacze robi� si� coraz bardziej agresywne.
    AI_Output (other, self ,"DIA_GorNaBar_SZPIEG_15_05"); //Czy Stra�nicy pomagaj� wam zabija� pe�zacze?
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_06"); //Do pewnego czasu pomagali nam, tylko gdy by�o im to na r�k�. 
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_07"); //Teraz jednak chodz� z nami na polowania.
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_08"); //To dosy� dziwne. Odrywaj� pe�zaczom odn�a, po czym zanosz� do zwierzchnik�w.
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_09"); //�cigaj� si� wr�cz w tym.
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_10"); //S�ysza�em plotki o jakich� pertraktacjach pomi�dzy Bractwem a Gomezem.
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_11"); //Niestety nie wiem nic wi�cej.
    AI_Output (other, self ,"DIA_GorNaBar_SZPIEG_15_12"); //Kto m�g�by wiedzie�?
    AI_Output (self, other ,"DIA_GorNaBar_SZPIEG_03_13"); //Za piwo od Stra�nika wyci�gniesz wiele. Spr�buj delikatnie zapyta�.
    B_LogEntry                     (CH1_PSIcampWORK,"Gor Na Bar zdradzi� mi, �e Stra�nicy zacz�li pomaga� wys�annikom Bractwa podczas polowa� na pe�zacze. Dotychczas jednak tego nie czynili. Czy�by na tym mia�aby polega� nowa wsp�praca mi�dzy obozami? Musz� zasi�gn�� j�zyka w�r�d Stra�nik�w.");

    B_GiveXP (100);
};

