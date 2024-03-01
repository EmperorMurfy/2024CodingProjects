// class: Article
// updated by: Mason Z.
// date: 12/21/2023

// description: Contains the implementation for an Article that is parsed from a JSONObject.
//              An Article will have a title, author, date and content along with all typical 
//              accessors and modifiers.

// update description: Added String Extention Accessors and Modifiers
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import parser.*;

public class Article {
	// instance fields
	private String title;
	private String author;
	private Date date;
	private String content;

	// constructor - passed a JSONObject, from which Article information is parsed.
	public Article(JSONObject input) {
		setAuthor((String)input.get("author"));
		setTitle((String) input.get("title"));
		setDate((String) input.get("publishedAt"));
		setContent((String) input.get("content"));
	}

	// setters
	public void setContent(String content) {
		this.content = content;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	// sets the date from a String. If a date can't be constructed from the supplied string
	// it will be set equal to today.
	public void setDate(String dateString) {

		// The newsapi includes a 'T' and 'Z', however or DateFormat will not, so remove
		// these extra characters.
		dateString = dateString.replace('T', '-')
				.substring(0, (dateString.indexOf('Z') != -1) ? dateString.indexOf('Z') : dateString.length());

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
		try {
			this.date = df.parse(dateString);
		} catch (ParseException e) {
			date = new Date();
		}
	}

	// getters
	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getContent() {
		return content;
	}

	public Date getDate() {
		return date;
	}

	// get's a string representation of date.
	public String getStringDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		return formatter.format(date);
	}

	public String toString() {
		return "title = " + getTitle() + "\n" +
				"author = " + getAuthor() + "\n" + 
				"date = " + getStringDate() + "\n" + 
				"content = " + getContent() + "\n";
	}

	// method: shoutWord
	// description:  Modifies the article so that every instance of the parameter word is all caps in the Article's content and title. Make sure that you only capitalize full words. For example, if the function was passed "the", it shouldn't capitalize letters in the word "theory", if it were to appear in either the title or content.
	// parameters: word - the word that will be capitalized.
	// return:  void
	public void shoutWord(String word) {
		String regex = "(?i)\\b" + word + "\\b"; // (?i) will let regex do insensitive matches - \\b sets a word boundary

		// Update the title and content by replacing all occurrences of the word with its uppercase equivalent.
		setTitle(getTitle().replaceAll(regex, word.toUpperCase()));
		setContent(getContent().replaceAll(regex, word.toUpperCase()));
	}

	// method: wordSwap
	// description:  Given two words, switch all occurances of the worst word with the second word, and all occurances of the second word with the first word. Again, make certain that you only swap full words.
	// parameters: word1 - the word that will be replaced, word2 - the word that it will be replaced with.
	// return:  void
	public void wordSwap(String word1, String word2) {
		String regexA = "(?i)\\b" + word1 + "\\b"; // (?i) - tells java to not care about cap sensitivity 
		String regexB = "(?i)\\b" + word2 + "\\b"; // \\b sets a non-word barrier to regex

		String temp = "word a";


		setTitle(title.replaceAll(regexA, temp)); // Word A -> Temp
		setTitle(title.replaceAll(regexB, word1)); // Word B -> Word A
		setTitle(title.replaceAll(temp, word2)); // Tempt -> Word B or (Word A -> Temp -> Word B)

		setContent(content.replaceAll(regexA, temp)); // Word A -> Temp
		setContent(content.replaceAll(regexB, word1)); // Word B -> Word A
		setContent(content.replaceAll(temp, word2)); // Tempt -> Word B or (Word A -> Temp -> Word B)
	}

	// method: wordCount
	// description: Find the number of words in the Article's content.
	// parameters: none
	// return: int - the number of words in the Article's content.
	public int wordCount() {
		int count = 0;
		String wordArray[] = getContent().split(" ");
		for (int i = 0; i < wordArray.length; i++) {
			count+=1;
		}
		return count;
	}

	// method: numerology
	// description:  Numerology is the study of the mystical relationships between numbers, letters, and patterns. Write a function that first switches the casing of all letters in the Article's title, and then finds the sum of the ASCII value of each character in the sentence.
	// parameters: none
	// return:  int - the sum of the ASCII value of each character in the Article's title after switching the casing of each letter.
	public int numerology() {
		int sum = 0;
		for (char c : getTitle().toCharArray()) { //turns to char
			if (Character.isUpperCase(c)) { //see if it isUpperCase and converts to ASCII while lowering 
				sum += (int)(Character.toLowerCase(c));

			} else {
				sum+= (int)(Character.toUpperCase(c));
			}
		}
		return sum;

	}



}

