package klu.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import klu.model.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {

    // Method to check if the username already exists
    @Query("select count(s) from Student s where lower(s.username) = lower(:uname)")
    public int validateUsername(@Param("uname") String uname);
    
    // Method to validate credentials by checking both username and password
    @Query("select count(s) from Student s where lower(s.username) = lower(:uname) and s.password = :pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
    
    // Method to find a student by their username
    Optional<Student> findByUsername(String username);
}
