using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_9
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = 20, y = 10;
            bool a = true, b = false;
            Console.WriteLine("x = {0}, y = {1}, a = {2}, b = {3}", x, y, a, b);

            x += y;
            Console.WriteLine("x += y 연산 후 x = {0} (x = x + y와 동일)", x);

            x = 20; // 초기화
            x -= y;
            Console.WriteLine("x -= y 연산 후 x = {0} (x = x - y와 동일)", x);
            
            x = 20;
            x *= y;
            Console.WriteLine("x *= y 연산 후 x = {0} (x = x * y와 동일)", x);
            
            x = 20;
            x /= y;
            Console.WriteLine("x /= y 연산 후 x = {0} (x = x / y와 동일)", x);
            
            x = 20;
            x %= y;
            Console.WriteLine("x %= y 연산 후 x = {0} (x = x % y와 동일)", x);
                        
            a &= b;
            Console.WriteLine("a &= b 연산 후 a = {0} (a = a & b와 동일)", a);
            
            a = true; // 초기화
            a |= b;
            Console.WriteLine("a |= b 연산 후 a = {0} (a = a | b와 동일)", a);
            
            a = true;
            a ^= b;
            Console.WriteLine("a ^= b 연산 후 a = {0} (a = a ^ b와 동일)", a);
        }
    }
}
