package;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.addons.text.FlxTypeText;

class BlackState extends MusicBeatState
{
    var typeText:FlxTypeText;
    public static var inTer:Bool = false;

    override function create() 
    {
        inTer = true;

        typeText = new FlxTypeText(0, 0, 0, "", 16);
        typeText.prefix = "JS ENGINE > ";
        typeText.skipKeys = ["SPACE"];
        add(typeText);

        super.create();

        FlxG.sound.pause();
    }    

	override function update(elapsed:Float)
    {
        super.update(elapsed);

        typeText.text = "COMPLETE EARSE DATA";
        new FlxTimer().start(1, function(tmr:FlxTimer){
            typeText.text = "RESTARTING GAME...";
            FlxG.switchState(new TitleState());
        });
    }
}