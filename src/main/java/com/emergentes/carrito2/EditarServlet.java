package com.emergentes.carrito2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditarServlet", urlPatterns = {"/EditarServlet"})
public class EditarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        int index = Integer.parseInt(request.getParameter("index"));
        
      
        request.getSession().setAttribute("index", index);
        
    
        response.sendRedirect("editar.jsp");
    }
}
