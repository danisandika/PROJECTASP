<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Cust.master" AutoEventWireup="true" CodeFile="Riwayat.aspx.cs" Inherits="Customer_Pembelian" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Apotek Mustika Farma</title>

  <!-- css -->
  <link href="Medicio/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="Medicio/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="plugins/cubeportfolio/css/cubeportfolio.min.css">
  <link href="Medicio/css/nivo-lightbox.css" rel="stylesheet')?>">
  <link href="Medicio/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css">
  <link href="Medicio/css/owl.carousel.css" rel="stylesheet" media="screen">
  <link href="Medicio/css/owl.theme.css" rel="stylesheet" media="screen">
  <link href="Medicio/css/animate.css" rel="stylesheet">
  <link href="Medicio/css/style.css" rel="stylesheet">

  <!-- boxed bg -->
  <link id="bodybg" href="Medicio/bodybg/bg1.css" rel="stylesheet" type="text/css">
  <!-- template skin -->
  <link id="t-colors" href="Medicio/color/default.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainMenu" Runat="Server">
     <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style>
      

    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="Home.aspx">Home</a></li>
            <%--<li><a href="#service">Transaksi Penjualan</a></li>--%>
            <%--<li><a href="#doctor">Pembayaran</a></li>--%>
            <li><a href="Riwayat.aspx">Riwayat</a></li>
            <%--<li><a href="#pricing">Antrian</a></li>--%>
            
          </ul>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Section1" Runat="Server">
       <!--SECTION VIEW-->
     <section id="secView" runat="server" class="home-section paddingbot-60">
   <div class="container marginbot-50">
     <div class="container-fluid">
        <div class="row">
          <div class="col-12">
                    
                <asp:GridView ID="gridRiwayat" runat="server" CssClass="table table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDRiwayat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridRiwayat_PageIndexChanging"
                    OnRowCommand="gridRiwayat_RowCommand" OnSorting="gridRiwayat_Sorting" OnSelectedIndexChanged="gridRiwayat_SelectedIndexChanged"
                    OnRowDeleting="gridRiwayat_RowDeleting" OnRowDataBound="gridRiwayat_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="1%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NamaPasien"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Pasien"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="penyakit"  HeaderStyle-CssClass="table-bordered" HeaderText="Penyakit"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pesan"  HeaderStyle-CssClass="table-bordered" HeaderText="Pesan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tanggal"  HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Nama Dokter" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="berat" ItemStyle-CssClass="hiddencol" HeaderText="Berat" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                         <asp:BoundField DataField="tinggi" ItemStyle-CssClass="hiddencol" HeaderText="Tinggi" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>                        
                        <asp:BoundField DataField="tensi" ItemStyle-CssClass="hiddencol" HeaderText="tensi" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>                       
                        <asp:BoundField DataField="gula" ItemStyle-CssClass="hiddencol" HeaderText="gula" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="kolestrol" ItemStyle-CssClass="hiddencol" HeaderText="kolestrol" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>                               
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDRiwayat")%>' 
                                OnClick="lnkViewDetails_Click" Text="Detail" style="margin-left:20px"  class="fa fa-check icon-success"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            
                 </div>
                </div>    
              </div>
            </div>
        </section>


     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Panel ID="pnlGridViewDetails" runat="server" Width="490px" Height="400px"
        CssClass="pnlBackGround">
         <div class="row">
         <div class="card-body">
         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true"></asp:label>
        </div>
        </div>
       <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true">DETAIL</asp:label>
        </div>
        </div>
        <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Dokter</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="nama" runat="server" Text="Nama Dokter "></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Berat</asp:label>
       </div>
        <div class="col-md-5">    
       <asp:Label ID="berat" runat="server" Text="Berat"></asp:Label>
        </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tinggi</asp:Label>
        </div>
        <div class="col-md-5">
       <asp:Label ID="tinggi" runat="server" Text="Tinggi"></asp:Label>
         </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tensi</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="tensi" runat="server" Text="Tensi"></asp:Label>
        </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Gula</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="gula" runat="server" Text="Gula"></asp:Label>
         </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Kolestrol</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="kolestrol" runat="server" Text="kolestrol"></asp:Label>
 
        </div></div>

        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
     </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server"  TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Section2" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Section3" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Section4" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Section5" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Section6" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="section7" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

