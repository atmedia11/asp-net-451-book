using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_7
{
    class Program
    {
        static void Main(string[] args)
        {
            bool a = true, b = false;
            Console.WriteLine("a = {0}, b = {1}", a, b);

            Console.WriteLine("a & b → {0}", a & b);
            Console.WriteLine("a | b → {0}", a | b);
            Console.WriteLine("a ^ b → {0}", a ^ b);
            Console.WriteLine("!a → {0}", !a);
            Console.WriteLine("!b → {0}", !b);
        }
    }
}
