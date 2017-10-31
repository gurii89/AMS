package cafe.jjdev.web;

import org.springframework.web.multipart.MultipartFile;

public class FileRequest {
	private String fileTitle;
	private MultipartFile file;
	public String getFileTitle() {
		return fileTitle;
	}
	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "FileRequest [fileTitle=" + fileTitle + ", file=" + file + "]";
	}
}
