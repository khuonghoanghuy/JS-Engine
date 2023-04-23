package;

import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class WarmState extends MusicBeatState
{
    var text:FlxText;

    override function create()
    {
        text = new FlxText(0, 0, 0, "", 32);
        // text.screenCenter();
        text.scrollFactor.set();
        text.setFormat(Paths.font("vcr.tff"), 32, FlxColor.WHITE, CENTER);
        add(text);

        super.create();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        text.text = "!THIS ENGINE IS JUST ON A ALPHA ENGINE!\n\nOn might, this engine is not finish yet!\nCurrent on Development\n!Anything on the Future will be change\nPress Enter key to play";

        if (FlxG.keys.justPressed.ENTER)
        {
			if (FlxG.random.bool(50))
				FlxG.camera.flash(FlxColor.YELLOW, 1);
			else
				FlxG.camera.flash(FlxColor.WHITE, 1);
            
            FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
            
            new FlxTimer().start(2, function(tmr:FlxTimer){
                FlxG.switchState(new TitleState());
            });
        }
    }
}