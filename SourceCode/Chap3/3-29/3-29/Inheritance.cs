using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_29
{
    class Parent
    {
        public int x;
        protected int y;
        private int z;

        public void PrintFromParent()
        {
            Console.WriteLine("x={0}, y={1}, z={2}", x, y, z);
        }
    }

    class Child : Parent
    {
        public int i;

        public void PrintFromChild()
        {
            Console.WriteLine("x={0}, y={1}, i={2}", x, y, i);
        }
    }
}
