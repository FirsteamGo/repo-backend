using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace prjCoreFT.Controllers
{
    public class ShopController : SuperController
    {
        IWebHostEnvironment _environment;
        public ShopController(IWebHostEnvironment p)
        {
            _environment = p;
        }
        public dbFTContext db = new dbFTContext();

        public IActionResult ShopOrderList(string txtKeyword)
        {
            IEnumerable<ShopOrder> datas = null;

            if (string.IsNullOrEmpty(txtKeyword))
                //datas = db.ShopOrders.Include(s => s.商品細項).Include(s => s.會員);
                datas = from t in db.ShopOrders
                        select t;
            else
                //datas = db.ShopOrders.Include(s => s.商品細項).Include(s => s.會員).Where(t => t.細項.Contains(txtKeyword) || t.購物評價.Contains(txtKeyword));
            datas = db.ShopOrders.Where(t => t.細項.Contains(txtKeyword) || t.購物評價.Contains(txtKeyword));

            return View(datas);
           
        }
        public IActionResult ShopOrderEdit(int? id)
        {
            if (id != null)
            {

                ShopOrder x = db.ShopOrders.FirstOrDefault(t => t.商店id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("ShopOrderList"); //刪除後回傳給List
        }
        [HttpPost]
        //存入資料庫
        public IActionResult ShopOrderEdit(InputViewModel.CShopOrderViewInput p)  //使用CSelfFoodViewModel
        {

            ShopOrder x = db.ShopOrders.FirstOrDefault(t => t.商店id == p.商店id);
            if (x != null)
            {
                x.細項 = p.細項;
                x.總價 = p.總價;
                x.購物評價 = p.購物評價;
                db.SaveChangesAsync();
            }
            return RedirectToAction("ShopOrderList");
        }
        public IActionResult OrderDelete(int? id)
        {
            if (id != null)
            {
                ShopOrder delproduct = db.ShopOrders.FirstOrDefault(t => t.商店id == id);
                if (delproduct != null)
                {
                    db.ShopOrders.Remove(delproduct);
                    db.SaveChanges();
                }
            }

            return RedirectToAction("ShopOrderList");


        }


        //========================這裡是商店功能分隔線===================================
        public IActionResult ShopDetailList(string txtkeyword)
        {
            IEnumerable<ShopDetail> datas = null;
            if (string.IsNullOrEmpty(txtkeyword))
                datas = from k in db.ShopDetails
                        select k;
            else
                datas = db.ShopDetails.Where(k => k.產品名稱.Contains(txtkeyword) || k.品牌名稱.Contains(txtkeyword));
            return View(datas);
        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                ShopDetail delproduct = db.ShopDetails.FirstOrDefault(t => t.商品細項id == id);
                if (delproduct != null)
                {
                    db.ShopDetails.Remove(delproduct);
                    db.SaveChanges();
                }
            }

            return RedirectToAction("ShopDetailList");
        }
        public IActionResult ShopDetailCreate(int? id)
        {
            return View();
        }
        [HttpPost]
        public IActionResult ShopDetailCreate(ShopDetail k, IFormFile photo)
        {
            if (photo != null)
            {
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _environment.WebRootPath + "/images/" + photoName;
                k.產品圖片 = photoName;
                photo.CopyTo(new FileStream(path, FileMode.Create));
            }
            db.ShopDetails.Add(k);
            db.SaveChanges();
            return RedirectToAction("ShopDetailList");
        }
        [HttpPost]
        public IActionResult ShopDetailEdit(CShopDetailViewModel p)
        {
            ShopDetail x = db.ShopDetails.FirstOrDefault(t => t.商品細項id == p.商品細項id);
            if (x != null)
            {

                if (p.photo != null)
                {
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _environment.WebRootPath + "/images/" + photoName;
                    x.產品圖片 = photoName;
                    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                }

                
                x.產品名稱 = p.產品名稱;
                x.品牌名稱 = p.品牌名稱;
                x.產品說明 = p.產品說明;
                x.庫存 = p.庫存;
                x.單價 = p.單價;
                x.建立人 = p.建立人;
                x.建立時間 = p.建立時間;
                x.修改時間 = p.修改時間;
                x.修改人 = p.修改人;
                db.SaveChangesAsync();
            }
            return RedirectToAction("ShopDetailList");
        }

        public IActionResult ShopDetailEdit(int? id)
        {
            if (id != null)
            {
                ShopDetail x = db.ShopDetails.FirstOrDefault(t => t.商品細項id == id);
                if (x != null)
                {
                    return View(x);
                }
            }
            return RedirectToAction("ShopDetailList");
        }


    }
}
