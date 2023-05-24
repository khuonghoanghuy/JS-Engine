package options;

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

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [
		#if debug
		"Edit My Float",
		#end
		"Ghost tap",
		"Downscroll",
		"Accuracy Display",
		"Accuracy Type",
		"Note Splash",
		"Botplay",
		"Watermark",
		"Judgement Counter",
		"Time Bar",
		#if desktop
		"FPS Cap", "Direct FPS Cap Key",
		#end
		"Hide GF",
		"Only One Stage",
		"Quality",
		"Disable Flash Camera",
		#if desktop
		"Allow Writing Info",
		#end
		"Run Shaders Unuse",
		"Clear Up Memory"
	];

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

		optionsDesc = new FlxText(10, FlxG.height - 22, 0, "", 18);
		optionsDesc.scrollFactor.set();
		optionsDesc.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(optionsDesc);

		optionsCheck = new FlxText(10, FlxG.height - 44, 0, "", 18);
		optionsCheck.scrollFactor.set();
		optionsCheck.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(optionsCheck);

		earseOptions = new FlxText(10, 10, 0, "Press R to reset data!", 16);
		earseOptions.scrollFactor.set();
		earseOptions.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(earseOptions);

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.save.erase();
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.switchState(new BlackState());
			// FlxG.resetGame();
		}

		switch (controlsStrings[curSelected])
		{
			case "FPS Cap":
				switch (FlxG.save.data.fpsCap)
				{
					case 0:
						optionsCheck.text = "At 60";

					case 1:
						optionsCheck.text = "At 75";

					case 2:
						optionsCheck.text = "At 120";

					case 3:
						optionsCheck.text = "At 140";
				}

			case "Accuracy Type":
				if (FlxG.save.data.accuracyType)
				{
					optionsDesc.text = "You just press the note";
				}
				else
				{
					optionsDesc.text = "Have bit harder than the simple one! (Beta stuff, may can be broken!)";
				}
		}

		if (controls.ACCEPT)
		{
			switch (controlsStrings[curSelected])
			{
				#if debug
				case "Edit My Float":
					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new options.my_stuff.My_Float_EDIT());
				#end
				case "Ghost tap":
					FlxG.save.data.ghosttap = !FlxG.save.data.ghosttap;
					optionsCheck.text = FlxG.save.data.ghosttap ? "On" : "Off";
					FlxG.save.data.ghosttap = FlxG.save.data.ghosttap;

				case "Downscroll":
					FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
					optionsCheck.text = FlxG.save.data.downscroll ? "On" : "Off";
					FlxG.save.data.downscroll = FlxG.save.data.downscroll;

				case "Accuracy Display":
					FlxG.save.data.accuracy = !FlxG.save.data.accuracy;
					optionsCheck.text = FlxG.save.data.accuracy ? "On" : "Off";
					FlxG.save.data.accuracy = FlxG.save.data.accuracy;

				case "Accuracy Type":
					if (FlxG.save.data.accuracyType)
					{
						optionsDesc.text = "You just press the note";
					}
					else
					{
						optionsDesc.text = "Have bit harder than the simple one! (Beta stuff, may can be broken!)";
					}
					FlxG.save.data.accuracyType = !FlxG.save.data.accuracyType;
					optionsCheck.text = FlxG.save.data.accuracyType ? "As Simple" : "As Complex";
					FlxG.save.data.accuracyType = FlxG.save.data.accuracyType;

				case "Note Splash":
					FlxG.save.data.noteSplashes = !FlxG.save.data.noteSplashes;
					optionsCheck.text = FlxG.save.data.noteSplashes ? "On" : "Off";
					FlxG.save.data.noteSplashes = FlxG.save.data.noteSplashes;

				case "Botplay":
					FlxG.save.data.botplay = !FlxG.save.data.botplay;
					optionsCheck.text = FlxG.save.data.botplay ? "On" : "Off";
					FlxG.save.data.botplay = FlxG.save.data.botplay;

				case "Watermark":
					FlxG.save.data.watermark = !FlxG.save.data.watermark;
					optionsCheck.text = FlxG.save.data.watermark ? "On" : "Off";
					FlxG.save.data.watermark = FlxG.save.data.watermark;

				#if desktop
				case "FPS Cap":
					if (FlxG.save.data.fpsCap >= 3)
					{
						FlxG.save.data.fpsCap -= 3;
					}
					else
					{
						FlxG.save.data.fpsCap += 1;
					}

					switch (FlxG.save.data.fpsCap)
					{
						case 0:
							optionsCheck.text = "At 60";

						case 1:
							optionsCheck.text = "At 75";

						case 2:
							optionsCheck.text = "At 120";

						case 3:
							optionsCheck.text = "At 140";
					}

				case "Direct FPS Cap Key":
					FlxG.save.data.directfpsCap = !FlxG.save.data.directfpsCap;
					optionsCheck.text = FlxG.save.data.directfpsCap ? "On" : "Off";
					FlxG.save.data.directfpsCap = FlxG.save.data.directfpsCap;
				#end

				case "Hide GF":
					FlxG.save.data.hidegf = !FlxG.save.data.hidegf;
					optionsCheck.text = FlxG.save.data.hidegf ? "On" : "Off";
					FlxG.save.data.hidegf = FlxG.save.data.hidegf;

				case "Only One Stage":
					FlxG.save.data.oneStage = !FlxG.save.data.oneStage;
					optionsCheck.text = FlxG.save.data.oneStage ? "On" : "Off";
					FlxG.save.data.oneStage = FlxG.save.data.oneStage;

				case "Quality":
					FlxG.save.data.quality = !FlxG.save.data.quality;
					optionsCheck.text = FlxG.save.data.quality ? "As Low" : "As High";
					FlxG.save.data.quality = FlxG.save.data.quality;

				case "Judgement Counter":
					FlxG.save.data.judgenment = !FlxG.save.data.judgenment;
					optionsCheck.text = FlxG.save.data.judgenment ? "On" : "Off";
					FlxG.save.data.judgenment = FlxG.save.data.judgenment;

				case "Time Bar":
					FlxG.save.data.timeBar = !FlxG.save.data.timeBar;
					optionsCheck.text = FlxG.save.data.timeBar ? "On" : "Off";
					FlxG.save.data.timeBar = FlxG.save.data.timeBar;

				case "Disable Flash Camera":
					FlxG.save.data.flashCamera = !FlxG.save.data.flashCamera;
					optionsCheck.text = FlxG.save.data.flashCamera ? "On" : "Off";
					FlxG.save.data.flashCamera = FlxG.save.data.flashCamera;

				#if desktop
				case "Allow Writing Info":
					FlxG.save.data.allowWrite = !FlxG.save.data.allowWrite;
					optionsCheck.text = FlxG.save.data.allowWrite ? "On" : "Off";
					FlxG.save.data.allowWrite = FlxG.save.data.allowWrite;
				#end

				case "Run Shaders Unuse":
					FlxG.save.data.shadersUnuse = !FlxG.save.data.shadersUnuse;
					optionsCheck.text = FlxG.save.data.shadersUnuse ? "On" : "Off";
					FlxG.save.data.shadersUnuse = FlxG.save.data.shadersUnuse;

				case "Clear Up Memory":
					FlxG.save.destroy();
			}

			FlxG.save.flush();
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

		switch (controlsStrings[curSelected])
		{
			#if debug
			case "Edit My Float":
				optionsDesc.text = "DEBUG OPTIONS - Edit some float for the game";
				optionsCheck.text = "This Options has no disable or enable system";
			#end

			case "Ghost tap":
				optionsDesc.text = "Make the game more easier!";
				optionsCheck.text = FlxG.save.data.ghosttap ? "On" : "Off";

			case "Downscroll":
				optionsDesc.text = "Change layout from upscroll to downscroll";
				optionsCheck.text = FlxG.save.data.downscroll ? "On" : "Off";

			case "Accuracy Display":
				optionsDesc.text = "Add alot info like Misses and Accuracy";
				optionsCheck.text = FlxG.save.data.accuracy ? "On" : "Off";

			case "Accuracy Type":
				if (FlxG.save.data.accuracyType)
				{
					optionsDesc.text = "You just press the note";
				}
				else
				{
					optionsDesc.text = "Have bit harder than the simple one! (Beta stuff, may can be broken!)";
				}
				optionsCheck.text = FlxG.save.data.accuracyType ? "As Simple" : "As Complex";

			case "Note Splash":
				optionsDesc.text = "When hit sick combo, splash animation will be play";
				optionsCheck.text = FlxG.save.data.noteSplashes ? "On" : "Off";

			case "Botplay":
				optionsDesc.text = "Can help you showcase the chart";
				optionsCheck.text = FlxG.save.data.botplay ? "On" : "Off";

			case "Watermark":
				optionsDesc.text = "Display JS Engine Text on the screen";
				optionsCheck.text = FlxG.save.data.watermark ? "On" : "Off";

			#if desktop
			case "FPS Cap":
				optionsDesc.text = "Change FPS Cap, make the game more faster. But not recommended for Low Computer";
				switch (FlxG.save.data.fpsCap)
				{
					case 0:
						optionsCheck.text = "At 60";

					case 1:
						optionsCheck.text = "At 75";

					case 2:
						optionsCheck.text = "At 120";

					case 3:
						optionsCheck.text = "At 140";
				}

			case "Direct FPS Cap Key":
				optionsDesc.text = "Allow or Dont Allow direct changing fps cap while playing!";
				optionsCheck.text = FlxG.save.data.directfpsCap ? "On" : "Off";
			#end

			case "Hide GF":
				optionsDesc.text = "Hide GF when playing a song, that can make the game load more faster";
				optionsCheck.text = FlxG.save.data.hidegf ? "On" : "Off";

			case "Only One Stage":
				optionsDesc.text = "Will be change only load first stage game, maybe can make the game load more faster";
				optionsCheck.text = FlxG.save.data.oneStage ? "On" : "Off";

			case "Quality":
				optionsDesc.text = "Hide some PNG on the game, can make the game load more faster";
				optionsCheck.text = FlxG.save.data.quality ? "As Low" : "As High";

			case "Judgement Counter":
				optionsDesc.text = "Display 'Sick', 'Good', 'Bad', 'Shit' on the game";
				optionsCheck.text = FlxG.save.data.judgenment ? "On" : "Off";

			case "Disable Flash Camera":
				optionsDesc.text = "Turn off or on the flash camera light on the game";
				optionsCheck.text = FlxG.save.data.flashCamera ? "On" : "Off";

			case "Time Bar":
				optionsDesc.text = "Show you the current time in the game";
				optionsCheck.text = FlxG.save.data.timeBar ? "On" : "Off";

			#if desktop
			case "Allow Writing Info":
				optionsDesc.text = "Game will write a json file about all your info when you win a song";
				optionsCheck.text = FlxG.save.data.allowWrite ? "On" : "Off";
			#end

			case "Run Shaders Unuse":
				optionsDesc.text = "Enable run shaders background (only in Thorns Song!, Also dont enable this or you dont want to cringe about this!)";
				optionsCheck.text = FlxG.save.data.shadersUnuse ? "On" : "Off";

			case "Clear Up Memory":
				optionsDesc.text = "Clear Some memory";
				optionsCheck.text = "This Options has no have save data!";
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
