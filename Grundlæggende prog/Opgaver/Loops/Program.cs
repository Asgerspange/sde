using static System.Console;
using System.Text.RegularExpressions;

namespace Loops
{
    internal class Program
    {
        static void Main(string[] args)
        {
            MultiplicationTable(10);
            WriteLine();
            WriteLine(ReturnBiggestNumber(new int[] { 31, 29, 3, 44, 5, 26, 77, 8, 9, 10 }));
            WriteLine();
            WriteLine(Two7sNextToEachOther(new int[] { 1, 2, 7, 7, 4, 5, 6, 7, 7, 8, 9 }));
            WriteLine();
            WriteLine(ThreeAdjacentNumbers(new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 }));
            WriteLine();
            SieveOfEratos(30);
            WriteLine();
            WriteLine(ExtractString("#abk#k##kk##"));
            WriteLine();
            WriteLine(FullSequenceOfLetters("ad"));
            WriteLine();
            WriteLine(SumAndAverage(1, 10));
            WriteLine();
            WriteLine(DrawTriangle(10));
            WriteLine();
            WriteLine(ToThePower(5, 5));
        }

        static void MultiplicationTable(int size)
        {
            for (int row = 1; row <= size; row++)
            {
                for (int column = 1; column <= size; column++)
                {
                    Write($" {row * column,4}");
                }
                WriteLine();
            }
        }

        static double ReturnBiggestNumber(int[] arr)
        {
            int max = arr[0];
            for (int i = 1; i < arr.Length; i++)
            {
                if (arr[i] > max)
                {
                    max = arr[i];
                }
            }

            return max;
        }

        static int Two7sNextToEachOther(int[] arr)
        {
            int count = 0;

            for (int i = 0; i < arr.Length - 1; i++)
            {
                if (arr[i] == 7 && arr[i + 1] == 7)
                {
                    count++;
                }
            }
            return count;
        }

        static bool ThreeAdjacentNumbers(int[] arr)
        {
            for (int i = 0; i < arr.Length - 2; i++)
            {
                if (arr[i] == arr[i + 1] - 1 && arr[i] == arr[i + 2] - 2)
                {
                    return true;
                }
            }
            return false;
        }

        static void SieveOfEratos(int n)
        {
            bool[] prime = new bool[n + 1];
            for (int i = 0; i < n; i++) //Får alle nummre mellem 1 og n
            {
                prime[i] = true;
            }

            for (int p = 2; p * p <= n; p++) //Får alle primtal mellem 2 og n
            {
                if (prime[p] == true)
                {
                    for (int i = p * p; i <= n; i += p)
                    {
                        prime[i] = false;
                    }
                }
            }

            for (int i = 2; i <= n; i++) //Printer alle primtal mellem 2 og n
            {
                if (prime[i] == true)
                {
                    Write(i + " ");
                }
            }
        }

        static string ExtractString(string input)
        {
            string pattern = @"##(.*?)##";

            Match match = Regex.Match(input, pattern);

            if (match.Success)
            {
                return match.Groups[1].Value;
            }

            return "No match found!";
        }

        static string FullSequenceOfLetters(string input)
        {
            string pattern = $@"{input[0]}(.*?){input[1]}";
            Match match = Regex.Match("abcdefghijklmnopqrstuvwxyz", pattern);

            if (match.Success)
            {
                return input[0] + match.Groups[1].Value + input[1];
            }

            return "No match found!";
        }

        static string SumAndAverage(int n, int m)
        {
            int sum = 0;
            int count = 0;

            for (int i = n; i <= m; i++)
            {
                sum += i;
                count++;
            }

            double average = (double)sum / count;

            return $"Sum: {sum}, Average: {average}";
        }

        static string DrawTriangle(int n)
        {
            string result = "";

            for (int i = 1; i <= n; i++)
            {
                int spaces = (n - i) / 2;

                result += new string(' ', spaces);

                for (int j = 1; j <= i; j++)
                {
                    result += "*";
                }

                result += "\n";
            }

            return result;
        }

        static double ToThePower(double a, double b)
        {
            return Math.Pow(a, b);
        }

    }
}
