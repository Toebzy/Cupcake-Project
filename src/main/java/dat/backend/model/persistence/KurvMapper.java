package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

class KurvMapper
{
    public static void tilføjTilKurv(int topping, int bottom, User user, ConnectionPool connectionPool) throws DatabaseException, SQLException
    {
        String sql = "SELECT * FROM ordrerliste WHERE idbruger = ? AND ordrestatus like 'igang'";
        int cupcakepris = fåPrisTop(topping, connectionPool) + fåPrisBund(bottom, connectionPool);
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, user.getId());
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    int ordrenummer = rs.getInt("idordrerliste");
                    String sql2 = "INSERT INTO ordre VALUES (null, ?, ?, ?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, bottom);
                    ps2.setInt(2, topping);
                    ps2.setInt(3, ordrenummer);
                    ps2.executeUpdate();
                } else
                {
                    String sql3 = "INSERT INTO ordrerliste VALUES (null, ?, ?)";
                    PreparedStatement ps3 = connection.prepareStatement(sql3);
                    ps3.setInt(1, user.getId());
                    ps3.setString(2, "igang");
                    ps3.executeUpdate();
                    ResultSet rs1 = ps.executeQuery();
                    if (rs1.next())
                    {
                        int ordrenummer = rs1.getInt("idordrerliste");
                        String sql2 = "INSERT INTO ordre VALUES (null, ?, ?, ?)";
                        PreparedStatement ps2 = connection.prepareStatement(sql2);
                        ps2.setInt(1, bottom);
                        ps2.setInt(2, topping);
                        ps2.setInt(3, ordrenummer);
                        ps2.executeUpdate();
                    }
                }
            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
    }

    public static List<List> seKurv(User user, ConnectionPool connectionPool) throws DatabaseException
    {
        List<List> list = new ArrayList<>();
        List<String> arraytop = new ArrayList<>();
        List<String> arraybund = new ArrayList<>();
        List<String> arraypris = new ArrayList<>();
        List<String> arrayid = new ArrayList<>();
        list.add(arraytop);
        list.add(arraybund);
        list.add(arraypris);
        list.add(arrayid);
        String ordrenummer;
        String sql = "SELECT * FROM ordrerliste WHERE idbruger = ? AND ordrestatus like 'igang'";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, user.getId());
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    ordrenummer = rs.getString("idordrerliste");
                }
                String sql1 = "SELECT ordre.bottom, ordre.topping, ordre.idordre FROM ordre INNER JOIN ordrerliste ON ordrerliste.idordrerliste = ordre.ordrenummer WHERE ordrestatus like 'igang' AND idbruger = ?";
                PreparedStatement ps1 = connection.prepareStatement(sql1);
                ps1.setInt(1, user.getId());
                ResultSet rs1 = ps1.executeQuery();

                while (rs1.next())
                {
                    arraytop.add(rs1.getString("topping"));
                    arraybund.add(rs1.getString("bottom"));
                    int top = fåPrisTop(Integer.parseInt(rs1.getString("topping")), connectionPool);
                    int bund = fåPrisBund(Integer.parseInt(rs1.getString("bottom")), connectionPool);
                    String pris = Integer.toString(top + bund);
                    arraypris.add(pris);
                    arrayid.add((rs1.getString("idordre")));
                }

            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return list;
    }

    static int fåPrisTop(int id, ConnectionPool connectionPool) throws SQLException
    {
        String sql = "SELECT * FROM topping WHERE idtopping = ?";
        int pris = 0;
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, id);
                ResultSet rs2 = ps.executeQuery();
                if(rs2.next())
                {
                    pris = rs2.getInt("pris");
                }
            } catch (SQLException throwables)
            {
                throwables.printStackTrace();
            }
        }
        return pris;
    }
     static int fåPrisBund(int id, ConnectionPool connectionPool) throws SQLException
    {
        String sql = "SELECT * FROM bottom WHERE idbottom = ?";
        int pris = 0;
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, id);
                ResultSet rs2 = ps.executeQuery();
                if(rs2.next())
                {
                    pris = rs2.getInt("pris");
                }
            } catch (SQLException throwables)
            {
                throwables.printStackTrace();
            }
        }
        return pris;
    }

    public static void færdigOrdre(User user, ConnectionPool connectionPool) throws SQLException
    {
        String sql = "UPDATE ordrerliste SET ordrestatus = \"færdig\" WHERE idbruger = ? AND ordrestatus like 'igang';";
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, user.getId());
                ps.executeUpdate();
            } catch (SQLException throwables)
            {
                throwables.printStackTrace();
            }
        }
    }

    public static void sletOrdre(int idordre, ConnectionPool connectionPool) throws SQLException
    {
        String sql = "DELETE FROM ordre WHERE idordre = ?;";
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
