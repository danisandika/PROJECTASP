<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="konf_pembelian.aspx.cs" Inherits="Karyawan_konf_pembelian" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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

                        <asp:BoundField DataField="IDSupplier" ItemStyle-CssClass="hiddencol" HeaderText="IDSupplier" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" />

                         <asp:BoundField DataField="NamaSupplier" HeaderStyle-CssClass="table-bordered" HeaderText="Nama Supplier"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaSupplier" >
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
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                              <%--  <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                ToolTip="Batalkan"><span class="far fa-trash-alt nav-icon"></asp:LinkButton>
                                --%>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                OnClick="lnkEdit_Click" ToolTip="Konfirmasi" CssClass="far fa-check-circle" />
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                OnClick="lnkViewDetails_Click" Text="" CssClass="far fa-check-square" ToolTip="Detail"/>
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
              <asp:GridView ID="grdDetail" AutoGenerateColumns="false" runat="server" DataKeyNames="IDPembelian" CssClass="table table-striped table-bordered table-hover">
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
                        <asp:BoundField DataField="subTotal" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered" HeaderText="Sub Total"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>

                        <asp:BoundField DataField="IDSupplier" ItemStyle-CssClass="hiddencol" HeaderText="IDSupplier" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" />

                        <asp:BoundField DataField="IDObat" ItemStyle-CssClass="hiddencol" HeaderText="IDObat" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" />

                        <asp:BoundField DataField="Expired" ItemStyle-CssClass="hiddencol" HeaderText="Expired" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" />

                        <asp:BoundField DataField="Harga" ItemStyle-CssClass="hiddencol" HeaderText="Expired" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" />


                         <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("IDPembelian")%>' 
                                OnClick="lnkEdit_Click1" Text="" CssClass="far fa-edit nav-icon" ToolTip="Edit"/>
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

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Panel ID="pnlGridViewDetails" runat="server" Width="490px" Height="400px"
        CssClass="pnlBackGround">
        <div class="row">
         <div class="card-body">
        <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true">EDIT</asp:label>
        </div>
        </div>
        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">ID Pembelian</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="IDPembelian" runat="server" Text=""></asp:Label>
        </div></div>
         
        <div class="row form-group">
         <div class="col-md-5">
         <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Nama Obat</asp:label>
        </div>
        <div class="col-md-5">
         <asp:Label ID="namaObat" runat="server" Text=""></asp:Label>
       </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Jumlah</asp:label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="jumlah" runat="server" Text=""></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">SubTotal</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="SubTotal" runat="server" Text=""></asp:Label>
        </div></div>
        <asp:TextBox ID="IDSupplier" runat="server" Visible="false"></asp:TextBox>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Harga Jual</asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="hargaJual" runat="server"></asp:TextBox>
        </div></div>
        

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Kadaluarsa</asp:Label>
         </div>
        <div class="col-md-5">
            <asp:TextBox ID="Kadaluarsa" runat="server" TextMode="Date"></asp:TextBox>
             <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Kadaluarsa"></asp:CalendarExtender>

        </div></div>
    
         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">IDObat</asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="IDObat" runat="server" Enabled="false"></asp:TextBox>
        </div></div>
      
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
        
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnUpdate" runat="server" Text="Perbarui" OnClick="btnUpdate_Click" />

         </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender  ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

