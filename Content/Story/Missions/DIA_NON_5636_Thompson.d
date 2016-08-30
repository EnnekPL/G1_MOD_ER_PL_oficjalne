//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Thompson_EXIT(C_INFO)
{
	npc             = NON_5636_Thompson;
	nr              = 999;
	condition	= DIA_Thompson_EXIT_Condition;
	information	= DIA_Thompson_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Thompson_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thompson_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Thompson_HELLO1 (C_INFO)
{
   npc          = NON_5636_Thompson;
   nr           = 1;
   condition    = DIA_Thompson_HELLO1_Condition;
   information  = DIA_Thompson_HELLO1_Info;
   permanent	= FALSE;
   description	= "Dobre maj� tu piwo?";
};

FUNC INT DIA_Thompson_HELLO1_Condition()
{
	if (will_herosay_zawsze != true)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Thompson_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Thompson_HELLO1_15_01"); //Dobre maj� tu piwo?
    AI_Output (self, other ,"DIA_Thompson_HELLO1_03_02"); //Ca�kiem dobre, importowane prosto z Myrtany. Kr�l stara si�, aby Gomezowi i jego ludziom �y�o si� tu ca�kiem dobrze. 
	AI_Output (self, other ,"DIA_Thompson_HELLO1_03_03"); //Jestem Thompson, w�a�nie zosta�em przys�any do Obozu ze Starej Kopalni. Odpracowa�em ju� swoje, wi�c Ian pozwoli� mi odpocz��.
    AI_Output (other, self ,"DIA_Thompson_HELLO1_15_04"); //Wygl�dasz na do�� silnego jak na Kopacza.
    AI_Output (self, other ,"DIA_Thompson_HELLO1_03_05"); //No c�, ka�dy Kopacz ma przesz�o��, pewnie zdziwi�by� si� kim byli inni, zanim zostali zrzuceni za Barier�. 
    AI_Output (self, other ,"DIA_Thompson_HELLO1_03_06"); //Najwi�kszym problemem tutaj w Kolonii jest wybicie si�, musisz si� sporo nalata� dla Magnat�w, Guru czy innych szych, aby �y� na godnym poziomie.
    AI_Output (other, self ,"DIA_Thompson_HELLO1_15_07"); //Rozumiem. Widz� te�, �e masz niez�� bro�, inni Kopacze, kt�rych widzia�em zazwyczaj u�ywaj� do walki kilof�w lub pa�ek.
    AI_Output (self, other ,"DIA_Thompson_HELLO1_03_08"); //Eee no tak... znalaz�em ten miecz ee... w kopalni przy zw�okach jednego ze Stra�nik�w.
    AI_Output (other, self ,"DIA_Thompson_HELLO1_15_09"); //Jasne.
};

//========================================
//-----------------> TIMETODIE
//========================================

INSTANCE DIA_Thompson_TIMETODIE (C_INFO)
{
   npc          = NON_5636_Thompson;
   nr           = 2;
   condition    = DIA_Thompson_TIMETODIE_Condition;
   information  = DIA_Thompson_TIMETODIE_Info;
   permanent	= FALSE;
   description	= "Twoje pr�by wybicia si� zdenerwowa�y pewnych ludzi.";
};

FUNC INT DIA_Thompson_TIMETODIE_Condition()
{
    if (will_herosay_zawsze == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Thompson_TIMETODIE_Info()
{
    AI_Output (other, self ,"DIA_Thompson_TIMETODIE_15_01"); //Witaj ponownie, Kopaczu. Widz�, �e twoje pr�by wybicia si� zdenerwowa�y pewnych ludzi.
	AI_Output (self, other ,"DIA_Thompson_TIMETODIE_03_02"); //Pos�uchaj, nie wiem co on ci powiedzia�, ale chc� to wyja�ni�. Chod� za mn�. To nie jest dobre miejsce.
	Npc_ExchangeRoutine (self, "guide");
	AI_StopProcessInfos (self);
	var c_npc bonie; bonie = Hlp_GetNpc (VLK_594_Bonie);
	var c_npc clayde; clayde = Hlp_GetNpc (VLK_595_Clayde);
	Npc_ExchangeRoutine (bonie, "cave");
	Npc_ExchangeRoutine (clayde, "cave");
	AI_Teleport (bonie,"POSLANIEC");
	AI_Teleport (clayde,"CAVE_SNIPES");
	//Niedorzeczno�ci poprawione!
};

//========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_Thompson_FIGHT (C_INFO)
{
   npc          = NON_5636_Thompson;
   nr           = 1;
   condition    = DIA_Thompson_FIGHT_Condition;
   information  = DIA_Thompson_FIGHT_Info;
   permanent	= FALSE;
   important	= 1;
};

FUNC INT DIA_Thompson_FIGHT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Thompson_TIMETODIE)) && (Npc_GetDistToWP (self, "LOCATION_15_IN_2") < 750)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Thompson_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Thompson_FIGHT_03_02"); //Ach, wi�c zdaj� si� �e pozna�e� Willa. Czego ten �ajdak ode mnie chce?
    AI_Output (other, self ,"DIA_Thompson_FIGHT_15_03"); //Twojej g�owy, a ja zaraz mu j� dostarcz�.
    AI_Output (self, other ,"DIA_Thompson_FIGHT_03_04"); //CO? Moi kumple nie puszcz� ci tego p�azem.
    AI_Output (other, self ,"DIA_Thompson_FIGHT_15_05"); //Ch�opaki, zaczynamy zabaw�!
	//Npc_ExchangeRoutine (self, "start");
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	var C_NPC Bonie;
	Bonie = Hlp_GetNpc(VLK_594_Bonie);
		
	var C_NPC Clayde;
	Clayde = Hlp_GetNpc(VLK_595_Clayde);
	
	//Npc_ExchangeRoutine (VLK_594_Bonie, "start");
	//Npc_ExchangeRoutine (VLK_595_Clayde, "start");
	
	Npc_SetPermAttitude (Clayde, ATT_HOSTILE);
    Npc_SetTarget (Clayde, other);
    AI_StartState (Clayde, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (Bonie, ATT_HOSTILE);
    Npc_SetTarget (Bonie, other);
    AI_StartState (Bonie, ZS_ATTACK, 1, "");	
   
   
   /*
   	B_ChangeGuild   		 (self,GIL_DMB);  
	B_SetPermAttitude	(self,	ATT_HOSTILE);
		
	
	
	B_ChangeGuild   		 (Bonie,GIL_DMB);  
	B_SetPermAttitude	(Bonie,	ATT_HOSTILE);
		
	B_ChangeGuild   		 (Clayde,GIL_DMB);  
	B_SetPermAttitude	(Clayde,	ATT_HOSTILE);
	Npc_SetPermAttitude (self, ATT_HOSTILE);*/
};

