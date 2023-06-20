using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_21
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "This is a test.";
            Console.WriteLine(s);

            string r = "";
            r = s.Substring(5);
            Console.WriteLine("s.Substring(5): " + r);

            r = s.Substring(5, 7);
            Console.WriteLine("s.Substring(5, 7): " + r);
        }
    }
}
