<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submissions</title>
    <style>
        /* CSS for styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .navbar {
            background-color: #333;
            color: white;
            padding: 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .navbar h1 {
            margin: 0;
            font-size: 1.5rem;
        }

        .nav-button {
            background-color: #555;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-size: 1rem;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .nav-button:hover {
            background-color: #777;
        }

        .content {
            padding: 2rem;
            max-width: 900px;
            margin: 0 auto;
        }

        .submissions-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .submissions-table th, .submissions-table td {
            border: 1px solid #ccc;
            padding: 0.75rem;
            text-align: left;
        }

        .submissions-table th {
            background-color: #333;
            color: white;
        }

        .submissions-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .action-btn {
            background-color: #333;
            color: white;
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-size: 0.9rem;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .action-btn:hover {
            background-color: #555;
        }
    </style>
    <script>
        // JavaScript function to navigate back to the previous page
        function goBack() {
            window.history.back();
        }

        // Function to simulate the start of the test
        function startTest(submissionId) {
            alert("Test " + submissionId + " has been started.");
            // Here, you can perform additional actions like redirecting to the test page
            window.location.href = "testPage.jsp?testId=" + submissionId;  // Example redirection
        }

        // Function to simulate reviewing the test
        function reviewTest(submissionId) {
            alert("Reviewing submission " + submissionId);
            // Here, you can add logic to navigate to the review page
            window.location.href = "reviewSubmission.jsp?submissionId=" + submissionId;  // Example redirection
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <button class="nav-button" onclick="goBack()">⬅ Back</button>
        <h1>Submissions</h1>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Submissions List</h2>
        <p>Here you can view all your quiz or assignment submissions.</p>

        <!-- Submissions Table -->
        <table class="submissions-table">
            <thead>
                <tr>
                    <th>Submission ID</th>
                    <th>Quiz/Assignment</th>
                    <th>Submitted On</th>
                    <th>Status</th>
                    <th>Action</th> <!-- New Action Column -->
                </tr>
            </thead>
            <tbody>
                <!-- Static sample rows with Action buttons -->
                <tr>
                    <td>1</td>
                    <td>Quiz: Java Basics</td>
                    <td>2024-12-01</td>
                    <td>Submitted</td>
                    <td>
                        <button class="action-btn" onclick="startTest(1)">Start</button>
                        <button class="action-btn" onclick="reviewTest(1)">Review</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Assignment: Design Patterns</td>
                    <td>2024-12-05</td>
                    <td>Reviewed</td>
                    <td>
                        <button class="action-btn" onclick="startTest(2)">Start</button>
                        <button class="action-btn" onclick="reviewTest(2)">Review</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Quiz: HTML and CSS</td>
                    <td>2024-12-07</td>
                    <td>Pending Review</td>
                    <td>
                        <button class="action-btn" onclick="startTest(3)">Start</button>
                        <button class="action-btn" onclick="reviewTest(3)">Review</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
