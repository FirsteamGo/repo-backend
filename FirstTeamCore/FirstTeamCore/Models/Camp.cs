using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class Camp
    {
        public Camp()
        {
            ActDetails = new HashSet<ActDetail>();
            CampDetails = new HashSet<CampDetail>();
            SetOrderDetails = new HashSet<SetOrderDetail>();
        }

        public int 營區id { get; set; }
        public string? 營區名稱 { get; set; }
        public string? 營區地址 { get; set; }
        public string? 地區 { get; set; }
        public string? 縣市 { get; set; }
        public string? 營區介紹 { get; set; }
        public int? 容納人數 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<ActDetail> ActDetails { get; set; }
        public virtual ICollection<CampDetail> CampDetails { get; set; }
        public virtual ICollection<SetOrderDetail> SetOrderDetails { get; set; }
    }
}
