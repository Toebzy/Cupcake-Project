package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.AdminFacade;
import dat.backend.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "saldochange", value = "/saldochange")
public class saldochange extends HttpServlet {
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String saldo = request.getParameter("Saldo");
        String idBrugere = request.getParameter("idbruger");
        int brugerIndex = Integer.parseInt(request.getParameter("varStatus"));


        String [] idBrugereSplit = idBrugere.replaceAll("\\[", "").replaceAll("\\]","").split(",");
        String brugerID = idBrugereSplit[brugerIndex];

        try {
            AdminFacade.saldoChange(connectionPool, saldo, brugerID);
        } catch (DatabaseException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("adminpage").forward(request,response);
    }
}
