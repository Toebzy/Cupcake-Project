package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "OpretBruger", value = "/opretbruger")
public class OpretBruger extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.getRequestDispatcher("opretbruger.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String mail = request.getParameter("mail");
        String kodeord = request.getParameter("kodeord");
        String gentagKodeord = request.getParameter("gentagkodeord");
        String sql = "SELECT * FROM bruger WHERE mail = ? and kodeord = ?";
        try
        {
            if(UserFacade.checkUser(mail, connectionPool))
            {
                request.setAttribute("msg", "Denne mail findes allerede i vores system");
                request.getRequestDispatcher("opretbruger.jsp").forward(request,response);
            }
            if(!mail.contains("@") || !mail.contains("."))
            {
                request.setAttribute("msg", "Ugyldig email");
                request.getRequestDispatcher("opretbruger.jsp").forward(request,response);
            }
            if(!kodeord.equals(gentagKodeord))
            {
                request.setAttribute("msg", "De to kodeord matcher ikke");
                request.getRequestDispatcher("opretbruger.jsp").forward(request,response);
            }
            UserFacade.createUser(mail, kodeord, "0", connectionPool);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } catch (DatabaseException e)
        {
            e.printStackTrace();
        }
    }
}
