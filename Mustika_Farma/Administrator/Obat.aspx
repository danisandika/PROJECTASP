<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Obat.aspx.cs" Inherits="Administrator_Obat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
      Obat Obatan
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    Obat-Obatan
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
      <!--SECTION ADD-->
     <section class="content" id="secAdd" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tambah Obat- Obatan</h3>
              </div>
                
                <div class="card-body">
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="Obat">Nama Obat</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtnamaObat" CssClass="form-control" runat="server"/>
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="IDJenisObat">ID Jenis Obat</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="DDLJenisObat" runat="server" CssClass="form-control" DataSourceID="dsJenis" DataTextField="namaJenis" DataValueField="IDJenis">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="dsJenis" runat="server" ConnectionString="<%$ ConnectionStrings:Apotek %>" SelectCommand="DdlJenis" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  </div>
                   </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Jumlah Obat</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtJumlah" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                  </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Keterangan</label>
                    </div>
                    <div class="col-md-3">
                   <asp:TextBox ID="txtKet" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                </div>

                   <div class="row form-group">
                     <div class="col-md-3">
                    <label for="IDJenisObat">Lokasi</label>
                    </div>
                    <div class="col-md-5">
                         <asp:DropDownList ID="DDLLokasi" runat="server" CssClass="form-control" DataSourceID="dsLokasi" DataTextField="Nama_Lokasi" DataValueField="IDLokasi">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsLokasi" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDLokasi, Nama_Lokasi, tempatLokasi, Deskripsi, Status, CreateBy, CreateDate, ModifiedBy, ModifiedDate FROM Lokasi_Penyimpanan WHERE (Status = 1)"></asp:SqlDataSource>
                  </div>
                  </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Satuan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:DropDownList ID="ddlSatuan" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="Butir">Butir</asp:ListItem>
                        <asp:ListItem Value="Botol">Botol</asp:ListItem>
                        <asp:ListItem Value="Blister">Blister</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Harga</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtHarga"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Isi data dengan benar"></asp:RequiredFieldValidator>
                   </div>
                  </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Expired</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox CssClass="form-control" ID="txtExpired" placeholder="Tanggal Lahir" runat="server" TextMode="Date" required></asp:TextBox>
                  </div>
                </div>

                 <div class="form-group row align-items-center">
                <div class="col-md-3">
                 <label class="col-sm-3 col-form-label text-label">Foto</label>
                 </div>
                 <div class="col-sm-9">
                 <div class="input-group">
                 <figure class="img-upload-preview">
                     <asp:FileUpload type="file" class="form-control form-control-user" ID="uploadfile" runat="server" onchange="img();" />
                 </figure>
                </div>
                       <asp:RequiredFieldValidator
                            id="RequiredFieldValidator17"
                            ControlToValidate="uploadfile"
                            Text="(Required)"
                            ValidationGroup="frmAdd"
                            Runat="server" />
                                               
               </div>
               </div>

                <div class="form-group row align-items-center">
                <label class="col-sm-3 col-form-label text-label"></label>
                <div class="col-sm-9">
                <div class="input-group">
                <asp:Image ID="foto" runat="server" style="height:200px;" />
                </div>
                </div>
                </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSave_Click1"/>
                </div>
              
            </div>
              </div>
            </div>
          </div>
        </section>

    
       <!--SECTION VIEW-->
     <section class="content" id="secView" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Obat - Obat</h3>
                  <br />

                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="btntambah" OnClick="btntambah_Click"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
                <label>Lihat Bedasarkan Status</label>
                <asp:DropDownList ID="ddlStatusView" runat="server" class="form-control" Width="200px" OnTextChanged="ddlStatusView_TextChanged" AutoPostBack="true">
                 <asp:ListItem value="1" >Aktif</asp:ListItem>
                 <asp:ListItem Value="0" >Tidak Aktif</asp:ListItem>
                 <asp:ListItem Value="2" Selected="True">Semua</asp:ListItem>
                 </asp:DropDownList>
                   <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <asp:TextBox id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    <div class="input-group-append">
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fas fa-search"></i></asp:LinkButton>
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
                        <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="namaObat" HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaObat" />
                        <asp:BoundField DataField="namaJenis" HeaderText="ID Jenis Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDJenis" />
                        <asp:BoundField DataField="JumlahObat" HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="JumlahObat" />
                        <asp:BoundField DataField="Keterangan" HeaderText="Keterangan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Keterangan" />
                        <asp:BoundField DataField="Nama_Lokasi" HeaderText="Lokasi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDLokasi" />
                        <asp:BoundField DataField="Satuan" HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Satuan" />
                        <asp:BoundField DataField="Harga" HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" />
                        <asp:BoundField DataField="Expired" HeaderText="Expired"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Expired" />
                        <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" DataImageUrlField ="Foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" ></asp:ImageField>
                        
                        <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon">Edit</span>
                                </asp:LinkButton>
                                |
                                <asp:LinkButton runat="server" ID="linkDelete" CommandName="cmDelete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Delete Data"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span>
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

      <!--SECTION EDIT-->
     <section class="content" id="secEdit" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Edit Jenis Obat</h3>
              </div>
                
                <div class="card-body">
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                <div class="card-body">
                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Nama Obat</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtNamaObatE" CssClass="form-control" runat="server"/>
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="IDJenisObat">ID Jenis Obat</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="ddlJenisObatE" runat="server" CssClass="form-control" DataSourceID="dsJenis" DataTextField="namaJenis" DataValueField="IDJenis">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="dsJenisE" runat="server" ConnectionString="<%$ ConnectionStrings:Apotek %>" SelectCommand="DdlJenisObatE" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  </div>
                </div>
                
                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Jumlah</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtJumlahE" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                </div>
                    
                   <div class="row form-group">
                   <div class="col-md-3">
                        <label for="Ket">Satuan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtSatuanE" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                   </div>
                    
                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Keterangan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtKetE" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                       <label for="IDLokasi">Lokasi</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="ddlLokasiE" runat="server" CssClass="form-control" DataSourceID="dsLokasi" DataTextField="Nama_Lokasi" DataValueField="IDLokasi">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsLokasiE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDLokasi, Nama_Lokasi, tempatLokasi, Deskripsi, Status, CreateBy, CreateDate, ModifiedBy, ModifiedDate FROM Lokasi_Penyimpanan WHERE (Status = 1)"></asp:SqlDataSource>
                  </div>
                </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Satuan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:DropDownList ID="ddlSatuanE" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="Butir">Butir</asp:ListItem>
                        <asp:ListItem Value="Botol">Botol</asp:ListItem>
                        <asp:ListItem Value="Blister">Blister</asp:ListItem>
                       
                    </asp:DropDownList>
                  </div>
                </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Harga</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtHargaE" CssClass="form-control" runat="server" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtHargaE"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Isi data dengan benar"></asp:RequiredFieldValidator>
                  </div>
                  </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Expired">Expired</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox CssClass="form-control" ID="txtExpiredE" placeholder="Tanggal Lahir" runat="server" TextMode="Date" required></asp:TextBox>
                  </div>
                </div>

                    <div class="form-group row align-items-center">
                    <div class="col-md-3">
                        <label class="col-sm-3 col-form-label text-label">Foto</label>
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
                    <div class="form-group row align-items-center">
                        <label class="col-sm-3 col-form-label text-label"></label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <asp:Image ID="editfoto" runat="server" style="height:200px;" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <asp:Button ID="EditbtnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="EditbtnSave_Click1"/>
                  <asp:Button ID="EditbtnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="EditbtnCancel_Click"/>
                </div>
              
            </div>
              </div>
            </div>
          </div>
        </section>

       <script>
        function img() {
            var url = inputToURL(document.getElementById("<%=uploadfile.ClientID%>"));
            document.getElementById("<%=foto.ClientID%>").src = url;
        }
       <%-- function imgEdit() {
            var url = inputToURL(document.getElementById("<%=editUploadFile.ClientID%>"));
            document.getElementById("<%=editfoto.ClientID%>").src = url;--%>
        //}
        function inputToURL(inputElement) {
            var file = inputElement.files[0];
            return window.URL.createObjectURL(file);
        }

    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

