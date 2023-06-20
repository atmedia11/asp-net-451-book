using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_45
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("나누는 수 입력...");
            int num = 0;
            if (int.TryParse(Console.ReadLine(), out num) && num != 0)
            {
                Console.WriteLine("100 / {0} = {1}", num, 100 / num);
            }
            Console.WriteLine("프로그램 종료");
        }
    }
}
