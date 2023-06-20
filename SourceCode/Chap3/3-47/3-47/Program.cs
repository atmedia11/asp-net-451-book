using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_47
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine(int.Parse("이십")); // 예외 발생
            }
            catch (Exception e)
            {
                Console.WriteLine("예외 발생: {0}", e.Message);
            }
            finally
            {
                Console.WriteLine("finally 블록은 예외 발생 여부와 상관없이 마지막에 무조건 실행된다.");
            }
        }
    }
}
