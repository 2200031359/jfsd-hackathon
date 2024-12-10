package klu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import klu.model.LectureVideos;
import klu.model.LectureVideosService;

;

@Controller
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/lectures")
public class LectureVideosController {

    private final LectureVideosService lectureVideosService;

    @Autowired
    public LectureVideosController(LectureVideosService lectureVideosService) {
        this.lectureVideosService = lectureVideosService;
    }

    // Display all videos in JSP
    

    // Display the upload video form
  

    @PostMapping("/upload")
    public ResponseEntity<String> uploadVideo(@RequestBody LectureVideos video) {
        lectureVideosService.saveVideo(video);
        return ResponseEntity.ok("Video uploaded successfully!");
    }
    @GetMapping("/videos")
    @ResponseBody
    public List<LectureVideos> getAllLectures() {
        List<LectureVideos> videos = lectureVideosService.getAllVideos();
        System.out.println("Returned videos: " + videos); // Log the response to see what is being returned
        return videos;  // Ensure this returns a proper JSON array
    }



}
