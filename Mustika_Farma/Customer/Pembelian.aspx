<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Cust.master" AutoEventWireup="true" CodeFile="Pembelian.aspx.cs" Inherits="Customer_Pembelian" %>

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
            <li class="active"><a href="#intro">Home</a></li>
            <li><a href="#service">Transaksi Penjualan</a></li>
            <li><a href="#doctor">Pembayaran</a></li>
            <li><a href="Pembelian.aspx">Pembelian</a></li>
            <li><a href="#pricing">Antrian</a></li>
            
          </ul>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Section1" Runat="Server">
     <section id="intro" class="intro">
      <div class="intro-content">
        <div class="container">
          
            <div class="col-lg-7">
              <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
               <section class="content" id="secView" runat="server">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Obat</h3>
                   <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                <div class="row form-group">
                    <div class="col-md-8">
                    <asp:TextBox id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    </div>
                     <div class="col-md-3">
                      <asp:LinkButton BackColor="SkyBlue" CssClass="col-lg-8" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><span class="fa fa-search" onclick="return confirm('Are you sure you want to delete this item?');"></span></i></asp:LinkButton>
                  </div>
                  </div>
                </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridObat" runat="server" CssClass="table table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting" OnSelectedIndexChanged="gridObat_SelectedIndexChanged" >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered"   HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaObat" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="namaJenis" HeaderStyle-CssClass="table-bordered"  HeaderText="Jenis Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="JumlahObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="JumlahObat" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Keterangan" HeaderStyle-CssClass="table-bordered"  HeaderText="Keterangan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Keterangan" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Nama_Lokasi"  HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" HeaderText="Lokasi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDLokasi" >
                        </asp:BoundField>

                        <asp:BoundField DataField="Satuan"  HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Satuan" >
                        </asp:BoundField>

                        <asp:BoundField DataField="Harga" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Expired" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" HeaderText="Expired"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Expired" >
                        </asp:BoundField>

                        <%--<asp:ImageField ControlStyle-Width="100" HeaderStyle-CssClass="table-bordered"  ControlStyle-Height = "100" DataImageUrlField ="Foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                       </asp:ImageField>--%>
                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="fa fa-shopping-cart ">Tambah</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="linkDelete" CommandName="cmDelete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Delete Data"><span class="fa fa-ban" onclick="return confirm('Are you sure you want to delete this item?');">Batal</span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                </div>
              
              </div>
            </div>
          </div>
         </div>
        </section>
              </div>
            </div>

            <div class="row">
            <div class="col-lg-5">
            <div class="well well-trans">
                <div class="wow fadeInRight" data-wow-delay="0.1s">

              <div class="wow fadeInDown" data-wow-offset="0" data-wow-delay="0.1s">
                <h2 class="h-ultra">Transaksi Pembelian</h2>
              <div class="card card-primary">
                <div class="card-body">
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Tanggal Order</label>
                    </div>
                      <div class="col-md-5">
                    <asp:TextBox ID="txtnamaJenis" CssClass="form-control" runat="server" TextMode="Date"/>
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Nomor Antrian</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtDeskripsi" CssClass="form-control" runat="server" />
                  </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Resep Dokter</label>
                    </div>
                    <div class="col-md-5">
                   <asp:RadioButton ID="rbAda" runat="server" Text="Ada" />
                    <asp:RadioButton ID="rbTidak" runat="server" Text="Tidak Ada" />
                  </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Jumlah</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtJumlah" CssClass="form-control" runat="server" />
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Total Harga</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" />
                  </div>
                </div>
            </div>
            </div>

             </div> 
            </div>
             </div>
            </div>
          </div>
       
      </div>
    </div>

    </section>

     <!--SECTION ADD-->
     <section class="content" id="secAdd" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            
                <!-- /.card-body -->

                <div class="card-footer">
                  <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSave_Click"/>
                </div>
              
            </div>
              </div>
            </div>
         
        </section>
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

