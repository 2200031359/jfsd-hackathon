<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>STudnet</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            min-height: 100vh;
            justify-content: flex-start; /* Align to the start */
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .container {
            flex: 1;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-left: 200px; /* Space for the sidebar */
            max-width: 100%; /* Allow container to span full width */
        }

        /* Sidebar styling */
        .sidebar {
            width: 200px;
            background-color: #666666; /* Light black */
            padding: 20px;
            color: white;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            text-align: center;
        }

        .sidebar .btn {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            margin: 10px 0;
            background-color: #333;
        }

        .sidebar .btn:hover {
            opacity: 0.8;
        }

        /* Main content section */
        .content {
            padding: 20px;
            text-align: center;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin: 10px;
            background-color: #666666; /* Light black */
        }

        .btn:hover {
            opacity: 0.8;
        }

        /* Square Boxes Styling */
        .topics-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }

        .topic-box {
            width: 120px;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #666666; /* Light black */
            color: white;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center; /* Ensures text is centered */
        }

        .topic-box:hover {
            background-color: #333;
        }

        /* Image styling */
        .image-container {
            text-align: center;
            margin-top: 20px;
        }

        .image-container img {
            width: 100%;           /* Makes the image span the full width of its container */
            max-width: 500px;      /* Increase the max-width to make the image larger */
            height: auto;          /* Maintains the aspect ratio */
            border-radius: 8px;
        }

        /* File Upload buttons Styling - Removed the buttons */
        .upload-form {
            display: flex;
            justify-content: center; /* Horizontally centers the content */
            align-items: center; /* Vertically centers the content */
            height: 200px; /* Adjust the height of the container to position the button */
            margin-top: 20px; /* Adds some spacing from the top */
        }

        .upload-form input[type="file"] {
            display: none; /* Hides the file input field */
        }

        /* Style for the Login Button */
        .login-btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .login-btn {
            padding: 10px 20px;
            background-color: #2e8b57;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }

        .login-btn:hover {
            background-color: #1e4d2b;
        }
    </style>
    <script>
        function redirectToLogin() {
            window.location.replace("/index.jsp"); // Redirects to the login page
        }
    </script>
</head>
<body>

    <!-- Sidebar with New Buttons -->
    <div class="sidebar">
        <h2>Dashboard</h2>
        <a href="/submission.jsp" class="btn">Submissions</a>
        <a href="/tests.jsp" class="btn">Tests</a>
        <a href="/internals.jsp" class="btn">Internals</a>
        <a href="/videos.jsp" class="btn">leturevideos</a>
        <a href="/feedback.jsp" class="btn">Feedback</a>
        <button class="login-btn" onclick="redirectToLogin()">logout<button>
    </div>

    <!-- Main content container -->
    <div class="container">
        <h1>Welcome to the Page</h1>

        <!-- Image Display -->
        <div class="image-container">
            <img src="images/student.jpeg" alt="Student Image" />
        </div>

        <!-- Small square boxes for Java, Python, DBMS -->
        <div class="topics-container">
            <div class="topic-box">Java</div>
            <div class="topic-box">Python</div>
            <div class="topic-box">DBMS</div>
            <div class="topic-box">Data Structures</div>
            <div class="topic-box">Algorithms</div>
        </div>

        <!-- File Submission Form with no visible file input -->
        <div class="upload-form">
            <form action="/upload" method="POST" enctype="multipart/form-data">
                <!-- Hidden File Input Field -->
                <input type="file" id="file-upload" name="file" required />
            </form>
        </div>

        <!-- Login Button with JavaScript Redirect -->
        <div class="login-btn-container">
            <button class="login-btn" onclick="redirectToLogin()">Login</button>
        </div>
    </div>

</body>
</html>
