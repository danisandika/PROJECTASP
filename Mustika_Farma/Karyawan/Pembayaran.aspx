<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="Pembayaran.aspx.cs" Inherits="Karyawan_Pembayaran" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Pembayaran
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
                        
                        <asp:BoundField DataField="IDTransaksi" HeaderStyle-CssClass="table-bordered" HeaderText="IDTransaksi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Nama" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IDKaryawan" HeaderStyle-CssClass="table-bordered" HeaderText="ID Karyawan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Alamat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tanggal" HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="totalBayar" HeaderStyle-CssClass="table-bordered" HeaderText="Total Bayar"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="status" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                 <span class="badge badge-warning">Menunggu</span>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("IDTransaksi")%>' 
                                OnClick="lnkDelete_Click" Text="Batal" style="margin-left:20px" CssClass="far fa-check-square"/>
                                
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("IDTransaksi")%>' 
                                OnClick="lnkEdit_Click" Text="Bayar" style="margin-left:20px" CssClass="far fa-check-circle"/>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDTransaksi")%>' 
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
        <asp:Label ID="totalBayar" runat="server" Text="totalBayar"></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Bayar</asp:Label>
         </div>
        <div class="col-md-5">
            <asp:TextBox ID="Bayar" runat="server" OnTextChanged="Bayar_TextChanged"></asp:TextBox>
        </div></div>
        
         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Kembalian</asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="Kembalian_uang" runat="server"></asp:TextBox>
        </div></div>

        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
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

                         <asp:BoundField DataField="IDTransaksi" HeaderStyle-CssClass="table-bordered" HeaderText="IDTransaksi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDTransaksi" >
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


<%--     <!-- /.card-header -->              
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
            </div>--%>
        
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

