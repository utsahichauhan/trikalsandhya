<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Shloka - Ramayan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .container-fluid { display: flex; }
        .content { margin-left: 260px; padding: 20px; width: 100%; }
        .form-container {
            max-width: 600px;
            margin: auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="sidebar">
            <%@ include file="admin_sidebar.jsp" %>
        </div>
        <div class="content">
            <h2 class="text-center">📖 Add New Shloka</h2>
            <div class="form-container">
                <form action="AddShlokServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Select Category:</label>
                        <select name="category" class="form-select" onchange="fetchAdhyayOptions()" required>
                            <option value="Ram-Seeta Milan">Ram-Seeta Milan</option>
                            <option value="Vanvas">Vanvas</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Select Adhyay (Chapter):</label>
                        <select name="adhyay_number" class="form-select" id="adhyayDropdown" required>
                            <!-- Options will be populated dynamically via AJAX -->
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Shloka (Sanskrit):</label>
                        <textarea name="shlok" class="form-control" rows="3" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gujarati Translation:</label>
                        <textarea name="translation_gujarati" class="form-control" rows="2" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">English Translation:</label>
                        <textarea name="translation_english" class="form-control" rows="2" required></textarea>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Add Shloka</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Function to fetch missing Adhyay options when category is selected
        function fetchAdhyayOptions() {
            var category = document.querySelector('[name="category"]').value;

            // If category is selected, fetch the missing Adhyay options
            if (category) {
                fetch('GetAdhyayOptionsServlet?category=' + category)
                    .then(res => res.text())
                    .then(data => {
                        document.getElementById("adhyayDropdown").innerHTML = data; // Populate the dropdown
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("Error fetching Adhyay options. Please try again later.");
                    });
            }
        }

        // Event listener to call the function when category changes
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelector('[name="category"]').addEventListener('change', fetchAdhyayOptions);

            // Call the function once on page load to populate the dropdown based on the initial category (if needed)
            fetchAdhyayOptions();
        });
    </script>
</body>
</html>
