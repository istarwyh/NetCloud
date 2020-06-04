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
		
		//开始进行对文件的加密，加密后的文件会把原来的文件替换掉
		//判断是全加密还是部分加密
		if(isEncryptAll) {
			aes.encryptFileAll(filepath, key, iv);
		} else {
			aes.encryptFile(filepath, key, iv);
		}
		
		//调用封装过的方法就行上传，上传文件会先传到tomcat下，然后移动到hdfs上面
		dealFile.upload(uploadDir, filepath);
	}

}