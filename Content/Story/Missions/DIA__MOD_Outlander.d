INSTANCE Info_Outlander_EXIT(C_INFO)
{
	npc			= Outlander ;
	nr			= 999;
	condition	= Info_Outlander_EXIT_Condition;
	information	= Info_Outlander_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Outlander_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Outlander_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Outlander_Hello(C_INFO)
{
	npc			= Outlander;
	nr			= 1;
	condition	= Info_Outlander_Hello_Condition;
	information	= Info_Outlander_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT Info_Outlander_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Outlander_Hello_Info()
{	
	AI_Output (other, self,"Info_Outlander_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Outlander_Hello_09_01"); //Jestem tw�rc� tego moda. W czym mog� pom�c?
};

INSTANCE Info_Outlander_Help(C_INFO)
{
	npc			= Outlander;
	nr			= 1;
	condition	= Info_Outlander_Help_Condition;
	information	= Info_Outlander_Help_Info;
	permanent	= 0;
	description = "Szukam jakich� wskaz�wek na pocz�tek gry.";
};                       

FUNC INT Info_Outlander_Help_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Outlander_Hello))
	{
	return 1;
	};
};

FUNC VOID Info_Outlander_Help_Info()
{	
	AI_Output (other, self,"Info_Outlander_Help_15_00"); //Szukam jakich� wskaz�wek na pocz�tek gry.
	AI_Output (self, other,"Info_Outlander_Help_09_01"); //Przede wszystkim nie zbli�aj si� do Bariery, he he.
	AI_Output (self, other,"Info_Outlander_Help_09_02"); //A teraz na powa�nie...
	AI_Output (self, other,"Info_Outlander_Help_09_03"); //Ukry�em w kolonii kilka skrzy� ze skarbami. Kilka z nich znajdziesz na pocz�tku.
	AI_Output (self, other,"Info_Outlander_Help_09_04"); //Jedna jest w g�rach po drugiej stronie starego mostu. Jest tam jeden kretoszczur. Na pewno wiesz, kt�ry.
	AI_Output (self, other,"Info_Outlander_Help_09_05"); //Musisz si� wspi�� na g�r� po ska�ach z prawej strony. Przy skrzyni s� dwa m�ode gobliny.
	AI_Output (self, other,"Info_Outlander_Help_09_06"); //Gdy ju� je zabijesz sp�jrz w lewo. Zobaczysz ska�� przypominaj�c� szpic�.
	AI_Output (self, other,"Info_Outlander_Help_09_07"); //Wejd� na ni� i delikatnie zjed� na d�. Trafisz wtedy na kolejn� skrzynk�.
	AI_Output (self, other,"Info_Outlander_Help_09_08"); //Ostatnia jest za Geraldem. Po prostu id� wzd�u� kraw�dzi. Postaraj si� nie spa��. 
	AI_Output (self, other,"Info_Outlander_Help_09_09"); //Trzy kolejne skrzynie s� w g�rach za Nowym Obozem. Te s� znacznie cenniejsze.
	AI_Output (self, other,"Info_Outlander_Help_09_10"); //W obozie przed star� kopalni� znajdziesz list, kt�ry daje kilka punkt�w zr�czno�ci.
	AI_Output (self, other,"Info_Outlander_Help_09_11"); //Przyda ci si�, je�li b�dziesz chcia� ukra�� raport Lorenzo.
	AI_Output (self, other,"Info_Outlander_Help_09_12"); //Gdzie� w pobli�u powinien tam le�e� zw�j telekinezy. Wykorzystaj go.
	AI_Output (self, other,"Info_Outlander_Help_09_13"); //Na pocz�tek tyle ci wystarczy.
	AI_Output (self, other,"Info_Outlander_Help_09_14"); //A, i jeszcze jedno. Flinta najlepiej ubi� przy pomocy czaru snu. Zw�j le�y gdzie� w okolicy. Powodzenia!
};