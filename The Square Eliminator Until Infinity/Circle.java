// Name: Mason Z.
// Date: Feb 12, 2024
// Title: Circle
// Description: creates a circle which moves like Square, except for lowered speeds. If eliminated, it deducts a point from the player
import java.awt.Color;
import java.awt.Graphics;

public class Circle extends Shape{

	private int radius;

	public Circle(int x, int y, int radius, Color color, int vertical, int horizontal) {
		super(x, y, color, vertical, horizontal);
		this.radius = radius;
	}


	// method: draw
	// description: this method draws a circle
	@Override
	public void draw(Graphics g) {
		g.setColor(getColor());
		g.fillOval(getX() - radius,  getY() - radius, 2* radius, 2* radius);

	}

	// method: move
	// description: This method moves the x and y of the shape when called on, and checks if it hits one of the borders (width and height) and reverses it's course (like a bounce)
	@Override
	public void move() { 

		setY(getY() + getVertical());
		if (getY() > 480 || getY() <= 0) {
			setVertical(-getVertical());
		}

		setX(getX() + getHorizontal());
		if (getX() > 800 || getX() <= 0) {
			setHorizontal(-getHorizontal());
		}


	}

	@Override
	public int clicked() {
		// TODO Auto-generated method stub
		return -1;
	}


	// method: contains
	// description: this method checks if the object was clicked
	@Override
	public boolean contains(int x, int y) {
		int dx = getX() - x;
		int dy = getY() - y;

		return dx*dx + dy *dy <= radius * radius;
	}

}
