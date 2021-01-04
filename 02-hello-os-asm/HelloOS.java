import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;


public class HelloOS {
    private ArrayList<Char> imgByteToWrite = new ArrayList<Char>();

    private void readKernelFromFile(String fileName) {
        try {
            File file = new File(fileName);
            InputStream in = new FileInputStream(file);
            int tempbyte;
            while ((tempbyte = in.read()) != -1) {
                imgByteToWrite.add(tempbyte);
            }
            in.close();
        } catch(IOException e) {
            e.printStackTrace();
            return;
        }
    }

    public HelloOS() {
        readKernelFromFile("boot.bin");
        
        int len = 0x1fe; // = 510
        int curSize = imgByteToWrite.size();
        // fill 0
        for (int k = 0; k < len - curSize; k++) {
            imgByteToWrite.add(0);
        }
        imgByteToWrite.add(0x55);
        imgByteToWrite.add(0xaa);

        len = 0x168000;  // = 1474560
        curSize = imgByteToWrite.size();
        // fill 0
        for (int l = 0; l < len - curSize; l++) {
            imgByteToWrite.add(0);
        }
    }

    /*
        Create a 1474560 bytes binary file
        Write imgContent to the start 512 bytes
    */
    public void makeFloppy(String floppyName)   {
        try {
            DataOutputStream out = new DataOutputStream(new FileOutputStream(floppyName));
            for (int i = 0; i < imgByteToWrite.size(); i++) {
                out.writeByte(imgByteToWrite.get(i).byteValue());
            }
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        HelloOS op = new HelloOS();
        op.makeFloppy("myos02.img");
    }
}