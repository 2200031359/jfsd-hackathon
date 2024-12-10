<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecture Videos</title>
    <script>
        // Function to fetch video data from the API and render it
        function loadVideos() {
            // Fetch all lecture videos from the server
            fetch('/api/lectures/videos')
                .then(response => response.json())
                .then(videos => {
                    if (Array.isArray(videos)) {
                        const tbody = document.getElementById('video-table-body');
                        tbody.innerHTML = '';
                        videos.forEach(video => {
                            const row = document.createElement('tr');
                            
                            const titleCell = document.createElement('td');
                            titleCell.textContent = video.videoTitle;
                            
                            const descriptionCell = document.createElement('td');
                            descriptionCell.textContent = video.description;
                            
                            const urlCell = document.createElement('td');
                            const videoLink = document.createElement('a');
                            videoLink.href = video.videoUrl;
                            videoLink.target = '_blank';
                            videoLink.textContent = 'Watch Video';
                            urlCell.appendChild(videoLink);
                            
                            row.appendChild(titleCell);
                            row.appendChild(descriptionCell);
                            row.appendChild(urlCell);
                            
                            tbody.appendChild(row);
                        });
                    } else {
                        console.error('Expected an array, but received:', videos);
                    }
                })
        }
        
        // Call the function to load videos when the page loads
        window.onload = loadVideos;
    </script>
    <style>
        /* Simple styling for the navbar */
        .navbar {
            background-color:#4CAF50;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            padding: 14px 20px;
            text-align: center;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <!-- Navbar with Logout button -->
    <div class="navbar">
        <a href="/home">Home</a>
        <a href="/lectures">Lectures</a>
        <a href="/profile">Profile</a>
        <a href="/StudentHome.jsp" id="logout">back</a> <!-- Logout Link -->
    </div>

    <h2>All Lecture Videos</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Video URL</th>
            </tr>
        </thead>
        <tbody id="video-table-body">
            <!-- Video rows will be inserted here dynamically using JavaScript -->
        </tbody>
    </table>
</body>
</html>
