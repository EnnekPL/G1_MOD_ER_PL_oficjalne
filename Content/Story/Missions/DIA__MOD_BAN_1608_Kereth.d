//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bandyta33_EXIT(C_INFO)
{
	npc             	= BAN_1608_Kereth;
	nr              	= 999;
	condition		= DIA_Bandyta33_EXIT_Condition;
	information	= DIA_Bandyta33_EXIT_Info;
	permanent	= TRUE;
	description    = DIALOG_ENDE;
};

FUNC INT DIA_Bandyta33_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bandyta33_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Bandyta_HELLO1 (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_HELLO1_Condition;
   information  = DIA_Bandyta_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Bandyta_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bandyta_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Bandyta_HELLO1_03_02"); //Nazywam si� Kereth. 
    AI_Output (other, self ,"DIA_Bandyta_HELLO1_15_03"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Bandyta_HELLO1_03_04"); //Obecnie nie mam zaj�cia. Zreszt� nie mia� bym teraz g�owy do niczego. 
};

//========================================
//-----------------> Quest
//========================================

INSTANCE DIA_Bandyta_Quest (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_Quest_Condition;
   information  = DIA_Bandyta_Quest_Info;
   permanent	= FALSE;
   description	= "Dlaczego nie mia�by� g�owy?";
};

FUNC INT DIA_Bandyta_Quest_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Bandyta_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_Quest_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Quest_15_01"); //Dlaczego nie mia�by� g�owy?
    AI_Output (self, other ,"DIA_Bandyta_Quest_03_02"); //M�j brat niedawno zmar�...
    AI_Output (other, self ,"DIA_Bandyta_Quest_15_03"); //Przykro mi.
    AI_Output (self, other ,"DIA_Bandyta_Quest_03_04"); //Nie to jest najgorsze. Kto� ci�gle rozkopuje jego gr�b i nie wiem dlaczego. Mo�e m�g�by� mi jako� pom�c?
	AI_Output (other, self ,"DIA_Bandyta_Quest_15_05"); //W jaki spos�b?
	AI_Output (self, other ,"DIA_Bandyta_Quest_03_06"); //Id� na jego gr�b i poszukaj poszlak. By� mo�e ja co� przeoczy�em. Cholera, strasznie rozbity jestem.
	AI_Output (other, self ,"DIA_Bandyta_Quest_15_07"); //Gdzie jest jego gr�b?
	AI_Output (self, other ,"DIA_Bandyta_Quest_03_08"); //Wyjd� z Obozu i udaj si� delikatnie na prawo. Tam go znajdziesz. 
	
	MIS_DestroyedGrave = LOG_RUNNING;

    Log_CreateTopic          (CH1_DestroyedGrave, LOG_MISSION);
    Log_SetTopicStatus      (CH1_DestroyedGrave, LOG_RUNNING);
    B_LogEntry             	  (CH1_DestroyedGrave,"Bandyta Kereth ma pewien problem. Kto� ci�gle rozkopuje gr�b jego zmar�ego brata. Mam tam p�j�� i poszuka� jakich� poszlak. Gr�b znajd� na prawo od wyj�cia z Obozu Bandyt�w.");
	
	//Wld_InsertItem	   (ItMi_JoshSwordElement,"OW_PATH_190");
};

//========================================
//-----------------> FindSwordElement
//========================================

INSTANCE DIA_Bandyta_FindSwordElement (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_FindSwordElement_Condition;
   information  = DIA_Bandyta_FindSwordElement_Info;
   permanent	= FALSE;
   description	= "Znalaz�em fragment miecza.";
};

FUNC INT DIA_Bandyta_FindSwordElement_Condition()
{	
	if (MIS_DestroyedGrave == LOG_RUNNING) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_FindSwordElement_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FindSwordElement_15_01"); //Znalaz�em fragment miecza. Faktycznie z tob� �le. Jest ca�kiem du�y. Nie wiem jak mog�e� go nie zauwa�y�.
    AI_Output (self, other ,"DIA_Bandyta_FindSwordElement_03_02"); //Poka� mi to. Mam taki podobny fragment. Nawet do siebie pasuj�. R�wnie� zna�em go przy grobie. 
    AI_Output (other, self ,"DIA_Bandyta_FindSwordElement_15_03"); //Co to mo�e znaczy�?
    AI_Output (self, other ,"DIA_Bandyta_FindSwordElement_03_04"); //Kto� widocznie niszczy gr�b przy u�yciu swojej broni. To jaki� kretyn. Po uderzeniu w kamie� ostrze musia�o p�kn��. 
	AI_Output (self, other ,"DIA_Bandyta_FindSwordElement_03_05"); //Id� do Puna i zapytaj czy pami�ta komu sprzedawa� taki miecz. Mo�e to b�dzie jaka� wskaz�wka.
	
    B_LogEntry               (CH1_DestroyedGrave,"Bandyta Kereth ma pewien problem. Kto� ci�gle rozkopuje gr�b jego zmar�ego brata. Mam tam p�j�� i poszuka� jakich� poszlak. Gr�b znajd� na prawo od wyj�cia z Obozu Bandyt�w.");
};

//========================================
//-----------------> ItsJens
//========================================

INSTANCE DIA_Bandyta_ItsJens (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_ItsJens_Condition;
   information  = DIA_Bandyta_ItsJens_Info;
   permanent	= FALSE;
   description	= "Gada�em z Punem.";
};

FUNC INT DIA_Bandyta_ItsJens_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Raeuber_SwordElement))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_ItsJens_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_ItsJens_15_01"); //Gada�em z Punem.
    AI_Output (self, other ,"DIA_Bandyta_ItsJens_03_02"); //Co� wiesz?
    AI_Output (other, self ,"DIA_Bandyta_ItsJens_15_03"); //Sprzeda� ten miecz Jensowi.
    AI_Output (self, other ,"DIA_Bandyta_ItsJens_03_04"); //Wiedzia�em! Ten sukinsyn zawsze mi wadzi�. Najpewniej to on te� stoi za zab�jstwem. 
	AI_Output (other, self ,"DIA_Bandyta_ItsJens_15_05"); //W jaki spos�b w og�le zgin�� tw�j brat?
	AI_Output (self, other ,"DIA_Bandyta_ItsJens_03_06"); //Czy to wa�ne? To ta gnida zabi�a Rayana! Id�, spytaj czy ma jakie� wyt�umaczenie.  
	
    B_LogEntry               (CH1_DestroyedGrave,"W�ciek�y Kereth kaza� mi oskar�y� Jensa. Dowody wskazuj�, �e to on rozkopuje gr�b. Co wi�cej Kereth twierdzi, �e stoi on tak�e za morderstwem.");
};

//========================================
//-----------------> TalkWithJens
//========================================

INSTANCE DIA_Bandyta_TalkWithJens (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_TalkWithJens_Condition;
   information  = DIA_Bandyta_TalkWithJens_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Jensem.";
};

FUNC INT DIA_Bandyta_TalkWithJens_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Jens_YourSwordPieces)) && (JensIsVictimOfKereth)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_TalkWithJens_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_01"); //Rozmawia�em z Jensem.
    AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_02"); //I jak?
    AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_03"); //My�l�, �e jest winny. Pr�bowa� mi sprzeda� jak�� historyjk�, �e miecz kto� mu ukrad� w przededniu zab�jstwa.
	AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_04"); //S�ysza�em ju� takie rzeczy setki razy... 
    AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_05"); //Wida�, �e masz �eb na karku, kole�! Dobrze, �e spotka�em kogo� takiego jak ty. 
	AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_06"); //Gdy Quentin si� o wszystkim dowie, Jensa spotka zas�u�ona kara. Zrobi�e� ju� dla mnie bardzo du�o, ale musz� ci� prosi� o...
	AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_05"); //Po�wiadczenie Quentinowi?
	AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_06"); //Tak, miejmy to ju� z g�owy. Po prostu powiedz mu co wiesz. 
	
    B_LogEntry               (CH1_DestroyedGrave,"Kereth pogratulowa� mi, �e nie da�em si� nabra� na historyjk� Jensa. Musz� jeszcze tylko opowiedzie� wszystko Quentinowi. Licz�, �e Kereth nie�le mnie wynagrodzi.");
};

//========================================
//-----------------> TalkWithQuentin
//========================================

INSTANCE DIA_Bandyta_TalkWithQuentin (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_TalkWithQuentin_Condition;
   information  = DIA_Bandyta_TalkWithQuentin_Info;
   permanent	= FALSE;
   description	= "Oszuka�e� mnie!";
};

FUNC INT DIA_Bandyta_TalkWithQuentin_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Quentin_JensIsKiller))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_TalkWithQuentin_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_15_01"); //Oszuka�e� mnie! Jens nie zabi� twojego brata. 
    AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_03_02"); //To twoja wina! Da�e� im sobie wm�wi�, �e Jens jest niewinny. Zebra�e� za ma�o dowod�w.
	Info_ClearChoices	(DIA_Bandyta_TalkWithQuentin);
    Info_AddChoice		(DIA_Bandyta_TalkWithQuentin, "Zas�u�y�e� na porz�dne lanie.", DIA_Bandyta_TalkWithQuentin_Fight);
    Info_AddChoice		(DIA_Bandyta_TalkWithQuentin, "Zapomnijmy o ca�ej sprawie.", DIA_Bandyta_TalkWithQuentin_Calm);
};

FUNC VOID DIA_Bandyta_TalkWithQuentin_Fight ()
{
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Fight_15_01"); //Przesta� traktowa� mnie jak sko�czonego durnia! Dopilnuj�, �eby� ju� nie wpad� na pomys� oszukiwania kogokolwiek. 
    AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Fight_03_02"); //No to spr�buj swoich si�! 
	
	CreateInvItems (self, itminugget,100);
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,""); 
};

FUNC VOID DIA_Bandyta_TalkWithQuentin_Calm ()
{
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Calm_15_01"); //Zapomnijmy o ca�ej sprawie.
    AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_02"); //Dobry pomys�. C�, nie wysz�o to wszystko tak jak planowa�em... Gdybym m�g� pracowa� przy u�yciu narz�dzi Jensa zyska�bym nieco szacunku i niez�y doch�d.
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Calm_15_03"); //Dlaczego po prostu nie mogli�cie pracowa� razem?
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_04"); //Jens nie chcia� nikogo do siebie dopu�ci�. Wielokrotnie oferowa�em mu pomoc jednak nie przepada� za mn� wi�c zawsze odmawia�. 
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Calm_15_05"); //Jeszcze jedna kwestia... Co tak naprawd� sta�o si� z twoim bratem? 
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_06"); //Nie mam poj�cia. Nie posun��bym si� przecie� do zab�jstwa. To by�a jedyna osoba w tym cholernym miejscu, kt�rej mog�em ufa�.
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_07"); //Znale�li�my go pewnego dnia martwego z drobnymi obra�eniami. Mo�e napad� go jaki� zwierz? Nie wiem, nie wiem...
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_08"); //S�uchaj, widz�, �e jeste� w porz�dku. Masz tu 50 bry�ek rudy za t� nieudan� akcj�.
	
	CreateInvItems (self, itminugget,100);
	B_GiveINvItems (self,other,itminugget,50);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AngryKereth
//========================================

INSTANCE DIA_Bandyta_AngryKereth (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_AngryKereth_Condition;
   information  = DIA_Bandyta_AngryKereth_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_AngryKereth_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_BriamsEvidence))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_AngryKereth_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_AngryKereth_03_01"); //Ty sukinsynu! My�lisz, �e jeste� cwany?   
    AI_Output (other, self ,"DIA_Bandyta_AngryKereth_15_02"); //Pr�bowa�e� mnie oszuka�, ale zostawi�e� za sob� zbyt du�o �lad�w.
    AI_Output (self, other ,"DIA_Bandyta_AngryKereth_03_03"); //Zaraz oberwiesz! 
	
	AI_StopProcessInfos	(self);
    CreateInvItems (other, ItMiNugget, 100);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};
