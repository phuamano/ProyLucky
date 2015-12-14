<%@page import="bean.UsuarioBean"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<%
	 UsuarioBean b =(UsuarioBean)	session.getAttribute("objUsuario");
%>

<sj:head jqueryui="true" jquerytheme="blitzer"  locale="es" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/style-orange.css" rel="stylesheet" title="default" 	type="text/css" />
<script type="text/javascript">

		$.subscribe('rowselectProducto', function(event,data) {
			document.getElementById("idSeleccion").value= event.originalEvent.id;
				 
			 var grid = event.originalEvent.grid; 
			 var sel_id = grid.jqGrid('getGridParam', 'selrow'); 
			 // var price =	grid.jqGrid('getCell', sel_id, 'categoria.idCategoriaProducto');
			 //alert(price);
			 document.getElementById("idMantNombre").value = grid.jqGrid('getCell', sel_id, 'nombre');
		 	 document.getElementById("idMantPrecio").value = grid.jqGrid('getCell', sel_id, 'precio');
	 		 document.getElementById("idMantDescripcion").value = grid.jqGrid('getCell', sel_id, 'descripcion');
	 		 document.getElementById("idManTipoProducto").value = grid.jqGrid('getCell', sel_id, 'tipo.idTipoProducto');
			 document.getElementById("idManCategoriaProducto").value = grid.jqGrid('getCell', sel_id, 'categoria.idCategoriaProducto');
			 document.getElementById("idManSubCategoriaProducto").value = grid.jqGrid('getCell', sel_id, 'subcategoria.idSubCategoriaProducto');		 
		     document.getElementById("idMantUsuario").value = grid.jqGrid('getCell', sel_id, 'idUsuario');
		}); 

		function actualizarProducto(){
				document.getElementById("idForm").action = 'actualizaProducto';
				return true;
		}  
		function eliminaProducto(){
			document.getElementById("idForm").action = 'eliminaProducto';
			return true;
		}  
		function registrarProducto(){
				document.getElementById("idForm").action = 'registraProducto';
				return true;
		} 
		function listaProducto(){
			document.getElementById("idForm").action = 'listaProducto';
			return true;
		} 
		function limpiarFormulario(){
			document.getElementById("idForm").reset();
			return true;
		} 
		function validaCampos(){ 	
			
			var todo_correcto = true;
			
			valor = document.getElementById("idMantNombre").value;
			if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
				todo_correcto = false;
		    }
			valor1 = document.getElementById("idMantDescripcion").value;
			if( valor1 == null || valor1.length == 0 || /^\s+$/.test(valor1) ) {
				todo_correcto = false;
		    }		
			valor2 = document.getElementById("idMantPrecio").value;
			if( isNaN(valor2) ) {
				todo_correcto = false;
			}
			indice1 = document.getElementById("idManTipoProducto").selectedIndex;
			if( indice1 == null || indice1 == 0 ) {
				todo_correcto = false;
			}
			indice2 = document.getElementById("idManCategoriaProducto").selectedIndex;
			if( indice2 == null || indice2 == 0 ) {
				todo_correcto = false;
			}
			indice3 = document.getElementById("idManSubCategoriaProducto").selectedIndex;
			if( indice3 == null || indice3 == 0 ) {
				todo_correcto = false;
			}
			
			
			if(!todo_correcto){
		      	alert('Algunos campos no están correctos, vuelva a revisarlos');
		      	}
			return todo_correcto;
		}
		function control(f){
			var ext=['jpg','jpeg','png'];
			var v=f.value.split('.').pop().toLowerCase();
			for(var i=0,n;n=ext[i];i++){
				if(n.toLowerCase()==v)
					return
			}
			var t=f.cloneNode(true);
			t.value='';
			f.parentNode.replaceChild(t,f);
			alert('extensión no válida');			
		}

</script> 
<div>
	<h3 class="section-title">Mantenimiento de Servicio</h3>
</div>

<div class="row">
	<div class="col-xs-12">
			<s:form id="idForm" enctype="multipart/form-data" method="post" cssClass="form-horizontal"> 
			 		<s:hidden id="idSeleccion" name="idSeleccion"/>				 		
			 		<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Nombre</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantNombre" placeholder="Nombre Servicio" class="col-xs-10 col-sm-5" name="producto.nombre" >
						</div>
					</div>		
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Precio</label>				
						<div class="col-sm-9">
							<input type="text" id="idMantPrecio"  placeholder="Precio" class="col-xs-10 col-sm-5"  name="producto.precio" >
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Descripcion</label>
						<div class="col-sm-9">
							<textarea class="input-xlarge" name="producto.descripcion" id="idMantDescripcion" style="width: 42%;"></textarea>
						</div>
					</div>		
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1" >Tipo</label>
						<div class="col-sm-9">
							<div class="clearfix">
							<s:url id="jsonTipoProducto"  action="cargaDinamicoTipoProducto"/> 
								<sj:select  href="%{jsonTipoProducto}"  
											id="idManTipoProducto" 
											name="producto.tipo.idTipoProducto"
									 		list="lstTipo" 
									 		listKey="idTipoProducto"
								 		    listValue="descripcion"  
								 		    headerKey="-1"   
											headerValue="[ Seleccione ]" />	
							</div>
						</div>
					</div>		
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Categoria</label>
						<div class="col-sm-9">
							<div class="clearfix">
								<s:url id="jsonCategoriaProducto" action="cargaDinamicoCategoriaProducto"/> 
									<sj:select  href="%{jsonCategoriaProducto}"  
												id="idManCategoriaProducto" 
												name="producto.categoria.idCategoriaProducto"
										 		list="lstCategoria" 
										 		listKey="idCategoriaProducto"
									 		    listValue="descripcion"  
									 		    headerKey="-1"   
												headerValue="[ Seleccione ]"
												onChangeTopics="carga1" />	
							</div>
						</div>
					</div>		
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">SubCategoria</label>
						<div class="col-sm-9">
							<div class="clearfix">
								<s:url id="jsonSubCategoriaProducto" action="cargaDinamicoSubCategoriaProducto"/> 
									<sj:select  href="%{jsonSubCategoriaProducto}"  
												id="idManSubCategoriaProducto" 
												name="producto.subcategoria.idSubCategoriaProducto"
										 		list="lstSubCategoria" 
										 		listKey="idSubCategoriaProducto"
									 		    listValue="descripcion"  
									 		    headerKey="-1"   
												headerValue="[ Seleccione ]"
												reloadTopics="carga1" />
							</div>
						</div>
					</div>
					<div class="space-4"></div>	
					<div class="form-group">			
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Imagen</label>
						<div class="col-sm-9">
							<s:file id="idMantImagen"  name="producto.Imagen" accept="image/*" onchange="control(this)"/>	
						</div>
					</div>			
					<div class="space-4"></div>
					<div class="form-group">
						<!-- <label class="col-sm-3 control-label no-padding-right" for="form-field-1">Usuario</label> -->				
						<div class="col-sm-9">
							<input type="text" id="idMantUsuario" class="col-xs-10 col-sm-5"  name="producto.idUsuario"  value="<%= b.getIdUsuario() %>" hidden="true">
						</div>
					</div>
			</s:form>
			<div class="space-4"></div>	
			<div class="form-group" align="center">	
				<div class="col-sm-9">
					<sj:submit cssClass="btn btn-primary" id="idFormAgregarPro"  value="Registrar" button="true" targets="idDivManProResultado"  formIds="idForm" onclick="javascript:registrarProducto();" onmousedown="javascript:validaCampos();" />
					<sj:submit cssClass="btn btn-primary" id="idFormActualizarPro"  value="Actualizar" button="true"  targets="idDivManProResultado" formIds="idForm" onclick="javascript:actualizarProducto();"/>
					<sj:submit cssClass="btn btn-primary" id="idFormEliminarPro"  value="Eliminar" button="true" targets="idDivManProResultado"  formIds="idForm" onclick="javascript:eliminaProducto();"/>
					<sj:submit cssClass="btn btn-primary" id="idFormSalirPro"  value="Listar" button="true" targets="idDivManProResultado"  formIds="idForm" onclick="javascript:listaProducto();"/>
					<sj:submit cssClass="btn btn-primary" id="idFormLimpiar"  value="Limpiar" button="true"   formIds="idForm" onclick="javascript:limpiarFormulario();"/>
				</div>
			</div>
	</div>
</div>
<div id="idDivManProResultado" align="center"></div>	





