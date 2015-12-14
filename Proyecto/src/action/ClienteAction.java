package action;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.UsuarioServiceImpl;
import bean.UsuarioBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
@ParentPackage(value = "dawi")
public class ClienteAction extends ActionSupport{
	private UsuarioBean usuario;
	private UsuarioServiceImpl usuarioService = new UsuarioServiceImpl();
	private int idCodigo;
	private String correo,cell,fechaNacimiento,direccion,dni,sexo,login,password, mensaje;
	private int estado;
	private int idDistrito;
	private int idRol;
	
	private Map<String, Object> session = ActionContext.getContext().getSession();
	private static final Log log = LogFactory.getLog(UsuarioAction.class);
	int cantidad = 0;
	
	@Action(value = "/registraCliente", results = {@Result(location = "t_mensajeCuenta", name = "success",type="tiles"),
													@Result(location = "t_clienteRegistro", name = "error",type="tiles")})
	public String registraUsuario() throws Exception {
	log.info("En registra Cliente");
	login = usuario.getCorreo();
	if(usuarioService.buscaUsuarioXcorreo(login)==true){
		mensaje="Ya existe una cuenta creada con el correo"+" "+login;
		return ERROR;
	}else{
		try {		
				idDistrito=usuario.getDistrito().getIdDistrito();	
				usuario.setIdDistrito(idDistrito);
				usuario.setIdRol(1);
				usuario.setEstado(1);
				usuario.setLogin(login);
				usuarioService.inserta(usuario);	
		} catch (Exception e) {
			e.printStackTrace();
			}
			mensaje="Su cuenta ha sido creada exitosamente";
			return SUCCESS;
		}
	}
	
	@Action(value = "/registraClienteAlternativo", results = {@Result(location = "t_mensajeCuenta", name = "success",type="tiles"),
															@Result(location = "t_login_registro", name = "error",type="tiles")})
	public String registraUsuarioAlternativo() throws Exception {
		log.info("En registra Cliente");
		login = usuario.getCorreo();
		if(usuarioService.buscaUsuarioXcorreo(login)==true){
		mensaje="Ya existe una cuenta creada con el correo"+" "+login;
		return ERROR;
		}else{
		try {		
		idDistrito=usuario.getDistrito().getIdDistrito();	
		usuario.setIdDistrito(idDistrito);
		usuario.setIdRol(1);
		usuario.setEstado(1);
		usuario.setLogin(login);
		usuarioService.inserta(usuario);	
		} catch (Exception e) {
		e.printStackTrace();
		}
		mensaje="Su cuenta ha sido creada exitosamente";
		return SUCCESS;
		}
	}
	
	public UsuarioBean getUsuario() {
		return usuario;
	}
	public void setUsuario(UsuarioBean usuario) {
		this.usuario = usuario;
	}
	public int getIdCodigo() {
		return idCodigo;
	}
	public void setIdCodigo(int idCodigo) {
		this.idCodigo = idCodigo;
	}
	
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getIdDistrito() {
		return idDistrito;
	}
	public void setIdDistrito(int idDistrito) {
		this.idDistrito = idDistrito;
	}
	public int getIdRol() {
		return idRol;
	}
	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
}
