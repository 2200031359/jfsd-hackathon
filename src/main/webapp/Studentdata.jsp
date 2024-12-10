<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Data</title>
    <link rel="stylesheet" type="text/css" href="css/student.css">
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }
        
        /* Sidebar */
        .sidebar {
            width: 200px;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #4CAF50; /* Green sidebar */
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 10px;
            border-radius: 4px;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }
        .sidebar ul li a:hover {
            background-color: #45a049; /* Slightly darker green on hover */
        }

        /* Main Content */
        .container {
            margin-left: 200px;
            padding: 20px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50; /* Green background for header */
            color: white;
        }

        /* Action Buttons */
        .update-btn, .delete-btn {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            border: none;
        }
        .update-btn {
            background-color: #4CAF50; /* Green */
            color: white;
        }
        .delete-btn {
            background-color: #f44336; /* Red for delete */
            color: white;
        }

        /* Update Form */
        #updateForm {
            display: none;
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        #updateForm h3 {
            margin-bottom: 10px;
        }
        #updateForm form {
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
            border-radius: 4px;
        }
        #updateForm label {
            display: block;
            margin-bottom: 5px;
        }
        #updateForm input[type="text"], #updateForm input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #updateForm button {
            background-color: #4CAF50; /* Green submit button */
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="FacultyHome.jsp">Dashboard</a></li>
            <li><a href="#">All Students</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="container">
        <table id="studentTable">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="studentData">
                <!-- Student data will be populated here using JavaScript -->
            </tbody>
        </table>

        <!-- Update Form (Initially Hidden) -->
        <div id="updateForm">
            <h3>Update Student</h3>
            <form id="studentUpdateForm">
                <label for="updateUsername">Username:</label><br>
                <input type="text" id="updateUsername" name="updateUsername" required><br>

                <label for="updateFirstName">First Name:</label><br>
                <input type="text" id="updateFirstName" name="updateFirstName" required><br>

                <label for="updateLastName">Last Name:</label><br>
                <input type="text" id="updateLastName" name="updateLastName" required><br>

                <label for="updatePassword">Password:</label><br>
                <input type="password" id="updatePassword" name="updatePassword" required><br>

                <!-- Hidden input to store Student ID -->
                <input type="hidden" id="updateId" name="updateId">

                <br>
                <button type="button" onclick="submitStudentUpdate()">Submit Update</button>
            </form>
        </div>
    </div>

    <!-- Script to handle API calls and update functionality -->
    <script type="text/javascript">
        // Function to make API requests
        function callApi(method, url, data, onSuccess, onError) {
            fetch(url, {
                method: method,
                headers: {
                    'Content-Type': 'application/json'
                },
                body: method === "GET" || method === "DELETE" ? null : JSON.stringify(data),
            })
            .then(response => response.json())
            .then(data => {
                if (onSuccess) onSuccess(data);
            })
            .catch(error => {
                if (onError) onError(error);
                console.error("API call failed:", error);
            });
        }

        // Function to fetch all student data from the backend
        function loadStudentData() {
            var url = "http://localhost:8080/student/readAll";  // Correct API endpoint
            console.log("Loading student data from: ", url);
            callApi("GET", url, null, displayStudentData);  // Use the callApi function to fetch data
        }

        // Callback function to display student data in the table
        function displayStudentData(response) {
            console.log("Received student data: ", response);
            var studentData = response;  // Directly use the response if it's already an array
            var studentTable = document.getElementById("studentData");

            // Clear existing table rows
            studentTable.innerHTML = "";

            // Populate table with student data
            studentData.forEach(function(student) {
                var row = "<tr>" +
                            "<td>" + student.id + "</td>" +
                            "<td>" + student.username + "</td>" +
                            "<td>" + student.firstName + "</td>" +
                            "<td>" + student.lastName + "</td>" +
                            "<td>" + student.password + "</td>" +
                            "<td>" +
                                "<button class='update-btn' onclick='populateStudentUpdateForm(" + JSON.stringify(student) + ")'>Update</button>" +
                                "<button class='delete-btn' onclick='deleteStudent(" + student.id + ")'>Delete</button>" +
                            "</td>" +
                          "</tr>";
                studentTable.innerHTML += row;
            });
        }

        // Function to populate update form with selected student's data
        function populateStudentUpdateForm(student) {
            document.getElementById("updateUsername").value = student.username;
            document.getElementById("updateFirstName").value = student.firstName;
            document.getElementById("updateLastName").value = student.lastName;
            document.getElementById("updatePassword").value = student.password;
            document.getElementById("updateId").value = student.id;
            document.getElementById("updateForm").style.display = "block";
        }

        // Function to submit student update
        function submitStudentUpdate() {
            var studentId = document.getElementById("updateId").value;
            var updatedData = {
                id: studentId,
                username: document.getElementById("updateUsername").value,
                firstName: document.getElementById("updateFirstName").value,
                lastName: document.getElementById("updateLastName").value,
                password: document.getElementById("updatePassword").value
            };

            // Show confirmation message before proceeding with the update
            var confirmUpdate = confirm("Are you sure you want to update this student?");
            
            if (confirmUpdate) {
                var url = "http://localhost:8080/student/update";  // Update API endpoint
                callApi("PUT", url, updatedData, function(response) {
                    console.log("Student updated successfully:", response);
                    alert("Student updated successfully!");  // Show success message

                    // Find the row in the table and update it directly
                    updateStudentTableRow(updatedData);

                    // Hide the update form automatically
                    document.getElementById("updateForm").style.display = "none";
                });
            }
        }

        // Function to update the student row in the table
        function updateStudentTableRow(updatedStudent) {
            var studentTable = document.getElementById("studentData");
            var rows = studentTable.getElementsByTagName("tr");
            
            // Find the row that corresponds to the updated student (based on student ID)
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                var cells = row.getElementsByTagName("td");
                
                if (cells.length > 0 && cells[0].innerText == updatedStudent.id) {
                    // Update the row with the new data
                    cells[1].innerText = updatedStudent.username;
                    cells[2].innerText = updatedStudent.firstName + " " + updatedStudent.lastName;
                    cells[3].innerText = updatedStudent.password;
                    break;
                }
            }
        }

        // Function to delete student
        function deleteStudent(studentId) {
            var url = "http://localhost:8080/student/delete/" + studentId;  // Delete API endpoint
            callApi("DELETE", url, null, function(response) {
                console.log("Student deleted: ", response);
                loadStudentData();  // Reload student data after deletion
            });
        }

        // Initial call to load student data on page load
        window.onload = function() {
            loadStudentData();
        }
    </script>

</body>
</html>
