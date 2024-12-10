package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import klu.model.LectureVideos;

@Repository
public interface LectureVideosRepository extends JpaRepository<LectureVideos, Long> {
}