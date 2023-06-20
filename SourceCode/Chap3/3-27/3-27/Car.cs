using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_27
{
    class Car
    {
        private string _type;   // 종류
        private string _color;  // 색상
        int _maxSpeed;          // 최고 속도        

        // 읽기 쓰기 모두 가능한 속성
        public string Type
        {
            get { return _type; }   // 읽기
            set { _type = value; }   // 쓰기
        }

        // 읽기만 가능한 속성
        public string Color
        {
            get { return _color; }  // 읽기
        }

        // 쓰기만 가능한 속성
        public int MaxSpeed
        {
            set
            {
                if (value >= 100)
                    _maxSpeed = value; // 쓰기
            }
        }

        public Car() { }

        public Car(string type, string color, int maxSpeed)
        {
            _type = type;
            _color = color;
            _maxSpeed = maxSpeed;
        }
    }
}
