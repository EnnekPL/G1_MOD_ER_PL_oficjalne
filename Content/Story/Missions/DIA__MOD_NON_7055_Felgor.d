// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Felgor_EXIT(C_INFO)
{
	npc             = NON_7055_Felgor;
	nr              = 999;
	condition		= DIA_Felgor_EXIT_Condition;
	information		= DIA_Felgor_EXIT_Info;
	permanent		= TRUE;
	description    	= DIALOG_ENDE;
};

FUNC INT DIA_Felgor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Felgor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Felgor_HELLO1 (C_INFO)
{
   npc          = NON_7055_Felgor;
   nr           = 1;
   condition    = DIA_Felgor_HELLO1_Condition;
   information  = DIA_Felgor_HELLO1_Info;
   permanent	= FALSE;
   description  = "Witaj, Felgorze.";
};

FUNC INT DIA_Felgor_HELLO1_Condition()
{
    if (Npc_HasItems (hero, ItMi_FattersInPocket) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Felgor_HELLO1_Info()
{
	AI_Output (other, self ,"DIA_Felgor_HELLO1_15_00"); //Witaj, Felgorze.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_01"); //Kajdany, kt�rymi udusi�em jednego z tych sukinsyn�w...
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_02"); //Znasz Jarreda? Kim ty w og�le jeste�?
    AI_Output (other, self ,"DIA_Felgor_HELLO1_15_03"); //To nieistotne. Spotka�em Jarreda w lochach. Podarowa� mi te kajdany. Nie chcia� ich nosi� ze sob�.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_04"); //Poczciwy Jarred. To nie by�o dla niego �atwe...
    AI_Output (other, self ,"DIA_Felgor_HELLO1_15_05"); //Wiem, opowiada� mi wszystko. To co m�wi� by�o prawd�?
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_06"); //Jeszcze pytasz?! Zosta�em oszukany! Zdradzony!
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_07"); //Ten pod�y k�amca Skelden wszystko uknu�. Tak opl�ta� sobie Gomeza wok� palca, �e nie by�em w stanie przem�wi� mu do rozs�dku.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_08"); //Przydzielili mi dw�ch Stra�nik�w i kazali pozby� si� grupy Szkodnik�w, kt�ra rozbi�a ob�z w okolicach placu wymian.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_09"); //Takie zadania to dla mnie nie pierwszyzna. Zabra�em bro� i poszed�em. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_10"); //Gdy doszli�my do wyznaczonego miejsca Stra�nicy rzucili si� na mnie, a zewsz�d pojawi�o si� pi�ciu kolejnych.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_11"); //Oczywi�cie Skelden sta� na ich czele. By� te� Bartholo. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_12"); //Zacz�a si� rze�. Zdrajcy, kt�rzy przyszli ze mn� padli pierwsi. Jeden straci� g�ow�, drugiemu zrobi�em dziur� w brzuchu.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_13"); //P�niej do��czy�o do nich jeszcze dw�ch. Reszcie nie da�em rady. Jeden skoczy� na mnie od ty�u, a Skelden i Bartholo pr�bowali mnie og�uszy�.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_14"); //Uda�o im si�...
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_15"); //Obudzi�em si� w wi�zieniu razem z Jarredem. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_16"); //Dzie� p�niej dowiedzia�em si�, �e jestem �ywym trupem. Kapujesz? Zorganizowali m�j pogrzeb.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_17"); //Jak�� pieprzon� ceremoni�. Nawet Corristo powiedzia� kilka s��w na po�egnanie. Ha ha! S�yszysz to?
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_18"); //Sukinsyny...
    AI_Output (other, self ,"DIA_Felgor_HELLO1_15_19"); //Co by�o potem?
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_20"); //Ju� nie pami�tam. Popad�em wtedy w ob��d. Zg�upia�em do reszty.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_21"); //Tylko Jarred utrzymywa� mnie przy �yciu. Przynajmniej mia�em do kogo gada�. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_22"); //P�niej przesta� mnie s�ucha�. Przesta� si� nawet odzywa�.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_23"); //S�ysza�em ju� tylko samego siebie, ale i to nie trwa�o d�ugo...
	AI_Output (other, self ,"DIA_Felgor_HELLO1_15_24"); //Te kajdany s� teraz twoje. Jeste� wolny.
	AI_Output (self, other ,"DIA_Felgor_HELLO1_03_25"); //Dzi�kuj�. Dobrze, �e chocia� ty pozna�e� prawd�. 
	
	B_GiveInvItems (hero,self,ItMi_FattersInPocket,1);
	B_GiveXP (500);
	AI_StopProcessInfos	(self);
	AI_Teleport (self,"START");
	Npc_Exchangeroutine (self,"nope");
};

