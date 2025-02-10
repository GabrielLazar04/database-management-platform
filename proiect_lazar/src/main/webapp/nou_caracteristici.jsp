<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Adaugă Caracteristici</title>
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

    
    form {
      width: 100%;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }
    table {
      width: 100%;
      border-spacing: 0;
      margin: 0 auto;
    }
    table td {
      padding: 0.8rem;
      color: #fff;
    }
    table input[type="text"] {
      width: 100%;
      padding: 0.6rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }
    input[type="submit"] {
      width: 100%;
      padding: 0.8rem;
      font-size: 1.2rem;
      font-weight: bold;
      color: #fff;
      background-color: #ffd700;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background 0.3s ease;
    }
    input[type="submit"]:hover {
      background-color: #ffc107;
      color: #333;
    }

    
    .bottom-button {
      text-align: center; 
      margin-top: 1rem;
      margin-bottom: 2rem;
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
      header h1 {
        font-size: 1.8rem;
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
    <header>
      <h1>Adaugă Caracteristici</h1>
    </header>

    <%
      String numecaracteristica = request.getParameter("numecaracteristica");
      if (numecaracteristica != null) {
        jb.connect();
        jb.adaugaCaracteristici(numecaracteristica);
        jb.disconnect();
    %>
      <p class="success-message">Datele au fost adăugate cu succes!</p>
    <%
      } else {
    %>
    <form action="nou_caracteristici.jsp" method="post">
      <table>
        <tr>
          <td align="right">Caracteristica:</td>
          <td><input type="text" name="numecaracteristica" size="40" required /></td>
        </tr>
      </table>
      <input type="submit" value="Adaugă Caracteristica" />
    </form>
    <%
      }
    %>

    
    <div class="bottom-button">
      <a href="index.html" class="btn">Acasă 🏠</a>
    </div>
  </div>
</body>
</html>
