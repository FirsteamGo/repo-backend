using prjCoreFT.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace prjCoreFT.Controllers
{
    public class SuperController : Controller
    {

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            if (!HttpContext.Session.Keys.Contains(CDictionary.SK_LOINGED_USER))
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                {
                    controller = "Home",
                    action = "Login"
                }));
            }
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
