using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Back.Filter
{
    public class LoginFilter : ActionFilterAttribute
    {
        public bool IfCheck { get; set; }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (IfCheck == false)
            {
                return;
            }
            else
            {
               //HttpContext.Current.Response.Write("OnActionExecuting:正要准备执行Action的时候但还未执行时执行<br />");    
                if (HttpContext.Current.Session["AdminId"] == null)
                {
                    HttpContext.Current.Response.Write("<script>alert('请登录！');window.location.href='/Admin/AdminLogin'</script>");
                    HttpContext.Current.Response.End();
                    return;
                }
            }
        }
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            //HttpContext.Current.Response.Write("OnActionExecuted:Action执行时但还未返回结果时执行<br />");    
        }
        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            // HttpContext.Current.Response.Write("OnResultExecuting:OnResultExecuting也和OnActionExecuted一样，但前者是在后者执行完后才执行<br />");    
        }
        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            // HttpContext.Current.Response.Write("OnResultExecuted:是Action执行完后将要返回ActionResult的时候执行<br />");    
        }
    }
}