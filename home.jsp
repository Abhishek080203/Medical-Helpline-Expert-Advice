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
    <title>Medical Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color:white#4CAF50;
    color: #4CAF50;
    padding: 10px 20px;
    border-bottom: 2px solid #eee; /* Adding a border at the bottom of the header */
}
    
    .greeting {
        margin-left: -90px;
        font-size: 2.2em;
        color: #00A1E8;

        
    }
    
   #welcomeMessage {
    font-family: Arial, sans-serif;
    font-size: 2.2em;
    text-align: center;
    color: #4CAF50;
    padding: 10px; 
    border-top-left-radius: 8px; 
    border-top-right-radius: 8px; 
}


    ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        ul li {
            margin: 0 1rem;
        }
 
        ul li a {
            color: rgb(177, 25, 25);
            text-decoration: none;
            font-size: 1.2rem;
        }

        .slider {
            width: 100%; /* Ensure slider spans full width */
        }

        .hero {
            background: #4c7faf; /* Fallback background color */
            background: linear-gradient(to right, #fbe960, #53e9e9); /* Gradient background */
            padding: 4rem 2rem;
            text-align: center;
        }

        .hero h1 {
            font-size: 3rem;
            margin: 0;
        }

        .hero p {
            font-size: 1.5rem;
            margin: 1rem 0;
        }

        .hero button {
            padding: 0.5rem 1rem;
            font-size: 1.2rem;
            background-color: #4c7faf;
            border: none;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .hero button:hover {
            background-color: #3a5f87;
        }

        .about {
            background: #e6f0c4; /* Fallback background color */
            background: linear-gradient(to right, #cdf5fd, #cee0e4); /* Gradient background */
            padding: 4rem 2rem;
            text-align: center;
        }

        section {
            padding: 4rem 2rem;
            text-align: center;
        }

        .service-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
        }

        .service {
            flex: 1 1 calc(33.333% - 2rem);
            background-color: #f9f9f9;
            padding: 2rem;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        .service h3 {
            margin-top: 0;
        }


        .main {
            padding: 20px;
        }

        h2 {
            color: #45a049;
        }

        .links {
            margin-bottom: 20px;
        }

        .form-link {
            display: inline-block;
            margin-right: 20px;
            padding: 10px 15px;
            background-color: #4c99af;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .form-link:hover {
            background-color: #45a049;
        }

        .emergency {
            font-size: 1.2em;
            color: rgb(236, 66, 66);
        }

        .doctors {
            padding: 4rem 2rem;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .doctor {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 250px;
            text-align: center;
        }

        .doctor img {
            border-radius: 50%;
        }

        .doctor .info {
            margin-top: 10px;
        }

        .doctor h3 {
            margin: 10px 0;
            color: #4caf50;
        }

        .doctor p {
            color: #555;
        }

        section {
            padding: 4rem 2rem;
            text-align: center;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        form input, form textarea {
            padding: 0.4rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        form button {
            padding: 0.5rem 1rem;
            background-color: #4c7faf;
            border: none;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        form button:hover {
            background-color: #3a5f87;
        }
        .logo img {
            max-width: 100px;
        }
    </style>
    
</head>
<body>


        <header class="header">
            <div class="logo">
                <img src="logo.jpeg" alt="" width="150">
            </div>
            <h2 id="welcomeMessage">
            <%
            String firstname = (String)session.getAttribute("f1");
            String lastname = (String)session.getAttribute("f2");
            String id = (String)session.getAttribute("f3");
            out.println(firstname + " " + lastname);
            
            %>
        </h2>
            <div class="greeting"> Welcome To We Care!</div>
          
            
            <ul>
                <li><a href="#about">About Us</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="profile1.jsp" class="profile1-link">
                <img src="a.png" alt="profile Image" title="profile Image" width="30" height="30">
                </a></li>
            </ul>
        </header>
        
        <div class="hero">
            <center>
                <h1> Medical Helpline & Expert Advice</h1>
                <p>Your health, our priority. Get expert advice and support 24/7.</p>
                <button onclick="scrollToSection('services')">Explore Services</button>
            </center>
        </div>
        <section id="about" class="about">
            <div class="content">
                <h2>About Us</h2>
                <p>A medical helpline and expert advice service offers immediate support from healthcare professionals,</p>
                <p>providing guidance on medical concerns, symptoms, and appropriate actions.</p>
                <p>Operating 24/7, these services play a critical role in offering reassurance, accurate information,</p>
                <p>and sometimes telehealth consultations, promoting timely access to healthcare advice.</p>
            </div>
        </section>
 
   
        <main class="main">
           
            <center><h2>Your Health Heroes</h2></center>
            
            
            <div class="doctors">
               
                <div class="doctor">
                    <img src="av.jpg"  id="av" alt="Doctor 1" width="175" height="175">
                    <div class="info">
                        <h3>Dr. Abhishek Kumar</h3>
                        <p>Specialty: Cardiology<br>
                        Experience: 10 years<br>
                        Work Place: AIIMS Delhi</p>
                    </div>
                </div>
                <div class="doctor">
                    <img src="Vikash.jpg" alt="Doctor 2" width="175" height="175">
                    <div class="info">
                        <h3>Dr. Vikash Dhakar</h3>
                        <p>Specialty: Pshyiotherapist<br>
                        Experience: 7 years<br>
                        Work Place: Apollo</p>
                    </div>
                </div>
                <div class="doctor">
                    <img src="ram.jpg" alt="Doctor 3" width="175" height="175">
                    <div class="info">
                        <h3>Dr. Ram Gurjar</h3>
                        <p>Specialty: Pediatrics<br>
                        Experience: 12 years<br>
                        Work Place: Gurjar Hospital</p>
                    </div>
                </div>    
                <div class="doctor">
                    <img src="aniket.jpg".jpg alt="Doctor 4" width="175" height="175">
                    <div class="info">
                        <h3>Dr. Ghanghoriya</h3>
                        <p>Specialty: Pshyciatrist<br>
                        Experience: 5 years<br>
                        Work Place: Chirayu Hospital</p>
                    </div>
                </div>    
               
            </div>
            <section id="services">
                <h2>Our Services</h2>
                <div class="service-container">
                    <div class="service">
                        <h3>24/7 Helpline</h3>
                        <p>Call us anytime for immediate medical support and advice.</p>
                    </div>
                    <div class="service">
                        <h3> <a href="cons.html" >Our Specialist</a></h3>
                        <p>Schedule a virtual consultation with our medical experts.</p>
                    </div>
                    <div class="service">
                        <h3>Health Resources</h3>
                        <p>Access a wide range of health articles, tips, and guides.</p>
                    </div>
                </div>
            </section>
            <div class="links">
                <center> 
                    
                <a href="medical_history.html" class="form-link">Medical History</a>
                <a href="form.jsp" class="form-link">Get Advice</a>
            </div>
            <section id="contact">
                <h2>Contact Us</h2>
                <form id="contact-form">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                    <label for="message">Message:</label>
                    <textarea id="message" name="message" required></textarea>
                    <button type="submit">Send</button>
                </form>
            </section>
            <div class="emergency">
                <center>
                    <h3>Medical Emergency Helpline: <strong>108</strong></h3>
                </center>
            </div>
            <footer>
                <hr>
                <div class="container">
                    <center> <p>Disclaimer: The information provided on this platform is for educational purposes only and should not be considered medical advice.</p>
                        <p>Please consult a healthcare professional for personalized medical guidance.</p>
                        <p>&copy; 2024 Medical Helpline & Expert Advice. All rights reserved.</p></center>                    <div class="address"></div>
                </div>
            </footer>
        </main>
</body>
</html>

