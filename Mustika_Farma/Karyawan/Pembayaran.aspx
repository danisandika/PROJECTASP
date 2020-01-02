<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="Pembayaran.aspx.cs" Inherits="Karyawan_Pembayaran" %>

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
        
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

