// GraphicsMain.java

// Written by: Mason Zhu
// Date: May 17, 2024
// Main Class of imageEditor

import java.io.IOException;

import java.util.Scanner; 
import javax.swing.JFrame;
import javax.swing.JPanel;

public class GraphicsMain extends JFrame{

	public static void main(String[] args) throws IOException 
	{	

		Scanner sc = new Scanner(System.in);
		System.out.println("Enter file name, do not include any spaces nor .jpg; Example: 'MichaelScott'");
		
		String fileName = sc.nextLine();
		GraphicsMain window = new GraphicsMain();
		JPanel p = new JPanel();
		p.add(new GraphicsPanel(fileName));  //  add a class that extends JPanel
		window.setTitle("imageEditor");
		window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		window.setContentPane(p);

		window.pack();
		window.setLocationRelativeTo(null);
		window.setVisible(true);
	}

}
