<%@page import="bean.TipoBean"%>
<%@page import="bean.CategoriaBean"%>
<%@page import="bean.UsuarioBean"%>
<%@page import="dao.MySqlProductoDao"%>
<%@page import="bean.ProductoBean"%>
<%@page import="java.util.List"%>

<div class="container">
    <div class="row">
        <div class="col-md-3 hidden-sm hidden-xs">
            <div class="ec-filters-menu">
                <h3 class="section-title no-margin-top">Filtros</h3>
                <h4>Selecciona Categoria</h4>
                
                <ul>
                 <li><a href="javascript:void(0);" class="filter" data-filter="all">Todos</a></li> 
                <%MySqlProductoDao dao  = new MySqlProductoDao();
                List<TipoBean>	tipo=	dao.listarTipos();
			  	for (int i=0; i<tipo.size(); i++){
                %> 
                   
                    <li><a href="javascript:void(0);" class="filter" data-filter=".category-chocolate"><%=tipo.get(i).getDescripcion() %></a></li> 
<!--                     <li><a href="javascript:void(0);" class="filter" data-filter=".category-fresa">Fresa</a></li>
                    <li><a href="javascript:void(0);" class="filter" data-filter=".category-vainilla">Vainilla</a></li>
                    <li><a href="javascript:void(0);" class="filter" data-filter=".category-perzonalizado">Personalizados</a></li> -->
                <%} %> 
                </ul>
                <h4>Ordernar por</h4>
                <ul>
                    <li><a href="javascript:void(0);" class="sort" data-sort="price:asc">Precio: Menor a Mayor</a></li>
                    <li><a href="javascript:void(0);" class="sort" data-sort="price:desc">Precio: Mayor a Menor</a></li>
                    <li><a href="javascript:void(0);" class="sort" data-sort="popularity:desc">Mas Populares</a></li>
                    <li><a href="javascript:void(0);" class="sort" data-sort="date:desc">Fecha de Lanzamiento</a></li>
                    
                </ul>
            </div>  
            <h3 class="section-title">Ultimas Ofertas</h3>
            <div class="bxslider-controls">
                 <span id="bx-prev5"></span>
                 <span id="bx-next5"></span>
             </div>
            <ul class="bxslider" id="offers">
            	<%
						MySqlProductoDao dao1 = new MySqlProductoDao();
					  	List<ProductoBean>	productos1=	dao1.traeTodos();
					  	for (int i=0; i<productos1.size(); i++){
					  		
				%>
                <li>
                    <div class="ec-box">
                        <div class="ec-box-header" data-date=<%= productos1.get(i).getFecha() %>><a href="#"><%= productos1.get(i).getNombre() %></a></div>
                        <a href="#"><img src="verImagenProducto?idCodigo=<%= productos1.get(i).getIdProducto()%>" alt="" width='200' height='150' alt="" ></a>
                        <div class="ec-box-footer">
                            <span class="label label-primary"><%= productos1.get(i).getPrecio()%></span>
                             <% UsuarioBean b1 =(UsuarioBean)	session.getAttribute("objUsuario"); 
            				   if(b1==null){%>
	                            <a href="${pageContext.request.contextPath}/a_carrito_compras" class="btn btn-ar btn-success btn-sm pull-right"
	                            onclick="simpleCart.add({codigo:'<%= productos1.get(i).getIdProducto()%>',name:'<%= productos1.get(i).getNombre()%>', price:'<%=productos1.get(i).getPrecio()%>',size:'tiny',thumb:'verImagenProducto?idCodigo=<%= productos1.get(i).getIdProducto()%>'});" >
	                            <i class="fa fa-shopping-cart"></i> Agregar a carrito</a>
                            <%}else{ %>
                            	<a href="${pageContext.request.contextPath}/a_carrito_compras_intranet" class="btn btn-ar btn-success btn-sm pull-right"
                            	onclick="simpleCart.add({codigo:'<%= productos1.get(i).getIdProducto()%>',name:'<%= productos1.get(i).getNombre()%>', price:'<%=productos1.get(i).getPrecio()%>',size:'tiny',thumb:'verImagenProducto?idCodigo=<%= productos1.get(i).getIdProducto()%>'});" >
                            	<i class="fa fa-shopping-cart"></i> Agregar a carrito</a>
                            <%}%>         
                        </div>
                    </div>
                </li>
				<%}%>

            </ul>
        </div>
        <!-- Contenido -->
        <div class="col-md-9">
            <div class="row" id="Container">
            	 <%
						MySqlProductoDao dao2 = new MySqlProductoDao();
					  	List<ProductoBean>	productos=	dao2.traeTodos();
					  	for (int i=0; i<productos.size(); i++){
					  		
				%>	
                <div class="col-sm-4 mix category-fresa" data-price=<%= productos.get(i).getPrecio() %> data-date=<%= productos.get(i).getFecha() %> data-popularity="3">
                    <div class="ec-box">               
                        <div class="ec-box-header"><a href="#"><%= productos.get(i).getNombre() %></a></div>
                        <a href="#"><img src="verImagenProducto?idCodigo=<%= productos.get(i).getIdProducto()%>"  width='200' height='150' alt="" ></a>
                        <div class="ec-box-footer">
                            <span class="label label-primary"><%= productos.get(i).getPrecio() %></span>
                            <% UsuarioBean b =(UsuarioBean)	session.getAttribute("objUsuario"); 
            				   if(b==null){%>
	                            <a href="${pageContext.request.contextPath}/a_carrito_compras" class="btn btn-ar btn-success btn-sm pull-right"
	                            onclick="simpleCart.add({codigo:'<%= productos1.get(i).getIdProducto()%>',name:'<%= productos.get(i).getNombre()%>', price:'<%=productos.get(i).getPrecio()%>',size:'tiny',thumb:'verImagenProducto?idCodigo=<%= productos.get(i).getIdProducto()%>'});" >
	                            <i class="fa fa-shopping-cart"></i> Agregar a carrito</a>
                            <%}else{ %>
                            	<a href="${pageContext.request.contextPath}/a_carrito_compras_intranet" class="btn btn-ar btn-success btn-sm pull-right"
                            	onclick="simpleCart.add({codigo:'<%= productos1.get(i).getIdProducto()%>',name:'<%= productos.get(i).getNombre()%>', price:'<%=productos.get(i).getPrecio()%>',size:'tiny',thumb:'verImagenProducto?idCodigo=<%= productos.get(i).getIdProducto()%>'});" >
                            	<i class="fa fa-shopping-cart"></i> Agregar a carrito</a>
                            <%}%>         
                        </div>
                    </div>
                </div>
                <%} %>
            </div> 
        </div>
    </div>
    <!-- <div>
          <h3>Tu Carrito</h3>
            <div class="simpleCart_items" >
			</div>
			Final Total: <span id="simpleCart_grandTotal" class="simpleCart_grandTotal"></span> 
			<div class="checkoutEmptyLinks">
				<a href="#" class="simpleCart_empty">Vaciar Carrito</a>
				<a href="#" class="simpleCart_checkout">checkout</a>
			</div>
		</div> -->
</div> <!-- container -->

