<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Shloka - Ramayan</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Shloka - Ramayan</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
	
    <style>
        .container-fluid {
            display: flex;
        }
        
        .content {
            margin-left: 260px;
            padding: 20px;
            width: 100%;
        }
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
        <!-- Sidebar -->
        <div class="sidebar">
            <%@ include file="admin_sidebar.jsp" %>
        </div>
        
        <!-- Main Content -->
        <div class="content">
            <h2 class="text-center">📖 Add New Shloka</h2>
            <div class="form-container">
                <form action="AddShlokServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Select Category:</label>
                        <select name="category" class="form-select" required>
                            <option value="Ram-Seeta Milan">Ram-Seeta Milan</option>
                            <option value="Vanvas">Vanvas</option>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Select Adhyay (Chapter):</label>
                        <select name="adhyay_number" class="form-select" required>
                            <% for(int i=1; i<=20; i++) { %>
                                <option value="<%= i %>">Adhyay <%= i %></option>
                            <% } %>
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
</body>
</html>
