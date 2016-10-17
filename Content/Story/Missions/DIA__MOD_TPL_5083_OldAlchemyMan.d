
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_OldAlchemyMan_EXIT(C_INFO)
{
	npc             = TPL_5083_OldAlchemyMan;
	nr              = 999;
	condition		= DIA_OldAlchemyMan_EXIT_Condition;
	information		= DIA_OldAlchemyMan_EXIT_Info;
	permanent		= false;
	description     = "Powodzenia w lepszym �wiecie. (KONIEC)";
};

FUNC INT DIA_OldAlchemyMan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OldAlchemyMan_EXIT_Info()
{
	AI_Output (other, self ,"DIA_OldAlchemyMan_EXIT_15_01"); //Powodzenia w lepszym �wiecie.
    AI_Output (self, other ,"DIA_OldAlchemyMan_EXIT_03_02"); //Trzymaj si�, ch�opcze. 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"die");
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_OldAlchemyMan_HELLO1 (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 1;
   condition    = DIA_OldAlchemyMan_HELLO1_Condition;
   information  = DIA_OldAlchemyMan_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_OldAlchemyMan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_OldAlchemyMan_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_01"); //Arrgh... Wreszcie �ywy cz�owiek!
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO1_15_02"); //Co tutaj robisz?!
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_03"); //Prowadzi�em badania nad tym miejscem. S�dzi�em, �e...
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO1_15_04"); //Niby jak tutaj wszed�e�?!
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_05"); //B��ka�em si� po tych kompleksach, gdy nagle us�ysza�em ork�w. Postanowi�em si� schowa�. Nie mog�em si� wr�ci�. Musia�em biec w g��b jaskini.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_06"); //W ko�cu dotar�em do g��wnej sali, tej w kt�rej przed chwil� by�e�. Z g�rnego pi�tra zacz�li na mnie biec orkowie.
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_07"); //Nagle zauwa�y�em odr�niaj�c� si� od innych �cian�. By�a pod ni� szczelina. Prze�lizgn��em si� przez ni� przez przypadek zawadzaj�c o mechanizm. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_08"); //�ciana opad�a ca�kiem, a ja wola�em nie pr�bowa� jej otwiera�. Tak trafi�em tutaj.
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_09"); //Niestety �ciana zmia�d�y�a moj� stop� i straci�em przez to du�o krwi. Wkr�tce umr�. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_OldAlchemyMan_HELLO2 (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 2;
   condition    = DIA_OldAlchemyMan_HELLO2_Condition;
   information  = DIA_OldAlchemyMan_HELLO2_Info;
   permanent	= FALSE;
   description	= "Orkowie dali ci doj�� a� tutaj?!";
};

FUNC INT DIA_OldAlchemyMan_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_OldAlchemyMan_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO2_15_01"); //Orkowie dali ci doj�� a� tutaj?!
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_02"); //Nie wiedzieli o mnie. Dopiero p�niej us�yszeli ha�as. Ponadto przyby� kolejny oddzia� z zewn�trz. 
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_03"); //W��czy�em si� po tym zapomnianym miejscu przez jaki� czas.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_04"); //Siedz� ju� tutaj od kliku godzin. Jaki� czas temu s�ysza�em jakby g�osy Stra�nik�w �wi�tynnych i Baal Lukora. 
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_05"); //Byli tutaj?
	AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO2_15_06"); //Tak, wykonywali specjaln� misj�, ale to ju� przesz�o��.
};

//========================================
//-----------------> GURUS
//========================================

INSTANCE DIA_OldAlchemyMan_GURUS (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 1;
   condition    = DIA_OldAlchemyMan_GURUS_Condition;
   information  = DIA_OldAlchemyMan_GURUS_Info;
   permanent	= FALSE;
   description	= "Czy to nie ty mia�e� bada� kamienie na bagnie dla Guru?";
};

FUNC INT DIA_OldAlchemyMan_GURUS_Condition()
{
    if (MIS_OldAlchemist == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OldAlchemyMan_GURUS_Info()
{
    AI_Output (other, self ,"DIA_OldAlchemyMan_GURUS_15_01"); //Czy to nie ty mia�e� bada� kamienie na bagnie dla Guru?
    AI_Output (self, other ,"DIA_OldAlchemyMan_GURUS_03_02"); //Masz racj�. (kaszle) Moje badania zaprowadzi�y mnie a� tutaj.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_OldAlchemyMan_HELLO4 (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 4;
   condition    = DIA_OldAlchemyMan_HELLO4_Condition;
   information  = DIA_OldAlchemyMan_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co uda�o ci si� wybada�?";
};

FUNC INT DIA_OldAlchemyMan_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_GURUS)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_OldAlchemyMan_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO4_15_01"); //Co uda�o ci si� wybada�?
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_02"); //Nic konkretnego. Nie znalaz�em tutaj �adnych zapisk�w ani wskaz�wek.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_03"); //Ciebie zapewne interesuj� wyniki bada�, kt�re zlecili mi Guru. 
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_04"); //Co do tych �wietlistych punkt�w na bagnie, to s� to czary �ycia i ducha.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_05"); //Zauwa�y�em, �e b�d�c w ich pobli�u, szybciej regenerowa�em swoj� energi�. Jednak trzeba posiada� specjalne umiej�tno�ci.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_06"); //Jaki� mag musia� natchn�� te kamienie pot�n� energi�.
	AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO4_15_07"); //Dlaczego postanowi�e� szuka� w�a�nie tutaj? 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_08"); //S�dzi�em, �e kamienie na bagnie mog� mie� zwi�zek z orkowymi obrz�dami pogrzebowymi. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_09"); //Jak zapewne wiesz, obrz�dami kierowali szamani. Tylko oni mogli grzeba� ork�w. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_10"); //Wysnu�em tez�, �e moc tkwi�ca w tych kamieniach pomaga�a orkom przej�� do kr�lestwa Beliara. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_11"); //Prawdopodobnie jednak si� myli�em. Spotka�a mnie za to najgorsza kara. Wkr�tce umr�. 
	AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO4_03_12"); //Mo�e mog� ci jako� pom�c? 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_13"); //Nie, ch�opcze. Orkowy top�r rozci�� mi sk�r� na lewej r�ce. Wda�o si� zaka�enie. Nic ju� nie mo�na zrobi�.
    B_LogEntry                     (CH2_OldAlchemist,"Prawie martwy alchemik ostatnimi si�ami wyszepta� mi, �e �wietliste punkty na bagnie to czary - pot�ne kamienie natchni�to magiczn� moc�.");
	B_givexp (150);
};


