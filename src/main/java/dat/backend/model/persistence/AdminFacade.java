package dat.backend.model.persistence;

import dat.backend.model.exceptions.DatabaseException;

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
}
