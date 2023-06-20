using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_31
{
    class Program
    {
        static void Cal1(int p1, int p2 = 10)
        {
            Console.WriteLine(p1 * p2);
        }

        static void Cal2(int p1, int p2 = 10, int p3 = 5)
        {
            Console.WriteLine(p1 * p2 / p3);
        }

        static void Main(string[] args)
        {
            Cal1(10); // 100 출력. 10(p1) * 10(p2 기본값) = 100.
            Cal1(10, 2); // 20 출력. 10(p1) * 2(p2) = 20.

            Cal2(10, 2); // 4 출력. 10(p1) * 2(p2) / 5(p3 기본값) = 4.
            Cal2(10, p3: 2); // 50 출력. 10(p1) * 10(p2 기본값) / 2(p3) = 50.
        }
    }
}
