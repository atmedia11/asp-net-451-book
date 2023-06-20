using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_13
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "";
            Console.Write("문자열 입력(exit 입력 시 프로그램 종료): ");
            s = Console.ReadLine(); // 문자열을 입력 받는다.

            while (s != "exit")
            {
                Console.WriteLine("입력 받은 문자열: " + s); // 출력
                Console.WriteLine();

                Console.Write("문자열 입력(exit 입력 시 프로그램 종료): ");
                s = Console.ReadLine(); // 문자열을 입력 받는다.
            }
        }
    }
}
