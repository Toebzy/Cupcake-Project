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
import java.sql.SQLException;

@WebServlet(name = "TilføjTilKurv", value = "/tilføjtilkurv")
public class TilfjTilKurv extends HttpServlet
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
       if(!(user instanceof User))
       {
           request.getRequestDispatcher("login.jsp").forward(request,response);
       }
       try
        {
            int topping = Integer.parseInt(request.getParameter("top"));
            int bund = Integer.parseInt(request.getParameter("bund"));
            KurvFacade.tilføjTilKurv(topping, bund, user,connectionPool);
            request.getRequestDispatcher("design.jsp").forward(request,response);
        } catch (DatabaseException | SQLException e)
        {
            e.printStackTrace();
        }
    }
}
