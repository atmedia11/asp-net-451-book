using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_11
{
    class Program
    {
        static void Main(string[] args)
        {
            int grade = 4;

            switch (grade)
            {
                case 1:
                    Console.WriteLine("님은 골드입니다.");
                    break;
                case 2:
                    Console.WriteLine("님은 루비입니다.");
                    break;
                case 3:
                    Console.WriteLine("님은 사파이어입니다. 이게 최선입니까?");
                    break;
                case 4:
                    Console.WriteLine("님은 에메랄드입니다.");
                    break;
                case 5:
                    Console.WriteLine("님은 다이아몬드입니다. 님은 좀 짱인 듯.");
                    break;
                default:
                    Console.WriteLine("존재하지 않는 등급입니다.");
                    break;
            }
        }
    }
}
