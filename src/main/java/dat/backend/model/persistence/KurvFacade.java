package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.SQLException;
import java.util.List;

public class KurvFacade
{

    public static void tilføjTilKurv(int topping, int bottom, User user, ConnectionPool connectionPool) throws DatabaseException, SQLException
    {
        KurvMapper.tilføjTilKurv(topping, bottom, user, connectionPool);
    }
    public static List<List> seKurv(User user, ConnectionPool connectionPool) throws DatabaseException
    {
        return KurvMapper.seKurv(user, connectionPool);
    }

    public static void færdigOrdre(User user, ConnectionPool connectionPool) throws SQLException
    {
        KurvMapper.færdigOrdre(user, connectionPool);
    }
}
