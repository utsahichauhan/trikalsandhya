<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shloka Saved</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .success-box {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        .success-box h1 {
            color: green;
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h1>✅ Shloka Saved Successfully!</h1>
        <p>You have successfully added a new shloka to the Bhagavad Geeta.</p>
        <a href="add-shlok.jsp" class="btn btn-primary mt-3">➕ Add Another Shloka</a>
        <a href="geeta.jsp" class="btn btn-secondary mt-3">📖 Back to Geeta Page</a>
    </div>
</body>
</html>
