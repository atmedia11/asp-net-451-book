using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_2
{
    class Program
    {
        static void Main(string[] args)
        {
            // 정수 데이터 형식
            sbyte sbyte변수1 = -128;
            sbyte sbyte변수2 = 127;
            byte byte변수 = 255;
            char char변수 = 'A';
            short short변수1 = -32768;
            short short변수2 = 32767;
            ushort ushort변수 = 65535;
            int int변수1 = -2000000000;
            int int변수2 = 2000000000;
            uint uint변수 = 4000000000;
            long long변수1 = -9000000000000000000;
            long long변수2 = 9000000000000000000;
            ulong ulong변수 = 18000000000000000000;

            // 실수 데이터 형식
            float float변수1 = -1000.123f;
            float float변수2 = 1000.123f;
            double double변수1 = -100000.123456789;
            double double변수2 = 100000.123456789;
            decimal decimal변수1 = -100000000.1234567890123456789m;
            decimal decimal변수2 = 100000000.1234567890123456789m;

            // 그 외의 데이터 형식
            string string변수 = "이것은 문자열입니다.";
            bool bool변수1 = true;
            bool bool변수2 = false;
            object object변수1 = -128;
            object object변수2 = 255;
            object object변수3 = 'A';
            object object변수4 = 18000000000000000000;
            object object변수5 = 100000.123456789;
            object object변수6 = "테스트 문자열입니다.";
            object object변수7 = true;

            // 출력하기
            Console.WriteLine("* 정수 데이터 형식");
            Console.WriteLine("sbyte변수1 = " + sbyte변수1);
            Console.WriteLine("sbyte변수2 = " + sbyte변수2);
            Console.WriteLine("byte변수 = " + byte변수);
            Console.WriteLine("char변수 = " + char변수);
            Console.WriteLine("short변수1 = " + short변수1);
            Console.WriteLine("short변수2 = " + short변수2);
            Console.WriteLine("ushort변수 = " + ushort변수);
            Console.WriteLine("int변수1 = " + int변수1);
            Console.WriteLine("int변수2 = " + int변수2);
            Console.WriteLine("uint변수 = " + uint변수);
            Console.WriteLine("long변수1 = " + long변수1);
            Console.WriteLine("long변수2 = " + long변수2);
            Console.WriteLine("ulong변수 = " + ulong변수);
            Console.WriteLine();
            Console.WriteLine("* 실수 데이터 형식");
            Console.WriteLine("float변수1 = " + float변수1);
            Console.WriteLine("float변수2 = " + float변수2);
            Console.WriteLine("double변수1 = " + double변수1);
            Console.WriteLine("double변수2 = " + double변수2);
            Console.WriteLine("decimal변수1 = " + decimal변수1);
            Console.WriteLine("decimal변수2 = " + decimal변수2);
            Console.WriteLine();
            Console.WriteLine("* 그 외의 데이터 형식");
            Console.WriteLine("string변수 = " + string변수);
            Console.WriteLine("bool변수1 = " + bool변수1);
            Console.WriteLine("bool변수2 = " + bool변수2);
            Console.WriteLine("object변수1 = " + object변수1);
            Console.WriteLine("object변수2 = " + object변수2);
            Console.WriteLine("object변수3 = " + object변수3);
            Console.WriteLine("object변수4 = " + object변수4);
            Console.WriteLine("object변수5 = " + object변수5);
            Console.WriteLine("object변수6 = " + object변수6);
            Console.WriteLine("object변수7 = " + object변수7);
        }
    }
}
