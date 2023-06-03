package jsEngine;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ### JSSprite (extends FlxSprite)
 * A Custom of FlxSprite
 * 
 * Still development!
 */
class JSSprite extends FlxSprite
{
	/**
	 * Load a sprite
	 * @param x x postion for sprite
	 * @param y y postion for sprite
	 * @param graphic a graphic sprite
	 */
	public function new(x:Float = 0, y:Float = 0, graphic:FlxGraphicAsset)
	{
		super(x, y, graphic);
	}

	/**
	 * Kill a sprite, useful sometime
	 * @param enableTween will enable a tween
	 * @param alphaFloat (ONLY IF YOU ARE SET `enableTween` ARE `true`, NOT `false`) set the alpha when kill
	 * @param xPos (ONLY IF YOU ARE SET `enableTween` ARE `true`, NOT `false`) move x postion value
	 * @param yPos (ONLY IF YOU ARE SET `enableTween` ARE `true`, NOT `false`) move y postion vlue
	 * @param time (ONLY IF YOU ARE SET `enableTween` ARE `true`, NOT `false`) set durations time to kill
	 * @param easeType (ONLY IF YOU ARE SET `enableTween` ARE `true`, NOT `false`) set the ease type
	 */
	public function killS(enableTween:Bool, alphaFloat:Float, xPos:Float, yPos:Float, time:Float, easeType:Null<EaseFunction>)
	{
		alive = false;
		if (enableTween)
		{
			FlxTween.tween(this, {
				alpha: alphaFloat,
				x: xPos,
				y: yPos
			}, time, {ease: easeType, onComplete: finishKill});
		}
		else
		{
		}
	}

	/**
	 * (ONLY IF YOU ARE SET `killS` first)
	 * 
	 * the sprite will not alive!
	 */
	public function finishKill(_)
	{
		exists = false;
	}
}
