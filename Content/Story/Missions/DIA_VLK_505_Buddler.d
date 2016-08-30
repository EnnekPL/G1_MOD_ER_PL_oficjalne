
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Buddler505_EXIT(C_INFO)
{
	npc             = VLK_505_Buddler;
	nr              = 999;
	condition		= DIA_Buddler505_EXIT_Condition;
	information		= DIA_Buddler505_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Buddler505_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Buddler505_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FABLER1
//========================================

INSTANCE DIA_Buddler_FABLER1 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_FABLER1_Condition;
   information  = DIA_Buddler_FABLER1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Buddler_FABLER1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_FABLER1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_02"); //Nazywam si� Fabler. Zanim trafi�em do Kolonii by�em robotnikiem w porcie w Vengardzie.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_03"); //To co w dzie� si� zarobi�o, to wieczorem w karczmie si� przepuszcza�o. Trzeba by�o jako� odpocz�� po ci�kim dniu pracy.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_04"); //Czasami gra�o si� te� w ko�ci i wiadomo, niekt�rzy pr�bowali oszukiwa�. Wtedy w karczmie robi�o si� weso�o.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_05"); //Tak by�o i tym razem. M�ody wida� nie umia� przegrywa�. Wywi�za�a si� drobna awantura. Ja dosta�em po mordzie i on dosta�. Tylko, �e on dosta� mocniej.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_06"); //Poza tym on okaza� si� synem oficera stra�y miejskiej, a ja by�em� robotnikiem najemnym.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_07"); //Teraz jestem tu gdzie jestem.
};

//========================================
//-----------------> FABLER2
//========================================

INSTANCE DIA_Buddler_FABLER2 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_FABLER2_Condition;
   information  = DIA_Buddler_FABLER2_Info;
   permanent	= FALSE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Buddler_FABLER2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_FABLER1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_FABLER2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER2_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Buddler_FABLER2_03_02"); //Jak b�dziesz chcia� kupi� dobre spodnie, id� do �wistaka. 
    AI_Output (other, self ,"DIA_Buddler_FABLER2_15_03"); //Zap�aci� ci by� nagania� mu klient�w.
    AI_Output (self, other ,"DIA_Buddler_FABLER2_03_04"); //Z czego� tu trzeba �y�.
};

//========================================
//-----------------> FABLER3
//========================================

INSTANCE DIA_Buddler_FABLER3 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_FABLER3_Condition;
   information  = DIA_Buddler_FABLER3_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o tym miejscu?";
};

FUNC INT DIA_Buddler_FABLER3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_FABLER1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_FABLER3_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER3_15_01"); //Co mo�esz mi powiedzie� o tym miejscu?
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_02"); //Znasz Grahama? To nasz obozowy kartograf. Tylko on w tej zat�ch�ej Kolonii Karnej zna si� na sporz�dzaniu map. Dzi�ki temu czasami dostaje jakie� zlecenia od Magnat�w.
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_03"); //Dwa lata temu zosta� tu zrzucony skazaniec, kt�ry r�wnie� m�wi�, �e zna si� na robieniu map.
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_04"); //Wida� Graham przestraszy� si� o swoj� posadk�, bo tydzie� p�niej znaleziono tego �wie�aka z kilofem w brzuchu.
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_05"); //W ka�dym razie, lepiej nie chwali� si� zbytnio swoimi umiej�tno�ciami.
};

//========================================
//-----------------> FABLER4
//========================================

INSTANCE DIA_Buddler_FABLER4 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_FABLER4_Condition;
   information  = DIA_Buddler_FABLER4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz�dzi?";
};

FUNC INT DIA_Buddler_FABLER4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_FABLER1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_FABLER4_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER4_15_01"); //Kto tu rz�dzi?
    AI_Output (self, other ,"DIA_Buddler_FABLER4_03_02"); //Rz�dz� Magnaci, ale dla prostych Kopaczy i tak najwa�niejsze jest to by u�o�y� si� jako� ze Stra�nikami.
    AI_Output (self, other ,"DIA_Buddler_FABLER4_03_03"); //W Starym Obozie lepiej si� nie pojawia�, je�eli nie ma si� kilku bry�ek rudy, by op�aci� "ochron�". Stra�nicy s� bardzo m�ciwi i nie lubi� jak kto� im psuje interes, wi�c jak nie zap�acisz to masz przechlapane.
};

