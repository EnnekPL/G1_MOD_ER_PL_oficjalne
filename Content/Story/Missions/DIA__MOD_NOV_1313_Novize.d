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
	
	B_LogEntry          (CH2_KalomsNewWeed,"Tu¿ po rozmowie z Joru jego uczeñ wsun¹³ mi w kieszeñ list. Muszê go przeczytaæ.");
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
   description 	= "Jestem, tak jak prosi³eœ.";
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
    AI_Output (other, self,"DIA_Student_Night_15_00"); //Jestem, tak jak prosi³eœ.
	AI_Output (self, other,"DIA_Student_Night_01_01"); //A wiêc chcesz siê dostaæ do przepisu Kaloma, tak?
	AI_Output (self, other,"DIA_Student_Night_01_02"); //Myœlê, ¿e mogê ci w tym pomóc. Mam informacjê i przedmiot, dziêki którym uda ci siê zaszanta¿owaæ Joru.
	AI_Output (other, self,"DIA_Student_Night_15_03"); //Czego chcesz w zamian?
	AI_Output (self, other,"DIA_Student_Night_01_02"); //200 bry³ek rudy. ¯adnych negocjacji. I tak ju¿ du¿o ryzykujê.
	
	B_LogEntry          (CH2_KalomsNewWeed,"Jeden z uczniów Joru zaproponowa³ mi sprzeda¿ informacji, która powinna mi pomóc przekonaæ Joru. Jednak ¿yczy sobie za ni¹ 200 bry³ek rudy.");
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
   description 	= "Masz tu 200 bry³ek rudy. A teraz mów co wiesz.";
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
    AI_Output (other, self,"DIA_Student_LetsTrade_15_00"); //Masz tu 200 bry³ek rudy. A teraz mów co wiesz.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_01"); //Oto klucz do skrzyni w chacie Joru. W œrodku znajdziesz inne przepisy Cor Kaloma. 
	AI_Output (self, other,"DIA_Student_LetsTrade_01_02"); //Joru nie raz ju¿ sprzedawa³ sekretne receptury Guru. Miêdzy innymi to dziêki niemu nawet Cienie w Starym Obozie mog¹ sobie pozwoliæ na Mrok Pó³nocy.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_03"); //Oczywiœcie Kalom nie wie, sk¹d wyciekaj¹ informacje. I lepiej niech tak zostanie. 
	AI_Output (self, other,"DIA_Student_LetsTrade_01_04"); //Wykorzystaj tê wiedzê do zdobycia przepisu, ale ani myœl donosiæ na Joru któremuœ z Guru. Inaczej napytasz sobie biedy.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_05"); //Myœlê, ¿e jesteœ rozs¹dnym cz³owiekiem. To jak bêdzie?
	AI_Output (other, self,"DIA_Student_LetsTrade_15_06"); //W porz¹dku. Nie zale¿y mi ¿eby Joru straci³ g³owê. Chcê wy³¹cznie przepisu.
	AI_Output (self, other,"DIA_Student_LetsTrade_01_07"); //Wiêc wiesz co robiæ.
	
	B_GiveInvItems (hero, self, itminugget, 200);
	CreateInvItems (self, ItMis_JoruKey,1);
	B_GiveInvItems (self, hero, ItMis_JoruKey,1);
	
	B_LogEntry          (CH2_KalomsNewWeed,"Uczeñ da³ mi klucz, dziêki któremu dostanê siê do zawartoœci skrzyni w chacie Joru. Mam tam znaleŸæ przepisy, które Joru wykrad³ wczeœniej Guru. Dziêki temu bêdê móg³ go zaszanta¿owaæ.");
};