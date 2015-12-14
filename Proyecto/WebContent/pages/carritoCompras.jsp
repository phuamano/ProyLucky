<%@page import="bean.UsuarioBean"%>
<div class="container">
	<h1 class="animated fadeInRight" style="color: black"><i class="fa fa-shopping-cart"></i> Carrito de<span style="color: orange;"> Compras</span></h1>
    <div class="row">      
    	<div class="simpleCart_items" style="float: left;"></div>
    	<div style="float: left;">
			<div class="e-price">
				<p style="font-family: cursive;">Final Total: <span id="simpleCart_grandTotal" class="simpleCart_grandTotal "></span> </p>
			</div>		
			<br>
			<div class="checkoutEmptyLinks" align="center">
				<a href="#" class="simpleCart_empty button button-highlight button-pill button-small"><i class="glyphicon glyphicon-trash"></i>&nbsp;&nbsp;&nbsp;&nbsp;Vaciar Carrito</a>
				<%UsuarioBean b1 =(UsuarioBean)	session.getAttribute("objUsuario"); 
	          	if(b1==null){%>
					<a href="${pageContext.request.contextPath}/a_login_registro"  class="simpleCart_checkout button button-highlight button-pill button-small"><i class="fa fa-share"></i>&nbsp;&nbsp;&nbsp;&nbsp;Check out</a>				
				<%}else{%>
					<a href="${pageContext.request.contextPath}/a_orden_pedido" class="simpleCart_checkout button button-highlight button-pill button-small"><i class="fa fa-share"></i>&nbsp;&nbsp;&nbsp;&nbsp;Check out</a>
				<%}%>
			</div>
			<br>
			<div align="center">
				<%UsuarioBean b2 =(UsuarioBean)	session.getAttribute("objUsuario"); 
	          	if(b2==null){%>
					<a href="${pageContext.request.contextPath}/a_catalogo" class="button button-royal button-pill button-small"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;&nbsp;Continuar comprando</a> 	
			  	<%}else{%>
					<a href="${pageContext.request.contextPath}/a_catalogo_intranet" class="button button-royal button-pill button-small"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;&nbsp;Continuar comprando</a> 	
				<%}%>
			</div>
		</div>
	</div>
</div>


		