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

    <style>
        body {
            background: #f8f9fa;
            text-align: center;
            color: #212529;
        }
        .shloka-container {
            margin: 50px auto;
            max-width: 900px;
        }
        .shloka-text {
            font-size: 1.8rem;
            color: #e65100;
            font-weight: bold;
        }
        .translation-text, .meaning-text {
            font-size: 1.2rem;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <%
        int adhyay = Integer.parseInt(request.getParameter("adhyay"));
        int shlok = Integer.parseInt(request.getParameter("shlok"));

        HashMap<String, String[]> shlokas = new HashMap<>();
        shlokas.put("1_1", new String[]{"धृतराष्ट्र उवाच धर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः।\nयुयुत्सवः मामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय॥1.1॥", 
                                       "dhṛtarāṣṭra uvāca dharma-kṣetre kuru-kṣetre samavetā yuyutsavaḥ |\n māmakāḥ pāṇḍavāścaiva kimakurvata sañjaya ||1.1||",
                                       "Dhritarashtra said: O Sanjaya, what did my sons and the sons of Pandu do when they had assembled together on the holy plain of Kurukshetra, eager for battle?"});

        String key = adhyay + "_" + shlok;
        String[] shlokaData = shlokas.getOrDefault(key, new String[]{"श्लोक उपलब्ध नहीं है।", "No Transliteration Available", "No Meaning Available."});
    %>

    <div class="shloka-container">
        <h2 class="fw-bold">BG <%= adhyay %>.<%= shlok %></h2>
        <p class="shloka-text"> <%= shlokaData[0] %> </p>
        <p class="translation-text text-muted"> <%= shlokaData[1] %> </p>
        <p class="meaning-text"><strong>Meaning:</strong> <%= shlokaData[2] %></p>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
