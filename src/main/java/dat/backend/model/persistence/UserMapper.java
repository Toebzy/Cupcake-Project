package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

class UserMapper
{
    private static Object ConnectionPool;

    static User login(String username, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        Logger.getLogger("web").log(Level.INFO, "");

        User user = null;

        String sql = "SELECT * FROM bruger WHERE mail = ? AND kodeord = ?";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    String role = rs.getString("admin");
                    int id = rs.getInt("idbruger");
                    user = new User(username, password, role, id);
                } else
                {
                    throw new DatabaseException("Wrong username or password");
                }
            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return user;
    }

    static User createUser(String mail, String kodeord, String role, ConnectionPool connectionPool) throws DatabaseException
    {
        Logger.getLogger("web").log(Level.INFO, "");
        User user;
        String sql = "insert into bruger (mail, kodeord, admin) values (?,?,?)";
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, mail);
                ps.setString(2, kodeord);
                ps.setString(3, role);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1)
                {
                    user = new User(mail, kodeord, role);
                } else
                {
                    throw new DatabaseException("The user with mail = " + mail + " could not be inserted into the database");
                }
            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Could not insert username into database");
        }
        return user;
    }


    public static boolean checkUser(String mail, ConnectionPool connectionPool) throws DatabaseException
    {
        String sql = "SELECT * FROM bruger WHERE mail = ?";
        User user;
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, mail);
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    return true;
                } else
                {
                    return false;
                }
            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
    }

    public static int fåSaldo(User user, ConnectionPool connectionPool) throws SQLException
    {
        String sql = "SELECT * FROM bruger WHERE mail = ?";
        int saldo = 0;
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, user.getUsername());
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    saldo = rs.getInt("saldo");
                }
            }
        }
        return saldo;
    }

    public static void setSaldo(int saldo, User user, ConnectionPool connectionPool) throws SQLException
    {
            String sql = "UPDATE bruger SET saldo= ? WHERE idbruger = ?";
            try (Connection connection = connectionPool.getConnection())
            {
                try (PreparedStatement ps = connection.prepareStatement(sql))
                {
                    ps.setInt(1, saldo);
                    ps.setInt(2, user.getId());
                    ps.executeUpdate();
                } catch (SQLException throwables)
                {
                    throwables.printStackTrace();
                }
            }
        }
    }

