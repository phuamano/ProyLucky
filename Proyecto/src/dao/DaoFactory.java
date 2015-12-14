package dao;

public abstract class DaoFactory {
	
	public static final int MYSQL = 1;
	
	public abstract UsuarioDao getUsuarioDao();
	public abstract ProductoDao getProductoDao();
	public abstract PedidoDao getPedidoDao();
	public static MySqlDaoFactory getFactory(int bd) {
		switch (bd) {
			case MYSQL:
				return new MySqlDaoFactory();
		}
		return null;
	}
}
