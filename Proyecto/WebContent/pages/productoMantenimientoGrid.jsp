<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
 

<s:url id="jsonDataListaProducto" action="mantelistaProductoGrid" />
<div align="left" style="font-size: 11px;">
<font color="red"><s:property value="mensaje" /></font></div>

 <script type="text/javascript">
 function formatImage(cellvalue, options, row) {
		return "<img src='verImagenProducto?idCodigo="+cellvalue  +"' width='100' height='80' />";
	}
</script>   


<sjg:grid id="idGridExtraccionEquipos" 
		 href="%{jsonDataListaProducto}"  
		 caption="Lista de Productos" 
		 dataType="json" 
		 pager="true" 
		 gridModel="grdProducto" 
		 multiselect="false" 
		 navigator="true"
		 navigatorAdd="false"    
		 navigatorSearch="true" 
		 navigatorRefresh="false" 
		 onSelectRowTopics="rowselectProducto"
		 navigatorDelete="false"
		 navigatorEdit="false"
		 rowList="5,10,15"
		 rowNum="5"
		 width="1070" >
		 
	<sjg:gridColumn name="idProducto" key="true" index="idProducto"   title="Id" width="50" />
	<sjg:gridColumn name="nombre" index="nombre"  title="Nombre" width="70" sortable="false" />
	<sjg:gridColumn name="precio"  index="precio"  title="Precio" width="70" sortable="false" />	
	<sjg:gridColumn name="idProducto" formatter="formatImage" index="Imagen" title="Imagen" width="70"  />
	<sjg:gridColumn name="descripcion"  index="descripcion"  title="Descripcion" width="70" />
	<sjg:gridColumn name="fecha"  index="fecha" formatter="date" title="Fecha" width="62" />
	<sjg:gridColumn name="tipo.idTipoProducto"  index="tipo.idTipoProducto"  title="CodigoTipo" width="70" hidden="true" />
	<sjg:gridColumn name="tipo.descripcion"  index="tipo.descripcion"  title="Tipo" width="70" />
	<sjg:gridColumn name="categoria.idCategoriaProducto"  index="categoria.idCategoriaProducto"  title="CodigoCategoria" width="70" hidden="true"  />
	<sjg:gridColumn name="categoria.descripcion"  index="categoria.descripcion"  title="Categoria" width="70"/>
	<sjg:gridColumn name="subcategoria.idSubCategoriaProducto"  index="subcategoria.idSubCategoriaProducto"  title="CodigoSubCategoria" width="70" hidden="true"  />
	<sjg:gridColumn name="subcategoria.descripcion"  index="subcategoria.descripcion"  title="SubCategoria" width="70"  />
	<sjg:gridColumn name="idUsuario" index="idUsuario"  title="Usuario" width="70"/>
</sjg:grid>		  

  
