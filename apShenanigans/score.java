
public class score {
	private String t1;
	private String t2;
	private boolean status;
	private int s1;
	private int s2;
	
	public score (String t1, String t2) {
		this.t1 = t1;
		this.t2 = t2;
		this.status = true;
		this.s1 = 0;
		this.s2 = 0;
	}
	
	public String getScore() { 
		String score = s1 + "-" + s2 + "-";
		if (status) {
			score += t1;
		}
		else if (!status) {
			score += t2;
		}
		
		return score;
	}
	
	public void setScore(int points) {
		if (status) {
			s1 += points;
			status = false;
		}
		
		else if (!status) {
			s2 += points;
			status = true;
		}
	}
	
	public void removeScore(int points) {
		if (status) {
			s1 -= points;
			status = false;
		}
		
		else if (!status) {
			s2 -= points;
			status = true;
		}
	}
	
	public String getWinner() {
		if (s1 > s2) {
			return t1;
		}
		
		else if (s2 > s1) {
			return t2;
		}
		
		else {
			return t1 + " and " + t2 + " are tied!";
		}
		
	}

}
