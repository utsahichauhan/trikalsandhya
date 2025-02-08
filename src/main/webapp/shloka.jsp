<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shloka - Ramayan</title>
	<link href="css/styles.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            color: white;
            font-family: 'Arial', sans-serif;
        }
        .shloka-container {
            max-width: 800px;
            margin: 50px auto;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            text-align: center;
        }
        .shloka-text {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffcc00;
        }
        .translation-text {
            font-size: 1.2rem;
            margin-top: 20px;
            color: white;
        }
        .meaning-text {
            font-size: 1rem;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container shloka-container">
        <h2>📜 Shloka from Adhyay <%= request.getParameter("chapter") %></h2>

        <% 
            // Dummy data for Sanskrit Shlokas, Gujarati Translations, and Meanings
            HashMap<Integer, String[]> shlokas = new HashMap<>();
            shlokas.put(1, new String[]{
                "धर्मो रक्षति रक्षितः।", 
                "ધર્મ એ તેને જ રક્ષે છે જે તેને રક્ષે છે।",
                "If one upholds righteousness (Dharma), Dharma in turn protects them. This means that those who act righteously will receive divine protection and blessings."
            });
            shlokas.put(2, new String[]{
                "रामाय रामभद्राय रामचन्द्राय वेधसे।", 
                "રામ માટે, રામભદ્ર માટે, રામચંદ્ર માટે મારા પ્રણામ।",
                "Salutations to Lord Rama, the one who is noble and auspicious, the divine protector and the source of wisdom."
            });
            shlokas.put(3, new String[]{
                "सर्वे सुखिनः सन्तु।", 
                "બધા સુખી રહે",
                "May all beings be happy and live in harmony, as true happiness lies in the well-being of everyone."
            });

            // Get chapter number from URL
            int chapter = Integer.parseInt(request.getParameter("chapter"));
            String[] shlokaData = shlokas.getOrDefault(chapter, new String[]{
                "श्लोक उपलब्ध नहीं है।", 
                "શ્લોક ઉપલબ્ધ નથી।",
                "No Shloka available for this chapter."
            });
        %>

        <p class="shloka-text"><%= shlokaData[0] %></p>
        <p class="translation-text"><strong>Gujarati Translation:</strong> <%= shlokaData[1] %></p>
        <p class="meaning-text"><strong>Meaning:</strong> <%= shlokaData[2] %></p>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
