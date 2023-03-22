package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class KurvMapper
{
   public static void tilføjTilKurv(int topping, int bottom, User user, ConnectionPool connectionPool) throws DatabaseException
   {
        String sql = "SELECT * FROM ordrerliste WHERE idbruger = ? AND ordrestatus like 'igang'";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, user.getId());
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    int ordrenummer = rs.getInt("idordrerliste");
                    String sql2 = "INSERT INTO ordre VALUES (null, ?, ?, ?, ?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, bottom);
                    ps2.setInt(2, topping);
                    ps2.setInt(3, 5);
                    ps2.setInt(4, ordrenummer);
                    ps2.executeUpdate();
                } else
                {
                    throw new DatabaseException("Wrong username or password");
                }
            }
        } catch (SQLException | DatabaseException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
    }
}
