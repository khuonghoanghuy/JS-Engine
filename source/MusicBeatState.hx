package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import polymod.Polymod;
#if debug
import flixel.addons.studio.FlxStudio;
#end

class MusicBeatState extends FlxUIState
{
	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;
	private var controls(get, never):Controls;

	/**
	 * Get Controls on player 1
	 */
	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	inline function loadData()
	{
		PlayerSettings.init();
		FlxG.save.bind('jsEngine', 'huy1234th');
		// FlxG.save.close(0);

		Highscore.load();
		FlxG.sound.cacheAll();

		JSEngineData.init();
	}

	override function create()
	{
		if (transIn != null)
			trace('reg ' + transIn.region);

		super.create();

		Polymod.init({
			modRoot: "mods_folder/",
			dirs: ["mods_folder"]
		});

		loadData();

		#if debug
		FlxStudio.create();
		#end
	}

	override function update(elapsed:Float)
	{
		// everyStep();
		var oldStep:Int = curStep;

		#if desktop
		if (FlxG.save.data.directfpsCap)
		{
			if (FlxG.keys.justPressed.F11)
			{
				if (FlxG.save.data.fpsCap <= 240)
				{
					FlxG.save.data.fpsCap += 0;
				}
				else
				{
					FlxG.save.data.fpsCap += 10;
				}
			}

			if (FlxG.keys.justPressed.F10)
			{
				if (FlxG.save.data.fpsCap >= 60)
				{
					FlxG.save.data.fpsCap -= 0;
				}
				else
				{
					FlxG.save.data.fpsCap -= 10;
				}
			}
		}
		#end

		updateCurStep();
		updateBeat();

		if (oldStep != curStep && curStep > 0)
			stepHit();

		super.update(elapsed);

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
			FlxG.save.flush();
			FlxG.save.bind('jsEngine', 'huy1234th');
		}
	}

	/**
	 * update beat in playstate
	 */
	private function updateBeat():Void
	{
		curBeat = Math.floor(curStep / 4);
	}

	/**
	 * update cur step in playstate
	 */
	private function updateCurStep():Void
	{
		var lastChange:BPMChangeEvent = {
			stepTime: 0,
			songTime: 0,
			bpm: 0
		}
		for (i in 0...Conductor.bpmChangeMap.length)
		{
			if (Conductor.songPosition >= Conductor.bpmChangeMap[i].songTime)
				lastChange = Conductor.bpmChangeMap[i];
		}

		curStep = lastChange.stepTime + Math.floor((Conductor.songPosition - lastChange.songTime) / Conductor.stepCrochet);
	}

	public function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
	}

	public function beatHit():Void
	{
		// do literally nothing dumbass
	}
	/*public function bool(bool:Bool = false)
		{
			return bool;
	}*/
}
