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
                  <div class="form-group">
                    <label for="Obat">Nama Obat</label>
                    <asp:TextBox ID="txtnamaObat" CssClass="form-control" runat="server"/>
                  </div>

                  <div class="form-group">
                    <label for="IDJenisObat">ID Jenis Obat</label>
                  <asp:DropDownList ID="DDLJenisObat" runat="server" CssClass="form-control" DataSourceID="dsJenis" DataTextField="namaJenis" DataValueField="IDJenis">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="dsJenis" runat="server" ConnectionString="<%$ ConnectionStrings:Apotek %>" SelectCommand="SELECT * FROM [JenisObat] WHERE (StatusJenis = 1)"></asp:SqlDataSource>
                  </div>


                  <div class="form-group">
                   <label for="Ket">Keterangan</label>
                   <asp:TextBox ID="txtKet" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>

                   <div class="form-group">
                    <label for="IDJenisObat">Lokasi</label>
                  <asp:DropDownList ID="DDLLokasi" runat="server" CssClass="form-control" DataSourceID="dsLokasi" DataTextField="Nama_Lokasi" DataValueField="IDLokasi">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsLokasi" runat="server" ConnectionString="<%$ ConnectionStrings:Apotek %>" SelectCommand="SELECT IDLokasi, Nama_Lokasi, tempatLokasi, Deskripsi, Status, CreateBy, CreateDate, ModifiedBy, ModifiedDate FROM Lokasi_Penyimpanan WHERE (Status = 1)"></asp:SqlDataSource>
                  </div>

                   <div class="form-group">
                   <label for="Ket">Satuan</label>
                   <asp:TextBox ID="txtSatuan" CssClass="form-control" runat="server" />
                  </div>

                   <div class="form-group">
                   <label for="Ket">Harga</label>
                   <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>

                   <div class="form-group">
                   <label for="Ket">Expired</label>
                   <asp:TextBox CssClass="form-control" ID="txtExpired" placeholder="Tanggal Lahir" runat="server" TextMode="Date" required></asp:TextBox>
                  </div>

                 <div class="form-group">
                   <label for="Ket">Foto</label>
                   <asp:FileUpload ID="txtfoto" runat="server" CssClass="form-control"/>
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
                <h3 class="card-title">Table Obat</h3>
                  <br />

                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="btntambah" OnClick="btntambah_Click"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
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
                    AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="True" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting" OnSelectedIndexChanged="gridObat_SelectedIndexChanged" >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="namaObat" HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Nama Obat" />
                        <asp:BoundField DataField="Harga" HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" />
                        <asp:BoundField DataField="jumlahObat" HeaderText="Jumlah"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="jumlahObat" />
                        <asp:BoundField DataField="Expired" HeaderText="Expired"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Expired" />
                        <asp:BoundField DataField="Keterangan" HeaderText="Keterangan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Keterangan" />

                        <asp:ImageField DataImageUrlField="Foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" ControlStyle-Width="50px" ControlStyle-Height="50px"/>
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

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

