using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_19
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] table = {
	            {10, 20, 30, 40},
	            {50, 60, 70, 80}
            };

            for (int x = 0; x < 2; x++)
            {
                for (int y = 0; y < 4; y++)
                {
                    Console.Write("table[{0}, {1}]={2}   ", x, y, table[x, y]);
                }
                Console.WriteLine();
            }
        }
    }
}
