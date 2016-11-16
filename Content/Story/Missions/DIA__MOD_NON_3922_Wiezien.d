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
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_01"); //No proszê, widzê, ¿e uda³o siê tu wejœæ komuœ innemu ni¿ najbardziej zaufani Stra¿nicy Gomeza. Czego tu szukasz?
    AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_02"); //Siekacz powiedzia³ mi, ¿e w lochach od dawna nie ma ¿adnych wiêŸniów. Postanowi³em sprawdziæ to osobiœcie.
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_03"); //Ach, czyli rozumiem, ¿e wpychasz nos tam gdzie nie powinieneœ? Te¿ kiedyœ pope³nia³em ten sam b³¹d, przez to w³aœnie znalaz³em siê w tej zapchlonej Kolonii.
    AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_04"); //Za co ciê zamknêli?
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_05"); //Kiszki skrêcaj¹ mi siê z g³odu. Ten przeklêty Bullit przynosi mi tu tylko jakieœ och³apy. 
    AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_06"); //W porz¹dku, przyniosê ci coœ do jedzenia.
    AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_07"); //Przynieœ mi 2 kawa³ki miêsa, chleb, piwo i ser, a bêdê w pe³ni zadowolony.
	AI_Output (other, self ,"DIA_Jaredd_HELLO1_15_08"); //Chyba jesteœ zbyt wybredny. Nie zapomnia³eœ czasem, ¿e siedzisz w lochu?
	AI_Output (self, other ,"DIA_Jaredd_HELLO1_03_09"); //B³agam ciê, wieki temu mia³em coœ porz¹dnego w ustach. Zrób mi tê przys³ugê, a nie po¿a³ujesz.
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
   description	= "Przynios³em jedzenie, teraz opowiedz mi za co ciê zamknêli.";
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
                    AI_Output (other, self ,"DIA_Jaredd_HELLO2_15_01"); //Przynios³em jedzenie, teraz opowiedz mi za co ciê zamknêli.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_02"); //Najpierw daj mi siê spokojnie najeœæ.
                    B_GiveInvItems (other, self, ItFoMutton, 2);
                    B_GiveInvItems (other, self, ItFoLoaf, 1);
                    B_GiveInvItems (other, self, ItFoBeer, 1);
                    B_GiveInvItems (other, self, ItFoCheese, 1);
                    AI_UseItem (self, ItFoMutton);
					AI_UseItem (self, ItFoLoaf);
					AI_UseItem (self, itfobeer);
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_03"); //No, w porz¹dku. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_04"); //Pochodzê z Nordmaru, lodowej krainy znajduj¹cej siê na pó³noc od Myrtany. Pracowa³em jako górnik w kopalni rudy nale¿¹cej do Klanu M³ota.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_05"); //Na Przodków, mamy tam tak¹ kopalnie i piec na rudê, ¿e te jaskinie zwane kopalniami w Kolonii mog¹ siê schowaæ. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_06"); //Tutaj podczas przetapiania rudy traci ona swoje w³aœciwoœci magiczne.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_07"); //Piec w kopalni Klanu M³ota pochodzi z czasów Pradawnych, potrafi spopieliæ wszystko, a tak¿e zachowuje magiczne w³aœciwoœci rudy. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_08"); //Niestety orkowie z Pó³nocnych Ziem wci¹¿ nas atakuj¹. Kopalnia jest pod w³adz¹ Myrtany, ale to my, nordmarczycy w niej pracujemy.
                    AI_Output (other, self ,"DIA_Jaredd_HELLO2_15_09"); //Ciekawe... Interesowa³o mnie jednak, za co tu trafi³eœ.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_10"); //Nie popêdzaj mnie! Zaraz przejdê do rzeczy. A wiêc pracowa³em w kopalni jako górnik, jednak pewnego dnia chcia³em siê bardziej wzbogaciæ. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_11"); //Wiesz... wykraœæ trochê czystej rudy i sprzedaæ j¹ na przyk³ad w Varrancie.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_12"); //Ludzie na pustyni chêtnie kupuj¹ rzeczy z Pó³nocy.
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_13"); //Niestety, gdy krad³em rudê w nocy, nagle przy³apa³ mnie Ingvar - jeden z wytapiaczy mojego Klanu.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_14"); //Wœciek³ siê i krzycza³ o zdradzie. Po czym doniós³ mnie do Tjalfa, przywódcy Klanu, który zgodnie z prawem narzuconym nam przez Rhobara odda³ mnie w rêce królewskich ¿o³nierzy. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_15"); //Tak oto trafi³em tutaj.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_16"); //W Kolonii wszyscy doceniali moj¹ niepospolit¹ si³ê, któr¹ charakteryzujê siê mój naród. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_17"); //Szybko zyska³em szacunek w Starym Obozie i zosta³em najlepszym wojownikiem na arenie Scatty'ego. Pewnego dnia stoczy³em pojedynek z Waltasem, Stra¿nikiem ze Starego Obozu.
                    AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_18"); //Uderzy³em trochê za mocno, co skoñczy³o siê jego œmierci¹. Po walce, na arenê wpad³ Thorus, ca³y purpurowy ze z³oœci. Odda³ mnie w rêce Gomeza i za karê mam odsiedzieæ rok w lochu. 
					AI_Output (self, other ,"DIA_Jaredd_HELLO2_03_19"); //To by by³o na tyle mojej historii.
					
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
    AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_03_01"); //I jest jeszcze coœ...
    AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_03_02"); //Przez jakiœ czas siedzia³em tu z pewnym wiêŸniem, który podawa³ siê za Felgora ¯elazn¹ Garotê. 
	Info_ClearChoices	(DIA_Jaredd_ABOUT_FELGOR);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"A kim by³ Felgor?" ,DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"Co mia³by robiæ w tych lochach?" ,DIA_Jaredd_ABOUT_FELGOR_WHATHEDO);
};

func void DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_15_01"); //A kim by³ Felgor?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_03_02"); //Nie mów, ¿e nie wiesz kim by³ Felgor.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_03_03"); //Swego czasu by³ najbardziej zaufanym cz³owiekiem Gomeza i pierwszym przywódc¹ przybocznej stra¿y Magnatów.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHOISFELGOR_03_04"); //To od jego przydomku nazywa siê ich Garotnikami lub po prostu ¯elazn¹ Garot¹. 
	Info_ClearChoices	(DIA_Jaredd_ABOUT_FELGOR);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"Jak Felgor tu trafi³?" ,DIA_Jaredd_ABOUT_FELGOR_WHAT);
	Info_AddChoice		(DIA_Jaredd_ABOUT_FELGOR,"Gdzie jest teraz Felgor?" ,DIA_Jaredd_ABOUT_FELGOR_WHERE);
};

func void DIA_Jaredd_ABOUT_FELGOR_WHATHEDO ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_15_01"); //Co dowódca elitarnej gwardii przybocznej Gomeza robi³by w lochach?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_03_02"); //Wiesz, ³aska pañska na pstrym koniu jeŸdzi. Z tego co ten cz³owiek twierdzi³, to Gomez zacz¹³ siê po prostu obawiaæ, jakoby Felgor chcia³ zaj¹æ jego miejsce. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_03_03"); //Wszystkiemu mia³ byæ winien Skelden, który chcia³ wygryŸæ ¯elazn¹ Garotê i zaj¹æ jego miejsce. Dlatego mia³ s¹czyæ jad przeciwko Felgorowi. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHATHEDO_03_04"); //Je¿eli to prawda, to Skelden dopi¹³ swego. 
};

func void DIA_Jaredd_ABOUT_FELGOR_WHAT ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_15_01"); //Jak Felgor tu trafi³?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_02"); //Gomez wiedzia³, ¿e na Felgorze mo¿na polegaæ, wiêc od czasu do czasu zleca³ mu oraz jego ludziom ró¿norakie misje. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_03"); //Ponoæ podczas wykonywania jednego z zadañ Felgor zgin¹³. Oczywiœcie w Starym Obozie ¿egnano go jako bohatera. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_04"); //Sam Gomez nada³ dowodzonej przez poleg³ego bohatera elitarnej stra¿y nazwê ¯elazna Garota. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_05"); //Z tego co jednak mówi³ mi tamten wiêzieñ, to w rzeczywistoœci ¿egnane w Starym Obozie szcz¹tki wcale nie nale¿a³y do Felgora. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_06"); // Sam Felgor w wyniku intrygi zaplanowanej przez Skeldena mia³ zostaæ z rozkazu Gomeza pojmany i uwiêziony w lochu. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_07"); //O ca³ym planie wiedzia³o tylko kilka osób. Byli to g³ównie przyjaciele Skeldena.
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_15_08"); //Wierzysz w tê historiê? 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_09"); //Sam nie wiem. Wydawa³o siê, ¿e tamten cz³owiek œwiêcie wierzy³ w to co mówi³. Z drugiej strony nie jednemu ju¿ tu odebra³o rozum. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_10"); //Ostatnie dni skazañca z którym tu siedzia³em by³y dla niego mêczarni¹. Popad³ w ob³êd.  
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_11"); //Nie móg³ sobie poradziæ z samym sob¹. Zadawa³ sobie ból, kaleczy³ siê o ostre przedmioty, gada³ sam do siebie.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHAT_03_12"); //Mo¿e i to faktycznie by³ Felgor... 
};

func void DIA_Jaredd_ABOUT_FELGOR_WHERE ()
{
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_15_01"); //Gdzie jest teraz Felgor?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_02"); //Pamiêtam jak pewnego dnia obudzi³ mnie jego krzyk. Okaza³o siê, ¿e wyd³uba³ sobie gwoŸdziem oko.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_03"); //Zacz¹³ wrzeszczeæ, przeklinaæ Skeldena i Stra¿ników. Mówi³ te¿ coœ o liœcie do Gomeza.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_04"); //By³o go s³ychaæ a¿ na górze, dlatego po chwili przyby³ Skelden i zabra³ go z celi. Najprawdopodobniej zosta³ zamordowany. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_05"); //Pamiêtam jaki by³em wtedy ucieszony. Wreszcie skoñczy³o siê to wycie. Poza tym przez tydzieñ dostawa³em dwie porcje ¿arcia. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_06"); //Jest jeszcze coœ. Ten cz³owiek zostawi³ mi to...
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_15_07"); //Co to jest?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_08"); //Powiedzia³, ¿e to jego kajdanki i ostatnim ¿yczeniem jest, aby Skelden do nich nie dotar³. 
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_09"); //Wiedzia³em, ¿e wkrótce umrze, wiêc spe³ni³em jego wolê i je ukry³em. WeŸ je. Ukry³em je w tym worku. Nie wiem czy je ukrad³, czy to faktycznie ¯elazna Garota, ale chcê siê ich pozbyæ.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_10"); //W Nordmarze mówiono, ¿e duchy ludzi, którzy przed œmierci¹ popadli w ob³êd powracaj¹ do takich rzeczy.
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_11"); //Nie chcê mieæ nic do czynienia z zaœwiatami! 
	AI_Output (other, self ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_15_12"); //Mo¿e ducha Felgora mo¿na by³oby przyzwaæ i poznaæ prawdê?
	AI_Output (self, other ,"DIA_Jaredd_ABOUT_FELGOR_WHERE_03_13"); //Czyœ ty oszala³?! Przyzwanie duchów to nie dla mnie. IdŸ sobie!
	
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
    AI_Output (self, other ,"DIA_Jaredd_HELLO3_03_01"); //No proszê, widzê ¿e nabra³eœ trochê krzepy. Dobra robota, synu Dziêki tobie wyjdê na wolnoœæ. 
	AI_Output (self, other ,"DIA_Jaredd_HELLO3_03_02"); //Uwolnij jeszcze Stone'a, jeœli jeszcze tego nie zrobi³eœ. Zostanê tutaj i pomogê mu w pracy.
    AI_Output (other, self ,"DIA_Jaredd_HELLO3_15_03"); //Trzymaj siê, wojowniku.
    AI_Output (self, other ,"DIA_Jaredd_HELLO3_03_04"); //Ty te¿.
	
	NPC_ExchangeRoutine	(self, "anvil");
	
	AI_StopProcessInfos (self);
};