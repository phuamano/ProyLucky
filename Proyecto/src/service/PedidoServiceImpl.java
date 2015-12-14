package service;

import bean.PedidoBean;
import dao.DaoFactory;
import dao.PedidoDao;

public class PedidoServiceImpl implements PedidoService{

	DaoFactory factory = DaoFactory.getFactory(DaoFactory.MYSQL);
	PedidoDao dao = factory.getPedidoDao();
	@Override
	public int inserta(PedidoBean bean) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertaPedido(bean);
	}
	
	

}
