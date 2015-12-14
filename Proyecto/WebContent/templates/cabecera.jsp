<%@page import="bean.UsuarioBean"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>


<script type="text/javascript">	
	if(window.history.forward(1)!= null){
		windows.hystori.forward(1);		
	}
</script>

<header id="header-full-top" class="hidden-xs header-full">
    <div class="container">
        <div class="header-full-title">
            <h1 class="animated fadeInRight"> &emsp;LUCKY <span>SAC</span></h1>
            <p class="animated fadeInRight">  &emsp;&emsp;DEPARTAMENTO DE TECNOLOGIA E INFORMACION</p>
        </div>
        <nav class="top-nav" style="margin-top: 2px">
            <ul class="top-nav-social hidden-sm">            	
                <li><a href="#" class="animated fadeIn animation-delay-7 twitter"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#" class="animated fadeIn animation-delay-8 facebook"><i class="fa fa-facebook"></i></a></li>     
            </ul>
            
				<tiles:insertAttribute	name="login" />
				<%-- <font color="red" size="2" style="font-weight: bold; "><s:property value="mensaje"/></font> --%>
				<!-- %{mensaje} -->
        </nav>
    </div> <!-- container -->
</header> <!-- header-full -->