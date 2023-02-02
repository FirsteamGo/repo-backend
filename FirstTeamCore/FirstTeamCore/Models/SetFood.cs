﻿using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class SetFood
    {
        public SetFood()
        {
            SetOrderDetails = new HashSet<SetOrderDetail>();
        }

        public int 餐廳id { get; set; }
        public string? 餐廳名 { get; set; }
        public string? 餐廳電話 { get; set; }
        public string? 地址 { get; set; }
        public string? 餐點細項 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<SetOrderDetail> SetOrderDetails { get; set; }
    }
}
