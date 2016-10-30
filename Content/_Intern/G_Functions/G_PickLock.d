/************************************************************************* 
 * 							 G_PickLock
 *************************************************************************
 * PRCONDITIONS: 	self	: Player
 *************************************************************************/
func void G_PickLock( var int bSuccess, var int bBrokenOpen  )
{
	var string	strSoundFX;
	var string	strMessage;
	var int		strYPos;
	
	strSoundFX = _STR_INVALID;
	strMessage = _STR_INVALID;
	
	
	
	//if ( bSuccess)
	//{
	//print 
	//}
	
	if ( !bSuccess)
	{
	if ( bBrokenOpen )
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_BROKEN;
			strMessage	= _STR_MESSAGE_PICKLOCK_BROKEN;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_BROKEN;
			print ("Wytrych pêk³.");
			//Snd_Play ("SVM_15_PickBroke.wav");
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_FAILURE;
			strMessage	= _STR_MESSAGE_PICKLOCK_FAILURE;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_FAILURE;
			print ("Cholera... nie tak!");
			//Snd_Play ("SVM_15_DoesntWork.wav");
		};
	}
	else
	{
	if ( bBrokenOpen )
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_UNLOCK;
			strMessage	= _STR_MESSAGE_PICKLOCK_UNLOCK;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_UNLOCK;
			print ("Uda³o siê!");
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_SUCCESS;
			strMessage	= _STR_MESSAGE_PICKLOCK_SUCCESS;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_SUCCESS;
			print ("Dobrze ci idzie.");
		};
	
	};
	/*
	if ( bSuccess)
	{
		//if ( bBrokenOpen )
		//{
			strSoundFX	= _STR_SOUND_PICKLOCK_UNLOCK;
			strMessage	= _STR_MESSAGE_PICKLOCK_UNLOCK;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_UNLOCK;
			//print ("Wygryw");
		//}
		//else
		//{
			//strSoundFX	= _STR_SOUND_PICKLOCK_SUCCESS;
			//strMessage	= _STR_MESSAGE_PICKLOCK_SUCCESS;
			//strYPos		= _YPOS_MESSAGE_PICKLOCK_SUCCESS;
			//print ("Jest OK");
		//};
	}
	else
	{
		if ( bBrokenOpen )
		{
			//strSoundFX	= _STR_SOUND_PICKLOCK_BROKEN;
			//strMessage	= _STR_MESSAGE_PICKLOCK_BROKEN;
			//strYPos		= _YPOS_MESSAGE_PICKLOCK_BROKEN;
			//print ("Wytrych pêk³");
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_FAILURE;
			strMessage	= _STR_MESSAGE_PICKLOCK_FAILURE;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_FAILURE;
			//print ("Cholera...nie tak!");
		};
	};
	*/
	//
	//	PLAY APPROPRIATE SOUND
	//
	Snd_Play3d( self, strSoundFX );
	
	//
	//	PRINT THE MESSAGE
	//
	//PrintScreen	(strMessage, -1, -1, "FONT_OLD_20_WHITE.TGA", 5 );		
	print ("---------------------------");
	//PrintS_Ext  (strMessage, COL_White);
	//Print_Ext (-1, strYPos, strMessage, _STR_FONT_ONSCREEN, COL_White, _TIME_MESSAGE_PICKLOCK);
	
};
/*
func int G_PickLockRequired()
{
    if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK))
    {
    return true;    
    }
    else
    {
    AI_PlayAni (hero,"T_DONTKNOW");    
    G_PrintScreen ("Nie znam siê na otwieraniu zamków.");
	PrintS_Ext ("Brakuje umiejêtnoœci otwierania zamków.", COL_Red);
    return false;    
    };    
};


func void Mod_Splash_CoontainerLocker ()
{
var oCNpc her; her = Hlp_GetNpc (her);

if (Hlp_Is_oCMobContainer (her.focus_vob))
{
var oCMobContainer chest; chest = _^ (her.focus_vob);
chest._oCMobInter_conditionFunc = "G_PICKLOCKREQUIRED";
print ("Patrzê na chest");
}
else if (Hlp_Is_oCMobDoor (her.focus_vob))
{
var oCMobDoor door; door = _^ (her.focus_vob);
door._oCMobInter_conditionFunc = "G_PICKLOCKREQUIRED";
};
};*/
