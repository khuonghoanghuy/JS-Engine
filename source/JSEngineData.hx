package;

import flixel.FlxG;

class JSEngineData
{
	public static function init()
	{
		if (FlxG.save.data.ghosttap == null)
			FlxG.save.data.ghosttap = true;

		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.accuracy == null)
			FlxG.save.data.accuracy = true;

		if (FlxG.save.data.accuracyType == null)
			FlxG.save.data.accuracyType = false;

		if (FlxG.save.data.noteSplashes == null)
			FlxG.save.data.noteSplashes = true;

		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.watermark == null)
			FlxG.save.data.watermark = false;

		if (FlxG.save.data.fpsCap == null)
			FlxG.save.data.fpsCap = 0;

		if (FlxG.save.data.directfpsCap == null)
			FlxG.save.data.directfpsCap = false;

		if (FlxG.save.data.hidegf == null)
			FlxG.save.data.hidegf = false;

		if (FlxG.save.data.oneStage == null)
			FlxG.save.data.oneStage = false;

		if (FlxG.save.data.quality == null)
			FlxG.save.data.quality = false;

		if (FlxG.save.data.judgenment == null)
			FlxG.save.data.judgenment = false;

		if (FlxG.save.data.flashCamera == null)
			FlxG.save.data.flashCamera = true;

		if (FlxG.save.data.timeBar == null)
			FlxG.save.data.timeBar = false;

		if (FlxG.save.data.allowWrite == null)
			FlxG.save.data.allowWrite = false;
	}
}
