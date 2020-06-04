package com.nitcloud.netdisk.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.permission.FsAction;
import org.apache.hadoop.fs.permission.FsPermission;

import com.nitcloud.netdisk.domain.FileInfo;
import com.nitcloud.netdisk.domain.Share;


public class hdfs {

	private DealType dealType;
	static List<FileInfo> files;
	
	public static void main(String[] args) throws Exception {
		
		//hdfs.listAll("hdfs://192.168.56.100:9000", "hdfs://192.168.56.100:9000/usr");
		//hdfs.removeFile("hdfs://192.168.56.100:9000/usr/111111@qq.com");
		
		/*hdfs.renameFile("hdfs://192.168.56.100:9000", 
			"hdfs://192.168.56.100:9000/usr/111@qq.com/使用说明.txt", 
			"hdfs://192.168.56.100:9000/usr/111@qq.com/使用说明反对法.txt");*/
		files = new hdfs().getAllFileStatus("hdfs://192.168.56.100:9000", "hdfs://192.168.56.100:9000/usr/justgo");
		System.out.println("the files size is " + files.size());
		//hdfs.renameFile("hdfs://192.168.56.100:9000", "hdfs://192.168.56.100:9000/usr/Chen/新建文件夹", "hdfs://192.168.56.100:9000/usr/Chen/新建文件");
		//new hdfs().getTotalFiles("hdfs://192.168.56.100:9000", "hdfs://192.168.56.100:9000/usr/chen");
		//new hdfs().uploadFile("hdfs://192.168.56.100:9000", "hdfs://192.168.56.100:9000/usr/justgo", "D:/云盘web.docx");
		//String[] str = listAll("hdfs://192.168.56.100:9000/usr/dd123");

		/*for (int i = 0; i < str.length; i++) {
			System.out.println(str[i]);
		}*/
		//String str = "usr/pt/456.djkfj.123.txt";
		//System.out.println("########:"+getfilelastname(str));
		System.out.println("execute Ok");
	}
	
	public  List<String> listAll(String root, String Dir) throws IOException {

		List<String> lists = new ArrayList<String>();
		
		Configuration conf = new Configuration();   
		conf.set("fs.default.name", root);
		FileSystem fs = FileSystem.get(conf);

		FileStatus[] stats = fs.listStatus(new Path(Dir));

		for (int i = 0; i < stats.length; ++i) {
			lists.add(stats[i].getPath().toString());
		}

		fs.close();
		
		return lists;
	}
	

	public  boolean removeFile(String hdfspath) throws IOException {
		Configuration conf = new Configuration();

		Path delefPath = new Path(hdfspath);
		FileSystem hdfs = delefPath.getFileSystem(conf);

		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL, FsAction.ALL);
		hdfs.setPermission(delefPath, permission);

		boolean retval = false;

		if (hdfs.exists(delefPath)) {
			retval = hdfs.delete(delefPath, true);
			hdfs.close();
		}
		
		return retval;
	}


	/*public static boolean removeDir(String hdfsDir) throws IOException {
			
		Configuration conf = new Configuration();
		//conf.set("fs.default.name", GetProperties.hdfsConfigSet);
		FileSystem fs = FileSystem.get(conf);

		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL,
				FsAction.ALL);
		fs.setPermission(new Path(hdfsDir), permission);

		boolean retval = fs.delete(new Path(hdfsDir));
		
		fs.close();
		return retval;
	}*/

	// move
	public boolean moveFile(String root, String oldPath, String newPath)
			throws IOException {
	
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		
		FileSystem fs = FileSystem.get(conf);
		
		fs.moveFromLocalFile(new Path(oldPath), new Path(newPath));
		fs.close();
		
		return true;
	}

	public boolean copyFile(String root, String oldPath, String newPath)
			throws IOException {
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		
		FileSystem fs = FileSystem.get(conf);
		fs.copyToLocalFile(new Path(oldPath), new Path(newPath));
		fs.close();
		
		return true;
	}

	public boolean renameFile(String root, String oldPath, String newPath)
			throws IllegalArgumentException, IOException {
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		
		FileSystem fs = FileSystem.get(conf);
		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL,
				FsAction.ALL);
		fs.setPermission(new Path(oldPath), permission);
		boolean retval = fs.rename(new Path(oldPath), new Path(newPath));//
		fs.close();
		
		return retval;

	}

	public FileInfo getFileStatus(String root, String filepath) throws IOException {
		FileInfo fileinfo = new FileInfo();
		
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		
		FileSystem fs = FileSystem.get(conf);
		FileStatus[] stats = fs.listStatus(new Path(filepath));
		
		for (int i = 0; i < stats.length; i++) {
			String url = stats[i].getPath().toString();
			String size = "";
			
			if (stats[i].getLen()/1024.0/1024.0/1024.0>1)
			{
				 size = String.format("%.2f",stats[i].getLen()/1024.0/1024.0/1024.0)+"G";
			} else if (stats[i].getLen()/1024.0/1024.0>1){
				size = String.format("%.2f",stats[i].getLen()/1024.0/1024.0)+"M";
			} else {
				size = String.format("%.2f",stats[i].getLen()/1024.0)+"  K";
			}
			
			fileinfo.setSize(size);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			fileinfo.setDate(sdf.format(new Date(stats[i].getModificationTime())));
			fileinfo.setUrl(url);
			String []name = url.split("\\/");
			fileinfo.setFilename(name[name.length-1]);
			fileinfo.setIsdirectory(stats[i].isDirectory() ? 1 : 0);
			if(!stats[i].isDirectory()){
				fileinfo.setFiletype(dealType.getFileType(url));
			}else{
				fileinfo.setFiletype("dir");
			}
		}
		
		return fileinfo;
	}
	
	public List<FileInfo> getAllFileStatus(String root, String dir) throws IOException {
		
		List<FileInfo> files = new ArrayList<FileInfo>();
		
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		
		FileSystem fs = FileSystem.get(conf);
		FileStatus[] stats = fs.listStatus(new Path(dir));
		
		for (int i = 0; i < stats.length; i++) {
			String url = stats[i].getPath().toString();
			String size = "";
			
			if (stats[i].getLen()/1024.0/1024.0/1024.0>1)
			{
				 size = String.format("%.2f",stats[i].getLen()/1024.0/1024.0/1024.0)+"G";
			} else if (stats[i].getLen()/1024.0/1024.0>1){
				size = String.format("%.2f",stats[i].getLen()/1024.0/1024.0)+"M";
			} else {
				size = String.format("%.2f",stats[i].getLen()/1024.0)+"K";
			}
			
			FileInfo fileInfo = new FileInfo();
			
			fileInfo.setSize(size);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			fileInfo.setDate(sdf.format(new Date(stats[i].getModificationTime())));
			fileInfo.setUrl(url);
			String []name = url.split("\\/");
			fileInfo.setFilename(name[name.length-1]);
			fileInfo.setIsdirectory(stats[i].isDirectory() ? 1 : 0);
			if(!stats[i].isDirectory()){
				fileInfo.setFiletype(dealType.getFileType(url));
			}else{
				fileInfo.setFiletype("dir");
			}
			
			files.add(fileInfo);
		}
		
		
		/*System.out.println("the size is " + files.size());
		for(FileInfo fi : files) {
			System.out.println("the name is " + fi.getFilename());
			System.out.println("the type is " + fi.getFiletype());
			System.out.println("the url is " + fi.getUrl());
			System.out.println("the size is " + fi.getSize());
			System.out.println("the isdirectory is " + fi.getIsdirectory());
			System.out.println("the date is " + fi.getDate());
			
			System.out.println("Next One:");
		}*/
		
		
		return files;
	}
	
	public List<FileInfo> getShareFileStatus(String root, List<Share> shareList) throws IOException {
		
		List<FileInfo> files = new ArrayList<FileInfo>();
		
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		FileSystem fs = FileSystem.get(conf);
		
		if(shareList != null) {
			for(Share share : shareList) {
				FileStatus stats = fs.getFileStatus(new Path(share.getFilepath()));
				
				String url = stats.getPath().toString();
				String size = "";
				
				if (stats.getLen()/1024.0/1024.0/1024.0>1)
				{
					 size = String.format("%.2f",stats.getLen()/1024.0/1024.0/1024.0)+"G";
				} else if (stats.getLen()/1024.0/1024.0>1){
					size = String.format("%.2f",stats.getLen()/1024.0/1024.0)+"M";
				} else {
					size = String.format("%.2f",stats.getLen()/1024.0)+"K";
				}
				
				FileInfo fileInfo = new FileInfo();
				
				fileInfo.setSize(size);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				fileInfo.setDate(sdf.format(new Date(stats.getModificationTime())));
				fileInfo.setUrl(url);
				String []name = url.split("\\/");
				fileInfo.setFilename(name[name.length-1]);
				fileInfo.setIsdirectory(stats.isDirectory() ? 1 : 0);
				if(!stats.isDirectory()){
					fileInfo.setFiletype(dealType.getFileType(url));
				}else{
					fileInfo.setFiletype("dir");
				}
				
				files.add(fileInfo);
				
			}
		} 

		/*System.out.println("the size is " + files.size());
		for(FileInfo fi : files) {
			System.out.println("the name is " + fi.getFilename());
			System.out.println("the type is " + fi.getFiletype());
			System.out.println("the url is " + fi.getUrl());
			System.out.println("the size is " + fi.getSize());
			System.out.println("the isdirectory is " + fi.getIsdirectory());
			System.out.println("the date is " + fi.getDate());
			
			System.out.println("Next One:");
		}*/
		
		return files;
	}
/*
	public static FileStatus getFileStatus(String filepath) throws IOException {
		Configuration conf = new Configuration();
		//conf.set("fs.default.name", GetProperties.hdfsConfigSet);
		FileSystem fs = FileSystem.get(conf);
		FileStatus status = fs.getFileStatus(new Path(filepath));
		return status;
	}

	//
	public static boolean isPathExists(String hdfsPath) throws IOException {
		Configuration conf = new Configuration();
		//conf.set("fs.default.name", GetProperties.hdfsConfigSet);
		FileSystem fs = FileSystem.get(conf);

		boolean exists = fs.exists(new Path(hdfsPath));
		if (!exists) {
			fs.mkdirs(new Path(hdfsPath));
			return false;
		}

		return true;
	}
*/
	public boolean createDir(String root, String hdfsPath, String dirName)
			throws IOException {
	
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		FileSystem fs = FileSystem.get(conf);
		String path = hdfsPath + "/" + dirName;

		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL, FsAction.ALL);
		fs.setPermission(new Path(hdfsPath), permission);

		boolean exists = fs.exists(new Path(path));
		
		if (!exists) {		
			return fs.mkdirs(new Path(path));
		} else {
			return true;
		}

	}

	public boolean uploadFile(String root, String hdfsPath, String filePath)
			throws IOException {
System.out.println("start to upload to hdfs!");
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		FileSystem hdfs = FileSystem.get(conf);

		Path src = new Path(filePath);
		Path dst = new Path(hdfsPath);

		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL,
				FsAction.ALL);
		hdfs.setPermission(dst, permission);

		hdfs.moveFromLocalFile(src, dst);
		hdfs.close();
System.out.println("end to upload to hdfs!");	
		return true;

	}
	
	
/*
	public static boolean downLoadFile2(String hdfsPath, String filePath)
			throws IOException {
		Configuration conf = new Configuration();
		Path hadoopPath = new Path(hdfsPath);
		FileSystem fs = FileSystem.get(URI.create(hdfsPath), conf);// error
		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL,
				FsAction.ALL);
		fs.setPermission(hadoopPath, permission);
		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		final OutputStream out = new FileOutputStream(filePath);
		ExecutorService cachedThreadPool = Executors.newSingleThreadExecutor();
		for (int i = 0; i < 10; i++) {

			System.out.println(" cachedThreadPool ..run+:" + i);
			final byte[] ioBuffer = new byte[2048];
			cachedThreadPool.execute(new Runnable() {
				public void run() {
					int readLen = 0;
					System.out.println(" cachedThreadPool erro---i+:" + ":"
							+ readLen);
					try {
						readLen = hdfsInStream.read(ioBuffer);
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						System.out
								.println(" cachedThreadPool erro----readLen+:"
										+ readLen);
					}
					while (-1 != readLen) {

						try {
							out.write(ioBuffer, 0, readLen);
							readLen = hdfsInStream.read(ioBuffer);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					try {
						Thread.sleep(2000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					System.out.println(" cachedThreadPool erro1----readLen+:"
							+ readLen);
				}
			});
		}

		System.out.println("DownLoad Done!");
		out.close();
		hdfsInStream.close();
		fs.close();
		cachedThreadPool.shutdown();
		return true;
	}

	public static boolean downLoadFile1(String hdfsPath, String filePath)
			throws IOException {
		Configuration conf = new Configuration();
		Path hadoopPath = new Path(hdfsPath);
		final FileSystem fs = FileSystem.get(URI.create(hdfsPath), conf);// error
		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		final OutputStream out = new FileOutputStream(filePath);
		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL,
				FsAction.ALL);
		fs.setPermission(hadoopPath, permission);

		new Thread() {
			@Override
			public void run() {
				final byte[] ioBuffer = new byte[2048];
				int readLen = 0;
				System.out.println(" cachedThreadPool erro1----readLen+:"
						+ readLen);
				try {
					readLen = hdfsInStream.read(ioBuffer);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					System.out.println(" cachedThreadPool erro----readLen+:"
							+ readLen);
				}
				while (-1 != readLen) {
					try {
						out.write(ioBuffer, 0, readLen);
						readLen = hdfsInStream.read(ioBuffer);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					System.out.println("#########:readlen+" + readLen);
				}

			}

		}.start();
		try {
			out.close();
			hdfsInStream.close();
			fs.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block

		}

		return true;
	}

	// 创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程
	public static boolean downLoadFile(String hdfsPath, String filePath)
			throws IOException {
		Configuration conf = new Configuration();
		Path hadoopPath = new Path(hdfsPath);
		FileSystem fs = FileSystem.get(URI.create(hdfsPath), conf);// error
		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		final OutputStream out = new FileOutputStream(filePath);
		// 创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程
		ExecutorService cachedThreadPool = Executors.newCachedThreadPool();
		for (int i = 0; i < 5; i++) {
			int index = i;
			try {
				Thread.sleep(index * 1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println(" cachedThreadPool erro----sleep+:" + index
					* 1000);
			final byte[] ioBuffer = new byte[2048];
			cachedThreadPool.execute(new Runnable() {
				public void run() {
					int readLen = 0;
					int flag = 0;
					System.out.println(" cachedThreadPool erro---+:" + ":"
							+ flag);
					flag++;
					try {
						readLen = hdfsInStream.read(ioBuffer);
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						System.out
								.println(" cachedThreadPool erro----readLen+:"
										+ readLen);
					}
					while (-1 != readLen) {

						try {
							out.write(ioBuffer, 0, readLen);
							readLen = hdfsInStream.read(ioBuffer);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

					System.out.println(" cachedThreadPool erro1----+:" + flag);

				}

			});

		}

		System.out.println("DownLoad Done!");
		
		 * out.close(); hdfsInStream.close(); fs.close();
		 * cachedThreadPool.shutdown();
		 
		return true;
	}

	public static String[] listAll(String dir) throws IOException {
		Configuration conf = new Configuration();
		conf.set("fs.default.name", GetProperties.hdfsConfigSet);
		FileSystem fs = FileSystem.get(conf);

		FileStatus[] stats = fs.listStatus(new Path(dir));

		FsPermission permission = new FsPermission(FsAction.ALL, FsAction.ALL,
				FsAction.ALL);
		fs.setPermission(new Path(dir), permission);
		String[] dfname = new String[stats.length];

		filesnum = stats.length;

		for (int i = 0; i < stats.length; ++i) {
			dfname[i] = stats[i].getPath().toString();
		}

		fs.close();

		return dfname;
	}

	public static boolean downloadDir(String hdfsDir, String fileDir) {

		return true;
	}

	public static boolean uploadDir(String hdfsDir, String fileDir) {

		return true;
	}

	public static String filePathToName(String path) {

		int i = path.lastIndexOf('/');
		String name = path.substring(i + 1);
		return name;
	}
	public static String getfilelastname(String path){
		int i = path.lastIndexOf('.');
		String name = path.substring(i+1);
		return name;
	}*/

	public DealType getDealType() {
		return dealType;
	}
	@Resource
	public void setDealType(DealType dealType) {
		this.dealType = dealType;
	}

	public List<FileInfo> getTotalFiles(String root, String dir) throws IOException {
		
		files = new ArrayList<FileInfo>();
		
		getDirFiles(root, dir);
			
		return files;
	}
	
	//拿到文件夹下的所有文件,并且存到files里，
	public void getDirFiles(String root, String dir) throws IOException {
		Configuration conf = new Configuration();
		conf.set("fs.default.name", root);
		
		FileSystem fs = FileSystem.get(conf);
		FileStatus[] stats = fs.listStatus(new Path(dir));
		
		for (int i = 0; i < stats.length; i++) {
			String url = stats[i].getPath().toString();		
			//判断是不是文件夹，是的话直接跳过
			if(!stats[i].isDirectory()) {
				String size = "";
				
				if (stats[i].getLen()/1024.0/1024.0/1024.0>1)
				{
					 size = String.format("%.2f",stats[i].getLen()/1024.0/1024.0/1024.0)+"G";
				} else if (stats[i].getLen()/1024.0/1024.0>1){
					size = String.format("%.2f",stats[i].getLen()/1024.0/1024.0)+"M";
				} else {
					size = String.format("%.2f",stats[i].getLen()/1024.0)+"K";
				}
				
				FileInfo fileInfo = new FileInfo();
				
				fileInfo.setSize(size);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				fileInfo.setDate(sdf.format(new Date(stats[i].getModificationTime())));
				fileInfo.setUrl(url);
				String []name = url.split("\\/");
				fileInfo.setFilename(name[name.length-1]);
				fileInfo.setIsdirectory(stats[i].isDirectory() ? 1 : 0);
				if(!stats[i].isDirectory()){				
					fileInfo.setFiletype(dealType.getFileType(url));
				}			
				files.add(fileInfo);
			} else {
				//是文件夹的话递归遍历
				getDirFiles(root, url);
			}
		}
	}
}
