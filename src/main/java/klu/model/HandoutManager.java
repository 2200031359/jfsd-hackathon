package klu.model;

import klu.repository.HandoutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class HandoutManager {

    @Autowired
    private HandoutRepository handoutRepository;

    // Save a handout (including file upload)
    public Handout saveHandout(MultipartFile file, String description) throws IOException {
        if (!"application/pdf".equals(file.getContentType())) {
            throw new IllegalArgumentException("Only PDF files are allowed.");
        }
        if (file.getSize() > 2 * 1024 * 1024) { // 2MB limit
            throw new IllegalArgumentException("File size exceeds 2MB limit.");
        }

        Handout handout = new Handout();
        handout.setFileName(file.getOriginalFilename());
        handout.setFileType(file.getContentType());
        handout.setFileData(file.getBytes());
        handout.setDescription(description);

        return handoutRepository.save(handout);
    

    }
    public List<Handout> getAllHandouts() {
        return handoutRepository.findAll(); // Fetches all records from the handouts table
    }

}
