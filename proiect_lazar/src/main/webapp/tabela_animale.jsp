<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.*" %>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Tabela Animale</title>
  <style>
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      color: #333;
      line-height: 1.6;
      background: #f5f5f5; 
      overflow-x: hidden;
    }

    
    .parallax-bg {
      background: url('images/360_F_750164994_CHYEOo3AAFkKOdqXDUDNOhXuDLP4jViJ.jpg') 
                  no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      width: 100%;
      position: relative;
      filter: brightness(0.95);
    }

    
    .overlay-content {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 90%;
      max-width: 900px;
      padding: 2rem;
      background: rgba(255, 255, 255, 0.07);
      backdrop-filter: blur(2px);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      border-radius: 20px;
      color: #fff;
      animation: fadeIn 0.8s ease forwards;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translate(-50%, -60%);
      }
      to {
        opacity: 1;
        transform: translate(-50%, -50%);
      }
    }

    
    header {
      text-align: center;
      margin-bottom: 1.5rem;
    }

    header h1 {
      font-size: 2.2rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      color: #ffd700; 
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
      margin-bottom: 1rem;
    }

    
    .top-buttons {
      text-align: center;
      margin-bottom: 1.5rem;
    }

    
    .btn {
      display: inline-block;
      width: 160px;
      margin: 0.5rem;
      padding: 0.5rem 1rem;
      color: #ffd700;
      background: transparent;
      text-decoration: none;
      font-weight: 600;
      border: 2px solid #ffd700;
      border-radius: 4px;
      transition: all 0.3s ease;
      text-align: center;
      cursor: pointer;
    }

    .btn:hover {
      background: #ffd700;
      color: #333;
      box-shadow: 0 4px 10px rgba(255, 215, 0, 0.6);
    }

    
    form {
      width: 100%;
      margin: 0 auto;
    }

    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      margin-bottom: 1.5rem;
      background-color: #ffd700;  
      border-radius: 10px;        
      overflow: hidden;
      color: #333;                
    }

    table th, table td {
      border: 2px solid #ffc107;  
      padding: 0.8rem;
      text-align: left;
    }

    table th {
      background-color: #ffe166;  
    }

    
    .bottom-button {
      text-align: center; 
      margin-top: 1rem;
    }

    
    @media screen and (max-width: 768px) {
      .overlay-content {
        padding: 1rem;
        max-width: 95%;
      }

      header h1 {
        font-size: 1.8rem;
      }

      .btn {
        width: 120px;
        margin: 0.4rem auto;
        display: block;
      }

      table th, table td {
        font-size: 0.9rem;
        padding: 0.6rem;
      }
    }
  </style>
</head>
<body>

  
  <div class="parallax-bg"></div>

  
  <div class="overlay-content">
    <header>
      <h1>Tabela Animale</h1>
    </header>

    
    <form id="stergeForm" action="sterge_animal.jsp" method="post"></form>

    
    <div class="top-buttons">
      <a href="nou_animal.jsp" class="btn">Adăugare ➕</a>
      <a href="modifica_animal.jsp" class="btn">Modifică ✏️</a>
      <!-- Link cu stil de buton care trimite formularul la sterge_animal.jsp -->
      <a href="#" class="btn" onclick="document.getElementById('stergeForm').submit();">
        Ștergere 🗑️
      </a>
    </div>

    
    <table>
      <tr>
        <th>Select.</th>
        <th>id_animal</th>
        <th>specie</th>
        <th>nume</th>
      </tr>
      
      <%
        jb.connect();
        ResultSet rs = jb.vedeTabela("animale");
        while (rs.next()) {
            long x = rs.getInt("id_animal");
      %>
      <tr>
        <td>
          <input form="stergeForm" type="checkbox" name="primarykey" value="<%= x %>" />
        </td>
        <td><%= x %></td>
        <td><%= rs.getString("specie") %></td>
        <td><%= rs.getString("nume") %></td>
      </tr>
      <%
        }
        rs.close();
        jb.disconnect();
      %>
    </table>

    
    <div class="bottom-button">
      <a href="index.html" class="btn">Acasă 🏠</a>
    </div>
  </div>

</body>
</html>
