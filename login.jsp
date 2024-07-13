<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
    <%     
        String Email = request.getParameter("Email");
        String Password = request.getParameter("password"); 
        String message = "";
        Connection conn = null;
        
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/we_care", "root", "abhi@11");
            
            String query = "SELECT * FROM userprofiles WHERE Email = ? AND Password = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, Email);
            pstmt.setString(2, Password);
            
            rs = pstmt.executeQuery();

            
            if (rs.next()) {
                String p1=rs.getString(2);
                String p2=rs.getString(3);
                String p3=rs.getString(1);
                String p4=rs.getString(4);
                String p5=rs.getString(5);
                String p6=rs.getString(6);
                String p7=rs.getString(7);
                String p8=rs.getString(8);

                session.setAttribute("f1",p1);
                session.setAttribute("f2",p2);
                session.setAttribute("f3",p3);
                session.setAttribute("f4",p4);
                session.setAttribute("f5",p5);
                session.setAttribute("f6",p6);
                session.setAttribute("f7",p7);
                session.setAttribute("f8",p8);
                session.setAttribute("message", "Successfully Logged In!");
                response.sendRedirect("home.jsp");
                return;
            } else {
                session.setAttribute("message", "Invalid Email Id or Password !");
                response.sendRedirect("login1.jsp");
                
            }
        }
        catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                out.println("<p>Error closing resources: " + ex.getMessage() + "</p>");
            }
        }
    %>
</body>
</html>
