using Microsoft.AspNetCore.Mvc;
using prjCoreFT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using prjCoreFT.ViewModel;
using Microsoft.EntityFrameworkCore;

namespace prjCoreFT.Controllers
{
   
        public class SelfController : Controller
        {

            IWebHostEnvironment _environment; //全域變數_environment
            public SelfController(IWebHostEnvironment p)
            {
                _environment = p;
            }



        //<!-- ======= 自選飲食 ======= -->
        dbFTContext db = new dbFTContext();
            //查詢
            public IActionResult SelfFood(CKeywordViewModel vm)
            //public IActionResult SelfFood(string txtKeyword)
            {

                IEnumerable<SelfFood> datas = null;
                if (string.IsNullOrEmpty(vm.txtKeyword))
                {
                    datas = from t in db.SelfFoods
                            select t;
                }
                else
                {
                    datas = db.SelfFoods.Where(t => t.商品名稱.Contains(vm.txtKeyword) ||
                    t.商品內容.Contains(vm.txtKeyword));
                }

                return View(datas);
            }


            public IActionResult FoodCreate()
            {
                return View();
            }
            [HttpPost]
            public IActionResult FoodCreate(SelfFood p, IFormFile photo)
            {

                if (photo != null)
                {
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _environment.WebRootPath + "/images/" + photoName;
                    p.圖片 = photoName;
                    photo.CopyTo(new FileStream(path, FileMode.Create));
                }
                else
                {
                    p.圖片 = "empty.jpg";
                }

                db.SelfFoods.Add(p);
                db.SaveChanges();
                return RedirectToAction("SelfFood");
            }


            public IActionResult Delete(int? id)
            {
                if (id != null)
                {

                    SelfFood delSelfFood = db.SelfFoods.FirstOrDefault(t => t.自選飲食id == id);
                    if (delSelfFood != null)
                    {
                        db.SelfFoods.Remove(delSelfFood);
                        db.SaveChangesAsync();
                    }
                }
                return RedirectToAction("SelfFood");
            }


            //第一步找資料
            public IActionResult FoodEdit(int? id)
            {
                if (id != null)
                {

                    SelfFood x = db.SelfFoods.FirstOrDefault(t => t.自選飲食id == id);
                    if (x != null)
                        return View(x);

                }
                return RedirectToAction("SelfFood"); //刪除後回傳給List
            }
            [HttpPost]
            //存入資料庫
            public IActionResult FoodEdit(CSelfFoodViewModel p)  //使用CSelfFoodViewModel
            {

                SelfFood x = db.SelfFoods.FirstOrDefault(t => t.自選飲食id == p.自選飲食id);
                if (x != null)
                {
                    if (p.photo != null)
                    {
                        string photoName = Guid.NewGuid().ToString() + ".jpg";
                        string path = _environment.WebRootPath + "/images/" + photoName;
                        x.圖片 = photoName;
                        p.photo.CopyTo(new FileStream(path, FileMode.Create));
                    }

                    x.商品名稱 = p.商品名稱;
                    x.商品內容 = p.商品內容;
                    x.需求人數 = p.需求人數;
                    x.需求份數 = p.需求份數;
                    x.單價 = p.單價;

                    db.SaveChangesAsync();
                }
                return RedirectToAction("SelfFood");
            }


        //<!-- ======= End自選飲食 ======= -->



        //<!-- ======= 自選訂單 ======= -->

        public IActionResult SelfOrder(CKeywordViewModel vm)
        {
            IEnumerable<SelfOrder> datas = null;
            if (string.IsNullOrEmpty(vm.txtKeyword))
            {
                datas = db.SelfOrders.Include(s => s.營區細項).ThenInclude(a => a.營區).Include(s => s.營區細項).ThenInclude(a => a.活動).Include(s => s.會員).Include(s => s.自選飲食).Include(s => s.租賃商店);
            }
            else
            {
                datas = db.SelfOrders.Include(s => s.營區細項).ThenInclude(a => a.營區).Include(s => s.營區細項).ThenInclude(a => a.活動).Include(s => s.會員).Include(s => s.自選飲食).Include(s => s.租賃商店).Where(t => t.自選訂單編號.Equals(vm.txtKeyword));
            }
            //var dbFT = db.SelfOrders.Include(s => s.營區細項).ThenInclude(a => a.營區).Include(s => s.營區細項).ThenInclude(a => a.活動).Include(s => s.會員).Include(s => s.自選飲食).Include(s => s.租賃商店);
            return View(datas);
        }

        public IActionResult SelfOrderEdit(int? id)
        {
            if (id != null)
            {

                SelfOrder x = db.SelfOrders.FirstOrDefault(t => t.自選訂單id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("SelfOrder"); //刪除後回傳給List
        }
        [HttpPost]
        //存入資料庫
        public IActionResult SelfOrderEdit(InputViewModel.CSelfOrderViewModelInput p)  //使用CSelfFoodViewModel
        {

            SelfOrder x = db.SelfOrders.FirstOrDefault(t => t.自選訂單id == p.自選訂單id);
            if (x != null)
            {
                x.入住時間 = p.入住時間;
                x.退住時間 = p.退住時間;
                x.露營天數 = p.露營天數;
                x.預計人數 = p.預計人數;
                x.租借總價 = p.租借總價;
                x.自選訂單總價 = p.自選訂單總價;
                x.評論 = p.評論;
                x.評分 = p.評分;

                db.SaveChangesAsync();
            }
            return RedirectToAction("SelfOrder");
        }

        //訂單刪除
        public IActionResult OrderDelete(int? id)
        {
            if (id != null)
            {

                SelfOrder delSelfOrder = db.SelfOrders.FirstOrDefault(t => t.自選訂單id == id);
                if (delSelfOrder != null)
                {
                    db.SelfOrders.Remove(delSelfOrder);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("SelfOrder");
        }

        //<!-- ======= End自選訂單 ======= -->


    }
    }
