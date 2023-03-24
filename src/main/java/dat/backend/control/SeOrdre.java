package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.AdminFacade;
import dat.backend.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SeOrdre", value = "/seordre")
public class SeOrdre extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String ordrenummer = request.getParameter("ordrenummer");
        try
        {
           List<List> list = AdminFacade.seOrdre(ordrenummer, connectionPool);
            List<String> idordre = list.get(0);
            List<String> bottom = list.get(1);
            List<String> bundNavn = new ArrayList<>();
            for (String b: bottom)
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
            List<String> top = list.get(2);
            List<String> topNavn = new ArrayList<>();
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
            List<String> cupcakepris = list.get(3);
            List<String> ordrenummerlist = list.get(4);
            request.setAttribute("idordre", idordre);
            request.setAttribute("bottom", bundNavn);
            request.setAttribute("topping", topNavn);
            request.setAttribute("cupcakepris", cupcakepris);
            request.setAttribute("ordrenummer", ordrenummerlist);
        } catch (DatabaseException e)
        {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/ordre.jsp").forward(request,response);
    }
}
