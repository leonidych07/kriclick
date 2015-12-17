<%@ Page Language="C#" %>

<script runat="server">
    void Page_Load(Object sender, EventArgs e)
    {
        string SiteUrl = System.Web.HttpContext.Current.Request.Url.GetLeftPart(System.UriPartial.Authority) + System.Web.HttpContext.Current.Request.ApplicationPath;
        Response.Write("Site Url : " + SiteUrl);
        
        if (SiteUrl.Contains("localhost"))
        {
            Response.Write("<br/>localhost");
        }
        else
        {
            Response.Write("<br/>online");            
        }
    }
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
