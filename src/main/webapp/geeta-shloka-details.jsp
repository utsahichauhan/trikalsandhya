<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shloka Meaning - Bhagavad Geeta</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<link href="css/styles.css" rel="stylesheet" type="text/css">
    
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <%
        int adhyay = Integer.parseInt(request.getParameter("adhyay"));
        int shlok = Integer.parseInt(request.getParameter("shlok"));

        HashMap<String, String[]> shlokas = new HashMap<>();
        shlokas.put("1_1", new String[]{"धर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः।", "ધર્મસ્થળ કુરુક્ષેત્રમાં યુદ્ધ માટે ભેગા થયેલા", "The battlefield of Dharma is Kurukshetra, where warriors assemble to fight."});
        
        String key = adhyay + "_" + shlok;
        String[] shlokaData = shlokas.getOrDefault(key, new String[]{"श्लोक उपलब्ध नहीं है।", "શ્લોક ઉપલબ્ધ નથી।", "No Meaning Available."});
    %>

    <div class="shloka-container">
        <h2>📜 Shloka from Adhyay <%= adhyay %>, Shlok <%= shlok %></h2>
        <p class="shloka-text"><%= shlokaData[0] %></p>
        <p class="translation-text"><strong>Gujarati Translation:</strong> <%= shlokaData[1] %></p>
        <p class="meaning-text"><strong>Meaning:</strong> <%= shlokaData[2] %></p>
    </div>

    <%@ include file="footer.jsp" %>


</body>
</html>
