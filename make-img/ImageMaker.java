import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;


/**
 * Read boot.bin into Floppy.
 * Write Floppy to a floppy disk img file
 */
public class ImageMaker {
    private Floppy floppyDisk = new Floppy();
    private int  MAX_SECTOR_NUM = 18;
    private String kernelName = "";

    private void writeFileToFloppy(String fileName, boolean bootable, int cylinder,int beginSec) {
        File file = new File(fileName);
        InputStream in = null;

        try {
            in = new FileInputStream(file);
            byte[] buf = new byte[512];
            if (bootable) {
                buf[510] = 0x55;
                buf[511] = (byte) 0xaa;
            }

            while (in.read(buf) > 0) {
                //将内核读入到磁盘第0面，第0柱面，第1个扇区
                floppyDisk.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0, cylinder, beginSec, buf);
                beginSec++;

                if (beginSec > MAX_SECTOR_NUM) {
                    beginSec = 1;
                    cylinder++;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ImageMaker(String bootName, String kernelName) {
        writeFileToFloppy(bootName, true, 0, 1);
        this.kernelName = kernelName;
    }

    public void makeFloppy(String floppyName) {
        if(!this.kernelName.isEmpty())
        {
            writeFileToFloppy(this.kernelName, false, 1, 2);
        }
        floppyDisk.makeFloppy(floppyName);
    }

    public static void main(String[] args) {
        String imgName = args[0];
        String bootName = args[1];
        String kernelName = args[2];
      
        ImageMaker op = new ImageMaker(bootName, kernelName);
        op.makeFloppy(imgName);
    }
}