package action;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.ProductoService;
import service.ProductoServiceImpl;
import service.UsuarioService;
import service.UsuarioServiceImpl;
import bean.CategoriaBean;
import bean.DistritoBean;
import bean.ProductoBean;
import bean.RolBean;
import bean.SubCategoriaBean;
import bean.TipoBean;
import bean.UsuarioBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = "dawi")
public class CargaComboBoxAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private List<CategoriaBean> lstCategoria;
	private List<SubCategoriaBean> lstSubCategoria;
	private List<TipoBean> lstTipo;
	private List<DistritoBean> lstDistrito;
	private List<RolBean> lstRol;
	private ProductoBean producto;
	private UsuarioBean usuario;
	private String categoria;
	private int valor;
	private Map<String, Object> session = (Map<String, Object>)ActionContext.getContext().getSession();
	private static final Log log = LogFactory.getLog(CargaComboBoxAction.class);
	private ProductoService service3 = new ProductoServiceImpl();
	private UsuarioService usuarioService = new UsuarioServiceImpl();


	
	@Action(value = "/cargaDinamicoTipoProducto", results = { @Result(name = "success", type="json") })
	public String cargaDinamicoTipoProducto() {
		System.out.println("Carga combo carga Dinamico TipoProducto");
		try {
			lstTipo = service3.listarTipos();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
		
	@Action(value = "/cargaDinamicoCategoriaProducto", results = { @Result(name = "success", type="json") })
	public String cargaDinamicoCategoriaProducto() {
		
		System.out.println("Carga combo carga Dinamico CategoriaProducto");
		try {
			lstCategoria = service3.listarCategoria();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@Action(value = "/cargaDinamicoSubCategoriaProducto", results = { @Result(name = "success", type="json") })
	public String cargaDinamicoSubCategoriaProducto() {
		
		System.out.println("Carga combo carga Dinamico SubCategoriaProducto");
		valor =producto.getCategoria().getIdCategoriaProducto();
		System.out.println(valor);
		
		try {
			lstSubCategoria = service3.listarSubCategoriaBean(valor);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@Action(value = "/cargaDinamicoDistrito", results = { @Result(name = "success", type="json") })
	public String cargaDinamicoDistrito() {
		
		System.out.println("Carga combo carga Dinamico Distrito");
		valor= usuario.getDistrito().getIdDistrito();
		System.out.println(valor);
		
		try {
			lstDistrito = usuarioService.listarDistritos();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@Action(value = "/cargaDinamicoRol", results = { @Result(name = "success", type="json") })
	public String cargaDinamicoRol() {
		
		System.out.println("Carga combo carga Dinamico Rol");
		valor= usuario.getRol().getIdRol();
		System.out.println(valor);
		
		try {
			lstRol = usuarioService.listarRol();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	

	public int getValor() {
		return valor;
	}
	public void setValor(int valor) {
		this.valor = valor;
	}
	
	public List<TipoBean> getLstTipo() {
		return lstTipo;
	}
	public void setLstTipo(List<TipoBean> lstTipo) {
		this.lstTipo = lstTipo;
	}
	public List<SubCategoriaBean> getLstSubCategoria() {
		return lstSubCategoria;
	}
	public void setLstSubCategoria(List<SubCategoriaBean> lstSubCategoria) {
		this.lstSubCategoria = lstSubCategoria;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public ProductoBean getProducto() {
		return producto;
	}
	public void setProducto(ProductoBean producto) {
		this.producto = producto;
	}
	public List<CategoriaBean> getLstCategoria() {
		return lstCategoria;
	}
	public void setLstCategoria(List<CategoriaBean> lstCategoria) {
		this.lstCategoria = lstCategoria;
	}

	public List<DistritoBean> getLstDistrito() {
		return lstDistrito;
	}
	public void setLstDistrito(List<DistritoBean> lstDistrito) {
		this.lstDistrito = lstDistrito;
	}
	public List<RolBean> getLstRol() {
		return lstRol;
	}
	public void setLstRol(List<RolBean> lstRol) {
		this.lstRol = lstRol;
	}
	public UsuarioBean getUsuario() {
		return usuario;
	}
	public void setUsuario(UsuarioBean usuario) {
		this.usuario = usuario;
	}
	
}
