using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_27
{
    class Program
    {
        static void Main(string[] args)
        {   
            Car car1 = new Car("K7", "Silver", 220);

            car1.Type = "K9";
            //car1.Color = "Black"; // Color 속성은 읽기 전용이라 값을 할당할 수 없다.
            car1.MaxSpeed = 240;

            Console.WriteLine("_type={0}, _color={1}", car1.Type, car1.Color);
            //Console.WriteLine("_maxSpeed={0}", car1.MaxSpeed); // MaxSpeed 속성은 쓰기 전용이라 값을 참조할 수 없다.
        }
    }
}
