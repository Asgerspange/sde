using static System.Console;

namespace Regnespil
{
    class Program
    {
        static void Main(string[] args)
        {
            ShowMainMenu();
        }

        static void ShowMainMenu(string difficulty = "Let", int minNumber = 1, int maxNumber = 10)
        {
            WriteLine("Du kan altid skrive 'menu' for at åbne denne menu");
            WriteLine("Vælg en disciplin:");
            WriteLine("1. Addition");
            WriteLine("2. Subtraktion");
            WriteLine("3. Multiplikation");
            WriteLine("4. Division");
            WriteLine("5. Sværhedsgrad");
            WriteLine("6. Afslut");
            WriteLine();
            WriteLine("Sværhedsgrad: " + difficulty);

            char choice = ReadKey().KeyChar;
            WriteLine();

            switch (choice)
            {
                case '1':
                    PlayGame(Operation.Addition, minNumber, maxNumber);
                    break;
                case '2':
                    PlayGame(Operation.Subtraction, minNumber, maxNumber);
                    break;
                case '3':
                    PlayGame(Operation.Multiplication, minNumber, maxNumber);
                    break;
                case '4':
                    PlayGame(Operation.Division, minNumber, maxNumber);
                    break;
                case '5':
                    ShowDifficultyMenu();
                    break;
                case '6':
                    Environment.Exit(0);
                    break;

                default:
                    WriteLine("Ugyldigt valg. Prøv igen.");
                    ShowMainMenu();
                    break;
            }
        }

        static void ShowDifficultyMenu()
        {
            WriteLine("Vælg sværhedsgrad:");
            WriteLine("1. Let");
            WriteLine("2. Middel");
            WriteLine("3. Svær");
            WriteLine("4. Meget Svær");
            WriteLine("5. Tilbage");

            char choice = ReadKey().KeyChar;
            WriteLine();

            switch (choice)
            {
                case '1':
                    ShowMainMenu("Let", 1, 10);
                    break;
                case '2':
                    ShowMainMenu("Middel", 1, 100);
                    break;
                case '3':
                    ShowMainMenu("Svær", -100, 100);
                    break;
                case '4':
                    ShowMainMenu("Meget svær", -125, 1000);
                    break;
                case '5':
                    ShowMainMenu();
                    break;
                default:
                    WriteLine("Ugyldigt valg. Prøv igen.");
                    ShowDifficultyMenu();
                    break;
            }
        }

        static void PlayGame(Operation operation, int minNumber, int maxNumber)
        {
            WriteLine($"Du har valgt {operation}.");

            switch (operation)
            {
                case Operation.Addition:
                    minNumber = minNumber;
                    maxNumber = maxNumber;
                    break;
                case Operation.Subtraction:
                    minNumber = minNumber;
                    maxNumber = maxNumber;
                    break;
                case Operation.Multiplication:
                    minNumber = minNumber;
                    maxNumber = maxNumber;
                    break;
                case Operation.Division:
                    minNumber = minNumber;
                    maxNumber = maxNumber;
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(operation), operation, null);
            }

            const int numberOfQuestions = 10;
            int score = 0;
            Random random = new Random();

            for (int i = 0; i < numberOfQuestions; i++)
            {
                int num1 = random.Next(minNumber, maxNumber + 1);
                int num2 = random.Next(minNumber, maxNumber + 1);
                double answer = AskQuestion(num1, num2, operation);
                double userAnswer;
                int attempts = 0;
                do
                {
                    string input = ReadLine();
                    if (input.ToLower() == "menu")
                    {
                        ShowMainMenu();
                        return;
                    }

                    if (!double.TryParse(input, out userAnswer))
                    {
                        WriteLine("Ugyldigt svar. Prøv igen.");
                        continue;
                    }

                    attempts++;
                    if (userAnswer == answer)
                    {
                        score++;
                        WriteLine("Korrekt!");
                        break;
                    }
                    else
                    {
                        WriteLine("Forkert svar. Prøv igen.");
                    }
                } while (attempts < 3);

                if (attempts == 3)
                {
                    WriteLine($"Desværre, det korrekte svar var {answer}");
                }
            }

            WriteLine($"Spillet er slut. Din score: {score}/{numberOfQuestions}");
            WriteLine();

            ShowMainMenu();
        }

        static double AskQuestion(int num1, int num2, Operation operation)
        {
            double answer = 0;
            switch (operation)
            {
                case Operation.Addition:
                    Write($"{num1} + {num2} = ");
                    answer = num1 + num2;
                    break;
                case Operation.Subtraction:
                    Write($"{num1} - {num2} = ");
                    answer = num1 - num2;
                    break;
                case Operation.Multiplication:
                    Write($"{num1} * {num2} = ");
                    answer = num1 * num2;
                    break;
                case Operation.Division:
                    Write($"{num1} / {num2} = ");
                    answer = (double)num1 / num2;
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(operation), operation, null);
            }

            return answer;
        }
    }

    enum Operation
    {
        Addition,
        Subtraction,
        Multiplication,
        Division
    }
}
