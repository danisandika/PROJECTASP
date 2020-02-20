<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="Beli_Penjualan.aspx.cs" Inherits="Karyawan_Beli_Penjualan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
     <style type="text/css">
        .hiddencol
        {
        display:none;
        } x-ms-webview
    </style>
<!-- Main content -->
<section class="content2">
         
<div class="col-lg-12">
    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card-primary">
              <div class="card-header">
                <h3 class="card-title ">Tambah Data Pembelian</h3>
               </div>
               

      <div class="card-body">
        <div class="row">
        <div class="col-md-3">
        <label for="Supplier">Supplier</label>
        </div>
        <div class="input-group-append">
                 <asp:DropDownList ID="DDLSupplier" runat="server" OnTextChanged="DDLSupplier_TextChanged"  CssClass="form-control" DataSourceID="dsSupplier" DataTextField="NamaSupplier" DataValueField="IDSupplier">
                   </asp:DropDownList>
                    <asp:SqlDataSource ID="dsSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDSupplier, NamaSupplier FROM Supplier WHERE (Status = 1)"></asp:SqlDataSource>
      <asp:Button ID="btnSupplier" OnClick="btnSupplier_Click" runat="server" Text="Cari" CssClass="btn btn-primary" ></asp:Button>
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
                  </div>
                </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
              <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>

                <asp:GridView ID="gridObat" runat="server"
                     CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting1" OnSelectedIndexChanged="gridObat_SelectedIndexChanged"
                   OnRowDataBound="gridObat_RowDataBound" OnRowDeleting="gridObat_RowDeleting">
                  <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                          <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                         <asp:BoundField DataField="JumlahObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Keterangan" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        
                        <asp:TemplateField HeaderText="Jumlah Beli" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                 <asp:TextBox ID="txtJumlahBeli" DataField="txtJumlahBeli" TextMode="Number" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField> 

                         <asp:BoundField DataField="Satuan" HeaderStyle-CssClass="table-bordered"  HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
   
                        <asp:BoundField DataField="Harga" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:BoundField DataField="IDObat" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                          <asp:BoundField DataField="HargaBarang" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                            <asp:TemplateField HeaderText="Tambahkan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="small" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate>

                                  <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Tambahkan"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                        


                    </Columns>
                </asp:GridView>

<%--               <asp:Button ID="keranjang" runat="server" CssClass="btn btn-primary" Text="Tambahkan ke keranjang" OnClick="keranjang_Click"/>             --%>
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
            <div class="card-primary">

              <div class="card-header">
                <h3 class="card-title">Keranjang</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <asp:GridView ID="grdKeranjang" AutoGenerateColumns="false" runat="server" CssClass="table table-striped table-bordered table-hover">
                    <Columns> 
                         <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Nama Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="namaObat" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                  
                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="Satuan" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="jumlah" runat="server" Text='<%#Eval("jumlah") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Harga Total" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="Harga" runat="server" Text='<%#Eval("Harga") %>'></asp:Label> 
                            </ItemTemplate>
                        </asp:TemplateField> 

                         <asp:TemplateField HeaderText="ID Obat" ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                            <ItemTemplate>
                                <asp:Label ID="IDObat" runat="server" Text='<%#Eval("IDObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          
                  
                          
                   </Columns>
                </asp:GridView>

               <asp:Label ID="lblJumlahPembelian" runat="server" Text='<%#Eval("valuefinal") %>'></asp:Label>

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
            <div class="card-primary">
              <div class="card-header">
                <h3 class="card-title">Transaksi Pembelian</h3>

                <div class="card-tools">
                </div>
              </div>
              <!-- /.card-header -->   
                
                           
                <div class="card-body">
                
                 <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Total Harga</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" Enabled="false" ClientIDMode="Static" OnClick="ComputeCosts();"/>
                  </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Bayar</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtBayar" TextMode="Number" CssClass="form-control" runat="server" ClientIDMode="Static" OnClick="ComputeCosts();"/>
                  </div>
                </div>

             <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Kembalian</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtKembalian" CssClass="form-control" runat="server" ClientIDMode="Static" OnClick="ComputeCosts();" />
                    <asp:TextBox ID="txtKembaliDuit" CssClass="form-control" runat="server" Visible="false" />

                  </div>
                </div>

           <div class="form-group">
                <asp:Button ID="btnProses" runat="server" CssClass="btn btn-primary" Text="Proses" OnClick="btnProses_Click"/>                     
                </div>
            </div>
            </div>
             </div> 
            </div>
             </div>
       
    </section>

<script>
    $(document).ready(function () {
        var total = $('#txtKembalian');
        ComputeCosts();

        total.blur(function () {
            ComputeCosts();
        });
    });

    function ComputeCosts() {
        var amount1 = parseFloat($('#txtHarga').val());
        var amount2 = parseFloat($('#txtBayar').val());

        var dgift = (amount2 - amount1);
        var totalGift = 'Rp ' + dgift.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')

        if (totalGift < 0) {
            $('#txtKembalian').val(totalGift);
        }
        else {
            $('#txtKembalian').val(totalGift);
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

