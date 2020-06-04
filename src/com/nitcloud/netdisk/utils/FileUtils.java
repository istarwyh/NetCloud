package com.nitcloud.netdisk.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;


public class FileUtils {

	public static void main(String[] args) throws IOException {
		//toByteArray("E:/Downloads/SQLFULL_CHS.iso");
		//readAndWriterBigFile("E:/Downloads/SQLFULL_CHS.iso", "E:/Downloads/SQLFULL_CHS_new.iso");
		
		File file = new File("E:/Downloads/npp.6.6.9.Installer.exe");
		
		InputStream fis = new FileInputStream(file);

		getBytesFromFile(fis);
		
		System.out.println("execute ok��");
	}

    
    public static void readAndWriterBigFile(String filename, String outfilename) {
    	RandomAccessFile randomFile = null;
        try {
            System.out.println("�����ȡһ���ļ����ݣ�");
            FileOutputStream fos = new FileOutputStream(outfilename);
            
            // ��һ����������ļ�������ֻ����ʽ
            randomFile = new RandomAccessFile(filename, "r");
            // �ļ����ȣ��ֽ���
            //long fileLength = randomFile.length();
            // ���ļ�����ʼλ��
            long beginIndex = 0;
            // �����ļ��Ŀ�ʼλ���Ƶ�beginIndexλ�á�
            randomFile.seek(beginIndex);
            byte[] bytes = new byte[10240];
           
            // һ�ζ�10���ֽڣ�����ļ����ݲ���10���ֽڣ����ʣ�µ��ֽڡ�
            // ��һ�ζ�ȡ���ֽ�������byteread
            while (randomFile.read(bytes) != -1) {
                //System.out.write(bytes, 0, byteread);
                fos.write(bytes);
                
                randomFile.seek(beginIndex+=10240);
            }
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (randomFile != null) {
                try {
                    randomFile.close();
                } catch (IOException e1) {
                }
            }
        }
    }

    
    public static void getBytesFromFile(InputStream fis) throws IOException{  
    	ByteArrayOutputStream swapStream = new ByteArrayOutputStream();  
		
        byte[] buff = new byte[1024];  
        
        int rc = 0;  
        
        while ((rc = fis.read(buff, 0, 1024)) > 0) {  
            swapStream.write(buff, 0, rc);  
        }  
        
        //byte[] src = swapStream.toByteArray(); 
    }
}

