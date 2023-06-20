using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_37
{
    class Program
    {
        static void Main(string[] args)
        {
            int? nullInt1 = 10;
            int? nullInt2 = null;

            if (nullInt1.HasValue) // 10이라는 값이 할당되어 있으므로 true.
            {                
                Console.WriteLine(nullInt1.Value + 10); // 20 출력.
            }

            Console.WriteLine(nullInt1.GetValueOrDefault()); // 10 출력.
            Console.WriteLine(nullInt2.GetValueOrDefault()); // 0 출력.

            Console.WriteLine(nullInt1 ?? 100); // 10 출력.
            Console.WriteLine(nullInt2 ?? 100); // 100 출력.
        }
    }
}
