﻿using prjCoreFT.Models;

namespace prjCoreFT.ViewModel
{
    public class CSetOrderDetailViewModel
    {
        private SetOrderDetail _product;
        public SetOrderDetail Product
        {
            get { return _product; }
            set { _product = value; }
        }

        public CSetOrderDetailViewModel()
        {
            _product = new SetOrderDetail();
        }
        public int 套裝行程ID
        {
            get { return _product.套裝行程id; }
            set { _product.套裝行程id = value; }
        }
        public int? 營地ID
        {
            get { return _product.營地id; }
            set { _product.營地id = value; }
        }
        public string? 營區名稱
        {
            get { return _product.營地.營區名稱; }
            set { _product.營地.營區名稱 = value; }
        }
        public int? 營區細項ID
        {
            get { return _product.營區細項id; }
            set { _product.營區細項id = value; }
        }
        public string? 項目內容 
        {
            get { return _product.營區細項.露營形式.項目內容; }
            set { _product.營區細項.露營形式.項目內容 = value; }
        }
        public string? 活動名稱
        {
            get { return _product.營區細項.活動.活動名稱; }
            set { _product.營區細項.活動.活動名稱 = value; }
        }        
        public int? 餐廳ID
        {
            get { return _product.餐廳id; }
            set { _product.餐廳id = value; }
        }
        public string? 餐廳名
        {
            get { return _product.餐廳.餐廳名; }
            set { _product.餐廳.餐廳名 = value; }
        }
        public string? 套裝方案
        {
            get { return _product.套裝方案; }
            set { _product.套裝方案 = value; }
        }
        public string? 套裝細項
        {
            get { return _product.套裝細項; }
            set { _product.套裝細項 = value; }
        }
        
        public int? 套裝行程價格
        {
            get { return _product.套裝行程價格; }
            set { _product.套裝行程價格 = value; }
        }
        public IEnumerable<Camp>? 營區表單 {get; set;}
        public IEnumerable<CampDetail>? 營區細節表單 { get; set;}
        public IEnumerable<SetFood>? 套裝餐廳表單 { get; set;}
        public IEnumerable<ActDetail>? 活動表單 {get; set;}   //
    }
}
