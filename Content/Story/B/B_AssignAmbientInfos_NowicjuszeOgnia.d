// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_fnov_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_fnov_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_fnov_2_EXIT_Condition;
	information	= Info_fnov_2_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_fnov_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_fnov_2_Sytuacja(C_INFO)
{
	nr			= 3;
	condition	= Info_fnov_2_Sytuacja_Condition;
	information	= Info_fnov_2_Sytuacja_Info;
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT Info_fnov_2_Sytuacja_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_Sytuacja_Info()
{
	AI_Output(other,self,"Info_fnov_2_Sytuacja_15_00"); //Co s�ycha�?
	AI_Output(self,other,"Info_fnov_2_Sytuacja_02_01"); //Wszystko w porz�dku bracie. Poszukujemy zbawienia w modlitwie do Innosa i wykonujemy proste zlecenia dla Mag�w Ognia.
	AI_Output(other,self,"Info_fnov_2_Sytuacja_15_02"); //Zbawienie od czego?
	AI_Output(self,other,"Info_fnov_2_Sytuacja_02_03"); //Aby Innos przebaczy� nam nasze przewinienia za kt�re znale�li�my si� w tym miejscu i �eby pom�g� nam wydosta� si� na wolno��.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_fnov_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_fnov_2_DasLager_Condition;
	information	= Info_fnov_2_DasLager_Info;
	permanent	= 1;
	description = "Co mo�esz mi powiedzie� o Obozie?";
};                       

FUNC INT Info_fnov_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_fnov_2_DasLager_15_00"); //Co mo�esz mi powiedzie� o Obozie?
	AI_Output(self,other,"Info_fnov_2_DasLager_02_01"); //To najwi�kszy ob�z w Kolonii. Ma on r�wnie� najwi�ksze znaczenie, ze wzgl�du na handel ze �wiatem zewn�trznym. 
	AI_Output(self,other,"Info_fnov_2_DasLager_02_02"); //Stary Ob�z by� pierwsz� siedzib� wi�ni�w w Kolonii. Za�o�ono go od razu po powstaniu Bariery. 
	AI_Output(self,other,"Info_fnov_2_DasLager_02_03"); //Z tego co wiem na zamku wcze�niej mieszkali kr�lewscy �o�nierze a zewn�trzny pier�cie� by� siedzib� wi�ni�w wrzucanych do G�rniczej Doliny. 
	AI_Output(self,other,"Info_fnov_2_DasLager_02_04"); //Ludzie ze Starego Obozu nie przepadaj� za Nowym Obozem, wyj�tkiem s� magowie kt�rzy utrzymuj� kontakty z Magami Wody.
	AI_Output(self,other,"Info_fnov_2_DasLager_02_05"); //Prowadzimy r�wnie� intensywn� wymian� handlow� z Bractwem. 
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_fnov_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_DieLage_Condition;
	information	= Info_fnov_2_DieLage_Info;
	permanent	= 1;
	description = "Kto tu rz�dzi?";
};                       

FUNC INT Info_fnov_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_fnov_2_DieLage_15_00"); //Kto tu rz�dzi?
	AI_Output(self,other,"Info_fnov_2_DieLage_02_01"); //Masz na my�li Stary Ob�z czy nas Nowicjuszy?
	AI_Output(self,other,"Info_fnov_2_DieLage_02_02"); //W Obozie rz�dz� Magnaci, a w szczeg�lno�ci Gomez. To oni handluj� ze �wiatem zewn�trznym i podejmuj� wszelkie wa�ne decyzje odno�nie obozu.
	AI_Output(self,other,"Info_fnov_2_DieLage_02_03"); //Je�li chodzi o nas, to podlegamy Magom Ognia. Ich przyw�dc� jest Arcymag o imieniu Corristo. 
	AI_Output(self,other,"Info_fnov_2_DieLage_02_04"); //Musimy jednak s�ucha� wszystkich Mag�w i sumiennie wykonywa� ich polecenia.	
};

	
// *************************************************************************
// 								Zaj�cia
// *************************************************************************

INSTANCE Info_fnov_2_Zajecia(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_Zajecia_Condition;
	information	= Info_fnov_2_Zajecia_Info;
	permanent	= 1;
	description = "Czym zajmuj� si� Nowicjusze Ognia?";
};                       

FUNC INT Info_fnov_2_Zajecia_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_Zajecia_Info()
{
	AI_Output(other,self,"Info_fnov_2_Zajecia_15_00"); //Czym zajmuj� si� Nowicjusze Ognia?
	AI_Output(self,other,"Info_fnov_2_Zajecia_02_01"); //Wykonujemy proste prace, takie jak sprz�tanie �wi�tyni oraz sprawujemy opiek� nad zamkow� kaplic� Innosa. 
	AI_Output(self,other,"Info_fnov_2_Zajecia_02_02"); //Czasami Magowie zlecaj� nam r�ne misje, kt�re wykonujemy ku chwale Innosa. 
	AI_Output(self,other,"Info_fnov_2_Zajecia_02_03"); //W zamian za s�u�b� Panu Ognia i jego wybra�com mo�emy uczy� si� magii.
};	

	
// *************************************************************************
// 								Handel-info
// *************************************************************************

INSTANCE Info_fnov_2_handel(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_handel_Condition;
	information	= Info_fnov_2_handel_Info;
	permanent	= 1;
	description = "Gdzie mog� naby� przedmioty magiczne?";
};                       

FUNC INT Info_fnov_2_handel_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_handel_Info()
{
	AI_Output(other,self,"Info_fnov_2_handel_15_00"); //Gdzie mog� naby� przedmioty magiczne?
	AI_Output(self,other,"Info_fnov_2_handel_02_01"); //Jak chcesz zakupi� magiczne przedmioty, takie jak mikstury i zwoje magiczne to udaj si� na targowisko. Znajdziesz tam Nowicjusza Jima. 
	AI_Output(self,other,"Info_fnov_2_handel_02_02"); //Zajrzyj tak�e do Mistrza Torreza, on tak�e sprzedaje magiczne przedmioty. Znajdziesz go przed �wi�tyni�. 
};	

// *************************************************************************
// 								Relacje
// *************************************************************************

INSTANCE Info_fnov_2_relacje(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_relacje_Condition;
	information	= Info_fnov_2_relacje_Info;
	permanent	= 1;
	description = "Jak wygl�daj� wasze relacj� z pozosta�ymi gildiami Starego Obozu?";
};                       

FUNC INT Info_fnov_2_relacje_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_relacje_Info()
{
	AI_Output(other,self,"Info_fnov_2_relacje_15_00"); //Jak wygl�daj� wasze relacj� z pozosta�ymi gildiami Starego Obozu?
	AI_Output(self,other,"Info_fnov_2_relacje_02_01"); //No c�, oczywi�cie musimy s�ucha� polece� Magnat�w i Stra�nik�w. Jeste�my Cieniami na us�ugach Mag�w Ognia. 
	AI_Output(self,other,"Info_fnov_2_relacje_02_02"); //Niewielki wp�yw ma na nas Diego, przyw�dca Cieni. Jednak on zarz�dza g��wnie wojownikami. Naszymi prze�o�onymi s� Magowie. 
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_fnov_2(var c_NPC slf)
{
	Info_fnov_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_fnov_2_Sytuacja.npc		= Hlp_GetInstanceID(slf);
	Info_fnov_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_Zajecia.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_handel.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_relacje.npc				= Hlp_GetInstanceID(slf);
};
