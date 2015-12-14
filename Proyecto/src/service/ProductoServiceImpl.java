package service;

import java.util.List;

import bean.CategoriaBean;
import bean.ProductoBean;
import bean.SubCategoriaBean;
import bean.TipoBean;
import dao.DaoFactory;
import dao.ProductoDao;

public class ProductoServiceImpl implements ProductoService{

	DaoFactory factory = DaoFactory.getFactory(DaoFactory.MYSQL);
	ProductoDao dao = factory.getProductoDao();
	
	@Override
	public int inserta(ProductoBean bean) throws Exception {
		return dao.inserta(bean);
	}

	@Override
	public int elimina(int id) throws Exception {
		return dao.elimina(id);
	}

	@Override
	public int actualiza(ProductoBean bean) throws Exception {
		return dao.actualiza(bean);
	}

	@Override
	public ProductoBean obtienePorPK(int id) throws Exception {
		return dao.obtienePorPK(id);
	}

	@Override
	public List<ProductoBean> traeTodos() throws Exception {
		return dao.traeTodos();
	}

	@Override
	public List<TipoBean> listarTipos() throws Exception {
		return dao.listarTipos();
	}

	@Override
	public List<CategoriaBean> listarCategoria() throws Exception {
		return dao.listarCategoria();
	}

	@Override
	public List<SubCategoriaBean> listarSubCategoriaBean(int codigo)throws Exception {
		return dao.listarSubCategoriaBean(codigo);
	}

}
