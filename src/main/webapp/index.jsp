<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Updated navbar */
        nav {
            background-color: #2e8b57; /* Green color */
            padding: 20px 20px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #1e4d2b; /* Darker green */
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: auto;
        }

        footer p {
            margin: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            padding: 20px;
        }

        .form-container {
            width: 70%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .form-container .image-container {
            width: 45%;
            height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container .image-container img {
            height: 100%;
            width: auto;
            border-radius: 8px;
        }

        .form-container .role-container {
            width: 50%;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #2e8b57; /* Green color */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #1e4d2b; /* Darker green for hover */
        }

        .toggle-link {
            text-align: center;
            margin-top: 10px;
        }

        .toggle-link a {
            color: #007bff;
            text-decoration: none;
        }

        .toggle-link a:hover {
            text-decoration: underline;
        }

        #studentRegister {
            display: none;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav>
        <a href="#">TrackingAndManaginglearningOutcomes</a>
    </nav>

    <div class="container">
        <div class="form-container">
            <div class="image-container">
                <img src="images/project.jpg" alt="Login Image">
            </div>

            <div class="role-container">
                <h2>Select Role</h2>
                <div class="form-group">
                    <label>Select Role</label>
                    <select id="userRole" onchange="toggleRole()">
                        <option value="faculty">Faculty</option>
                        <option value="student">Student</option>
                    </select>
                </div>

                <!-- Faculty Login Form -->
                <div id="facultyLoginForm">
                    <h2>Faculty Login</h2>
                    <div class="form-group">
                        <label for="facultyUsername">Username</label>
                        <input type="text" id="facultyUsername" name="facultyUsername" placeholder="Enter faculty username" required />
                    </div>
                    <div class="form-group">
                        <label for="facultyPassword">Password</label>
                        <input type="password" id="facultyPassword" name="facultyPassword" placeholder="Enter faculty password" required />
                    </div>
                    <div class="form-group">
                        <button type="button" onclick="facultyLogin()">Login</button>
                    </div>
                </div>

                <!-- Student Login/Register Form -->
                <div id="studentLoginForm">
                    <h2>Student Login</h2>
                    <div id="studentLogin">
                        <div class="form-group">
                            <label for="studentUsername">Username</label>
                            <input type="text" id="studentUsername" name="studentUsername" placeholder="Enter student username" required />
                        </div>
                        <div class="form-group">
                            <label for="studentPassword">Password</label>
                            <input type="password" id="studentPassword" name="studentPassword" placeholder="Enter student password" required />
                        </div>
                        <div class="form-group">
                            <button type="button" onclick="studentLogin()">Login</button>
                        </div>
                        <div class="toggle-link">
                            <a href="javascript:void(0);" onclick="toggleStudentForm()">Don't have an account? Register</a>
                        </div>
                    </div>

                    <!-- Student Registration Form -->
                    <div id="studentRegister">
                        <h3>Student Registration</h3>
                        <div class="form-group">
                            <label for="registerUsername">Username</label>
                            <input type="text" id="registerUsername" name="registerUsername" placeholder="Enter username" required />
                        </div>
                        <div class="form-group">
                            <label for="registerPassword">Password</label>
                            <input type="password" id="registerPassword" name="registerPassword" placeholder="Enter password" required />
                        </div>
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" name="firstName" placeholder="Enter first name" required />
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" name="lastName" placeholder="Enter last name" required />
                        </div>
                        <div class="form-group">
                            <button type="button" onclick="registerStudent()">Register</button>
                        </div>
                        <div class="toggle-link">
                            <a href="javascript:void(0);" onclick="toggleStudentForm()">Already have an account? Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>All rights reserved &copy; KLU</p>
    </footer>

    <script>
        // Toggle between Faculty and Student forms based on the selected role
        function toggleRole() {
            const role = document.getElementById('userRole').value;
            if (role === 'faculty') {
                document.getElementById('facultyLoginForm').style.display = 'block';
                document.getElementById('studentLoginForm').style.display = 'none';
            } else {
                document.getElementById('facultyLoginForm').style.display = 'none';
                document.getElementById('studentLoginForm').style.display = 'block';
            }
        }

        // Toggle between student login and registration forms
        function toggleStudentForm() {
            const loginForm = document.getElementById('studentLogin');
            const registerForm = document.getElementById('studentRegister');
            
            if (loginForm.style.display === 'none') {
                loginForm.style.display = 'block';
                registerForm.style.display = 'none';
            } else {
                loginForm.style.display = 'none';
                registerForm.style.display = 'block';
            }
        }

        // Faculty Login Function
        function facultyLogin() {
            const username = document.getElementById('facultyUsername').value;
            const password = document.getElementById('facultyPassword').value;

            fetch('http://localhost:8080/faculty/facultylogin', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ username: username, password: password })
            })
            .then(response => response.text())
            .then(data => {
                if (data === '200') {
                    window.location.href = 'FacultyHome.jsp';  // Redirect to faculty home
                } else {
                    alert('Invalid credentials');
                }
            });
        }

        // Student Login Function
        function studentLogin() {
            const username = document.getElementById('studentUsername').value;
            const password = document.getElementById('studentPassword').value;

            fetch('http://localhost:8080/student/studentlogin', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ username: username, password: password })
            })
            .then(response => response.text())
            .then(data => {
                if (data === '200: Login successful') {
                    window.location.href = 'StudentHome.jsp';  // Redirect to student home
                } else {
                    alert('Invalid credentials');
                }
            });
        }

        // Student Registration Function
        function registerStudent() {
            const username = document.getElementById('registerUsername').value;
            const password = document.getElementById('registerPassword').value;
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;

            fetch('http://localhost:8080/student/save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ username: username, password: password, firstName: firstName, lastName: lastName })
            })
            .then(response => response.text())
            .then(data => {
                if (data.startsWith("200")) {
                    alert('Registration successful');
                    toggleStudentForm();  // Hide registration form and show login form
                } else {
                    alert('Registration failed: ' + data);
                }
            });
        }

        // Initialize the page with Faculty Login by default
        window.onload = function () {
            toggleRole(); // Set default to Faculty view
        }
    </script>

</body>

</html>