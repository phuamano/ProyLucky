<%@ page import="bean.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>   
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<%
	 UsuarioBean b =(UsuarioBean)	session.getAttribute("objUsuario");
%>

<sj:head jqueryui="true" jquerytheme="blitzer"  locale="es" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/style-orange.css" rel="stylesheet" title="default" 	type="text/css" />
<script type="text/javascript">

/* function registraPedido(){
	/* document.getElementById("idForm").action = 'registraPedido?idCodigo='item.get('codigo'); */
	return true;
} */

</script>
<div>
	<h1 class=" section-title animated fadeInRight" style="color: black; margin-left: 20px;">Orden d<span style="color: orange;">e Pedido</span></h1>
</div>

<div class="row">
	<div class="col-xs-12">
	<s:form id="idForm"  enctype="multipart/form-data" method="post" cssClass="form-horizontal">
		<s:hidden id="idSeleccion" name="idSeleccion"/>		
		<div class="form-group">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1">Nombre</label>
			<div class="col-sm-3">
				<input type="text"  id="idNombre" placeholder="Nombre" class="form-control" name="nombre" value="<%= b.getNombres() %>" readonly="readonly">
			</div>
		</div>
		<div class="space-4"></div>		
		<div class="form-group">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1">Apellido</label>
			<div class="col-sm-3">
				<input type="text"  id="idApellido" placeholder="Apellido" class="form-control" name="apellido" value="<%= b.getApellidos() %>" readonly="readonly">
			</div>
		</div>	
		<div class="space-4"></div>
		<div class="form-group">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1">DNI</label>
			<div class="col-sm-3">
				<input type="text"  id="idDni" placeholder="Dni" class="form-control" name="dni" value="<%= b.getDni() %>" readonly="readonly">
			</div>
		</div>	
		<div class="space-4"></div>
		<div class="form-group">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1">Fecha de Entrega</label>
			<div class="col-sm-2">
				<sj:datepicker 	id="idFechaEntrega" 
      							name="fechaentrega"  
      							changeMonth="true" 
      							changeYear="true" 
      							label="Fecha de Entrega"
      							yearRange="2015:2030" 
      							minDate="0" 
      							showAnim="fadeIn" 
      							showOptions="{direction: 'up' }" 
      							duration="slow" 
      							readonly="true" 
      							displayFormat="yy-mm-dd"
      							cssClass="form-control"
      							/>
			</div>
		</div>	
		<div class="space-4"></div>					
		<div class="form-group">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1">Destinatario</label>
				<div class="col-sm-4">
				<input type="text"  id="idDestinatario" placeholder="Destinatario" class="form-control" name="destinatario" >
				</div>
		</div>	
		<div class="space-4"></div>
		<div class="form-group">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1">Lugar de Entrega</label>
			<div class="col-sm-4">				
				<input type="text"  id="idLugarEntrega" placeholder="Lugar de Entrega" class="form-control" name="lugar" >
			</div>
		</div>		
		<div class="space-4"></div>
		<div class="form-group" hidden="hidden">	
			<label class="col-sm-2 control-label no-padding-right" for="form-field-1" >Usuario</label>
			<div class="col-sm-3">
				<input type="text"  id="idUsuario" class="form-control" name="idCliente" value="<%= b.getIdUsuario() %>">
			</div>
		</div>
		<div class="space-4"></div>		
		<!-- <div class="form-group">	
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Detalle Pedido</label>
		</div>	
			
		<div id="idDivPedidoSeleccion" align="left">
			<div class="col-sm-9">
				<input type="text" class="col-xs-10 col-sm-5" name="" value="" >
			</div>
		</div>	 -->
		<div class="container">
			<h3 class="animated fadeInRight" style="color: black">Detalle<span style="color: orange;"> Pedido</span></h3>
		    <div class="row">      
		    	<div class="simpleCart_items" style="float: left;"></div>
		    	<div style="float: left;">
					<div class="e-price">
						<p style="font-family: cursive;">Final Total: <span id="simpleCart_grandTotal" class="simpleCart_grandTotal "></span> </p>
					</div>		
				</div>
			</div>
		</div>
	</s:form>
	<div class="space-4"></div>	
	<div class="form-group" align="center">	
		<div class="col-sm-9">
		    <a  href="${pageContext.request.contextPath}/a_carrito_compras_intranet" ><button type="submit" Class="btn btn-primary">Cancelar</button></a>&nbsp;&nbsp;&nbsp;
			<sj:submit cssClass="btn btn-primary" id="idGenerar_Pedido"  value="Generar Pedido" button="true" formIds="idForm"  onclick="javascript:registraPedido();"/>
		</div>
	</div>
  </div>
</div>




