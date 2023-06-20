using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_30
{
    class Program
    {
        static void PrintInfo(string name, string email)
        {
            Console.WriteLine("{0}, {1}", name, email);
        }

        static void Main(string[] args)
        {
            PrintInfo("홍길동", "hong@abc.com");
            PrintInfo(name: "김철수", email: "kim@abc.com");
            PrintInfo(email: "lee@abc.com", name: "이영희");
            PrintInfo("바둑이", email: "dog@abc.com");
        }
    }
}
