package dat.backend.model.persistence;

import dat.backend.model.exceptions.DatabaseException;

import java.sql.SQLException;
import java.util.List;

public class AdminFacade {
    public static void saldoChange(ConnectionPool connectionPool, String brugerID, String saldo) throws DatabaseException {
        AdminMapper.saldoChange(connectionPool, saldo, brugerID);
    }

    public static List<List> seOrdreliste(ConnectionPool connectionPool) throws DatabaseException
    {
        return AdminMapper.seOrdreliste(connectionPool);
    }

    public static List<List> seOrdre(String ordrenummer, ConnectionPool connectionPool) throws DatabaseException
    {
       return AdminMapper.seOrdre(ordrenummer, connectionPool);
    }
    public static void sletOrdreListe(int idordre, ConnectionPool connectionPool) throws SQLException
    {
        AdminMapper.sletOrdreListe(idordre, connectionPool);
    }
    public static void sletOrdrer(int idordrer, ConnectionPool connectionPool) throws SQLException {
        AdminMapper.sletOrdrer(idordrer, connectionPool);
    }
}
