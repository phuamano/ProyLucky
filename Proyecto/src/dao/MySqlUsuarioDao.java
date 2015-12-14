package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import bean.AccesoBean;
import bean.DistritoBean;
import bean.RolBean;
import bean.UsuarioBean;

public class MySqlUsuarioDao implements UsuarioDao{

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
	public UsuarioBean login(UsuarioBean usuarioBean) throws Exception {
		SqlSession session = sqlMapper.openSession();
		UsuarioBean bean = null;
		try {
			bean = (UsuarioBean) session.selectOne("dawi.SQL_login", usuarioBean);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<AccesoBean> traerAccesosDeUsuario(int idUsuario)throws Exception {
			SqlSession session = sqlMapper.openSession();
			List lista = new ArrayList<AccesoBean>();
			try {
				lista = session.selectList("dawi.SQL_traerAccesosDeUsuario", idUsuario);
				return lista;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return null;
	}
	
	@Override
	public int inserta(UsuarioBean bean) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = -1;
		try {
			salida = session.insert("dawi.SQL_registraUsuario", bean);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}
	@Override
	public int elimina(int idUsuario) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = -1;
		try {
			salida = session.delete("dawi.SQL_eliminaUsuario", idUsuario);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}
	
	@Override
	public int actualiza(UsuarioBean bean) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = -1;
		try {

			salida = session.update("dawi.SQL_actualizaUsuario", bean);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}
	
	@Override
	public UsuarioBean obtienePorPK(int idUsuario) throws Exception {
		SqlSession session = sqlMapper.openSession();
		UsuarioBean bean = null;
		try {
			bean= (UsuarioBean)session.selectOne("dawi.SQL_buscaUsuario", idUsuario);
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
	public List<UsuarioBean> traeTodos() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<UsuarioBean>();
		try {
			lista =session.selectList("dawi.SQL_listaUsuario");
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
	public List<UsuarioBean> traeTodosClientes() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<UsuarioBean>();
		try {
			lista =session.selectList("dawi.SQL_listaCliente");
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
	public List<DistritoBean> listarDistritos() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<DistritoBean>();
		try {
			lista =session.selectList("dawi.SQL_listaDistrito");
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
	public List<RolBean> listarRol() throws Exception {
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<RolBean>();
		try {
			lista =session.selectList("dawi.SQL_listaRol");
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean buscaUsuarioXcorreo(String correo) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean salida=true;
		UsuarioBean bean = null;
		try {
			bean= (UsuarioBean)session.selectOne("SQL_buscaUsuarioXcorreo", correo);
			if(bean==null){
				return salida=false;
			}else {
				return salida=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}

	@Override
	public boolean buscaUsuarioXlogin(String login) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean salida=true;
		UsuarioBean bean = null;
		try {
			bean= (UsuarioBean)session.selectOne("SQL_buscaUsuarioXusuario", login);
			if(bean==null){
				return salida=true;
			}else {
				return salida=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}
	
	@Override
	@SuppressWarnings({"unchecked"})
	public int contarUsuarioXlogin(String login) throws Exception {
		SqlSession session = sqlMapper.openSession();
		List<UsuarioBean> lista = new ArrayList<UsuarioBean>();
		int cantidad = 1;
		try {
			lista= session.selectList("SQL_buscaUsuarioXusuario", login);
			cantidad = cantidad + lista.size();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cantidad;
	}

	@Override
	public boolean validarPassword(String login, String password) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean salida=true;
		UsuarioBean bean = null;
		try {
			bean= (UsuarioBean)session.selectOne("SQL_validarPassword", login);
			if(bean.getPassword().equals(password)){
				return salida=true;
			}else {
				return salida=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return salida;
	}
	
}
