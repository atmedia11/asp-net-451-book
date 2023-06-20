using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_5
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 10, c = 0;
            Console.WriteLine("a = {0}", a);

            c = ++a;
            Console.WriteLine("c = ++a 전위 연산 후 c = {0}, a = {1}", c, a);
            a = 10; // a를 다시 10으로 초기화

            c = a++;
            Console.WriteLine("c = a++ 후위 연산 후 c = {0}, a = {1}", c, a);
            a = 10; // a를 다시 10으로 초기화

            c = --a;
            Console.WriteLine("c = --a 전위 연산 후 c = {0}, a = {1}", c, a);
            a = 10; // a를 다시 10으로 초기화

            c = a--;
            Console.WriteLine("c = a-- 후위 연산 후 c = {0}, a = {1}", c, a);
        }
    }
}
