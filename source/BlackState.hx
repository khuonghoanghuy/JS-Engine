package;

import flixel.FlxG;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import var_game.My_Float.RANDOM;

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
		if (FlxG.random.bool(RANDOM)) // when you was unlucky to much!
		{
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				typeText.text = "GAME CANNOT RESTART!, PLEASE RESTART GAME BY YOURSELF!";
				// FlxG.switchState(new TerState());
			});
		}
		else // almost you was lucky
		{
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				typeText.text = "RESTARTING GAME...";
				FlxG.switchState(new TitleState());
			});
		}
	}
}

class TerState extends MusicBeatState
{
	var ter:FlxTypeText;
	var typing:FlxInputText;
	var inType:FlxText;

	override function create()
	{
		super.create();

		ter = new FlxTypeText(0, 0, 0, "", 16);
		ter.prefix = "JS ENGINE > ";
		ter.skipKeys = ["SPACE"];
		ter.text = inType.text;
		add(ter);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ANY)
			typing.text = inType.text;

		/*if (controls.ACCEPT)
			{
				switch (inType.text)
				{
					case "reset":
						FlxG.resetGame();

					case "version":
						inType.text = Options.ver;
				}
		}*/

		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}

		ter.update(elapsed);
	}
}
