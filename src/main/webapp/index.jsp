<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.carrito2.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Calificaciones</title>
</head>
<body>
    
    <div style="text-align: center; color: green;">
        <% String mensaje = (String) session.getAttribute("mensaje");
        if (mensaje != null) { %>
            <%= mensaje %>
        <% } %>
    </div>
    <div style="text-align: center; border: 1px solid black; padding: 10px; width: 300px; margin: auto;">
        <p>PRIMER PARCIAL TEM-742</p>
        <p>Nombre: ANA CRISTINA MAMANI QUISPE</p>
        <p>Carnet: 14039424</p>
    </div>

    <div style="text-align: center;">
        <h2><b>Registro de Calificaciones</b></h2>
    </div>
    <hr>
    <div style="text-align: left;">
        <form action="MainServlet" method="post">
            <label>Nombre del estudiante:</label><br>
            <input type="text" name="nombre"><br>
            <label>Primer parcial (sobre 30 pts):</label><br>
            <input type="text" name="p1"><br>
            <label>Segundo parcial (sobre 30 pts):</label><br>
            <input type="text" name="p2"><br>
            <label>Examen final (sobre 40 pts):</label><br>
            <input type="text" name="ef"><br><br>
            <input type="submit" value="Enviar">
        </form>
    </div>
    <hr>
    <div>
        <table border="1" style="margin: auto;">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>P1 (30)</th>
                <th>P2 (30)</th>
                <th>EF (40)</th>
                <th>Nota</th>
                <th>Acciones</th>
            </tr>
            <% 
            ArrayList<Producto> almacen = (ArrayList<Producto>) session.getAttribute("almacen");
            if (almacen != null) {
                for (int i = 0; i < almacen.size(); i++) {
                    Producto producto = almacen.get(i);
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= producto.getNombre() %></td>
                <td><%= producto.getP1() %></td>
                <td><%= producto.getP2() %></td>
                <td><%= producto.getEf() %></td>
                <td><%= producto.getNota() %></td>
                <td>
                    <form action="EditarServlet" method="post">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="submit" value="Editar">
                    </form>
                    <form action="EliminarServlet" method="post">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="submit" value="Eliminar">
                    </form>
                </td>
            </tr>
            <% 
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
