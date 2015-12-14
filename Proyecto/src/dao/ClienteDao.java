package dao;

import java.util.List;

import bean.DistritoBean;
import bean.UsuarioBean;



public interface ClienteDao {
	public abstract int inserta(UsuarioBean bean) throws Exception;
	public abstract int elimina(int idUsuario) throws Exception;
	public abstract int actualiza(UsuarioBean bean) throws Exception;
	public abstract UsuarioBean obtienePorPK(int idUsuario) throws Exception;
	public abstract List<UsuarioBean> traeTodos() throws Exception;
	public abstract List<DistritoBean> listarDistritos() throws Exception;

}
