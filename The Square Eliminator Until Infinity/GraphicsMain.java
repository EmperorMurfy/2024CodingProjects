import java.io.IOException;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class GraphicsMain extends JFrame{ // do not have to be modified

	public static void main(String[] args){

		GraphicsMain window = new GraphicsMain();
	    JPanel p = new JPanel();
	    p.add(new GraphicsPanel()); 
	    window.setTitle("The Square Eliminator Until The Infinity"); // this can be changed
	    window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    window.setContentPane(p);
	    window.pack();
	    window.setLocationRelativeTo(null);
	    window.setVisible(true);
	}

}
