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
                  <asp:DropDownList ID="DDLJenisObat" runat="server" CssClass="form-control" DataSourceID="dsJenis" DataTextField="namaJenis" DataValueField="IDJenis" OnSelectedIndexChanged="DDLJenisObat_SelectedIndexChanged">
                    </asp:DropDownList>
<<<<<<< HEAD
                      <asp:SqlDataSource ID="dsJenis" runat="server" ConnectionString="<%$ ConnectionStrings:Apotek %>" SelectCommand="DdlJenis" SelectCommandType="StoredProcedure">
                      </asp:SqlDataSource>
=======
                      <asp:SqlDataSource ID="dsJenis" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT * FROM [JenisObat]"></asp:SqlDataSource>
>>>>>>> 44a413d8ef3f4f01e80355940498f88214a095aa
                  </div>


                  <div class="form-group">
                   <label for="Ket">Keterangan</label>
                   <asp:TextBox ID="txtKet" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>

                   <div class="form-group">
                    <label for="IDJenisObat">Lokasi</label>
                  <asp:DropDownList ID="DDLLokasi" runat="server" CssClass="form-control" DataSourceID="dsLokasi" DataTextField="Nama_Lokasi" DataValueField="IDLokasi">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="dsLokasi" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="SELECT IDLokasi, Nama_Lokasi, tempatLokasi, Deskripsi, Status, CreateBy, CreateDate, ModifiedBy, ModifiedDate FROM Lokasi_Penyimpanan WHERE (Status = 1)"></asp:SqlDataSource>
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
                   <asp:TextBox ID="txtFoto" CssClass="form-control" runat="server" />
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


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

