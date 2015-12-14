package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import bean.CategoriaBean;
import bean.ProductoBean;
import bean.SubCategoriaBean;
import bean.TipoBean;

public class MySqlProductoDao implements ProductoDao{

	SqlSessionFactory sqlMapper = null;
	{
		String archivo = "ConfiguracionIbatis.xml";
		try {
			Reader reader = Resources.getResourceAsReader(archivo);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public int inserta(ProductoBean bean) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = -1;
		try {
			salida = session.insert("dawi.SQL_registraProducto", bean);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return salida;
	}

	@Override
	public int elimina(int id) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = -1;
		try {
			salida = session.delete("dawi.SQL_eliminaProducto", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}

	@Override
	public int actualiza(ProductoBean bean) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = -1;
		try {

			salida = session.update("dawi.SQL_actualizaProducto", bean);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}

	@Override
	public ProductoBean obtienePorPK(int id) throws Exception {
		SqlSession session = sqlMapper.openSession();
		ProductoBean bean = null;
		try {
			bean= (ProductoBean)session.selectOne("dawi.SQL_buscaProducto", id);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<ProductoBean> traeTodos() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<ProductoBean>();
		try {
			lista =session.selectList("dawi.SQL_listaProducto");
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<TipoBean> listarTipos() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<TipoBean>();
		try {
			lista =session.selectList("dawi.SQL_listaTipoProducto");
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<CategoriaBean> listarCategoria() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<CategoriaBean>();
		try {
			lista =session.selectList("dawi.SQL_listaCategoriaProducto");
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<SubCategoriaBean> listarSubCategoriaBean(int codigo)throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<SubCategoriaBean>();
		try {
			lista =session.selectList("dawi.SQL_listaSubCategoriaProducto",codigo);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
}
