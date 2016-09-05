//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_prin_EXIT(C_INFO)
{
	npc             = NON_2703_MYSLIWY;
	nr              = 999;
	condition	= DIA_prin_EXIT_Condition;
	information	= DIA_prin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_prin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_prin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_prin_HELLO (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_HELLO_Condition;
	information  	= DIA_prin_HELLO_Info;
	permanent		= FALSE;
	description     = "Kim jeste�?";
};

FUNC INT DIA_prin_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_prin_HELLO_Info()
{
	AI_Output (other, self ,"DIA_prin_HELLO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_prin_HELLO_03_02"); //Nazywam si� Prin. Jestem �owc� ork�w. 
    AI_Output (other, self ,"DIA_prin_HELLO_15_03"); //Jaka jest twoja specjalizacja? Czym si� zajmujesz w obozie?
    AI_Output (self, other ,"DIA_prin_HELLO_03_04"); //Jestem traperem. Moim zadaniem s� zwiady, sprawdzanie terenu i tym podobne sprawy. 
};

//========================================
//-----------------> OrcLands
//========================================

INSTANCE DIA_prin_OrcLands (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_OrcLands_Condition;
	information  	= DIA_prin_OrcLands_Info;
	permanent		= FALSE;
	description   	= "Opowiedz mi o Ziemiach Ork�w.";
};

FUNC INT DIA_prin_OrcLands_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_HELLO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_OrcLands_Info()
{
    AI_Output (other, self ,"DIA_prin_OrcLands_15_01"); //Opowiedz mi o Ziemiach Ork�w.
    AI_Output (self, other ,"DIA_prin_OrcLands_03_02"); //To dosy� rozleg�y teren. 
    AI_Output (other, self ,"DIA_prin_OrcLands_15_03"); //Dlaczego jest tam tak niebezpiecznie?
    AI_Output (self, other ,"DIA_prin_OrcLands_03_04"); //Wsz�dzie kr�c� si� orkowe patrole, wypatruj�ce nie wiadomo czego. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_05"); //Najwi�cej ork�w jest w�a�nie tutaj, przy granicy. W g��bi nie pojawiaj� si� ju� tak licznie. Poza ich miastem, rzecz jasna.
	AI_Output (self, other ,"DIA_prin_OrcLands_03_06"); //Nie brakuje tam jednak innych bestii - brzytw i k�saczy. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_07"); //Je�eli mamy dobry pancerz, to k�sacze nie s� zbyt wielkim zagro�eniem. Jednak na brzytwy nale�y szczeg�lnie uwa�a�. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_08"); //Ich stado mo�e poszarpa� dobrego wojownika na kawa�eczki w kilka chwil. 
};

//========================================
//-----------------> SomeoneElse
//========================================

INSTANCE DIA_prin_SomeoneElse (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_SomeoneElse_Condition;
	information  	= DIA_prin_SomeoneElse_Info;
	permanent		= FALSE;
	description   	= "Czy mieszka tu kto� inny?";
};

FUNC INT DIA_prin_SomeoneElse_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_HELLO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_SomeoneElse_Info()
{
	AI_Output (other, self ,"DIA_prin_SomeoneElse_15_01"); //Czy mieszka tu kto� inny?
    AI_Output (self, other ,"DIA_prin_SomeoneElse_03_02"); //Na Ziemiach Ork�w? Z pewno�ci�! 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_03"); //Z tego co mi wiadomo nieopodal Miasta Ork�w nie ma nic ciekawego. Jednak ko�o bagna jest jaskinia, w kt�rej mieszka pewien Mag Ognia. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_04"); //Rozmawia�em z nim kiedy�. Powiedzia�, �e szuka jakich� kamieni przypominaj�cych kryszta�y, czy co� takiego.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_05"); //Rzekomo prowadzi nad nimi badania. Nie znam si� na tym, wi�c nie mia�em zamiaru mu pomaga�. Doradzi�em tylko, �eby uwa�a�. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_06"); //Jest jeszcze wielka wie�a. Trudno j� przeoczy�. W nocy s�ycha� stamt�d okropne d�wi�ki. Lepiej si� tam nie zapuszczaj. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_07"); //Ciekawym miejscem jest te� jezioro w pobli�u Cytadeli. Na jego �rodku znajduje si� stara, zatopiona wie�a. Nigdy tam nie by�em, ale czu� stamt�d plugaw� magi� na kilometr.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_08"); //Tego miejsca r�wnie� radzi�bym ci unika�.
	B_GiveXP (100);
};

//========================================
//-----------------> Teleport
//========================================

INSTANCE DIA_prin_Teleport (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_Teleport_Condition;
	information  	= DIA_prin_Teleport_Info;
	permanent		= FALSE;
	description   	= "Czy istnieje jaka� runa teleportacji do tego miejsca?";
};

FUNC INT DIA_prin_Teleport_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_SomeoneElse)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_Teleport_Info()
{
	AI_Output (other, self ,"DIA_prin_Teleport_15_01"); //Czy istnieje jaka� runa teleportacji do tego miejsca?
    AI_Output (self, other ,"DIA_prin_Teleport_03_02"); //Ten Mag Ognia, o kt�rym ci wspomina�em... Kiedy� wykonywa�em dla niego pewne zlecenie. Mia�em pozby� si� stada brzytw, kt�re zap�dzi�y si� w okolice jego jaskini.
	AI_Output (self, other ,"DIA_prin_Teleport_03_03"); //Gdy wykona�em zadanie, powiedzia�, �e nie ma dla mnie rudy. Zapyta�em wi�c, czy jest w stanie mi si� odwdzi�czy� w jaki� inny spos�b.
	AI_Output (self, other ,"DIA_prin_Teleport_03_04"); //Poprosi�em go o zbadanie dla mnie tej tajemniczej p�yty znajduj�cej si� nad naszym obozem. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_05"); //Wiesz, jestem uczulony na sprawy magii... Chcia�em, �eby kto� obeznany sprawdzi�, czy to staro�ytne co� nie stanowi dla nas zagro�enia. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_06"); //Okaza�o si�, �e w tym miejscu kiedy� zogniskowano moc magiczn�... Czy jako� tak... Nie znam si� na tym!
	AI_Output (self, other ,"DIA_prin_Teleport_03_07"); //W ka�dym b�d� razie mag stwierdzi�, �e nie stanowi to dla nas niebezpiecze�stwa. W ramach zap�aty za zlecenie przygotowa� dla mnie kamie� teleportacji. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_08"); //Powiedzia�, �e mog� si� dzi�ki niemu bezpiecznie tu przenie��. Nigdy jednak z niego nie skorzysta�em... Ju� ci m�wi�em, �e nie param si� magi�.
	AI_Output (self, other ,"DIA_prin_Teleport_03_09"); //Je�li si� nie boisz, to ci go sprzedam za r�wnowarto�� mojego zlecenia. To b�dzie jakie�... 300 bry�ek rudy. Kupujesz?
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"�owca ork�w Prin mo�e mi sprzeda� run� teleportu do obozu �owc�w ork�w za cen� 300 bry�ek rudy.");
};

var int buy_teleprt_prin;
//========================================
//-----------------> BuyRune
//========================================

INSTANCE DIA_prin_BuyRune (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_BuyRune_Condition;
	information  	= DIA_prin_BuyRune_Info;
	permanent		= TRUE;
	description   	= "Chc� od ciebie kupi� t� run� teleportacji.";
};

FUNC INT DIA_prin_BuyRune_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_Teleport) && (buy_teleprt_prin == false)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_BuyRune_Info()
{
	AI_Output (other, self ,"DIA_prin_BuyRune_15_01"); //Chc� od ciebie kupi� t� run� teleportacji.
	if (Npc_HasItems (hero, ItMiNugget)>=300)
	{
    AI_Output (self, other ,"DIA_prin_BuyRune_03_02"); //Oto ona. Uwa�aj tylko, �eby nie pu�ci� obozu z dymem!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_03"); //Runy teleportacji z regu�y nie siej� zniszczenia.
	AI_Output (self, other ,"DIA_prin_BuyRune_03_04"); //A co ty tam wiesz! Ostro�nie z tym!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_05"); //Dobra, dobra. 
	
	CreateInvItems (self, ItArRuneTeleport_OH, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_OH, 1);
	
	B_GiveInvItems (other, self, itminugget, 300);
	
	buy_teleprt_prin = true;
	DIA_prin_BuyRune.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_prin_BuyRune_03_06"); //Umawiali�my si� na TRZYSTA bry�ek. Nie zapominaj.
	};	
};