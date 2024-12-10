<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Created</title>
</head>
<body>
    <h1>Quiz Created Successfully!</h1>
    <h2>Quiz Details:</h2>
    <p>Quiz Name: ${quiz.quizName}</p>
    <p>Quiz Type: ${quiz.quizType}</p>
    <p>Start Date: ${quiz.startDate}</p>
    <p>End Date: ${quiz.endDate}</p>
    <p>Time Limit: ${quiz.timeLimit} minutes</p>
</body>
</html>
