package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import klu.model.Student;
import klu.model.StudentService;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:8080")
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    // Save a new student
    @PostMapping("/save")
    public String saveStudent(@RequestBody Student student) {
        return studentService.studentSave(student);
    }

    // Get all students
    @GetMapping("/readAll")
    public List<Student> getAllStudents() {
        return studentService.getAllStudents();
    }

    // Update student data
    @PutMapping("/update")
    public String updateStudent(@RequestBody Student student) {
        try {
            return studentService.updateStudentData(student);
        } catch (Exception e) {
            return e.getMessage(); // Return the error message
        }
    }

    // Delete student by ID
    @DeleteMapping("/delete/{id}")
    public String deleteStudent(@PathVariable long id) {
        return studentService.studentDeleteData(id);
    }

    // Student login
    @PostMapping("/studentlogin")
    public String studentLogin(@RequestBody Student student) {
        return studentService.loginStudent(student.getUsername(), student.getPassword()); // Pass both username and password
    }
}
