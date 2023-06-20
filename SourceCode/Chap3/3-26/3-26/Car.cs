using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_26
{
    class Car
    {
        public string type;     // 종류
        public string color;    // 색상
        public int maxSpeed;    // 최고 속도        

        // 기본 생성자
        public Car()
        {
            type = "기본 자동차";
            color = "Black";
            maxSpeed = 150;
        }

        // 사용자 정의 생성자
        public Car(string carType, string carColor, int carMaxSpeed)
        {
            type = carType;
            color = carColor;
            maxSpeed = carMaxSpeed;
        }

        public string GoStraight()
        {
            return "직진 프로세스 처리";
        }

        public string TurnRight()
        {
            return "우회전 프로세스 처리";
        }

        public string TurnLeft()
        {
            return "좌회전 프로세스 처리";
        }

        private string Reverse()
        {
            return "후진 프로세스 처리";
        }
    }
}
