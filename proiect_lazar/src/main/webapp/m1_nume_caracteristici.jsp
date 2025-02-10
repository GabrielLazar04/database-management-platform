<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Modifică Tabela Caracteristici Animale</title>
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
    table input[type="text"], table select {
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
      <h1>Modifică Caracteristici Animale</h1>
    </header>

    <%
      jb.connect();
      int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
      ResultSet rs = jb.intoarceCaracteristiciAnimaleId(aux);
      rs.first();
      int id1 = rs.getInt("idcaracteristic_caracteristici_animale");
      int id2 = rs.getInt("idanimal_caracteristici_animale");
      String NumeCaracteristica = rs.getString("numecaracteristici");
      String SpecieAnimal = rs.getString("specieanimal");
      String NumeAnimal = rs.getString("numeanimal");
      String mediu = rs.getString("mediu");
      ResultSet rs1 = jb.vedeTabela("caracteristici");
      ResultSet rs2 = jb.vedeTabela("animale");
    %>

    
    <form action="m2_nume_caracteristici.jsp" method="post">
      <table>
        <tr>
          <td align="right">IdNumeCaracteristici:</td>
          <td><input type="text" name="idcaracteristici_animale" value="<%= aux %>" readonly /></td>
        </tr>
        <tr>
          <td align="right">idcaracteristic:</td>
          <td>
            <select name="idcaracteristic">
              <%
                while (rs1.next()) {
                  int idcaracteristic = rs1.getInt("idcaracteristic");
                  NumeCaracteristica = rs1.getString("numecaracteristica");
                  if (idcaracteristic == id1) {
              %>
              <option selected value="<%= idcaracteristic %>"><%= idcaracteristic %>, <%= NumeCaracteristica %></option>
              <%
                  } else {
              %>
              <option value="<%= idcaracteristic %>"><%= idcaracteristic %>, <%= NumeCaracteristica %></option>
              <%
                  }
                }
              %>
            </select>
          </td>
        </tr>
        <tr>
          <td align="right">id_animal:</td>
          <td>
            <select name="id_animal">
              <%
                while (rs2.next()) {
                  int id_animal = rs2.getInt("id_animal");
                  SpecieAnimal = rs2.getString("specie");
                  NumeAnimal = rs2.getString("nume");
                  if (id_animal == id2) {
              %>
              <option selected value="<%= id_animal %>"><%= id_animal %>, <%= SpecieAnimal %>, <%= NumeAnimal %></option>
              <%
                  } else {
              %>
              <option value="<%= id_animal %>"><%= id_animal %>, <%= SpecieAnimal %>, <%= NumeAnimal %></option>
              <%
                  }
                }
              %>
            </select>
          </td>
        </tr>
        <tr>
          <td align="right">Mediu:</td>
          <td><input type="text" name="mediu" value="<%= mediu %>" /></td>
        </tr>
      </table>
      <div class="bottom-button">
        <input type="submit" value="Modifică Linia" />
      </div>
    </form>

    <div class="bottom-button">
      <a href="index.html" class="btn">Acasă 🏠</a>
    </div>
  </div>
</body>
</html>
