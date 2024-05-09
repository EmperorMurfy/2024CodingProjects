
public class scoreMain {
	public static void main(String[] args) {
		score g = new score ("sukuna", "gojo");
		
		System.out.println(g.getScore());
		g.setScore(2);
		System.out.println(g.getScore());
		g.setScore(3);
		System.out.println(g.getScore());
		g.removeScore(1);
		
		System.out.println(g.getWinner());
		

		System.out.println(g.getScore());
		g.setScore(0);
		System.out.println(g.getScore());
		g.setScore(2);
		System.out.println(g.getScore());

		
		System.out.println(g.getWinner());
		
		
	}

}
