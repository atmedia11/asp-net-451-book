using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_36
{
    class Program
    {
        static void Main(string[] args)
        {
            //int i = null; // 오류 발생.
            string s = null; // 가능하다.

            int? nullInt = null; // null을 할당할 수 있다.
            nullInt = 10; // 일반적인 int 형식의 값도 할당할 수 있다.
            int myInt = (int)nullInt; // 명시적 변환 필요. 그렇지 않으면 오류 발생.
            nullInt = myInt; // 암시적 변환이 일어난다.
        }
    }
}
