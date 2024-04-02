package com.emergentes.carrito2;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        String nombre = request.getParameter("nombre");
        int p1 = Integer.parseInt(request.getParameter("p1"));
        int p2 = Integer.parseInt(request.getParameter("p2"));
        int ef = Integer.parseInt(request.getParameter("ef"));
        

        int nota = p1 + p2 + ef;
        
     
        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setP1(p1);
        producto.setP2(p2);
        producto.setEf(ef);
        producto.setNota(nota);
        
   
        HttpSession session = request.getSession(true);
        
      
        ArrayList<Producto> almacen = (ArrayList<Producto>) session.getAttribute("almacen");
        
        
        if (almacen == null) {
            almacen = new ArrayList<>();
        }

        producto.setIndex(almacen.size());
        
     
        almacen.add(producto);
        
        
        session.setAttribute("almacen", almacen);
        
       
        response.sendRedirect("index.jsp");
    }
}
