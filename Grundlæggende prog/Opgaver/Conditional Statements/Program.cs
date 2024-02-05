using static System.Console;

namespace Conditional_Statements
{
    internal class Program
    {
        static void Main(string[] args)
        {
            WriteLine(AbsoluteValue(-5));
            WriteLine();
            WriteLine(DivisbleBy2Or3(2, 90));
            WriteLine();
            WriteLine(CheckIfStringIsUpperCase("ADA"));
            WriteLine();
            WriteLine(CheckIfGreaterThanThirdOne(new int[] { 2, 7, 12 }));
            WriteLine();
            WriteLine(CheckIfNumberIsEven(6));
            WriteLine();
            WriteLine(CheckIfSortedASC(new int[] { 1, 3, 2 }));
            WriteLine();
            WriteLine(CheckPositiveNegativeOrZero(-11));
            WriteLine();
            WriteLine(IsLeapYear(2024));
        }

        static int AbsoluteValue(int a)
        {
            return a < 0 ? -a : a;
        }

        static int DivisbleBy2Or3(int a, int b)
        {
            return (a % 2 == 0 && b % 3 == 0) || (a % 3 == 0 && b % 2 == 0) ? a * b : a + b;
        }

        static bool CheckIfStringIsUpperCase(string str)
        {
            if (str.Length != 3)
            {
                return false;
            }

            foreach (char c in str)
            {
                if (!char.IsLetter(c))
                {
                    return false;
                }
            }

            return str == str.ToUpper();
        }

        static bool CheckIfGreaterThanThirdOne(int[] arr)
        {
            int a = arr[0];
            int b = arr[1];
            int c = arr[2];

            return (a + b > c) || (a * b > c);
        }

        static bool CheckIfNumberIsEven(int a)
        {
            return a % 2 == 0;
        }

        static bool CheckIfSortedASC(int[] arr)
        {
            return arr[0] < arr[1] && arr[1] < arr[2];
        }

        static string CheckPositiveNegativeOrZero(int a)
        {
            return a > 0 ? "Positive" : a < 0 ? "Negative" : "Zero";
        }

        static bool IsLeapYear(int year)
        {
            return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
        }
    }
}
