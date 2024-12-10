package klu.controller;

import klu.model.ErrorResponse;
import klu.model.Handout;
import klu.model.HandoutManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/handouts")
public class HandoutController {

    @Autowired
    private HandoutManager handoutService;

    @PostMapping("/upload")
    public ResponseEntity<?> uploadHandout(
            @RequestParam("file") MultipartFile file,
            @RequestParam("description") String description) {
        try {
            // Validate file size (e.g., max 10MB)
            long maxSize = 10 * 1024 * 1024; // 10MB in bytes
            if (file.getSize() > maxSize) {
                return ResponseEntity.badRequest().body(new ErrorResponse("File size exceeds 10MB limit.", 400));
            }

            Handout handout = handoutService.saveHandout(file, description);
            return ResponseEntity.ok("Handout uploaded successfully: " + handout.getFileName());
        } catch (Exception e) {
            e.printStackTrace(); // Log error
            return ResponseEntity.status(500).body(new ErrorResponse("Error uploading handout: " + e.getMessage(), 500));
        }
    }


    // Endpoint to fetch all handouts
    @GetMapping
    public ResponseEntity<?> getAllHandouts() {
        try {
            List<Handout> handouts = handoutService.getAllHandouts();
            return ResponseEntity.ok(handouts);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(new ErrorResponse("Error fetching handouts: " + e.getMessage(), 500));
        }
    }
}
