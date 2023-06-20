using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_38
{
    class Program
    {
        enum Direction { Forward, Backward, Left, Right }

        enum Fruit { Apple = 5, Banana, Grape = 10, Orange }

        enum Gender : byte { Male, Female }

        static void Main(string[] args)
        {
            Direction dir = Direction.Left;            
            bool isLeft = (dir == Direction.Left); // true 반환.
            int dirValue = (int)dir; // 2 반환. 명시적 변환이 필요하다.
            string dirName = Enum.GetName(typeof(Direction), 3); // "Right" 반환.
            Console.WriteLine("{0}, {1}, {2}", isLeft, dirValue, dirName);
            
            Console.WriteLine("{0}, {1}, {2}, {3}", (int)Fruit.Apple, (int)Fruit.Banana, (int)Fruit.Grape, (int)Fruit.Orange);
        }
    }
}
