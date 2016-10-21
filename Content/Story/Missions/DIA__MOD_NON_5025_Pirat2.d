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
   description	= "Kim jeste�?";
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
    AI_Output (other, self ,"DIA_Pirat2_AngusKurwoAnie_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_02"); //Nazywam si� Steve. Jestem piratem.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_03"); //Rozbili�my si� tu dosy� niedawno.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_04"); //Co to by� za sztorm...
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_05"); //B�d� go pami�ta� do ko�ca �ycia.
    AI_Output (other, self ,"DIA_Pirat2_AngusKurwoAnie_15_06"); //Dok�d p�yn�li�cie?
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_07"); //P�yn�li�my na spotkanie z innym statkiem pirackim.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_08"); //Pono� z drugiej strony wyspy jest port.
    AI_Output (self, other ,"DIA_Pirat2_AngusKurwoAnie_03_09"); //Nigdy tam nie by�em.
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
   description	= "Stracili�cie ca�y ekwipunek?";
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
    AI_Output (other, self ,"DIA_Pirat2_Eq_15_01"); //Stracili�cie ca�y ekwipunek?
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_02"); //Powinien le�e� gdzie� w okolicy.
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_03"); //Je�eli go dla nas zdob�dziesz, podaruj� ci pot�n� bro� pirat�w.
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_04"); //Pop�y� pod tamte resztki statku. Obejd� te� ca�y brzeg.
    AI_Output (self, other ,"DIA_Pirat2_Eq_03_06"); //Powinno by� tam jakie� 5 paczek z broni� i kilka sakiewek.
    AI_Output (other, self ,"DIA_Pirat2_Eq_15_07"); //Zobacz� co da si� zrobi�.
    MIS_StevesEquipment = LOG_RUNNING;

    Log_CreateTopic            (CH4_StevesEquipment, LOG_MISSION);
    Log_SetTopicStatus       (CH4_StevesEquipment, LOG_RUNNING);
    B_LogEntry                     (CH4_StevesEquipment,"Steve kaza� mi przynie�� ekwipunek, kt�ry p�ywa wok� wraku statku i le�y na brzegu morza. Mam szuka� paczek z broni� i ci�kich sakiewek z rud�.");
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
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_02"); //�wietnie! Daj mi go.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_03"); //Interesuj� mnie tylko najwi�ksze sakiewki.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_04"); //S� wypchane rud�. Wi�kszo�� nale�a�a do Sida, ale skoro nie �yje...
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_05"); //B�dziemy musieli si� tu jako� zorganizowa�.
    AI_Output (self, other ,"DIA_Pirat2_GiveEqZgubione_03_06"); //Jeszcze raz wielkie dzi�ki. Oto twoja nagroda.
	CreateInvItems (self, Kordelas, 1);
    B_GiveInvItems (self, other, Kordelas, 1);
	
	B_GiveInvItems (other, self, ItMi_PaczkaMiecze1, 5);
	B_GiveInvItems (other, self, ItMi_Worek_100, 3);
    B_LogEntry                     (CH4_StevesEquipment,"Odnalezienie ekwipunku pirat�w nie by�o zbyt trudne.");
    Log_SetTopicStatus       (CH4_StevesEquipment, LOG_SUCCESS);
    MIS_StevesEquipment = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

