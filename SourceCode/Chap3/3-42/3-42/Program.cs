using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_42
{
    class Program
    {
        static void Print<T>(T param)
        {
            Console.WriteLine(param);
        }

        static void Main(string[] args)
        {
            Print<char>('A');
            Print<double>(100.123);
            Print<string>("제네릭 메서드");
            //Print<int>("100"); // 컴파일 시 오류 발생.

            List<string> s = new List<string>();
        }
    }
}
