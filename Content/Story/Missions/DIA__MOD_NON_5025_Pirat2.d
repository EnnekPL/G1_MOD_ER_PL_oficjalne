// *Script was make in Easy Dialog Maker (EDM)
//sprawdzony przez gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Pirat2_EXIT(C_INFO)
{
	npc             = NON_5025_Pirat2;
	nr              = 999;
	condition	= DIA_Pirat2_EXIT_Condition;
	information	= DIA_Pirat2_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Pirat2_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pirat2_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> AngusKurwoAnie
//========================================

INSTANCE DIA_Pirat2_AngusKurwoAnie (C_INFO)
{
   npc          = NON_5025_Pirat2;
   nr           = 1;
   condition    = DIA_Pirat2_AngusKurwoAnie_Condition;
   information  = DIA_Pirat2_AngusKurwoAnie_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Pirat2_AngusKurwoAnie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat1_CoTuRobisz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat2_AngusKurwoAnie_Info()
{
    AI_Output (other, self ,"DIA_Pirat2_AngusKurwoAnie_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_02"); //Nazywam siê Steve. Jestem piratem.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_03"); //Rozbiliœmy siê tu dosyæ niedawno.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_04"); //Co to by³ za sztorm...
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_05"); //Bêdê go pamiêta³ do koñca ¿ycia.
    AI_Output (other, self ,"DIA_Pirat2_AngusKurwoAnie_15_06"); //Dok¹d p³ynêliœcie?
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_07"); //P³ynêliœmy na spotkanie z innym statkiem pirackim.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_08"); //Ponoæ z drugiej strony wyspy jest port.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_09"); //Nigdy tam nie by³em.
};

//========================================
//-----------------> Eq
//========================================

INSTANCE DIA_Pirat2_Eq (C_INFO)
{
   npc          = NON_5025_Pirat2;
   nr           = 2;
   condition    = DIA_Pirat2_Eq_Condition;
   information  = DIA_Pirat2_Eq_Info;
   permanent	= FALSE;
   description	= "Straciliœcie ca³y ekwipunek?";
};

FUNC INT DIA_Pirat2_Eq_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat2_AngusKurwoAnie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat2_Eq_Info()
{
    AI_Output (other, self ,"DIA_Pirat2_Eq_15_01"); //Straciliœcie ca³y ekwipunek?
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_02"); //Powinien le¿eæ gdzieœ w okolicy.
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_03"); //Je¿eli go dla nas zdobêdziesz, podarujê ci potê¿n¹ broñ piratów.
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_04"); //Pop³yñ pod tamte resztki statku. ObejdŸ te¿ ca³y brzeg.
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_06"); //Powinno byæ tam jakieœ 5 paczek z broni¹ i kilka sakiewek.
    AI_Output (other, self ,"DIA_Pirat2_Eq_15_07"); //Zobaczê co da siê zrobiæ.
    MIS_StevesEquipment = LOG_RUNNING;

    Log_CreateTopic            (CH4_StevesEquipment, LOG_MISSION);
    Log_SetTopicStatus       (CH4_StevesEquipment, LOG_RUNNING);
    B_LogEntry                     (CH4_StevesEquipment,"Steve kaza³ mi przynieœæ ekwipunek, który p³ywa wokó³ wraku statku i le¿y na brzegu morza. Mam szukaæ paczek z broni¹ i ciê¿kich sakiewek z rud¹.");
};

//========================================
//-----------------> GiveEqZgubione
//========================================

INSTANCE DIA_Pirat2_GiveEqZgubione (C_INFO)
{
   npc          = NON_5025_Pirat2;
   nr           = 1;
   condition    = DIA_Pirat2_GiveEqZgubione_Condition;
   information  = DIA_Pirat2_GiveEqZgubione_Info;
   permanent	= FALSE;
   description	= "Mam wasz ekwipunek.";
};

FUNC INT DIA_Pirat2_GiveEqZgubione_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pirat2_Eq))
    && (Npc_HasItems (other, ItMi_PaczkaMiecze1) >=5)
    && (Npc_HasItems (other, ItMi_Worek_100) >=3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pirat2_GiveEqZgubione_Info()
{
    AI_Output (other, self ,"DIA_Pirat2_GiveEqZgubione_15_01"); //Mam wasz ekwipunek.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_02"); //Œwietnie! Daj mi go.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_03"); //Interesuj¹ mnie tylko najwiêksze sakiewki.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_04"); //S¹ wypchane rud¹. Wiêkszoœæ nale¿a³a do Sida, ale skoro nie ¿yje...
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_05"); //Bêdziemy musieli siê tu jakoœ zorganizowaæ.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_06"); //Jeszcze raz wielkie dziêki. Oto twoja nagroda.
	CreateInvItems (self, Kordelas, 1);
    B_GiveInvItems (self, other, Kordelas, 1);
	
	B_GiveInvItems (other, self, ItMi_PaczkaMiecze1, 5);
	B_GiveInvItems (other, self, ItMi_Worek_100, 3);
    B_LogEntry                     (CH4_StevesEquipment,"Odnalezienie ekwipunku piratów nie by³o zbyt trudne.");
    Log_SetTopicStatus       (CH4_StevesEquipment, LOG_SUCCESS);
    MIS_StevesEquipment = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

