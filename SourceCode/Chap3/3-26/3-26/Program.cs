using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_26
{
    class Program
    {
        static void Main(string[] args)
        {
            Car car1 = new Car();
            Console.WriteLine("type={0}, color={1}, maxSpeed={2}", car1.type, car1.color, car1.maxSpeed);
            Console.WriteLine(car1.GoStraight());

            Console.WriteLine();

            Car car2 = new Car("쏘나타", "White", 220);
            Console.WriteLine("type={0}, color={1}, maxSpeed={2}", car2.type, car2.color, car2.maxSpeed);
            Console.WriteLine(car2.TurnRight());

            // Reverse() 메서드는 액세스 수준이 private이므로 접근할 수 없다.
            //Console.WriteLine(car2.Reverse());
        }
    }
}
