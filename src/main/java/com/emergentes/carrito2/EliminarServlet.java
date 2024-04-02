package com.emergentes.carrito2;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EliminarServlet", urlPatterns = {"/EliminarServlet"})
public class EliminarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        int index = Integer.parseInt(request.getParameter("index"));
        
        HttpSession session = request.getSession(true);
        
        ArrayList<Producto> almacen = (ArrayList<Producto>) session.getAttribute("almacen");
        
        if (almacen != null) {
            almacen.remove(index);
            
        
            session.setAttribute("mensaje", "El estudiante ha sido eliminado correctamente");
            
            session.setAttribute("almacen", almacen);
        }
        
        response.sendRedirect("index.jsp");
    }
}
