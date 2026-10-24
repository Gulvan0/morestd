package morestd;

import haxe.Timer;

class Throttler
{
    private final durationMs:Int;

    private var lastCallTimestampMs:Null<Float> = null;
    private var pendingCallback:Null<Void->Void> = null;
    private var pendingTimer:Null<Timer> = null;

    public function new(durationMs:Int)
    {
        this.durationMs = durationMs;
    }

    /**
        Runs the callback immediately if more than the duration has passed since the last run.
        Otherwise, schedules it for the moment the duration is exceeded, replacing the previously scheduled callback, if any.
    **/
    public function run(callback:Void->Void):Void
    {
        if (pendingTimer != null)
        {
            pendingCallback = callback;
            return;
        }

        if (lastCallTimestampMs == null)
        {
            execute(callback);
            return;
        }

        var remainingMs:Float = durationMs - (currentTimestampMs() - lastCallTimestampMs);

        if (remainingMs < 0)
            execute(callback);
        else
        {
            pendingCallback = callback;
            pendingTimer = Timer.delay(onTimerElapsed, Math.ceil(remainingMs) + 1);
        }
    }

    private function onTimerElapsed():Void
    {
        var callback:Void->Void = pendingCallback;
        pendingCallback = null;
        pendingTimer = null;
        execute(callback);
    }

    private function execute(callback:Void->Void):Void
    {
        lastCallTimestampMs = currentTimestampMs();
        callback();
    }

    private static function currentTimestampMs():Float
    {
        return Timer.stamp() * 1000;
    }
}
