using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_17
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] names = new string[3];
            names[0] = "홍길동";
            names[1] = "김철수";
            names[2] = "이영희";

            for (int i = 0; i < names.Length; i++)
            {
                Console.WriteLine("names[{0}] = {1}", i, names[i]);
            }
        }
    }
}
