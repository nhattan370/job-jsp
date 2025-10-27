package service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface UploadCloudinaryService  {
	String upload(MultipartFile file) throws IOException;
}
