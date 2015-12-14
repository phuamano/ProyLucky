package action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.PedidoService;
import service.PedidoServiceImpl;
import bean.PedidoBean;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@ParentPackage(value = "dawi")
public class PedidoAction extends ActionSupport {
	
	private static final Log log = LogFactory.getLog(PedidoAction.class);
	private PedidoService pedidoService = new PedidoServiceImpl();
	private String idCliente,fechapedido,fechaentrega,total,destinatario,lugar,dedicatoria,imagen,idUsuario,idEstadoPedido;
	private String[] idCodigo;
	
	@Action(value = "/registraPedido", results = {@Result(location = "/mensaje.jsp", name = "success") })
	public String registraPedido() throws Exception {
		log.info("En registraPedido");
		System.out.println("el array de codigo es "+idCodigo);
		PedidoBean pedidoBean = new PedidoBean();
		pedidoBean.setIdCliente(idCliente);
		pedidoBean.setFechaPedido(fechapedido);
		pedidoBean.setFechaEntrega(fechaentrega);
		pedidoBean.setTotal("200");
		pedidoBean.setDestinatario(destinatario);
		pedidoBean.setLugar(lugar);
		pedidoBean.setIdEstadoPedido("1");
		
	/*	
		List<DetalleBoletaBean> detalles = new ArrayList<DetalleBoletaBean>();
	
	for (ProductoBean bean : grdProductos) {
			DetalleBoletaBean detalle = new DetalleBoletaBean();
			detalle.setCantidad(bean.getCantidad());
			detalle.setPrecio(bean.getPrecio());
			detalle.setIdProducto(bean.getIdProducto());
			detalles.add(detalle);
		}
		
		boletaBean.setDetalles(detalles);
	*/	
		pedidoService.inserta(pedidoBean);
		
	
	//	session.put("keyBoleta", grdProductos);
		
		return SUCCESS;
	}

	public String getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
	}

	public String getFechapedido() {
		return fechapedido;
	}

	public void setFechapedido(String fechapedido) {
		this.fechapedido = fechapedido;
	}

	public String getFechaentrega() {
		return fechaentrega;
	}

	public void setFechaentrega(String fechaentrega) {
		this.fechaentrega = fechaentrega;
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

	public String getDedicatoria() {
		return dedicatoria;
	}

	public void setDedicatoria(String dedicatoria) {
		this.dedicatoria = dedicatoria;
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

	public String[] getIdCodigo() {
		return idCodigo;
	}

	public void setIdCodigo(String[] idCodigo) {
		this.idCodigo = idCodigo;
	}
	
	

}
