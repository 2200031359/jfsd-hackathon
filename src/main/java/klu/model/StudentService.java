package klu.model;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import klu.repository.StudentRepository;


@Service
public class StudentService{

    @Autowired
    StudentRepository studentRepository;

    
    

    // Method to save a new student
    public String studentSave(Student student) {
        try {
            // Validate if the username is already taken
            if (studentRepository.validateUsername(student.getUsername()) > 0) {
                throw new Exception("401: Username already exists");
            }

            // Save the student
            studentRepository.save(student);
            return "200: Registration successful";
        } catch (Exception e) {
            return e.getMessage(); // Return error message
        }
    }

    // Method for student login
    public String loginStudent(String username, String password) {
        try {
            // Validate the student's credentials
            if (studentRepository.validateCredentials(username, password) == 0) {
                throw new Exception("401: Invalid credentials");
            }

            return "200: Login successful";
        } catch (Exception e) {
            return e.getMessage(); // Return error message
        }
    }

    // Method to get all students
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    // Method to update student details
    public String updateStudentData(Student student) {
        try {
            // Check if the student exists before updating
            Optional<Student> existingStudent = studentRepository.findById(student.getId());
            if (!existingStudent.isPresent()) {
                return "404: Student not found"; // Handle not found case
            }

            // Save updated student data
            studentRepository.save(student);
            return "200: Student updated successfully"; // Success message
        } catch (Exception e) {
            return "500: Error updating student: " + e.getMessage(); // Return error message
        }
    }

    // Method to delete student data by ID
    public String studentDeleteData(long id) {
        try {
            // Check if student exists and delete
            if (studentRepository.existsById(id)) {
                studentRepository.deleteById(id);
                return "200: Student deleted successfully";
            } else {
                return "404: Student not found"; // Handle not found case
            }
        } catch (Exception e) {
            return "500: Error deleting student: " + e.getMessage(); // Return error message
        }
    }

}