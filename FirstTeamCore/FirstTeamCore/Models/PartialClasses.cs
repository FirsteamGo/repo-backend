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
}