package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.AdminFacade;
import dat.backend.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "seordreliste", value = "/seordreliste")
public class seordreliste extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            List<List> list = AdminFacade.seOrdreliste(connectionPool);
            List<String> idordrerliste = list.get(0);
            List<String> idbruger = list.get(1);
            List<String> ordrestatus = list.get(2);
            List<String> mail = list.get(3);
            request.setAttribute("idordrerliste", idordrerliste);
            request.setAttribute("idbruger", idbruger);
            request.setAttribute("ordrestatus", ordrestatus);
            request.setAttribute("mail", mail);


        } catch (DatabaseException e)
        {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/ordreliste.jsp").forward(request,response);
    }
}
