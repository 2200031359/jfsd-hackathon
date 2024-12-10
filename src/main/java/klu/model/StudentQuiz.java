package klu.model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.*;
@Entity
@Table(name = "student_quiz")
public class StudentQuiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long quizId;

    private Long studentId;

    @CreationTimestamp
    private LocalDateTime attemptedAt;

    // Getters and Setters
}
