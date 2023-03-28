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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SeKurv", value = "/sekurv")
public class SeKurv extends HttpServlet
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
        User user = (User) request.getSession().getAttribute("user");
        try
        {
            List<List> kurv = KurvFacade.seKurv(user, connectionPool);
            List<String> topNavn = new ArrayList<>();
            List<String> top = kurv.get(0);
            for (String t: top)
            {
                switch(t)
                {
                    case "1": topNavn.add("Chokolade");
                    break;
                    case "2": topNavn.add("Blåbær");
                    break;
                    case "3": topNavn.add("Hindbær");
                    break;
                    case "4": topNavn.add("Knas");
                    break;
                    case "5": topNavn.add("Jordbær");
                    break;
                    case "6": topNavn.add("Rom/Rosin");
                    break;
                    case "7": topNavn.add("Appelsin");
                    break;
                    case "8": topNavn.add("Citron");
                    break;
                    case "9": topNavn.add("Blåskimmelost");
                    break;
                }
            }
            List<String> bund = kurv.get(1);
            List<String> bundNavn = new ArrayList<>();
            for (String b: bund)
            {
                switch(b)
                {
                    case "1": bundNavn.add("Chokolade");
                        break;
                    case "2": bundNavn.add("Vanilje");
                        break;
                    case "3": bundNavn.add("Muskatnød");
                        break;
                    case "4": bundNavn.add("Pistacie");
                        break;
                    case "5": bundNavn.add("Mandel");
                        break;
                }
            }
            List<String> pris = kurv.get(2);
            int totalpris = 0;
            for (String l: pris)
            {
                totalpris += Integer.parseInt(l);
            }
            List<String> id = kurv.get(3);
            int saldo = UserFacade.fåSaldo(user, connectionPool);
            request.setAttribute("id", id);
            request.setAttribute("totalpris", totalpris);
            request.setAttribute("saldo", saldo);
            request.setAttribute("kurv", kurv);
            request.setAttribute("top", topNavn);
            request.setAttribute("bund", bundNavn);
            request.setAttribute("pris", pris);
            request.getRequestDispatcher("WEB-INF/kurv.jsp").forward(request,response);

        } catch (DatabaseException | SQLException e)
        {
            e.printStackTrace();
        }

    }
}
