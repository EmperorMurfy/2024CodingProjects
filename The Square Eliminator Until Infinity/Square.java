//Class: Square

//Written by: Mason Z.
//Date: Feb 12, 2024
//Description: This class extends Shape, creating a square. It moves towards a certain direction, and then will bounce off the borders of the display.
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.Rectangle;

public class Square extends Shape{

	private int height;		


	// method: Default constructor - see packed constructors comments for a description of parameters.
	public Square(){
		this(0, 0, Color.red, 1, 1, 10);
	}

	// method: Shapes's packed constructor
	// description: Initialize a new Shape object.
	// parameters: 
	//			   x_coordinate - the initial x-coordinate for Character.
	//			   y_coordinate - the initial y-coordinate for Character.
	public Square(int x_coordinate, int y_coordinate, Color color, int vertical, int horizontal,  int height){
		super(x_coordinate, y_coordinate, color, vertical, horizontal); 						// Initial coordinates for the Shape.
		this.height = height;  
	}

	// method: contains
	// description: This method should return true if a point with coordinates x,y is inside of the shape
	// return: boolean - true if the point is inside the shape, false otherwise.
	public boolean contains(int x, int y){
		return new Rectangle(getX(), getY(), height, height).contains(new Point(x, y));
	}

	// method: move
	// description: This method moves the x and y of the shape when called on, and checks if it hits one of the borders (width and height) and reverses it's course (like a bounce)
	public void move() { //width: 800 height: 480

		setY(getY() + (1*getVertical()));
		if (getY() > 480 || getY() <= 0) {
			setVertical(-getVertical());
		}

		setX(getX() + (1*getHorizontal()));
		if (getX() > 800 || getX() <= 0) {
			setHorizontal(-getHorizontal());
		}



		// setY(getY() + 1); // height
		//width
	}

	// override this function so that each shape will return a different value when clicked.
	public int clicked() {
		return 1;
	}
	// method: draw
	// description: This method is used to draw the image onto the GraphicsPanel.
	// parameters: Graphics g - this object draw's the image.
	//			   Component c - this is the component that the image will be drawn onto.
	public void draw(Graphics g){
		Graphics2D g2 = (Graphics2D) g;
		g2.setColor(getColor());
		g2.fillRect(getX(), getY(), height, height);
	}
}
