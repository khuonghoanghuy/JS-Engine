package;

import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [
		"Ghost tap",
		"Downscroll",
		"Accuracy",
		"Watermark",
		"FPS Cap",
		"Hide GF",
		"Only One Stage"
	];

	var optionsCheck:FlxText;
	var optionsDesc:FlxText;

	private var grpControls:FlxTypedGroup<Alphabet>;

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
			controlLabel.isMenuItem = true;
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

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			switch(controlsStrings[curSelected])
			{
				case "Ghost tap":
					FlxG.save.data.ghosttap = !FlxG.save.data.ghosttap;
					optionsCheck.text = FlxG.save.data.ghosttap ? "On" : "Off";
					FlxG.save.data.ghosttap = FlxG.save.data.ghosttap;

				case "Downscroll":
					FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
					optionsCheck.text = FlxG.save.data.downscroll ? "On" : "Off";
					FlxG.save.data.downscroll = FlxG.save.data.downscroll;

				case "Accuracy":
					FlxG.save.data.accuracy = !FlxG.save.data.accuracy;
					optionsCheck.text = FlxG.save.data.accuracy ? "On" : "Off";
					FlxG.save.data.accuracy = FlxG.save.data.accuracy;

				case "Watermark":
					FlxG.save.data.watermark = !FlxG.save.data.watermark;
					optionsCheck.text = FlxG.save.data.watermark ? "On" : "Off";
					FlxG.save.data.watermark = FlxG.save.data.watermark;

				case "FPS Cap":
					FlxG.save.data.fpsCap = !FlxG.save.data.fpsCap;
					optionsCheck.text = FlxG.save.data.fpsCap ? "At 75" : "At 60";
					FlxG.save.data.fpsCap = FlxG.save.data.fpsCap;

				case "Hide GF":
					FlxG.save.data.hidegf = !FlxG.save.data.hidegf;
					optionsCheck.text = FlxG.save.data.hidegf ? "On" : "Off";
					FlxG.save.data.hidegf = FlxG.save.data.hidegf;

				case "Only One Stage":
					FlxG.save.data.oneStage = !FlxG.save.data.oneStage;
					optionsCheck.text = FlxG.save.data.oneStage ? "On" : "Off";
					FlxG.save.data.oneStage = FlxG.save.data.oneStage;
			}
		}

		if (controls.BACK)
		{
			FlxG.save.flush();
			FlxG.save.bind('jsEngine', 'huy1234th');
			FlxG.switchState(new MainMenuState());
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

		switch(controlsStrings[curSelected])
		{
			case "Ghost tap":
				optionsDesc.text = "Make the game more easier!";
				optionsCheck.text = FlxG.save.data.ghosttap ? "On" : "Off";

			case "Downscroll":
				optionsDesc.text = "Change layout from upscroll to downscroll";
				optionsCheck.text = FlxG.save.data.downscroll ? "On" : "Off";

			case "Accuracy":
				optionsDesc.text = "Add alot info like Misses and Accuracy";
				optionsCheck.text = FlxG.save.data.accuracy ? "On" : "Off";

			case "Watermark":
				optionsDesc.text = "Display JS Engine Text on the screen";
				optionsCheck.text = FlxG.save.data.watermark ? "On" : "Off";

			case "FPS Cap":
				optionsDesc.text = "Change FPS Cap, make the game more faster. But not recommended for Low Computer";
				optionsCheck.text = FlxG.save.data.fpsCap ? "At 75" : "At 60";

			case "Hide GF":
				optionsDesc.text = "Hide GF when playing a song, that can make the game load more faster";
				optionsCheck.text = FlxG.save.data.hidegf ? "On" : "Off";
		
			case "Only One Stage":
				optionsDesc.text = "Will be change only load first stage game, maybe can make the game load more faster";
				optionsCheck.text = FlxG.save.data.oneStage ? "On" : "Off";
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
