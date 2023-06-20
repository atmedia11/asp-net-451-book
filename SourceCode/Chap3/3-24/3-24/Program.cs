using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_24
{
    class Program
    {
        static void Main(string[] args)
        {
            string str1 = "가*나*다*라";
            string str2 = "This is a test.";

            string[] results1 = str1.Split('*');
            for (int i = 0; i < results1.Length; i++)
            {
                Console.WriteLine(results1[i]);
            }

            string[] results2 = str2.Split(' ');
            for (int i = 0; i < results2.Length; i++)
            {
                Console.WriteLine(results2[i]);
            }
        }
    }
}
