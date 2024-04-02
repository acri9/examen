<%@ page import="com.emergentes.carrito2.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Estudiante</title>
</head>
<body>
    <h1>Editar Estudiante</h1>
    <form action="GuardarEdicionServlet" method="post">
        <% 
        Producto producto = (Producto) session.getAttribute("producto_editar");
        Integer index = (Integer) request.getSession().getAttribute("index");
        %>
        <input type="hidden" name="index" value="<%= (index != null) ? index : "" %>">
        Nombre: <input type="text" name="nombre" value="<%= (producto != null) ? producto.getNombre() : "" %>"><br>
        P1: <input type="text" name="p1" value="<%= (producto != null) ? producto.getP1() : "" %>"><br>
        P2: <input type="text" name="p2" value="<%= (producto != null) ? producto.getP2() : "" %>"><br>
        EF: <input type="text" name="ef" value="<%= (producto != null) ? producto.getEf() : "" %>"><br>
        <input type="submit" value="Guardar Cambios">
    </form>
</body>
</html>
