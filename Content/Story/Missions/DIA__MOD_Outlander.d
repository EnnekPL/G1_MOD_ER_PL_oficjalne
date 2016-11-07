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
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Outlander_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Outlander_Hello_Info()
{	
	AI_Output (other, self,"Info_Outlander_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Outlander_Hello_09_01"); //Jestem twórc¹ tego moda. W czym mogê pomóc?
};

INSTANCE Info_Outlander_Help(C_INFO)
{
	npc			= Outlander;
	nr			= 1;
	condition	= Info_Outlander_Help_Condition;
	information	= Info_Outlander_Help_Info;
	permanent	= 0;
	description = "Szukam jakichœ wskazówek na pocz¹tek gry.";
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
	AI_Output (other, self,"Info_Outlander_Help_15_00"); //Szukam jakichœ wskazówek na pocz¹tek gry.
	AI_Output (self, other,"Info_Outlander_Help_09_01"); //Przede wszystkim nie zbli¿aj siê do Bariery, he he.
	AI_Output (self, other,"Info_Outlander_Help_09_02"); //A teraz na powa¿nie...
	AI_Output (self, other,"Info_Outlander_Help_09_03"); //Ukry³em w kolonii kilka skrzyñ ze skarbami. Kilka z nich znajdziesz na pocz¹tku.
	AI_Output (self, other,"Info_Outlander_Help_09_04"); //Jedna jest w górach po drugiej stronie starego mostu. Jest tam jeden kretoszczur. Na pewno wiesz, który.
	AI_Output (self, other,"Info_Outlander_Help_09_05"); //Musisz siê wspi¹æ na górê po ska³ach z prawej strony. Przy skrzyni s¹ dwa m³ode gobliny.
	AI_Output (self, other,"Info_Outlander_Help_09_06"); //Gdy ju¿ je zabijesz spójrz w lewo. Zobaczysz ska³ê przypominaj¹c¹ szpicê.
	AI_Output (self, other,"Info_Outlander_Help_09_07"); //WejdŸ na ni¹ i delikatnie zjedŸ na dó³. Trafisz wtedy na kolejn¹ skrzynkê.
	AI_Output (self, other,"Info_Outlander_Help_09_08"); //Ostatnia jest za Geraldem. Po prostu idŸ wzd³u¿ krawêdzi. Postaraj siê nie spaœæ. 
	AI_Output (self, other,"Info_Outlander_Help_09_09"); //Trzy kolejne skrzynie s¹ w górach za Nowym Obozem. Te s¹ znacznie cenniejsze.
	AI_Output (self, other,"Info_Outlander_Help_09_10"); //W obozie przed star¹ kopalni¹ znajdziesz list, który daje kilka punktów zrêcznoœci.
	AI_Output (self, other,"Info_Outlander_Help_09_11"); //Przyda ci siê, jeœli bêdziesz chcia³ ukraœæ raport Lorenzo.
	AI_Output (self, other,"Info_Outlander_Help_09_12"); //Gdzieœ w pobli¿u powinien tam le¿eæ zwój telekinezy. Wykorzystaj go.
	AI_Output (self, other,"Info_Outlander_Help_09_13"); //Na pocz¹tek tyle ci wystarczy.
	AI_Output (self, other,"Info_Outlander_Help_09_14"); //A, i jeszcze jedno. Flinta najlepiej ubiæ przy pomocy czaru snu. Zwój le¿y gdzieœ w okolicy. Powodzenia!
};