package morestd;

class StringIterator
{
    var str:String;
    var chunkSize:Int;
    var i:Int;

    public function new(str:String, ?startingIndex:Int = 0, chunkSize:Int = 1)
    {
        this.str = str;
        this.chunkSize = chunkSize;

        this.i = startingIndex;
    }

    public function hasNext():Bool
    {
        return i < str.length;
    }

    public function next():String
    {
        var result:String = "";
        for (_ in 0...chunkSize)
            result += str.charAt(i++);
        return result;
    }
}
