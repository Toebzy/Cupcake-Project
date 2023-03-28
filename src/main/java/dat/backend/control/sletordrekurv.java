package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.KurvFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "sletordrekurv", value = "/sletordrekurv")
public class sletordrekurv extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("id");
        int index = Integer.parseInt(request.getParameter("index"));
        String [] idsplit = id.replaceAll("\\[", "").replaceAll("\\]","").replaceAll(" ", "").split(",");
        int idordre = Integer.parseInt(idsplit[index]);
        try
        {
            KurvFacade.sletOrdre(idordre, connectionPool);
            request.getRequestDispatcher("sekurv").forward(request,response);
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

    }
}
