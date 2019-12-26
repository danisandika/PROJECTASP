<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="beli.aspx.cs" Inherits="Karyawan_beli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Pembelian
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="namaKaryawan" Runat="Server">
    <asp:Label ID="namaKaryawan" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="title2" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content" Runat="Server">
 <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style>
<section id="intro" class="intro">
    <div class="col-lg-12">
    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">

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
                    <asp:TextBox Width="350%" id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    </div>
                     <div class="col-md-3">
                      <asp:LinkButton BackColor="SkyBlue" CssClass="col-lg-8" runat="server" ID="btnSearch" OnClick="btnSearch_Click1">
                          <span class="fa fa-search"></span></i></asp:LinkButton>
                  </div>
                  </div>
                </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridObat" runat="server" CssClass="table table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting1" OnSelectedIndexChanged="gridObat_SelectedIndexChanged"
                   OnRowDataBound="gridObat_RowDataBound" OnRowDeleting="gridObat_RowDeleting"
                    >
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered"   HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaObat" >
                            <ItemStyle Font-Size="Small" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="namaJenis" HeaderStyle-CssClass="table-bordered"  HeaderText="Jenis Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDJenis" >
                            <ItemStyle Font-Size="Small" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="JumlahObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="JumlahObat" >
                            <ItemStyle Font-Size="Small" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Keterangan" HeaderStyle-CssClass="table-bordered"  HeaderText="Keterangan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Keterangan" >
                            <ItemStyle Font-Size="Small" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                       <asp:BoundField DataField="Satuan"  HeaderStyle-CssClass="table-bordered" HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Satuan" >
                        </asp:BoundField>

  
                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="small" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
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

                    <asp:Button runat="server" id="btnDelete" Text="Delete" OnClick="btnDelete_Click" />

                </div>

                </div>
              </div>
            </div>
          </div>
         </div>
        </div>
        </section>

 <!-- Content Wrapper. Contains page content -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Keranjang</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <asp:GridView ID="Keranjang" runat="server" CssClass="table table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="Keranjang_PageIndexChanging"
                    OnRowCommand="Keranjang_RowCommand" OnSorting="Keranjang_Sorting" OnSelectedIndexChanged="Keranjang_SelectedIndexChanged" >
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

                        <asp:BoundField DataField="JumlahObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="JumlahObat" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Satuan"  HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Satuan" >
                        </asp:BoundField>

                        <asp:BoundField DataField="Harga" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                       
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
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
            <!-- /.card -->
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Transaksi Pembelian</h3>

                <div class="card-tools">
                 
                    
                </div>
              </div>
              <!-- /.card-header -->              
                <div class="card-body">

                 <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Supplier</label>
                    </div>
                    <div class="col-md-8">
                   <asp:DropDownList ID="jenisSupplier" runat="server" class="form-control" Width="200px" DataSourceID="dsJenis" DataTextField="NamaSupplier" DataValueField="IDSupplier">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsJenis" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT  IDSupplier, NamaSupplier FROM Supplier WHERE (Status = 1)"></asp:SqlDataSource>
         
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Tanggal Order</label>
                    </div>
                      <div class="col-md-8">
                    <asp:TextBox ID="txtnamaJenis" CssClass="form-control" runat="server" TextMode="Date"/>
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Nomor Antrian</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtDeskripsi" CssClass="form-control" runat="server" />
                  </div>
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Resep Dokter</label>
                    </div>
                    <div class="col-md-5">
                    <asp:RadioButtonList ID="rbResep" runat="server" OnSelectedIndexChanged="rbResep_SelectedIndexChanged" AutoPostBack="true">
                     <asp:ListItem Selected="true"> Ada</asp:ListItem>
                    <asp:ListItem >Tidak Ada</asp:ListItem>
                    </asp:RadioButtonList>
                  </div>
                </div>
            <div id="adaResep" runat="server">
            <div class="row form-group">
                <div class="col-md-3">
                    <label for="exampleInputPassword1">Resep Dokter</label>
                    </div>
                   <div class="col-sm-9">
                   <div class="input-group">
                    <figure class="img-upload-preview">
                    <asp:FileUpload type="file" class="form-control form-control-user" ID="editUploadFile" runat="server" onchange="imgEdit();" />
                    </figure>
                    </div>
                        <asp:RequiredFieldValidator
                                id="RequiredFieldValidator18"
                                ControlToValidate="editUploadFile"
                                Text="(Required)"
                                ValidationGroup="frmEdit"
                                Runat="server" />
                     </div>
                </div>
            </div>

                <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Jumlah</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtJumlah" CssClass="form-control" runat="server" />
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Total Harga</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" />
                  </div>
                </div>
            </div>
            </div>

             </div> 
            </div>
             </div>
       
    </section>

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
