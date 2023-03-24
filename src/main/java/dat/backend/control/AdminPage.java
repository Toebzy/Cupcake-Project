package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.KurvFacade;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminPage", value = "/adminpage")
public class AdminPage extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            List<List> users = UserFacade.seUsers(connectionPool);
            List<String> idbruger = users.get(0);
            List<String> mail = users.get(1);
            List<String> kodeord = users.get(2);
            List<String> admin = users.get(3);
            List<String> saldo = users.get(4);

            request.setAttribute("idbruger", idbruger);
            request.setAttribute("mail", mail);
            request.setAttribute("kodeord", kodeord);
            request.setAttribute("admin", admin);
            request.setAttribute("saldo", saldo);
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request,response);

        } catch (DatabaseException e)
        {
            e.printStackTrace();
        }

    }
}
