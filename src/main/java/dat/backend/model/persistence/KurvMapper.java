package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                    String sql3 = "INSERT INTO ordrerliste VALUES (null, ?, ?, ?, ?)";
                    PreparedStatement ps3 = connection.prepareStatement(sql3);
                    ps3.setInt(1, user.getId());
                    ps3.setInt(2, 3);
                    ps3.setInt(3, 40);
                    ps3.setString(4, "igang");
                    ps3.executeUpdate();
                    ResultSet rs1 = ps.executeQuery();
                    if(rs1.next())
                    {
                        int ordrenummer = rs1.getInt("idordrerliste");
                        String sql2 = "INSERT INTO ordre VALUES (null, ?, ?, ?, ?)";
                        PreparedStatement ps2 = connection.prepareStatement(sql2);
                        ps2.setInt(1, bottom);
                        ps2.setInt(2, topping);
                        ps2.setInt(3, 5);
                        ps2.setInt(4, ordrenummer);
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
        list.add(arraytop);
        list.add(arraybund);
        list.add(arraypris);
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
               String sql1 = "SELECT ordre.bottom, ordre.topping, ordre.cupcakepris FROM ordre INNER JOIN ordrerliste ON ordrerliste.idordrerliste = ordre.ordrenummer WHERE ordrestatus like 'igang'";
                PreparedStatement ps1 = connection.prepareStatement(sql1);
                ResultSet rs1 = ps1.executeQuery();

                while(rs1.next())
                {
                    arraytop.add(rs1.getString("topping"));
                    arraybund.add(rs1.getString("bottom"));
                    arraypris.add(rs1.getString("cupcakepris"));
                }

            }
        } catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return list;
    }
}