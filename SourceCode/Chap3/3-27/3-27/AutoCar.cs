using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_27
{
    class AutoCar
    {
        private int _maxSpeed;

        public string Type { get; set; } // 자동 구현 속성(읽기/쓰기)

        public string Color // 자동 구현 속성(읽기 전용)
        {
            get;
            private set; // set 접근자의 액세스 수준을 private으로 지정하여 쓰기를 할 수 없는 즉, 읽기 전용의 자동 구현 속성을 만들었다.
        }

        public int MaxSpeed
        {
            set
            {
                if (value >= 100)
                    _maxSpeed = value;
            }
        }

        public AutoCar() { }

        public AutoCar(string type, string color, int maxSpeed)
        {
            Type = type;
            Color = color;
            _maxSpeed = maxSpeed;
        }
    }
}
