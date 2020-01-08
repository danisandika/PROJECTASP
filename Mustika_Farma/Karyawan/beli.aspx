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
     <h1>Data Pembelian</h1>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="title2" Runat="Server">
Pembelian
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content" Runat="Server">
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
      <asp:Button ID="btnSupplier" OnClick="btnSupplier_Click" runat="server" Text="Cari" ></asp:Button>
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
                
                <asp:GridView ID="gridObat" runat="server"
                     CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="false"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting1" OnSelectedIndexChanged="gridObat_SelectedIndexChanged"
                   OnRowDataBound="gridObat_RowDataBound" OnRowDeleting="gridObat_RowDeleting"
                    >
                  <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Nama Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left" SortExpression="namaObat">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labNama" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Jumlah Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right"  SortExpression="JumlahObat">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="7%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labJumlahObat" runat="server" Text='<%#Bind("JumlahObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        
                         <asp:TemplateField HeaderText="Keterangan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left" SortExpression="Keterangan">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labKet" runat="server" Text='<%#Bind("Keterangan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah Beli" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                 <asp:TextBox ID="jumlahBeli" runat="server" AutoPostBack="true"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labSat" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>  

                        <asp:TemplateField HeaderText="Harga Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="harga" runat="server" Text='<%#Bind("Harga") %>' DataFormatString="Rp {0:###,###,###}"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="ID Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labIDObat" runat="server" Text='<%#Bind("IDObat") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>  

                            <asp:TemplateField HeaderText="Tambahkan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="small" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

               <asp:Button ID="keranjang" runat="server" CssClass="btn btn-primary" Text="Tambahkan ke keranjang" OnClick="keranjang_Click"/>             
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
                                <asp:Label ID="labNama" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                  
                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labSat" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labJumlah" runat="server" Text='<%#Eval("jumlah") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Harga Total" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labHarga" runat="server" Text='<%#Eval("harga") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                         <asp:TemplateField HeaderText="ID Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labIDObat" runat="server" Text='<%#Eval("IDObat") %>' Visible="false"></asp:Label>
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
                    <label for="exampleInputPassword1">Total Harga</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" Enabled="false"/>
                  </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Bayar</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtBayar" OnTextChanged="txtBayar_TextChanged" autopostback="True" CssClass="form-control" runat="server" />
                  </div>
                </div>

             <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Kembalian</label>
                    </div>
                    <div class="col-md-8">
                    <asp:TextBox ID="txtKembalian" CssClass="form-control" runat="server" />
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

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
