// Graphics Panel

// Written by: Mason Z
// Date: May 20, 2024 (UPDATED WITH ASCII FUNCTION: Oct 5, 2024)
// Description: Graphic Panel of imageEditor
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JPanel;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class GraphicsPanel extends JPanel implements KeyListener{

	private BufferedImage image;
	private BufferedImage modifiedImage;
	private String imageName;

	final int PIX_SIZE = 10;


	// method: GraphicsPanel Constructor
	// description: This 'method' runs when a new instance of this class in instantiated.  It sets default values  
	// that are necessary to run this project.  You do not need to edit this method.
	public GraphicsPanel(String imageName) throws IOException{
		this.imageName = imageName;

		//establish File
		File file = new File("src/"+imageName+".jpg");  //enter your picture here

		//read into BufferedImage
		image = ImageIO.read(file);
		setPreferredSize(new Dimension(image.getWidth() * 2, image.getHeight()));

		modifiedImage = ImageIO.read(file);

		//investigate how pixels are represented numerically
		System.out.println(image.getRGB(50,50));  //prints the decimal representation of the pixel at position 50,50
		System.out.println(Integer.toHexString(image.getRGB(50,50)));  //prints the hexadecimal representation of the pixel at position 50,50
		System.out.printf("%x \n",image.getRGB(50,50));  //another way to print hexadecimal represenation


		// modifyPicture();

		//write to file
		ImageIO.write(image, "jpg",new File("new.jpg"));
		this.setFocusable(true);					     // for keylistener
		this.addKeyListener(this);

	}

	public void modifyPicture() {
		for(int i = 0; i < modifiedImage.getHeight(); i++)
			for(int j = 0; j < modifiedImage.getWidth(); j++)
				if (modifiedImage.getRGB(j, i) < 20) {
					modifiedImage.setRGB(j, i, ~modifiedImage.getRGB(j, i) + 200); 
				}
				else { 
					modifiedImage.setRGB(j, i, modifiedImage.getRGB(j, i) + 10); 
				}
		// this line set RGB 
	}

	public void invertImage() {
		for(int i = 0; i < modifiedImage.getHeight(); i++)
			for(int j = 0; j < modifiedImage.getWidth(); j++)
				modifiedImage.setRGB(j, i, ~modifiedImage.getRGB(j, i)); 
		// this line set RGB 
	}

	public void makeGray() {
		for(int i = 0; i < modifiedImage.getHeight(); i++) {
			for(int j = 0; j < modifiedImage.getWidth(); j++) {
				Color c = new Color(modifiedImage.getRGB(j,  i));
				System.out.println(modifiedImage.getRGB(j, i) + "");
				int green = c.getGreen();
				int red = c.getRed();
				int blue = c.getBlue();
				int gray = (green + blue + red)/3;
				Color g = new Color( gray, gray, gray);
				modifiedImage.setRGB(j, i, g.getRGB());
			}
		}	
	}

	public void invertRed() {
		for(int i = 0; i < modifiedImage.getHeight(); i++) {
			for(int j = 0; j < modifiedImage.getWidth(); j++) {
				Color c = new Color(image.getRGB(j,  i));
				int green = c.getGreen();
				int red = c.getRed();
				int blue = c.getBlue();
				int rgb = ((green << 8)  + blue + (~red<<16));

				modifiedImage.setRGB(j, i, rgb);
			}
		}	
	}
	public void makePixelated(int pixelSize) { // Use pixelSize for clarity

		for (int i = 0; i < modifiedImage.getHeight(); i += pixelSize) {
			for (int j = 0; j < modifiedImage.getWidth(); j += pixelSize) {
				Color c = new Color(image.getRGB(j, i));


				int red = 0;
				int  green = 0;
				int blue = 0;

				for (int a = i; a < i + pixelSize && a < modifiedImage.getHeight(); a++) {
					for (int b = j; b < j + pixelSize && b < modifiedImage.getWidth(); b++) {
						Color innerColor = new Color(image.getRGB(b, a));
						red += innerColor.getRed();
						green += innerColor.getGreen();
						blue += innerColor.getBlue();
					}
				}

				// calculate average rgb stuff 
				int numPixels = Math.min(pixelSize * pixelSize, (modifiedImage.getWidth() - j) * (modifiedImage.getHeight() - i));
				red /= numPixels;
				green /= numPixels;
				blue /= numPixels;

				// set everything in to that color 
				for (int a = i; a < i + pixelSize && a < modifiedImage.getHeight(); a++) {
					for (int b = j; b < j + pixelSize && b < modifiedImage.getWidth(); b++) {
						modifiedImage.setRGB(b, a, new Color(red, green, blue).getRGB());
					}
				}
			}
		}
	}
	public void rotateClockWise() throws IOException {

		int Width = modifiedImage.getHeight();
		int Height = modifiedImage.getWidth();
		BufferedImage rotatedImage = new BufferedImage(Width, Height, BufferedImage.TYPE_INT_ARGB);


		for (int y = 0; y < modifiedImage.getHeight(); y++) {
			for (int x = 0; x < modifiedImage.getWidth(); x++) {

				int rotatedX = Width - 1 - y;
				int rotatedY = x;

				rotatedImage.setRGB(rotatedX, rotatedY, modifiedImage.getRGB(x, y));
			}
		}
		modifiedImage = rotatedImage;
	}
	
// test ascii
	public String convertToAsciiArt(int pixelSize) {
		  StringBuilder asciiArt = new StringBuilder();
		  
		  for (int i = 0; i < modifiedImage.getHeight(); i += pixelSize) {
		    for (int j = 0; j < modifiedImage.getWidth(); j += pixelSize) {
		      int red = 0;
		      int green = 0;
		      int blue = 0;
		      
		      // Calculate average color within the pixel block
		      for (int a = i; a < i + pixelSize && a < modifiedImage.getHeight(); a++) {
		        for (int b = j; b < j + pixelSize && b < modifiedImage.getWidth(); b++) {
		          Color innerColor = new Color(modifiedImage.getRGB(b, a));
		          red += innerColor.getRed();
		          green += innerColor.getGreen();
		          blue += innerColor.getBlue();
		        }
		      }
		      
		      int numPixels = Math.min(pixelSize * pixelSize, (modifiedImage.getWidth() - j) * (modifiedImage.getHeight() - i));
		      
		      // Calculate average grayscale value
		      int average = (red + green + blue) / (3 * numPixels);
		      
		      // Choose ASCII character based on average grayscale value
		      char asciiChar = chooseAsciiChar(average);
		      
		      // Append the character to the ASCII art string
		      asciiArt.append(asciiChar);
		    }
		    asciiArt.append("\n"); // Add a newline character after each row
		  }
		  
		  return asciiArt.toString();
		}

		private char chooseAsciiChar(int average) {
		  // Define a mapping between grayscale values and ASCII characters
		  // Here's an example mapping, you can adjust it for better results
		  char[] charMap = {' ', '.', ',', '-', ':', '=', '+', '*', '#', '%'};
		  int threshold = 255 / (charMap.length - 1);
		  
		  for (int i = 0; i < charMap.length; i++) {
		    if (average <= i * threshold) {
		      return charMap[i];
		    }
		  }
		  
		  return charMap[charMap.length - 1]; // Return the darkest character for very bright pixels
		}
	
// test ascii


	public void reset() throws IOException {
		File file = new File("src/"+imageName+".jpg");
		modifiedImage = ImageIO.read(file);

	}


	public void keyPressed(KeyEvent e) {
		if (e.getKeyCode() == KeyEvent.VK_1) { // invert red
			invertRed();
			repaint();
		}

		else if(e.getKeyCode() == KeyEvent.VK_2) { // monochrome
			makeGray();
			repaint();
		}

		else if (e.getKeyCode() == KeyEvent.VK_3) { // invert image
			invertImage();
			repaint();
		}

		else if (e.getKeyCode() == KeyEvent.VK_4) { // pixelated
			makePixelated(10);
			repaint();
		}

		if (e.getKeyCode() == KeyEvent.VK_5) { // rotate clockwise
			try {
				rotateClockWise(); 
				repaint();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		else if (e.getKeyCode() == KeyEvent.VK_6) {
			int pixelSize = 3; // Adjust pixel size for desired detail
			String asciiArt = convertToAsciiArt(pixelSize);

			// Print or display the ASCII art string as needed
			System.out.println(asciiArt);
		}

		else if (e.getKeyCode() == KeyEvent.VK_0) { // reset
			try {
				reset();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			repaint();
		}
	}



	// method: paintComponent
	// description: This method is called when the Panel is painted.  It contains code that draws shapes onto the panel.
	// parameters: Graphics g - this object is used to draw shapes onto the JPanel.
	// return: void
	public void paintComponent(Graphics g){
		Graphics2D g2 = (Graphics2D) g;

		//ImageIcon imageIcon = new ImageIcon(image);

		new ImageIcon(image).paintIcon(this, g2, 0, 0);
		new ImageIcon(modifiedImage).paintIcon(this, g2, image.getWidth() + 1, 0);

	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub

	}

}
