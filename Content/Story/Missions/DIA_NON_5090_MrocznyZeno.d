//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_MrocznyZeno_HELLO1 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 1;
   condition    = DIA_MrocznyZeno_HELLO1_Condition;
   information  = DIA_MrocznyZeno_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_MrocznyZeno_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_MrocznyZeno_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_01"); //A wi�c przepowiednie by�y prawdziwe!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_02"); //�wi�ty Nieprzyjaciel to ty!
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO1_15_03"); //O czym ty m�wisz?!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_04"); //Ukrywasz strach pod mask� arogancji i braku szacunku.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO1_15_05"); //Co tutaj robisz?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_06"); //Ta komnata niegdy� by�a miejscem, w kt�rym kap�ani przygotowywali mikstury.
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_07"); //Pozwala�y im one kontaktowa� si� ze �ni�cym i nie tylko.
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_08"); //Strzeg� tajemnic ksi�g znajduj�cych si� tutaj.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO1_15_09"); //Niech zgadn�. Aby m�c pozna� tajemnice tych ksi�g, b�d� ci� musia� pokona�?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO1_03_10"); //Hmm... Mo�na i tak.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_MrocznyZeno_HELLO2 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 2;
   condition    = DIA_MrocznyZeno_HELLO2_Condition;
   information  = DIA_MrocznyZeno_HELLO2_Info;
   permanent	= FALSE;
   description	= "Pokona�em Corristo!";
};

FUNC INT DIA_MrocznyZeno_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_MrocznyZeno_HELLO1))
    && (Npc_IsDead(KDF_8084_CorristoOT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MrocznyZeno_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO2_15_01"); //Pokona�em Corristo! Teraz kolej na ciebie!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO2_03_02"); //Nie dziwi� si�, �e go pokona�e�!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO2_03_03"); //By� s�aby i naiwny. �ni�cy go wykorzysta�.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_MrocznyZeno_HELLO3 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 3;
   condition    = DIA_MrocznyZeno_HELLO3_Condition;
   information  = DIA_MrocznyZeno_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czy Czarny Mag z wami wsp�pracuje?";
};

FUNC INT DIA_MrocznyZeno_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_MrocznyZeno_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MrocznyZeno_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO3_15_01"); //Czy Czarny Mag z wami wsp�pracuje?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_02"); //My�la�em, �e go zabi�e�.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO3_15_03"); //Przesta� �apa� mnie za s�owa. Dobrze wiesz, o co mi chodzi!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_04"); //Dobrze wi�c. Czarny Mag by� wys�annikiem �ni�cego.
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO3_15_05"); //O co chodzi z tym ca�ym "przygotowaniem �wiata"?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_06"); //Jak to o co?
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_07"); //Czarny Mag mia� tylko u�pi� wasz� czujno��. 
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_08"); //Nazywacie si� wyznawcami Innosa, a jeste�cie bez�adn� zgraj�.
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO3_03_09"); //Jestem pewien, �e �aden z Mag�w Ognia z Klasztoru na Khorinis nawet nie us�yszy o tym, co si� tutaj dzia�o!
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_MrocznyZeno_HELLO4 (C_INFO)
{
   npc          = NON_5091_MrocznyZeno;
   nr           = 99;
   condition    = DIA_MrocznyZeno_HELLO4_Condition;
   information  = DIA_MrocznyZeno_HELLO4_Info;
   permanent	= FALSE;
   description	= "Zginiesz tak samo jak Corristo!";
};

FUNC INT DIA_MrocznyZeno_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_MrocznyZeno_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_MrocznyZeno_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_MrocznyZeno_HELLO4_15_01"); //Zginiesz, tak samo jak Corristo!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO4_03_02"); //Tak �pieszno ci do Innosa? Uwierz mi, �e go nie zobaczysz!
    AI_Output (self, other ,"DIA_MrocznyZeno_HELLO4_03_03"); //Ju� ja si� o to postaram.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
};