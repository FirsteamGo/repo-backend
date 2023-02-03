using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;


namespace prjCoreFT.Models
{
    [ModelMetadataType(typeof(MemberInfoMetadata))]
    public partial class MemberInfo
    {
    }

    [ModelMetadataType(typeof(CLoginMetadata))]
    public partial class CLogin
    {
    }

    [ModelMetadataType(typeof(SelfOrderMetadata))]
    public partial class SelfOrder
    {
    }

    [ModelMetadataType(typeof(SelfFoodMetadata))]
    public partial class SelfFood
    {
    }

    [ModelMetadataType(typeof(RentDetailMetadata))]
    public partial class RentDetail
    {
    }

    [ModelMetadataType(typeof(ActEditMetadata))]
    public partial class ActDetail
    {
    }

    


}