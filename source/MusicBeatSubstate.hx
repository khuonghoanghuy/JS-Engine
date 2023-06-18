package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUISubState;
import jsEngine.JSEngineData;
#if debug
import flixel.addons.studio.FlxStudio;
#end
#if mobile
import mobile.flixel.FlxVirtualPad;
import flixel.FlxCamera;
import flixel.input.actions.FlxActionInput;
import flixel.util.FlxDestroyUtil;
#end
class MusicBeatSubstate extends FlxUISubState
{
	public function new()
	{
		super();

		#if debug
		FlxStudio.create();
		#end

		loadData();
	}

	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;
	private var controls(get, never):Controls;

	inline function loadData()
	{
		PlayerSettings.init();
		FlxG.save.bind('jsEngine', 'huy1234th');
		// FlxG.save.close(0);

		Highscore.load();
		FlxG.sound.cacheAll();

		JSEngineData.fpsCapInit();

		JSEngineData.init();
	}

	/**
	 * Get Controls on player 1
	 */
	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

#if mobile
	var virtualPad:FlxVirtualPad;
	var trackedInputsVirtualPad:Array<FlxActionInput> = [];

	public function addVirtualPad(DPad:FlxDPadMode, Action:FlxActionMode)
	{
		if (virtualPad != null)
			removeVirtualPad();

		virtualPad = new FlxVirtualPad(DPad, Action);
		add(virtualPad);

		controls.setVirtualPadUI(virtualPad, DPad, Action);
		trackedInputsVirtualPad = controls.trackedInputsUI;
		controls.trackedInputsUI = [];
	}

	public function removeVirtualPad()
	{
		if (trackedInputsVirtualPad != [])
			controls.removeVirtualControlsInput(trackedInputsVirtualPad);

		if (virtualPad != null)
			remove(virtualPad);
	}

	public function addVirtualPadCamera(DefaultDrawTarget:Bool = true)
	{
		if (virtualPad != null)
		{
			var camControls:FlxCamera = new FlxCamera();
			FlxG.cameras.add(camControls, DefaultDrawTarget);
			camControls.bgColor.alpha = 0;
			virtualPad.cameras = [camControls];
		}
	}
	#end

	override function destroy()
	{
		#if mobile
		if (trackedInputsVirtualPad != [])
			controls.removeVirtualControlsInput(trackedInputsVirtualPad);
		#end

		super.destroy();

		#if mobile
		if (virtualPad != null)
		{
			virtualPad = FlxDestroyUtil.destroy(virtualPad);
			virtualPad = null;
		}
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
		curBeat = Math.floor(curStep / 4);

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

	private function updateCurStep():Void
	{
		var lastChange:BPMChangeEvent = {
			stepTime: 0,
			songTime: 0,
			bpm: 0
		}
		for (i in 0...Conductor.bpmChangeMap.length)
		{
			if (Conductor.songPosition > Conductor.bpmChangeMap[i].songTime)
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
#if mobile
addVirtualPad(LEFT_FULL, A_B);
#end