package morestd.extensions;

class ArrayExtension
{
    public static function get<T>(array:Array<T>, generalizedIndex:Int):Null<T>
    {
        return generalizedIndex < 0? array[array.length + generalizedIndex] : array[generalizedIndex];
    }

    public static function getLast<T>(array:Array<T>):Null<T>
    {
        return get(array, -1);
    }
}
