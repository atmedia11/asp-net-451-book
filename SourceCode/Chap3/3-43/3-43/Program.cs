using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_43
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("나누는 수 입력...");
            int num = int.Parse(Console.ReadLine());            
            int result = 100 / num;
            Console.WriteLine("100 / {0} = {1}", num, result);
            Console.WriteLine("프로그램 종료");
        }
    }
}
