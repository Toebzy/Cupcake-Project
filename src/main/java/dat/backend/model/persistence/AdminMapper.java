package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public static List<List> seOrdreliste(ConnectionPool connectionPool) throws DatabaseException
    {
        List<List> list = new ArrayList<>();
        List<String> idordrerliste = new ArrayList<>();
        List<String> idbruger = new ArrayList<>();
        List<String> ordrestatus = new ArrayList<>();
        List<String> mail = new ArrayList<>();

        String sql = "SELECT ordrerliste.idordrerliste, ordrerliste.idbruger, ordrerliste.ordrestatus, bruger.mail FROM ordrerliste INNER JOIN bruger ON bruger.idbruger = ordrerliste.idbruger";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {

                    idordrerliste.add(rs.getString("idordrerliste"));
                    idbruger.add(rs.getString("idbruger"));
                    ordrestatus.add(rs.getString("ordrestatus"));
                    mail.add(rs.getString("mail"));
                }
                list.add(idordrerliste);
                list.add(idbruger);
                list.add(ordrestatus);
                list.add(mail);

            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return list;
    }

    public static List<List> seOrdre(String ordrenummer, ConnectionPool connectionPool) throws DatabaseException
    {

        List<List> list = new ArrayList<>();
        List<String> idordre = new ArrayList<>();
        List<String> bottom = new ArrayList<>();
        List<String> topping = new ArrayList<>();
        List<String> cupcakepris = new ArrayList<>();
        List<String> ordrenummerlist = new ArrayList<>();

        String sql = "SELECT * FROM ordre WHERE ordrenummer = ?";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, ordrenummer);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {

                    idordre.add(rs.getString("idordre"));
                    bottom.add(rs.getString("bottom"));
                    topping.add(rs.getString("topping"));
                    String pris = Integer.toString(KurvMapper.fåPrisBund(Integer.parseInt(rs.getString("bottom")), connectionPool) + KurvMapper.fåPrisTop(Integer.parseInt(rs.getString("topping")), connectionPool));
                    cupcakepris.add(pris);
                    ordrenummerlist.add(rs.getString("ordrenummer"));
                }
                list.add(idordre);
                list.add(bottom);
                list.add(topping);
                list.add(cupcakepris);
                list.add(ordrenummerlist);


            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return list;
    }
    public static void sletOrdrer(int idordrer,ConnectionPool connectionPool) throws SQLException {

        String sql = "DELETE FROM ordre WHERE ordrenummer = ?;";
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, idordrer);
                ps.executeUpdate();
            } catch (SQLException throwables)
            {
                throwables.printStackTrace();
            }
        }
    }

    public static void sletOrdreListe(int idordre, ConnectionPool connectionPool) throws SQLException {
        {
            String sql = "DELETE FROM ordrerliste WHERE idordrerliste = ?;";
            try (Connection connection = connectionPool.getConnection())
            {
                try (PreparedStatement ps = connection.prepareStatement(sql))
                {
                    ps.setInt(1, idordre);
                    ps.executeUpdate();
                } catch (SQLException throwables)
                {
                    throwables.printStackTrace();
                }
            }
        }
    }
}
