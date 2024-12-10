<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Quiz</title>
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            height: 100%;
            width: 200px;
            background-color: #2ecc71; /* Green color */
            color: white;
            position: fixed;
            padding-top: 20px;
            padding-left: 15px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #27ae60; /* Slightly darker green */
        }

        /* Main content area */
        .main-content {
            margin-left: 220px;
            padding: 20px;
            width: 100%;
        }

        /* Form Container Styles */
        .container {
            width: 40%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: #2ecc71;
            text-align: center;
        }

        label {
            font-size: 16px;
        }

        input, select, button {
            font-size: 14px;
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        button {
            background-color: #2ecc71;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #27ae60;
        }

        .question {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="FacultyHome.jsp">Faculty Home</a> 
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h2>Create Quiz</h2>

            <form method="POST" action="/createQuiz">
                <label for="quizName">Quiz Name:</label>
                <input type="text" id="quizName" name="quizName" required><br><br>

                <label for="quizType">Quiz Type:</label>
                <select id="quizType" name="quizType" required>
                    <option value="mcq">MCQ</option>
                    <option value="text">Text-Based</option>
                </select><br><br>

                <label for="startDate">Start Date:</label>
                <input type="datetime-local" id="startDate" name="startDate" required><br><br>

                <label for="endDate">End Date:</label>
                <input type="datetime-local" id="endDate" name="endDate" required><br><br>

                <label for="timeLimit">Time Limit (minutes):</label>
                <input type="number" id="timeLimit" name="timeLimit" required><br><br>

                <div id="questionContainer"></div>

                <button type="button" onclick="addQuestion()">Add Question</button><br><br>
                <button type="submit">Create Quiz</button>
            </form>
        </div>
    </div>

    <script>
        let questionCount = 0;

        function addQuestion() {
            const questionContainer = document.getElementById("questionContainer");
            questionCount++;
            const questionDiv = `
                <div id="question${questionCount}" class="question">
                    <h3>Question ${questionCount}</h3>
                    <label for="questions[${questionCount}].questionText">Question:</label>
                    <input type="text" id="questions[${questionCount}].questionText" name="questions[${questionCount}].questionText" required><br><br>

                    <label for="questions[${questionCount}].optionA">Option A:</label>
                    <input type="text" id="questions[${questionCount}].optionA" name="questions[${questionCount}].optionA" required><br>
                    <label for="questions[${questionCount}].optionB">Option B:</label>
                    <input type="text" id="questions[${questionCount}].optionB" name="questions[${questionCount}].optionB" required><br>
                    <label for="questions[${questionCount}].optionC">Option C:</label>
                    <input type="text" id="questions[${questionCount}].optionC" name="questions[${questionCount}].optionC" required><br>
                    <label for="questions[${questionCount}].correctAnswer">Correct Answer:</label>
                    <input type="text" id="questions[${questionCount}].correctAnswer" name="questions[${questionCount}].correctAnswer" required><br><br>
                </div>
            `;
            questionContainer.insertAdjacentHTML('beforeend', questionDiv);
        }
    </script>

</body>
</html>
