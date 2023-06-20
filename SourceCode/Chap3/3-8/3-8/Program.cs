using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_8
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = 10, y = 20;
            bool z;
            Console.WriteLine("x = {0}, y = {1}", x, y);

            z = (x > y) & (++x < ++y); // 논리곱(&) 연산자
            Console.WriteLine("z = (x > y) & (++x < ++y) 연산 후 x = {0}, y = {1}, z = {2}", x, y, z);
            
            x = 10; y = 20; // 초기화
            z = (x > y) && (++x < ++y); // 단락 논리곱(&&) 연산자
            Console.WriteLine("z = (x > y) && (++x < ++y) 연산 후 x = {0}, y = {1}, z = {2}", x, y, z);
            
            x = 10; y = 20; // 초기화
            z = (x < y) | (++x < ++y); // 논리합(|) 연산자
            Console.WriteLine("z = (x < y) | (++x < ++y) 연산 후 x = {0}, y = {1}, z = {2}", x, y, z);
            
            x = 10; y = 20; // 초기화
            z = (x < y) || (++x < ++y); // 단락 논리합(||) 연산자
            Console.WriteLine("z = (x < y) || (++x < ++y) 연산 후 x = {0}, y = {1}, z = {2}", x, y, z);
        }
    }
}