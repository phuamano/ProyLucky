<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>


<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/style-orange.css" rel="stylesheet" title="default" 	type="text/css" />
<script src="js/jquery.min.js" ></script>
<script src="js/jquery.validate.min.js"></script>

<script type="text/javascript">					
				jQuery(function($){
				$.validator.addMethod('names', function(value, element) {
	                return /^([a-z ραινσϊ]{2,60})$/i.test(value);
	       		 });			
				 $("#idFormAgregarCli").on("click",function(){
					 $("#idForm").validate({
						rules:{
							"usuario.nombres":{required:true, names:true},
							"usuario.apellidos":{required:true,names:true},
							"usuario.fechaNacimiento":"required",
							"usuario.cell":{required:true,number:true,minlength: 9,maxlength: 9},
							"usuario.direccion":{required:true,minlength: 10},
							"usuario.distrito.idDistrito":"required",
							"usuario.dni":{required:true,number:true,minlength: 8,maxlength: 8},
							"usuario.sexo":"required",
							"usuario.correo":{required:true,email:true,minlength: 7},
							"usuario.password":{required:true,minlength: 6},
							idPasswordRepeat :{required:true,equalTo:"#idPassword"}
							
						},
						messages:{
							"usuario.nombres":{required:'Ingrese Nombre',
												names:"Ingrese Nombre Valido"},
							"usuario.apellidos":{required:'Ingrese Apellido',
												names:"Ingrese Apellido Valido"},
							"usuario.fechaNacimiento" :"Ingrese Fecha de Nacimiento",
							"usuario.cell":	{required:'Ingrese numero de Celular',
												number:'Ingrese numero Celular correcto',
												minlength:'Ingrese numero Celular correcto',
												maxlength: 'Ingrese numero Celular correcto'},
							"usuario.direccion":{required:"Ingrese Direccion",
												minlength:'Ingrese Direccion Valido'},
							"usuario.distrito.idDistrito":"Seleccione Distrito",
							"usuario.dni":	{required:'Ingrese numero de DNI',
											number:'Ingrese numero DNI correcto',
											minlength:'Ingrese numero DNI correcto',
											maxlength: 'Ingrese numero DNI correcto'},
							"usuario.sexo":	"Selecione Sexo",
							"usuario.correo":{required:'Ingrese Correo',
											email:'Ingrese correo Valido',
											minlength:'Ingrese correo Valido'},
							"usuario.password":{required:'Ingrese Password',
												minlength:'Password debe de tener mas de 6 caracteres'},
							"idPasswordRepeat":{required:'Ingrese Password de confirmacion',
												equalTo:'Password no es igual'}
						}
					});	
					 document.getElementById("idForm").action= 'registraCliente';
				}); 
			});
		</script>
<sj:head jqueryui="true" jquerytheme="ui-lightness"  locale="es" />
<style type="text/css">
 	.error-message, label.error {
    color: #ff0000;
    margin:0;
    display: inline;
    font-family:cursive;
    font-size: 1em !important;
    font-weight:lighterx;
    padding: 0 5px;
 } 
</style>

<%-- <script type="text/javascript">
	$(document).ready(function(){
		$("#idMantNombre").val("");
	  	$("#idMantApellido").val("");
	  	$("#idMantFechaNacimiento").val("");
	  	$("#idMantCell").val("");
	  	$("#idMantDireccion").val("");
	  	$("#idDistrito").val()==0; 
	  	$("#idMantDni").val("");
		$("#idMantCorreo").val("");
		$("#idMantPassword").val("");
		$("#idMantPasswordComprobar").val("");
	});

   	function registrarUsuario(){
		document.getElementById("idForm").action = 'registraCliente';
		return true;
	} 
		
/* 		$('idElement').on('click',function(){
			
		});
		
		$(window).on('load',function(){
			
		});
		$(docuemen).ready(function(){
			
		}); */
</script > --%>



<div>
	<h1 class="section-title">Registro Cliente</h1>
</div>
<body>
<div class="row">
	<div class="col-xs-12">
			<s:form id="idForm" enctype="multipart/form-data" method="post" cssClass="form-horizontal"> 		 		
			 		<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Nombres</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantNombre" placeholder="Nombres" class="col-xs-10 col-sm-4" name="usuario.nombres" >  
							
						</div>			
					</div>	
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Apellidos</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantApellido" placeholder="Apellidos" class="col-xs-10 col-sm-4" name="usuario.apellidos" >
							
						</div>
					</div>	
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">FechaNacimiento</label>
						<div class="col-sm-9">
						<div id="validacionStruts">
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
					</div>				
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Cell</label>
						<div class="col-sm-9">
							<input type="text"  id="idMantCell" placeholder="Cell" class="col-xs-10 col-sm-2" name="usuario.cell" >
							
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Direccion</label>				
						<div class="col-sm-9">
							<div id="validacionInputXL">
								<input type="text" id="idMantDireccion"  placeholder="Direccion" class="col-xs-10 col-sm-5"  name="usuario.direccion" >
							</div>
							
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Distrito</label>
						<div class="col-sm-9">
							<div class="clearfix">
							<s:url id="jsonDistrito"  action="cargaDinamicoDistrito"/> 
								<div id="validacionStruts">	
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
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Dni</label>				
						<div class="col-sm-9">
							<input type="text" id="idMantDni"  placeholder="Dni" class="col-xs-10 col-sm-2"  name="usuario.dni" >
							
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Sexo</label>				
						<div class="col-sm-6">
							<div id="idMantSexo" class="btn-group" data-toggle="buttons">
								<label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default"> 
									<input type="radio" name="usuario.sexo" value="Masculino" > &nbsp; Masculino &nbsp;
								</label> <label class="btn btn-primary active" data-toggle-class="btn-primary"
									data-toggle-passive-class="btn-default"> 
									<input type="radio" name="usuario.sexo" value="Femenino" checked> Femenino
								</label>
							</div>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">	
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Email</label>
						<div class="col-sm-9">
							<div id="validacionInputXL">
								<input type="text"  id="idMantCorreo" placeholder="Email" class="col-xs-10 col-sm-5" name="usuario.correo" >
							</div>
							
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Password</label>
						<div class="col-sm-9">
							<div id="validacionInputXL">
								<input  type="password" placeholder="Password" class="col-xs-10 col-sm-5" name="usuario.password" id="idPassword">
							</div>
							
						</div>
					</div>			
					<div class="space-4"></div>	
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Repetir Password</label>
						<div class="col-sm-9">
							<div id="validacionInputXL">
								<input  type="password" placeholder="Repetir Password" class="col-xs-10 col-sm-5" name="idPasswordRepeat" id="idRepeat">
							</div>
							
						</div>
					</div>			
					<div class="space-4"></div>
					<div class="form-group">	
						<div class="col-sm-5">
							<div style="float: right;" >
								<s:submit type="button" label="Registrarse"  cssClass="btn btn-primary" id="idFormAgregarCli"  button="true" formIds="idForm"  />
							</div>
							<div style="float: right; margin-right: 20px;">
								<s:reset type="button" label="Reset"  cssClass="width-100% pull-right btn btn-success"/>
							</div>
						</div>
					</div>					
			</s:form>
	</div>
</div>
</body>
