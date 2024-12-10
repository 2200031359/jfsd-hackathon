package klu.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.LectureVideosRepository;

import java.util.List;
import java.util.Optional;

@Service
public class LectureVideosService {

    private final LectureVideosRepository lectureVideosRepository;

    @Autowired
    public LectureVideosService(LectureVideosRepository lectureVideosRepository) {
        this.lectureVideosRepository = lectureVideosRepository;
    }

    // Save video
    public LectureVideos saveVideo(LectureVideos video) {
        return lectureVideosRepository.save(video);
    }

    public List<LectureVideos> getAllVideos() {
        return lectureVideosRepository.findAll();  // Fetches all videos from the database
    }

    // Get video by ID
    public Optional<LectureVideos> getVideoById(Long id) {
        return lectureVideosRepository.findById(id);
    }
}
