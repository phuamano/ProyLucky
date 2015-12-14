<%@page import="bean.UsuarioBean"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<div class="dropdown animated fadeInDown animation-delay-11">

<%-- <%
	 UsuarioBean b =(UsuarioBean)	session.getAttribute("objUsuario");
%>

<%= b.getNombres()	 %> --%>




<label >User : <s:property  value="#session.objUsuario.nombres" />&nbsp;
				<s:property  value="#session.objUsuario.Apellidos" />
</label>	  

<a href="${pageContext.request.contextPath}/logout">
				Salir
</a>


</div> 
   

