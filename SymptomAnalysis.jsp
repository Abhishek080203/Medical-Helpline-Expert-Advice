<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical Help Line</title>
    <style>
        body {
            background-color: lightblue;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: url('table-bg.png') no-repeat center center;
            background-size: cover;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.8);
        }
        th {
            background-color: rgba(242, 242, 242, 0.9);
        }
        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.7);
        }
        tr:hover {
            background-color: rgba(241, 241, 241, 0.8);
        }
        p {
            line-height: 1.6;
        }
        .message {
            font-size: 1.1em;
            font-weight: bold;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #777;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        .buttons a {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .buttons a:hover {
            background-color: #0056b3;
        }
        .logo {
            text-align: center;
            margin-bottom: 0px;
        }
        .logo img {
            max-width: 200px;
        }
        
    .download-link {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: right;
        }

        .download-link imag li {
            margin: 0 1rem;
        }

             .table-wrapper {
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <h1>Medical Help Line</h1>
    <div class="container">
        <div class="logo">
            <img src="logo.jpeg" alt="Medical Help Line Logo">
            <a href="download/image.jpeg" class="download-link">
                <img src="down.png" alt="Download Image" title="Download Image" width="40" height="40">
            </a>
        </div>
        <div class="table-wrapper">
           
            <%  
            
            String firstname = (String)session.getAttribute("f1");
            String lastname = (String)session.getAttribute("f2");
            String id = (String)session.getAttribute("f3");
            %><h2>
                <%
                out.println("Report No : " +  id);%><br></h2>
            <h3>
            <% out.println("Hello, "+ firstname + lastname+ ". Based on your input, here is the advice:"); %></h3>
            <%
                String symptom1 = request.getParameter("symptom1");
                String symptom2 = request.getParameter("symptom2");
                
                if (symptom1 != null && symptom2 != null && !symptom1.isEmpty() && !symptom2.isEmpty()) {
                    // Database connection parameters
                    String url = "jdbc:mysql://localhost:3306/we_care";
                    String username = "root"; 
                    String password = "abhi@11";

                    Connection conn = null;
                    
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, username, password);
                        String query = "SELECT  predictedDisease, medicine, dosage, treatment, ageCondition FROM SymptomAnalysis WHERE symptom1 = ? AND symptom2 = ?";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, symptom1);
                        pstmt.setString(2, symptom2);
                        rs = pstmt.executeQuery();

                        out.println("<table>");
                        out.println("<tr><th>Predicted Disease</th><th>Medicine</th><th>Dosage</th><th>Treatment</th><th>Age Condition</th></tr>");

                    
                        while (rs.next()) {
                            
                            String predictedDisease = rs.getString("predictedDisease");
                            String medicine = rs.getString("medicine");
                            String dosage = rs.getString("dosage");
                            String treatment = rs.getString("treatment");
                            String ageCondition = rs.getString("ageCondition");

                            out.println("<tr>");
                           
                            out.println("<td>" + predictedDisease + "</td>");
                            out.println("<td>" + medicine + "</td>");
                            out.println("<td>" + dosage + "</td>");
                            out.println("<td>"+ treatment + "</td>");
                            out.println("<td>" + ageCondition + "</td>");
                            out.println("</tr>");
                        }
                        out.println("</table>");
                        out.println("<center><p class='message'> Thank You !  </p></center>");
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>
    <div class="buttons">
        <a href="home.jsp">Home</a>
        <a href="form.jsp">Back</a>
        
    </div>
    <footer>
        <center>
            <div class="footer">
                <hr>
                <center> <p>Disclaimer: The information provided on this platform is for educational purposes only and should not be considered medical advice.</p>
                    <p>Please consult a healthcare professional for personalized medical guidance.</p>
                    <p>&copy; 2024 Medical Helpline & Expert Advice. All rights reserved.</p></center>
                <p class="copyright">Contact: abhishek080203@gmail.com</p>
            </div>
        </center>
    </footer>
</body>
</html>
