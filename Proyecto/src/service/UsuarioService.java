package service;

import java.util.List;

import bean.AccesoBean;
import bean.DistritoBean;
import bean.RolBean;
import bean.UsuarioBean;

public interface UsuarioService {
	public abstract UsuarioBean login(UsuarioBean usuarioBean) throws Exception;
	public abstract List<AccesoBean> traerAccesosDeUsuario(int idUsuario)throws Exception;
	
	public abstract int inserta(UsuarioBean bean) throws Exception;
	public abstract int elimina(int idUsuario) throws Exception;
	public abstract int actualiza(UsuarioBean bean) throws Exception;
	public abstract UsuarioBean obtienePorPK(int idUsuario) throws Exception;
	public abstract List<UsuarioBean> traeTodos() throws Exception;
	public abstract List<UsuarioBean> traeTodosClientes() throws Exception;
	public abstract List<DistritoBean> listarDistritos() throws Exception;
	public abstract List<RolBean> listarRol() throws Exception;
	
	public abstract boolean buscaUsuarioXcorreo(String correo) throws Exception;
	public abstract boolean buscaUsuarioXlogin(String login) throws Exception;
	public abstract int contarUsuarioXlogin(String login) throws Exception;
	public abstract boolean validarPassword(String login,String password)throws Exception;
}
