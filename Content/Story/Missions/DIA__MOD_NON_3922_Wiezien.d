//******poprawione dialogi, dodana rutyna **********

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Jaredd_EXIT(C_INFO)
{
	npc             = NON_3922_Wiezien;
	nr              = 999;
	condition	= DIA_Jaredd_EXIT_Condition;
	information	= DIA_Jaredd_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Jaredd_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jaredd_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Jaredd_HELLO1 (C_INFO)
{
   npc          = NON_3922_Wiezien;
   nr           = 1;
   condition    = DIA_Jaredd_HELLO1_Condition;
   information  = DIA_Jaredd_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jaredd_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Jaredd_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_01"); //No prosz�, widz�, �e uda�o si� tu wej�� komu� innemu ni� najbardziej zaufani Stra�nicy Gomeza. Czego tu szukasz?
    AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_02"); //Siekacz powiedzia� mi, �e w lochach od dawna nie ma �adnych wi�ni�w. Postanowi�em sprawdzi� to osobi�cie.
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_03"); //Ach, czyli rozumiem, �e wpychasz nos tam gdzie nie powiniene�? Te� kiedy� pope�nia�em ten sam b��d, przez to w�a�nie znalaz�em si� w tej zapchlonej Kolonii.
    AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_04"); //Za co ci� zamkn�li?
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_05"); //Kiszki skr�caj� mi si� z g�odu. Ten przekl�ty Bullit przynosi mi tu tylko jakie� och�apy. 
    AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_06"); //W porz�dku, przynios� ci co� do jedzenia.
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_07"); //Przynie� mi 2 kawa�ki mi�sa, chleb, piwo i ser, a b�d� w pe�ni zadowolony.
	AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_08"); //Chyba jeste� zbyt wybredny. Nie zapomnia�e� czasem, �e siedzisz w lochu?
	AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_09"); //B�agam ci�, wieki temu mia�em co� porz�dnego w ustach. Zr�b mi t� przys�ug�, a nie po�a�ujesz.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Jaredd_HELLO2 (C_INFO)
{
   npc          = NON_3922_Wiezien;
   nr           = 2;
   condition    = DIA_Jaredd_HELLO2_Condition;
   information  = DIA_Jaredd_HELLO2_Info;
   permanent	= FALSE;
   description	= "Przynios�em jedzenie, teraz opowiedz mi za co ci� zamkn�li.";
};

FUNC INT DIA_Jaredd_HELLO2_Condition()
{
    if (Npc_HasItems (hero, ItFoMutton) >=2)
    && (Npc_HasItems (hero, ItFoLoaf) >=1)
    && (Npc_HasItems (hero, ItFoBeer) >=1)
    && (Npc_HasItems (hero, ItFoCheese) >=1)
	&& (Npc_KnowsInfo (hero,DIA_Jaredd_HELLO1))
    {
    return TRUE;
    };
};
FUNC VOID DIA_Jaredd_HELLO2_Info()
{
                    AI_Output (other, self ,"DIA_Jaredd_HELLO2_15_01"); //Przynios�em jedzenie, teraz opowiedz mi za co ci� zamkn�li.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_02"); //Najpierw daj mi si� spokojnie naje��.
                    B_GiveInvItems (other, self, ItFoMutton, 2);
                    B_GiveInvItems (other, self, ItFoLoaf, 1);
                    B_GiveInvItems (other, self, ItFoBeer, 1);
                    B_GiveInvItems (other, self, ItFoCheese, 1);
                    AI_UseItem (self, ItFoMutton);
					AI_UseItem (self, ItFoLoaf);
					AI_UseItem (self, itfobeer);
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_03"); //No, w porz�dku. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_04"); //Pochodz� z Nordmaru, lodowej krainy znajduj�cej si� na p�noc od Myrtany. Pracowa�em jako g�rnik w kopalni rudy nale��cej do Klanu M�ota.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_05"); //Na Przodk�w, mamy tam tak� kopalnie i piec na rud�, �e te jaskinie zwane kopalniami w Kolonii mog� si� schowa�. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_06"); //Tutaj podczas przetapiania rudy traci ona swoje w�a�ciwo�ci magiczne.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_07"); //Piec w kopalni Klanu M�ota pochodzi z czas�w Pradawnych, potrafi spopieli� wszystko, a tak�e zachowuje magiczne w�a�ciwo�ci rudy. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_08"); //Niestety orkowie z P�nocnych Ziem wci�� nas atakuj�. Kopalnia jest pod w�adz� Myrtany, ale to my, nordmarczycy w niej pracujemy.
                    AI_Output (other, self ,"DIA_Jaredd_HELLO2_15_09"); //Ciekawe... Interesowa�o mnie jednak, za co tu trafi�e�.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_10"); //Nie pop�dzaj mnie! Zaraz przejd� do rzeczy. A wi�c pracowa�em w kopalni jako g�rnik, jednak pewnego dnia chcia�em si� bardziej wzbogaci�. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_11"); //Wiesz... wykra�� troch� czystej rudy i sprzeda� j� na przyk�ad w Varrancie.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_12"); //Ludzie na pustyni ch�tnie kupuj� rzeczy z P�nocy.
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_13"); //Niestety, gdy krad�em rud� w nocy, nagle przy�apa� mnie Ingvar - jeden z wytapiaczy mojego Klanu.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_14"); //W�ciek� si� i krzycza� o zdradzie. Po czym doni�s� mnie do Tjalfa, przyw�dcy Klanu, kt�ry zgodnie z prawem narzuconym nam przez Rhobara odda� mnie w r�ce kr�lewskich �o�nierzy. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_15"); //Tak oto trafi�em tutaj.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_16"); //W Kolonii wszyscy doceniali moj� niepospolit� si��, kt�r� charakteryzuj� si� m�j nar�d. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_17"); //Szybko zyska�em szacunek w Starym Obozie i zosta�em najlepszym wojownikiem na arenie Scatty'ego. Pewnego dnia stoczy�em pojedynek z Waltasem, Stra�nikiem ze Starego Obozu.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_18"); //Uderzy�em troch� za mocno, co sko�czy�o si� jego �mierci�. Po walce, na aren� wpad� Thorus, ca�y purpurowy ze z�o�ci. Odda� mnie w r�ce Gomeza i za kar� mam odsiedzie� rok w lochu. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_19"); //To by by�o na tyle mojej historii.
					
};

//========================================
//-----------------> ABOUT_FELGOR
//========================================

INSTANCE DIA_Jaredd_ABOUT_FELGOR (C_INFO)
{
   npc          = NON_3922_Wiezien;
   nr           = 1;
   condition    = DIA_Jaredd_ABOUT_FELGOR_Condition;
   information  = DIA_Jaredd_ABOUT_FELGOR_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jaredd_ABOUT_FELGOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jaredd_HELLO2))   
    {
    return TRUE;
    };
};

FUNC VOID DIA_Jaredd_ABOUT_FELGOR_Info()
{
    AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_03_01"); //I jest jeszcze co�...
    AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_03_02"); //Przez jaki� czas siedzia�em tu z pewnym wi�niem, kt�ry podawa� si� za Felgora �elazn� Garot�. 
	Info_ClearChoices	(DIA_Jaredd_ABOUT_FELGOR);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"A kim by� Felgor?" ,DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"Co mia�by robi� w tych lochach?" ,DIA_Jaredd_ABOUT_FELGOR_WHATHEDO);
};

func void DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_15_01"); //A kim by� Felgor?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_03_02"); //Nie m�w, �e nie wiesz kim by� Felgor.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_03_03"); //Swego czasu by� najbardziej zaufanym cz�owiekiem Gomeza i pierwszym przyw�dc� przybocznej stra�y Magnat�w.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_03_04"); //To od jego przydomku nazywa si� ich Garotnikami lub po prostu �elazn� Garot�. 
	Info_ClearChoices	(DIA_Jaredd_ABOUT_FELGOR);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"Jak Felgor tu trafi�?" ,DIA_Jaredd_ABOUT_FELGOR_WHAT);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"Gdzie jest teraz Felgor?" ,DIA_Jaredd_ABOUT_FELGOR_WHERE);
};

func void DIA_Jaredd_ABOUT_FELGOR_WHATHEDO ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_15_01"); //Co dow�dca elitarnej gwardii przybocznej Gomeza robi�by w lochach?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_03_02"); //Wiesz, �aska pa�ska na pstrym koniu je�dzi. Z tego co ten cz�owiek twierdzi�, to Gomez zacz�� si� po prostu obawia�, jakoby Felgor chcia� zaj�� jego miejsce. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_03_03"); //Wszystkiemu mia� by� winien Skelden, kt�ry chcia� wygry�� �elazn� Garot� i zaj�� jego miejsce. Dlatego mia� s�czy� jad przeciwko Felgorowi. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_03_04"); //Je�eli to prawda, to Skelden dopi�� swego. 
};

func void DIA_Jaredd_ABOUT_FELGOR_WHAT ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_15_01"); //Jak Felgor tu trafi�?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_02"); //Gomez wiedzia�, �e na Felgorze mo�na polega�, wi�c od czasu do czasu zleca� mu oraz jego ludziom r�norakie misje. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_03"); //Pono� podczas wykonywania jednego z zada� Felgor zgin��. Oczywi�cie w Starym Obozie �egnano go jako bohatera. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_04"); //Sam Gomez nada� dowodzonej przez poleg�ego bohatera elitarnej stra�y nazw� �elazna Garota. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_05"); //Z tego co jednak m�wi� mi tamten wi�zie�, to w rzeczywisto�ci �egnane w Starym Obozie szcz�tki wcale nie nale�a�y do Felgora. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_06"); // Sam Felgor w wyniku intrygi zaplanowanej przez Skeldena mia� zosta� z rozkazu Gomeza pojmany i uwi�ziony w lochu. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_07"); //O ca�ym planie wiedzia�o tylko kilka os�b. Byli to g��wnie przyjaciele Skeldena.
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_15_08"); //Wierzysz w t� histori�? 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_09"); //Sam nie wiem. Wydawa�o si�, �e tamten cz�owiek �wi�cie wierzy� w to co m�wi�. Z drugiej strony nie jednemu ju� tu odebra�o rozum. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_10"); //Ostatnie dni skaza�ca z kt�rym tu siedzia�em by�y dla niego m�czarni�. Popad� w ob��d.  
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_11"); //Nie m�g� sobie poradzi� z samym sob�. Zadawa� sobie b�l, kaleczy� si� o ostre przedmioty, gada� sam do siebie.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_12"); //Mo�e i to faktycznie by� Felgor... 
};

func void DIA_Jaredd_ABOUT_FELGOR_WHERE ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_15_01"); //Gdzie jest teraz Felgor?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_02"); //Pami�tam jak pewnego dnia obudzi� mnie jego krzyk. Okaza�o si�, �e wyd�uba� sobie gwo�dziem oko.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_03"); //Zacz�� wrzeszcze�, przeklina� Skeldena i Stra�nik�w. M�wi� te� co� o li�cie do Gomeza.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_04"); //By�o go s�ycha� a� na g�rze, dlatego po chwili przyby� Skelden i zabra� go z celi. Najprawdopodobniej zosta� zamordowany. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_05"); //Pami�tam jaki by�em wtedy ucieszony. Wreszcie sko�czy�o si� to wycie. Poza tym przez tydzie� dostawa�em dwie porcje �arcia. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_06"); //Jest jeszcze co�. Ten cz�owiek zostawi� mi to...
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_15_07"); //Co to jest?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_08"); //Powiedzia�, �e to jego kajdanki i ostatnim �yczeniem jest, aby Skelden do nich nie dotar�. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_09"); //Wiedzia�em, �e wkr�tce umrze, wi�c spe�ni�em jego wol� i je ukry�em. We� je. Ukry�em je w tym worku. Nie wiem czy je ukrad�, czy to faktycznie �elazna Garota, ale chc� si� ich pozby�.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_10"); //W Nordmarze m�wiono, �e duchy ludzi, kt�rzy przed �mierci� popadli w ob��d powracaj� do takich rzeczy.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_11"); //Nie chc� mie� nic do czynienia z za�wiatami! 
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_15_12"); //Mo�e ducha Felgora mo�na by�oby przyzwa� i pozna� prawd�?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_13"); //Czy� ty oszala�?! Przyzwanie duch�w to nie dla mnie. Id� sobie!
	
	CreateInvItems (self,ItMi_FattersInPocket,1);
	B_GiveInvItems (self,other,ItMi_FattersInPocket,1);
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Jaredd_HELLO3 (C_INFO)
{
   npc          = NON_3922_Wiezien;
   nr           = 3;
   condition    = DIA_Jaredd_HELLO3_Condition;
   information  = DIA_Jaredd_HELLO3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jaredd_HELLO3_Condition()
{
    var C_NPC Gomez; 	Gomez = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_KnowsInfo (hero, DIA_Jaredd_HELLO2))   
    && (Npc_IsDead(Gomez))

    {
    return TRUE;
    };
};

FUNC VOID DIA_Jaredd_HELLO3_Info()
{
    AI_Output (self, other ,"DIA_Jaredd_HELLO3_03_01"); //No prosz�, widz� �e nabra�e� troch� krzepy. Dobra robota, synu Dzi�ki tobie wyjd� na wolno��. 
	AI_Output (self, other ,"DIA_Jaredd_HELLO3_03_02"); //Uwolnij jeszcze Stone'a, je�li jeszcze tego nie zrobi�e�. Zostan� tutaj i pomog� mu w pracy.
    AI_Output (other, self ,"DIA_Jaredd_HELLO3_15_03"); //Trzymaj si�, wojowniku.
    AI_Output (self, other ,"DIA_Jaredd_HELLO3_03_04"); //Ty te�.
	
	NPC_ExchangeRoutine	(self, "anvil");
	
	AI_StopProcessInfos (self);
};