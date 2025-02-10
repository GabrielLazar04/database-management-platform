<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Ștergere Caracteristici</title>
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
      max-width: 700px;
      margin: 0 auto;
      padding: 2rem;
      background: rgba(255, 255, 255, 0.07);
      backdrop-filter: blur(2px);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      border-radius: 20px;
      color: #fff;
      animation: fadeIn 0.8s ease forwards;
      text-align: center;
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

    
    .message {
      font-size: 1.2rem;
      margin-bottom: 2rem;
      color: #ffd700;
      font-weight: bold;
    }
    .error-message {
      color: #f44336;
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

    
    @media screen and (max-width: 768px) {
      .overlay-content {
        margin: 0 1rem;
        width: auto;
      }
      .btn {
        width: 120px;
        margin: 0.4rem auto;
        display: block;
      }
    }
  </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
  
  <div class="parallax-bg"></div>

  
  <div class="overlay-content">
    <% 
      
      String[] s = request.getParameterValues("primarykey");

      if (s == null || s.length == 0) {
        
    %>
      <p class="message error-message">Nu ați selectat nicio linie pentru ștergere!</p>
      <a href="tabela_caracteristici.jsp" class="btn">Înapoi la Tabela Caracteristici</a>
    <% 
      } else {
        
        jb.connect();
        jb.stergeDateTabela(s, "caracteristici", "idcaracteristic");
        jb.disconnect();
    %>
      <p class="message">Rândurile selectate au fost șterse cu succes!</p>
      <a href="tabela_caracteristici.jsp" class="btn">Înapoi la Tabela Caracteristici</a>
    <% 
      }
    %>
    <a href="index.html" class="btn">Acasă 🏠</a>
  </div>
</body>
</html>
