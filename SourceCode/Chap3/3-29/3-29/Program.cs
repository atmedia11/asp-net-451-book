using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_29
{
    class Program
    {
        static void Main(string[] args)
        {
            Child c = new Child();

            c.x = 10;
            // c.y = 20; // 액세스 수준이 protected이므로 클래스 외부에서 접근 할 수 없다.
            // c.z = 30; // 액세스 수준이 private이므로 클래스 외부에서 접근 할 수 없다.
            c.i = 100;

            c.PrintFromParent();
            c.PrintFromChild();
        }
    }
}
