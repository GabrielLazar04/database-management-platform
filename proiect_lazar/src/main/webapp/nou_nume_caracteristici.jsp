<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Adaugă Caracteristica Animal</title>
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

    h1 {
      font-size: 2rem;
      color: #ffd700;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
      margin-bottom: 1rem;
      text-align: center;
    }

    table {
      width: 100%;
      margin: 1rem 0;
      border-spacing: 0.5rem;
    }

    table td {
      padding: 0.5rem;
      color: #fff;
    }

    input[type="text"], select {
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

    .btn {
      display: inline-block;
      width: 160px;
      margin: 1rem auto;
      padding: 0.5rem 1rem;
      color: #ffd700;
      background: transparent;
      text-decoration: none;
      font-weight: 600;
      border: 2px solid #ffd700;
      border-radius: 4px;
      transition: all 0.3s ease;
      text-align: center;
    }

    .btn:hover {
      background: #ffd700;
      color: #333;
      box-shadow: 0 4px 10px rgba(255, 215, 0, 0.6);
    }
  </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
  <div class="parallax-bg"></div>

  <div class="overlay-content">
    <%
      int idcaracteristic, id_animal;
      String id1, id2, NumeCaracteristica, SpecieAnimale, NumeAnimale, mediu;

      id1 = request.getParameter("idcaracteristic");
      id2 = request.getParameter("id_animal");
      mediu = request.getParameter("mediu");

      if (id1 != null) {
          jb.connect();
          jb.adaugaCaracteristiciAnimale(java.lang.Integer.parseInt(id2), java.lang.Integer.parseInt(id1), mediu);
          jb.disconnect();
    %>
      <h1>Datele au fost adăugate cu succes!</h1>
      <a href="index.html" class="btn">Acasă 🏠</a>
    <%
      } else {
          jb.connect();
          ResultSet rs1 = jb.vedeTabela("caracteristici");
          ResultSet rs2 = jb.vedeTabela("animale");
    %>
      <h1>Adaugă Caracteristică pentru Animal:</h1>
      <form action="nou_nume_caracteristici.jsp" method="post">
        <table>
          <tr>
            <td align="right">IdCaracteristic:</td>
            <td>
              Selectați caracteristica:
              <select name="idcaracteristic">
                <%
                  while(rs1.next()) {
                    idcaracteristic = rs1.getInt("idcaracteristic");
                    NumeCaracteristica = rs1.getString("numecaracteristica");
                %>
                  <option value="<%= idcaracteristic %>">
                    <%= idcaracteristic %>, <%= NumeCaracteristica %>
                  </option>
                <%
                  }
                %>
              </select>
            </td>
          </tr>
          <tr>
            <td align="right">IdAnimal:</td>
            <td>
              Selectați animalul:
              <select name="id_animal">
                <%
                  while(rs2.next()) {
                    id_animal = rs2.getInt("id_animal");
                    SpecieAnimale = rs2.getString("specie");
                    NumeAnimale = rs2.getString("nume");
                %>
                  <option value="<%= id_animal %>">
                    <%= id_animal %>, <%= SpecieAnimale %>, <%= NumeAnimale %>
                  </option>
                <%
                  }
                %>
              </select>
            </td>
          </tr>
          <tr>
            <td align="right">Mediu:</td>
            <td>
              <input type="text" name="mediu" size="30" />
            </td>
          </tr>
        </table>
        <input type="submit" value="Adaugă Caracteristica" />
      </form>
      <a href="index.html" class="btn">Acasă 🏠</a>
    <%
        jb.disconnect();
      }
    %>
  </div>
</body>
</html>
