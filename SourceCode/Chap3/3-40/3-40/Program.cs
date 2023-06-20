using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace _3_40
{
    class Program
    {
        static void Main(string[] args)
        {
            ArrayList ar1 = new ArrayList();

            ar1.Add("100");
            ar1.Add("200");
            ar1.Add("300");
            ar1.Add(100); // 실수로 int 형식의 데이터를 입력했다고 가정한다.

            foreach (string item in ar1)
            {
                Console.WriteLine(item);
            }
        }
    }
}
