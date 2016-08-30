//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //KTO �MIE PRZESZKADZA� MI W MOICH STUDIACH?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Nazywam si�...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Nie interesuje mnie twoje imi�. To nieistotne.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Liczy si� tylko to, �e jeste� pierwsz� osob� od wielu lat, kt�rej uda�o si� rozwi�za� zagadk� Golem�w.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Czy kto� jeszcze tu zagl�da�?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Czy kto� jeszcze tu zagl�da�?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Bardzo rzadko. Zwykle szybko zaczynali mnie irytowa� i nasy�a�em na nich kt�r�� z moich magicznych istot.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Wolisz wie�� �ywot samotnika, czy� nie?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Przysy�a mnie Saturas. Potrzebujemy twojej pomocy!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Przysy�a mnie Saturas. Potrzebujemy twojej pomocy!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Magowie Wody zamierzaj� zrobi� u�ytek ze swojego kopca rudy.
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Detonacja wielkiej g�ry nie jest �adnym rozwi�zaniem!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Nie jest?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NIE!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Wszyscy Magowie Ognia zgin�li!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Wszyscy Magowie Ognia zgin�li!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez kaza� ich zamordowa�.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Nie powiem, �ebym by� szczeg�lnie zaskoczony. Tym durnym barbarzy�com z zamku - z Gomezem na czele - nigdy nie mo�na by�o ufa�.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Pomagaj�c Gomezowi w obj�ciu w�adzy, Corristo i inni sami kopali sobie gr�b.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Tak zwany '�ni�cy' okaza� si� pono� pot�nym demonem zag�ady.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Tak zwany "�ni�cy" okaza� si� pono� pot�nym demonem zag�ady.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Przekona�o si� o tym Bractwo z obozu na bagnie.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Magowie Wody uwa�aj� teraz, �e ca�a Kolonia znalaz�a si� w �miertelnym niebezpiecze�stwie.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Stoimy przed powa�niejszym zagro�eniem ni� ktokolwiek wewn�trz Bariery jest w stanie sobie wyobrazi�...
}; 
/*
//========================================
//-----------------> KillBlacMageFix
//========================================

INSTANCE DIA_Xardas_KillBlacMageFix (C_INFO)
{
   npc          = Kdf_404_Xardas;
   nr           = 1;
   condition    = DIA_Xardas_KillBlacMageFix_Condition;
   information  = DIA_Xardas_KillBlacMageFix_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Xardas_KillBlacMageFix_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Xardas_SATURAS))
    && (Npc_KnowsInfo (hero, Info_Xardas_SLEEPER))
    && (!MIS_WlakaZczarym == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Xardas_KillBlacMageFix_Info()
{
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_01"); //Razem z Saturasem zastanawiacie si� nad ucieczk� z tego miejsca, a nie pozbyli�cie si� jeszcze najwa�niejszego problemu!
    AI_Output (other, self ,"DIA_Xardas_KillBlacMageFix_15_02"); //Jakiego problemu? O co ci chodzi?
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_03"); //G�upcy! 
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_04"); //Nie czujesz z�ych mocy, kt�re znajduj� si� w Kolonii?
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_05"); //To co sta�o si� w Bractwie wywo�a�o wi�cej z�ego ni� mo�e ci si� wydawa�.
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_06"); //Przypuszczam, �e za wszystkim stoi �ni�cy!
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_07"); //Odpowied� znajdziesz w Opuszczonej Kopalni.
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_08"); //Id� tam, p�ki jeszcze nie jest za p�no.
    AI_Output (self, other ,"DIA_Xardas_KillBlacMageFix_03_09"); //Musisz odnale�� znak!
    MIS_WlakaZczarym = LOG_RUNNING;

    Log_CreateTopic            (CH1_WlakaZczarym, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WlakaZczarym, LOG_RUNNING);
    B_LogEntry                     (CH1_WlakaZczarym,"Xardas pot�pi� mnie za zignorowanie nowego zagro�enia w Kolonii. Nie do ko�ca rozumiem o co mu chodzi. Mo�e rzeczywi�cie razem z Saturasem co� przeoczyli�my? Odpowiedzi mam szuka� w Opuszczonej Kopalni.");
    AI_StopProcessInfos	(self);
};

*/

var int perm_xardasdanger;
//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 1;
	description = "Je�li detonacja kopca rudy nie wystarczy, by za�egna� niebezpiecze�stwo...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	&& (perm_xardasdanger == false)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Je�li detonacja kopca rudy nie wystarczy, by za�egna� niebezpiecze�stwo...
	if MIS_CorristoEvil == LOG_SUCCESS 
	{
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...Zapomnij o tym ca�ym kopcu! Jego pot�ga nie wystarczy, by prze�ama� Barier�.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Gdyby Corristo i Saturas nie tracili cennego czasu na te swoje dziecinne spory, wiedzieliby teraz co nale�y zrobi�.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //A co twoim zdaniem nale�y zrobi�?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //�aden z dwunastu mag�w nie zada� sobie trudu, by zbada� z jakich przyczyn Bariera wymkn�a si� spod kontroli, ani dlaczego przybra�a tak ogromne rozmiary.
	perm_xardasdanger = true;
	}
	else
	{
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_06"); //Ju� my�licie o ucieczce, a �aden z was nie zdaje sobie sprawy z tego co si� dzieje wok�. 
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_07"); //W obecnej sytuacji nie mo�esz by� nawet pewien, czy zd��ysz wykona� zadanie do ko�ca.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_08"); //Jakie zadanie? Jeszcze o niczym mi nie powiedzia�e�!
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_09"); //Zanim ci cokolwiek powiem musimy uspokoi� te magiczne aberracje, kt�re wyczuwam. Ich �r�d�o zdaje si� znajdowa� w pobli�u miejsca wymiany...
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_10"); //Opuszczona kopalnia...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_11"); //Tak, ongi� by�a tam kopalnia. Musisz zbada� to miejsce. To co si� w nim znajduje mo�e nam wszystkim zagrozi�.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_12"); //Obecna sytuacja, mam na my�li wojn� miedzy obozami, mo�e ci to u�atwi�.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_13"); //Faktycznie. Gomez pewnie b�dzie chcia� zablokowa� miejsce wymiany i kopalni�. By� mo�e Lares, Lee, albo Quentin b�d� widzie� co� na ten temat.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_14"); //Znaj�c porywczo�� tych ludzi w ich g�owach ju� k��bi� si� jakie� plany. Wr�� wiec do nich i wykonuj ich rozkazy, a mo�e przebieg wydarze� umo�liwi ci zej�cie do kopalni.
	};	
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "A ty wiesz, co si� sta�o, tak?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	(perm_xardasdanger == true)
	//Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //A ty wiesz, co si� sta�o, tak?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //C�, jedno jest pewne: odpowied� spoczywa ukryta g��boko pod miastem ork�w.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Miastem ork�w?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Orkowie to nie zwierz�ta, cho� wielu ludzi tak w�a�nie my�li. Ich kultura dor�wnuje wiekiem naszej.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Wiele stuleci temu, pi�ciu orkowych szaman�w przywo�a�o do tego �wiata pot�nego demona, kt�ry mia� im pom�c zdominowa� pozosta�e klany.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ten demon... To �ni�cy, prawda?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Orkowie nadali mu to imi� du�o p�niej. Ale nie powiem ci dlaczego wybrali t� nazw�, ani dlaczego tak bardzo si� go teraz boj�!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Dlaczego nie?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Dlaczego nie?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //My�l�, �e mo�esz by�... NIE, aby mnie przekona�, musisz wykona� jeszcze jedno zadanie!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Jakie zadanie?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //S�uchaj uwa�nie: Orkowie wygnali z miasta jednego ze swoich szaman�w.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Dlaczego?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Dlaczego?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Umieraj�cy ork, kt�rego kaza�em przes�ucha� moim demonom, nie by� w stanie odpowiedzie� mi na to pytanie.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Co ten szaman ma wsp�lnego z moim zadaniem?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Co ten szaman ma wsp�lnego z moim zadaniem?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //On opowie ci reszt� historii zwi�zanej ze �ni�cym.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Obawiam si�, �e ork nie b�dzie zbyt ch�tny do zwierze� w mojej obecno�ci!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Chcesz �ebym ci pom�g�, czy nie?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Tak, ale...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Wi�c nigdy wi�cej nie kwestionuj tego, co m�wi�!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Znajd� tego szamana. Nie pa�a mi�o�ci� do swych braci z miasta ork�w, wi�c mo�e zgodzi si� ciebie wys�ucha� zanim zamieni ci� w �yw� pochodni�!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Bardzo pocieszaj�ce!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Gdzie znajd� tego wygnanego szamana?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Gdzie znajd� tego wygnanego szamana?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Id� do starej Cytadeli na wschodzie. Na pewno trafisz - znajduje si� na szczycie wysokiej g�ry. Wida� j� ju� z daleka.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //I mog� tak po prostu do niej wej��?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //M�wi� na ni� stara Cytadela, cho� tak naprawd� to tylko sterta kamieni. Od wielu dziesi�cioleci nikt tam nie zagl�da.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "Porozmawiam z tym szamanem!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Porozmawiam z tym szamanem!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //M�j s�uga da� ci ju� magiczn� run� uaktywniaj�c� pentagram pi�tro ni�ej.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //W ten spos�b b�dziesz m�g� wr�ci� do mnie natychmiast po wykonaniu zadania.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_04"); //Zanim wyruszysz mog� ci sprzeda� magiczne artefakty. Zabra�em kilka z siedziby Mag�w Ognia.

	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry (GE_TraderOW,"Xardas - trzynasty mag, sprzeda mi magiczne artefakty, kt�re zabra� z siedziby Mag�w Ognia. Znajd� go w jego wie�y na Ziemiach Ork�w. Nie spos�b przeoczy� tego miejsca.");
	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Poszukuj� wiedzy magicznej."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Poszukuj� wiedzy magicznej.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "Rozmawia�em z szamanem ork�w.";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{

	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Rozmawia�em z szamanem ork�w.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //�wietnie! Czego si� dowiedzia�e�?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Pi�ciu szaman�w, kt�rzy przywo�ali �ni�cego, wybudowa�o dla niego podziemn� �wi�tyni�. Wej�cie do niej znajduje si� w mie�cie ork�w.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //Zgadza si�!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Zamiast okaza� wdzi�czno��, �ni�cy wyrwa� ich serca i skaza� ich, oraz wszystkich, kt�rzy pracowali przy budowie na wieczne pot�pienie, zamieniaj�c ich w O�ywie�c�w!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Doskonale, doskonale!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Orkowie zapiecz�towali wej�cie do �wi�tyni i pr�bowali przeb�aga� demona sk�adaj�c mu ofiary!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Znalaz�e� spos�b na dostanie si� do �wi�tyni?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Tak, jest pewien ork, kt�ry...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //�adnych szczeg��w! Udaj si� do podziemnej �wi�tyni. Tam znajdziesz jedyny spos�b na zniszczenie Bariery!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Nic nie rozumiem!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Poprosi�e� mnie o pomoc w zniszczeniu Bariery, tak czy nie?!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Tak, ale...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //WI�C ID�! Zmarnowano ju� do�� czasu! Id� do podziemnej �wi�tyni! Tam znajdziesz odpowied�!

	B_Story_ReturnedFromUrShak();
	
};
/*
//========================================
//-----------------> DedBlack
//========================================
//edit by Nocturn

INSTANCE DIA_Xardas_DedBlack (C_INFO)
{
   npc          = Kdf_404_Xardas;
   nr           = 1;
   condition    = DIA_Xardas_DedBlack_Condition;
   information  = DIA_Xardas_DedBlack_Info;
   permanent	= FALSE;
   description	= "Pokona�em Czarnego Maga!";
};

FUNC INT DIA_Xardas_DedBlack_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Saturas_KillCzarnyDebil))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Xardas_DedBlack_Info()
{
    AI_Output (other, self ,"DIA_Xardas_DedBlack_15_01"); //Pokona�em Czarnego Maga!
    AI_Output (self, other ,"DIA_Xardas_DedBlack_03_02"); //A wi�c to on by� �r�d�em tych z�ych mocy?
    AI_Output (other, self ,"DIA_Xardas_DedBlack_15_03"); //Tak. To wys�annik Beliara.
    AI_Output (other, self ,"DIA_Xardas_DedBlack_15_04"); //Przygotowywa� Koloni� na przybycie �ni�cego.
    AI_Output (other, self ,"DIA_Xardas_DedBlack_15_05"); //Czy teraz mo�emy zaj�� si� tym, co znajduje si� pod orkowym miastem?
    AI_Output (self, other ,"DIA_Xardas_DedBlack_03_06"); //Najwy�szy czas si� za to zabra�.
    B_GiveXP (500);
};
*/

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em drog� do podziemnej �wi�tyni!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Znalaz�em drog� do podziemnej �wi�tyni!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //ZNALAZ�E�... To niesamowite!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Sta�e� si� niezwykle pot�ny! Pot�niejszy ni� ktokolwiek wewn�trz Bariery.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Mo�e rzeczywi�cie jeste� cz�owiekiem, o kt�rym wspomina proroctwo ork�w!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Proroctwo? Jakie proroctwo?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Proroctwo? Jakie proroctwo?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Prastare manuskrypty ork�w, spisane tu� po zamkni�ciu �wi�tyni, wspominaj� o "�wi�tym Nieprzyjacielu".
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //�wi�tym Nieprzyjacielu?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Kogo�, kto raz na zawsze wyp�dzi �ni�cego z naszego �wiata!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //I to ja mam by� t� osob� z przepowiedni?! Mylisz si�! Na pewno si� mylisz!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Mo�e tak... Mo�e nie!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em dziwny miecz."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Znalaz�em dziwny miecz.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Poka� mi go.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Hmm... To ciekawe. Wyryto na nim s�owo "URIZIEL".
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //S�ysza�em o tym mieczu. To or� z dawnych lat, kiedy rasa ludzka by�a jeszcze bardzo m�oda.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Nie wiem z jakiego materia�u go wykuto, ani nawet KTO go wyku�.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Wed�ug legendy, miecz ma posiada� niezwyk�e moce, ale nie wyczuwam wok� niego magicznej aury!
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL posiada� niezwyk�e moce?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL posiada� niezwyk�e moce?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Napisano, �e posiadacz tej broni by� w stanie przebi� najgrubszy pancerz i przezwyci�y� najsilniejsze zakl�cia.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //W jaki spos�b tak pot�ny or� trafi� w r�ce ork�w?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Pono� orkowie odebrali go pot�nemu rycerzowi. Nie wiedzieli jak go wykorzysta�, wi�c postanowili go ukry�!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Jak wida� - nie do�� dobrze!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czy jest jaki� spos�b na przywr�cenie tej broni dawnej �wietno�ci?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Czy jest jaki� spos�b na przywr�cenie tej broni dawnej �wietno�ci?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Nie obejdzie si� bez odpowiednio silnego �r�d�a magii.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Masz na my�li �r�d�o wystarczaj�co pot�ne, by wysadzi� w powietrze Magiczn� Barier�?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Co� w tym rodzaju...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Opr�cz tego potrzebna b�dzie specjalna magiczna formu�a, kt�ra przeka�e ca�� wyzwolon� energi� na miecz.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Daj mi troch� czasu na przygotowanie formu�y!
	
	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "W mi�dzyczasie, jak poszukam sobie lepszej zbroi!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //W mi�dzyczasie, jak poszukam sobie lepszej zbroi!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Te posklecane w napr�dce pancerze pe�zaczy s� zbyt g�sto podziurawione po wyprawie do podziemnej �wi�tyni!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Te niebieskie szmatki nie zapewni�y mi zbyt wielkiej ochrony w podziemnej �wi�tyni!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //O�ywie�cy porz�dnie podziurawili m�j stary pancerz.
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Powiniene� zajrze� do mojej starej wie�y.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Twojej starej wie�y?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Podczas trz�sienia ziemi poch�on�o j� jedno ze wschodnich jezior. Jej szczyt powinien nadal wystawa� nad poziom wody.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Wewn�trz zosta�o kilka cennych artefakt�w. Nigdy nie zada�em sobie trudu, by je odzyska�.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Jak si� tam dostan�?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Nie zagl�da�em tam od trz�sienia ziemi, wi�c sam b�dziesz musia� poszuka� drogi do �rodka.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //We� ten klucz. Otwiera skrzyni�, w kt�rej przechowywa�em szczeg�lnie cenne artefakty.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Ach, jak widz� nosisz zbroj� runiczn�, wykonan� z magicznej rudy!
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Jak widz�, znalaz�e� zbroj� runiczn�, wykonan� z magicznej rudy!
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Znalaz�em j� w zatopionej wie�y, w jednej z tych starych skrzy�.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Nale�a�a kiedy� do tego samego genera�a, kt�ry dzier�y� URIZIEL w bitwie z orkami.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Mam tylko nadziej�, �e przyniesie mi troch� wi�cej szcz�cia ni� jemu!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przygotowa�e� ju� formu��, kt�ra przywr�ci URIZIELOWI jego dawn� moc?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Przygotowa�e� ju� formu��, kt�ra przywr�ci URIZIELOWI jego dawn� moc?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Tak, wszystko gotowe. Ale sam nie dasz rady jej u�y�.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Dlaczego nie?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //B�dziesz musia� dotkn�� mieczem �r�d�a mocy magicznej. Dok�adnie w tej samej chwili jaki� mag musi wypowiedzie� formu��.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Zatem musz� sobie poszuka� kogo� do pomocy!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //We� formu�� i przywr�� URIZIEL do jego dawnej �wietno�ci. B�dzie ci wkr�tce potrzebny!
	Info_ClearChoices	(Info_Xardas_FORMULA);
	Info_AddChoice		(Info_Xardas_FORMULA,"Wola�bym �eby to by� miecz jednor�czny...",Info_Xardas_FORMULA_LOVE_1H);
	Info_AddChoice		(Info_Xardas_FORMULA,"Doskonale, natychmiast wyruszam.",Info_Xardas_FORMULA_END);

	B_Story_LoadSword();
};

func void Info_Xardas_FORMULA_LOVE_1H ()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_LOVE_1H_15_01"); //Wola�bym �eby to by� miecz jednor�czny...
	AI_Output		(self, other,"Info_Xardas_FORMULA_LOVE_1H_14_02"); //Hmm? O czym ty m�wisz?!
	AI_Output		(other, self,"Info_Xardas_FORMULA_LOVE_1H_15_03"); //Nie specjalizuj� si� w broni dwur�cznej. To do�� ci�ki miecz. Wola�bym umie� si� nim dobrze pos�ugiwa�, skoro ma mi si� wkr�tce przyda�.
	AI_Output		(self, other,"Info_Xardas_FORMULA_LOVE_1H_14_04"); //C�, to ju� nie moja w tym g�owa. Je�li znalaz�by� jakiego� kowala, kt�ry przeku�by miecz tak, aby nie uszkodzi� klejnotu, nie widz� problemu.
	AI_Output		(self, other,"Info_Xardas_FORMULA_LOVE_1H_14_05"); //Jednak musisz to zrobi� PRZED na�adowaniem URIZIELA.
	B_LogEntry			(CH5_Uriziel,	"Je�li znajd� odpowiedniego kowala, to b�d� m�g� przeku� URIZIEL na miecz jednor�czny. Musz� to zrobi� zanim go na�aduj�.");
	Uriziel1H_possible = true;
};

func void Info_Xardas_FORMULA_END ()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_LOVE_1H_15_01"); //Doskonale, natychmiast wyruszam.
	Info_ClearChoices	(Info_Xardas_FORMULA);
};
//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Jest na to spos�b...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Ale najpierw na�aduj miecz magiczn� energi�. Wr�� jak najszybciej!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Uda�o mi si�! URIZIEL zn�w posiada magiczn� aur�!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02) || Npc_HasItems(hero,URIZIEL_Touch_Full)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Uda�o mi si�! URIZIEL zn�w posiada magiczn� aur�!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Niesamowite! Miecz odzyska� sw� dawn� moc! Dysponujesz teraz nie lada or�em!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige L�sung f�r�s Ich-brauch-Orc-Statue-Massaker ***Bj�rn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Powiedzia�e�, �e b�d� m�g� pos�ugiwa� si� tym mieczem mimo, i� jestem magiem?"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Powiedzia�e�, �e b�d� m�g� pos�ugiwa� si� tym mieczem mimo, i� jestem magiem?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Przyjrzyj si� mu uwa�nie. Zauwa�y�e� zapewne ten du�y, b��kitny klejnot zatopiony w ostrzu.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Ca�a energia magiczna miecza skumulowana jest w�a�nie tutaj.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Je�li usun� klejnot, b�d� m�g� stworzy� magiczn� run� posiadaj�c� wszystkie te cechy, kt�re czyni� URIZIEL tak szczeg�lnym or�em.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Magiczna runa stworzona z URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //W bitwie ta runa b�dzie r�wnie niebezpieczna co sam miecz!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Ale nie zapominaj, �e jedynie mag Sz�stego Kr�gu mo�e zapanowa� nad tak pot�n� magi�!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chc�, �eby� usun�� klejnot z URIZIEL!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02) || Npc_HasItems (hero,	URIZIEL_Touch_Full)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Chc�, �eby� usun�� klejnot z URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Ale nie opanowa�e� jeszcze magii Sz�stego Kr�gu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Od tej decyzji nie ma odwrotu. Jeste� pewien, �e chcesz abym usun�� klejnot?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"TAK, zr�b to!"				,	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"Nie, nie chc�!"	,	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //TAK, zr�b to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Je�li tego w�a�nie chcesz... Prosz�, oto miecz i runa!

	if Npc_HasItems (hero,	Mythrilklinge02) 
	{
	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items �bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	}
	else if Npc_HasItems (hero,	URIZIEL_Touch_Full)
	{
	Npc_RemoveInvItem 	(hero, URIZIEL_Touch_Full);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items �bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, URIZIEL_Touch_Worst);
	};
	B_LogEntry			(CH5_Uriziel,	"Xardas usun�� magiczny kryszta� z URIZIELA. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
	
	
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //Nie, nie chc�!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak sobie �yczysz. Ostrze zachowa sw� magiczn� moc!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& ((Npc_GetTrueGuild (hero) == GIL_KDW) || (Npc_GetTrueGuild (hero) == GIL_GUR))
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Mo�esz mnie czego� nauczy�?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Wprowadz� ci� w Sz�sty Kr�g Magii.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Pami�taj, �e to przywilej zarezerwowany wy��cznie dla najbieglejszych mag�w. Mog� do niego przyst�pi� ci, kt�rych ca�e �ycie jest znakiem.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Twoim znakiem jest zjednoczenie element�w.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Sz�sty Kr�g pozwala ci wykorzystywa� magi� dowolnej runy.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //I nie zapomnij: twoim zadaniem jest s�u�y� pot�dze magii, a nie j� wykorzystywa�.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() �bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f�r Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Jeszcze nie. Jeste� zdolny, ale brak ci niezb�dnego do�wiadczenia. Niech Saturas popracuje nad tob� przez jaki� czas. Wtedy zobaczymy.
		
		AI_StopProcessInfos	( self );
	};
};


//********************************************
//**** DIALOGI ****** XARDASA
//**** LORE ****** BY AHNBAEL
//********************************************

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Xardas_HELLO2 (C_INFO)
{
   npc          = KDF_404_Xardas;
   nr           = 2;
   condition    = DIA_Xardas_HELLO2_Condition;
   information  = DIA_Xardas_HELLO2_Info;
   permanent	= FALSE;
   description	= "Podobno by�e� kiedy� Magiem Ognia.";
};

FUNC INT DIA_Xardas_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Xardas_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Xardas_HELLO2_15_01"); //Podobno by�e� kiedy� Magiem Ognia.
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_02"); //Zgadza si�. Nale�a�em do Najwy�szej Rady w Klasztorze na wyspie Khorinis.
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_03"); //Potem dowodzi�em Magom Ognia uwi�zionym za Barier�.
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_04"); //Moje studia jednak zacz�y wykracza� ponad poziom przeci�tnego Maga Ognia, wi�c porzuci�em Kr�g.
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_05"); //Moje miejsce zaj�� Corristo. Podobno zbrata� si� z Magnatami.
    AI_Output (other, self ,"DIA_Xardas_HELLO2_15_06"); //A co ty s�dzisz o Magnatach?
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_07"); //To skretynia�e oprychy, kt�re nie maj� poj�cia o prawdziwej pot�dze.
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_08"); //My�l�, �e tkwi ona w rudzie.
    AI_Output (self, other ,"DIA_Xardas_HELLO2_03_09"); //Nawet nie wiedz� jak bardzo si� myl�.
 //   AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Xardas_HELLO4 (C_INFO)
{
   npc          = KDF_404_Xardas;
   nr           = 4;
   condition    = DIA_Xardas_HELLO4_Condition;
   information  = DIA_Xardas_HELLO4_Info;
   permanent	= FALSE;
   description	= "Dlaczego osiedli�e� si� na terenach ork�w?";
};

FUNC INT DIA_Xardas_HELLO4_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Xardas_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Xardas_HELLO4_15_01"); //Dlaczego osiedli�e� si� na terenach ork�w?
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_02"); //Tylko tutaj mam pewno��, �e nikt mnie nie znajdzie.
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_03"); //Po moim odej�ciu spodziewa�em si�, �e magowie przy�l� swoich pos�a�c�w.
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_04"); //Nie myli�em si�.
    AI_Output (other, self ,"DIA_Xardas_HELLO4_15_05"); //Co si� zatem z nimi sta�o?
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_06"); //Prawie �aden z nich nie dotar� na g�r�. Moje golemy ich powstrzyma�y. 
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_07"); //Zanim jeszcze osiad�em tutaj, zamieszkiwa�em wie�e na �rodku jeziora.
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_08"); //Pow�d� jednak zmusi�a mnie do przeprowadzki.
    AI_Output (self, other ,"DIA_Xardas_HELLO4_03_09"); //Moi s�udzy z budow� nowej wie�y uwin�li si� bardzo szybko.
 //   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Xardas_HELLO5 (C_INFO)
{
   npc          = KDF_404_Xardas;
   nr           = 5;
   condition    = DIA_Xardas_HELLO5_Condition;
   information  = DIA_Xardas_HELLO5_Info;
   permanent	= FALSE;
   description	= "Kto� jeszcze mieszka na Terytorium Ork�w?";
};

FUNC INT DIA_Xardas_HELLO5_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Xardas_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Xardas_HELLO5_15_01"); //Kto� jeszcze mieszka na Terytorium Ork�w?
    AI_Output (self, other ,"DIA_Xardas_HELLO5_03_02"); //Tak, w jaskini pod moj� wie�� osiedli� si� Uturiel.
    AI_Output (self, other ,"DIA_Xardas_HELLO5_03_03"); //By� jednym z Mag�w Ognia pod moim dow�dztwem. Wygl�da na to, �e nie tylko mi nie spodoba�a si� s�u�ba Magnatom.
    AI_Output (self, other ,"DIA_Xardas_HELLO5_03_04"); //Za Corristo te� on nie przepada, o ile dobrze pami�tam.
  //  AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Xardas_HELLO6 (C_INFO)
{
   npc          = KDF_404_Xardas;
   nr           = 6;
   condition    = DIA_Xardas_HELLO6_Condition;
   information  = DIA_Xardas_HELLO6_Info;
   permanent	= FALSE;
   description	= "Kim s� twoi s�udzy?";
};

FUNC INT DIA_Xardas_HELLO6_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Xardas_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Xardas_HELLO6_15_01"); //Kim s� twoi s�udzy?
    AI_Output (self, other ,"DIA_Xardas_HELLO6_03_02"); //To istoty. kt�re samodzielnie przywo�uj� z kr�lestwa Beliara.
    AI_Output (self, other ,"DIA_Xardas_HELLO6_03_03"); //Wszelkiego rodzaju demony i nieumarli.
    AI_Output (self, other ,"DIA_Xardas_HELLO6_03_04"); //Jak widzisz, nie bez powodu jestem nazywany Nekromant�. 
 //   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO7
//========================================

INSTANCE DIA_Xardas_HELLO7 (C_INFO)
{
   npc          = KDF_404_Xardas;
   nr           = 7;
   condition    = DIA_Xardas_HELLO7_Condition;
   information  = DIA_Xardas_HELLO7_Info;
   permanent	= FALSE;
   description	= "Czy mog� zosta� Nekromant�?";
};

FUNC INT DIA_Xardas_HELLO7_Condition()
{
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE )!= 6) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Xardas_HELLO7_Info()
{
    AI_Output (other, self ,"DIA_Xardas_HELLO7_15_01"); //Czy mog� zosta� Nekromant�?
    AI_Output (self, other ,"DIA_Xardas_HELLO7_03_02"); //Nie. Sztuka nekromancji zarezerwowana jest tylko dla mag�w Sz�stego Kr�gu.
    AI_Output (self, other ,"DIA_Xardas_HELLO7_03_03"); //Przed tob� daleka droga, je�li chcesz posi��� t� sztuk�.
    AI_Output (self, other ,"DIA_Xardas_HELLO7_03_04"); //Ani Corristo, ani Saturasowi nigdy si� to nie uda�o.
   // AI_StopProcessInfos	(self);
};

