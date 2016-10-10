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
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_01"); //Kajdany, którymi udusi³em jednego z tych sukinsynów...
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_02"); //Znasz Jarreda? Kim ty w ogóle jesteœ?
    AI_Output (other, self ,"DIA_Felgor_HELLO1_15_03"); //To nieistotne. Spotka³em Jarreda w lochach. Podarowa³ mi te kajdany. Nie chcia³ ich nosiæ ze sob¹.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_04"); //Poczciwy Jarred. To nie by³o dla niego ³atwe...
    AI_Output (other, self ,"DIA_Felgor_HELLO1_15_05"); //Wiem, opowiada³ mi wszystko. To co mówi³ by³o prawd¹?
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_06"); //Jeszcze pytasz?! Zosta³em oszukany! Zdradzony!
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_07"); //Ten pod³y k³amca Skelden wszystko uknu³. Tak opl¹ta³ sobie Gomeza wokó³ palca, ¿e nie by³em w stanie przemówiæ mu do rozs¹dku.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_08"); //Przydzielili mi dwóch Stra¿ników i kazali pozbyæ siê grupy Szkodników, która rozbi³a obóz w okolicach placu wymian.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_09"); //Takie zadania to dla mnie nie pierwszyzna. Zabra³em broñ i poszed³em. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_10"); //Gdy doszliœmy do wyznaczonego miejsca Stra¿nicy rzucili siê na mnie, a zewsz¹d pojawi³o siê piêciu kolejnych.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_11"); //Oczywiœcie Skelden sta³ na ich czele. By³ te¿ Bartholo. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_12"); //Zaczê³a siê rzeŸ. Zdrajcy, którzy przyszli ze mn¹ padli pierwsi. Jeden straci³ g³owê, drugiemu zrobi³em dziurê w brzuchu.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_13"); //PóŸniej do³¹czy³o do nich jeszcze dwóch. Reszcie nie da³em rady. Jeden skoczy³ na mnie od ty³u, a Skelden i Bartholo próbowali mnie og³uszyæ.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_14"); //Uda³o im siê...
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_15"); //Obudzi³em siê w wiêzieniu razem z Jarredem. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_16"); //Dzieñ póŸniej dowiedzia³em siê, ¿e jestem ¿ywym trupem. Kapujesz? Zorganizowali mój pogrzeb.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_17"); //Jak¹œ pieprzon¹ ceremoniê. Nawet Corristo powiedzia³ kilka s³ów na po¿egnanie. Ha ha! S³yszysz to?
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_18"); //Sukinsyny...
    AI_Output (other, self ,"DIA_Felgor_HELLO1_15_19"); //Co by³o potem?
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_20"); //Ju¿ nie pamiêtam. Popad³em wtedy w ob³êd. Zg³upia³em do reszty.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_21"); //Tylko Jarred utrzymywa³ mnie przy ¿yciu. Przynajmniej mia³em do kogo gadaæ. 
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_22"); //PóŸniej przesta³ mnie s³uchaæ. Przesta³ siê nawet odzywaæ.
    AI_Output (self, other ,"DIA_Felgor_HELLO1_03_23"); //S³ysza³em ju¿ tylko samego siebie, ale i to nie trwa³o d³ugo...
	AI_Output (other, self ,"DIA_Felgor_HELLO1_15_24"); //Te kajdany s¹ teraz twoje. Jesteœ wolny.
	AI_Output (self, other ,"DIA_Felgor_HELLO1_03_25"); //Dziêkujê. Dobrze, ¿e chocia¿ ty pozna³eœ prawdê. 
	
	B_GiveInvItems (hero,self,ItMi_FattersInPocket,1);
	B_GiveXP (500);
	AI_StopProcessInfos	(self);
	AI_Teleport (self,"START");
	Npc_Exchangeroutine (self,"nope");
};

