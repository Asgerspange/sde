using static System.Console;

namespace Strings
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //WriteLine(AddSeparator("Hello", ","));
            //WriteLine();
            //WriteLine(IsPalindrome("racecar"));
            //WriteLine();
            //WriteLine(LengthOfString("Hello"));
            //WriteLine();
            //WriteLine(ReverseString("Hello"));
            //WriteLine();
            //WriteLine(CountWords("Hello World"));
            //WriteLine();
            //WriteLine(RevertWords("Hello World"));
            //WriteLine();
            WriteLine(CountOccurrences("Hello World", "Hello"));
            //WriteLine();
            //WriteLine(SortCharactersDescending("Hello World"));
            //WriteLine();
            //WriteLine(CompressString("Hello World"));
        }

        static string AddSeparator(string input, string separator)
        {
            return string.Join(separator, input.ToCharArray());
        }

        static bool IsPalindrome(string input)
        {
            return input == new string(input.Reverse().ToArray());
        }

        static int LengthOfString(string str)
        {
            return str.Length;
        }

        static string ReverseString(string str)
        {
            return new string(str.Reverse().ToArray());
        }

        static int CountWords(string str)
        {
            return str.Split(' ').Length;
        }

        static string RevertWords(string str)
        {
            return string.Join(" ", str.Split(' ').Reverse());
        }

        static int CountOccurrences(string sentence, string word)
        {
            return sentence.Split(word).Length - 1;
        }

        static string SortCharactersDescending(string str)
        {
            return string.Join("", str.OrderByDescending(x => x));
        }

        static string CompressString(string str)
        {
            return string.Join("", str.GroupBy(x => x).Select(x => x.Key + x.Count().ToString()));
        }
    }
}
