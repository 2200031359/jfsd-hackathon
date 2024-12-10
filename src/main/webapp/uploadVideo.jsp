<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Lecture Video</title>
    <style>
        /* Basic styling for navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color:#28a745;
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
        body {
            font-family: Arial, sans-serif;
        }
        form {
            max-width: 500px;
            margin: 20px auto;
        }
        label {
            font-weight: bold;
        }
        input, textarea, button {
            width: 100%;
            margin: 10px 0;
            padding: 8px;
            box-sizing: border-box;
        }
        button {
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1em;
        }
        button:hover {
            background-color: #28a745;
        }
    </style>
    <script>
        function uploadVideo(event) {
            event.preventDefault(); // Prevent default form submission

            const videoData = {
                videoUrl: document.getElementById("videoUrl").value,
                videoTitle: document.getElementById("videoTitle").value,
                description: document.getElementById("description").value
            };

            fetch("/api/lectures/upload", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(videoData)
            })
            .then(response => {
                if (response.ok) {
                    alert("Video uploaded successfully!");
                } else {
                    alert("Failed to upload video.");
                }
            })
            .catch(error => console.error("Error:", error));
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">Lecture Videos</div>
        <div class="nav-links">
            <a href="/api/lectures">View Videos</a>
            <a href="/FacultyHome.jsp">Logout</a>
        </div>
    </div>

    <!-- Upload Form -->
    <h2 style="text-align: center;">Upload Lecture Video</h2>
    <form onsubmit="uploadVideo(event);">
        <label for="videoUrl">Video URL:</label>
        <input type="text" id="videoUrl" placeholder="Enter video URL" required>

        <label for="videoTitle">Video Title:</label>
        <input type="text" id="videoTitle" placeholder="Enter video title" required>

        <label for="description">Description:</label>
        <textarea id="description" placeholder="Enter video description"></textarea>

        <button type="submit">Upload Video</button>
    </form>
</body>
</html>
