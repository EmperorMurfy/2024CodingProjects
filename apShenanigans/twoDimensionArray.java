
public class twoDimensionArray {
  // two dimension array notes
	public static void main(String[] args) {
		int[][] numbers = {{1, 2, 3}, {4, 5, 6}};
		// [columns][rows]
		// 1 2 3
		// 4 5 6 

		System.out.println(numbers[0].length); // returns 3 -> rows length
		System.out.println(numbers.length); // returns 2 -> columns length 

		numbers[0][1] = 2;

		for(int[] rowOfStrings : numbers) { // column is y, this loops to the next 1D array within the 2D array
			for(int s : rowOfStrings) { // row is x, this loop checks every seperate 1D array
				System.out.print(s + " "); // each value in a row is separated
			}
			System.out.println(); // makes a gap between each 1D array via nextLine. 
		}

		String [][] array = new String [2][3];
		// [columns][rows]
		
		System.out.println(array[0].length); // returned 3
		System.out.println(array.length); // returned 2





	}
}

