package bean;

import java.util.List;

public class PedidoBean {
	
	private String idPedido,idCliente,fechaPedido,fechaEntrega,total,destinatario,lugar,imagen,idUsuario,idEstadoPedido;
	private List<DetallePedidoBean> detalles;
	public String getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(String idPedido) {
		this.idPedido = idPedido;
	}
	public String getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
	}
	
	public String getFechaPedido() {
		return fechaPedido;
	}
	public void setFechaPedido(String fechaPedido) {
		this.fechaPedido = fechaPedido;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getDestinatario() {
		return destinatario;
	}
	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}
	public String getLugar() {
		return lugar;
	}
	public void setLugar(String lugar) {
		this.lugar = lugar;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getIdEstadoPedido() {
		return idEstadoPedido;
	}
	public void setIdEstadoPedido(String idEstadoPedido) {
		this.idEstadoPedido = idEstadoPedido;
	}
	public List<DetallePedidoBean> getDetalles() {
		return detalles;
	}
	public void setDetalles(List<DetallePedidoBean> detalles) {
		this.detalles = detalles;
	}

	
	
}
