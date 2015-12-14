package dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import bean.PedidoBean;

public class MySqlPedidoDao implements PedidoDao{

	SqlSessionFactory sqlMapper = null;
	{
		String archivo = "ConfiguracionIbatis.xml";
		try {
			Reader reader = Resources.getResourceAsReader(archivo);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public int insertaPedido(PedidoBean bean) throws Exception {
		SqlSession session = sqlMapper.openSession();
		int salida = 0;
		try {
			salida += session.insert("dawi.SQL_insertaPedidoCabecera",bean);

			//for (DetalleBoletaBean aux : bean.getDetalles()) {
			//	aux.setIdBoleta(bean.getIdBoleta());
			//	salida += session.insert("dawi.SQL_insertaPedidoDetalle",aux);
			//}
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return salida;
	}
	
}
