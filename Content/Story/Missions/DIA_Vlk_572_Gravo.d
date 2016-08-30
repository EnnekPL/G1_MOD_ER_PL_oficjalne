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
	description 	= "Co s�ycha�?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Odk�d rzuci�em robot� w kopalni, nie mog� narzeka�.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A sk�d bierzesz �rodki na utrzymanie?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomagam ludziom w rozwi�zywaniu ich problem�w.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Je�li podpadniesz kt�remu� z wp�ywowych ludzi, zg�o� si� do mnie. Razem co� wymy�limy.
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
	AI_Output (self, other,"DIA_Gravo_Groups_04_01"); //Nasze ma�e spo�ecze�stwo dzieli si� na kilka kluczowych grup. Zasady i zale�no�ci panuj�ce pomi�dzy nimi s� bardzo proste. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_02"); //Najni�ej w hierarchii stoj� Kopacze. S� to robotnicy pracuj�cy w kopalni za kilkana�cie bry�ek tygodniowo.  
	AI_Output (self, other,"DIA_Gravo_Groups_04_03"); //Wy�ej znajduj� si� Cienie. Cienie to ludzie, kt�rym uda�o si� wkra�� w �aski Gomeza lub jego najbli�szego otoczenia.
	AI_Output (other, self,"DIA_Gravo_Groups_15_04"); //Czym si� zajmuj�?
	AI_Output (self, other,"DIA_Gravo_Groups_04_05"); //Najr�niejszymi zadaniami. Od polowania na zwierzyn� po szpiegowanie, wci�ganie informacji na drobnych zleceniach ko�cz�c. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_06"); //Stra�nicy z kolei werbuj� si� spo�r�d Cieni. Cho� wi�kszo�� z nich otrzyma�a stanowiska za to, �e zas�u�yli si� podczas buntu.
	AI_Output (self, other,"DIA_Gravo_Groups_04_07"); //Ich g��wnym zadaniem jest pilnowanie porz�dku w Obozie i Starej Kopalni, oraz wykonywanie zada� b�d�cych poza mo�liwo�ciami Cieni.
	AI_Output (self, other,"DIA_Gravo_Groups_04_08"); //W�r�d Stra�nik�w prawdziw� elit� stanowi� cz�onkowie �elaznej Garoty. Nazywamy ich po prostu Garotnikami.
	AI_Output (self, other,"DIA_Gravo_Groups_04_09"); //To przyboczna stra� Gomeza. Najlepsi spo�r�d Stra�nik�w, najbardziej zaufani i czasami wr�cz okre�lani mianem fanatycznych.
	AI_Output (self, other,"DIA_Gravo_Groups_04_10"); //Mo�esz ich rozpozna� po symbolu spl�tanej garoty na pancerzu. Kiedy� dowodzi� nimi Felgor, kt�rego zwano �elazn� Garot�. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_11"); //Facet w czasie wielkiego buntu skaza�c�w maj�c zakute r�ce zmia�d�y� kajdankami gard�o kr�lewskiemu oficerowi. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_12"); //Po �mierci Felgora zwierzchnikiem Garotnik�w zosta� Skelden. 
	AI_Output (self, other,"DIA_Gravo_Groups_04_13"); //Poza Stra�nikami na zamku s� rzecz jasna tak�e Magnaci. To oni wszystko kontroluj�. Cz�sto si�gaj� te� po rady Mag�w Ognia.
	AI_Output (self, other,"DIA_Gravo_Groups_04_14"); //To by by�o na tyle.
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
	description 	= "Gdybym mia� k�opoty TY m�g�by� mi pom�c? W jaki spos�b?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Gdybym mia� k�opoty, TY m�g�by� mi pom�c? W jaki spos�b?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No za��my, �e nadepn��e� na odcisk Thorusowi. Lepiej nigdy nie w�azi� mu w drog�, ale wypadki si� zdarzaj�...
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus potrafi by� bardzo uparty. Jak raz si� na ciebie wkurzy, nie b�dzie chcia� zamieni� z tob� s�owa. A to ju� bardzo niedobrze.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako ��todzi�b, musisz go mie� po swojej stronie. Wi�c przychodzisz do mnie i m�wisz w czym rzecz. Znam tu wiele os�b, z kt�rych zdaniem liczy si� nawet Thorus.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Oni szepn� o tobie dobre s��wko i Thorus przestanie si� na ciebie boczy�. Oczywi�cie ch�opcy nie zrobi� tego za darmo. Takie przys�ugi kosztuj�.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A ja pilnuj�, �eby ruda trafi�a do w�a�ciwych os�b...

	B_LogEntry(GE_TraderOC,	"Kopacz Gravo oferuje przydatne us�ugi. Gdybym podpad� kiedy� wp�ywowym ludziom ze Starego Obozu, mam si� zg�osi� do niego.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Zgadza si�. Zagi�� na ciebie parol.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Poprosz� paru ludzi, �eby go troch� uspokoili. 100 bry�ek rudy i b�dzie po sprawie.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Zobaczmy ile tu masz... Tak, powinno wystarczy�. Mo�esz uzna� spraw� za nieby��.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Tylko nikomu ani s�owa. Zachowuj si�, jakby w og�le nic si� nie sta�o.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, ch�opcze, ale w takim razie nic nie mog� dla ciebie zrobi�.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //To maj� by� k�opoty? To jest cholerna katastrofa! Obawiam si�, �e on najch�tniej rozdar�by ci� na strz�py.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Spr�buj� przekona� paru ludzi, �eby si� za tob� wstawili, ale to nie b�dzie tanio kosztowa�. 500 bry�ek rudy, je�li nie wi�cej!
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Zobaczmy ile tu masz... Widz�, �e ci si� poszcz�ci�o. Wezm� te 500 bry�ek i spr�buj� to wszystko odkr�ci�.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //I pami�taj: nigdy, przenigdy nie wspominaj, �e pomog�em ci za�atwi� t� spraw�. Trzymaj j�zyk za z�bami. Zrozumiano?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, ch�opcze, ale w takim razie nic nie mog� dla ciebie zrobi�.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Z tego co mi wiadomo, nie masz z nim �adnego zatargu.
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
	description 	= "Mo�esz mi pom�c? Chyba mam k�opoty.";
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
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Mo�esz mi pom�c? Chyba mam k�opoty.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Mog� spr�bowa�, ale uprzedzam - moja pomoc b�dzie ci� kosztowa�a od 100 do 500 bry�ek rudy!
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Pom� mi z Diego."			,DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Pom� mi z Thorusem."			,DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Pom� mi z Gomezem."			,DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pom� mi z Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pom� mi z Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pom� mi z Gomezem.
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
	description 	= "Mo�esz mi powiedzie�, kt�re Cienie nale�� do najbardziej wp�ywowych?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Mo�esz mi powiedzie�, kt�re Cienie nale�� do najbardziej wp�ywowych?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chcesz mie� po swojej stronie najwa�niejszych ludzi, co?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Najpot�niejszym z Cieni jest Diego. Do jego zaufanych ludzi nale�� R�czka, �wistak i Z�y.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter i Fisk handluj� na targowisku. Maj� szerok� klientel�, w tym nawet Stra�nik�w, wi�c s� do�� wp�ywowi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //No i jest jeszcze Scatty. On rz�dzi na arenie, organizuje walki i takie tam. Wielu ludzi jest mu winnych pieni�dze, wi�c on r�wnie� jest spor� szych�.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter i Fisk handluj� r�nymi dobrami na targowisku.");
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
   description	= "Musz� skontaktowa� si� z Bartholo.";
};

FUNC INT DIA_Gravo_BARTHOLO_Condition()
{
    if ((MordragProblemOC == LOG_RUNNING) && (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))) && (gadaninaBartholo == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_BARTHOLO_Info()
{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_15_01"); //Musz� si� skontaktowa� z Bartholo.

	if (GravoToBartholo_First == false)
	{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_15_02"); //Pomo�esz mi?
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_03_03"); //Czego od niego chcesz?
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_15_04"); //Mam spraw�, ale nie powinno ci� to obchodzi�.
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_03_05"); //Dobrze, ju� dobrze. Pomog� ci za 50 bry�ek rudy. Masz tyle?
	
	B_LogEntry                     (CH1_MordragProblemOC,"Za 50 bry�ek rudy Gravo zdradzi mi co zrobi�, aby spotka� si� z Bartholo."); 
   // B_LogEntry                     (CH1_MordragProblemOC,"Za 50 bry�ek rudy Gravo za�atwi mi spotkanie z Bartholo.");
	GravoToBartholo_First = true;
	}
	else
	{
	AI_Output (self, other ,"DIA_Gravo_BARTHOLO_03_06"); //Znasz cen�...
	};
	
    Info_ClearChoices		(DIA_Gravo_BARTHOLO);
    if (Npc_HasItems (hero, ItMiNugget)>=50)
	{
    Info_AddChoice              (DIA_Gravo_Bartholo, "Oto ruda.", DIA_gravo_bartholo_50MAM);
	};
    Info_AddChoice		(DIA_Gravo_BARTHOLO, "Przyjd� p�niej.", DIA_Gravo_BARTHOLO_NO50);
};

FUNC VOID DIA_Gravo_BARTHOLO_50MAM()
{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_50MAM_15_01"); //Oto ruda.
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_50MAM_03_02"); //Bartholo mo�na spotka� wieczorem w pobli�u areny. Udaje si� tam wraz z Gomezem, �eby ogl�da� walki, albo wyst�py po�ykaczy ognia. 
    //AI_GotoWP (self, "OCR_STAGE_FRONT");
    AI_Output (self, other ,"DIA_Gravo_BARTHOLO_50MAM_03_03"); //Spr�buj wtedy go zaczepi�. Tylko b�d� ostro�ny, bo Garotnicy przerobi� ci� na py�. Pogadam z nim, b�dzie si� ciebie spodziewa�. 
	B_GiveInvItems (hero,self,itminugget,50);
	gadaninaBartholo = true;  
	//B_ExchangeRoutine 	(EBR_106_Bartholo, "pomoc");
	Info_ClearChoices		(DIA_Gravo_BARTHOLO);
    AI_StopProcessInfos	(self);
	
};

FUNC VOID DIA_Gravo_BARTHOLO_NO50()
{
    AI_Output (other, self ,"DIA_Gravo_BARTHOLO_NO50_15_01"); //Przyjd� p�niej.
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
	&& (MIS_ZabojstwBlizny == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero, DIA_Whistler_OfertaMila))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_OfertaMila_Info()
{
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_01"); //Mam pewien interes.
    AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_03"); //Czy m�g�by� sprzeda� ten p�aszcz Magnatowi nazywanemu Blizn�?
    AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_04"); //Ja? Sprzeda�? Nie jestem handlarzem!
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_05"); //Ten p�aszcz musi trafi� do Blizny. Bardzo mi na tym zale�y. 
    AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_06"); //Czemu ci tak na tym zale�y?
    AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_07"); //Mmm... To podarek. Podj��em si� dostarczenia, jednak ostatnio troch� popsu�em sobie opini� w zamku. 
	AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_08"); //Mog� ci pom�c z opini�. Przecie� wiesz. 
	AI_Output (other, self ,"DIA_Gravo_OfertaMila_15_09"); //Nie, ta sprawa jest do�� delikatna. Wola�bym jej na razie nie rozgrzebywa�. To jak b�dzie? Pomo�esz mi? M�j zleceniodawca nie b�dzie zadowolony, je�li nie przeka�� p�aszcza. 
	AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_10"); //Skoro jest zleceniodawca, to jest i zap�ata. Nie dasz rady sam wykona� zadania, wi�c ca�o�� ci si� nie nale�y. 
	AI_Output (self, other ,"DIA_Gravo_OfertaMila_03_11"); //Wejd� w to za 50 bry�ek rudy. 
    B_LogEntry                     (CH1_ZabojstwBlizny,"Gravo mo�e dostarczy� p�aszcz Bli�nie, ale je�li zap�ac� mu 50 bry�ek rudy.");
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
   description	= "Zgoda, zanie� ten p�aszcz Bli�nie.";
};

FUNC INT DIA_Gravo_GiveItemPlaszcz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gravo_OfertaMila))
    && (Npc_KnowsInfo (hero, DIA_Mil_PlaszczOK))
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
	&& (MIS_ZabojstwBlizny == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gravo_GiveItemPlaszcz_Info()
{
    AI_Output (other, self ,"DIA_Gravo_GiveItemPlaszcz_15_01"); //Zgoda, zanie� ten p�aszcz Bli�nie.
    AI_Output (self, other ,"DIA_Gravo_GiveItemPlaszcz_03_02"); //Dostarcz� go Magnatowi. Mo�esz by� o to spokojny.
    B_LogEntry                     (CH1_ZabojstwBlizny,"Gravo wzi�� p�aszcz i powiedzia�, �e Blizna wkr�tce go dostanie.");
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
   description	= "Lubisz czasem zapali�?";
};

FUNC INT DIA_Gravo_JOINTY_Condition()
{
    if (MIS_Cpuny == LOG_RUNNING)
    && (Gravo_pali == false)
    {
    return TRUE;
    };
};
//DIA_Gravo_JOINTY.permanent = false;

FUNC VOID DIA_Gravo_JOINTY_Info()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_15_01"); //Lubisz czasem zapali�?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_03_02"); //By� mo�e... Dla kogo pracujesz?
	AI_Output (other, self ,"DIA_Gravo_JOINTY_15_03"); //Przysy�a mnie Baal Taran.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_03_03"); //Ten go�� sprzedaje chyba najgorsze skr�ty w ca�ym Obozie. Czy�by zmieni� ofert�? Mo�esz mi zaproponowa� co� nowego?
	
    Info_ClearChoices		(DIA_Gravo_JOINTY);
    Info_AddChoice		(DIA_Gravo_JOINTY, DIALOG_BACK, DIA_Gravo_JOINTY_BACK);
	if (Npc_HasItems(other,ItMiJoint_1)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Spr�buj Zielonego Nowicjusza.", DIA_Gravo_JOINTY_NOWICJUSZ1);
	};
	if (Npc_HasItems(other,ItMiJoint_2)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "A mo�e Mrok P�nocy?", DIA_Gravo_JOINTY_MROK);
	};
	if (Npc_HasItems(other,ItMiJoint_3)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Co powiesz na Zew Nocy?", DIA_Gravo_JOINTY_ZEW);
	};
	if (Npc_HasItems(other,ItMiJoint_Apple)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "A jab�kowy Nowicjusz?", DIA_Gravo_JOINTY_APPLE_TYT);
	};
	if (Npc_HasItems(other,ItMiJoint_Honey)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Mam te� miodowego Nowicjusza.", DIA_Gravo_JOINTY_HONEY_TYT);
	};
	if (Npc_HasItems(other,ItMiJoint_Mush)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "Spr�buj grzybowego Nowicjusza.", DIA_Gravo_JOINTY_MUSH_TYT);
	};
	if (Npc_HasItems(other,ItMiJoint_Plant)>=1)
	{
    Info_AddChoice		(DIA_Gravo_JOINTY, "A mo�e zio�owy Nowicjusz?", DIA_Gravo_JOINTY_PLANT_TYT);
	};
};

FUNC VOID DIA_Gravo_JOINTY_BACK()
{
    Info_ClearChoices		(DIA_Gravo_JOINTY);
};

FUNC VOID DIA_Gravo_JOINTY_NOWICJUSZ1()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_NOWICJUSZ1_15_01"); //Spr�buj Zielonego Nowicjusza.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_NOWICJUSZ1_03_02"); //Co? Przychodzisz z czym� takim?! Nie denerwuj mnie.
    B_LogEntry                     (CH1_Cpuny,"Gravo nie przepada za klasycznymi skr�tami z ziela. Zielony Nowicjusz odpada. Pozosta�e 'klasyki' pewnie te�.");
};

FUNC VOID DIA_Gravo_JOINTY_MROK()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_MROK_15_01"); //A mo�e Mrok P�nocy?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_MROK_03_02"); //Nie. Te� odpada. 
};

FUNC VOID DIA_Gravo_JOINTY_ZEW()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_ZEW_15_01"); //Co powiesz na Zew Nocy?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_ZEW_03_02"); //Te �wiry my�l�, �e jak zawin� wi�cej ziela w papierow� tutk� to mog� sobie zawy�a� ceny do woli.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_ZEW_03_03"); //O nie. Nie dam si� nabra� na te sztuczki. Tak du�a dawka jest silnie uzale�niaj�ca. Pomijam ju� fakt, �e te skr�ty nie maj� �adnego smaku.
};

FUNC VOID DIA_Gravo_JOINTY_APPLE_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_APPLE_TYT_15_01"); //A jab�kowy Nowicjusz?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_APPLE_TYT_03_02"); //O, to co� nowego. Daj mi spr�bowa�.
    B_GiveInvItems (other, self, ItMiJoint_Apple, 1);
    AI_UseItem (self, ItMiJoint_Apple);
    AI_Output (self, other ,"DIA_Gravo_JOINTY_APPLE_TYT_03_03"); //Hmm... Ciekawy smak, ale to jeszcze nie to.
 
    B_GiveXP (25);
};

FUNC VOID DIA_Gravo_JOINTY_HONEY_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_HONEY_TYT_15_01"); //Mam te� miodowego Nowicjusza.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_HONEY_TYT_03_02"); //Dawaj.
    B_GiveInvItems (other, self, ItMiJoint_Honey, 1);
    AI_UseItem (self, ItMiJoint_Honey);
    AI_Output (self, other ,"DIA_Gravo_JOINTY_HONEY_TYT_03_03"); //Rewelacja! To co�, czego szuka�em.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_HONEY_TYT_03_04"); //Powiedz Taranowi, �e przyjd� po wi�cej.
    B_LogEntry                     (CH1_Cpuny,"Gravo najwy�ej posmakowa� m�j miodowy Nowicjusz. Baal Taran sporo mi za to zap�aci.");

    B_GiveXP (50);
    Info_ClearChoices		(DIA_Gravo_JOINTY);
    AI_StopProcessInfos	(self);
    Gravo_pali = true;
	
};

FUNC VOID DIA_Gravo_JOINTY_MUSH_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_MUSH_TYT_15_01"); //Spr�buj grzybowego Nowicjusza.
    AI_Output (self, other ,"DIA_Gravo_JOINTY_MUSH_TYT_03_02"); //Grzybowego? Jestem uczulony na wszelkie grzyby. We� mi to z oczu.
    b_givexp (25);
};

FUNC VOID DIA_Gravo_JOINTY_PLANT_TYT()
{
    AI_Output (other, self ,"DIA_Gravo_JOINTY_PLANT_TYT_15_01"); //A mo�e zio�owy Nowicjusz?
    AI_Output (self, other ,"DIA_Gravo_JOINTY_PLANT_TYT_03_02"); //Spr�buj�.
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
   description	= "Wiesz co� o Stra�niku, kt�ry pono� zw�szy� Ob�z Bandyt�w?";
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
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_15_01"); //Mo�e wiesz co� o Stra�niku, kt�ry pono� zw�szy� Ob�z Bandyt�w?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_03_02"); //G�o�na sprawa. Przedmiot debat Magnat�w ju� od kilku dni.
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_15_03"); //Zdradzisz mi imi� tego szpiega?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_03_04"); //Nie, dop�ki mi nie powiesz, czemu chcesz to wiedzie�.

    Info_ClearChoices		(DIA_Gravo_SzpiegStraznik);
    Info_AddChoice		(DIA_Gravo_SzpiegStraznik, "Pos�uchaj, Bandyci s� zagro�eni. Mo�emy ocali� wiele �y�.", DIA_Gravo_SzpiegStraznik_BARAN);
    Info_AddChoice		(DIA_Gravo_SzpiegStraznik, "Chc� zdoby� szacunek w�r�d Stra�nik�w i rozpracowa� Bandyt�w. ", DIA_Gravo_SzpiegStraznik_DOBRY);
};

FUNC VOID DIA_Gravo_SzpiegStraznik_BARAN()
{
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_BARAN_15_01"); //Pos�uchaj, Bandyci s� zagro�eni. Mo�emy ocali� wiele �y�.
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_BARAN_03_02"); //A wi�c jeste� jednym z nich?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_BARAN_03_03"); //Zwierzanie si� mi by�o b��dem. 
	Gravo_doniosl_Thorusowi = true;
	B_LogEntry                     (CH1_DraxTest,"W tym wypadku szczero�� nie pop�aca. Gravo nie b�dzie trzyma� j�zyka za z�bami, a ja b�d� mia� teraz problemy ze Stra�nikami.");
    Info_ClearChoices		(DIA_Gravo_SzpiegStraznik);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Gravo_SzpiegStraznik_DOBRY()
{
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_DOBRY_15_01"); //Chc� zdoby� szacunek w�r�d Stra�nik�w i rozpracowa� gildi� Bandyt�w. 
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_02"); //To si� bardzo chwali. Stary Ob�z b�dzie dla ciebie dobrym miejscem.
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_03"); //Zdradz� ci imi� tego Stra�nika, jednak nie za darmo. 
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_04"); //B�dzie ci� to kosztowa� 100 bry�ek rudy. 
    AI_Output (other, self ,"DIA_Gravo_SzpiegStraznik_DOBRY_15_05"); //ILE?
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_06"); //Nie jestem jakim� pieprzonym dobrodziejem. 
    AI_Output (self, other ,"DIA_Gravo_SzpiegStraznik_DOBRY_03_07"); //Dobrze zarabiam na takich rzeczach i nie mam zamiaru si� zmienia�. 
    B_LogEntry                     (CH1_DraxTest,"100 bry�ek rudy, taka jest cena poznania imienia szpiega u Gravo.");
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
   description	= "Oto sto bry�ek rudy.";
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
    AI_Output (other, self ,"DIA_Gravo_Give100Ore_TripName_15_01"); //Oto sto bry�ek rudy.
    B_GiveInvItems (other, self, ItMiNugget, 100);
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Gravo_Give100Ore_TripName_03_02"); //Stra�nik, kt�rego szukasz nazywa si� Trip.
    AI_Output (self, other ,"DIA_Gravo_Give100Ore_TripName_03_03"); //Jakby kto� pyta�, to si� nie znamy. 
    AI_Output (self, other ,"DIA_Gravo_Give100Ore_TripName_03_04"); //Powiedz, �e pods�ucha�e� czyj�� rozmow�. 
    AI_Output (other, self ,"DIA_Gravo_Give100Ore_TripName_15_05"); //Jasne.
    B_LogEntry                     (CH1_DraxTest,"Gravo zdradzi� mi, �e Stra�nikiem, kt�ry niemal zdemaskowa� Bandyt�w jest Trip. ");
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
	description = "Witaj. Masz mo�e chwil�?";
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
	AI_Output(other, self, "DIA_Gravo_FakeRumor_15_00"); //Witaj. Masz mo�e chwil�?
	AI_Output(self, other, "DIA_Gravo_FakeRumor_03_01"); //Tak, ale jak sam wiesz czas to pieni�dz, a raczej ruda...
	AI_Output(other, self, "DIA_Gravo_FakeRumor_15_02"); //Przechodz�c do sedna, chcia�bym, �eby� rozg�osi� pewne wie�ci w Obozie. Chodzi o pewne artefakty, jakie przys�ano Baalowi Parvezowi z Sekty.
	AI_Output(self, other, "DIA_Gravo_FakeRumor_03_03"); //C�, my�l�, �e 80 bry�ek rudy to dobra cena w zamian za to, by ka�dy w Obozie si� o tym dowiedzia�.

	B_LogEntry(CH1_ParvezInTroubles, "Gravo chce 80 bry�ek rudy za rozg�oszenie plotki w Starym Obozie. Chyba nie mam wyj�cia i musz� zap�aci�. Mam nadziej�, �e koszty mi si� zwr�c�.");
};

instance DIA_Gravo_FakeRumorGiveOre (C_INFO)
{
	npc			= Vlk_572_Gravo;
	nr			= 4;
	condition	= DIA_Gravo_FakeRumorGiveOre_Condition;
	information	= DIA_Gravo_FakeRumorGiveOre_Info;
	permanent	= 0;
	description = "Masz, oto ruda. (daj 80 bry�ek rudy)";
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
	AI_Output(self, other, "DIA_Gravo_FakeRumorGiveOre_15_01"); //Dzi�kuj�, a teraz zamieni� s��wko z paroma lud�mi...
	
	B_LogEntry(CH1_ParvezInTroubles, "Gravo otrzyma� swoj� rud�, wi�c teraz porozmawia z lud�mi w Obozie.");
	
	B_GiveInvItems (other,self, itminugget,80);
	Npc_RemoveInvItems(self, ItMiNugget, 80);
	
	AI_StopProcessInfos (self);
};