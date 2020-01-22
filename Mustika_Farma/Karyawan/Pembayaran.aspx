<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="Pembayaran.aspx.cs" Inherits="Karyawan_Pembayaran" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Pembayaran
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
  <h1>  Pembayaran</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    Pembayaran
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
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
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDTransaksi" EmptyDataText="Tidak Ada Data" 
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
                        
                        <asp:BoundField DataField="IDTransaksi" HeaderStyle-CssClass="table-bordered" HeaderText="IDTransaksi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDTransaksi" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="IDKaryawan" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                       
                         <asp:BoundField DataField="Nama" HeaderStyle-CssClass="table-bordered" HeaderText="Nama Pasien"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Nama" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>

                        <asp:BoundField DataField="Tanggal" HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Tanggal" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>

                        <asp:BoundField DataField="totalBayar" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered" HeaderText="Total Bayar"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="totalBayar" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>

                        <asp:BoundField DataField="labtotalBayar" ItemStyle-CssClass="hiddencol" HeaderText="Bayar" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="labtotalBayar" />


                        <asp:TemplateField HeaderText="status" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                 <span class="badge badge-warning">Menunggu</span>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("IDTransaksi")%>' 
                                OnClick="lnkDelete_Click" Text="" ToolTip="Batal" CssClass="far fa-trash-alt nav-icon"/>

                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("IDTransaksi")%>' 
                                OnClick="lnkEdit_Click" Text="" ToolTip="Bayar" CssClass="far fa-check-circle"/>
                                                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDTransaksi")%>' 
                                OnClick="lnkViewDetails_Click" Text="" ToolTip="Detail" CssClass="far fa-check-square"/>
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

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Panel ID="pnlGridViewDetails" runat="server" Width="490px" Height="400px"
        CssClass="pnlBackGround">
        <div class="row">
         <div class="card-body">
        <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true">PEMBAYARAN</asp:label>
        </div>
        </div>
        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">IDTransaksi</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="IDTransaksi" runat="server" Text="ID Transaksi"></asp:Label>
        </div></div>
         
        <div class="row form-group">
         <div class="col-md-5">
         <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tanggal</asp:label>
        </div>
        <div class="col-md-5">
         <asp:Label ID="Tanggal" runat="server" Text="Tanggal"></asp:Label>
       </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Total Bayar</asp:label>
        </div>
        <div class="col-md-5">
             <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" Enabled="false" ClientIDMode="Static" OnClick="ComputeCosts();"/>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label" ClientIDMode="Static">Bayar</asp:Label>
         </div>
        <div class="col-md-5">
            <asp:TextBox ID="txtBayar" CssClass="form-control" runat="server" ClientIDMode="Static" OnClick="ComputeCosts();"/>
        </div></div>
        
         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Kembalian</asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="txtKembalian" CssClass="form-control" runat="server" ClientIDMode="Static" OnClick="ComputeCosts();" />
        </div></div>

        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-dark shadow-sm" style="margin-left:25px" ID="btnBayar" runat="server" Text="Bayar" OnClick="btnBayar_Click" />
  </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender> 

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
                        <asp:TemplateField HeaderText="IDTransaksi"  HeaderStyle-Width="15%" ItemStyle-Width="15%">
                             <ItemTemplate>
                                <asp:Label style="margin-right:20px; margin-left:10px;" runat="server" ID="IDTransaksi" Text='<%#Eval("IDTransaksi") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered" HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaObat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Jumlah" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                             <ItemTemplate>
                                <asp:Label style="margin-right:20px; margin-left:10px;" runat="server" ID="Jumlah" Text='<%#Eval("Jumlah") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="subTotal" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered" HeaderText="Sub Total"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ID Obat"  HeaderStyle-Width="15%" ItemStyle-Width="15%" >
                             <ItemTemplate>
                                <asp:Label style="margin-right:20px; margin-left:10px;" runat="server" ID="IDObat" Text='<%#Eval("IDObat") %>'></asp:Label>
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

