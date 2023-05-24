package;

import flixel.FlxG;

class JSEngineData
{
	/**
	 * Do a init task, load all default setting for player
	 * 
	 * this function only for first play or was reset all data!
	 */
	public static function init(typeLoad:String = "default")
	{
		switch (typeLoad)
		{
			case "default":
				ghosttapInit();
				downscrollInit();
				accuracyInit();
				accuracyTypeInit();
				noteSplashesInit();
				botplayInit();
				watermarkInit();
				fpsCapInit();
				directfpsCapInit();
				hidegfInit();
				oneStageInit();
				qualityInit();
				judgenmentInit();
				flashCameraInit();
				timeBarInit();
				allowWriteInit();
				shadersUnuseInit();

			case "base":
				ghosttapInit();
				downscrollInit();
				accuracyInit();
				watermarkInit();

			case "limit":
				ghosttapInit();
				downscrollInit();

			case "none":
				trace('nothing to load');

			default:
				ghosttapInit();
				downscrollInit();
				accuracyInit();
				accuracyTypeInit();
				noteSplashesInit();
				botplayInit();
				watermarkInit();
				fpsCapInit();
				directfpsCapInit();
				hidegfInit();
				oneStageInit();
				qualityInit();
				judgenmentInit();
				flashCameraInit();
				timeBarInit();
				allowWriteInit();
				shadersUnuseInit();
		}

		trace('load as type: ' + typeLoad);
		FlxG.save.flush();
		FlxG.save.bind('jsEngine', 'huy1234th');
	}

	// why i do this
	public static function ghosttapInit()
	{
		if (FlxG.save.data.ghosttap == null)
			FlxG.save.data.ghosttap = true;
	}

	public static function downscrollInit()
	{
		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;
	}

	public static function accuracyInit()
	{
		if (FlxG.save.data.accuracy == null)
			FlxG.save.data.accuracy = true;
	}

	public static function accuracyTypeInit()
	{
		if (FlxG.save.data.accuracyType == null)
			FlxG.save.data.accuracyType = false;
	}

	public static function noteSplashesInit()
	{
		if (FlxG.save.data.noteSplashes == null)
			FlxG.save.data.noteSplashes = true;
	}

	public static function botplayInit()
	{
		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;
	}

	public static function watermarkInit()
	{
		if (FlxG.save.data.watermark == null)
			FlxG.save.data.watermark = false;
	}

	public static function fpsCapInit()
	{
		if (FlxG.save.data.fpsCap == null)
			FlxG.save.data.fpsCap = 0;
	}

	public static function directfpsCapInit()
	{
		if (FlxG.save.data.directfpsCap == null)
			FlxG.save.data.directfpsCap = false;
	}

	public static function hidegfInit()
	{
		if (FlxG.save.data.hidegf == null)
			FlxG.save.data.hidegf = false;
	}

	public static function oneStageInit()
	{
		if (FlxG.save.data.oneStage == null)
			FlxG.save.data.oneStage = false;
	}

	public static function qualityInit()
	{
		if (FlxG.save.data.quality == null)
			FlxG.save.data.quality = false;
	}

	public static function judgenmentInit()
	{
		if (FlxG.save.data.judgenment == null)
			FlxG.save.data.judgenment = false;
	}

	public static function flashCameraInit()
	{
		if (FlxG.save.data.flashCamera == null)
			FlxG.save.data.flashCamera = true;
	}

	public static function timeBarInit()
	{
		if (FlxG.save.data.timeBar == null)
			FlxG.save.data.timeBar = false;
	}

	public static function allowWriteInit()
	{
		if (FlxG.save.data.allowWrite == null)
			FlxG.save.data.allowWrite = false;
	}

	public static function shadersUnuseInit()
	{
		if (FlxG.save.data.shadersUnuse == null)
			FlxG.save.data.shadersUnuse = false;
	}
}
