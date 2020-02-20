<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Antrian</title>
    <script type='text/javascript'>
        // 10 second countdown timer
        var timeout = 10 * 10000;
        // Start your count down
        var countdown = setTimeout(function () { location.reload(true); }, timeout);
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        <asp:Button ID="btnNext" runat="server" Text="next" OnClick="btnNext_Click"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
