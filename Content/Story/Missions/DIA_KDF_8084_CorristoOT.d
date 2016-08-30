// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_CorristoOT_EXIT(C_INFO)
{
	npc             = KDF_8084_CorristoOT;
	nr              = 999;
	condition	= DIA_CorristoOT_EXIT_Condition;
	information	= DIA_CorristoOT_EXIT_Info;
	permanent	= TRUE;
	description     = "Walczmy (Koniec)";
};

FUNC INT DIA_CorristoOT_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CorristoOT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
*/
//========================================
//-----------------> DedChuju
//========================================

INSTANCE DIA_CorristoOT_DedChuju (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 111;
   condition    = DIA_CorristoOT_DedChuju_Condition;
   information  = DIA_CorristoOT_DedChuju_Info;
   permanent	= FALSE;
   description	= "Zginiesz, zdrajco!";
};

FUNC INT DIA_CorristoOT_DedChuju_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorristoOT_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorristoOT_DedChuju_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_DedChuju_15_01"); //Zginiesz, zdrajco!
	AI_Output (self, other ,"DIA_CorristoOT_DedChuju_03_02"); //Tak szybko chcesz si� �egna� z �yciem?
    AI_Output (self, other ,"DIA_CorristoOT_DedChuju_03_03"); //Walczmy wi�c.
	
	
	AI_StopProcessInfos	(self);
	self.guild = GIL_GRD;
	B_ChangeGuild   		 (self,GIL_GRD);  
	
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,""); 
	

	
	B_LogEntry     (CH1_CorristoSlepper,"Stan��em do walki z Corristo. Nie ma miejsca na �wiecie dla s�ug Beliara.");
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Gdy kilkana�cie dni temu dowiedzia�em si�, �e Corristo uciek� ze Starego Obozu i jest ca�y, by�em bardzo zadowolony. Do�o�y�em wszelkich stara�, �eby pom�c mu w jego planach. My�la�em, �e chce wspom�c Mag�w Wody lub dzia�a� samodzielnie po stronie dobra. Nic bardziej mylnego. Corristo uwa�a, �e uda�o mi si� prze�y� tylko dzi�ki mocy Beliara. Skutecznie mnie oszuka� i wykorzysta� do zdobycia kamienia z Opuszczonej Kopalni. Dzi�ki rytua�om odprawionym przez Corristo, Beliar nape�ni� kamie� pot�n� moc�, kt�ra jest teraz w posiadaniu by�ego Maga Ognia. Musz� stoczy� walk� z tym zdrajc�. Oby bogowie dali mi si��...");
    Log_SetTopicStatus       (CH1_CorristoSlepper, LOG_SUCCESS);
    MIS_CorristoSlepper = LOG_SUCCESS;
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_CorristoOT_HELLO1 (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 1;
   condition    = DIA_CorristoOT_HELLO1_Condition;
   information  = DIA_CorristoOT_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorristoOT_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CorristoOT_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_CorristoOT_HELLO1_03_01"); //A wi�c wreszcie si� spotykamy...
    AI_Output (other, self ,"DIA_CorristoOT_HELLO1_15_02"); //Corristo? Do cholery! Co ty tutaj robisz?
    AI_Output (other, self ,"DIA_CorristoOT_HELLO1_15_03"); //I co to za p�aszcz?
    AI_Output (self, other ,"DIA_CorristoOT_HELLO1_03_04"); //Corristo ju� nie istnieje! Ofiarowa�em si� �ni�cemu!
    AI_Output (self, other ,"DIA_CorristoOT_HELLO1_03_05"); //To ON uczyni� mnie swym pot�nym s�ug�! Nie Innos!
    AI_Output (other, self ,"DIA_CorristoOT_HELLO1_15_06"); //Bredzisz! Otrz��nij si�!
    AI_UseItem (self, ItMiJoint_1);
    AI_Output (self, other ,"DIA_CorristoOT_HELLO1_03_07"); //Ty... mo�esz si� jeszcze zmieni�! 
    AI_Output (self, other ,"DIA_CorristoOT_HELLO1_03_08"); //Do��cz do nas. Zosta� s�ug� �ni�cego.
  /*  if (Npc_IsDead(NON_3073_Czarny_Mag))
    {
        AI_Output (self, other ,"DIA_CorristoOT_HELLO1_03_09"); //Wybaczy ci zab�jstwo Czarnego Maga.
        AI_Output (other, self ,"DIA_CorristoOT_HELLO1_15_10"); //Zapomnij o tym!
    };
	*/
    MIS_CorristoSlepper = LOG_RUNNING;

    Log_CreateTopic            (CH1_CorristoSlepper, LOG_MISSION);
    Log_SetTopicStatus       (CH1_CorristoSlepper, LOG_RUNNING);
    B_LogEntry                     (CH1_CorristoSlepper,"W �wi�tyni spotka�em Corristo. Nie mog�em dowierzy� w�asnym oczom. Ten dwulicowy mag przeszed� na stron� �ni�cego ofiaruj�c mu kamie�, kt�ry zdoby�em dla niego w kopalni.");

    B_GiveXP (500);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_CorristoOT_HELLO2 (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 2;
   condition    = DIA_CorristoOT_HELLO2_Condition;
   information  = DIA_CorristoOT_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak to si� sta�o, �e jeste� z�y?";
};

FUNC INT DIA_CorristoOT_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CorristoOT_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_HELLO2_15_01"); //Jak to si� sta�o, �e jeste� z�y?
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_02"); //Z�y? Nie �artuj sobie. Beliar nie jest z�y, jest pot�ny! To �ni�cy da� mi znak w Starym Obozie! 
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_03"); //"Uciekaj Corristo, bo zginiesz!" - powiedzia�.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_04"); //Przys�a� do mnie jednego ze swoich ludzi.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_05"); //Kazali mi odnale�� kamie�, kt�ry b�d� m�g� ofiarowa� �ni�cemu na dow�d mojego pos�usze�stwa.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_06"); //Ty, chciwy g�upcze mi w tym pomog�e�.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_07"); //Uwolni�e� energi� drzemi�c� w Opuszczonej Kopalni.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO2_03_08"); //Energi�, kt�rej zl�kli si� nawet Stra�nicy Gomeza.
};
/*
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_CorristoOT_HELLO3 (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 3;
   condition    = DIA_CorristoOT_HELLO3_Condition;
   information  = DIA_CorristoOT_HELLO3_Info;
   permanent	= FALSE;
   description	= "Co da� wam ten kamie�?";
};

FUNC INT DIA_CorristoOT_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorristoOT_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorristoOT_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_HELLO3_15_01"); //Co da� wam ten kamie�?
    AI_Output (self, other ,"DIA_CorristoOT_HELLO3_03_02"); //Prowadzi�em nad nim badania, a� w ko�cu uda�o mi si� uwolni� jego moc.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO3_03_03"); //Poszukiwacze u�yli go do przywo�ania pot�nych istot z ku�ni Beliara.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO3_03_04"); //Nigdy nie uda ci si� pokona� naszego Pana.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO3_03_05"); //Zbytnio ur�s� w si��.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO3_03_06"); //Jeste� tylko marnym cz�owiekiem. Nawet ta magiczna zbroja ci� nie ocali.
	
    B_LogEntry                     (CH1_CorristoSlepper,"Poszukiwacze wykorzystali kamie� do przywo�ania pot�nych istot, kt�re b�d� chroni� �ni�cego. Innymi s�owy mam k�opoty...");

    B_GiveXP (500);
};
*/
//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_CorristoOT_HELLO4 (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 4;
   condition    = DIA_CorristoOT_HELLO4_Condition;
   information  = DIA_CorristoOT_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co zrobi�e� z Xardasem?";
};

FUNC INT DIA_CorristoOT_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, Kdf_406_OTXardas))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorristoOT_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_HELLO4_15_01"); //Co zrobi�e� z Xardasem?
    AI_Output (self, other ,"DIA_CorristoOT_HELLO4_03_02"); //Tw�j przyjaciel Xardas zosta� pora�ony moc� naszego Pana.
    AI_Output (self, other ,"DIA_CorristoOT_HELLO4_03_03"); //On naprawd� nie jest taki, jak tobie si� wydaje.
    AI_Output (other, self ,"DIA_CorristoOT_HELLO4_15_04"); //Milcz!
};



