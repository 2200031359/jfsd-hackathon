<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
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
            max-width: 600px;
            margin: 0 auto;
        }

        .feedback-form {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .feedback-form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .feedback-form input,
        .feedback-form select,
        .feedback-form textarea {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .feedback-form textarea {
            resize: vertical;
            height: 100px;
        }

        .submit-button {
            background-color: #333;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #555;
        }
    </style>
    <script>
        // JavaScript function to navigate back to the previous page
        function goBack() {
            window.history.back();
        }

        // JavaScript function to show alert on form submission
        function handleSubmit(event) {
            event.preventDefault(); // Prevent form from actually submitting
            alert('Feedback Submitted Successfully!');
            // Optionally reset form fields
            document.getElementById("feedbackForm").reset();
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <button class="nav-button" onclick="goBack()">⬅ Back</button>
        <h1>Feedback Form</h1>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>We Value Your Feedback</h2>
        <p>Please fill out the form below to provide your valuable feedback.</p>

        <!-- Feedback Form -->
        <form id="feedbackForm" onsubmit="handleSubmit(event)" class="feedback-form">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="feedbackType">Feedback Type</label>
            <select id="feedbackType" name="feedbackType" required>
                <option value="general">General</option>
                <option value="bug">Report a Bug</option>
                <option value="feature">Feature Request</option>
            </select>

            <label for="message">Feedback</label>
            <textarea id="message" name="message" placeholder="Write your feedback here..." required></textarea>

            <button type="submit" class="submit-button">Submit Feedback</button>
        </form>
    </div>
</body>
</html>
