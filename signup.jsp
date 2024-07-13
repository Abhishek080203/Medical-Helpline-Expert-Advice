<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    
    <% 
    if (request.getMethod().equalsIgnoreCase("post")) {
        String id = request.getParameter("id");
        session.setAttribute("id",id);
        String firstname = request.getParameter("first");
        session.setAttribute("Abhishek",firstname);
        String lastname = request.getParameter("last");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contact = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        
        
        
        String url = "jdbc:mysql://localhost:3306/userdb";
        String dbUsername = "your_mysql_username";
        String dbPassword = "your_mysql_password";
        
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/we_care", "root", "abhi@11");
            
            String sql = "INSERT INTO userprofiles (firstname, lastname, email, password, Contact, gender, age) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            
        
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstname);
            pstmt.setString(2, lastname);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, contact);
            pstmt.setString(6, gender);
            pstmt.setInt(7, age);
            
        
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                session.setAttribute("firstname", firstname);

                response.sendRedirect("login1.jsp");
                return;
            } else {
                out.println("<p>Failed to register user.</p>");
            }
            
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
    %>

</body>

</html>
