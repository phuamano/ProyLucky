package dao;
import java.util.List;

import bean.CategoriaBean;
import bean.ProductoBean;
import bean.SubCategoriaBean;
import bean.TipoBean;

public interface ProductoDao {
	public abstract int inserta(ProductoBean  bean) throws Exception;
	public abstract int elimina(int id) throws Exception;
	public abstract int actualiza(ProductoBean bean) throws Exception;
	public abstract ProductoBean obtienePorPK(int id) throws Exception;
	public abstract List<ProductoBean> traeTodos() throws Exception;
	public abstract List<TipoBean> listarTipos() throws Exception;
	public abstract List<CategoriaBean> listarCategoria() throws Exception;
	//public abstract List<SubCategoriaBean> listarSubCategoriaBean() throws Exception;
	public abstract List<SubCategoriaBean> listarSubCategoriaBean(int codigo) throws Exception;
//	public abstract List<SubCategoriaBean> listarSubCategoriaBean(SubCategoriaBean bean) throws Exception;
}
