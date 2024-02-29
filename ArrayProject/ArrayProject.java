// project: Array's Project
// description: arrays project with four different programs
// name: Mason Z.
// date: Oct 10, 2023
import java.util.Scanner;
public class ArrayProject {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		for (int i = 1; i < 2; i++) {
			int options;
			
			// menu page
			System.out.println("1. Even - Odd - Negative Sorter ");
			System.out.println("2. Average, Then Numbers Greater Than It ");
			System.out.println("3. Score Average with Greatest/Least Value Removed");
			System.out.println("4. Game of Nim - Two Players Needed");
			System.out.println("9 to Exit");
			options = s.nextInt();
			
			// option one 
			if (options == 1) {
				// debug info: cleared! no bugs!
				// creates variables
				int [] negative = new int[10];
				int [] even = new int [10];
				int [] odd = new int [10];
				
				int negCount = 0;
				int evenCount = 0;
				int oddCount = 0;
		
				
				// request numbers
				for(int a = 0; a < 10; a++) {
					System.out.println("Number?");
					int number = s.nextInt();
					// check for value (number) status and designation (even, odd, negative) 
					if (number < 0) {
						negative[negCount] = number;
						negCount++;
					}else if (number % 2 == 0) {
						even[evenCount] = number; 
						evenCount++;
					}else {
						odd[oddCount] = number;
						oddCount++;
					}
				}
				
				// print out numbers based on designation
				System.out.println("Negatives: ");
				for(int b = 0; b < negCount; b++) {
					System.out.println(negative[b] + ", ");
				}
				System.out.println("Even: ");
				for(int c = 0; c < evenCount; c++) {
					System.out.println(even[c] + ", ");
				}
				System.out.println("Odd: ");
				for(int d = 0; d < oddCount; d++) {
					System.out.println(odd[d] + ", ");
				}
				
				// Add Space Before Menu (program restart)
				System.out.println("");
				
				// restarts loop and entire program
				i=0;
				
			
				
			}else if (options == 2) {
				// objective: take 10 numbers, find average, then output average, then find all the numbers greater than average inputted and list
				// restarts loop and entire program
				// debug menu: cleared! no bugs found. 
				int sum = 0;
				int[] numbers = new int[10];
				
				// Request 10 Numbers and add values to sum
				for (int d = 0; d < numbers.length; d++) {
					System.out.println("Number?");
					int number = s.nextInt();
					numbers[d] = number;
					sum += number;
				}
				
				// Solve Average and Print
				double average = (double)sum/numbers.length;
				System.out.println("Average: " + average);
				
				//Find All Numbers Greater Than Average and Print
				for (int e = 0; e < numbers.length; e++) {
					 if (numbers[e] > average) {
						 System.out.println(numbers[e]);
					 }
				} 
				
				// Add Space
				System.out.println("");
				// Restart Loop	
				i=0;
				
				
			}else if (options == 3) {
				// score average - evaluate 8 amount of numbers and remove the highest and lowest scores, then find the average
				// debug info: completed! no error as of right now. 
				
				// Initiate First Array To Request for Scores
				int[] scores = new int[8];
				
				// Request for Scores
				int lowest = 0;
				int highest = 8;
				
				int sum = 0;
				
				for (int e = 0; e < scores.length; e++) {
					System.out.println("Number?");
					scores[e] = s.nextInt();
					
					if (scores[e] < highest) {
						highest = scores[e];
					}else if (scores[e] > lowest) {
						lowest = scores[e];
					}
					
					// add score to sum regardless of value
					sum+=scores[e];
				}
				
				// solve for sum (removed highest/lowest)
				sum-=(lowest + highest);
				
				
				// return average
				System.out.println("Average with Greatest/Smallest Value REMOVED: " + (double)sum/6);
				
				
				// Add Space
				System.out.println("");
				
				
				i=0;
				
				
				
			}else if (options == 4) { 
				// game of nim - simple game of taking stones until the last stone remains, whoever takes last stone wins
				
				// gamePieces determine gamePiece amount displayed and turn determines if Player One or Player Two is moving
				int[] gamePieces = {3 , 4, 5};
				int turn = 1; 
				
				do {
					// display game pieces
					for(int f = 0; f < gamePieces.length; f++ ) {
						System.out.print("Row: ");
						for(int g = 0; g< gamePieces[f]; g++) {
							System.out.print("*");
						}
						System.out.println("");
					}

					// player one
					if(turn == 1) {
						// ask user for row and amount of stones and not over the amount available, then complete task
						System.out.println("Which row of stones do you wish to take from and how many stones?");
						int a = s.nextInt()-1;
						int b = s.nextInt();

						if(b <= gamePieces[a] && b >0 ) {
							gamePieces[a] -= b;
							System.out.println("Player 1 removed " + b + " of stones from row " + (a + 1));
						}
						else {
							System.out.println("There are not enough stones in selected row, please choose again");
						}
					}
					
					// player two
					if(turn == -1) {
						// ask user for row and amount of stones and not over the amount available, then complete task
						System.out.println("Which row of stones do you wish to take from and how many stones?");
						int a = s.nextInt()-1;
						int b = s.nextInt();

						if(b <= gamePieces[a] && b >0 ) {
							gamePieces[a] -= b;
							System.out.println("Player 2 removed " + b +" stones" +" from row " + (a + 1));
						}
						else {
							System.out.println("There are not enough stones in selected row, please choose again");
						}
					}
					
					// change between player one and player two 
					turn *= -1;
				} 
				
				// checks if there is any game pieces left
				while(gamePieces[0] + gamePieces[1] + gamePieces[2] > 0); 
				turn *= 1;
	
				// check who's turn it is and who won
				if(turn == 1) {
					System.out.println("Player 2 wins!");
				}
				else {
					System.out.println("Player 1 wins!");
				}
				
				// reloop program and adds space 
				System.out.println("");
				i=0;	
			}
			
			// exit loop
			else if (options == 9) {
				options = 2;
			}
			
			
			
		}
	}

}
