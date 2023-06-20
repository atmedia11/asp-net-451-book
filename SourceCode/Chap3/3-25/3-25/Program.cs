using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_25
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "    This is a test.    ";
            Console.WriteLine("[" + s + "]");
            Console.WriteLine("[" + s.Trim() + "]");
        }
    }
}
