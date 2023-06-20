using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_4
{
    class Program
    {
        static void Main(string[] args)
        {
            // 변수 선언 및 초기화
            int a = 20, b = 10, c = 0;
            Console.WriteLine("a = {0}, b = {1}", a, b);

            c = a + b; // 더하기
            Console.WriteLine("a + b = {0}", c);
            c = a - b; // 빼기
            Console.WriteLine("a - b = {0}", c);
            c = a * b; // 곱하기
            Console.WriteLine("a * b = {0}", c);
            c = a / b; // 나누기
            Console.WriteLine("a / b = {0}", c);
            c = b % 3; // 나머지
            Console.WriteLine("b % 3 = {0}", c);
            a++; // 증가. a = a + 1과 같음.
            Console.WriteLine("a++ = {0}", a);
            b--; // 감소. b = b - 1과 같음.
            Console.WriteLine("b-- = {0}", b);
        }
    }
}
