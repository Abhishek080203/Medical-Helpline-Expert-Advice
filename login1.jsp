<!DOCTYPE html>
<html>

<head>
    <title>HTML Login Form</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: sans-serif;
            line-height: 1.5;
            min-height: 100vh;
            background: #e9ecef;
            flex-direction: column;
            margin: 0;
        }

        .main {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            padding: 20px 40px;
            transition: transform 0.2s;
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        h3 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            width: 100%;
            margin-top: 10px;
            margin-bottom: 5px;
            text-align: left;
            color: #555;
            font-weight: bold;
        }

        input {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            padding: 15px;
            border-radius: 10px;
            margin-top: 15px;
            margin-bottom: 15px;
            border: none;
            color: white;
            cursor: pointer;
            background-color: #4CAF50;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .wrap {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo {
            width: 150px;
            margin-bottom: 0.5px;
        }

        .footer-link {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        .footer-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <center>
        <div class="main">
            <img src="logo.jpeg" alt="We Care Logo" class="logo"> 
            
            <form action="login.jsp" method="post" >
                <label for="Email">
                      Email Id:
                </label>
                <input type="Email" 
                       id="Email" 
                       name="Email"
                       placeholder="Enter your Email Id" required>

                <label for="password">
                      Password:
                </label>
                <input type="password"
                       id="password" 
                       name="password"
                       placeholder="Enter your Password" required>

                <div class="wrap">
                      <button type="submit">Submit</button>
                </div>
          </form>
          <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
            out.println("<p>" + message + "</p>");
            session.removeAttribute("message");
        }
    %>
          <p>Not registered?
                <a href="#"
                   style="text-decoration: none;">
                   <a href="user.html">Create an account</a>
                </a>
          </p>
    </div>
  </center>  
</body>

</html>
