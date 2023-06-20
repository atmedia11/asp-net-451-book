using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_3
{
    class Program
    {
        static void Main(string[] args)
        {
            int abcd = 1;
            long _1234 = 2;
            double 한글변수 = 3.5;
            string string변수 = "테스트 문자열";

            Console.WriteLine("abcd = " + abcd);
            Console.WriteLine("_1234 = " + _1234);
            Console.WriteLine("한글변수 = " + 한글변수);
            Console.WriteLine("string변수 = " + string변수);

            // 아래는 변수 명명 규칙에 어긋나는 변수들의 예이다.
            // 주석을 제거하고 예제를 다시 실행하여 발생하는 오류를 확인해보자.
            //long 123long = 200;
            //string value*?! = "테스트 문자열";
            //int using = 100;
        }
    }
}
