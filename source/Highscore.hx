package;

import flixel.FlxG;

class Highscore
{
	#if (haxe >= "4.0.0")
	public static var songScores:Map<String, Int> = new Map();
	#else
	public static var songScores:Map<String, Int> = new Map<String, Int>();
	#end

	/**
	 * Save Score System
	 * @param song current song name
	 * @param score current score
	 * @param diff current difficult
	 */
	public static function saveScore(song:String, score:Int = 0, ?diff:Int = 0):Void
	{
		var daSong:String = formatSong(song, diff);

		if (songScores.exists(daSong))
		{
			if (songScores.get(daSong) < score)
				setScore(daSong, score);
		}
		else
			setScore(daSong, score);
	}

	/**
	 * Save Score System on Week
	 * @param week current week number
	 * @param score current score
	 * @param diff current difficult
	 */
	public static function saveWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 0):Void
	{
		var daWeek:String = formatSong('week' + week, diff);

		if (songScores.exists(daWeek))
		{
			if (songScores.get(daWeek) < score)
				setScore(daWeek, score);
		}
		else
			setScore(daWeek, score);
	}

	/**
	 * YOU SHOULD FORMAT SONG WITH formatSong() BEFORE TOSSING IN SONG VARIABLE
	 * @param song current song name want to set
	 * @param score current score want to set
	 */
	static function setScore(song:String, score:Int):Void
	{
		// Reminder that I don't need to format this song, it should come formatted!
		songScores.set(song, score);
		FlxG.save.data.songScores = songScores;
		FlxG.save.flush();
	}

	/**
	 * Using this function before tossing in song variable
	 * @param song current song name want to format
	 * @param diff current difficult want to format
	 */
	public static function formatSong(song:String, diff:Int):String
	{
		var daSong:String = song;

		if (diff == 0)
			daSong += '-easy';
		else if (diff == 2)
			daSong += '-hard';

		return daSong;
	}

	/**
	 * Using function score on song want to get
	 * @param song current song want to get
	 * @param diff current difficult want to get
	 */
	public static function getScore(song:String, diff:Int):Int
	{
		if (!songScores.exists(formatSong(song, diff)))
			setScore(formatSong(song, diff), 0);

		return songScores.get(formatSong(song, diff));
	}

	/**
	 * Using function score on any week want to get
	 * @param week current week want to get
	 * @param diff current difficult want to get
	 */
	public static function getWeekScore(week:Int, diff:Int):Int
	{
		if (!songScores.exists(formatSong('week' + week, diff)))
			setScore(formatSong('week' + week, diff), 0);

		return songScores.get(formatSong('week' + week, diff));
	}

	/**
	 * loading score
	 */
	public static function load():Void
	{
		if (FlxG.save.data.songScores != null)
		{
			songScores = FlxG.save.data.songScores;
		}
	}
}
