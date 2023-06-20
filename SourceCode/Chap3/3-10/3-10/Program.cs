using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_10
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 10, b = 20;
            Console.WriteLine("a  = {0}, b = {1}", a, b);

            // if
            if (a > b)
            {
                Console.WriteLine("a는 b보다 크다.");
            }

            // if - else
            if (a > b)
            {
                Console.WriteLine("a는 b보다 크다.");
            }
            else
            {
                Console.WriteLine("a는 b보다 크지 않다.");
            }

            // if - else if - else
            if (a > b)
            {
                Console.WriteLine("a는 b보다 크다.");
                Console.WriteLine("{0} > {1}", a, b);
            }
            else if (a == b)
            {
                Console.WriteLine("a는 b와 같다.");
                Console.WriteLine("{0} == {1}", a, b);
            }
            else
            {
                Console.WriteLine("a는 b보다 작다.");
                Console.WriteLine("{0} < {1}", a, b);
            }
        }
    }
}
