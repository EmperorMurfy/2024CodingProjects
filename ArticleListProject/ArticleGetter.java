// class: ArticleGetter

// written by: Mason Z.
// description: This class makes an API call to newsapi.org with a supplied topic and APIKey. 
//              getArticles returns a JSONArray with information about each article that this call
//              returns.

import java.net.HttpURLConnection;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.Scanner;

import parser.*;

public class ArticleGetter {

	private String topic;
	private String date;
	private String apiKey;

	public ArticleGetter(String topic, String apiKey) {
		this.topic = topic;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		
		Instant now = Instant.now(); //current date
		Instant before = now.minus(Duration.ofDays(14));
		date = formatter.format(Date.from(before));
		// set this string equal to your apikey from newsapi.org
		this.apiKey = apiKey;
	}

	// method: getArticles()
	// description: This function makes an API call to newsapi.org with the object's topic and API key.
	// parameters: none
	// return: JSONArray -> an object that contains information about each Article that was returned
	//                      from the JSON request. This JSONArray will be used to add articles to 
	//                      an ArrayList.
	public JSONArray getArticles() {
		try {

			URL url = new URL("https://newsapi.org/v2/everything?q=" + topic + "&from=" + date + "&sortBy=publishedAt&apiKey=" + apiKey);
			
			System.out.println(url);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.connect();

			//Getting the response code
			int responsecode = conn.getResponseCode();

			if (responsecode != 200) {
				
				throw new RuntimeException("HttpResponseCode: " + responsecode);
			} else {

				String inline = "";
				Scanner scanner = new Scanner(url.openStream());

				//Write all the JSON data into a string using a scanner
				while (scanner.hasNext()) {
					inline += scanner.nextLine();
				}
				
				//Close the scanner
				scanner.close();

				//Using the JSON simple library parse the string into a json object
				JSONParser parse = new JSONParser();
				JSONObject data_obj = (JSONObject) parse.parse(inline);


				JSONArray arr = (JSONArray) data_obj.get("articles");
				
				return arr;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}