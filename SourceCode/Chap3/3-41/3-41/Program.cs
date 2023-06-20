using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_41
{
    class Program
    {
        static void Main(string[] args)
        {
            List<string> list1 = new List<string>();

            list1.Add("100");
            list1.Add("200");
            list1.Add("300");
            //list1.Add(100); // 컴파일 시 오류 발생.

            foreach (string item in list1)
            {
                Console.WriteLine(item);
            }
        }
    }
}
