﻿using APIprjCroeFT.Models;

namespace APIprjCroeFT.DTO
{
    public class ActDTO
    {
        public int 活動id { get; set; }
        public string 活動方式 { get; set; }
        public string 活動種類 { get; set; }
        public string 活動名稱 { get; set; }
        public DateTime? 開始日期 { get; set; }
        public DateTime? 結束日期 { get; set; }
        public int? 預計人數 { get; set; }
        public string 活動介紹 { get; set; }
        public int? 門票價格 { get; set; }
        public string 活動圖片 { get; set; }

        public int? 營區id { get; set; }
        public string 營區名稱 { get; set; }
        public string? 地區 { get; set; }
        public string? 縣市 { get; set; }
        public string 營區地址 { get; set; }
        public string 營區介紹 { get; set; }
        public int? 容納人數 { get; set; }


        //public virtual Camp 營區 { get; set; }
        public virtual IEnumerable<Camp> 營區表單 { get; set; }
    }
}
