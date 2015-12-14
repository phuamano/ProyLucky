
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<script type="text/javascript">

function validaSubmite(){ 
   	if (document.getElementById("loginUser").value == "" && document.getElementById("loginPassword").value == "") 
      	alert("Usuario o Password en blanco")
    else if (document.getElementById("loginUser").value == "") 
      	alert("Ingrese Usuario") 
    else if (document.getElementById("loginPassword").value == "") 
      	alert("Ingrese Password") 
   	else 
      	document.getElementById("idLogin").submit();
}


</script>

<div class="dropdown animated fadeInDown animation-delay-11">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-user"></i> Iniciar Sesion</a>     
<div
	class="dropdown-menu dropdown-menu-right dropdown-login-box animated fadeInUp">
	<s:form  id="idLogin" action="login" method="POST">
		<h4>Iniciar Sesion</h4>
		<div class="form-group">
			<div><font color="red" size="2" style="font-weight: bold; "><s:property value="mensajeUser" /></font></div>
			<div class="input-group login-input">
				<span class="input-group-addon"><i class="fa fa-user"></i></span> 
				<input type="text" class="form-control" placeholder="E-mail o nombre de Usuario" name="loginUser" id="loginUser">
			</div>
			<br>
			<div><font color="red" size="2" style="font-weight: bold; "><s:property value="mensajePass" /></font></div>
			<div class="input-group login-input">
				<span class="input-group-addon"><i class="fa fa-lock"></i></span> 
				<input type="password" class="form-control" placeholder="Contraseña" name="loginPassword" id="loginPassword">
			</div>
			<div class="pull-left" style="margin-top: 10px">
				<a href="${pageContext.request.contextPath}/a_clienteRegistro">Registrarse</a>
			</div>
			<button type="button" class="btn btn-ar btn-primary pull-right" onclick="validaSubmite()" >Ingresar</button> 
			<div class="clearfix"></div> 
		</div>
	</s:form>
</div>
</div>