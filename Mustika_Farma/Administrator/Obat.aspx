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
                    <asp:TextBox ID="txtnamaJenis" CssClass="form-control" runat="server"/>
                  </div>

                  <div class="form-group">
                    <label for="IDJenisObat">ID Jenis Obat</label>
                  <asp:DropDownList ID="DDLJenisObat" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                  </div>

                  <div class="form-group">
                    <label for="jumlahObat">Jumlah Obat</label>
                    <asp:TextBox ID="txtJumlah" CssClass="form-control" runat="server"/>
                  </div>

                  <div class="form-group">
                   <label for="Ket">Keterangan</label>
                   <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>

                   <div class="form-group">
                    <label for="IDJenisObat">Lokasi</label>
                  <asp:DropDownList ID="DDLLokasi" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                  </div>

                   <div class="form-group">
                   <label for="Ket">Satuan</label>
                   <asp:TextBox ID="txtSatuan" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>

                   <div class="form-group">
                   <label for="Ket">Harga</label>
                   <asp:TextBox ID="txtHarga" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>

                   <div class="form-group">
                   <label for="Ket">Expired</label>
                   <asp:TextBox ID="txtExpired" CssClass="form-control" runat="server" TextMode="DateTime" />
                  </div>

                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSave_Click"/>
                </div>
              
            </div>
              </div>
            </div>
          </div>
        </section>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

