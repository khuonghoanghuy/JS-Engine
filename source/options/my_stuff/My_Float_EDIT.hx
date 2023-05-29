package options.my_stuff;

import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import var_game.My_Float.GET_GITAROO;
import var_game.My_Float.RANDOM;

class My_Float_EDIT extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = ["Cant restart game", "Get Gitaroo State"];

	var optionsCheck:FlxText;
	var optionsDesc:FlxText;

	private var grpControls:FlxTypedGroup<Alphabet>;

	var earseOptions:FlxText;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...controlsStrings.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
			// controlLabel.isMenuItem = true;
			controlLabel.isCenterItem = true;
			controlLabel.targetY = i;
			grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		optionsDesc = new FlxText(10, FlxG.height - 44, 0, "", 18);
		optionsDesc.scrollFactor.set();
		optionsDesc.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(optionsDesc);

		optionsCheck = new FlxText(10, FlxG.height - 22, 0, "", 18);
		optionsCheck.scrollFactor.set();
		optionsCheck.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(optionsCheck);

		/*earseOptions = new FlxText(10, 10, 0, "Press R to reset data!", 16);
			earseOptions.scrollFactor.set();
			earseOptions.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			add(earseOptions); */

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		/*if (FlxG.keys.justPressed.R)
			{
				FlxG.save.erase();
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				FlxG.switchState(new BlackState());
				// FlxG.resetGame();
		}*/
		/*if (controls.ACCEPT)
			{
				switch(controlsStrings[curSelected])
				{

				}
		}*/

		if (controls.LEFT)
		{
			switch (controlsStrings[curSelected])
			{
				case "Cant restart game":
					if (RANDOM == -0.1)
					{
						RANDOM -= 0;
					}
					else
					{
						RANDOM -= 0.1;
					}
					optionsCheck.text = "" + RANDOM;

				case "Get Gitaroo State":
					if (GET_GITAROO == -0.1)
					{
						GET_GITAROO -= 0;
					}
					else
					{
						GET_GITAROO -= 0.1;
					}
					optionsCheck.text = "" + GET_GITAROO;
			}
		}

		if (controls.RIGHT)
		{
			switch (controlsStrings[curSelected])
			{
				case "Cant restart game":
					if (RANDOM == 100)
					{
						RANDOM += 0;
					}
					else
					{
						RANDOM += 0.1;
					}
					optionsCheck.text = "" + RANDOM;

				case "Get Gitaroo State":
					if (GET_GITAROO == 100)
					{
						GET_GITAROO += 0;
					}
					else
					{
						GET_GITAROO += 0.1;
					}
					optionsCheck.text = "" + GET_GITAROO;
			}
		}

		if (controls.BACK)
		{
			FlxG.save.flush();
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.save.bind('jsEngine', 'huy1234th');
			FlxG.switchState(new options.OptionsMenu());
		}

		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		switch (controlsStrings[curSelected])
		{
			case "Cant restart game":
				optionsDesc.text = "Change a float number for getting 'cant restart game'";
				optionsCheck.text = "" + RANDOM;

			case "Get Gitaroo State":
				optionsDesc.text = "Change a float number for getting 'get gitaroo state'";
				optionsCheck.text = "" + GET_GITAROO;
		}

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}
