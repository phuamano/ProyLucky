package bean;

import java.io.File;

public class ProductoBean {
	private int idProducto;
	private int estado;
	private int idTipoProducto;
	private int idCategoriaProducto;
	private int idSubCategoriaProducto;
	private String nombre; 
	private String descripcion;
	private String idUsuario;
	private double precio;
	private String fecha;
	private TipoBean tipo;
	private CategoriaBean categoria;
	private SubCategoriaBean subcategoria;
	
	public ProductoBean(){
		tipo = new TipoBean();
		categoria= new CategoriaBean();
		subcategoria= new SubCategoriaBean();
	}
	private File Imagen;
	private String ImagenFileName;
	private String ImagenContentType;
	private byte[] ImagenBytes;
	
	
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getIdTipoProducto() {
		return idTipoProducto;
	}
	public void setIdTipoProducto(int idTipoProducto) {
		this.idTipoProducto = idTipoProducto;
	}
	public int getIdCategoriaProducto() {
		return idCategoriaProducto;
	}
	public void setIdCategoriaProducto(int idCategoriaProducto) {
		this.idCategoriaProducto = idCategoriaProducto;
	}
	public int getIdSubCategoriaProducto() {
		return idSubCategoriaProducto;
	}
	public void setIdSubCategoriaProducto(int idSubCategoriaProducto) {
		this.idSubCategoriaProducto = idSubCategoriaProducto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public File getImagen() {
		return Imagen;
	}
	public void setImagen(File imagen) {
		Imagen = imagen;
	}
	public String getImagenFileName() {
		return ImagenFileName;
	}
	public void setImagenFileName(String imagenFileName) {
		ImagenFileName = imagenFileName;
	}
	public String getImagenContentType() {
		return ImagenContentType;
	}
	public void setImagenContentType(String imagenContentType) {
		ImagenContentType = imagenContentType;
	}
	public byte[] getImagenBytes() {
		return ImagenBytes;
	}
	public void setImagenBytes(byte[] imagenBytes) {
		ImagenBytes = imagenBytes;
	}
	public TipoBean getTipo() {
		return tipo;
	}
	public void setTipo(TipoBean tipo) {
		this.tipo = tipo;
	}
	public CategoriaBean getCategoria() {
		return categoria;
	}
	public void setCategoria(CategoriaBean categoria) {
		this.categoria = categoria;
	}
	public SubCategoriaBean getSubcategoria() {
		return subcategoria;
	}
	public void setSubcategoria(SubCategoriaBean subcategoria) {
		this.subcategoria = subcategoria;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
}
