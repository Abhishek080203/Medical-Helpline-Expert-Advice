<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("f1")==null){
    response.sendRedirect("Dashboard.html");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('image/b1.JPG') no-repeat center center fixed; 
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
            text-align: center;
        }
        .logo {
            width: 100px;
            height: auto;
            margin-bottom: 20px;
        }
        h1 {
            color: #46538e;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #46538e;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #364172;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="logo.jpeg" alt="Company Logo" class="logo">
        <h1>User Profile</h1>
        <%
            String first_name = (String)session.getAttribute("f1");
            String last_name = (String)session.getAttribute("f2");
            String email = (String)session.getAttribute("f4");
            String contact = (String)session.getAttribute("f6");
            String gender = (String)session.getAttribute("f7");
            String age = (String)session.getAttribute("f8");

        %>
        

        <table>
            <tr>
                <th>Name</th>
                <td><%= first_name + last_name %></td>
            </tr>
         
            <tr>
                <th>Email</th>
                <td><%= email %></td>
            </tr>
            <tr>
                <th>Contact</th>
                <td><%= contact %></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><%= gender %></td>
            </tr>
           
            <tr>
                <th>Age</th>
                <td><%= age %></td>
            </tr>
           
        </table>
        
        <a href="home.jsp" class="back-button">Back</a>
        <a href="logout.jsp" class="back-button">Logout</a>
    </div>
</body>
</html>