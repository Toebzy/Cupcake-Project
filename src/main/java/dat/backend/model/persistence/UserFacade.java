package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.SQLException;
import java.util.List;

public class UserFacade
{
    public static User login(String username, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.login(username, password, connectionPool);
    }

    public static User createUser(String username, String password, String role, ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.createUser(username, password, role, connectionPool);
    }

    public static boolean checkUser(String mail, ConnectionPool conectionPool) throws DatabaseException
    {
        return UserMapper.checkUser(mail, conectionPool);
    }

    public static int fåSaldo(User user, ConnectionPool connectionPool) throws SQLException
    {
        return UserMapper.fåSaldo(user, connectionPool);
    }

    public static void setSaldo(int saldo, User user, ConnectionPool connectionPool) throws SQLException
    {
        UserMapper.setSaldo(saldo, user, connectionPool);
    }
    public static List<List> seUsers(ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.seUsers(connectionPool);
    }
}
