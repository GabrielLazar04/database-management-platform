<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.*" %>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8">
  <title>Tabela Caracteristici</title>
  <style>
    
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      box-sizing: border-box;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      color: #333;
    }

    
    .parallax-bg {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: url('images/360_F_750164994_CHYEOo3AAFkKOdqXDUDNOhXuDLP4jViJ.jpg')
                  no-repeat center center;
      background-size: cover;
      background-attachment: fixed; 
      filter: brightness(0.95);
      z-index: -1; 
    }

    
    .overlay-content {
      
      min-height: 100%;
      width: 100%;
      max-width: 900px;
      margin: 0 auto;
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
        transform: translateY(-15px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    
    header {
      text-align: center;
      margin-bottom: 1.5rem;
      margin-top: 2rem; 
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
      margin-bottom: 2rem; /* spațiu la final */
    }

    
    @media screen and (max-width: 768px) {
      .overlay-content {
        margin: 0 1rem;
        width: auto;
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
      <h1>Tabela Caracteristici</h1>
    </header>

    
    <form id="stergeForm" action="sterge_caracteristici.jsp" method="post"></form>

    
    <div class="top-buttons">
      
      <a href="nou_caracteristici.jsp" class="btn">Adăugare ➕</a>
      
      <a href="modifica_caracteristica.jsp" class="btn">Modifică ✏️</a>
      
      <a href="#" class="btn" onclick="document.getElementById('stergeForm').submit();">
        Ștergere 🗑️
      </a>
    </div>

    
    <table>
      <tr>
        <th>Mark</th>
        <th>idcaracteristic</th>
        <th>numecaracteristica</th>
      </tr>

      <%
        jb.connect();
        ResultSet rs = jb.vedeTabela("caracteristici");
        while (rs.next()) {
          long x = rs.getInt("idcaracteristic");
      %>
      <tr>
        
        <td>
          <input form="stergeForm" type="checkbox" name="primarykey" value="<%= x %>" />
        </td>
        <td><%= x %></td>
        <td><%= rs.getString("numecaracteristica") %></td>
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
