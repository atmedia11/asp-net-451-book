using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace _3_39
{
    class Program
    {
        static void Main(string[] args)
        {
            ArrayList ar1 = new ArrayList();

            ar1.Add("100");
            ar1.Add("200");
            ar1.Add("300");

            foreach (string item in ar1)
            {
                Console.WriteLine(item);
            }

            ArrayList ar2 = new ArrayList();

            ar2.Add(100);
            ar2.Add(200);
            ar2.Add(300);

            foreach (int item in ar2)
            {
                Console.WriteLine(item);
            }
        }
    }
}
