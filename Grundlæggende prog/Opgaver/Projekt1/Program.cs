using static System.Console;
 
namespace Projekt1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            WriteLine(AddAndMultiply(2, 4, 5));
            WriteLine();
            WriteLine(CelsiusToFahrenheit(-300));
            WriteLine();
            WriteLine(ElementaryOperations(5, 0));
            WriteLine();
            WriteLine(IsResultTheSame(2+2, 2*2));
            WriteLine();
            WriteLine(ModuloOperation(8, 5, 2));
            WriteLine();
            WriteLine(TheCubeOf(3));
            WriteLine();
            WriteLine(SwapTwoNumbers(5, 10));
        }

        static int AddAndMultiply(int a, int b, int c)
        {
            return (a + b) * c;
        }

        static string CelsiusToFahrenheit(double celsius)
        {
            if (celsius < -273.15)
            {
                return "Temperature is below absolute zero!";
            }

            return $"{celsius}°C is {celsius * 9 / 5 + 32}°F";
        }

        static string ElementaryOperations(int a, int b)
        {
            try 
            {
                int c = a / b; 
            }
            catch (System.DivideByZeroException)
            { 
                return "Division by zero!"; 
            }

            return $"Addition: {a + b}\nSubtraction: {a - b}\nMultiplication: {a * b}\nDivision: {a / b}";
        }

        static bool IsResultTheSame(int a, int b)
        {
            return a == b;
        }

        static int ModuloOperation(int a, int b, int c)
        {
            return (a % b) % c;
        }

        static double TheCubeOf(double a)
        {
            return a * a * a;
        }

        static string SwapTwoNumbers(int a, int b)
        {
            int temp = a;
            a = b;
            b = temp;

            return $"a = {a}, b = {b}";
        }
    }
}