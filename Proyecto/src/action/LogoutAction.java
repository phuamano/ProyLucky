package action;

import javax.servlet.http.HttpServletResponse;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value="dawi")
public class LogoutAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("rawtypes")
	private SessionMap session = (SessionMap)ActionContext.getContext().getSession();
	private HttpServletResponse response = ServletActionContext.getResponse();
	private String mensaje;
	
	@Action(value = "/logout", results = {
			@Result(location = "t_home", name = "success", type = "tiles")
			})
	public String logout() throws Exception {
		
		session.invalidate();
		
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
		
		
		return SUCCESS;	
	}
	
	
	public String getMensaje() {
		return mensaje;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}	
}
