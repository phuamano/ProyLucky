<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<script src="js/jquery.min.js"></script>
<script src="js/alertify.min.js"></script>
<link href="css/alertify.core.css" rel="stylesheet" title="default" 	type="text/css" />
<link href="css/alertify.default.css" rel="stylesheet" title="default" 	type="text/css" />

<script>
$(document).ready(function(){
	alertify.alert("<s:property value='mensaje'/>"){
	} 
});
</script>

<s:url id="jsonDataListaUsuario" action="mantelistaUsuarioGrid" />
<%-- <div align="left" style="font-size: 11px;">
<font color="red"><s:property value="mensaje" /></font></div --%>>

<sjg:grid id="idGridExtraccionEquipos" 
		 href="%{jsonDataListaUsuario}"  
		 caption="Lista de Usuario" 
		 dataType="json" 
		 pager="true" 
		 gridModel="grdUsuario" 
		 multiselect="false" 
		 navigator="true"
		 navigatorAdd="false"    
		 navigatorSearch="false" 
		 navigatorRefresh="false" 
		 onSelectRowTopics="rowselectUsuario"
		 navigatorDelete="false"
		 navigatorEdit="false"
		 scroll="true"
		 scrollrows="true"
		 width="1100" 
		 height="300">
		 
	<sjg:gridColumn name="idUsuario" key="true" index="idUsuario"   title="Id" width="50" />
	<sjg:gridColumn name="nombres" index="nombres"  title="Nombres" width="200" sortable="false" />
	<sjg:gridColumn name="apellidos" index="apellidos"  title="Apellidos" width="200" sortable="false" />
	<sjg:gridColumn name="correo"  index="correo"  title="Email" width="500" sortable="false" />	
	<sjg:gridColumn name="cell"  index="cell"  title="Cell" width="200" sortable="false" />	
	<sjg:gridColumn name="fechaNacimiento"  index="fechaNacimiento"  title="Fech Nac" width="300" sortable="false" />	
	<sjg:gridColumn name="direccion"  index="direcion"  title="Direccion" width="600" />
	<sjg:gridColumn name="dni"  index="dni"  title="DNI" width="200" />
	<sjg:gridColumn name="sexo"  index="sexo"  title="Sexo" width="200" />
	<sjg:gridColumn name="login"  index="login"  title="Login" width="200" />
	<sjg:gridColumn name="password"  index="password"   title="Pass" width="150" />
	<sjg:gridColumn name="distrito.idDistrito"  index="distrito.idDistrito" title="codigoDistrito" width="70" hidden="true"/>
	<sjg:gridColumn name="distrito.descripcion"  index="distrito.descripcion"  title="Distrito" width="500" />
	<sjg:gridColumn name="rol.idRol"  index="rol.idRol" width="70"  title="codigoRol"  hidden="true"/>
	<sjg:gridColumn name="rol.descripcion"  index="rol.descripcion"  title="Rol" width="200"  />
</sjg:grid>	
