package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.persistence.AdminFacade;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.KurvFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "sletordreadmin", value = "/sletordreadmin")
public class sletordreadmin extends HttpServlet {

    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String idordreliste = request.getParameter("idordrerliste");
        int index = Integer.parseInt(request.getParameter("index"));
        String [] idsplit = idordreliste.replaceAll("\\[", "").replaceAll("\\]","").replaceAll(" ", "").split(",");
        int idordre = Integer.parseInt(idsplit[index]);
        try
        {
            AdminFacade.sletOrdrer(idordre, connectionPool);
            AdminFacade.sletOrdreListe(idordre, connectionPool);
            request.getRequestDispatcher("seordreliste").forward(request,response);
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

    }
}
