<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<sj:head jqueryui="true" jquerytheme="blitzer"  locale="es" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/style-orange.css" rel="stylesheet" title="default" 	type="text/css" />

<script type="text/javascript">
/* $(document).ready(function(){
	$("#idMantNombre").val("");
  	$("#idMantApellido").val(""); 	
  	$("#idMantCorreo").val("");
	$("#idMantCell").val("");
  	$("#idMantFechaNacimiento").val("");
  	$("#idMantDireccion").val("");
  	$("#idMantDni").val("");
	$("#idMantPassword").val("");
	$("#idDistrito").val()==0; 
	$("#idRol").val()==0;

}); */
		$.subscribe('rowselectUsuario', function(event,data) {
			document.getElementById("idSeleccion").value= event.originalEvent.id;
				 
			 var grid = event.originalEvent.grid; 
			 var sel_id = grid.jqGrid('getGridParam', 'selrow'); 
			
			 document.getElementById("idMantNombre").value = grid.jqGrid('getCell', sel_id, 'nombres');
		 	 document.getElementById("idMantApellido").value = grid.jqGrid('getCell', sel_id, 'apellidos');
		 	 document.getElementById("idMantCorreo").value = grid.jqGrid('getCell', sel_id, 'correo');
			 document.getElementById("idMantCell").value = grid.jqGrid('getCell', sel_id, 'cell');
	 		 document.getElementById("idMantFechaNacimiento").value = grid.jqGrid('getCell', sel_id, 'fechaNacimiento');
	 		 document.getElementById("idMantDireccion").value = grid.jqGrid('getCell', sel_id, 'direccion');
	 		 document.getElementById("idMantDni").value = grid.jqGrid('getCell', sel_id, 'dni');
	 		document.getElementById("idMantSexo").value = grid.jqGrid('getCell', sel_id, 'sexo');
	 		document.getElementById("idMantPassword").value = grid.jqGrid('getCell', sel_id, 'password');
	 		
			 document.getElementById("idDistrito").value = grid.jqGrid('getCell', sel_id, 'distrito.idDistrito');
 			 document.getElementById("idRol").value = grid.jqGrid('getCell', sel_id, 'rol.idRol');
		}); 

		function valida_envia(){

			//Definimos los caracteres permitidos en una direcciÛn de correo electrÛnico
			var regexp = /^[0-9a-zA-Z._.-]+\@[0-9a-zA-Z._.-]+\.[0-9a-zA-Z]+$/;
			var regnom =  /^([a-z Ò·ÈÌÛ˙]{2,60})$/i;
			var regblanco= /^\s+|\s+$/;
			var regcell= /^\d{9}$/;
			var regdni= /^\d{8}$/;
			var regpass= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/;
			var alfanumerico = /^([0-9a-zA-ZÒ—·ÈÌÛ˙¡…Õ”⁄.])+((\s*)+([0-9a-zA-ZÒ—·ÈÌÛ˙¡…Õ”⁄.]*)*)+$/;
		
				if (document.getElementById("idMantNombre").value.length==0){
				alert("Por favor Ingrese su nombre");
				document.getElementById("idMantNombre").focus()
				return 0;
				}
				if(!regnom.test(document.getElementById("idMantNombre").value)){
					alert("Ingrese un nombre Valido");
					document.getElementById("idMantNombre").focus()
					return 0;
				}
				if(regblanco.test(document.getElementById("idMantNombre").value)){
					alert("Ingrese un nombre");
					document.getElementById("idMantNombre").focus()
					return 0;
				}
				
				if (document.getElementById("idMantApellido").value.length==0){
					alert("Por favor Ingrese su apellido");
					document.getElementById("idMantApellido").focus()
					return 0;
				}
				if(!regnom.test(document.getElementById("idMantApellido").value)){
						alert("Ingrese un apellido Valido");
						document.getElementById("idMantApellido").focus()
						return 0;
				}
				if(regblanco.test(document.getElementById("idMantApellido").value)){
					alert("Ingrese un apellido");
					document.getElementById("idMantApellido").focus()
					return 0;
				}	
				
				if (document.getElementById("idMantCorreo").value.length = 0){
					alert("Por favor Ingrese un correo ");
					document.getElementById("idMantCorreo").focus()
					return 0;
				}
				if(!regexp.test(document.getElementById("idMantCorreo").value)){
					alert("Ingrese un correo Valido");
					document.getElementById("idMantCorreo").focus()
					return 0;
				}	
				if(regblanco.test(document.getElementById("idMantCorreo").value)){
					alert("Ingrese un correo");
					document.getElementById("idMantCorreo").focus()
					return 0;
				}
				
				if (document.getElementById("idMantCell").value.length==0){
					alert("Por favor Ingrese un numero de celular");
					document.getElementById("idMantCell").focus()
					return 0;
				}
				if(!regcell.test(document.getElementById("idMantCell").value)){
						alert("Ingrese un numero de celular Valido");
						document.getElementById("idMantCell").focus()
						return 0;
				}
				if(regblanco.test(document.getElementById("idMantCell").value)){
					alert("Ingrese un numero de celular");
					document.getElementById("idMantCell").focus()
					return 0;
				}
				
				if(document.getElementById("idMantFechaNacimiento").value.length == 0){
					alert("Ingrese su fecha de Nacimiento");
					return 0;
				}
				
				if(!alfanumerico.test(document.getElementById("idMantDireccion").value)){
					alert("Ingrese una Direccion Valida");
					document.getElementById("idMantDireccion").focus()
					return 0;
				}
				
				if (document.getElementById("idMantDni").value.length==0){
					alert("Por favor Ingrese un numero de DNI");
					document.getElementById("idMantDni").focus()
					return 0;
				}
				if(!regdni.test(document.getElementById("idMantDni").value)){
						alert("Ingrese un numero de DNI Valido");
						document.getElementById("idMantDni").focus()
						return 0;
				}
				if(regblanco.test(document.getElementById("idMantDni").value)){
					alert("Ingrese un numero de DNI");
					document.getElementById("idMantDni").focus()
					return 0;
				}
				
				if (document.getElementById("idMantPassword").value.length==0){
					alert("Por favor un Password");
					document.getElementById("idMantPassword").focus()
					return 0;
				}
				if(!regpass.test(document.getElementById("idMantPassword").value)){
					alert(" -Debe contener al menos un dÌgito -debe contener al menos una min˙scula -debe contener al menos una mayuscula -debe contener al menos 8 caracteres");
					document.getElementById("idMantPassword").focus()
					return 0;
				}
				if(regblanco.test(document.getElementById("idMantPassword").value)){
					alert("Ingrese un Password");
					document.getElementById("idMantPassword").focus()
					return 0;
				}
				
				if (document.getElementById("idDistrito").selectedIndex==0){
					alert("Seleccione un distrito");
					document.getElementById("idDistrito").focus()
					return 0;
				}
				
				if (document.getElementById("idRol").selectedIndex==0){
					alert("Seleccione un Rol");
					document.getElementById("idRol").focus()
					return 0;
				}
				
				/* document.getElementById("idForm").action = 'registraUsuario'; */
			}

			//Cerramos el Script
		
		function actualizarUsuario(){
				document.getElementById("idForm").action = 'actualizaUsuario';
				return true;
		}  
		function eliminaUsuario(){
			document.getElementById("idForm").action = 'eliminaUsuario';
			return true;
		}  
		function registrarUsuario(){
				document.getElementById("idForm").action = 'registraUsuario';
				return true;
		} 
		function listaCliente(){
			document.getElementById("idForm").action = 'listaCliente';
			return true;
		} 
		function limpiarFormulario(){
			document.getElementById("idForm").reset();
			return true;
		} 
	
		
</script> 

<div>
	<h3 class="section-title">Actualizar Clientes</h3>
</div>
<div class="row">
	<div class="col-xs-12">
			<s:form id="idForm" enctype="multipart/form-data" method="post" cssClass="form-horizontal" name="formularioCliente"> 
			 		<s:hidden id="idSeleccion" name="idSeleccion"/>				 		
			 		<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Nombres</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantNombre" placeholder="Nombres" class="col-xs-10 col-sm-5" name="usuario.nombres">
						</div>
					</div>	
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Apellidos</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantApellido" placeholder="Apellidos" class="col-xs-10 col-sm-5" name="usuario.apellidos">
						</div>
					</div>	
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Email</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantCorreo" placeholder="Email" class="col-xs-10 col-sm-5" name="usuario.correo">
						</div>
					</div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Cell</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantCell" placeholder="Cell" class="col-xs-10 col-sm-5" name="usuario.cell">
						</div>
					</div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">FechaNacimiento</label>
						<div class="col-sm-9">
      						<sj:datepicker 	id="idMantFechaNacimiento" 
      										name="usuario.fechaNacimiento"  
      										changeMonth="true" 
      										changeYear="true" 
      										yearRange="1960:1997" 
      										showAnim="fadeIn" 
      										showOptions="{direction: 'up' }" 
      										duration="slow" 
      										maxDate="-18y,+7m,+31d" 
      										readonly="true" 
      										displayFormat="yy-mm-dd"/>
						</div>
					</div>				
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Direccion</label>				
						<div class="col-sm-9">
							<input type="text" id="idMantDireccion"  placeholder="Direccion" class="col-xs-10 col-sm-5"  name="usuario.direccion" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Dni</label>				
						<div class="col-sm-9">
							<input type="text" id="idMantDni"  placeholder="Dni" class="col-xs-10 col-sm-5"  name="usuario.dni" value="" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Sexo</label>				
						<div class="col-sm-6">
							<div id="idMantSexo" class="btn-group" data-toggle="buttons">
								<label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"> 
									<input type="radio" name="usuario.sexo" value="Masculino" > &nbsp; Masculino &nbsp;
								</label> <label class="btn btn-primary active" data-toggle-class="btn-primary"
									data-toggle-passive-class="btn-default"> 
									<input type="radio" name="usuario.sexo" value="Femenino" > Femenino
								</label>
							</div>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Password</label>
						<div class="col-sm-9">
							<input  type="password" id="idMantPassword" placeholder="Password" class="col-xs-10 col-sm-5" name="usuario.password">
						</div>
					</div>		
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Distrito</label>
						<div class="col-sm-9">
							<div class="clearfix">
							<s:url id="jsonDistrito"  action="cargaDinamicoDistrito"/> 
								<sj:select  href="%{jsonDistrito}"  
											id="idDistrito" 
											name="usuario.distrito.idDistrito"
									 		list="lstDistrito" 
									 		listKey="idDistrito"
								 		    listValue="descripcion"  
								 		    headerKey="-1"   
											headerValue="[ Seleccione ]" />	
							</div>
						</div>
					</div>		
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Rol</label>
						<div class="col-sm-9">
							<div class="clearfix">
								<s:url id="jsonRol" action="cargaDinamicoRol"/> 
									<sj:select  href="%{jsonRol}"  
												id="idRol" 
												name="usuario.rol.idRol"
										 		list="lstRol" 
										 		listKey="idRol"
									 		    listValue="descripcion"  
									 		    headerKey="-1"   
												headerValue="[ Seleccione ]"/>	
							</div>
						</div>
					</div>		
				<%-- 	<div class="space-4"></div>
					<div class="form-group">	
						<div class="col-sm-5">
							<div style="float: right;" >
								<s:submit type="button" label="Registrar"  cssClass="btn btn-primary" id="idFormAgregarCli"  button="true" formIds="idForm"  />
							</div>
							<div style="float: right; margin-right: 20px;">
								<s:submit type="button" label="Actualizar"  cssClass="btn btn-primary" id="idFormActualizarUsu"  button="true" formIds="idForm"  />
							</div>
							<div style="float: right; margin-right: 20px;">
								<s:submit type="button" label="Eliminar"  cssClass="btn btn-primary" id="idFormEliminarUsu"  button="true" formIds="idForm"  />
							</div>
							<div style="float: right; margin-right: 20px;">
								<s:submit type="button" label="Listar"  cssClass="btn btn-primary" id="idFormSalirUsu"  button="true" formIds="idForm"  onclick="javascript:listaUsuario();"/>
							</div>
						</div>
					</div>	 --%>	
			</s:form>
			<div class="space-4"></div>

			<div class="form-group" align="center">	
				<div class="col-sm-9">
					
					<sj:submit cssClass="btn btn-primary" id="idFormAgregarUsu"  value="Registrar" button="true"   targets="idDivManUsuResultado" formIds="idForm" onclick="javascript:registrarUsuario();" onmousedown="javascript:valida_envia();" />
					<sj:submit cssClass="btn btn-primary" id="idFormActualizarUsu"  value="Actualizar" button="true"  targets="idDivManUsuResultado" formIds="idForm" onclick="javascript:actualizarUsuario();"  onmousedown="javascript:valida_envia();" />
					<sj:submit cssClass="btn btn-primary" id="idFormEliminarUsu"  value="Eliminar" button="true" targets="idDivManUsuResultado"  formIds="idForm" onclick="javascript:eliminaUsuario();"/>
					<sj:submit cssClass="btn btn-primary" id="idFormSalirUsu"  value="Listar" button="true" targets="idDivManUsuResultado"  formIds="idForm" onclick="javascript:listaCliente();"/> 
					<sj:submit cssClass="btn btn-primary" id="idFormLimpiar"  value="Limpiar" button="true"   formIds="idForm" onclick="javascript:limpiarFormulario();"/> 
				</div>
			</div>
	</div>
</div>
<div class="space-4"></div>	
<div id="idDivManUsuResultado" align="center"></div>	