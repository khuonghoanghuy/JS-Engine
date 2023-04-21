package;

import flixel.util.FlxTimer;
import flixel.text.FlxText;
import lime.utils.Assets;
import flixel.FlxG;

class StartLoading extends MusicBeatState
{
    var text:FlxText;

    var songs:Array<String> = [
        'Tutorial',
        'Bopeebo', 'Fresh', 'Dadbattle',
        'Spookeez', 'South', "Monster",
        'Pico', 'Philly', "Blammed",
        'Satin-Panties', "High", "Milf",
        'Cocoa', 'Eggnog', 'Winter-Horrorland',
        'Senpai', 'Roses', 'Thorns'
    ];

    var characters:Array<String> = [
        'BOYFRIEND', 
        'DADDY_DEAREST', 
        'GF_assets'
    ];

    var done:Bool = false;

    override function create() 
    {
        super.create();  

        done = false;
        
        text = new FlxText(0, 0, 0, "- [Caching Assets] -", 32);
        text.scrollFactor.set();
        text.screenCenter();
        add(text);

        startCache(done);
        bool(true);
    }

    override function update(elapsed:Float)
	{
        super.update(elapsed);

        if (!done)
        {
            startCache(bool(true));
            text.text = "- [Caching Assets] -";
        }
        else
        {
            startCache(bool(false));
            text.text = "- [Done] -";

            new FlxTimer().start(1, function (tmr:FlxTimer) {
                FlxG.switchState(new TitleState()); 
            });
        }
    }

    function startCache(cache:Bool = false) 
    {
        if (cache)
        {
            beginCache(bool(true));
        }
        else
        {
            beginCache(bool(false));
        }
    }

    function beginCache(bool:Bool) 
    {
        if (bool)
        {

        }
    }
}