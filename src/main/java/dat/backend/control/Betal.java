package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Betal", value = "/betal")
public class Betal extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int totalpris = Integer.parseInt(request.getParameter("totalpris"));
        User user = (User) request.getSession().getAttribute("user");
        int saldo;
        try
        {
           saldo = UserFacade.fåSaldo(user, connectionPool);
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

    }
}
