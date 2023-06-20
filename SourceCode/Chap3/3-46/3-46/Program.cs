using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_46
{
    class Program
    {
        static int Sum(int a, int b)
        {
            if (a > 0 && b > 0)
                return (a + b);
            else
                throw new Exception("Sum() 메서드의 인수는 0보다 커야 합니다.");
        }

        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine(Sum(10, -10));
            }
            catch (Exception e)
            {
                Console.WriteLine("예외 발생: {0}", e.Message);
            }
        }
    }
}
