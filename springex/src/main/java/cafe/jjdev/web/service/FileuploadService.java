package cafe.jjdev.web.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cafe.jjdev.web.FileRequest;
@Service
public class FileuploadService {
	public int fileupload(FileRequest fileRequest) {
		MultipartFile file = fileRequest.getFile();
		String fileName = file.getOriginalFilename();
				int pos = fileName.lastIndexOf(".");
				String ext = fileName.substring(pos);
				System.out.println("ext:"+ext);
				
				UUID uuid = UUID.randomUUID();
				String name = uuid.toString();
				name = name.replaceAll("-", "");
				System.out.println(name + "+ext");
				
				File destFile = new File("c:/upload/"+name+"."+ext);
				try {
					file.transferTo(destFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		// 1. 파일을 펄더 저장
		// 2. FileRequest -> FileVo
		// 3. FileDao.insertFile() 호출
		return 0;
	}
}
