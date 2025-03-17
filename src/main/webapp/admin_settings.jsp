<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - System Settings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .settings-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .settings-card {
            margin-bottom: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            padding: 20px;
        }
        .settings-card h4 {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 8px;
            padding: 10px;
            font-size: 1rem;
        }
        .form-control::placeholder {
            font-size: 0.9rem;
            color: #aaa;
        }
        .btn-primary {
            border-radius: 8px;
            padding: 10px 20px;
            background-color: #007bff;
            font-size: 1rem;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            color: #777;
        }
        /* Content area adjustment */
        .main-content {
            margin-left: 260px; /* Adjust for sidebar width */
            padding: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="admin_sidebar.jsp" %> <!-- Include the sidebar from the admin_sidebar.jsp file -->
    
    <!-- Main Content Area -->
    <div class="main-content">
        <div class="container">
            <div class="settings-header">
                <h2>System Settings</h2>
                <p class="text-muted">Update your website information and social media links.</p>
            </div>

            <form action="saveSettings.jsp" method="POST">

                <!-- Website Settings Card -->
                <div class="settings-card">
                    <h4>Website Information</h4>
                    <div class="mb-3">
                        <label for="websiteName" class="form-label">Website Name</label>
                        <input type="text" class="form-control" id="websiteName" name="websiteName" placeholder="Enter website name" required>
                    </div>
                    <div class="mb-3">
                        <label for="phoneNo" class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phoneNo" name="phoneNo" placeholder="Enter phone number" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
                    </div>
                </div>

                <!-- Social Media Links Card -->
                <div class="settings-card">
                    <h4>Social Media Links</h4>
                    <div class="mb-3">
                        <label for="facebookLink" class="form-label">Facebook URL</label>
                        <input type="url" class="form-control" id="facebookLink" name="facebookLink" placeholder="Enter Facebook URL">
                    </div>
                    <div class="mb-3">
                        <label for="instagramLink" class="form-label">Instagram URL</label>
                        <input type="url" class="form-control" id="instagramLink" name="instagramLink" placeholder="Enter Instagram URL">
                    </div>
                    <div class="mb-3">
                        <label for="googleLink" class="form-label">Google URL</label>
                        <input type="url" class="form-control" id="googleLink" name="googleLink" placeholder="Enter Google URL">
                    </div>
                    <div class="mb-3">
                        <label for="linkedinLink" class="form-label">LinkedIn URL</label>
                        <input type="url" class="form-control" id="linkedinLink" name="linkedinLink" placeholder="Enter LinkedIn URL">
                    </div>
                </div>

                <!-- Save Settings Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Save Settings</button>
                </div>
            </form>

            <!-- Footer -->
            <div class="footer">
                <p>&copy; 2025 Your Website. All rights reserved.</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
