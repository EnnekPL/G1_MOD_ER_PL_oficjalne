
//========================================
//-----------------> ENDE
//========================================

INSTANCE DIA_CorristoOT_ENDE (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 111;
   condition    = DIA_CorristoOT_ENDE_Condition;
   information  = DIA_CorristoOT_ENDE_Info;
   permanent	= FALSE;
   description	= "Zginiesz, zdrajco!";
};

FUNC INT DIA_CorristoOT_ENDE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorristoOT_First))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorristoOT_ENDE_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_ENDE_15_01"); //Zginiesz, zdrajco!
	AI_Output (self, other ,"DIA_CorristoOT_ENDE_03_02"); //Tak szybko chcesz siê ¿egnaæ z ¿yciem?
    AI_Output (self, other ,"DIA_CorristoOT_ENDE_03_03"); //Walczmy wiêc.
	
	
	AI_StopProcessInfos	(self);
	self.guild = GIL_GRD;
	B_ChangeGuild   		 (self,GIL_GRD);  
	
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,""); 
	

	
	B_LogEntry     (CH6_CorristoSlepper,"Stan¹³em do walki z Corristo. Nie ma miejsca na œwiecie dla s³ug Beliara.");
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Gdy kilkanaœcie dni temu dowiedzia³em siê, ¿e Corristo uciek³ ze Starego Obozu i jest ca³y, by³em bardzo zadowolony. Do³o¿y³em wszelkich starañ, ¿eby pomóc mu w jego planach. Myœla³em, ¿e chce wspomóc Magów Wody lub dzia³aæ samodzielnie po stronie dobra. Nic bardziej mylnego. Corristo uwa¿a, ¿e uda³o mi siê prze¿yæ tylko dziêki mocy Beliara. Skutecznie mnie oszuka³ i wykorzysta³ do zdobycia kamienia z Opuszczonej Kopalni. Dziêki rytua³om odprawionym przez Corristo, Beliar nape³ni³ kamieñ potê¿n¹ moc¹, która jest teraz w posiadaniu by³ego Maga Ognia. Muszê stoczyæ walkê z tym zdrajc¹. Oby bogowie dali mi si³ê...");
    Log_SetTopicStatus       (CH6_CorristoSlepper, LOG_SUCCESS);
    MIS_CorristoSlepper = LOG_SUCCESS;
};


//========================================
//-----------------> First
//========================================

INSTANCE DIA_CorristoOT_First (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 1;
   condition    = DIA_CorristoOT_First_Condition;
   information  = DIA_CorristoOT_First_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorristoOT_First_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CorristoOT_First_Info()
{
    AI_Output (self, other ,"DIA_CorristoOT_First_03_01"); //A wiêc wreszcie siê spotykamy...
    AI_Output (other, self ,"DIA_CorristoOT_First_15_02"); //Corristo? Co ty tutaj robisz?
    AI_Output (other, self ,"DIA_CorristoOT_First_15_03"); //I co to za p³aszcz?
    AI_Output (self, other ,"DIA_CorristoOT_First_03_04"); //Corristo ju¿ nie istnieje! Ofiarowa³em siê Œni¹cemu!
    AI_Output (self, other ,"DIA_CorristoOT_First_03_05"); //To ON uczyni³ mnie swym potê¿nym s³ug¹! Nie Innos!
    AI_Output (other, self ,"DIA_CorristoOT_First_15_06"); //Bredzisz! Otrz¹œnij siê!
    AI_UseItem (self, ItMiJoint_1);
    AI_Output (self, other ,"DIA_CorristoOT_First_03_07"); //Ty... mo¿esz siê jeszcze zmieniæ! 
    AI_Output (self, other ,"DIA_CorristoOT_First_03_08"); //Do³¹cz do nas. Zostañ s³ug¹ Œni¹cego.
  /*  if (Npc_IsDead(NON_3073_Czarny_Mag))
    {
        AI_Output (self, other ,"DIA_CorristoOT_First_03_09"); //Wybaczy ci zabójstwo Czarnego Maga.
        AI_Output (other, self ,"DIA_CorristoOT_First_15_10"); //Zapomnij o tym!
    };
	*/
    MIS_CorristoSlepper = LOG_RUNNING;

    Log_CreateTopic       (CH6_CorristoSlepper, LOG_MISSION);
    Log_SetTopicStatus    (CH6_CorristoSlepper, LOG_RUNNING);
    B_LogEntry            (CH6_CorristoSlepper,"W œwi¹tyni spotka³em Corristo. Nie mog³em dowierzyæ w³asnym oczom. Ten dwulicowy mag przeszed³ na stronê Œni¹cego ofiaruj¹c mu kamieñ, który zdoby³em dla niego w kopalni.");

    B_GiveXP (1500);
};

//========================================
//-----------------> Evil
//========================================

INSTANCE DIA_CorristoOT_Evil (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 2;
   condition    = DIA_CorristoOT_Evil_Condition;
   information  = DIA_CorristoOT_Evil_Info;
   permanent	= FALSE;
   description	= "Jak to siê sta³o, ¿e jesteœ z³y?";
};

FUNC INT DIA_CorristoOT_Evil_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CorristoOT_Evil_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_Evil_15_01"); //Jak to siê sta³o, ¿e jesteœ z³y?
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_02"); //Z³y? Nie ¿artuj sobie. Beliar nie jest z³y, jest potê¿ny! To Œni¹cy da³ mi znak w Starym Obozie! 
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_03"); //"Uciekaj Corristo, bo zginiesz!" - powiedzia³.
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_04"); //Przys³a³ do mnie jednego ze swoich ludzi.
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_05"); //Kazali mi odnaleŸæ kamieñ, który bêdê móg³ ofiarowaæ Œni¹cemu na dowód mojego pos³uszeñstwa.
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_06"); //Ty, chciwy g³upcze mi w tym pomog³eœ.
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_07"); //Uwolni³eœ energiê drzemi¹c¹ w Opuszczonej Kopalni.
    AI_Output (self, other ,"DIA_CorristoOT_Evil_03_08"); //Energiê, której zlêkli siê nawet Stra¿nicy Gomeza.
};

//========================================
//-----------------> Xardas
//========================================

INSTANCE DIA_CorristoOT_Xardas (C_INFO)
{
   npc          = KDF_8084_CorristoOT;
   nr           = 4;
   condition    = DIA_CorristoOT_Xardas_Condition;
   information  = DIA_CorristoOT_Xardas_Info;
   permanent	= FALSE;
   description	= "Co zrobi³eœ z Xardasem?";
};

FUNC INT DIA_CorristoOT_Xardas_Condition()
{
    if (Npc_KnowsInfo (hero, Kdf_406_OTXardas))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorristoOT_Xardas_Info()
{
    AI_Output (other, self ,"DIA_CorristoOT_Xardas_15_01"); //Co zrobi³eœ z Xardasem?
    AI_Output (self, other ,"DIA_CorristoOT_Xardas_03_02"); //Twój przyjaciel Xardas zosta³ pora¿ony moc¹ naszego Pana.
    AI_Output (self, other ,"DIA_CorristoOT_Xardas_03_03"); //On naprawdê nie jest taki, jak tobie siê wydaje.
    AI_Output (other, self ,"DIA_CorristoOT_Xardas_15_04"); //Próbujesz mnie oszukaæ!
};