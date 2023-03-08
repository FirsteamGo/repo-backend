﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace APIprjCoreFT.Models
{
    public partial class CampDetail
    {
        public CampDetail()
        {
            SelfOrder = new HashSet<SelfOrder>();
            SetOrderDetail = new HashSet<SetOrderDetail>();
        }

        public int 營區細項id { get; set; }
        public int? 營區id { get; set; }
        public int? 活動id { get; set; }
        public int? 露營形式id { get; set; }
        public string 詳細內容 { get; set; }
        public string 圖片 { get; set; }
        public int? 單價 { get; set; }
        public string 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ActDetail 活動 { get; set; }
        public virtual Camp 營區 { get; set; }
        public virtual CampStyle 露營形式 { get; set; }
        public virtual ICollection<SelfOrder> SelfOrder { get; set; }
        public virtual ICollection<SetOrderDetail> SetOrderDetail { get; set; }
    }
}