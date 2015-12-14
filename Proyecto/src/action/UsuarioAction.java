package action;

import java.util.ArrayList;
import java.util.List;
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
public class UsuarioAction extends ActionSupport {
	private UsuarioBean usuario;
	private List<UsuarioBean> grdUsuario;
	private UsuarioServiceImpl usuarioService = new UsuarioServiceImpl();
	private int idCodigo;
	private String nombres,apellidos,correo,cell,fechaNacimiento,direccion,dni,sexo,login,password;
	private int estado;
	private int idDistrito;
	private int idRol;
	private Map<String, Object> session = ActionContext.getContext().getSession();
	private Integer rows = 0, page = 0, total = 0, records = 0;	
	private String idSeleccion, mensaje;	
	private static final Log log = LogFactory.getLog(UsuarioAction.class);
	int cantidad = 0;
	
	@Action(value = "/listaUsuario", results = {@Result(location = "t_mantenimiento_usuario_grid", name = "success",type="tiles") })
	public String listaUsuario() throws Exception {
		log.info("En lista Usuario");	
		try {		
			List<UsuarioBean>  data = usuarioService.traeTodos();		
			session.put("keyUsuario", data);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;	
	}
	
	@Action(value = "/listaCliente", results = {@Result(location = "t_mantenimiento_usuario_grid", name = "success",type="tiles") })
	public String listaCliente() throws Exception {
		log.info("En lista Cliente");	
		try {		
			List<UsuarioBean>  data = usuarioService.traeTodosClientes();		
			session.put("keyUsuario", data);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;	
	}
	
	@Action(value = "/registraUsuario", results = {@Result(location = "t_mantenimiento_usuario_grid", name = "success",type="tiles"),
													@Result(location = "t_mantenimiento_usuario_grid", name = "error",type="tiles")})
	public String registraUsuario() throws Exception {
		log.info("En registra Usuario");
		try {	
			login = usuario.getNombres().substring(0,1)+usuario.getApellidos();
			if(usuarioService.buscaUsuarioXlogin(login)==true){
				usuario.setLogin(login);
			}else{
				cantidad = usuarioService.contarUsuarioXlogin(login);
				usuario.setLogin(login+cantidad);
			}				
			
			idDistrito=usuario.getDistrito().getIdDistrito();	
			usuario.setIdDistrito(idDistrito);
			idRol = usuario.getRol().getIdRol();
			usuario.setIdRol(idRol);
			usuario.setEstado(1);
			usuarioService.inserta(usuario);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	mensaje="el login para el usuario:"+" "+usuario.getNombres()+" "+usuario.getApellidos()+" "+"es: "+" "+login;
	return listaUsuario();
	}
	

	@Action(value = "/actualizaUsuario", results = {@Result(location = "t_mantenimiento_usuario_grid", name = "success",type="tiles"),
			@Result( name = "error" ,location = "t_mantenimiento_usuario_grid",type="tiles")})
	public String actualizaUsuario() throws Exception {
		log.info("En actualiza Producto");
		try {
			if(usuario!= null){
				idDistrito=usuario.getDistrito().getIdDistrito();	
				usuario.setIdDistrito(idDistrito);
				idRol = usuario.getRol().getIdRol();
				usuario.setIdRol(idRol);
				usuario.setIdUsuario(Integer.parseInt(idSeleccion));
				usuarioService.actualiza(usuario);
		}else{
			return ERROR;
		}
		} catch (Exception e) {
		e.printStackTrace();
	}
	return listaUsuario();
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/eliminaUsuario", results = {@Result(location = "t_mantenimiento_usuario_grid", name = "success",type="tiles") })
	public String eliminaProducto() throws Exception {
		log.info("En elimina Usuario");
		
		grdUsuario=(ArrayList<UsuarioBean>)session.get("keyUsuario");
		
		if(grdUsuario== null ||  grdUsuario.size()==0){
			mensaje="Se debería haber realizado una selección";
			return SUCCESS;
		}
		
		if(idSeleccion == null||  idSeleccion.length()==0){
			mensaje="Se debería haber seleccionado un registro";
			return SUCCESS;
		}
		
		usuarioService.elimina(Integer.parseInt(idSeleccion));
		idSeleccion = null;
		
		return listaUsuario();
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/mantelistaUsuarioGrid", results = { @Result(name = "success", type = "json")})
	public String listaUsuarioGrid(){
		log.info("En listado Producto");
		try {
			
			List<UsuarioBean> data = (ArrayList<UsuarioBean>) session.get("keyUsuario");

			records = data.size();

			int hasta = (rows * page);
			int desde = hasta - rows;
			if (hasta > records)
				hasta = records;

			grdUsuario = data.subList(desde, hasta);

			total = (int) Math.ceil((double) records / (double) rows);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public UsuarioBean getUsuario() {
		return usuario;
	}

	public void setUsuario(UsuarioBean usuario) {
		this.usuario = usuario;
	}

	public List<UsuarioBean> getGrdUsuario() {
		return grdUsuario;
	}

	public void setGrdUsuario(List<UsuarioBean> grdUsuario) {
		this.grdUsuario = grdUsuario;
	}

	public int getIdCodigo() {
		return idCodigo;
	}

	public void setIdCodigo(int idCodigo) {
		this.idCodigo = idCodigo;
	}

	public String getnombres() {
		return nombres;
	}

	public void setnombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
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

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
	}

	public String getIdSeleccion() {
		return idSeleccion;
	}

	public void setIdSeleccion(String idSeleccion) {
		this.idSeleccion = idSeleccion;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
}
