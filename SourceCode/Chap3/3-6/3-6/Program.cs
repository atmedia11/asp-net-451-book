using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_6
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 10, b = 20, c = 10;            
            Console.WriteLine("a = {0}, b = {1}, c = {2}", a, b, c);

            Console.WriteLine("a == b → {0}", a == b);
            Console.WriteLine("a != b → {0}", a != b);
            Console.WriteLine("a > b → {0}", a > b);
            Console.WriteLine("a < b → {0}", a < b);
            Console.WriteLine("a >= c → {0}", a >= c);
            Console.WriteLine("a <= c → {0}", a <= c);
        }
    }
}
