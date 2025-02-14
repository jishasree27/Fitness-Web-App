package utils;

import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.*;

public class FileUploadUtil {
    
    public static String saveUploadedFile(Part filePart, String uploadDir) throws IOException {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();  // Extract the file name
        File uploadsDir = new File(uploadDir);
        
        // Ensure the directory exists
        if (!uploadsDir.exists()) {
            uploadsDir.mkdirs();  // Create directories if they don't exist
        }
        
        // Define the path where the file will be saved
        Path filePath = Paths.get(uploadDir, fileName);

        try (InputStream inputStream = filePart.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);  // Save the file
        }
        
        return filePath.toString();  // Return the path where the file was saved
    }
    public static byte[] saveUploadedFileToByteArray(Part part) throws IOException {
        InputStream inputStream = part.getInputStream();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, bytesRead);
        }
        return byteArrayOutputStream.toByteArray();
    }
	

}


