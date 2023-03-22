package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

public class KurvFacade
{

    public static void tilføjTilKurv(int topping, int bottom, User user, ConnectionPool connectionPool) throws DatabaseException
    {
        KurvMapper.tilføjTilKurv(topping, bottom, user, connectionPool);
    }
}
