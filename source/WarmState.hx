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
        text = new FlxText(0, 0, 0, "", 16);
        text.screenCenter();
        text.alignment = CENTER;
        add(text);

        super.create();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        text.text = "!THIS ENGINE IS JUST ON A ALPHA ENGINE!\n\nOn might, this engine is not finish yet!\nCurrent on Development\n!Anything on the Future will be change\nPress Any key to play";

        if (FlxG.keys.justPressed.ANY){
            bool(true);
        }else{
            bool(false);
        }
    
        if (bool(true))
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
        else
        {
            text.text = "Error press key\nPlease reinstall game!";
        }
    }
}