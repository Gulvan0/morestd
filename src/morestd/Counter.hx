package morestd;

class Counter
{
    private var i:Int;

    public function next():Int
    {
        return i++;
    }

    public function new(start:Int = 0)
    {
        this.i = start;
    }
}
