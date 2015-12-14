<%@page import="bean.UsuarioBean"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>


<nav class="navbar navbar-static-top navbar-default navbar-header-full navbar-dark yamm" role="navigation" id="header">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </button>
            <a id="ar-brand" class="navbar-brand hidden-lg hidden-md hidden-sm" href="index.jsp">LUCKY <span>SAC</span></a>
        </div> <!-- navbar-header -->
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/a_home_intranet">Inicio</a>
                </li>
                <li class="dropdown yamm-fw">
                    <a href="${pageContext.request.contextPath}/a_catalogo_intranet">Catalogo</a>
                </li>
                <s:iterator value="#session.objUsuarioMenus" >
					<li>
						<a href="${pageContext.request.contextPath}/<s:property value="ruta"/>">
						<s:property value="descripcion"/>
						</a>
					</li>
				</s:iterator>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Conocenos</a>
       			</li>
       			 <%-- <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/a_mantenimiento_producto">PP</a>
                </li> --%>
       		</ul>
       </div><!-- navbar-collapse -->
    </div><!-- container -->
</nav>