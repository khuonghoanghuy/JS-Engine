package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class WarmState extends MusicBeatState
{
	var text:FlxText;

	override function create()
	{
		if (FlxG.save.data.firstPlay == null)
			FlxG.save.data.firstPlay = true;

		text = new FlxText(0, 0, 0, "!THIS ENGINE IS JUST ON A ALPHA ENGINE!
            \n\nOn might, this engine is not finish yet!
            \nCurrent on Development
            \n!Anything on the Future will be change!
            \nPress Enter key to play", 32);
		text.screenCenter();
		text.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		add(text);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.save.data.firstPlay = false)
		{
			FlxG.switchState(new TitleState());
		}
		else
		{
			if (FlxG.keys.justPressed.ENTER)
			{
				if (FlxG.random.bool(30.9) && !FlxG.save.data.flashCamera)
					FlxG.camera.flash(FlxColor.YELLOW, 1);
				else if (!FlxG.save.data.flashCamera)
					FlxG.camera.flash(FlxColor.WHITE, 1);
				else
				{
				}

				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				text.visible = false;

				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					FlxG.save.data.firstPlay = false;
					FlxG.switchState(new TitleState());
				});
			}
		}
	}
}
