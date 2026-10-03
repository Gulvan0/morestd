package morestd;

/**
    `Signal` for events that carry no value: same subscription and dispatch rules.
**/
class VoidSignal
{
    private var handlers:Array<Void->Void> = [];

    public function new() {}

    /**
        Adds `handler`, to be called on every subsequent `dispatch` until the returned `Detachable`
        is detached. Subscribing the same function twice makes it be called twice.
    **/
    public function subscribe(handler:Void->Void):Detachable
    {
        // Wrapped, so that two subscriptions of the same function are told apart on detach.
        var subscription:Void->Void = () -> {
            handler();
        };
        handlers.push(subscription);
        return new Detachable(() -> {
            handlers.remove(subscription);
        }, false);
    }

    /**
        Calls every current subscriber.
    **/
    public function dispatch():Void
    {
        for (handler in handlers.copy())
            if (handlers.contains(handler))
                handler();
    }
}
