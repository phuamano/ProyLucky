package bean;

public class SubCategoriaBean {
	private int idSubCategoriaProducto,idCategoriaProducto;
	private String descripcion;

	public int getIdCategoriaProducto() {
		return idCategoriaProducto;
	}
	public void setIdCategoriaProducto(int idCategoriaProducto) {
		this.idCategoriaProducto = idCategoriaProducto;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getIdSubCategoriaProducto() {
		return idSubCategoriaProducto;
	}
	public void setIdSubCategoriaProducto(int idSubCategoriaProducto) {
		this.idSubCategoriaProducto = idSubCategoriaProducto;
	}
}
