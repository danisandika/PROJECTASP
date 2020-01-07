<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="konf_pembelian.aspx.cs" Inherits="Karyawan_konf_pembelian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="namaKaryawan" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sub_Title" Runat="Server">
      <h1>Konfirmasi Pembelian</h1>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="title2" Runat="Server">
    Konfirmasi_Pembelian
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content" Runat="Server">
<style type="text/css">
        .hiddencol
        {
        display:none;
        } x-ms-webview
    </style>
<!-- Main content -->
<section id="intro" class="intro">
    <div class="col-lg-12">
    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card-primary ">
              <div class="card-header">
                <h3 class="card-title">Table Pembelian</h3>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridKonf" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDPembelian" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridKonf_PageIndexChanging"
                    OnRowCommand="gridKonf_RowCommand" OnSorting="gridKonf_Sorting" OnSelectedIndexChanged="gridKonf_SelectedIndexChanged"
                   OnRowDataBound="gridKonf_RowDataBound" OnRowDeleting="gridKonf_RowDeleting"
                    >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                <%# Container.DataItemIndex +1 %> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="IDPembelian" HeaderStyle-CssClass="table-bordered" HeaderText="IDPembelian"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDPembelian" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IDSupplier" HeaderStyle-CssClass="table-bordered" HeaderText="IDSupplier"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tanggal" HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Tanggal" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="totalBayar" HeaderStyle-CssClass="table-bordered" HeaderText="Total Bayar"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="totalBayar" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                 <span class="badge badge-warning">Menunggu</span>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                OnClick="lnkDelete_Click" Text="Batal" style="margin-left:20px" CssClass="far fa-check-square"/>
                                
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                OnClick="lnkEdit_Click" Text="Konfirmasi" style="margin-left:20px" CssClass="far fa-check-circle"/>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                OnClick="lnkViewDetails_Click" Text="Detail" style="margin-left:20px" CssClass="far fa-check-square"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    
                    </Columns>
                </asp:GridView>
                </div>
                </div>
              </div>
            </div>
          </div>
         </div>
        </div>
        </section>

<section class="content" id="secDetail" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Detail</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <asp:GridView ID="grdDetail" AutoGenerateColumns="false" runat="server" CssClass="table table-striped table-bordered table-hover">
                    <Columns> 
                         <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="IDPembelian" HeaderStyle-CssClass="table-bordered" HeaderText="IDPembelian"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDTransaksi" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered" HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaObat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Jumlah" HeaderStyle-CssClass="table-bordered" HeaderText="Jumlah"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="subTotal" HeaderStyle-CssClass="table-bordered" HeaderText="Sub Total"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>

                          </Columns>
                </asp:GridView>
                   </div>
            </div>
          </div>
             </div>
            </div>   
</section>

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

