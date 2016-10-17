// ************************ EXIT **************************

instance  VLK_583_Glen_Exit (C_INFO)
{
	npc			=  VLK_583_Glen;
	nr			= 999;
	condition	=  VLK_583_Glen_Exit_Condition;
	information	=  VLK_583_Glen_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_583_Glen_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance   VLK_583_Glen_INFO(C_INFO)
{
	npc				= VLK_583_Glen;
	condition		= VLK_583_Glen_INFO_Condition;
	information		= VLK_583_Glen_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "O czym powinienem pamiêtaæ, bêd¹c w kopalni?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //O czym powinienem pamiêtaæ, bêd¹c w kopalni?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Uwa¿aj na pe³zacze.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Im ni¿ej zejdziesz, tym czêœciej mo¿esz na nie wpaœæ. Te przeklête stwory przychodz¹ chyba wprost z królestwa samego Beliara!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Bez przerwy s³ychaæ, jak grzebi¹ i kopi¹. Siedz¹ w ciemnoœci i czekaj¹ na jakiegoœ biednego górnika, z którego zrobi¹ sobie obiad.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //S¹ bezlitosne i bardzo szybkie. Jeœli ci ¿ycie mi³e, uciekaj st¹d ile si³ w nogach. Prêdzej czy póŸniej padnie i na ciebie.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "S³ysza³em, ¿e mo¿na tu kupiæ wytrychy?";
};                       

FUNC int  VLK_583_Glen_LOCKPICK_Condition()
{
	if ( Npc_KnowsInfo(hero, VLK_585_Aleph_GLEN) )
	{
		return 1;
	};
};

FUNC VOID  VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //S³ysza³em, ¿e mo¿na tu kupiæ wytrychy?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Skoro okaza³eœ siê na tyle sprytny, ¿eby do mnie dotrzeæ, mo¿esz kilka kupiæ. To bêdzie 10 bry³ek rudy za sztukê.
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Kopacz Glen, którego mogê znaleŸæ przy wyjœciu z kopalni, handluje wytrychami."); 

};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(kup wytrychy)";
	trade		= 1;
};                       

FUNC int  VLK_583_Glen_BUY_Condition()
{	
	if ( Npc_KnowsInfo (hero, VLK_583_Glen_LOCKPICK) )
	{
		return 1;
	};
};
FUNC VOID  VLK_583_Glen_BUY_Info()
{
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chcê kupiæ kilka wytrychów.
};

//========================================
//-----------------> NeedOre
//========================================

INSTANCE DIA_Glen_NeedOre (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 4;
   condition    = DIA_Glen_NeedOre_Condition;
   information  = DIA_Glen_NeedOre_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mi pomóc dorobiæ nieco rudy?";
};

FUNC INT DIA_Glen_NeedOre_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Glen_NeedOre_Info()
{
    AI_Output (other, self ,"DIA_Glen_NeedOre_15_01"); //Mo¿esz mi pomóc dorobiæ nieco rudy?
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_03"); //Po co ci?
    AI_Output (other, self ,"DIA_Glen_NeedOre_15_04"); //Chcia³bym trochê siê wzbogaciæ...
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_05"); //To ³ap za kilof i zacznij kopaæ. W koñcu po to tu jesteœ. Dlaczego siê tak spieszysz?
    AI_Output (other, self ,"DIA_Glen_NeedOre_15_08"); //Sk¹d ty siê urwa³eœ? Ruda na szybko zawsze jest potrzebna. To jak? Mo¿esz mi pomóc?
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_09"); //Mogê daæ ci dziesiêæ bry³ek rudy w zamian za dostarczenie tych wytrychów Garpowi.
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_10"); //Wiêkszoœæ czasu spêdza na dnie kopalni. Mo¿liwe, ¿e on te¿ bêdzie mia³ dla ciebie jakieœ zadanie. Jednak nie licz na wysokie wynagrodzenie.
	AI_Output (self, other ,"DIA_Glen_NeedOre_03_11"); //Wszyscy tutaj s¹ biedni, a ty nie wygl¹dasz na kogoœ, kto zas³uguje na specjalne traktowanie. 
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_12"); //Mo¿esz pogadaæ te¿ ze Snipesem. Lubi robiæ sobie jaja ze Stra¿ników i chêtnie p³aci pomocnikom.
};

//========================================
//-----------------> GetPickLocks
//========================================

INSTANCE DIA_Glen_GetPickLocks (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 5;
   condition    = DIA_Glen_GetPickLocks_Condition;
   information  = DIA_Glen_GetPickLocks_Info;
   permanent	= FALSE;
   description	= "Zaniosê te wytrychy.";
};

FUNC INT DIA_Glen_GetPickLocks_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glen_NeedOre))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_GetPickLocks_Info()
{
    AI_Output (other, self ,"DIA_Glen_GetPickLocks_15_01"); //Zaniosê te wytrychy.
    AI_Output (self, other ,"DIA_Glen_GetPickLocks_03_02"); //Pamiêtasz gdzie masz iœæ? Na dno Kopalni, prosto do Garpa. Wytrychów jest 20 sztuk. Nie podwêdŸ ¿adnego!
	
    CreateInvItems (self, ItKeLockpick, 20);
    B_GiveInvItems (self, other, ItKeLockpick, 20);
    MIS_SmallDelivery = LOG_RUNNING;

    Log_CreateTopic          (CH1_SmallDelivery, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SmallDelivery, LOG_RUNNING);
    B_LogEntry               (CH1_SmallDelivery,"Glen kaza³ mi zanieœæ 20 wytrychów Garpowi. Znajdê go na dnie Kopalni.");
};

//========================================
//-----------------> ROBOTKA
//========================================

INSTANCE DIA_Glen_ROBOTKA (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 6;
   condition    = DIA_Glen_ROBOTKA_Condition;
   information  = DIA_Glen_ROBOTKA_Info;
   permanent	= FALSE;
   description	= "Przyszed³em po wytrychy.";
};

FUNC INT DIA_Glen_ROBOTKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_WLAM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_ROBOTKA_Info()
{
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_01"); //Przyszed³em po wytrychy.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_02"); //A wiêc zaczynacie...
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_03"); //Mo¿e trzeba by³o wzi¹æ sobie s³owa Alepha do serca?
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_04"); //Jakie to ma znaczenie? Z pewnoœci¹ wszystko siê uda.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_05"); //Czemu tak ci na tym zale¿y?
	/*if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_06"); //Po pierwsze: zyskam poparcie Kopaczy, a po drugie: potrzebujê tej rudy.
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_07"); //Mam wykopaæ 500 bry³ek, ¿eby Ian w ogóle ze mn¹ porozmawia³.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_08"); //A wiêc chcesz zostaæ Cieniem?
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_09"); //To chyba oczywiste, ¿e nie zamierzam tu gniæ 10 lat.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_10"); //Jak chcesz, ch³opcze.
	}
	else
	{*/
	AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_11"); //Ja po prostu chcê pomóc Kopaczom odzyskaæ ich w³asnoœci. 
	AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_12"); //Nie wiem czy ta sprawa jest warta takiego ryzyka, ale jak chcesz...
	//};
    B_LogEntry                     (CH1_ActionOM,"Glen da³ mi 5 wytrychów. Wkrótce bêdziemy gotowi ¿eby zaczynaæ. Muszê ustaliæ ostatnie szczegó³y z Garpem.");
    CreateInvItems (self, ItKeLockpick, 5);
    B_GiveInvItems (self, other, ItKeLockpick, 5);
};

//========================================
//-----------------> SAKIEWKAPP
//========================================

INSTANCE DIA_Glen_SAKIEWKAPP (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 88;
   condition    = DIA_Glen_SAKIEWKAPP_Condition;
   information  = DIA_Glen_SAKIEWKAPP_Info;
   permanent	= FALSE;
   description	= "Czy to czasem nie nale¿y do ciebie?";
};

FUNC INT DIA_Glen_SAKIEWKAPP_Condition()
{
    if (Npc_HasItems (other, ItMi_Worek_Glen) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_SAKIEWKAPP_Info()
{
    AI_Output (other, self ,"DIA_Glen_SAKIEWKAPP_15_01"); //Czy to czasem nie nale¿y do ciebie?
    AI_Output (self, other ,"DIA_Glen_SAKIEWKAPP_03_02"); //A wiêc moje wytrychy na coœ siê przyda³y?
    AI_Output (self, other ,"DIA_Glen_SAKIEWKAPP_03_03"); //Dobra robota, ch³opcze.
    B_GiveInvItems (other, self, ItMi_Worek_Glen, 1);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
};

//========================================
//-----------------> GoldMine
//========================================

INSTANCE DIA_Glen_GoldMine (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 1;
   condition    = DIA_Glen_GoldMine_Condition;
   information  = DIA_Glen_GoldMine_Info;
   permanent	= FALSE;
   description	= "Chcia³byœ siê st¹d wyrwaæ?";
};

FUNC INT DIA_Glen_GoldMine_Condition()
{
    if (MIS_KopalniaZlota == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_GoldMine_Info()
{
    AI_Output (other, self ,"DIA_Glen_GoldMine_15_01"); //Chcia³byœ siê st¹d wyrwaæ?
    AI_Output (self, other ,"DIA_Glen_GoldMine_03_02"); //Co masz na myœli?
    AI_Output (other, self ,"DIA_Glen_GoldMine_15_03"); //Mam na myœli pracê w ma³ej kopalni z³ota.
    AI_Output (self, other ,"DIA_Glen_GoldMine_03_04"); //Znalaz³eœ ¿y³ê z³ota w tej dziurze?
    AI_Output (self, other ,"DIA_Glen_GoldMine_03_05"); //Gdzie, do cholery?
    AI_Output (other, self ,"DIA_Glen_GoldMine_15_06"); //Jeszcze nie wiem. Jestem tylko... poœrednikiem.
    AI_Output (other, self ,"DIA_Glen_GoldMine_15_07"); //Mam zebraæ ekipê, która podejmie siê pracy.
    AI_Output (self, other ,"DIA_Glen_GoldMine_03_08"); //No dobra. Raz siê ¿yje.
    AI_Output (other, self ,"DIA_Glen_GoldMine_15_09"); //Spotykamy siê w karczmie w Nowym Obozie.
    AI_Output (self, other ,"DIA_Glen_GoldMine_03_10"); //Zatem widzimy siê w karczmie.
    B_LogEntry                     (CH1_KopalniaZlota,"Glen bêdzie pracowaæ w kopalni z³ota.");

    B_GiveXP (300);
};