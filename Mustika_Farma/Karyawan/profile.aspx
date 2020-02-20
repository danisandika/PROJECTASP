<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Karyawan_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
    <!-- Content Wrapper. Contains page content -->

  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Profil</h1>
        </div>
   </div>
    </div>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <%--<div class="card card-primary card-outline">
            <div class="card-body box-profile">
              <div class="text-center">
                 <asp:Image ID="txtFoto" runat="server" style="height:200px;" />

              </div>

           
            </div>
            <!-- /.card-body -->
          </div>--%>
          <!-- /.card -->

          <!-- About Me Box -->
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Tentang Saya</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <strong><i class="fas fa-user"></i> Nama</strong>
                <asp:Label ID="lblNama" runat="server" Text=""></asp:Label>
              <hr>

              <strong><i class="fas fa-map-marker-alt mr-1"></i> Alamat</strong>
                <asp:Label ID="lblAlamat" runat="server" Text=""></asp:Label>
              <hr>

              <strong><i class="far fa-email"></i> No.Telepon</strong>
                <asp:Label ID="lblNotelp" runat="server" Text=""></asp:Label>
              <hr>

              <strong><i class="far fa-email"></i> Email</strong>
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="card">
            <div class="card-header p-2">
              <ul class="nav nav-pills">

                <li class="nav-item"><a class="nav-link active" href="#settings" data-toggle="tab">Detail</a></li>
              </ul>
            </div><!-- /.card-header -->
            <div class="card-body">
              <div class="tab-content">


                <div class="active tab-pane" id="settings">
                  <form class="form-horizontal">
                    <div class="form-group">
                      <label for="inputName" class="col-sm-2 control-label">Nama</label>

                      <div class="col-sm-10">
                          <asp:TextBox ID="txtNama" runat="server" class="form-control" placeholder="Nama" ></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputExperience" class="col-sm-2 control-label">Alamat</label>

                      <div class="col-sm-10">
                        <textarea class="form-control" id="inputExperience" name="Alamat" placeholder="Alamat"></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputEmail" class="col-sm-2 control-label">No.Telepon</label>

                      <div class="col-sm-10">
                          <asp:TextBox ID="txtNoTelp" class="form-control" runat="server" placeholder="no.Telp"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputName2" class="col-sm-2 control-label">Tanggal Lahir</label>

                      <div class="col-sm-10">
                          <asp:TextBox ID="txtTanggal" runat="server" class="form-control" TextMode="DateTime" placeholder="TanggalLahir"> </asp:TextBox>
                      </div>
                    </div>

                    <div class="form-group">
                      <label for="inputSkills" class="col-sm-2 control-label">Email</label>

                      <div class="col-sm-10">
                          <asp:TextBox ID="txtEmail" runat="server"  class="form-control" placeholder="Email"></asp:TextBox>
                      </div>
                    </div>
                  
                    <div class="form-group">
                      <label for="inputSkills" class="col-sm-2 control-label">Foto Profil</label>

                      <div class="col-sm-10">
                      <%--  foto--%>

                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputSkills" class="col-sm-2 control-label">Username</label>

                      <div class="col-sm-10">
                          <asp:TextBox ID="txtUsername" runat="server" class="form-control" ></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputSkills" class="col-sm-2 control-label">Password</label>
                      <div class="col-sm-10">
                          <asp:TextBox ID="txtPasswordLama" runat="server" class="form-control" ></asp:TextBox>
                      </div>
                    </div>
                 </form>
                </div>
                <!-- /.tab-pane -->
              </div>
              <!-- /.tab-content -->
            </div><!-- /.card-body -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

