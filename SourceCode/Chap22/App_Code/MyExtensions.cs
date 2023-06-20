using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MyExtensions의 요약 설명입니다.
/// </summary>
public static class MyExtensions
{
    public static int MySquare(this int i)
    {
        return i * i;
    }

    public static int MyCal(this int i, int x, int y)
    {
        return i + x + y;
    }
}