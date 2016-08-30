//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorBoba_EXIT(C_INFO)
{
	npc             = TPL_3927_GorBoba;
	nr              = 999;
	condition	= DIA_GorBoba_EXIT_Condition;
	information	= DIA_GorBoba_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GorBoba_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorBoba_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> 3927_HELLO_01
//========================================

INSTANCE DIA_GorBoba_3927_HELLO_01 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 1;
   condition    = DIA_GorBoba_3927_HELLO_01_Condition;
   information  = DIA_GorBoba_3927_HELLO_01_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_GorBoba_3927_HELLO_01_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorBoba_3927_HELLO_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_01_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_01_03_02"); //M�wi� na mnie Gor Boba. Jestem Stra�nikiem �wi�tynnym i wiernym s�ug� �ni�cego.
};

//========================================
//-----------------> 3927_HELLO_02
//========================================

INSTANCE DIA_GorBoba_3927_HELLO_02 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 2;
   condition    = DIA_GorBoba_3927_HELLO_02_Condition;
   information  = DIA_GorBoba_3927_HELLO_02_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_GorBoba_3927_HELLO_02_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_HELLO_01))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorBoba_3927_HELLO_02_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_02_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_02_03_02"); //Trenuj�, by pewnego dnia zdoby� tytu� mistrza areny.
};

//========================================
//-----------------> 3927_TEACH_01
//========================================

INSTANCE DIA_GorBoba_3927_TEACH_01 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 3;
   condition    = DIA_GorBoba_3927_TEACH_01_Condition;
   information  = DIA_GorBoba_3927_TEACH_01_Info;
   permanent	= FALSE;
   description	= "Mo�esz podszkoli� mnie w walce?";
};

FUNC INT DIA_GorBoba_3927_TEACH_01_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_HELLO_01))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorBoba_3927_TEACH_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_01_15_01"); //Mo�esz podszkoli� mnie w walce?
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_02"); //Niestety, nie mam na to czasu.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_03"); //Chocia�... Mog� da� ci pewn� wskaz�wk�, dzi�ki kt�rej b�dziesz zadawa� nieco mocniejsze uderzenia. Powiedz, gdy b�dziesz got�w.
};

//========================================
//-----------------> 3927_TEACH_02
//========================================

INSTANCE DIA_GorBoba_3927_TEACH_02 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 4;
   condition    = DIA_GorBoba_3927_TEACH_02_Condition;
   information  = DIA_GorBoba_3927_TEACH_02_Info;
   permanent	= FALSE;
   description	= "Jestem got�w.";
};

FUNC INT DIA_GorBoba_3927_TEACH_02_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_TEACH_01))
{
    return TRUE;   
};
};

FUNC VOID DIA_GorBoba_3927_TEACH_02_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_15_01"); //Jestem got�w.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_15_02"); //Przed wyprowadzeniem uderzenia skup si� i we� g��boki wdech. Wyprowadzaj�c atak, wypu�� powietrze z p�uc i pozw�l broni na swobodny ruch w kierunku przeciwnika.
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_03_03"); //Dzi�kuj�.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_03_04"); //Ta wiedza mo�e uratowa� ci �ycie. Korzystaj z niej m�drze.
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};