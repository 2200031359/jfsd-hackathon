<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Internal Assessments</title>
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

        .internals-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .internals-table th, .internals-table td {
            border: 1px solid #ccc;
            padding: 0.75rem;
            text-align: left;
        }

        .internals-table th {
            background-color: #333;
            color: white;
        }

        .internals-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
    <script>
        // JavaScript function to navigate back to the previous page
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <button class="nav-button" onclick="goBack()">⬅ Back</button>
        <h1>Internal Assessments</h1>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Internal Assessments List</h2>
        <p>Below are the internal assessments for students:</p>

        <!-- Internal Assessments Table -->
        <table class="internals-table">
            <thead>
                <tr>
                    <th>Internal ID</th>
                    <th>Subject</th>
                    <th>Assessment Date</th>
                    <th>Max Marks</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <!-- Simulated Data -->
                <tr>
                    <td>201</td>
                    <td>Mathematics</td>
                    <td>2024-12-01</td>
                    <td>50</td>
                    <td>Algebra and Trigonometry test.</td>
                </tr>
                <tr>
                    <td>202</td>
                    <td>Physics</td>
                    <td>2024-12-03</td>
                    <td>40</td>
                    <td>Mechanics and Thermodynamics.</td>
                </tr>
                <tr>
                    <td>203</td>
                    <td>Computer Science</td>
                    <td>2024-12-05</td>
                    <td>60</td>
                    <td>Data Structures and Algorithms test.</td>
                </tr>
                <tr>
                    <td>204</td>
                    <td>English</td>
                    <td>2024-12-07</td>
                    <td>30</td>
                    <td>Grammar and Composition.</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
