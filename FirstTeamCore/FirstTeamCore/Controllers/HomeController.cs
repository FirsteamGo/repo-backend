using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Text.Json;

namespace prjCoreFT.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            if (!HttpContext.Session.Keys.Contains(CDictionary.SK_LOINGED_USER))
                return RedirectToAction("Index");

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]

        public IActionResult Login(CLogin Login)
        {
            MemberInfo user = (new dbFTContext()).MemberInfos.FirstOrDefault(t => t.會員帳號.Equals(Login.txtAccount) && t.會員密碼.Equals(Login.txtPassword));

            if (user != null && user.會員密碼.Equals(Login.txtPassword))
            {
                string json = JsonSerializer.Serialize(user);
                HttpContext.Session.SetString(CDictionary.SK_LOINGED_USER, json);
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}