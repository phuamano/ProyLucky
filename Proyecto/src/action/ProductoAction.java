package action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.ProductoServiceImpl;
import util.Utilitarios;
import bean.ProductoBean;
import bean.UsuarioBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@ParentPackage(value = "dawi")
public class ProductoAction extends ActionSupport{
	private ProductoBean producto;
	private UsuarioBean usuario = new UsuarioBean();
	private List<ProductoBean> grdProducto;
	private ProductoServiceImpl productoService = new ProductoServiceImpl();
	private InputStream imagenProducto;
	private int idCodigo;
	private File Imagen;
	private String nombre,estado,precio,descripcion,fecha,idCategoriaProducto,idSubCategoriaProducto,idTipoProducto,IdUsuario;
	private Map<String, Object> session = (Map<String,Object>)ActionContext.getContext().getSession();
	private Integer rows = 0, page = 0, total = 0, records = 0;	
	private String idSeleccion, mensaje;	
	private static final Log log = LogFactory.getLog(ProductoAction.class);
	
	private int tipo,categoria,subcategoria;



	@Action(value = "/registraProducto", results = {@Result(location = "t_mantenimiento_producto_grid", name = "success",type="tiles"),
			@Result( name = "error" ,location = "t_mantenimiento_producto_grid",type="tiles")})
	public String registraVendedor() throws Exception {
		log.info("En registra Producto");
		try {
		tipo = producto.getTipo().getIdTipoProducto();
		producto.setIdTipoProducto(tipo);
		categoria = producto.getCategoria().getIdCategoriaProducto();
		producto.setIdCategoriaProducto(categoria);
		subcategoria = producto.getSubcategoria().getIdSubCategoriaProducto();
		System.out.println(subcategoria);
		producto.setIdSubCategoriaProducto(subcategoria);
		File files= producto.getImagen();
		byte[] bytes = Utilitarios.getBytesFromFile(files);	
		producto.setImagenBytes(bytes);
		producto.setEstado(1);
		productoService.inserta(producto);
		} catch (Exception e) {
		e.printStackTrace();
	}
	return listaProducto();
	}
	

	@Action(value = "/actualizaProducto", results = {@Result(location = "t_mantenimiento_producto_grid", name = "success",type="tiles"),
			@Result( name = "error" ,location = "t_mantenimiento_producto_grid",type="tiles")})
	public String actualizaVendedor() throws Exception {
		log.info("En actualiza Producto");
		try {
			if(producto!= null){
		
		tipo = producto.getTipo().getIdTipoProducto();
		producto.setIdTipoProducto(tipo);
		categoria = producto.getCategoria().getIdCategoriaProducto();
		producto.setIdCategoriaProducto(categoria);
		subcategoria = producto.getSubcategoria().getIdSubCategoriaProducto();
		System.out.println(subcategoria);
		producto.setIdSubCategoriaProducto(subcategoria);		
		producto.setIdProducto(Integer.parseInt(idSeleccion));
		File files= producto.getImagen();
		byte[] bytes = Utilitarios.getBytesFromFile(files);
		producto.setImagenBytes(bytes);
		productoService.actualiza(producto);
		}else{
			return ERROR;
		}
		} catch (Exception e) {
		e.printStackTrace();
	}
	return listaProducto();
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/eliminaProducto", results = {@Result(location = "t_mantenimiento_producto_grid", name = "success",type="tiles") })
	public String eliminaProducto() throws Exception {
		log.info("En elimina Producto");
		
		grdProducto=(ArrayList<ProductoBean>)session.get("keyProducto");
		
		if(grdProducto== null ||  grdProducto.size()==0){
			mensaje="Se debería haber realizado una selección";
			return SUCCESS;
		}
		
		if(idSeleccion == null||  idSeleccion.length()==0){
			mensaje="Se debería haber seleccionado un registro";
			return SUCCESS;
		}
		
		productoService.elimina(Integer.parseInt(idSeleccion));
		idSeleccion = null;
		
		return listaProducto();
	}
	
	
	@Action(value = "/listaProducto", results = {@Result(location = "t_mantenimiento_producto_grid", name = "success",type="tiles") })
	public String listaProducto() throws Exception {
		log.info("En lista Producto");	
		try {		
			List<ProductoBean>  data = productoService.traeTodos();		
			session.put("keyProducto", data);
			
			} catch (Exception e) {
				e.printStackTrace();
			}

			return SUCCESS;
			
	}
	
	@Action(value = "/verImagenProducto", 
			results = { @Result(
							params={"inputName","imagenProducto"}, 
							name = "success", type="stream") })
	public String verImagenProducto() throws Exception {
		log.info("En ver Imagen Producto");	
		try {
			
			ProductoBean producto = productoService.obtienePorPK(idCodigo);
			imagenProducto = new ByteArrayInputStream(producto.getImagenBytes());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/mantelistaProductoGrid", results = { @Result(name = "success", type = "json")})
	public String listaProductoGrid(){
		log.info("En listado Producto");
		try {
			
			List<ProductoBean> data = (ArrayList<ProductoBean>) session.get("keyProducto");

			records = data.size();

			int hasta = (rows * page);
			int desde = hasta - rows;
			if (hasta > records)
				hasta = records;

			grdProducto = data.subList(desde, hasta);

			total = (int) Math.ceil((double) records / (double) rows);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	

	public ProductoBean getProducto() {
		return producto;
	}
	public void setProducto(ProductoBean producto) {
		this.producto = producto;
	}
	public InputStream getImagenProducto() {
		return imagenProducto;
	}
	public void setImagenProducto(InputStream imagenProducto) {
		this.imagenProducto = imagenProducto;
	}
	public List<ProductoBean> getGrdProducto() {
		return grdProducto;
	}
	public void setGrdProducto(List<ProductoBean> grdProducto) {
		this.grdProducto = grdProducto;
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
	public int getIdCodigo() {
		return idCodigo;
	}
	public void setIdCodigo(int idCodigo) {
		this.idCodigo = idCodigo;
	}
	public String getIdTipoProducto() {
		return idTipoProducto;
	}
	public void setIdTipoProducto(String idTipoProducto) {
		this.idTipoProducto = idTipoProducto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getPrecio() {
		return precio;
	}
	public void setPrecio(String precio) {
		this.precio = precio;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getIdCategoriaProducto() {
		return idCategoriaProducto;
	}
	public void setIdCategoriaProducto(String idCategoriaProducto) {
		this.idCategoriaProducto = idCategoriaProducto;
	}
	public String getIdSubCategoriaProducto() {
		return idSubCategoriaProducto;
	}
	public void setIdSubCategoriaProducto(String idSubCategoriaProducto) {
		this.idSubCategoriaProducto = idSubCategoriaProducto;
	}
	public String getIdUsuario() {
		return IdUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		IdUsuario = idUsuario;
	}
	public File getImagen() {
		return Imagen;
	}
	public void setImagen(File imagen) {
		Imagen = imagen;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}
	public int getSubcategoria() {
		return subcategoria;
	}
	public void setSubcategoria(int subcategoria) {
		this.subcategoria = subcategoria;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public UsuarioBean getUsuario() {
		return usuario;
	}
	public void setUsuario(UsuarioBean usuario) {
		this.usuario = usuario;
	}
	

}
