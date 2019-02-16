using GameMall_Back.Filter;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Back
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new LoginFilter() { IfCheck = true});
        }
    }
}
