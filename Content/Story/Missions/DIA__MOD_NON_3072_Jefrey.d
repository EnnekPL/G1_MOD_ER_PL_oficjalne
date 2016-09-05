// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Jefrey_EXIT(C_INFO)
{
	npc             = NON_3072_Jefrey;
	nr              = 999;
	condition	= DIA_Jefrey_EXIT_Condition;
	information	= DIA_Jefrey_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Jefrey_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jefrey_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Jefrey_WhoYou (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_WhoYou_Condition;
   information  = DIA_Jefrey_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Jefrey_WhoYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patros_LifeIDsa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_02"); //Nazywam si� Jefrey. Jestem �owc� Poszukiwaczy.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_03"); //�ledz� ci� od pewnego czasu. Ty te� ich szukasz?
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_04"); //Nie ich, lecz tego, kto jest za nich odpowiedzialny.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_05"); //Kto to taki?
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_06"); //Niejaki Czarny Mag. Poszukiwacze pracuj� dla niego.
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_07"); //Zbieraj� dusze niewiernych. 
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_08"); //Wiesz po co im te dusze?
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_09"); //Nie mam poj�cia. Staram si� to usatli�.
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_10"); //To ty odstraszy�e� Poszukiwaczy �cigaj�cych Patrosa?
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_11"); //Tak, to ja.
    AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_12"); //Potraficie z nimi walczy�?
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_13"); //S� bardzo odporni na ogie�. Najlepiej stosowa� inne czary.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_14"); //Taki jak na przyk�ad bry�a lodu.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_15"); //Zwyk�� broni� tak�e mo�na ich zabi�.
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_16"); //Wiesz co, nasza grupa spotyka si� o p�nocy w starych ruinach. 
    AI_Output (self, other ,"DIA_Jefrey_WhoYou_03_17"); //Mo�e pojawisz si� na dzisiejszym spotkaniu?
	AI_Output (other, self ,"DIA_Jefrey_WhoYou_15_18"); //W sumie, to czemu nie. 
	//Npc_ExchangeRoutine (NON_3072_Jefrey , "lowcaPoszukiwaczy");
	//Wld_InsertNpc				(NON_3078_Avallach,"OC1");  
    MIS_LowcyPoszukiwaczy = LOG_RUNNING;
	NPC_ExchangeRoutine (NON_3072_Jefrey,"postart");
    Log_CreateTopic            (CH1_LowcyPoszukiwaczy, LOG_MISSION);
    Log_SetTopicStatus       (CH1_LowcyPoszukiwaczy, LOG_RUNNING);
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Jefrey, �owca Poszukiwaczy zaproponowa� mi spotkanie z nimi. Mog� by� dla mnie bardzo pomocni. Mo�liwe, �e uda�o im si� co� ustali� na temat Czarnego Maga.");
	//AI_StopProcessInfos	(self);
    B_GiveXP (500);
    B_LogEntry                     (CH1_WlakaZczarym,"To Jefrey stoi za ocaleniem Patrosa z r�k Poszukiwaczy. Razem ze swoj� grup� poluj� na te plugawe istoty.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Spotkanie
//========================================

INSTANCE DIA_Jefrey_Spotkanie (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_Spotkanie_Condition;
   information  = DIA_Jefrey_Spotkanie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jefrey_Spotkanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_Spotkanie_Info()
{
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_01"); //Mi�o, �e wpad�e� na nasze spotkanie.
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_02"); //Je�eli chcesz si� dowiedzie� czego� o Poszukiwaczach rozmawiaj z moimi kolegami.
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_03"); //Mo�esz si� te� z nami podzieli� swoimi informacjami. 
    AI_Output (self, other ,"DIA_Jefrey_Spotkanie_03_04"); //Szczeg�lnie Avallach prosi� o nowe wie�ci.
    AI_Output (other, self ,"DIA_Jefrey_Spotkanie_15_05"); //Dobrze, porozmawiam z nim.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Uda�em si� na spotkanie z �owcami Poszukiwaczy. Mog� si� od nich sporo dowiedzie� o walce oraz podzieli� si� z nimi wiedz�.");

    B_GiveXP (200);
};


//========================================
//-----------------> Poszukiwacze
//========================================

INSTANCE DIA_Jefrey_Poszukiwacze (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_Poszukiwacze_Condition;
   information  = DIA_Jefrey_Poszukiwacze_Info;
   permanent	= FALSE;
   description	= "Co wiesz o Poszukiwaczach?";
};

FUNC INT DIA_Jefrey_Poszukiwacze_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_Poszukiwacze_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_Poszukiwacze_15_01"); //Co wiesz o Poszukiwaczach?
    AI_Output (self, other ,"DIA_Jefrey_Poszukiwacze_03_02"); //Niezbyt wiele. Polujemy na nie od niedawna. 
    AI_Output (self, other ,"DIA_Jefrey_Poszukiwacze_03_03"); //W walce pos�uguj� si� runami pirokinezy, kuli ognia, lub ognistego pocisku.
    AI_Output (self, other ,"DIA_Jefrey_Poszukiwacze_03_04"); //Ci�ko ich pokona�, je�eli jest si� nieuwa�nym lub �le przygotowanym.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Jefrey_HELLO2 (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 2;
   condition    = DIA_Jefrey_HELLO2_Condition;
   information  = DIA_Jefrey_HELLO2_Info;
   permanent	= FALSE;
   description	= "Gdzie znajd� Poszukiwaczy?";
};

FUNC INT DIA_Jefrey_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_HELLO2_15_01"); //Gdzie znajd� Poszukiwaczy?
    AI_Output (self, other ,"DIA_Jefrey_HELLO2_03_02"); //Wsz�dzie. Ostatnio pl�taj� si� po ca�ej Kolonii. My�l�, �e na co� czekaj� lub na kogo� poluj�.
    AI_Output (self, other ,"DIA_Jefrey_HELLO2_03_03"); //Szczeg�lnie upodobali sobie przer�ne kr�gi kamienne lub okolice oboz�w.
    AI_Output (other, self ,"DIA_Jefrey_HELLO2_15_04"); //Okolice oboz�w? Czy�by szukali jakiego� cz�owieka?
    AI_Output (self, other ,"DIA_Jefrey_HELLO2_03_05"); //Nie my�la�em tak o tym, ale przypuszczam, �e mo�esz mie� racj�.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Jefrey_HELLO3 (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 3;
   condition    = DIA_Jefrey_HELLO3_Condition;
   information  = DIA_Jefrey_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jak to mo�liwe, �e nigdy wcze�niej ci� nie widzia�em?";
};

FUNC INT DIA_Jefrey_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jefrey_WhoYou)) && (Wld_IsTime   (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_HELLO3_15_02"); //Jak to mo�liwe, �e nigdy wcze�niej ci� nie widzia�em?
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_03"); //To proste: wcze�niej mnie tu po prostu nie by�o. 
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_04"); //Przyby�em do Kolonii kilka dni temu. Dodam, �e z w�asnej woli.
    AI_Output (other, self ,"DIA_Jefrey_HELLO3_15_05"); //Z w�asnej woli? Dlaczego?
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_06"); //Mia�em sen. Koszmarny. Widzia�em te postacie i miejsca z G�rniczej Doliny. Uzna�em to za znak.
    AI_Output (other, self ,"DIA_Jefrey_HELLO3_15_07"); //Z powodu snu postanowi�e� zamkn�� si� w klatce na ca�e �ycie.
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_08"); //Bez przesady. Miejmy nadziej�, �e nie na ca�e. Jestem wierny Innosowi i uzna�em, �e to znak od niego. Misja...
    AI_Output (self, other ,"DIA_Jefrey_HELLO3_03_09"); //Musz� sam dociec czego Innos ode mnie wymaga. Tak, trzeba jak najpr�dzej zbada� spraw� Poszukiwaczy.
};
//========================================
//-----------------> END_QUESTss
//========================================

INSTANCE DIA_Jefrey_END_QUESTss (C_INFO)
{
   npc          = NON_3072_Jefrey;
   nr           = 1;
   condition    = DIA_Jefrey_END_QUESTss_Condition;
   information  = DIA_Jefrey_END_QUESTss_Info;
   permanent	= FALSE;
   description	= "Uda�o mi si�! Pokona�em Czarnego Maga!";
};

FUNC INT DIA_Jefrey_END_QUESTss_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_IsDead(whodie0))
&& (Er_StoryBM_Run == true)    {
    return TRUE;
    };
};


FUNC VOID DIA_Jefrey_END_QUESTss_Info()
{
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_01"); //Uda�o mi si�! Pokona�em Czarnego Maga!
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_02"); //A wi�c nasza praca nie posz�a na marne! Gdyby nie ty, nigdy by nam si� nie uda�o.
    if (MIS_lekiDlaAva == LOG_FAILED)
    {
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_03"); //Niestety Avallach poleg�.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_04"); //Tak. To przykre.
 
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_05"); //Zastanawia mnie jeszcze, dlaczego Czarny Mag wybra� akurat G�rsk� Fortec�. Nie m�g� si� ukry� w podziemiach?
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_06"); //Mo�e szuka� czego� w rotecy? Dowiedzia�e� si� czego� podczas walki z nim?
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_07"); //Powiedzia� tylko, �e dusze potrzebne im by�y do rytua�u. Chcieli przygotowa� �wiat na przybycie pot�nego wys�annika Beliara.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_08"); //Energia pochodz�ca z dusz? S�ysza�em kiedy� o artefaktach, kt�re s� zdolne zogniskowa� magiczn� moc.
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_09"); //No jasne! Kamie� ogniskuj�cy! Czarny Mag go szuka�! 
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_10"); //Na szcz�cie zabrali�my go z Lesterem kilka dni wcze�niej. To dziwne, jak szybko zaroi�o si� tam tyle tych piekielnych stworze�.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_11"); //To ju� nie jest istotne. Gdzie jest kamie� ogniskuj�cy? Trzeba go zabezpieczy�.
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_12"); //O to mo�esz by� spokojny. Jest w r�kach Mag�w Wody.
};    
	AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_13"); //A wi�c nie mam tu ju� nic do roboty. Udam si� do Bractwa. Tamtejsi ludzie potrzebuj� pomocy.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_14"); //S�ysza�e� o �ni�cym?
    AI_Output (other, self ,"DIA_Jefrey_END_QUESTss_15_15"); //Tak, tak. Jestem zamieszany w ca�� t� histori�.
    AI_Output (self, other ,"DIA_Jefrey_END_QUESTss_03_16"); //No dobrze. Wi�c do zobaczenia!
    AI_StopProcessInfos	(self);
};
*/
