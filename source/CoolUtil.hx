package;

import lime.utils.Assets;

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD"];

	public static function difficultyString():String
	{
		return difficultyArray[PlayState.storyDifficulty];
	}

	/**
	 * Loading text File
	 * @param path current file want to load
	 */
	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	/**
	 * Loading string File (or text file)
	 * 
	 * from XGen Engine
	 * 
	 * @param path current file want to load
	 */
	public static function coolStringFile(path:String):String
	{
		var daList:String = Assets.getText(path).trim();

		return daList;
	}

	/**
	 * will run a random number
	 * @param max current number want to be max
	 * @param min current number want to be min
	 */
	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
}
