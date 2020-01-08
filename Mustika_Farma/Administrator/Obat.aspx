<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Obat.aspx.cs" Inherits="Administrator_Obat" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
    <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style>
      
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
                    <label for="IDJenisObat">Supplier</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-control" DataSourceID="dsSupplier" DataTextField="NamaSupplier" DataValueField="IDSupplier">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDSupplier, NamaSupplier FROM Supplier WHERE (Status = 1)"></asp:SqlDataSource>
                  </div>
                   </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Jumlah Obat</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtJumlah" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>
                  </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Keterangan</label>
                    </div>
                    <div class="col-md-5">
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
                <div class="input-group-append">
                 <asp:DropDownList ID="ddlStatusView" runat="server" class="form-control" Width="200px" OnTextChanged="ddlStatusView_TextChanged" AutoPostBack="true">
                 <asp:ListItem value="1" >Aktif</asp:ListItem>
                 <asp:ListItem Value="0" >Tidak Aktif</asp:ListItem>
                 <asp:ListItem Value="2" Selected="True">Semua</asp:ListItem>
                 </asp:DropDownList>
                    <asp:TextBox id="txtSearch" CssClass="form-control float-right" runat="server" Width="20%"/>                    
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fas fa-search"></i></asp:LinkButton>
                    </div>
                  </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridObat" runat="server" 
                    AllowPaging="true"
                    AllowSorting="true"
                     AutoGenerateColumns="false"
                     DataKeyNames="IDObat"
                     EmptyDataText="Tidak Ada Data" 
                    PageSize="5"
                     ShowHeaderWhenEmpty="true"
                     OnPageIndexChanging="gridObat_PageIndexChanging"
                    GridLines="Both" 
                    CssClass="table table-striped table-bordered table-hover"
                     OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting" OnSelectedIndexChanged="gridObat_SelectedIndexChanged" 
                    OnRowDeleting="gridObat_RowDeleting" OnRowDataBound="gridObat_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
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

                        <asp:BoundField DataField="JumlahObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Jumlah Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" SortExpression="JumlahObat" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Keterangan" ItemStyle-CssClass="hiddencol" HeaderText="Keterangan" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>


                        <asp:BoundField DataField="Nama_Lokasi" HeaderStyle-CssClass="table-bordered"  HeaderText="Lokasi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDLokasi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Satuan" HeaderStyle-CssClass="table-bordered"  HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Satuan" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Harga" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Expired" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" HeaderText="Expired"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Expired" >
                        </asp:BoundField>

                        <asp:ImageField ControlStyle-Width="100" HeaderStyle-CssClass="table-bordered"  ControlStyle-Height = "100" DataImageUrlField ="Foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                       </asp:ImageField>

                         <asp:BoundField DataField="NamaSupplier" HeaderStyle-CssClass="table-bordered"  HeaderText="Supplier"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>

                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');"></span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Are you sure you want to delete this item?');"></span></asp:LinkButton>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDObat")%>' 
                                OnClick="lnkViewDetails_Click" Text="Detail" ToolTip="Details"><span class="far fa-check-square"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nama" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="createDate" ItemStyle-CssClass="hiddencol" HeaderText="createDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="Nama" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="foto" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="IDJenis" ItemStyle-CssClass="hiddencol" HeaderText="IDJenis" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="Harga" ItemStyle-CssClass="hiddencol" HeaderText="Harga" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                    </Columns>
                </asp:GridView>

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
                  <%--row yang status 0 masi ketampil, soalnya biar otomatis terisi gitu--%>
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="IDJenisObat">ID Jenis Obat</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="ddlJenisObatE" runat="server" AppendDataBoundItems="true" CssClass="form-control" DataSourceID="dsJenisE" DataTextField="namaJenis" DataValueField="IDJenis">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsJenisE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDJenis, namaJenis FROM JenisObat"></asp:SqlDataSource>
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                    <label for="IDJenisObat">Supplier</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="ddlSupplierE" runat="server" CssClass="form-control" DataSourceID="dsSupplierE" DataTextField="NamaSupplier" DataValueField="IDSupplier">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsSupplierE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDSupplier, NamaSupplier FROM Supplier WHERE (Status = 1)"></asp:SqlDataSource>
                  </div>
                   </div>

                
                  <div class="row form-group">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtJumlahE" CssClass="form-control" runat="server" TextMode="MultiLine" Visible="false" Text="0" />
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
                   <asp:TextBox ID="txtHargaEdit" CssClass="form-control" runat="server"  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtHargaEdit"
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
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtExpiredE"></asp:CalendarExtender>
                    </div>
                </div>

                    <div class="form-group row align-items-center">
                    <div class="col-md-3">
                        <label class="col-sm-3 col-form-label text-label">Foto</label>
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

                <div id="EditFotoView" runat="server"> 
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
                    <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" />
                     </div>
                    
                    <asp:Button ID="btnUbahFoto"  CssClass="btn btn-dark" runat="server" Text="Ubah Foto" OnClick="btnUbahFoto_Click"/>
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

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Panel ID="pnlGridViewDetails" runat="server" Width="490px" Height="400px"
        CssClass="pnlBackGround">
        <div class="row">
         <div class="card-body">
         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true">DETAIL</asp:label>
        </div>
        </div>

         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Nama</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="namaObat" runat="server" Text="nama"></asp:Label>
       </div></div>
        
        <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Keterangan</asp:label>
         </div>
         <div class="col-md-5">
        <asp:Label ID="Keterangan" runat="server" Text="Keterangan"></asp:Label>
       </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Dibuat Oleh</asp:label>
        </div>
        <div class="col-md-5">   
        <asp:Label ID="CreateBy" runat="server" Text="CreateBy"></asp:Label>
         </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tanggal dibuat</asp:Label>
       </div>
        <div class="col-md-5">
        <asp:Label ID="CreateDate" runat="server" Text="Create Date"></asp:Label>
       </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Diubah Oleh</asp:Label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="ModifiedBy" runat="server" Text="modiby"></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tanggal Diubah</asp:Label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="ModifiedDate" runat="server" Text="modidate"></asp:Label>
         </div></div>

         <div class="row form-group">
         <div class="col-md-5">
         <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Kadaluarsa</asp:Label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="Expired" runat="server" Text="Kadaluarsa"></asp:Label>
         </div></div>
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
    </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server"  TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
    
  
 

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

