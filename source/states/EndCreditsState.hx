package states;

import hxvlc.flixel.FlxVideoSprite;

class EndCreditsState extends MusicBeatState {
    var video:FlxVideoSprite;
    override public function create() {
        super.create();

        FlxG.sound.music.stop();

        var filepath:String = Paths.video("End Cutscene");

        var video = new FlxVideoSprite();
		add(video);
		video.load(filepath);
		new FlxTimer().start(0.001, function(tmr:FlxTimer) {
			video.play();
		});
		video.bitmap.onEndReached.add(function()
		{
			video.destroy();
			remove(video);
            LoadingState.loadAndSwitchState(new MainMenuState());
			return;
		});
    }
}