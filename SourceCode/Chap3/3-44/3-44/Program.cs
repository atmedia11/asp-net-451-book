using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_44
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.Write("나누는 수 입력...");
                int num = int.Parse(Console.ReadLine());
                int result = 100 / num;
                Console.WriteLine("100 / {0} = {1}", num, result);
            }
            catch (Exception e)
            {
                Console.WriteLine("예외 발생: {0}", e.Message);
            }

            Console.WriteLine("프로그램 종료");
        }
    }
}
