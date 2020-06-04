package com.nitcloud.netdisk.action;

import com.nitcloud.netdisk.utils.AES;
import com.nitcloud.netdisk.utils.DealFile;

class UploadFileThread extends Thread {
	
	private AES aes;
	private DealFile dealFile = new DealFile();
	
	private String uploadDir;
	private String filepath;
	private String key;
	private String iv;
	private boolean isEncryptAll;
	
	public UploadFileThread(boolean isEncryptAll, String uploadDir, String filepath, String key, String iv) {
		this.uploadDir = uploadDir;
		this.filepath = filepath;
		this.key = key;
		this.iv = iv;
	}
	@Override
	public void run() {
		aes = new AES();
		
		//��ʼ���ж��ļ��ļ��ܣ����ܺ���ļ����ԭ�����ļ��滻��
		//�ж���ȫ���ܻ��ǲ��ּ���
		if(isEncryptAll) {
			aes.encryptFileAll(filepath, key, iv);
		} else {
			aes.encryptFile(filepath, key, iv);
		}
		
		//���÷�װ���ķ��������ϴ����ϴ��ļ����ȴ���tomcat�£�Ȼ���ƶ���hdfs����
		dealFile.upload(uploadDir, filepath);
	}

}