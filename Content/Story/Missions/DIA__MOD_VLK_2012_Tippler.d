//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Tippler_EXIT(C_INFO)
{
	npc             = VLK_3999_Tippler;
	nr              = 999;
	condition		= DIA_Tippler_EXIT_Condition;
	information		= DIA_Tippler_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Tippler_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Tippler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Tippler_HELLO (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 1;
   condition    = DIA_Tippler_HELLO_Condition;
   information  = DIA_Tippler_HELLO_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Tippler_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Tippler_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Tippler_HELLO_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Tippler_HELLO_03_02"); //Próbujê znaleŸæ coœ do jedzenia.
    AI_Output (other, self ,"DIA_Tippler_HELLO_15_03"); //Ciê¿ko ci siê ¿yje w Obozie?
    AI_Output (self, other ,"DIA_Tippler_HELLO_03_04"); //Niestety! By³oby lepiej, gdyby nie moja zwichniêta rêka.
	AI_Output (other, self ,"DIA_Tippler_HELLO_15_05"); //Jak to siê sta³o?
	AI_Output (self, other ,"DIA_Tippler_HELLO_03_06"); //To by³ wypadek, Ÿle uderzy³em w ska³ê, kilof siê odbi³ i wykrzywi³ mi rêkê. 
	AI_Output (self, other ,"DIA_Tippler_HELLO_03_07"); //Nie jestem w stanie pracowaæ, wiêc nie mam rudy.
};

//========================================
//-----------------> SZLACHTA
//========================================

INSTANCE DIA_Tippler_SZLACHTA (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 2;
   condition    = DIA_Tippler_SZLACHTA_Condition;
   information  = DIA_Tippler_SZLACHTA_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o ludziach w Obozie.";
};

FUNC INT DIA_Tippler_SZLACHTA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Tippler_SZLACHTA_Info()
{//te¿ fix 1210
    AI_Output (other, self ,"DIA_Tippler_SZLACHTA_15_01"); //Opowiedz mi o ludziach w Obozie.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_02"); //Nie powiem ci za du¿o o Magnatach ani Magach Ognia, bo ich nie znam. Po Zewnêtrznym Pierœcieniu krêc¹ siê tylko Stra¿nicy i Kopacze.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_03"); //O Gomezie mogê wspomnieæ jedynie to, ¿e on tu rz¹dzi. Nigdy w ¿yciu go nawet nie widzia³em.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_04"); //Ma swoich doradców, oraz zaufanych ludzi. Najwa¿niejsi to Diego, Lorenzo i Thorus. Ka¿dy jest zwierzchnikiem innej kasty.
	AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_05"); //Diego kontroluje Cieni, Lorenzo Kopaczy, a Thorus Stra¿ników. Na tych ludzi proponujê ci uwa¿aæ, a jeœli przyjdzie ci z nimi porozmawiaæ...
	AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_06"); //...to uwa¿aj na s³owa. Jedno Ÿle wypowiedziane zdanie i skoñczysz po³amany w jakiejœ beczce. 
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_07"); //Je¿eli chodzi o Kopaczy, to radzê ci mieæ dobre stosunki chocia¿by z Gravo. Pomaga takim jak ty i nie bierze du¿o za swoje us³ugi.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_08"); //Dobrze znaæ siê ze Snafem i Manheimem. Kucharze i karczmarze zawsze s¹ szanowani. 
    AI_Output (other, self ,"DIA_Tippler_SZLACHTA_15_09"); //Ktoœ jeszcze?
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_10"); //Uwa¿aj na zabijaków takich jak Herek, Erens czy Bonie i Clayde. Ci ostatni s¹ szczególnie niebezpieczni, bo wymuszaj¹ myto.  
};

//========================================
//-----------------> NEK_DED
//========================================

INSTANCE DIA_Tippler_NEK_DED (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 3;
   condition    = DIA_Tippler_NEK_DED_Condition;
   information  = DIA_Tippler_NEK_DED_Info;
   permanent	= FALSE;
   description	= "Co wiesz o zabójstwie Neka?";
};

FUNC INT DIA_Tippler_NEK_DED_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Tippler_NEK_DED_Info()
{
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_01"); //Co wiesz o zabójstwie Neka?
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_02"); //A dlaczego mnie o to pytasz? 
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_03"); //Wiem, ¿e kilku z was coœ wie. Nie ukrywaj tego, bo pogadamy inaczej.
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_04"); //Cz³owieku, uspokój siê. Nie widzisz, ¿e mam niew³adn¹ rêkê? Nie bêdê w stanie siê obroniæ!
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_05"); //No wiêc streszczaj siê, kole¿ko, jeœli chcesz mieæ przynajmniej jedn¹ rêkê.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_06"); //Po prostu chcê, ¿ebyœ potwierdzi³ u Thorusa, ¿e to Z³y go zabi³. Widzia³eœ, s³ysza³eœ, nie wiem... To nieistotne. 
	AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_07"); //Wystarczy tylko, ¿e powiesz to zwierzchnikowi Stra¿ników. 
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_08"); //Sk¹d wiesz, ¿e to Z³y? Ktoœ ju¿ ci to wyjawi³?
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_09"); //Skaza mi powiedzia³. By³ ponoæ œwiadkiem tego zabójstwa, ale Thorus mu nie uwierzy³. Dziwi mnie, ¿e by³o a¿ tylu œwiadków, a nikt nic nie mówi. 
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_10"); //Jak to siê sta³o? Z³y odstawia³ jakieœ przedstawienie w którym mordowa³ tego goœcia, a wy je ogl¹daliœcie? 
	AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_11"); //Na chwilê obecn¹ tak to wygl¹da z mojego punktu widzenia. 
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_12"); //Nie, nie. To nie tak! To zbieg okolicznoœci. Nie wiem co tam robi³ Skaza, jego pytaj, ale co do mnie i Jesse to le¿eliœmy razem w rowie.
	AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_13"); //Na Innosa... 
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_14"); //To nie tak! Byliœmy tego wieczora w karczmie i schlaliœmy siê jak dzikie œwinie. Potem wyszliœmy za Obóz.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_15"); //Jako ¿e by³a ciep³a noc po³o¿y³em siê obok wielkiego kamienia i zagada³em z Jesse o starych czasach. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_16"); //Po chwili on te¿ usiad³, a ¿e zwin¹³ Manheimowi jedn¹ butelkê piwa, postanowi³ j¹ opró¿niæ. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_17"); //Wszystko by³o w porz¹dku do czasu, gdy nie us³yszeliœmy ha³asów z groty. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_18"); //Jesse oczywiœcie stwierdzi³, ¿e to dwa kretoszczury siê pieprz¹, ale ja poszed³em to sprawdziæ i wtedy zobaczy³em... cholera.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_19"); //Zobaczy³em jak Nek jeszcze drga i ³apie siê za serce z którego wystaje sztylet. W jaskini by³ jeszcze Kyle. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_20"); //Dr¿a³ jak osika przyparty do œciany. Widocznie nie spodziewa³ siê takiego obrotu sprawy. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_21"); //Tymczasem podszed³ do mnie mój kompan, chwyci³ za bark i kaza³ stamt¹d znikaæ. Pobiegliœmy do Obozu, jednak po drodze mignê³a mi ciemna postaæ.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_22"); //Sta³a za ska³¹ i ch³odno siê przygl¹da³a. Wtedy myœla³em, ¿e to duch, ale teraz przypuszczam, ¿e to w³aœnie by³ Skaza.  
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_23"); //Nastêpnego dnia udawaliœmy, ¿e nic siê nie sta³o. Zw³aszcza, ¿e Z³y wynaj¹³ dwóch groŸnych Cieni. Chodzili ko³o nas i wpatrywali siê wrogo. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_24"); //WyraŸnie zrozumieliœmy przekaz. Postanowiliœmy nic nie mówiæ.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_25"); //Zrób coœ, ¿eby nie byli ju¿ dla nas groŸni, a powiem o wszystkim Thorusowi. 
    B_LogEntry                     (CH1_SpysProblems,"Tippler wie o zabójstwie Neka. Opowiedzia³ mi ca³¹ historiê. Poœwiadczy to u Thorusa, jeœli pozbêdê siê siepaczy Z³ego."); 
    HeroKnowsSlyKillNek = true;
};

//========================================
//-----------------> OKQUEST
//========================================

INSTANCE DIA_Tippler_OKQUEST (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 4;
   condition    = DIA_Tippler_OKQUEST_Condition;
   information  = DIA_Tippler_OKQUEST_Info;
   permanent	= FALSE;
   description	= "Zrobi³em co kaza³eœ.";
};

FUNC INT DIA_Tippler_OKQUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    && (MIS_SpysProblems == LOG_RUNNING)
	&& (Npc_IsDead(GRD_2014_Siepacz))
    && (Npc_IsDead(GRD_2013_Siepacz))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Tippler_OKQUEST_Info()
{
    AI_Output (other, self ,"DIA_Tippler_OKQUEST_15_01"); //Zrobi³em, co kaza³eœ.
    AI_Output (self, other ,"DIA_Tippler_OKQUEST_03_02"); //Wszyscy nie ¿yj¹? 
    AI_Output (other, self ,"DIA_Tippler_OKQUEST_15_03"); //Tak, jesteœcie bezpieczni.
    AI_Output (self, other ,"DIA_Tippler_OKQUEST_03_04"); //Œwietnie! Mo¿esz ju¿ iœæ do Thorusa.
    B_LogEntry                     (CH1_SpysProblems,"Uda³o mi siê przekonaæ Tipplera do zeznañ.");
};

//========================================
//-----------------> NIEPOKORNY1
//========================================

INSTANCE DIA_Tippler_NIEPOKORNY1 (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 1;
   condition    = DIA_Tippler_NIEPOKORNY1_Condition;
   information  = DIA_Tippler_NIEPOKORNY1_Info;
   permanent	= FALSE;
   description	= "Oned planuje nawiaæ dziœ w nocy. (zap³aæ 50 bry³ek)";
};

FUNC INT DIA_Tippler_NIEPOKORNY1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_NIEPOKORNY2))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Tippler_NIEPOKORNY1_Info()
{
    AI_Output (other, self ,"DIA_Tippler_NIEPOKORNY1_15_01"); //Oned planuje nawiaæ dziœ w nocy.
    AI_Output (self, other ,"DIA_Tippler_NIEPOKORNY1_03_02"); //Co?! Przecie¿ jest mi winien rudê. Trzeba go zatrzymaæ.
    AI_Output (other, self ,"DIA_Tippler_NIEPOKORNY1_15_03"); //Masz tu 50 bry³ek na dodatkow¹ motywacje. Masz dziœ w nocy obserwowaæ Oneda i jego kompana Lotha. A gdy zaczn¹ uciekaæ to ich powstrzymaj.
    AI_Output (self, other ,"DIA_Tippler_NIEPOKORNY1_03_04"); //Zgoda, ale chyba nie bêdê sam? Przez moj¹ kontuzjê nie mogê zdzia³aæ za wiele.
	AI_Output (other, self ,"DIA_Tippler_NIEPOKORNY1_15_05"); //Nie bêdziesz.
    B_GiveInvItems (other, self, ItMiNugget, 50);
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Tippler do³¹czy do grupy Kopaczy, którzy zasadz¹ siê na Oneda.");
  
};

 
