package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.UsuarioService;
import service.UsuarioServiceImpl;
import sun.invoke.empty.Empty;
import bean.AccesoBean;
import bean.UsuarioBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value = "dawi")
@InterceptorRef("jsonValidationWorkflowStack")
//@Validations(requiredStrings={
//		@RequiredStringValidator(fieldName="loginUser", type = ValidatorType.FIELD, message="El usuario es requerido"),
//		@RequiredStringValidator(fieldName="loginPassword", type = ValidatorType.FIELD, message="La clave es incorrecta")
//})

public class LoginAction extends ActionSupport{
	//	Serial autogenerado
	private static final long serialVersionUID = 6180486311318519566L;
	private static final Log log  = LogFactory.getLog(LoginAction.class);
	
	private UsuarioService service = new UsuarioServiceImpl();
	
	private Map<String, Object> session = (Map<String,Object>)ActionContext.getContext().getSession();
	private HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
	
	
	private String loginUser;
	private String loginPassword;
	private String mensajeUser,mensajePass;
	private String asnwer;
	private UsuarioBean beanSalida;
	
	@Action(value = "/login", results = { @Result(location = "t_home_intranet", name = "success",type="tiles"),
										  @Result(location = "t_home", name = "login",type="tiles")})
	
	public String login()throws Exception{
		log.info("En LoginAction");
		
		UsuarioBean bean = new UsuarioBean();	
			bean.setLogin(loginUser);	
			bean.setPassword(loginPassword);

		beanSalida = service.login(bean);
			if(beanSalida==null){			
				if(service.buscaUsuarioXlogin(bean.getLogin())==true){
					mensajeUser="Usuario no existe";
					return "login";
				}else{
					if(service.validarPassword(bean.getLogin(),bean.getPassword())==true){
						
						List<AccesoBean> accesos = service.traerAccesosDeUsuario(beanSalida.getIdUsuario());
						session.put("objUsuario", beanSalida);
						session.put("objUsuarioMenus", accesos);
						return "success";
					}else{
						mensajePass="Password incorrecto";
						return "login";
					}
				}
			}else{
				List<AccesoBean> accesos = service.traerAccesosDeUsuario(beanSalida.getIdUsuario());
				session.put("objUsuario", beanSalida);
				session.put("objUsuarioMenus", accesos);
				return "success";
			}
			
			//service.validarPassword(bean.getPassword())==true

	}
	
	
	
	public String getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getAsnwer() {
		return asnwer;
	}
	public void setAsnwer(String asnwer) {
		this.asnwer = asnwer;
	}



	public String getMensajeUser() {
		return mensajeUser;
	}



	public void setMensajeUser(String mensajeUser) {
		this.mensajeUser = mensajeUser;
	}



	public String getMensajePass() {
		return mensajePass;
	}



	public void setMensajePass(String mensajePass) {
		this.mensajePass = mensajePass;
	}
	


}
