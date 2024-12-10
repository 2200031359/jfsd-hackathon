// Define the function to make API requests
function callApi(method, url, data, onSuccess, onError) {
    fetch(url, {
        method: method,  // GET, POST, PUT, DELETE
        headers: {
            'Content-Type': 'application/json'
        },
        body: method === "GET" || method === "DELETE" ? null : JSON.stringify(data),  // Only add data for POST/PUT requests
    })
    .then(response => response.json())  // Parse JSON response
    .then(data => {
        if (onSuccess) onSuccess(data);  // Call onSuccess callback with response data
    })
    .catch(error => {
        if (onError) onError(error);  // Call onError callback in case of error
        console.error("API call failed:", error);
    });
}
