// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Eskel_Exit (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 999;
	condition	= DIA_Eskel_Exit_Condition;
	information	= DIA_Eskel_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Eskel_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Eskel_Exit_Info()
{
	AI_StopProcessInfos(self);
};

INSTANCE DIA_Eskel_Hello (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_Hello_Condition;
	information	= DIA_Eskel_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT DIA_Eskel_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Eskel_Hello_Info()
{
	AI_Output (other, self,"DIA_Eskel_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Eskel_Hello_01_01"); //A co ci� to obchodzi? A zreszt�... Jeszcze niedawno by�em piekarzem i nawet jako� sobie radzi�em. Do czasu, gdy mi�o�ciwie nam panuj�cy Rhobar II nie zacz�� nak�ada� coraz to nowych podatk�w. 
	AI_Output (self, other,"DIA_Eskel_Hello_01_02"); //Wszystko na t� wojn� z orkami. Postanowi�em jednak si� nie dawa�.
	AI_Output (self, other,"DIA_Eskel_Hello_01_03"); //By sobie jako� odbija� ten kr�lewski haracz, zacz��em dosypywa� piachu do swojej m�ki. Pewnego ranka do moich drzwi zastuka�a stra� i si� sko�czy�o.
	AI_Output (self, other,"DIA_Eskel_Hello_01_04"); //Musia�em si� po�egna� z moj� piekarni� w Khorinis.
};

INSTANCE DIA_Eskel_GoodPunish (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_GoodPunish_Condition;
	information	= DIA_Eskel_GoodPunish_Info;
	permanent	= 0;
	description = "Nale�a�o ci si�.";
};                       

FUNC INT DIA_Eskel_GoodPunish_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Eskel_Hello))
	{
		return 1;
	};
};

func void DIA_Eskel_GoodPunish_Info()
{
	AI_Output (other, self,"DIA_Eskel_GoodPunish_15_00"); //Nale�a�o ci si� za to dosypywanie piasku do m�ki.
	AI_Output (self, other,"DIA_Eskel_GoodPunish_01_01"); //Zje�d�aj st�d!
	
	AI_StopProcessInfos(self);
};

INSTANCE DIA_Eskel_WhoRules (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_WhoRules_Condition;
	information	= DIA_Eskel_WhoRules_Info;
	permanent	= 0;
	description = "Kto tu rz�dzi?";
};                       

FUNC INT DIA_Eskel_WhoRules_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Eskel_Hello))
	{
		return 1;
	};
};

func void DIA_Eskel_WhoRules_Info()
{
	AI_Output (other, self,"DIA_Eskel_WhoRules_15_00"); //Kto tu rz�dzi?
	AI_Output (self, other,"DIA_Eskel_WhoRules_01_01"); //Rz�dz� tutaj Stra�nicy, a raczej pi�ci tych pysza�kowatych siepaczy. To nie Montera, tutaj Stra�nicy nie dzia�aj� w imieniu prawa. Te osi�ki wymuszaj� na Kopaczach haracz, w zamian za "ochron�".
	AI_Output (self, other,"DIA_Eskel_WhoRules_01_02"); //Chcesz prze�y� w tej parszywej Kolonii, to dam ci dobr� rade, ch�opcze. Lepiej im zap�a�. Wprawdzie jak kto� b�dzie chcia� ci wtedy ukreci� �eb, to Sra�nicy nie pop�dz� na ratunek, ale przynajmniej mu nie pomog�.
};

INSTANCE DIA_Eskel_DailyLife (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_DailyLife_Condition;
	information	= DIA_Eskel_DailyLife_Info;
	permanent	= 0;
	description = "Jak wygl�da �ycie tutaj?";
};                       

FUNC INT DIA_Eskel_DailyLife_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Eskel_Hello))
	{
		return 1;
	};
};

func void DIA_Eskel_DailyLife_Info()
{
	AI_Output (other, self,"DIA_Eskel_DailyLife_15_00"); //Jak wygl�da �ycie tutaj?
	AI_Output (self, other,"DIA_Eskel_DailyLife_01_01"); //Jeszcze si� pytasz? Rozejrzyj si�. To jest wiezienie, a my Kopacze jeste�my na samym pocz�tku tego �a�cucha pokarmowego. Przekl�te miejsce...
};

INSTANCE DIA_Eskel_Teeth (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_Teeth_Condition;
	information	= DIA_Eskel_Teeth_Info;
	important	= 1;
//	description = ".";
};                       

FUNC INT DIA_Eskel_Teeth_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jesse_Eskel))
	{
		return 1;
	};
};

FUNC VOID DIA_Eskel_Teeth_Info()
{
	AI_Output (self, other,"DIA_Eskel_Teeth_01_00"); //Aaaa... Moja szcz�ka!
	AI_Output (other, self,"DIA_Eskel_Teeth_15_01"); //Ooo... Co takiego strasznego ci� spotka�o?
	AI_Output (self, other,"DIA_Eskel_Teeth_01_02"); //Jaki� dra� dosypa� mi piasku do m�ki. Straci�em kilka z�b�w! Gdybym ja go dopad�!
	AI_Output (other, self,"DIA_Eskel_Teeth_15_03"); //Pono� pewien piekarz z Khorinis robi� podobnie.
	AI_Output (self, other,"DIA_Eskel_Teeth_01_04"); //Nic mi o tym nie wiadomo.
	AI_Output (other, self,"DIA_Eskel_Teeth_15_05"); //Ciekawe. Zatem �ycz� mi�ego liczenia z�b�w.
	
	AI_StopProcessInfos(self);
};