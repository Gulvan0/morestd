package morestd;

/**
    A typed event stream with any number of subscribers. Handlers are called in subscription
    order. A handler may subscribe or detach (itself or another one) while a `dispatch` is in
    progress: the change takes effect from the next `dispatch`, except that a handler detached
    mid-dispatch is no longer called by the ongoing one.
**/
class Signal<T>
{
    private var handlers:Array<T->Void> = [];

    public function new() {}

    /**
        Adds `handler`, to be called on every subsequent `dispatch` until the returned `Detachable`
        is detached. Subscribing the same function twice makes it be called twice.
    **/
    public function subscribe(handler:T->Void):Detachable
    {
        // Wrapped, so that two subscriptions of the same function are told apart on detach.
        var subscription:T->Void = value -> {
            handler(value);
        };
        handlers.push(subscription);
        return new Detachable(() -> {
            handlers.remove(subscription);
        }, false);
    }

    /**
        Calls every current subscriber with `value`.
    **/
    public function dispatch(value:T):Void
    {
        for (handler in handlers.copy())
            if (handlers.contains(handler))
                handler(value);
    }
}
