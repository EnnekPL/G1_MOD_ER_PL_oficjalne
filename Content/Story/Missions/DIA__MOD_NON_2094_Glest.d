//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Glest_EXIT(C_INFO)
{
	npc             = NON_2094_Glest;
	nr              = 999;
	condition	= DIA_Glest_EXIT_Condition;
	information	= DIA_Glest_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Glest_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Glest_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//dialog nie jest wykorzystywany, poniewa� Glest nie jest ju� spawnowany w Old_camp
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Glest_HELLO1 (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 1;
   condition    = DIA_Glest_HELLO1_Condition;
   information  = DIA_Glest_HELLO1_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Glest_HELLO1_Condition()
{
    if (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Glest_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Glest_HELLO1_03_02"); //Nie najgorzej. Kilka dni temu wr�ci�em z kopalni. Mog� sobie teraz troch� odpocz��.  
};
//koniec

//========================================
//-----------------> First
//========================================

INSTANCE DIA_Glest_First (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 1;
   condition    = DIA_Glest_First_Condition;
   information  = DIA_Glest_First_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Glest_First_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_First_Info()
{
    AI_Output (self, other ,"DIA_Glest_First_03_01"); //Co ty tu robisz? Nie wygl�dasz mi na jednego z lud�i Gomeza.
	AI_Output (other, self ,"DIA_Glest_First_15_02"); //Bo nim nie jestem.
    AI_Output (self, other ,"DIA_Glest_First_03_03"); //W takim razie uciekaj st�d, p�ki mo�esz si� rusza�!
    AI_Output (other, self ,"DIA_Glest_First_15_04"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Glest_First_03_05"); //To miejsce jest przekl�te. Kr�ci si� tu pe�no tych przekl�tych o�ywie�c�w. Wybili nasz ekspedycj� do nogi!
    AI_Output (self, other ,"DIA_Glest_First_03_06"); //Kilku stra�nik�w na marne pr�buje z nimi walczy�. Na razie zdobyli�my most, ale zosta�a nam ju� tylko garstka ludzi. 
    AI_Output (other, self ,"DIA_Glest_First_15_07"); //Akurat �ycie Stra�nik�w nie bardzo mnie martwi...
    AI_Output (self, other ,"DIA_Glest_First_03_08"); //To nie jest teraz istotne. Teoretycznie jeste�my wrogami, a jednak nie zabi�e� mnie. 
    AI_Output (other, self ,"DIA_Glest_First_15_09"); //By� mo�e masz informacje, kt�re mog� mi si� przyda�. Co ci si� tak w og�le sta�o? Uciek�e� z wn�trza kopalni?
    AI_Output (self, other ,"DIA_Glest_First_03_10"); //Tak, ale solidnie oberwa�em. 
    AI_Output (self, other ,"DIA_Glest_First_03_11"); //M�wi� ci: nie id� dalej pod �adnym pozorem! Czai si� tam wy��cznie �mier�. 
    AI_Output (other, self ,"DIA_Glest_First_15_12"); //Mam tam kilka spraw do za�atwienia. Wiesz mo�e sk�d si� bior� o�ywie�cy? 
	AI_Output (self, other ,"DIA_Glest_First_03_13"); //Wen�trz kopalni jest olbrzymia sala. Widzia�em tam jakiego� maga w czarnych szatach. W r�ku dzier�y� pi�kny kamie�. 
	AI_Output (self, other ,"DIA_Glest_First_03_14"); //Wydaje mi si�, �e to dzi�ki niemu udaje mu si� przyzywa� tyle nieumar�ych. 
	AI_Output (other, self ,"DIA_Glest_First_15_15"); //B�d� si� musia� z nim rozprawi�. Postaraj si� dotrze� do kogo�, kto b�dzie ci w stanie pom�c. 
	AI_Output (self, other ,"DIA_Glest_First_03_16"); //Dzi�kuj�, nie b�d� ci ju� wchodzi� w drog�. 
 
	//exp
    B_GiveXP (500);
	
	//spawn zombie 2x
	Wld_InsertNpc		(Zombie,"CAMP02"); 
	Wld_InsertNpc		(Zombie,"OW_PATH_1_16"); 
	
	//zadanie - wpis dla bandyty
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	B_LogEntry                     (CH1_OdbijanieOpKop,"Zaraz po zej�ciu na d� spotka�em rannego Kopacza. Dowiedzia�em si�, �e Stra�nicy kt�rych wys�a� Gomez zostali niemal�e wybici przez hordy o�ywie�c�w wype�zaj�cych spod ziemi. Kopacz twierdzi i� widzia� jakiego� nekromant� dzier��cego pot�ny artefakt, dzi�ki kt�remu mo�e on przywo�ywa� nieumar�ych. Je�li to prawda, b�d� si� musia� z nim zmierzy�.");
	}
	else 
	{
	B_LogEntry                     (CH1_PomocQuentinowi,"Zaraz po zej�ciu na d� spotka�em rannego Kopacza. Dowiedzia�em si�, �e Stra�nicy kt�rych wys�a� Gomez zostali niemal�e wybici przez hordy o�ywie�c�w wype�zaj�cych spod ziemi. Kopacz twierdzi i� widzia� jakiego� nekromant� dzier��cego pot�ny artefakt, dzi�ki kt�remu mo�e on przywo�ywa� nieumar�ych. Je�li to prawda, b�d� si� musia� z nim zmierzy�.");
	};
	
	};

/*
//========================================
//-----------------> ISerachartef
//========================================

INSTANCE DIA_Glest_ISerachartef (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 2;
   condition    = DIA_Glest_ISerachartef_Condition;
   information  = DIA_Glest_ISerachartef_Info;
   permanent	= FALSE;
   description	= "Szukam pewnego artefaktu.";
};

FUNC INT DIA_Glest_ISerachartef_Condition()
{
    if (MIS_CorristoEvil == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_ISerachartef_Info()
{
    AI_Output (other, self ,"DIA_Glest_ISerachartef_15_01"); //Szukam pewnego artefaktu.
    AI_Output (self, other ,"DIA_Glest_ISerachartef_03_02"); //Artefaktu, powiadasz? Po to tutaj przyszed�e�?
    AI_Output (other, self ,"DIA_Glest_ISerachartef_15_03"); //Mi�dzy innymi. Wiesz co� o nim?
    AI_Output (self, other ,"DIA_Glest_ISerachartef_03_04"); //Czy to przez to cholerstwo zjawiaj� si� tu o�ywie�cy?
    AI_Output (other, self ,"DIA_Glest_ISerachartef_15_05"); //By� mo�e. Wiesz gdzie znajd� ten artefakt?
    AI_Output (self, other ,"DIA_Glest_ISerachartef_03_06"); //Nie, ale o�ywie�cy nadchodz� z wn�trza kopalni. Twoje magiczne �wiecide�ko musi gdzie� tam by�. 
    B_LogEntry                     (CH4_CorristoEvil,"Glest twierdzi, �e artefakt znajd� na samym dnie kopalni, bo to w�a�nie stamt�d wychodz� o�ywie�cy.");
	//CreateInvItems (self, Focus_Corristo, 1);
    //B_GiveInvItems (self, other, Focus_Corristo, 1); 1.4 ultra fix
};
*/