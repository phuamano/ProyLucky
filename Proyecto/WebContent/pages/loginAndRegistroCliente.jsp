<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="ISO-8859-1"/>
		<title>Inicio Sesion - Tortas Encantada</title>
		
		<meta name="description" content="Inicio sesion" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css"  title="default" />	
		<link rel="stylesheet" href="css/font-awesome.min.css" title="default" />
		<link rel="stylesheet" href="fonts.googleapis.com/css-family=Open+Sans-400,300.css" title="default" />
		<!-- ace styles -->
		<link rel="stylesheet" href="css/ace.min.css" title="default" />
		<link rel="stylesheet" href="css/ace-rtl.min.css" title="default" />
		
		
		<script src="js/jquery.min.js" ></script>
		<script src="js/jquery.validate.min.js"></script>
		
	
		<script type="text/javascript">		
			window.jQuery|| document.write("<script src='js/jquery.min.js'/>"+ "<"+"/script>");
			if ('ontouchstart' in document.documentElement)document.write("<script src='js/jquery.mobile.custom.min.js'/>"+ "<"+"/script>");
			/* <!-- inline scripts related to this page --> */
			jQuery(function($) {
				$(document).on('click', '.toolbar a[data-target]', function(e) {
					e.preventDefault();
					var target = $(this).data('target');
					$('.widget-box.visible').removeClass('visible');//hide others
					$(target).addClass('visible');//show target
				});
			});
			//you don't need this, just used for changing background
			jQuery(function($) {
				$('#btn-login-dark').on('click', function(e) {
					$('body').attr('class', 'login-layout');
					$('#id-text2').attr('class', 'white');
					$('#id-company-text').attr('class', 'blue');
		
					e.preventDefault();
				});
				$('#btn-login-light').on('click', function(e) {
					$('body').attr('class', 'login-layout light-login');
					$('#id-text2').attr('class', 'grey');
					$('#id-company-text').attr('class', 'blue');
		
					e.preventDefault();
				});
				$('#btn-login-blur').on('click', function(e) {
					$('body').attr('class', 'login-layout blur-login');
					$('#id-text2').attr('class', 'white');
					$('#id-company-text').attr('class', 'light-blue');
		
					e.preventDefault();
				});
			});
				 
			jQuery(function($){
				$.validator.addMethod('names', function(value, element) {
	                return /^([a-z ñáéíóú]{2,60})$/i.test(value);
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
					document.getElementById("idForm").action= 'registraClienteAlternativo';
				}); 
				$("#btnLogin").on("click",function(){
					$("#idLogin").validate({
						rules:{
							"loginUser":{required:true},
							"loginPassword":{required:true,minlength: 6}				
						},
						messages:{
							"loginUser":{required:'Ingrese username'},
							"loginPassword":{required:'Ingrese Contraseña',
												names:"Ingrese Apellido Valido",
												minlength:'Password debe de tener mas de 6 caracteres'}
						},submitHandler: function(){
							document.getElementById("idLogin").submit();
	                     }
						
					});
					
				});
			});
		</script>
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
<sj:head jqueryui="true" jquerytheme="blitzer"  locale="es" />

		<%--<script type="text/javascript">		
			
			 function validaSubmite() {
				if (document.getElementById("loginUser").value == ""&& document.getElementById("loginPassword").value == "")
					alert("Usuario o Password en blanco")
				else if (document.getElementById("loginUser").value == "")
					alert("Ingrese Usuario")
				else if (document.getElementById("loginPassword").value == "")
					alert("Ingrese Password")
				else
					document.getElementById("idLogin").submit();
			}
			function registrarUsuario(){
				document.getElementById("idForm").action= 'registraCliente';
				return true;
			}  
			 $(function(){
				$("#idFormAgregarCli").on("click",function(){
					$("#idForm").validate({
						rules:{
							"usuario.nombres":"required"
						},
						messages:{
							"usuario.nombres":"Ingrese Nombre"
						}
					});
				});
			});
		</script> --%>	
	</head>

	<body class="login-layout" style="background:url('img/fondoLogin.png');background-repeat: no-repeat; background-size:100% 100%;">	
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center header-full-title">
								<h1>
									<span class="red">Tortas</span>
									<span class="white" id="id-text2">Encantada</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Compañia Tortas Encantada</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Por favor Introduce Tus Datos
											</h4>

											<div class="space-6"></div>

											<s:form  id="idLogin" action="login" method="POST">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Email" name="loginUser" id="txtLoginUser"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Contraseña" name="loginPassword" id="txtLoginPassword"/>
															<i class="ace-icon fa fa-lock" ></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<!-- <label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Remember Me</span>
														</label> -->
														<s:submit type="button" label="Ingresar"  cssClass="width-35 pull-right btn btn-sm btn-primary" id="btnLogin"  button="true" formIds="idLogin"  />
													</div>
													<div class="space-4"></div>
												</fieldset>
											</s:form>

											<!-- <div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div> -->
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<!-- <div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													Olvidé mi contraseña
												</a>
											</div> -->

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													Quiero registrarme
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
											<div>
												<a href="index.jsp"  class="user-signup-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													Volver a la pagina		
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Recuperar mi Contraseña
											</h4>

											<div class="space-6"></div>
											<p>
												Ingrese su correo electrónico y para recibir instrucciones
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Envíeme!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Volver a iniciar sesión
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												Registro de Nuevo Usuario
											</h4>

											<div class="space-6"></div>
											<p> Introduzca sus datos para comenzar: </p>
											
											<s:form id="idForm"  enctype="multipart/form-data" method="post" cssClass="form-horizontal" > 
												<fieldset>
														<label class="block clearfix"> 
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control " placeholder="Nombres" name="usuario.nombres" id="idNombres" >
															<i class="ace-icon fa fa-user"></i>
															 
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Apellidos" name="usuario.apellidos" id="idApellidos"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<sj:datepicker 	id="idFechaNacimiento" 
								      										name="usuario.fechaNacimiento"  
								      										changeMonth="true" 
								      										changeYear="true" 
								      										yearRange="1960:1997" 
								      										showAnim="fadeIn" 
								      										showOptions="{direction: 'up' }" 
								      										duration="fast" 
								      										maxDate="-18y,+7m,+31d" 
								      										readonly="true" 
								      										displayFormat="yy-mm-dd"
								      										placeholder="Fecha Nacimiento"
								      										required="true"/>
														</span>
													</label>			
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Celular" name="usuario.cell"  id="idCell"/>
															<i class="ace-icon glyphicon glyphicon-phone"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Direccion" name="usuario.direccion" id="idDireccion" />
															<i class="ace-icon glyphicon glyphicon-map-marker"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<!-- <input type="email" class="form-control" placeholder="Celular" /> -->
															<s:url id="jsonDistrito"  action="cargaDinamicoDistrito"/> 	
																<sj:select 	cssClass="form-control"
																			href="%{jsonDistrito}"  
																			id="idDistrito" 
																			name="usuario.distrito.idDistrito"
																	 		list="lstDistrito" 
																	 		listKey="idDistrito"
																 		    listValue="descripcion"  
																 		    headerKey="-1"   
																			headerValue="[ Seleccione Distrito ]" />	
															<!-- <i class="ace-icon fa fa-envelope"></i> -->
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="DNI"  name="usuario.dni" id="idDni"/>
															<i class="ace-icon fa fa-square-o"></i>
														</span>
													</label>
													
													<div class="control-group">
														<label class="control-label bolder orange">Sexo</label>
														<div class="radio">
															<label style="float: left;">
																<input type="radio" class="ace" value="Masculino" name="usuario.sexo" checked>
																<span class="lbl"> Masculino</span>
															</label>											
															<label>
																<input type="radio" class="ace" value="Femenino" name="usuario.sexo">
																<span class="lbl"> Femenino</span>
															</label>
														</div>
													</div> 

								
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" name="usuario.correo" id="idCorreo"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" name="usuario.password" id="idPassword"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" name="idPasswordRepeat" id="idRepeat"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<%-- <label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label> --%>

													<div class="space-24"></div>

													<div class="clearfix" >
														<div style="float: right;" >
															<s:submit type="button" label="Registrarse"  cssClass="width-100%  pull-right btn btn-success" id="idFormAgregarCli"  button="true" formIds="idForm"  />
														</div>
														<div style="float: right; margin-right: 20px;">
															<s:reset type="button" label="Reset"  cssClass="width-100% pull-right btn btn-success"/>
														</div>
													</div>
												</fieldset>
											</s:form>
											
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Volver a iniciar sesión
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->
				
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->


	
	</body>
</html>