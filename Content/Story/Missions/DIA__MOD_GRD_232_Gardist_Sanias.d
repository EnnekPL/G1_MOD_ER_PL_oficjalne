
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gardist232_EXIT(C_INFO)
{
	npc             = GRD_232_Gardist;
	nr              = 999;
	condition		= DIA_Gardist232_EXIT_Condition;
	information		= DIA_Gardist232_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gardist232_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gardist232_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NIEPOKORNY1
//========================================

INSTANCE DIA_Gardist_NIEPOKORNY1 (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_NIEPOKORNY1_Condition;
   information  = DIA_Gardist_NIEPOKORNY1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_NIEPOKORNY1_Condition()
{
    if (hero.guild == gil_stt)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_NIEPOKORNY1_Info()
{
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_01"); //Powinniœmy porozmawiaæ.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_03"); //Niedawno do naszego Obozu trafi³ pewien cz³owiek imieniem Oned, do³¹czy³ do Kopaczy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_04"); //I co w tym z³ego?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_05"); //Ten palant nie zamierza p³aciæ Stra¿nikom podatku od bezpieczeñstwa. Myœli, ¿e sam da sobie tu radê.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_06"); //Czemu wiêc Stra¿nicy nie obij¹ mu porz¹dnie pyska?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_07"); //Wkrótce do tego dojdzie, o ile nic siê nie zmieni. Ale lepiej by³oby gdyby Stra¿nicy go nie katowali.
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_08"); //Reszta Kopaczy uzna³aby go za bohatera i pewnie odbi³oby siê to na wydajnoœci ich pracy. 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_09"); //No to jak daæ Onedowi nauczkê? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_10"); //Có¿ proponuje ci niez³¹ sumkê za za³atwienie tej sprawy w odpowiedni sposób.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_11"); //Masz jakieœ wskazówki?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_12"); //Oned przyjaŸni siê z niejakim Lothem. Mo¿e gdyby go przekonaæ do naszych intencji to Oned z ³atwoœci¹ wpad³by w nasze ³apy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_13"); //Porozmawiam z nim.
    MIS_Niepokorny_Kopacz = LOG_RUNNING;

    Log_CreateTopic          	(CH1_Niepokorny_Kopacz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_RUNNING);
    B_LogEntry               		(CH1_Niepokorny_Kopacz,"Zaczepi³ mnie Sanias i zleci³ pewne zadanie. W Starym Obozie pojawi³ siê skazaniec imieniem Oned. Typ jest odwa¿ny i nie ma zamiaru p³aciæ Stra¿nikom za ochronê. Sanias chce to zmieniæ, jednak Stra¿nicy nie mog¹ tak po prostu pobiæ Oneda. Trzeba to zrobiæ rêkami innych Kopaczy. Mam porozmawiaæ z Lothem, który kumpluje siê z Onedem. Byæ mo¿e on przemówi nowemu do rozs¹dku zanim stanie mu siê coœ z³ego.");
};


//========================================
//-----------------> NIEPOKORNY2
//========================================

INSTANCE DIA_Gardist_NIEPOKORNY2 (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_NIEPOKORNY2_Condition;
   information  = DIA_Gardist_NIEPOKORNY2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_NIEPOKORNY2_Condition()
{
    if (NiepokornyKopacz < Wld_GetDay())
    && (Npc_KnowsInfo (hero, DIA_Buddler_BuddlersPaid))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_NIEPOKORNY2_Info()
{
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_01"); //S³ysza³eœ?! 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_03"); //O ³omocie jaki dosta³ Oned. Nastêpnego dnia zap³aci³ Stra¿nikom i wygl¹da na to, ¿e bêdzie to ju¿ robi³ regularnie.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_04"); //Zatem mi siê uda³o. A skoro tak, to jesteœ mi coœ winien, czy¿ nie? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_05"); //Oczywiœcie, oto twoja nagroda. W pe³ni na ni¹ zas³u¿y³eœ.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Rozliczy³em siê z Saniasem. By³ zadowolony z takiego obrotu spraw. ");
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_SUCCESS);
    MIS_Niepokorny_Kopacz = LOG_SUCCESS;

	CreateInvItems (self, itminugget,40);
	B_GiveInvItems (self,other,itminugget,40);
    B_GiveXP (100);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Gardist_Hello (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_Hello_Condition;
   information  = DIA_Gardist_Hello_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Gardist_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gardist_Hello_Info()
{
    AI_Output (other, self ,"DIA_Gardist_Hello_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_02"); //Wo³aj¹ na mnie Sanias.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_03"); //To nie jest twoje prawdziwe imiê?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_04"); //Nie. 
    AI_Output (other, self ,"DIA_Gardist_Hello_15_05"); //Wiêc jak naprawdê masz na imiê? 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_06"); //Nie wiem.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_07"); //Jak to nie wiesz?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_08"); //Mia³em trudne dzieciñstwo. Niezbyt wiele z niego pamiêtam.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_09"); //Nie pamiêtam chocia¿by mojej prawdziwej rodziny. Podobno jakiœ wieœniak znalaz³ mnie w lesie, gdy mia³em zaledwie cztery lata.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_10"); //Prawdopodobnie mieszka³em wczeœniej wraz z rodzicami w lesie. Myœlê, ¿e mogli byæ banitami. A mój dom sp³on¹³ w po¿arze. 
    AI_Output (other, self ,"DIA_Gardist_Hello_15_11"); //Myœla³em, ¿e ma³o pamiêtasz. Sk¹d o tym wszystkim wiesz?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_12"); //Gdy doros³em, pozna³em szczegó³y tajemniczego odnalezienia. Kilkanaœcie metrów od miejsca w którym le¿a³em stadko wilków po¿ar³o jak¹œ kobietê.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_13"); //Myœlê, ¿e to mog³a byæ moja matka. Ch³opi oczywiœcie zabili wilki i obejrzeli cia³o. Ubranie by³o ca³e okopcone i ubrudzone w sadzy. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_14"); //Ucieka³a z po¿aru i zabra³a mnie ze sob¹. Jednak napad³y j¹ wilki. Ja prze¿y³em, a ona nie. Ocali³a mi ¿ycie.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_15"); //Wspania³e poœwiêcenie. A wiesz coœ na temat ojca? 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_16"); //Oczywiœcie ta sprawa nie dawa³a mi spokoju. Gdy mia³em ju¿ dwadzieœcia piêæ wiosen na karku poprosi³em, aby zaprowadzono mnie w miejsce, w którym mnie znaleziono. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_17"); //Niechêtnie, ale uda³o mi siê przekonaæ do tego mojego starego, przybranego wuja. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_18"); //Gdy dotarliœmy na miejsce, ruszy³em na samotn¹ wêdrówkê w g³¹b lasu. By³a to puszcza niezbadana, a wieœniacy znali wy³¹cznie jej obrze¿a.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_19"); //Po godzinie drogi wg³¹b, wœród identycznych drzew w koñcu natrafi³em na coœ, co przypomina³o pogorzelisko sprzed wielu lat. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_20"); //To musia³ byæ mój dom. Znalaz³em tam kilka spalonych ludzkich koœci. Mo¿esz siê domyœlaæ do kogo nale¿a³y.

    Info_ClearChoices		(DIA_Gardist_Hello);
    Info_AddChoice		(DIA_Gardist_Hello, DIALOG_BACK, DIA_Gardist_Hello_BACK);
    Info_AddChoice		(DIA_Gardist_Hello, "To przykre.", DIA_Gardist_Hello_Sorry);
};

FUNC VOID DIA_Gardist_Hello_BACK()
{
    Info_ClearChoices		(DIA_Gardist_Hello);
};

FUNC VOID DIA_Gardist_Hello_Sorry()
{
    AI_Output (other, self ,"DIA_Gardist_Hello_Sorry_15_01"); //To przykre.
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_02"); //Dziêki. 
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_03"); //Po odkryciu tej tajemnicy ogarn¹³ mnie tak g³êboki ¿al, ¿e zacz¹³em dzieñ w dzieñ spijaæ siê w karczmie.
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_04"); //Moja przybrana rodzina i przyjaciele zostawili mnie. Wpad³em wiêc w z³e towarzystwo.
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_05"); //PóŸniej dopuœci³em siê bójki w dzielnicy portowej. Bójki ze skutkiem œmiertelnym dla mojego oponenta. 
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_06"); //Ale to stare dzieje.
    AI_Output (other, self ,"DIA_Gardist_Hello_Sorry_15_07"); //Nie zawsze wszystko siê uk³ada tak, jak chcemy. 
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_08"); //Hej, opowiedzia³em ci sporo o sobie, a nawet nie wiem jak masz na imiê. 
    AI_Output (other, self ,"DIA_Gardist_Hello_Sorry_15_09"); //Jestem...
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_10"); //A zreszt¹ zaczekaj, nie mów. Czym s¹ imiona wobec potêgi przeznaczenia? Mo¿esz zmieniæ imiê, a przeznaczenia i tak nie odmienisz. 
    Info_ClearChoices		(DIA_Gardist_Hello);
};

