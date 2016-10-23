// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "Co s³ychaæ?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Odk¹d rzuci³em robotê w kopalni, nie mogê narzekaæ.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A sk¹d bierzesz œrodki na utrzymanie?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomagam ludziom w rozwi¹zywaniu ich problemów.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Jeœli podpadniesz któremuœ z wp³ywowych ludzi, zg³oœ siê do mnie. Razem coœ wymyœlimy.
};

// **************************************************
//						Groups
// **************************************************

instance DIA_Gravo_Groups(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Groups_Condition;
	information		= DIA_Gravo_Groups_Info;
	permanent		= 0;
	description 	= "Opowiedz mi o kastach w Obozie.";
};                       

FUNC INT DIA_Gravo_Groups_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Groups_Info()
{
	AI_Output (other, self,"DIA_Gravo_Groups_15_00"); //Opowiedz mi o kastach w Obozie.
	AI_Output (self, other,"DIA_Gravo_Groups_04_01"); //Nasze ma³e spo³eczeñstwo dzieli siê na kilka kluczowych grup. Zasady i zale¿noœci panuj¹ce pomiêdzy nimi s¹ bardzo proste. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_02"); //Najni¿ej w hierarchii stoj¹ Kopacze. S¹ to robotnicy pracuj¹cy w kopalni za kilkanaœcie bry³ek tygodniowo.  
	AI_Output (self, other,"DIA_Gravo_Groups_04_03"); //Wy¿ej znajduj¹ siê Cienie. Cienie to ludzie, którym uda³o siê wkraœæ w ³aski Gomeza lub jego najbli¿szego otoczenia.
	AI_Output (other, self,"DIA_Gravo_Groups_15_04"); //Czym siê zajmuj¹?
	AI_Output (self, other,"DIA_Gravo_Groups_04_05"); //Najró¿niejszymi zadaniami. Od polowania na zwierzynê po szpiegowanie, wci¹ganie informacji na drobnych zleceniach koñcz¹c. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_06"); //Stra¿nicy z kolei werbuj¹ siê spoœród Cieni. Choæ wiêkszoœæ z nich otrzyma³a stanowiska za to, ¿e zas³u¿yli siê podczas buntu.
	AI_Output (self, other,"DIA_Gravo_Groups_04_07"); //Ich g³ównym zadaniem jest pilnowanie porz¹dku w Obozie i Starej Kopalni, oraz wykonywanie zadañ bêd¹cych poza mo¿liwoœciami Cieni.
	AI_Output (self, other,"DIA_Gravo_Groups_04_08"); //Wœród Stra¿ników prawdziw¹ elitê stanowi¹ cz³onkowie ¯elaznej Garoty. Nazywamy ich po prostu Garotnikami.
	AI_Output (self, other,"DIA_Gravo_Groups_04_09"); //To przyboczna stra¿ Gomeza. Najlepsi spoœród Stra¿ników, najbardziej zaufani i czasami wrêcz okreœlani mianem fanatycznych.
	AI_Output (self, other,"DIA_Gravo_Groups_04_10"); //Mo¿esz ich rozpoznaæ po symbolu spl¹tanej garoty na pancerzu. Kiedyœ dowodzi³ nimi Felgor, którego zwano ¯elazn¹ Garot¹. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_11"); //Facet w czasie wielkiego buntu skazañców maj¹c zakute rêce zmia¿d¿y³ kajdankami gard³o królewskiemu oficerowi. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_12"); //Po œmierci Felgora zwierzchnikiem Garotników zosta³ Skelden. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_13"); //Poza Stra¿nikami na zamku s¹ rzecz jasna tak¿e Magnaci. To oni wszystko kontroluj¹. Czêsto siêgaj¹ te¿ po rady Magów Ognia.
	AI_Output (self, other,"DIA_Gravo_Groups_04_14"); //To by by³o na tyle.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "Gdybym mia³ k³opoty TY móg³byœ mi pomóc? W jaki sposób?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Gdybym mia³ k³opoty, TY móg³byœ mi pomóc? W jaki sposób?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No za³ó¿my, ¿e nadepn¹³eœ na odcisk Thorusowi. Lepiej nigdy nie w³aziæ mu w drogê, ale wypadki siê zdarzaj¹...
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus potrafi byæ bardzo uparty. Jak raz siê na ciebie wkurzy, nie bêdzie chcia³ zamieniæ z tob¹ s³owa. A to ju¿ bardzo niedobrze.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako ¿ó³todziób, musisz go mieæ po swojej stronie. Wiêc przychodzisz do mnie i mówisz w czym rzecz. Znam tu wiele osób, z których zdaniem liczy siê nawet Thorus.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Oni szepn¹ o tobie dobre s³ówko i Thorus przestanie siê na ciebie boczyæ. Oczywiœcie ch³opcy nie zrobi¹ tego za darmo. Takie przys³ugi kosztuj¹.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A ja pilnujê, ¿eby ruda trafi³a do w³aœciwych osób...

	B_LogEntry(GE_TraderOC,	"Kopacz Gravo oferuje przydatne us³ugi. Gdybym podpad³ kiedyœ wp³ywowym ludziom ze Starego Obozu, mam siê zg³osiæ do niego.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Zgadza siê. Zagi¹³ na ciebie parol.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Poproszê paru ludzi, ¿eby go trochê uspokoili. 100 bry³ek rudy i bêdzie po sprawie.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Zobaczmy ile tu masz... Tak, powinno wystarczyæ. Mo¿esz uznaæ sprawê za nieby³¹.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Tylko nikomu ani s³owa. Zachowuj siê, jakby w ogóle nic siê nie sta³o.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, ch³opcze, ale w takim razie nic nie mogê dla ciebie zrobiæ.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //To maj¹ byæ k³opoty? To jest cholerna katastrofa! Obawiam siê, ¿e on najchêtniej rozdar³by ciê na strzêpy.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Spróbujê przekonaæ paru ludzi, ¿eby siê za tob¹ wstawili, ale to nie bêdzie tanio kosztowaæ. 500 bry³ek rudy, jeœli nie wiêcej!
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Zobaczmy ile tu masz... Widzê, ¿e ci siê poszczêœci³o. Wezmê te 500 bry³ek i spróbujê to wszystko odkrêciæ.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //I pamiêtaj: nigdy, przenigdy nie wspominaj, ¿e pomog³em ci za³atwiæ tê sprawê. Trzymaj jêzyk za zêbami. Zrozumiano?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, ch³opcze, ale w takim razie nic nie mogê dla ciebie zrobiæ.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Z tego co mi wiadomo, nie masz z nim ¿adnego zatargu.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Mo¿esz mi pomóc? Chyba mam k³opoty.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Mo¿esz mi pomóc? Chyba mam k³opoty.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Mogê spróbowaæ, ale uprzedzam - moja pomoc bêdzie ciê kosztowa³a od 100 do 500 bry³ek rudy!
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Pomó¿ mi z Diego."			,DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Pomó¿ mi z Thorusem."			,DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Pomó¿ mi z Gomezem."			,DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pomó¿ mi z Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pomó¿ mi z Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pomó¿ mi z Gomezem.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 0;
	description 	= "Mo¿esz mi powiedzieæ, które Cienie nale¿¹ do najbardziej wp³ywowych?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Mo¿esz mi powiedzieæ, które Cienie nale¿¹ do najbardziej wp³ywowych?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chcesz mieæ po swojej stronie najwa¿niejszych ludzi, co?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Najpotê¿niejszym z Cieni jest Diego. Do jego zaufanych ludzi nale¿¹ R¹czka, Œwistak i Z³y.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter i Fisk handluj¹ na targowisku. Maj¹ szerok¹ klientelê, w tym nawet Stra¿ników, wiêc s¹ doœæ wp³ywowi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //No i jest jeszcze Scatty. On rz¹dzi na arenie, organizuje walki i takie tam. Wielu ludzi jest mu winnych pieni¹dze, wiêc on równie¿ jest spor¹ szych¹.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter i Fisk handluj¹ ró¿nymi dobrami na targowisku.");
};

var int replyB;
var int gadaninaBartholo;
var int GravoToBartholo_First;
//========================================
//-----------------> BARTHOLO
//========================================

INSTANCE DIA_Gravo_BARTHOLO (C_INFO)
{
   npc          = Vlk_572_Gravo;
   nr           = 5;
   condition    = DIA_Gravo_BARTHOLO_Condition;
   information  = DIA_Gravo_BARTHOLO_Info;
   permanent	= TRUE;
   description	= "Muszê skontaktowaæ siê z Bartholo.";
};

FUNC INT DIA_Gravo_BARTHOLO_Condition()
{
    if ((MIS_SpysProblems == LOG_RUNNING) && (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))) && (gadaninaBartholo == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_BARTHOLO_Info()
{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_15_01"); //Muszê siê skontaktowaæ z Bartholo.

	if (GravoToBartholo_First == false)
	{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_15_02"); //Pomo¿esz mi?
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_03_03"); //Czego od niego chcesz?
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_15_04"); //Mam sprawê, ale nie powinno ciê to obchodziæ.
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_03_05"); //Dobrze, ju¿ dobrze. Pomogê ci za 50 bry³ek rudy. Masz tyle?
	
	B_LogEntry                     (CH1_SpysProblems,"Za 50 bry³ek rudy Gravo zdradzi mi co zrobiæ, aby spotkaæ siê z Bartholo."); 
   // B_LogEntry                     (CH1_SpysProblems,"Za 50 bry³ek rudy Gravo za³atwi mi spotkanie z Bartholo.");
	GravoToBartholo_First = true;
	}
	else
	{
	AI_Output (self, other ,"DIA_Gravo_BARTHOLO_03_06"); //Znasz cenê...
	};
	
    Info_ClearChoices		(DIA_Gravo_BARTHOLO);
    if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice              (DIA_Gravo_Bartholo, "Oto ruda.", DIA_gravo_bartholo_50MAM);
	};
    Info_AddChoice		(DIA_Gravo_BARTHOLO, "Przyjdê póŸniej.", DIA_Gravo_BARTHOLO_NO50);
};

FUNC VOID DIA_Gravo_BARTHOLO_50MAM()
{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_50MAM_15_01"); //Oto ruda.
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_50MAM_03_02"); //Bartholo mo¿na spotkaæ wieczorem w pobli¿u areny. Udaje siê tam wraz z Gomezem, ¿eby ogl¹daæ walki, albo wystêpy po³ykaczy ognia. 
    //AI_GotoWP (self, "OCR_STAGE_FRONT");
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_50MAM_03_03"); //Spróbuj wtedy go zaczepiæ. Tylko b¹dŸ ostro¿ny, bo Garotnicy przerobi¹ ciê na py³. Pogadam z nim, bêdzie siê ciebie spodziewa³. 
	B_GiveInvItems (hero,self,itminugget,50);
	gadaninaBartholo = true;  
	//B_ExchangeRoutine 	(EBR_106_Bartholo, "pomoc");
	Info_ClearChoices		(DIA_Gravo_BARTHOLO);
    AI_StopProcessInfos	(self);
	
};

FUNC VOID DIA_Gravo_BARTHOLO_NO50()
{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_NO50_15_01"); //Przyjdê póŸniej.
    Info_ClearChoices		(DIA_Gravo_BARTHOLO);
    AI_StopProcessInfos	(self);
	replyB = true;
};

//========================================
//-----------------> OfertaMila
//========================================

INSTANCE DIA_Gravo_OfertaMila (C_INFO)
{
   npc          = Vlk_572_Gravo;
   nr           = 1;
   condition    = DIA_Gravo_OfertaMila_Condition;
   information  = DIA_Gravo_OfertaMila_Info;
   permanent	= FALSE;
   description	= "Mam pewien interes.";
};

FUNC INT DIA_Gravo_OfertaMila_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mil_PlaszczOK))
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
	&& (oferta_fiska == false)
	&& (MIS_ScarMurder == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Whistler_OfertaMila))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_OfertaMila_Info()
{
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_01"); //Mam pewien interes.
    AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_03"); //Czy móg³byœ sprzedaæ ten p³aszcz Magnatowi nazywanemu Blizn¹?
    AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_04"); //Ja? Sprzedaæ? Nie jestem handlarzem!
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_05"); //Ten p³aszcz musi trafiæ do Blizny. Bardzo mi na tym zale¿y. 
    AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_06"); //Czemu ci tak na tym zale¿y?
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_07"); //Mmm... To podarek. Podj¹³em siê dostarczenia, jednak ostatnio trochê popsu³em sobie opiniê w zamku. 
	AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_08"); //Mogê ci pomóc z opini¹. Przecie¿ wiesz. 
	AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_09"); //Nie, ta sprawa jest doœæ delikatna. Wola³bym jej na razie nie rozgrzebywaæ. To jak bêdzie? Pomo¿esz mi? Mój zleceniodawca nie bêdzie zadowolony, jeœli nie przeka¿ê p³aszcza. 
	AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_10"); //Skoro jest zleceniodawca, to jest i zap³ata. Nie dasz rady sam wykonaæ zadania, wiêc ca³oœæ ci siê nie nale¿y. 
	AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_11"); //Wejdê w to za 50 bry³ek rudy. 
    B_LogEntry                     (CH3_ScarMurder,"Gravo mo¿e dostarczyæ p³aszcz BliŸnie, ale jeœli zap³acê mu 50 bry³ek rudy.");
};

//========================================
//-----------------> GiveItemPlaszcz
//========================================

INSTANCE DIA_Gravo_GiveItemPlaszcz (C_INFO)
{
   npc          = Vlk_572_Gravo;
   nr           = 2;
   condition    = DIA_Gravo_GiveItemPlaszcz_Condition;
   information  = DIA_Gravo_GiveItemPlaszcz_Info;
   permanent	= FALSE;
   description	= "Zgoda, zanieœ ten p³aszcz BliŸnie.";
};

FUNC INT DIA_Gravo_GiveItemPlaszcz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gravo_OfertaMila))
    && (Npc_KnowsInfo (hero, DIA_Mil_PlaszczOK))
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
	&& (MIS_ScarMurder == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_GiveItemPlaszcz_Info()
{
    AI_Output (other, self ,"DIA_Gravo_GiveItemPlaszcz_15_01"); //Zgoda, zanieœ ten p³aszcz BliŸnie.
    AI_Output (self, other ,"DIA_Gravo_GiveItemPlaszcz_03_02"); //Dostarczê go Magnatowi. Mo¿esz byæ o to spokojny.
    B_LogEntry                     (CH3_ScarMurder,"Gravo wzi¹³ p³aszcz i powiedzia³, ¿e Blizna wkrótce go dostanie.");
	B_GiveInvItems (other,self,ItMi_PancerzMil,1);
	B_GiveInvItems (other,self,itminugget,50);
    B_GiveXP (25);
};

//========================================
//-----------------> JOINTY
//========================================

INSTANCE DIA_Gravo_JOINTY (C_INFO)
{
   npc          = Vlk_572_Gravo;
   nr           = 1;
   condition    = DIA_Gravo_JOINTY_Condition;
   information  = DIA_Gravo_JOINTY_Info;
   permanent	= true;
   description	= "Lubisz czasem zapaliæ?";
};

FUNC INT DIA_Gravo_JOINTY_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Gravo_pali == false)
    {
    return TRUE;
    };
};
//DIA_Gravo_JOINTY.permanent = false;

FUNC VOID DIA_Gravo_JOINTY_Info()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_15_01"); //Lubisz czasem zapaliæ?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_03_02"); //Byæ mo¿e... Dla kogo pracujesz?
	AI_Output (other, self ,"DIA_Gravo_JOINTY_15_03"); //Przysy³a mnie Baal Taran.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_03_03"); //Ten goœæ sprzedaje chyba najgorsze skrêty w ca³ym Obozie. Czy¿by zmieni³ ofertê? Mo¿esz mi zaproponowaæ coœ nowego?
	
    Info_ClearChoices		(DIA_Gravo_JOINTY);
    Info_AddChoice		(DIA_Gravo_JOINTY, DIALOG_BACK, DIA_Gravo_JOINTY_BACK);
	if (Npc_HasItems(other,ItMiJoint_1)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Spróbuj Zielonego Nowicjusza.", DIA_Gravo_JOINTY_NOWICJUSZ1);
	};
	if (Npc_HasItems(other,ItMiJoint_2)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "A mo¿e Mrok Pó³nocy?", DIA_Gravo_JOINTY_MROK);
	};
	if (Npc_HasItems(other,ItMiJoint_3)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Co powiesz na Zew Nocy?", DIA_Gravo_JOINTY_ZEW);
	};
	if (Npc_HasItems(other,ItMiJoint_Apple)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "A jab³kowy Nowicjusz?", DIA_Gravo_JOINTY_APPLE_TYT);
	};
	if (Npc_HasItems(other,ItMiJoint_Honey)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Mam te¿ miodowego Nowicjusza.", DIA_Gravo_JOINTY_HONEY_TYT);
	};
	if (Npc_HasItems(other,ItMiJoint_Mush)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Spróbuj grzybowego Nowicjusza.", DIA_Gravo_JOINTY_MUSH_TYT);
	};
	if (Npc_HasItems(other,ItMiJoint_Plant)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "A mo¿e zio³owy Nowicjusz?", DIA_Gravo_JOINTY_PLANT_TYT);
	};
};

FUNC VOID DIA_Gravo_JOINTY_BACK()
{
    Info_ClearChoices		(DIA_Gravo_JOINTY);
};

FUNC VOID DIA_Gravo_JOINTY_NOWICJUSZ1()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_NOWICJUSZ1_15_01"); //Spróbuj Zielonego Nowicjusza.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_NOWICJUSZ1_03_02"); //Co? Przychodzisz z czymœ takim?! Nie denerwuj mnie.
    B_LogEntry                     (CH1_Druggy,"Gravo nie przepada za klasycznymi skrêtami z ziela. Zielony Nowicjusz odpada. Pozosta³e 'klasyki' pewnie te¿.");
};

FUNC VOID DIA_Gravo_JOINTY_MROK()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_MROK_15_01"); //A mo¿e Mrok Pó³nocy?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_MROK_03_02"); //Nie. Te¿ odpada. 
};

FUNC VOID DIA_Gravo_JOINTY_ZEW()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_ZEW_15_01"); //Co powiesz na Zew Nocy?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_ZEW_03_02"); //Te œwiry myœl¹, ¿e jak zawin¹ wiêcej ziela w papierow¹ tutkê to mog¹ sobie zawy¿aæ ceny do woli.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_ZEW_03_03"); //O nie. Nie dam siê nabraæ na te sztuczki. Tak du¿a dawka jest silnie uzale¿niaj¹ca. Pomijam ju¿ fakt, ¿e te skrêty nie maj¹ ¿adnego smaku.
};

FUNC VOID DIA_Gravo_JOINTY_APPLE_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_APPLE_TYT_15_01"); //A jab³kowy Nowicjusz?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_APPLE_TYT_03_02"); //O, to coœ nowego. Daj mi spróbowaæ.
    B_GiveInvItems (other, self, ItMiJoint_Apple, 1);
    AI_UseItem (self, ItMiJoint_Apple);
    AI_Output (self, other ,"DIA_Gravo_JOINTY_APPLE_TYT_03_03"); //Hmm... Ciekawy smak, ale to jeszcze nie to.
 
    B_GiveXP (25);
};

FUNC VOID DIA_Gravo_JOINTY_HONEY_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_HONEY_TYT_15_01"); //Mam te¿ miodowego Nowicjusza.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_HONEY_TYT_03_02"); //Dawaj.
    B_GiveInvItems (other, self, ItMiJoint_Honey, 1);
    AI_UseItem (self, ItMiJoint_Honey);
    AI_Output (self, other ,"DIA_Gravo_JOINTY_HONEY_TYT_03_03"); //Rewelacja! To coœ, czego szuka³em.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_HONEY_TYT_03_04"); //Powiedz Taranowi, ¿e przyjdê po wiêcej.
    B_LogEntry                     (CH1_Druggy,"Gravo najwy¿ej posmakowa³ mój miodowy Nowicjusz. Baal Taran sporo mi za to zap³aci.");

    B_GiveXP (50);
    Info_ClearChoices		(DIA_Gravo_JOINTY);
    AI_StopProcessInfos	(self);
    Gravo_pali = true;
	
};

FUNC VOID DIA_Gravo_JOINTY_MUSH_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_MUSH_TYT_15_01"); //Spróbuj grzybowego Nowicjusza.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_MUSH_TYT_03_02"); //Grzybowego? Jestem uczulony na wszelkie grzyby. WeŸ mi to z oczu.
    b_givexp (25);
};

FUNC VOID DIA_Gravo_JOINTY_PLANT_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_PLANT_TYT_15_01"); //A mo¿e zio³owy Nowicjusz?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_PLANT_TYT_03_02"); //Spróbujê.
    B_GiveInvItems (other, self, ItMiJoint_Plant, 1);
    AI_UseItem (self, ItMiJoint_Plant);
    AI_Output (self, other ,"DIA_Gravo_JOINTY_PLANT_TYT_03_03"); //Ohydne. Zostaw to tym krzakojadom z Bractwa.
    b_givexp (25);
};

//========================================
//-----------------> SzpiegStraznik
//========================================

INSTANCE DIA_Gravo_SzpiegStraznik (C_INFO)
{
   npc          = Vlk_572_Gravo;
   nr           = 1;
   condition    = DIA_Gravo_SzpiegStraznik_Condition;
   information  = DIA_Gravo_SzpiegStraznik_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o Stra¿niku, który ponoæ zwêszy³ Obóz Bandytów?";
};

FUNC INT DIA_Gravo_SzpiegStraznik_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gravo_Hallo))
    && (MIS_DraxTest == LOG_RUNNING)
	&& (trip_wykryty == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_SzpiegStraznik_Info()
{
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_15_01"); //Mo¿e wiesz coœ o Stra¿niku, który ponoæ zwêszy³ Obóz Bandytów?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_03_02"); //G³oœna sprawa. Przedmiot debat Magnatów ju¿ od kilku dni.
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_15_03"); //Zdradzisz mi imiê tego szpiega?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_03_04"); //Nie, dopóki mi nie powiesz, czemu chcesz to wiedzieæ.

    Info_ClearChoices		(DIA_Gravo_SzpiegStraznik);
    Info_AddChoice		(DIA_Gravo_SzpiegStraznik, "Pos³uchaj, Bandyci s¹ zagro¿eni. Mo¿emy ocaliæ wiele ¿yæ.", DIA_Gravo_SzpiegStraznik_BARAN);
    Info_AddChoice		(DIA_Gravo_SzpiegStraznik, "Chcê zdobyæ szacunek wœród Stra¿ników i rozpracowaæ Bandytów. ", DIA_Gravo_SzpiegStraznik_DOBRY);
};

FUNC VOID DIA_Gravo_SzpiegStraznik_BARAN()
{
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_BARAN_15_01"); //Pos³uchaj, Bandyci s¹ zagro¿eni. Mo¿emy ocaliæ wiele ¿yæ.
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_BARAN_03_02"); //A wiêc jesteœ jednym z nich?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_BARAN_03_03"); //Zwierzanie siê mi by³o b³êdem. 
	Gravo_doniosl_Thorusowi = true;
	B_LogEntry                     (CH1_DraxTest,"W tym wypadku szczeroœæ nie pop³aca. Gravo nie bêdzie trzyma³ jêzyka za zêbami, a ja bêdê mia³ teraz problemy ze Stra¿nikami.");
    Info_ClearChoices		(DIA_Gravo_SzpiegStraznik);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Gravo_SzpiegStraznik_DOBRY()
{
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_DOBRY_15_01"); //Chcê zdobyæ szacunek wœród Stra¿ników i rozpracowaæ gildiê Bandytów. 
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_02"); //To siê bardzo chwali. Stary Obóz bêdzie dla ciebie dobrym miejscem.
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_03"); //Zdradzê ci imiê tego Stra¿nika, jednak nie za darmo. 
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_04"); //Bêdzie ciê to kosztowaæ 100 bry³ek rudy. 
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_DOBRY_15_05"); //ILE?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_06"); //Nie jestem jakimœ pieprzonym dobrodziejem. 
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_07"); //Dobrze zarabiam na takich rzeczach i nie mam zamiaru siê zmieniaæ. 
    B_LogEntry                     (CH1_DraxTest,"100 bry³ek rudy, taka jest cena poznania imienia szpiega u Gravo.");
	Gravo_doniosl_Thorusowi = false;
    B_GiveXP (75);
    Info_ClearChoices		(DIA_Gravo_SzpiegStraznik);
};

//========================================
//-----------------> Give100Ore_TripName
//========================================

INSTANCE DIA_Gravo_Give100Ore_TripName (C_INFO)
{
   npc          = Vlk_572_Gravo;
   nr           = 1;
   condition    = DIA_Gravo_Give100Ore_TripName_Condition;
   information  = DIA_Gravo_Give100Ore_TripName_Info;
   permanent	= FALSE;
   description	= "Oto sto bry³ek rudy.";
};

FUNC INT DIA_Gravo_Give100Ore_TripName_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gravo_SzpiegStraznik))
    && (Gravo_doniosl_Thorusowi == false)
	&& (trip_wykryty == false)
	&& (Npc_HasItems(other,itminugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_Give100Ore_TripName_Info()
{
    AI_Output (other, self ,"DIA_Gravo_Give100Ore_TripName_15_01"); //Oto sto bry³ek rudy.
    B_GiveInvItems (other, self, ItMiNugget, 100);
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Gravo_Give100Ore_TripName_03_02"); //Stra¿nik, którego szukasz nazywa siê Trip.
    AI_Output (self, other ,"DIA_Gravo_Give100Ore_TripName_03_03"); //Jakby ktoœ pyta³, to siê nie znamy. 
    AI_Output (self, other ,"DIA_Gravo_Give100Ore_TripName_03_04"); //Powiedz, ¿e pods³ucha³eœ czyj¹œ rozmowê. 
    AI_Output (other, self ,"DIA_Gravo_Give100Ore_TripName_15_05"); //Jasne.
    B_LogEntry                     (CH1_DraxTest,"Gravo zdradzi³ mi, ¿e Stra¿nikiem, który niemal zdemaskowa³ Bandytów jest Trip. ");
	trip_wykryty = true;
    AI_StopProcessInfos	(self);
};

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

instance DIA_Gravo_FakeRumor (C_INFO)
{
	npc			= Vlk_572_Gravo;
	nr			= 4;
	condition	= DIA_Gravo_FakeRumor_Condition;
	information	= DIA_Gravo_FakeRumor_Info;
	permanent	= 0;
	description = "Witaj. Masz mo¿e chwilê?";
};                       

FUNC int DIA_Gravo_FakeRumor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_WhatsTroubles))
	{
		return 1;
	};
};

FUNC VOID DIA_Gravo_FakeRumor_Info()
{
	AI_Output(other, self, "DIA_Gravo_FakeRumor_15_00"); //Witaj. Masz mo¿e chwilê?
	AI_Output(self, other, "DIA_Gravo_FakeRumor_03_01"); //Tak, ale jak sam wiesz czas to pieni¹dz, a raczej ruda...
	AI_Output(other, self, "DIA_Gravo_FakeRumor_15_02"); //Przechodz¹c do sedna, chcia³bym, ¿ebyœ rozg³osi³ pewne wieœci w Obozie. Chodzi o pewne artefakty, jakie przys³ano Baalowi Parvezowi z Sekty.
	AI_Output(self, other, "DIA_Gravo_FakeRumor_03_03"); //Có¿, myœlê, ¿e 80 bry³ek rudy to dobra cena w zamian za to, by ka¿dy w Obozie siê o tym dowiedzia³.

	B_LogEntry(CH1_ParvezInTroubles, "Gravo chce 80 bry³ek rudy za rozg³oszenie plotki w Starym Obozie. Chyba nie mam wyjœcia i muszê zap³aciæ. Mam nadziejê, ¿e koszty mi siê zwróc¹.");
};

instance DIA_Gravo_FakeRumorGiveOre (C_INFO)
{
	npc			= Vlk_572_Gravo;
	nr			= 4;
	condition	= DIA_Gravo_FakeRumorGiveOre_Condition;
	information	= DIA_Gravo_FakeRumorGiveOre_Info;
	permanent	= 0;
	description = "Masz, oto ruda. (daj 80 bry³ek rudy)";
};                       

FUNC int DIA_Gravo_FakeRumorGiveOre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_FakeRumor) && (Npc_HasItems(other, ItMiNugget) >= 80))
	{
		return 1;
	};
};

FUNC VOID DIA_Gravo_FakeRumorGiveOre_Info()
{
	AI_Output(other, self, "DIA_Gravo_FakeRumorGiveOre_15_00"); //Masz, oto ruda.
	AI_Output(self, other, "DIA_Gravo_FakeRumorGiveOre_15_01"); //Dziêkujê, a teraz zamieniê s³ówko z paroma ludŸmi...
	
	B_LogEntry(CH1_ParvezInTroubles, "Gravo otrzyma³ swoj¹ rudê, wiêc teraz porozmawia z ludŸmi w Obozie.");
	
	B_GiveInvItems (other,self, itminugget,80);
	Npc_RemoveInvItems(self, ItMiNugget, 80);
	
	AI_StopProcessInfos (self);
};