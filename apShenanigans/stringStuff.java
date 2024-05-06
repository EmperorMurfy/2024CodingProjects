
public class StringStuff {

	public static void main(String[] args) {

		String[] testTwo = {"last", "day", "of", "the", "school", "year"};

		System.out.println(strArrMethod(testTwo));

		
		for (int j = 0; j < 6; j++) {
			System.out.println( j);
		}
		
		String e = "str";
		
		System.out.println(e.indexOf("s"));
		
		System.out.println(calcMethod(16));
	}

	public static int strArrMethod(String[] arr)

	{
		int count = 0;

		String[] result = new String[arr.length];

		for (int j = 0; j < arr.length; j++)

		{

			String sm = arr[j];

			for (int k = j + 1; k < arr.length; k++)

			{

				if (arr[k].length() < sm.length())

				{

					sm = arr[k]; // Line 12
					count++;

				}

			}

			result[j] = sm;

		}
		return count;
	}
	
	public String doubleChar(String str) {
		  String str1 = "";
		  
		  for (int i = 0; i < str.length(); i++) {
		    str1+= str.charAt(i);
		    str1+= str.charAt(i);
		  }
		  return str1;
	}
	public static int calcMethod(int num)

	{

	if (num == 0)

	{

	return 10;

	}

	System.out.println(num);
	return num + calcMethod(num / 2);
	
	}



}
