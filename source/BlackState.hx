package;

import flixel.FlxG;

class BlackState extends MusicBeatState
{
    override function create() 
    {
        super.create();    

        FlxG.sound.pause();
        FlxG.switchState(new TitleState());
    }    

	override function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}