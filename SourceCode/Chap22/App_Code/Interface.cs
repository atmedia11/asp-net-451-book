using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public interface IUSB
{
    string ReadData();
}

public class USBMemory : IUSB
{
    public string ReadData()
    {   
        return "USB 메모리로부터 데이터 읽음.";
    }
}

public class USBKeyboard : IUSB
{
    public string ReadData()
    {
        return "USB 키보드로부터 입력된 데이터 읽음.";
    }
}