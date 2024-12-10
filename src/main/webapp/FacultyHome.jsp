<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Home</title>
    <style>
        /* Style for buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin: 10px;
        }
        button:hover {
            background-color: #45a049;
        }

        /* Navigation bar styling */
        .navbar {
            background-color: #4CAF50; /* Green background */
            overflow: hidden;
            padding: 16px 0; /* Increased padding for height */
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 16px 20px; /* Increased padding for bigger buttons */
            text-decoration: none;
            font-size: 18px; /* Larger font size */
        }
        .navbar a:hover {
            background-color: #45a049; /* Slightly darker green */
            color: white;
        }

        /* Footer styling */
        .footer {
            background-color: #4CAF50; /* Green background */
            color: white;
            text-align: center;
            padding: 14px 0; /* Increased padding for footer */
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }

        /* Center the welcome message */
        .center {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        /* Resources Section Styling */
        .resources {
            background-color: #f4f4f4;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
        }

        .resources h3 {
            color: #333;
        }

        .resources ul {
            list-style-type: none;
            padding: 0;
        }

        .resources ul li {
            background-color: #e8e8e8;
            margin: 10px 0;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <!-- Navigation bar -->
    <div class="navbar">
        <a href="#home">Home</a>
        <a href="#quizHome" onclick="navigateToQuizHome()">Manage Quizzes</a>
        <a href="#handouts" onclick="navigateToHandouts()">Handouts</a>
        <a href="#materials" onclick="navigateToMaterials()">Letures Videos</a>
        <a href="#studentData" onclick="navigateToStudentData()">Student Data</a>
        <a href="#logout" onclick="logout()">Logout</a>
    </div>

    <!-- Centered welcome message -->
    
    <!-- Resources Section (New Section Added Here) -->
    <div class="resources">
        <h3>Resources Available</h3>
        <ul>
            <li>Lecture Slides</li>
            <li>Assignments</li>
            <li>Reading Materials</li>
            <li>Past Quizzes</li>
            <li>Student Reports</li>
        </ul>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>Faculty Management System &copy; 2024</p>
    </div>

    <script>
        function navigateToQuizHome() {
            location.replace("quizHome.jsp");
        }

        function navigateToHandouts() {
            location.replace("handouts.jsp");
        }

        function navigateToMaterials() {
            location.replace("uploadVideo.jsp");
        }

        function logout() {
            location.replace("index.jsp");
        }

        function navigateToStudentData() {
            location.replace("Studentdata.jsp");
        }
    </script>
</body>
</html>
