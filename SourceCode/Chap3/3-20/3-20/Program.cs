using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_20
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "This is a test.";
            Console.WriteLine(s);

            int index;
            index = s.IndexOf("test");
            Console.WriteLine("test: " + index);

            index = s.IndexOf("Test");
            Console.WriteLine("Test: " + index);

            index = s.IndexOf("This");
            Console.WriteLine("This: " + index);

            index = s.IndexOf("is");
            Console.WriteLine("is: " + index);

            index = s.LastIndexOf("is");
            Console.WriteLine("is(LastIndexOf): " + index);
        }
    }
}
