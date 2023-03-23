package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.KurvFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SeKurv", value = "/sekurv")
public class SeKurv extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        User user = (User) request.getSession().getAttribute("user");
        try
        {
            List<List> kurv = KurvFacade.seKurv(user, connectionPool);
            List<String> top = kurv.get(0);
            List<String> bund = kurv.get(1);
            List<String> pris = kurv.get(2);
            int totalpris = 0;
            for (String l: pris)
            {
                totalpris += Integer.parseInt(l);
            }
            request.setAttribute("totalpris", totalpris);
            request.setAttribute("kurv", kurv);
            request.setAttribute("top", top);
            request.setAttribute("bund", bund);
            request.setAttribute("pris", pris);
            request.getRequestDispatcher("WEB-INF/kurv.jsp").forward(request,response);
        } catch (DatabaseException e)
        {
            e.printStackTrace();
        }

    }
}
