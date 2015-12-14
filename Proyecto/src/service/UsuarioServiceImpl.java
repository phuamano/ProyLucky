package service;

import java.util.List;

import bean.AccesoBean;
import bean.DistritoBean;
import bean.RolBean;
import bean.UsuarioBean;
import dao.DaoFactory;
import dao.UsuarioDao;

public class UsuarioServiceImpl implements UsuarioService{

	DaoFactory factory = DaoFactory.getFactory(DaoFactory.MYSQL);
	UsuarioDao dao = factory.getUsuarioDao();

	
	@Override
	public UsuarioBean login(UsuarioBean usuarioBean) throws Exception {
		return dao.login(usuarioBean);
	}


	@Override
	public List<AccesoBean> traerAccesosDeUsuario(int idUsuario)throws Exception {
		return dao.traerAccesosDeUsuario(idUsuario);
	}


	@Override
	public int inserta(UsuarioBean bean) throws Exception {
		// TODO Auto-generated method stub
		return dao.inserta(bean);
	}


	@Override
	public int elimina(int idUsuario) throws Exception {
		// TODO Auto-generated method stub
		return dao.elimina(idUsuario);
	}


	@Override
	public int actualiza(UsuarioBean bean) throws Exception {
		// TODO Auto-generated method stub
		return dao.actualiza(bean);
	}


	@Override
	public UsuarioBean obtienePorPK(int idUsuario) throws Exception {
		// TODO Auto-generated method stub
		return dao.obtienePorPK(idUsuario);
	}


	@Override
	public List<UsuarioBean> traeTodos() throws Exception {
		// TODO Auto-generated method stub
		return dao.traeTodos();
	}


	@Override
	public List<DistritoBean> listarDistritos() throws Exception {
		// TODO Auto-generated method stub
		return dao.listarDistritos();
	}


	@Override
	public List<RolBean> listarRol() throws Exception {
		// TODO Auto-generated method stub
		return dao.listarRol();
	}


	@Override
	public boolean buscaUsuarioXcorreo(String correo) throws Exception {
		// TODO Auto-generated method stub
		return dao.buscaUsuarioXcorreo(correo);
	}


	@Override
	public boolean buscaUsuarioXlogin(String login) throws Exception {
		// TODO Auto-generated method stub
		return dao.buscaUsuarioXlogin(login);
	}


	@Override
	public int contarUsuarioXlogin(String login) throws Exception {
		// TODO Auto-generated method stub
		return dao.contarUsuarioXlogin(login);
	}


	@Override
	public boolean validarPassword(String login,String password) throws Exception {
		// TODO Auto-generated method stub
		return dao.validarPassword(login,password);
	}


	@Override
	public List<UsuarioBean> traeTodosClientes() throws Exception {
		// TODO Auto-generated method stub
		return dao.traeTodosClientes();
	}


	

	

}
