// Not Original Code, Code example obtained in order to learn video to ASCII conversion
// Example code to use - March 1, 2024
// Converted Bad Apple into ASCII 
import java.awt.*;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.sound.sampled.*;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.io.FileReader;
import java.io.BufferedReader;

// music
class AudioPlayerExample1 implements LineListener {

    /**
     * this flag indicates whether the playback completes or not.
     */
    boolean playCompleted;

    /**
     * Play a given audio file.
     *
     * @param audioFilePath Path of the audio file.
     */
    void play(String audioFilePath) {
        File audioFile = new File(audioFilePath);

        try {
            AudioInputStream audioStream = AudioSystem.getAudioInputStream(audioFile);

            AudioFormat format = audioStream.getFormat();

            DataLine.Info info = new DataLine.Info(Clip.class, format);

            Clip audioClip = (Clip) AudioSystem.getLine(info);

            audioClip.addLineListener(this);

            audioClip.open(audioStream);

            audioClip.start();

            while (!playCompleted) {
                // wait for the playback completes
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
            }

            audioClip.close();

        } catch (UnsupportedAudioFileException ex) {
            System.out.println("The specified audio file is not supported.");
            ex.printStackTrace();
        } catch (LineUnavailableException ex) {
            System.out.println("Audio line for playing back is unavailable.");
            ex.printStackTrace();
        } catch (IOException ex) {
            System.out.println("Error playing the audio file.");
            ex.printStackTrace();
        }

    }

    /**
     * Listens to the START and STOP events of the audio line.
     */
    @Override
    public void update(LineEvent event) {
        LineEvent.Type type = event.getType();

        if (type == LineEvent.Type.START) {
            System.out.println("Playback started.");

        } else if (type == LineEvent.Type.STOP) {
            playCompleted = true;
            System.out.println("Playback completed.");
        }

    }
}

class Listener implements ActionListener {

    private String fileName;
    private int frameNum = 1;


    @Override
    public void actionPerformed(ActionEvent event) {

        if (frameNum == 6569) {
            System.exit(0);
        } else {
            frameNum++;
        }

        fileName = "res/data/out (" + frameNum + ").txt";
        FileReader fr = null;
        BufferedReader br = null;
        try {
            fr = new FileReader(fileName);
            br = new BufferedReader(fr);
            String temp;
            ArrayList<String> list = new ArrayList<>();
            while ((temp = br.readLine()) != null) {
                list.add(temp);
            }

            for (BadAppleFrame f :
                    BadApple.frameList) {
                f.panel.draw(list);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                fr.close();
                br.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

    }
}


class BadAppleFrame extends JFrame {
    public static int NUM = 1;
    public BadApplePanel panel;

    public BadAppleFrame(String type, int lineSpace) {
        int num = NUM;
        NUM++;

        panel = new BadApplePanel(type, lineSpace);
        getContentPane().add(panel);


        setTitle("BadApple" + num);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(650, 510);
        setVisible(true);
    }

    class BadApplePanel extends JPanel {
        private String type;
        private int start, end, j, lineSpace;
        private ArrayList<String> list;

        public BadApplePanel(String type, int lineSpace) {
            this.type = type;
            this.lineSpace = lineSpace;

        }

        public void draw(ArrayList<String> list) {
            this.list = list;
            j = 0;
            repaint();
        }

        public void paintComponent(Graphics g) {
            super.paintComponent(g);
            String temp;
            if (list == null) {
                return;
            }

            for (j = 0; j < list.size(); j++) {
                temp = list.get(j);
                StringTokenizer st = new StringTokenizer(temp);
                while (st.hasMoreTokens()) {
                    start = Integer.parseInt(st.nextToken());
                    end = Integer.parseInt(st.nextToken());

                    if (type.equals("pixel")) {
                        g.drawLine(start, j, end, j);
                    } else if (type.equals("oval")) {
                        if (j % lineSpace != 0) {
                            continue;
                        }
                        for (int k = 0; k < (end - start) / lineSpace; k++) {
//                            g.fillOval(start + k * lineSpace, j, lineSpace, lineSpace);
                            String s = "!#$%^&*(abcdfertgs)_+-=ouyjkmIYHK{}|][;':";
                            int ra = (int) (Math.random() * s.length());
                            g.drawString(s.substring(ra, ra + 1), start + k * lineSpace, j);
                        }
                    }
                }
            }
        }
    }


}

public class BadApple {
    public static ArrayList<BadAppleFrame> frameList;

    public static void main(String[] args) {
        BadApple.frameList = new ArrayList<>();
        frameList.add(new BadAppleFrame("pixel", 1));
        frameList.add(new BadAppleFrame("oval", 10));
        Listener listener = new Listener();

        Timer timer = new javax.swing.Timer(32, listener);

        timer.start();

        String audioFilePath = "res/BadApple.wav";
        AudioPlayerExample1 player = new AudioPlayerExample1();
        player.play(audioFilePath);
    }
}