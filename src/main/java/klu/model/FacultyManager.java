package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.FacultyRepository;
import klu.model.Faculty;

@Service
public class FacultyManager {

    @Autowired
    private FacultyRepository facultyRepository;

    /**
     * Authenticates a faculty member using the provided username and password.
     *
     * @param uname The username of the faculty (assumed to be String).
     * @param pwd   The password of the faculty.
     * @return A response code as a string ("200" for success, "401" for unauthorized, "500" for server error).
     */
    public String loginFaculty(String uname, String pwd) {
        try {
            // Validate credentials using the repository
            int isValid = facultyRepository.validateCredentials(uname, pwd);

            if (isValid == 0) {
                // Return 401 Unauthorized if validation fails
                return "401"; 
            }

            // Fetch the faculty details using the repository (Assuming 'username' is unique)
            Faculty faculty = facultyRepository.findById(uname).orElse(null);

            if (faculty == null) {
                // Return 404 if faculty is not found
                return "404"; 
            }

            // Return "200" if faculty is found and login is successful
            return "200";
        } catch (Exception e) {
            // Log and return the exception message
            e.printStackTrace();
            return "500"; // Return a generic server error code
        }
    }
}
