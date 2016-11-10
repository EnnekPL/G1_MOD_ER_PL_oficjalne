//========================================
//-----------------> About Joru
//========================================

INSTANCE DIA_Student_AboutJoru (C_INFO)
{
   npc          = NOV_1313_Novize;
   nr           = 1;
   condition    = DIA_Student_AboutJoru_Condition;
   information  = DIA_Student_AboutJoru_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Student_AboutJoru_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Joru_WeedProposition)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Student_AboutJoru_Info()
{
    CreateInvItem (self, ItMis_LetterFromStudent);
	B_GiveInvItems (self, hero, ItMis_LetterFromStudent,1);
	AI_StopProcessInfos	(self);
	
	B_LogEntry          (CH2_KalomsNewWeed,"Tu� po rozmowie z Joru jego ucze� wsun�� mi w kiesze� list. Musz� go przeczyta�.");
};

//========================================
//-----------------> Night
//========================================

INSTANCE DIA_Student_Night (C_INFO)
{
   npc          = NOV_1313_Novize;
   nr           = 1;
   condition    = DIA_Student_Night_Condition;
   information  = DIA_Student_Night_Info;
   permanent	= FALSE;
   description 	= "Jestem, tak jak prosi�e�.";
};

FUNC INT DIA_Student_Night_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Student_AboutJoru)) && (ItemUsed_LetterFromStudent == TRUE)  && (MIS_KalomsNewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Student_Night_Info()
{
    AI_Output (other, self,"DIA_Student_Night_15_00"); //Jestem, tak jak prosi�e�.
	AI_Output (self, other,"DIA_Student_Night_01_01"); //A wi�c chcesz si� dosta� do przepisu Kaloma, tak?
	AI_Output (self, other,"DIA_Student_Night_01_02"); //My�l�, �e mog� ci w tym pom�c. Mam informacj� i przedmiot, dzi�ki kt�rym uda ci si� zaszanta�owa� Joru.
	AI_Output (other, self,"DIA_Student_Night_15_03"); //Czego chcesz w zamian?
	AI_Output (self, other,"DIA_Student_Night_01_02"); //200 bry�ek rudy. �adnych negocjacji. I tak ju� du�o ryzykuj�.
	
	B_LogEntry          (CH2_KalomsNewWeed,"Jeden z uczni�w Joru zaproponowa� mi sprzeda� informacji, kt�ra powinna mi pom�c przekona� Joru. Jednak �yczy sobie za ni� 200 bry�ek rudy.");
};

//========================================
//-----------------> LetsTrade
//========================================

INSTANCE DIA_Student_LetsTrade (C_INFO)
{
   npc          = NOV_1313_Novize;
   nr           = 1;
   condition    = DIA_Student_LetsTrade_Condition;
   information  = DIA_Student_LetsTrade_Info;
   permanent	= FALSE;
   description 	= "Masz tu 200 bry�ek rudy. A teraz m�w co wiesz.";
};

FUNC INT DIA_Student_LetsTrade_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Student_Night)) && (Npc_HasItems (hero, itminugget) >= 200 )  && (MIS_KalomsNewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Student_LetsTrade_Info()
{
    AI_Output (other, self,"DIA_Student_LetsTrade_15_00"); //Masz tu 200 bry�ek rudy. A teraz m�w co wiesz.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_01"); //Oto klucz do skrzyni w chacie Joru. W �rodku znajdziesz inne przepisy Cor Kaloma. 
	AI_Output (self, other,"DIA_Student_LetsTrade_01_02"); //Joru nie raz ju� sprzedawa� sekretne receptury Guru. Mi�dzy innymi to dzi�ki niemu nawet Cienie w Starym Obozie mog� sobie pozwoli� na Mrok P�nocy.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_03"); //Oczywi�cie Kalom nie wie, sk�d wyciekaj� informacje. I lepiej niech tak zostanie. 
	AI_Output (self, other,"DIA_Student_LetsTrade_01_04"); //Wykorzystaj t� wiedz� do zdobycia przepisu, ale ani my�l donosi� na Joru kt�remu� z Guru. Inaczej napytasz sobie biedy.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_05"); //My�l�, �e jeste� rozs�dnym cz�owiekiem. To jak b�dzie?
	AI_Output (other, self,"DIA_Student_LetsTrade_15_06"); //W porz�dku. Nie zale�y mi �eby Joru straci� g�ow�. Chc� wy��cznie przepisu.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_07"); //Wi�c wiesz co robi�.
	
	B_GiveInvItems (hero, self, itminugget, 200);
	CreateInvItems (self, ItMis_JoruKey,1);
	B_GiveInvItems (self, hero, ItMis_JoruKey,1);
	
	B_LogEntry          (CH2_KalomsNewWeed,"Ucze� da� mi klucz, dzi�ki kt�remu dostan� si� do zawarto�ci skrzyni w chacie Joru. Mam tam znale�� przepisy, kt�re Joru wykrad� wcze�niej Guru. Dzi�ki temu b�d� m�g� go zaszanta�owa�.");
};