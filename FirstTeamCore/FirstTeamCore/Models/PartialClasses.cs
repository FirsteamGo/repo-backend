using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;


namespace prjCoreFT.Models
{
    [ModelMetadataTypeAttribute(typeof(MemberInfoMetadata))]
    public partial class MemberInfo
    {
    }

    [ModelMetadataTypeAttribute(typeof(CLoginMetadata))]
    public partial class CLogin
    {
    }

    [ModelMetadataTypeAttribute(typeof(SelfOrderMetadata))]
    public partial class SelfOrder
    {
    }

    [ModelMetadataTypeAttribute(typeof(SelfFoodMetadata))]
    public partial class SelfFood
    {
    }

    [ModelMetadataTypeAttribute(typeof(RentDetailMetadata))]
    public partial class RentDetail
    {
    }
    [ModelMetadataTypeAttribute(typeof(ActEditMetadata))]
    public partial class ActDetail
    {
    }
    
}