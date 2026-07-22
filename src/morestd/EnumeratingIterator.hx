package morestd;

class EnumeratingIterator<T>
{
    var iterator:Iterator<T>;
    var i:Int;

    public function new(sequence:Iterable<T>, startIndex:Int = 0)
    {
        this.iterator = sequence.iterator();
        this.i = startIndex;
    }

    public function hasNext():Bool
    {
        return iterator.hasNext();
    }

    public function next():{key:Int, value:T}
    {
        return {key: i++, value: iterator.next()};
    }
}
