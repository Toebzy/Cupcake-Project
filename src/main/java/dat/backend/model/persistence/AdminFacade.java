package dat.backend.model.persistence;

import dat.backend.model.exceptions.DatabaseException;

public class AdminFacade {
    public static void saldoChange(ConnectionPool connectionPool, String brugerID, String saldo) throws DatabaseException {
        AdminMapper.saldoChange(connectionPool, saldo, brugerID);
    }
}
