<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Antrian.aspx.cs" Inherits="Antrian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Antrian Mustika Farma</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Font Awesome -->
      <link rel="stylesheet" href="AdminLTE/plugins/fontawesome-free/css/all.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="AdminLTE/dist/css/adminlte.min.css">
      <!-- Google Font: Source Sans Pro -->
      <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
        <body class="hold-transition lockscreen">
        <form id="form1" runat="server">
       <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
                <div class="lockscreen-wrapper">
                  <div class="lockscreen-logo">
                  <b>Antrian</b> Mustika Farma
                  </div>
                </div>

              <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>

               <asp:UpdatePanel ID="UpdatePanel" runat="server">
                 <ContentTemplate>
              <asp:Timer ID="Timer1" runat="server" Interval="5" OnTick="Timer1_Tick"></asp:Timer>
               
                 <asp:GridView ID="gridAntre" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="no_antrian" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridAntre_PageIndexChanging"
                    >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="5%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="number"  HeaderStyle-CssClass="table-bordered" HeaderText="Nomor Antrean"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="nama_jenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nama_jenis"  HeaderStyle-CssClass="table-bordered" HeaderText="Spesialis"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="40%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nama"  HeaderStyle-CssClass="table-bordered" HeaderText="Pasien"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                    </Columns>
                </asp:GridView>
                </ContentTemplate>
             </asp:UpdatePanel>

              </div>
           
              </div>
             </div>

                <!-- jQuery -->
                <script src="AdminLTE/plugins/jquery/jquery.min.js"></script>
                <!-- Bootstrap 4 -->
                <script src="AdminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
