// class: ArticleList
// written by: Mason Z
// date: 12/21/2023
// description: This class contains an ArrayList of Articles that are fetched from newsapi.org. 
//              Several accessors and modifiers will be added.
// update info: Added method getArticlesSpecific

import parser.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class ArticleList {

	private ArrayList<Article> articles;
	private String topic; 


	public ArticleList(String topic) {
		articles = new ArrayList<>();

		ArticleGetter a = new ArticleGetter(topic, "YOUR API CODE HERE");
		JSONArray arr = a.getArticles();


		// if the JSON request was successful, arr will not be null, and we can loop
		// through the "articles" in arr, parse them using the JSONObjects, and add them
		// to the ArrayList articles
		if(arr != null) {
			for (int i = 0; i < arr.size(); i++) {
				JSONObject new_obj = (JSONObject) arr.get(i);
				articles.add(new Article(new_obj));
			}
		}
	}
	
	// method: setArrayList
	// description: sets array
	// parameter: article articles array
	// return: void
	public void setArraylist(ArrayList <Article> articles) {
		this.articles = articles;
	}
	
	// method: getArticlesSpecific
	// description: retrieves an article at a specific index or number
	// parameters: the index of article that one wants to be retrieved
	// return article at said index-1. So instead of index 0, it would be article ONE
	public Article getArticlesSpecific(int number){
		return articles.get(number);
	}

	// method: swap
	// description: Switches positions of article1 and article2 in articles. Remember that Articles are objects; You shouldn’t copy individual properties,
	//	              instead you should move objects.
	// parameters: the indexes of the two articles that should be swapped in the Arraylist
	// return: void
	public void swap(int article1, int article2) {
		Article temp  = articles.get(article1);
		articles.set(article1, articles.get(article2));
		articles.set(article2, temp);
	}


	// method: removeAuthor
	// description:  Removes all Articles that were written by author.
	// parameters: The author who's articles will be removed from the ArrayList
	// return:  void
	public void removeAuthor(String author) {
		for(int i = articles.size()-1; i >= 0; i--) {
			if(author.equals(articles.get(i).getAuthor())) {
				articles.remove(i);
			}
		}
	}


	// method: removeArticles
	// description:  Removes all Articles that were written before date. This method will be a bit tricky because you’ll need to make use of the Date class API. 
	// parameters: Three integers that represent the year, month and and date before which all articles will be removed
	// return:  void
	public void removeArticles(int year, int month, int date) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, date);   // year, month and date are all integers. 

		for (int i = articles.size()-1; i >= 0; i--) {
			if (articles.get(i).getDate().before(cal.getTime())) {
				articles.remove(i);
			}
		}	
	}

	// method: findKeyWord
	// description: Creates and returns an ArrayList of all Articles that contain word in their title.
	// parameters: String word - the word that you are looking for in the titles of Articles
	// return: An ArrayList of Articles who's title contains word.
	public ArrayList< Article > findKeyWord(String word) {
		ArrayList<Article> findWord = new ArrayList<>();
		for (Article i: articles) {
			if(i.getTitle().contains(word)) {
				findWord.add(i);
			}
		}
		return findWord;
	}


	// method: getArticles
	// description: Returns an ArrayList of all Articles that were written by author.
	// parameters: String author - the name of the author who's articles the method is looking for.
	// return: An ArrayList of Articles who's author is author.
	public ArrayList< Article > getArticles(String author) {
		ArrayList<Article> findAuthor = new ArrayList<>();
		for (Article i: articles) {
			if(author.equals(i.getAuthor())) {
				findAuthor.add(i);
			}
		}
		return findAuthor;
	}


	// method: getContent
	// description: Returns the content of the Article with the given title. If there isn't an article with
	//	              the given title, the function should return "article not found.
	// parameters: String title - the title of the article that the method is looking for.
	// return: A string that contains the content of the article with title. 
	public String getContent(String title) { 
		String content;

		for (Article i: articles) {
			if(title.equals(i.getTitle())) {
				content = i.getContent();
				return content;
			}
		}
		return "Article not found";
	}



	// method: getNumberOfArticles()
	// description: Returns the number of Articles in the ArrayList.
	// parameters: none
	// return: The number of articles in the Article arraylist.
	public int getNumberOfArticles() {
		int i = articles.size();
		return i;
	}


	// method: toString()
	// description: Returns a String representation of all Articles in the ArrayList. This string should contain the topic
	//	              for your Articles and how many there are, along with each Article separated by a newline, which can be
	//	              inserted into a string as “\n”.  
	// parameters: none
	// return: A string representation of Article list. An example of what this string would look like when printed is 
	//	         shown below.
	public String toString()  {
		String toString = "";
		for(Article i: articles) {
			toString+=i.toString()+"\n";
		}
		return "Topic: " + topic + "                                                                            Number of Articles: " + articles.size() + "\n" + toString; 
	}



}
