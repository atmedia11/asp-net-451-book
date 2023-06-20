using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_35
{
    class Program
    {
        static void Main(string[] args)
        {
            //int i1 = 10;
            //string result1 = (string)i1; // 오류 발생.
            //string s1 = "10";
            //int result2 = (int)s1; // 오류 발생.

            int i2 = 10;
            string result3 = Convert.ToString(i2);
            string s2 = "10";
            int result4 = Convert.ToInt32(s2);
            Console.WriteLine("{0}, {1}", result3 + 10, result4 + 10);

            string s3 = "100";
            string s4 = "100.123";
            int result5 = int.Parse(s3);
            double result6 = double.Parse(s4);
            Console.WriteLine("{0}, {1}", result5 + 10, result6 + 10);
            
            string s5 = "Hello";
            string s6 = "100";
            int val1, val2;
            bool result7 = int.TryParse(s5, out val1);
            bool result8 = int.TryParse(s6, out val2);
            Console.WriteLine("({0}, {1}), ({2}, {3})", result7, val1, result8, val2);

            Console.WriteLine("10" + 90);
        }
    }
}
