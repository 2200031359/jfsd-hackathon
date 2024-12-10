package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import klu.model.Faculty;

public interface FacultyRepository extends JpaRepository<Faculty, String> {

    // Custom query to validate credentials for faculty
    @Query("select count(f) from Faculty f where f.username=:uname and f.password=:pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
}
