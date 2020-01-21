<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterDokter.master" AutoEventWireup="true" CodeFile="konf_booking.aspx.cs" Inherits="Karyawan_konf_booking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
Konfirmasi_Booking
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sub_Title" Runat="Server">
 <h1>konfirmasi Booking</h1>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="title2" Runat="Server">
Konfirmasi Booking
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style>

     <!--SECTION ADD Riwayat-->
     <section class="content" id="secAddRiwayat" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Data Pemeriksaan</h3>
              </div>
                <asp:Label ID="lblIDqu" runat="server" Text="" Visible="true"></asp:Label>
                <asp:Label ID="labelIDUSer" runat="server" Text="Label" Visible="true"></asp:Label>
                <div class="card-body">
                    
                <div class="row form-group">
                 <div class="col-md-3">
                  <label for="pasien">Nama Pasien</label><span style="color:red">(*)</span>
                </div>
                 <div class="col-md-5">
                     <asp:Label ID="lblIDPasien" runat="server" Text="" readonly="true"></asp:Label>
                 </div>
                </div>

                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Penyakit</label> <span style="color:red">(*)</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtPenyakit" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="txtPenyakit"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                     <label for="Ket">Berat Badan (Kg) </label> <span style="color:red">(*)</span>
                    </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtBerat" CssClass="form-control" runat="server" TextMode="Number"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtBerat"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Tinggi Badan (cm)</label> <span style="color:red">(*)</span>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtTinggi" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtTinggi"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Tensi(SYS/DIA)</label> <span style="color:red">(*)</span>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtTensi" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server"
                        ControlToValidate="txtTensi"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>


                  <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Pesan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtPesan" CssClass="form-control" runat="server" TextMode="MultiLine" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                        runat="server"
                        ControlToValidate="txtPesan"
                        ForeColor="Red"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

                <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Gula Darah(mg/dL)</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtGula" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>
                </div>


                <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Kolestrol(mg/dL)</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtKolestrol" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>
                </div>
            </div>
                                             
            </div>
            </div> 
                <!-- /.card-body -->
                <div class="card-footer">
                  <asp:Button ID="btnSaveRiwayat" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSaveRiwayat_Click"/>
                </div>    
            </div>
              </div>
        </section>

 <%--   <!--SECTION EDIT-->
     <section class="content" id="secEditRiwayat" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Edit Riwayat</h3>
              </div>
                
                <div class="card-body">
                <asp:Label ID="lblID" runat="server" Visible="true"></asp:Label>
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Nama Pasien</label>
                    </div>
                    <div class="col-md-5">
                  <asp:DropDownList ID="ddlNamaPasien" runat="server" CssClass="form-control" DataSourceID="dsPasienE" DataTextField="Nama" DataValueField="IDUser">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsPasienE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select IDUser,Nama from [User] where [status] =1 and IDRole= 3"></asp:SqlDataSource>
                  </div>
                  </div>

                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Penyakit</label>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtPenyakitE" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="txtPenyakitE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                     <label for="Ket">Berat Badan </label>
                    </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtBeratE" CssClass="form-control" runat="server" TextMode="Number"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server"
                        ControlToValidate="txtBeratE"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Tinggi Badan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtTinggiE" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server"
                        ControlToValidate="txtTinggiE"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Tensi</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtTensiE" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server"
                        ControlToValidate="txtTensiE"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>


                  <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Pesan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtPesanE" CssClass="form-control" runat="server" TextMode="MultiLine" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                        runat="server"
                        ControlToValidate="txtPesanE"
                        ForeColor="Red"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

                <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Gula Darah</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtGulaE" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                        runat="server"
                        ControlToValidate="txtGulaE"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>


                <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Kolestrol</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtKolestrolE" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator14"
                        runat="server"
                        ControlToValidate="txtKolestrolE"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angka"></asp:RequiredFieldValidator>
                  </div>
                </div>
                  
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                  <asp:Button ID="EditbtnSaveRiwayat" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="EditbtnSaveRiwayat_Click"/>
                  <asp:Button ID="EditbtnCancelRiwayat" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="EditbtnCancelRiwayat_Click"/>
                </div>
              
            </div>
              </div>
            </div>
          </div>
        </section>
--%>
       <!--SECTION VIEW-->
     <section class="content" id="secViewRiwayat" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Riwayat</h3>
                  <br />
                
                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="btntambahRiwayat" OnClick="btntambahRiwayat_Click"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
                  <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <asp:TextBox id="txtCariRiwayat" CssClass="form-control float-right" runat="server"/>
                    <div class="input-group-append">
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="cariRiwayat" OnClick="cariRiwayat_Click"><i class="fas fa-search"></i></asp:LinkButton>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                 </div>
                </div>
              </div>
        
</section>
 <section class="content" id="Section1" runat="server">

                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridRiwayat" runat="server" CssClass="table table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDRiwayat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridRiwayat_PageIndexChanging"
                    OnRowCommand="gridRiwayat_RowCommand" OnSorting="gridRiwayat_Sorting" OnSelectedIndexChanged="gridRiwayat_SelectedIndexChanged"
                    OnRowDeleting="gridRiwayat_RowDeleting" OnRowDataBound="gridRiwayat_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                  <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="1%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NamaPasien"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Pasien"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="penyakit"  HeaderStyle-CssClass="table-bordered" HeaderText="Penyakit"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pesan"  HeaderStyle-CssClass="table-bordered" HeaderText="Pesan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tanggal"  HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Nama Dokter" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="berat" ItemStyle-CssClass="hiddencol" HeaderText="Berat" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                         <asp:BoundField DataField="tinggi" ItemStyle-CssClass="hiddencol" HeaderText="Tinggi" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>                        
                        <asp:BoundField DataField="tensi" ItemStyle-CssClass="hiddencol" HeaderText="tensi" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>                       
                        <asp:BoundField DataField="gula" ItemStyle-CssClass="hiddencol" HeaderText="gula" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="kolestrol" ItemStyle-CssClass="hiddencol" HeaderText="kolestrol" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon">Edit</span>
                                </asp:LinkButton>
                                
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Are you sure you want to delete this item?');">Aktif</span></asp:LinkButton>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDRiwayat")%>' 
                                OnClick="lnkViewDetails_Click" Text="Detail" style="margin-left:20px"  CssClass="far fa-check-square"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            
                 </div>
        </section>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Panel ID="pnlGridViewDetails" runat="server" Width="490px" Height="400px"
        CssClass="pnlBackGround">
         <div class="row">
         <div class="card-body">
         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true"></asp:label>
        </div>
        </div>
       <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true">DETAIL</asp:label>
        </div>
        </div>
        <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Nama Dokter</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="nama" runat="server" Text="Nama Dokter "></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Berat</asp:label>
       </div>
        <div class="col-md-5">    
       <asp:Label ID="berat" runat="server" Text="Berat"></asp:Label>
        </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tinggi</asp:label>
        </div>
        <div class="col-md-5">
       <asp:Label ID="tinggi" runat="server" Text="Tinggi"></asp:Label>
         </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tensi</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="tensi" runat="server" Text="Tensi"></asp:Label>
        </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Gula</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="gula" runat="server" Text="Gula"></asp:Label>
         </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Kolestrol</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="kolestrol" runat="server" Text="kolestrol"></asp:Label>
 
        </div></div>

        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
     </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server"  TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>





<!--SECTION VIEW Bookinng-->
     <section class="content" id="secView" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Pembookingan</h3>
                  <br />

                <div class="input-group-append">
<%--                 <asp:DropDownList ID="ddlStatusView" runat="server" class="form-control" Width="200px" OnTextChanged="ddlStatusView_TextChanged" AutoPostBack="true">
                 <asp:ListItem value="1" >Aktif</asp:ListItem>
                 <asp:ListItem Value="0" >Tidak Aktif</asp:ListItem>
                 <asp:ListItem Value="2" Selected="True">Semua</asp:ListItem>
                 </asp:DropDownList>--%>
                    <asp:TextBox id="txtSearch" CssClass="form-control float-right" runat="server" Width="20%"/>                    
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fas fa-search"></i></asp:LinkButton>
                    </div>
                  </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridBooking" runat="server" CssClass="table table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDBooking" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridBooking_PageIndexChanging"
                    OnRowCommand="gridBooking_RowCommand" OnSorting="gridBooking_Sorting" OnSelectedIndexChanged="gridBooking_SelectedIndexChanged"
                    OnRowDeleting="gridBooking_RowDeleting" OnRowDataBound="gridBooking_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="1%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDBooking"  HeaderStyle-CssClass="table-bordered" HeaderText="ID Booking"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateBooking"  HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal Booking"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="statusBooking" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />         
                         <asp:BoundField DataField="Deskripsi"  HeaderStyle-CssClass="table-bordered" HeaderText="Deskripsi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                         <asp:BoundField DataField="NamaU"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Customer"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                         <asp:BoundField DataField="NamaD"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Dokter"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IDUser" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                        <asp:BoundField DataField="ID_Dokter" ItemStyle-CssClass="hiddencol" HeaderText="Password" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="password" />
                       <%-- <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                 <span class="badge badge-warning">Menunggu</span>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Selesai Pemeriksaan"><span class="far fa-check-circle" onclick="return confirm('Apa kamu yakin menyelesaikan pemeriksaan?');"></span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Lanjutkan Pemeriksaan"><span class="far fa-check-circle" onclick="return confirm('Apa kamu yakin melanjutkan pemeriksaan?');"></span></asp:LinkButton>
                                
                                    <asp:LinkButton runat="server" ID="linkBooking" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Periksa"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>

                                
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
              
                   </div>
                </div>          
              </div>
        </section>


 <!-- Main beri resep -->
<section id="secObat" class="intro" runat="server">
    <div class="col-lg-12">
    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Obat</h3>
                   <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                <div class="row form-group">
                    <div class="col-md-8">
                    <asp:TextBox Width="350%" id="txtCariObat" CssClass="form-control float-right" runat="server"/>
                    </div>
                     <div class="col-md-3">
                      <asp:LinkButton BackColor="SkyBlue" CssClass="col-lg-8" runat="server" ID="lnkCariObat" OnClick="lnkCariObat_Click">
                          <span class="fa fa-search"></span></asp:LinkButton>
                  </div>
                  </div>
                </div>
                </div>
              </div>

                <div class="card-body table-responsive p-0 col-12">

              <asp:Label ID="lblIDObat" runat="server" Visible="true"></asp:Label>
              <asp:Label ID="lblKaryawan" runat="server" Visible="true"></asp:Label>

                  <asp:GridView ID="gridObat" runat="server"
                     CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting" OnSelectedIndexChanged="gridObat_SelectedIndexChanged"
                   OnRowDataBound="gridObat_RowDataBound" OnRowDeleting="gridObat_RowDeleting" >
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                         <asp:BoundField DataField="Keterangan" HeaderStyle-CssClass="table-bordered"  HeaderText="Keterangan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Harga" ItemStyle-CssClass="hiddencol" HeaderText="" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:BoundField DataField="HargaBarang" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Jumlah Beli" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                 <asp:TextBox ID="jumlahBeli" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField> 

                         <asp:BoundField DataField="Satuan" HeaderStyle-CssClass="table-bordered"  HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="IDObat" ItemStyle-CssClass="hiddencol" HeaderText="" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                            <asp:TemplateField HeaderText="Periksa" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="small" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Periksa"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>                                
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
               <div class="form-group">
               <asp:Button ID="keranjang" runat="server" CssClass="btn btn-primary" Text="Tambahkan ke keranjang" OnClick="keranjang_Click"/>             
               </div>
                    </div>

                </div>
              </div>
            </div>
          </div>
         </div>
        </div>
        </section>

<section class="content" id="secKeranjang" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h2>Keranjang</h2>
                  <br/>
                <h4><asp:Label ID="lblIDTrans" runat="server"></asp:Label> </h4>

              </div>
              <div class="card-body">
                <asp:GridView ID="grdKeranjang" AutoGenerateColumns="false" runat="server" CssClass="table table-striped table-bordered table-hover">
                    <Columns> 
                         <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Nama Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="35%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="namaObat" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                  
                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="Satuan" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="jumlah" runat="server" Text='<%#Eval("jumlah") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Harga Total" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="harga" runat="server" Text='<%#Eval("harga") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
   
                         <asp:TemplateField HeaderText="ID Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left" >
                            <ItemTemplate>
                                <asp:Label ID="IDObat" runat="server" Text='<%#Eval("IDObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                           
                   </Columns>
                </asp:GridView>

               <asp:Label ID="lblJumlahPembelian" runat="server" Text='<%#Eval("valuefinal") %>'></asp:Label>
              <asp:Label ID="lblTotalHarga" runat="server" Text='<%#Eval("valuefinal") %>' Visible="false"></asp:Label>

              </div>
              <div class="card-footer clearfix">
                    <div class="form-group">
                <asp:Button ID="btnProses" runat="server" CssClass="btn btn-primary" Text="Proses" OnClick="btnProses_Click"/>                     

                </div>

             </div>
            </div>
          </div>
             </div>
            </div>

</section> 

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

