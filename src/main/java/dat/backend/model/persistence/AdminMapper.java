package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class AdminMapper {
    public static void saldoChange(ConnectionPool connectionPool, String brugerID, String saldo) throws DatabaseException {
        String sql = "UPDATE bruger SET saldo = ? WHERE idbruger = ?";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, saldo);
                ps.setString(2, brugerID);
                ps.executeUpdate();
            }
        } catch (SQLException e)
        {
            throw new DatabaseException(e, "Error logging in. Something went wrong with the database");
        }
    }
}
