// Class: GraphicsPanel

// Written by: Mason Z.
// Date: Feb 12, 2024
// Description: This is the main class for the project, named "The Square Eliminator Until The Infinity"

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;

import javax.swing.JPanel;
import javax.swing.Timer;

public class GraphicsPanel extends JPanel implements MouseListener{

	private Timer t;							 // The timer is used to move objects at a consistent time interval.
	// score will be used to keep track of how the user is doing. It's up to you
	// to determine how the score is calculated.
	int score;
	int counter;
	int infinity = (int)(Math.random() * 1000);
	ArrayList<Shape> shapes;

	public GraphicsPanel(){
		score = 0;
		shapes = new ArrayList<Shape>();

		for (int i = 0; i < 40; i++) {
			shapes.add(new Square ((int)(Math.random( ) * 800),(int)(Math.random() *100), getRandomColor(), 1, 1, 25)); // add fourty squares into shapes
			if (0 == i%4) {
				shapes.add(new RedSquare ((int)(Math.random( ) * 800),(int)(Math.random() *100), Color.red, 2, 2, 25)); // add twenty squares into shapes
			}
		}



		setPreferredSize(new Dimension(800, 480));   // Set these dimensions to the width 
		//width height			 // of your background picture.   


		t = new Timer(20, new ClockListener(this));  // t is a timer.  This object will call the ClockListener's
		// action performed method every 5 milliseconds once the 
		// timer is started. You can change how frequently this
		// method is called by changing the first parameter.
		t.start();
		this.setFocusable(true);					 // for mouselistener
		this.addMouseListener(this);
	}

	// method: paintComponent
	// description: This method will paint the items onto the graphics panel.  This method is called when the panel is
	//   			first rendered.  It can also be called by this.repaint()
	// parameters: Graphics g - This object is used to draw your images onto the graphics panel.
	public void paintComponent(Graphics g){
		
		Graphics2D g3 = (Graphics2D) g;
		g3.setFont(new Font("Arial", 1, 20));
		g3.setColor(Color.red);
		g3.drawString("T-minus: " + (infinity-counter) + " Till Infinity", 0, 40);




		// Instead of drawing just a single square, you should use an enhanced for loop to iterate through your
		// ArrayList and draw all of your shapes.

		Graphics2D g2 = (Graphics2D) g;
		g2.setFont(new Font("Arial", 1, 36));
		g2.setColor(Color.red);
		

		for (Shape shape: shapes) {
			shape.draw(g2);
		}
		
		g2.drawString("" + score, 760, 40);
	}

	// method:clock
	// description: This method is called by the clocklistener every 5 milliseconds.  You should update the coordinates
	//				of one of your characters in this method so that it moves as time changes.  After you update the
	//				coordinates you should repaint the panel.
	public void clock(){
		// Instead of moving just a single square, you should use an enhanced for loop to iterate through your
		// ArrayList and move all of your shapes.

		if (counter > infinity) {
			shapes.add(new Circle((int)(Math.random( ) * 800), (int)(Math.random( ) * 800), 20, getRandomColor(), 1, 1));
		}

		for (Shape shape: shapes) {
			shape.move();
		}

		counter++;

		this.repaint();
		
		// System.out.println(score);
		
	
		System.out.println(shapes.size());
	}


	@Override
	public void mouseClicked(MouseEvent e) {
		System.out.println(e.getX() + " " + e.getY()); // the x and y coordinates for where the mouse was clicked.

		// Instead of checking just a single square, you should use an enhanced for loop to iterate through your
		// ArrayList and see if any of the shapes were clicked.

		for (int i = shapes.size()-1; i>= 0; i--) { // instead of advanced for loop which "works" but isn't how you're supposed to remove items, use traditional.
			if (shapes.get(i).contains(e.getX(), e.getY())) {
				score += shapes.get(i).clicked();
				System.out.println(score);
				shapes.remove(i);
			}
			 
		
		
			
			
		}
		
		
		

	}

	public Color getRandomColor() {
		int i = (int) (Math.random( ) * 4);

		if (i == 1) {
			return Color.orange;
		}

		else if (i == 2) {
			return Color.blue;
		}

		else if (i == 3) {
			return Color.green;
		}

		else if (i == 4) {
			return Color.yellow;
		}
		return Color.black;
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}
}
