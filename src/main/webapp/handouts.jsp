<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Handout</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        /* Navbar styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #28a745;
            padding: 10px 20px;
            color: white;
        }
        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
        }
        .navbar .nav-links {
            display: flex;
            gap: 15px;
        }
        .navbar .nav-links a {
            text-decoration: none;
            color: white;
            padding: 5px 10px;
            transition: background 0.3s;
        }
        .navbar .nav-links a:hover {
            background-color: #575757;
            border-radius: 5px;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #444;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="file"],
        textarea,
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        #status {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">Handout Upload</div>
        <div class="nav-links">
            <a href="#">View Lectures</a>
            <a href="/FacultyHome.jsp">Back</a>
        </div>
    </div>

    <!-- Form to upload handout -->
    <h1>Upload Handout</h1>
    <form id="uploadForm" action="/handouts/upload" method="post" enctype="multipart/form-data">
        <label for="file">Select Handout File (PDF only, max 2MB):</label>
        <input type="file" id="file" name="file" required><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" cols="50" placeholder="Add a description..."></textarea><br>

        <button type="submit">Upload Handout</button>
    </form>

    <div id="status"></div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const uploadForm = document.getElementById("uploadForm");
            const fileInput = document.getElementById("file");
            const statusElement = document.getElementById("status");

            uploadForm.addEventListener("submit", function (e) {
                const file = fileInput.files[0];

                // Check if a file is selected
                if (!file) {
                    statusElement.textContent = "Please select a file to upload.";
                    statusElement.className = "error";
                    e.preventDefault();
                    return;
                }

                // Validate file type (PDF only)
                const validTypes = ["application/pdf"];
                if (!validTypes.includes(file.type)) {
                    statusElement.textContent = "Only PDF files are allowed.";
                    statusElement.className = "error";
                    e.preventDefault();
                    return;
                }

                // Validate file size (2MB limit)
                const maxSize = 2 * 1024 * 1024; // 2MB in bytes
                if (file.size > maxSize) {
                    statusElement.textContent = "File size exceeds 2MB limit.";
                    statusElement.className = "error";
                    e.preventDefault();
                    return;
                }

                // Success message
                statusElement.textContent = "File is valid. Uploading...";
                statusElement.className = "success";
            });
        });
    </script>
</body>
</html>
