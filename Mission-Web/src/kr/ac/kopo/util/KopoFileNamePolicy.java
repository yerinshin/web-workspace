package kr.ac.kopo.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class KopoFileNamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		String name = f.getName();
		String ext = "";
		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			ext = name.substring(dot); 
		} else {
			ext = "";
		}
		String str = "kopo" + UUID.randomUUID();    //UUID.randomUUID() : 32bit의 랜덤수 발생
		File renameFile = new File(f.getParent(), str + ext);
		return renameFile;
	}
}
