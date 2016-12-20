// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Powodzenia!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch³opcze. Nawzajem.
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jesteœ?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jesteœ?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca³ych 10 lat. Uwierz mi, du¿o ju¿ tu widzia³em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi³em czo³a wielu niebezpieczeñstwom, ale jakoœ uda³o mi siê z nich wybrn¹æ.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pamiêtam jak pracowaliœmy jeszcze w pierwszej kopalni, tej, która teraz stoi pusta. Pewnego dnia nie wytrzyma³y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s³ysza³eœ te¿ o wielu planach ucieczki."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s³ysza³eœ te¿ o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos³uchaj, ch³opcze. Wiem, ¿e chcia³byœ siê st¹d wydostaæ, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St¹d nie ma ucieczki! Widzia³em twarze tych, którzy próbowali sforsowaæ Barierê.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope³niaj tego samego b³êdu. Bariera powstrzyma ka¿dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chcê spêdziæ nastêpnych 10 lat mojego ¿ycia wydobywaj¹c rudê!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo¿e zostaniesz wielk¹ szych¹, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo¿esz pi¹æ siê do góry, ale niewa¿ne jak wysokie stanowisko uda ci siê osi¹gn¹æ - Bariera wreszcie ciê zatrzyma.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa³eœ kiedyœ jako górnik, ch³opcze?
};  

instance  VLK_586_Grimes_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_LEARN_Condition;
	information		= VLK_586_Grimes_LEARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kogoœ, kto nauczy mnie kopaæ rudê."; 
};

FUNC int  VLK_586_Grimes_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0)
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_01"); //Szukam kogoœ, kto nauczy mnie kopaæ rudê.
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_02"); //Ach, to ciebie Ian ostatnio przyj¹³ do pracy. Nauka bêdzie ciê kosztowaæ kilka bry³ek rudy.
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_03"); //Nic nie mam. Ian wszystko mi zabra³. Powiedzia³, ¿e mam wykopaæ 500 bry³ek rudy.
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_04"); //Jesteœ w ciê¿kiej sytuacji, rozumiem. Tym razem zrobiê wiêc wyj¹tek. 
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo¿e mnie nauczyæ jak wydobywaæ rudê. Za naukê nie muszê nic p³aciæ, poniewa¿ jestem Kopaczem.");
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_06"); //Nauka tego fachu nie jest taka trudna, jednak bêdzie ciê to kosztowaæ 60 bry³ek rudy.
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo¿e mnie nauczyæ jak wydobywaæ rudê. Za naukê muszê zap³aciæ 60 bry³ek rudy.");
	};
};

instance  VLK_586_Grimes_START_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_START_LEARN_Condition;
	information		= VLK_586_Grimes_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie kopaæ rudê. (5 punktów nauki, 60 bry³ek jeœli nie jesteœ Kopaczem)"; 
};

FUNC int  VLK_586_Grimes_START_LEARN_Condition()
{	
		if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == 0) 
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_START_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_START_LEARN_Info_15_01"); //Naucz mnie kopaæ rudê.
	if (hero.lp >=5)
	{
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz¹tki nie s¹ zbyt trudne. Musisz umieæ odpowiednio uderzyæ. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa¿niejsza jest rozwaga. WIelu górników zginê³o przyciœniêtych przez ska³y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s³abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbadaæ ska³ê i nieco j¹ rozbiæ. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je¿eli bêdziesz mia³ trochê szczêœcia szybko wydobêdziesz bry³ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pamiêtaj, ¿e ka¿da ¿y³a rudy kiedyœ siê skoñczy.
	VLK_586_Grimes_START_LEARN.permanent = false;
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintS_Ext ("Nowa umiejêtnoœæ: Górnictwo",COL_Lime);
	}
	else
	{
	if (Npc_HasItems (hero, ItMiNugget)>=60)
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_02"); //Pocz¹tki nie s¹ zbyt trudne. Musisz umieæ odpowiednio uderzyæ. 
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_03"); //Najwa¿niejsza jest rozwaga. WIelu górników zginê³o przyciœniêtych przez ska³y, bo uderzali zbyt mocno.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_04"); //Z kolei inni kopali dniami i nocami bez rezultatu, bo uderzali zbyt s³abo lub kopali w nieodpowiednim miejscu.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_05"); //Uderzaj kilka razy lekko, aby zbadaæ ska³ê i nieco j¹ rozbiæ. Potem uderz silnie lub nawet bardzo silnie.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_06"); //Je¿eli bêdziesz mia³ trochê szczêœcia szybko wydobêdziesz bry³ki.
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_07"); //Jeszcze jedno, pamiêtaj, ¿e ka¿da ¿y³a rudy kiedyœ siê skoñczy.
	B_GiveInvItems (other,self, itminugget, 60);
	Npc_RemoveInvItems (self, itminugget,50);
	VLK_586_Grimes_START_LEARN.permanent = false;	
	hero.lp = hero.lp - 5;
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	PrintS_Ext ("Nowa umiejêtnoœæ: Górnictwo",COL_Lime);
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_08"); //Próbujesz okpiæ staruszka? Brakuje ci rudy!
	VLK_586_Grimes_START_LEARN.permanent = true;
	};
	};
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_START_LEARN_Info_04_09"); //Nie mogê ciê niczego nauczyæ! Barkuje ci doœwiadczenia. 
	};
};

//========================================
//-----------------> AKSZYN22
//========================================

INSTANCE DIA_Grimes_AKSZYN22 (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_AKSZYN22_Condition;
   information  = DIA_Grimes_AKSZYN22_Info;
   permanent	= FALSE;
   description	= "Przygotuj siê.";
};

FUNC INT DIA_Grimes_AKSZYN22_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_WLAM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_AKSZYN22_Info()
{
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_01"); //Przygotuj siê.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_02"); //Ju¿ zaczynacie? Gdzie Aleph?
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_03"); //Zrezygnowa³. Ja otworzê zamki. 
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_04"); //Ty tymczasem zatrzymaj tu Iana i jego Stra¿ników.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_05"); //Spokojnie. Bêdê mia³ wszystko na oku.
    B_LogEntry     (CH1_ActionOM,"Rozmawia³em z Grimesem o jego zadaniu. Wie, co ma robiæ. Nie muszê siê martwiæ, ¿e Ian nagle wpadnie na pomys³ zejœcia na dno Kopalni.");
};

//========================================
//-----------------> KILOF
//========================================

INSTANCE DIA_Grimes_KILOF (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 55;
   condition    = DIA_Grimes_KILOF_Condition;
   information  = DIA_Grimes_KILOF_Info;
   permanent	= FALSE;
   description	= "Ten kilof chyba nale¿y do ciebie.";
};

FUNC INT DIA_Grimes_KILOF_Condition()
{
    if (Npc_HasItems (other, ItMwPickaxeGrimes) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_KILOF_Info()
{
    AI_Output (other, self ,"DIA_Grimes_KILOF_15_01"); //Ten kilof chyba nale¿y do ciebie.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_02"); //Uda³o ci siê go znaleŸæ? Wracaj¹ wspomnienia...
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_03"); //Jestem ci bardzo wdziêczny, ¿e mi go przynios³eœ.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_04"); //WeŸ to jako zap³atê.
	B_GiveInvItems (other, self, ItMwPickaxeGrimes, 1);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
};

//========================================
// DIALOG USUNIÊTY =======================
//========================================

INSTANCE DIA_Grimes_GoldMine (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_GoldMine_Condition;
   information  = DIA_Grimes_GoldMine_Info;
   permanent	= FALSE;
   description	= "Szukam kogoœ do pracy w kopalni z³ota.";
};

FUNC INT DIA_Grimes_GoldMine_Condition()
{
    if (MIS_GoldMine == LOG_RUNNING) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_GoldMine_Info()
{
    AI_Output (other, self ,"DIA_Grimes_GoldMine_15_01"); //Szukam kogoœ do pracy w kopalni z³ota.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_02"); //Kopalnia z³ota?
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_03"); //Niby gdzie?
    AI_Output (other, self ,"DIA_Grimes_GoldMine_15_04"); //Hmm... Chyba nie mogê ci powiedzieæ.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_05"); //Dlaczego? 
    AI_Output (other, self ,"DIA_Grimes_GoldMine_15_06"); //Sam nie wiem gdzie jest.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_07"); //Za stary ju¿ jestem na takie przygody.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_08"); //Myœlê, ¿e Glen bêdzie chêtny.
    AI_Output (self, other ,"DIA_Grimes_GoldMine_03_09"); //Jest m³ody i ma wiele si³y.
    B_LogEntry                     (CH2_GoldMine,"Grimes uwa¿a, ¿e Glen bêdzie chêtny do pracy w kopalni z³ota.");

    B_GiveXP (100);
};


//========================================
//-----------------> KAPITEL4_DIALOG
//========================================

INSTANCE DIA_Grimes_KAPITEL4_DIALOG (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_KAPITEL4_DIALOG_Condition;
   information  = DIA_Grimes_KAPITEL4_DIALOG_Info;
   permanent	= FALSE;
   description	= "Witaj!";
};

FUNC INT DIA_Grimes_KAPITEL4_DIALOG_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_KAPITEL4_DIALOG_Info()
{
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_01"); //Witaj!
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_02"); //Mi³o ciê znów widzieæ, ch³opcze. Cieszê siê, ¿e wci¹¿ ¿yjesz. Ostatnio œmieræ wisi w powietrzu nad ka¿dym mieszkañcem Kolonii. 
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_03"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_04"); //A no to, ¿e zaczyna siê wojna. Magowie Ognia i ludzie pracuj¹cy w Starej Kopalni byli jej pierwszymi ofiarami.
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_05"); //Wkrótce i inne obozy padn¹ ofiar¹ szaleñczych zapêdów Gomeza. Nowy Obóz oberwie jako pierwszy.
};

//========================================
//-----------------> GOMEZ_PLAN
//========================================

INSTANCE DIA_Grimes_GOMEZ_PLAN (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 2;
   condition    = DIA_Grimes_GOMEZ_PLAN_Condition;
   information  = DIA_Grimes_GOMEZ_PLAN_Info;
   permanent	= FALSE;
   description	= "Co wiesz o planach Gomeza?";
};

FUNC INT DIA_Grimes_GOMEZ_PLAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_GOMEZ_PLAN_Info()
{
    AI_Output (other, self ,"DIA_Grimes_GOMEZ_PLAN_15_01"); //Co wiesz o planach Gomeza?
    AI_Output (self, other ,"DIA_Grimes_GOMEZ_PLAN_03_02"); //Nic, jestem tylko Kopaczem. Gdyby nie uratowa³o mnie kilku Stra¿ników z obozu przed kopalni¹, podzieli³bym los innych. Chwa³a Innosowi, ¿e w chwili upadku kopalni by³em blisko wyjœcia.
};

//========================================
//-----------------> WAR
//========================================

INSTANCE DIA_Grimes_WAR (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 3;
   condition    = DIA_Grimes_WAR_Condition;
   information  = DIA_Grimes_WAR_Info;
   permanent	= FALSE;
   description	= "Sk¹d wiesz, ¿e wybuchnie wojna?";
};

FUNC INT DIA_Grimes_WAR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_WAR_Info()
{
    AI_Output (other, self ,"DIA_Grimes_WAR_15_01"); //Sk¹d wiesz, ¿e wybuchnie wojna?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_02"); //Rozejrzyj siê tylko, ch³opcze. Gomez zosta³ pozbawiony Ÿród³a dochodów, przez co jego autorytet w Vengardzie mo¿e run¹æ w ka¿dej chwili. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_03"); //Dlatego wys³a³ czêœæ swoich wojsk, aby uderzyli na Nowy Obóz. Wiem, ¿e Lee i jego Najemnicy nie puszcz¹ mu tego p³azem.
    AI_Output (self, other ,"DIA_Grimes_WAR_03_04"); //Bractwo Œni¹cego wesprze Nowy Obóz, jako ¿e Gomez nakaza³ zabiæ wys³anników Bractwa rezyduj¹cych w Obozie. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_05"); //S³ysza³em, ¿e Cor Angar niesamowicie siê wœciek³ i gdy tylko zaczn¹ siê walki, wyœle w ramach zemsty swoich Œwi¹tynnych Stra¿ników. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_06"); //Zbiry z gór tak¿e nie s¹ w dobrym po³o¿eniu. Zapewne teraz, gdy zosta³y wys³ane patrole Stra¿ników ich Obóz zostanie wykryty. S³ysza³em te¿ o planach odnoœnie Opuszczonej Kopalni.
    AI_Output (other, self ,"DIA_Grimes_WAR_15_07"); //Sk¹d ty to wszystko wiesz?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_08"); //Jestem dobrym obserwatorem i mam wielu przyjació³ w Kolonii. St¹d dysponuje wieloma informacjami.
};

//========================================
//-----------------> HISTORY
//========================================

INSTANCE DIA_Grimes_HISTORY (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 4;
   condition    = DIA_Grimes_HISTORY_Condition;
   information  = DIA_Grimes_HISTORY_Info;
   permanent	= FALSE;
   description	= "Prze¿y³eœ a¿ dwa upadki kopalni. Musisz byæ nieŸle wstrz¹œniêty.";
};

FUNC INT DIA_Grimes_HISTORY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_HISTORY_Info()
{
    AI_Output (other, self ,"DIA_Grimes_HISTORY_15_01"); //Prze¿y³eœ a¿ dwa upadki kopalni. Musisz byæ nieŸle wstrz¹œniêty.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_02"); //Dziêkuje za troskê, mój ch³opcze, jednak ze mn¹ wszystko w porz¹dku. By³em na to przygotowany.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_03"); //Oczywiœcie sytuacja nie by³a tak dramatyczna po upadku Opuszczonej Kopalni, jak teraz, ale wierzê, ¿e z pomoc¹ bogów damy radê. 
};

//========================================
//-----------------> SMALLTALK
//========================================

INSTANCE DIA_Grimes_SMALLTALK (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 5;
   condition    = DIA_Grimes_SMALLTALK_Condition;
   information  = DIA_Grimes_SMALLTALK_Info;
   permanent	= TRUE;
   description	= "Co zamierzasz dalej robiæ?";
};

FUNC INT DIA_Grimes_SMALLTALK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_SMALLTALK_Info()
{
    AI_Output (other, self ,"DIA_Grimes_SMALLTALK_15_01"); //Co zamierzasz dalej robiæ?
    AI_Output (self, other ,"DIA_Grimes_SMALLTALK_03_02"); //Zostanê w jaskini i przeczekam ca³e to zamieszanie. Potem chyba zg³oszê siê na ochotnika do pracy w którejœ kopalni.
};