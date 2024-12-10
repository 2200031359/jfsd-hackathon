<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty-Added Tests</title>
    <style>
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

        .tests-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .tests-table th, .tests-table td {
            border: 1px solid #ccc;
            padding: 0.75rem;
            text-align: left;
        }

        .tests-table th {
            background-color: #333;
            color: white;
        }

        .tests-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
    <script>
        // JavaScript function to navigate back to the previous page
        function goBack() {
          location.replace("StudentHome.jsp")
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <button class="nav-button" onclick="goBack()">⬅ Back</button>
        <h1>Faculty-Added Tests</h1>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Tests List</h2>
        <p>Below are the tests added by faculty:</p>

        <!-- Tests Table -->
        <table class="tests-table">
            <thead>
                <tr>
                    <th>Test ID</th>
                    <th>Title</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <!-- Simulated Data -->
                <tr>
                    <td>101</td>
                    <td>Java Fundamentals Quiz</td>
                    <td>2024-12-01</td>
                    <td>2024-12-03</td>
                    <td>Basic questions on Java syntax and OOP principles.</td>
                </tr>
                <tr>
                    <td>102</td>
                    <td>HTML & CSS Quiz</td>
                    <td>2024-12-05</td>
                    <td>2024-12-07</td>
                    <td>Quiz covering HTML5 elements and CSS3 properties.</td>
                </tr>
                <tr>
                    <td>103</td>
                    <td>Database Management Test</td>
                    <td>2024-12-10</td>
                    <td>2024-12-12</td>
                    <td>Focuses on SQL queries, joins, and normalization.</td>
                </tr>
                <tr>
                    <td>104</td>
                    <td>Spring Framework Quiz</td>
                    <td>2024-12-15</td>
                    <td>2024-12-17</td>
                    <td>Questions related to Spring MVC, Dependency Injection, and Beans.</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
