import java.util.Scanner;

// project: ArticleList
// description: This project will make an API call to newsapi.org, parse the data and then allow
//              the user to make execute several methods on the ArticleList.
// written by: Mason Z.
//date: 12/21/2023
//description: Added String Extention Menu
public class Main {

	// MAIN Bug: I encountered a minor issue, where the user after entering an input, must press enter a random amount of time for the program to run. 
	// This doesn't seem to corolate with 	sc.nextLine(); as it was added, and nothing changed.
	// Please run the program by entering selected input, clicking out of console, then clicking back in. It should run the code without the need to-
	// -press enter so many times. 

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.println("search for a topic");
		ArticleList a = new ArticleList(sc.nextLine());
		System.out.println(a);
		


		int options = 0;
		while (options != 13) {
			// Menu 
			System.out.println("\n" + "Main Menu" + "\n" + "1 - Swap Articles" + "\n" + "2 - Remove Author" + "\n" + "3 - Remove Article" + "\n" + "4 - Find Keyword" + "\n" + "5 - Get Article" + "\n" + "6 - Get Content" + "\n" + "7 - Get Number of Articles" + "\n" + "8 - To String" + "\n" + "9 - Ask for Specific Article" + "\n" + "13 - Exit");
			options = sc.nextInt();
			switch (options) {
			case 1: // WORKING - Swap Articles
				System.out.println("First Article?");
				int one = sc.nextInt();
				System.out.println("Second Article? ");
				int two = sc.nextInt();

				a.swap(one-1, two-1); // typing one would now be the very first article instead of second (since arrays start on zero)
				System.out.print(a);
				break;


			case 2:  // WORKING - Remove Author
				System.out.println("Author? ");
				sc.nextLine();
				String author = sc.nextLine();


				a.removeAuthor(author);
				System.out.print(a);
				break;

			case 3:  // WORKING - Remove Article
				System.out.println("Year? ");
				int year = sc.nextInt();
				System.out.println("Month? ");
				int month = sc.nextInt();
				System.out.println("Date? ");
				int date = sc.nextInt();

				a.removeArticles(year, month, date);
				System.out.print(a);
				break;

			case 4: // WORKING - Find Keyword
				System.out.println("Keyword? ");
				sc.nextLine();

				System.out.println(a.findKeyWord(sc.nextLine()));
				break;

			case 5:  // WORKING - Get Article
				System.out.println("Author? ");
				sc.nextLine();

				System.out.println(a.getArticles(sc.nextLine()));
				break;

			case 6: // WORKING - Get Content
				System.out.println("Title? ");
				sc.nextLine();

				System.out.println(a.getContent(sc.nextLine()));
				break;

			case 7: // WORKING - Get Number Of Articles
				System.out.println("There are " + a.getNumberOfArticles() + " articles found in your topic");
				break;

			case 8: // WORKING  - To String
				System.out.print(a);
				break;

			case 9:  // WORK IN PROGRESS - String Extension
				// Allow user to choose an index
				System.out.println("Article? (Enter Number 1 <-> Max Amount of Articles) ");
				int index = sc.nextInt()-1;

				// Looped Menu
				int choice = 0;
				while (choice !=5) {

					System.out.println("\n");
					System.out.println("Menu - String Extention");
					System.out.println("1 - Shout Word");
					System.out.println("2 - Word Swap");
					System.out.println("3 - Word Count");
					System.out.println("4 - Numerology");
					System.out.println("5 - Exit to Main Menu");
					choice = sc.nextInt();
					System.out.println("\n");

					switch (choice) {
					case 1: // WORKING - Shout Word
						System.out.println(" Enter a word to capitalize ");
						sc.nextLine();

						a.getArticlesSpecific(index).shoutWord(sc.nextLine()); 


						System.out.print(a.getArticlesSpecific(index));
						break;

					case 2: // WORKING - NEW BUG DETECTED FOR MAIN USEAGE, NOTED ON TOP - Word Swap
						System.out.println("Please input a word A");
						sc.nextLine();
						String wordA = sc.nextLine();

						System.out.println("Please input a word B");
						String wordB = sc.nextLine();

						a.getArticlesSpecific(index).wordSwap(wordA, wordB); 
						System.out.print(a.getArticlesSpecific(index));
						break;				
					case 3: // WORKING - Word Count
						System.out.println(a.getArticlesSpecific(index).wordCount() + " amount of words in Article: " + index+1);
						break;
					case 4:
						System.out.println(a.getArticlesSpecific(index).numerology() + " is YOUR numerology number for Article: " + index+1);
						break;
					}
				} 
				break;

			}
		}
	}
}




