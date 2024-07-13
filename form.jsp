<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .logo {
            display: block;
            margin: 0 auto 05px;
            width: 150px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        select, input {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 12px;
            border: none;
            background: #28a745;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background: #218838;
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
    </style>
   <script>
        document.addEventListener("DOMContentLoaded", function () {
            const symptom1Select = document.getElementById('symptom1');
            const symptom2Select = document.getElementById('symptom2');
            
            const symptom2Bysymptom1 = {
                'Fever': ['Cough','Chills','Headache'],
                'Runny nose': ['Sneezing','Cough','Headache','Sneezing','Itchy skin','Chest pain','Fatigue'],
                'Headache': ['Nausea','Frequent urination','Chest pain','Itchy skin'],
                'Frequent urination': ['Increased thirst','Abdominal pain','Fever','Joint pain'],
                'Chest pain': ['Shortness of breath','Cough','Fever','Nausea','Fatigue'],
                'Itchy skin': ['Red patches','Dry skin','Hives','Rashes','Swelling'],
                'Joint pain': ['Swelling','Stiffness','Redness','Fever','Fatigue'],
                'Abdominal pain': ['Bloating','Diarrhea','Constipation','Fever'],
                'Fatigue': ['Dry skin','Pallor','Weight loss','Sleep disturbances','Fever','Shortness of breath']
            };

            symptom1.addEventListener('change', function () {
                const selectedsymptom1 = symptom1Select.value;
                const symptom2 = symptom2Bysymptom1[selectedsymptom1] || [];

                symptom2Select.innerHTML = '<option value="">Select.. </option>';
                symptom2.forEach(symptom2 => {
                    const option = document.createElement('option');
                    option.value = symptom2;
                    option.textContent = symptom2;
                    symptom2Select.appendChild(option);
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <img src="logo.jpeg" alt="Logo" class="logo">
        <h2>Patient Name</h2>
        <form action="SymptomAnalysis.jsp" method="post">
            <h2 id="welcomeMessage">
                <%
            String firstname = (String)session.getAttribute("f1");
            String lastname = (String)session.getAttribute("f2");
            out.println(firstname +" " +  lastname);
            
            %>
        </h2>
            </h2>

            <label for="symptom1">Symptom 1:</label>
            <select id="symptom1" name="symptom1" required>
                <option value="">Select Symptom 1</option>
                <option value="Fever">Fever</option>
                <option value="Runny nose">Runny nose</option>
                <option value="Headache">Headache</option>
                <option value="Frequent urination">Frequent urination</option>
                <option value="Chest pain">Chest pain</option>
                <option value="Itchy skin">Itchy skin</option>
                <option value="Joint pain">Joint pain</option>
                <option value="Abdominal pain">Abdominal pain</option>
                <option value="Fatigue">Fatigue</option>
            </select>
            
            <label for="symptom2">Symptom 2:</label>
            <select id="symptom2" name="symptom2" required>
                <option value="">Select Symptom 2</option>
            </select>

            <button type="submit">Generate Report</button>
            <div class="buttons">
                <a href="home.jsp">Back</a>
                
            </div>
            
        </form>
    </div>
    
</body>
</html>
