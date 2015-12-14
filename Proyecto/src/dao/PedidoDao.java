package dao;

import bean.PedidoBean;

public interface PedidoDao {
	public abstract int insertaPedido(PedidoBean bean) throws Exception;
}
