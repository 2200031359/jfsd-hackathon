<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Home</title>
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-top: 20px;
        }

        h3 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .button-container {
            text-align: center;
            margin-bottom: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }

        td {
            background-color: #f9f9f9;
        }

        td button {
            background-color: #f44336;
            margin-right: 10px;
        }

        td button.update-btn {
            background-color: #4CAF50;
        }

        td button:hover {
            background-color: #45a049;
        }

        td button.delete-btn:hover {
            background-color: #e53935;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            table, th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Quizzes</h2>

        <!-- Button to create new quiz -->
        <div class="button-container">
            <button onclick="navigateToCreateQuiz()">Create New Quiz</button>
        </div>

        <h3>Existing Quizzes</h3>
        <table id="quizTable">
            <thead>
                <tr>
                    <th>Quiz Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Quiz list will be populated here by JavaScript -->
            </tbody>
        </table>
    </div>

    <script>
        // Function to navigate to Create Quiz page
        function navigateToCreateQuiz() {
            location.replace("createQuiz.jsp");
        }

        // Function to fetch quizzes from the server and display them
        function fetchQuizzes() {
            fetch('/api/quizzes')  // Your backend API endpoint to fetch quizzes
                .then(response => response.json())
                .then(data => {
                    const quizTableBody = document.querySelector('#quizTable tbody');
                    quizTableBody.innerHTML = '';  // Clear the table before populating

                    data.quizzes.forEach(quiz => {
                        const quizRow = document.createElement('tr');

                        const quizNameCell = document.createElement('td');
                        quizNameCell.textContent = quiz.quizName;

                        const startDateCell = document.createElement('td');
                        startDateCell.textContent = quiz.startDate;

                        const endDateCell = document.createElement('td');
                        endDateCell.textContent = quiz.endDate;

                        const actionsCell = document.createElement('td');
                        const updateButton = document.createElement('button');
                        updateButton.classList.add('update-btn');
                        updateButton.textContent = 'Edit';
                        updateButton.onclick = () => editQuiz(quiz.id);

                        const deleteButton = document.createElement('button');
                        deleteButton.classList.add('delete-btn');
                        deleteButton.textContent = 'Delete';
                        deleteButton.onclick = () => deleteQuiz(quiz.id);

                        actionsCell.appendChild(updateButton);
                        actionsCell.appendChild(deleteButton);

                        quizRow.appendChild(quizNameCell);
                        quizRow.appendChild(startDateCell);
                        quizRow.appendChild(endDateCell);
                        quizRow.appendChild(actionsCell);

                        quizTableBody.appendChild(quizRow);
                    });
                })
                .catch(error => console.error('Error fetching quizzes:', error));
        }

        // Function to edit quiz (navigates to the create quiz page with pre-filled data)
        function editQuiz(quizId) {
            location.replace("createQuiz.jsp?quizId=" + quizId);  // Pass quiz ID to pre-fill the form
        }

        // Function to delete quiz
        function deleteQuiz(quizId) {
            fetch(`/api/quizzes/${quizId}`, {
                method: 'DELETE',
            })
            .then(response => {
                if (response.ok) {
                    alert('Quiz deleted successfully!');
                    fetchQuizzes();  // Refresh the quiz list
                } else {
                    alert('Failed to delete quiz');
                }
            })
            .catch(error => console.error('Error deleting quiz:', error));
        }

        // Fetch quizzes when the page loads
        window.onload = fetchQuizzes;
    </script>
</body>
</html>
