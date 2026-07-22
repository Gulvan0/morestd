package morestd;

class Detachable
{
    private var detachCallback:Null<Void->Void>;
    private final multiuse:Bool;

    public function new(detachCallback:Void->Void, multiuse:Bool = true)
    {
        this.detachCallback = detachCallback;
        this.multiuse = multiuse;
    }

    public function detach():Void
    {
        if (detachCallback == null)
            return;

        detachCallback();
        if (!multiuse)
            detachCallback = null;
    }
}
