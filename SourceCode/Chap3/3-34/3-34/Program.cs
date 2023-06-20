using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_34
{
    class Parent { }
    class Child : Parent { }
    
    class Program
    {
        static void Main(string[] args)
        {
            Parent parent = new Parent();
            Child child = new Child();
            
            parent = child; // 암시적 변환 가능.
            child = (Child)parent; // 명시적 변환을 해야 함.
            //child = parent; // 오류 발생.
        }
    }
}
