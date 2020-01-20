<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterDokter.master" AutoEventWireup="true" CodeFile="Dokter_periksa.aspx.cs" Inherits="Karyawan_Dokter_periksa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Pemeriksaan
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sub_Title" Runat="Server">
    Pemeriksaan
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="title2" Runat="Server">
    Pemeriksaan
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Content" Runat="Server">
    
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
                <h3 class="card-title">Data Pemeriksaan</h3>
              </div>
                
                <div class="card-body">

                <div class="row form-group">
                 <div class="col-md-3">
                  <label for="pasien">Nama Pasien</label>
                </div>
                 <div class="col-md-5">
                  <asp:DropDownList ID="ddlPasien" runat="server" CssClass="form-control" DataSourceID="dsPasien" DataTextField="Nama" DataValueField="IDUser">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsPasien" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select IDUser,Nama from [User] where [status] =1 and IDRole= 3"></asp:SqlDataSource>
                  </div>
                </div>

                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Penyakit</label>
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
                     <label for="Ket">Berat Badan(Kg) </label> <span style="color:red">(*)</span>
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
                   <label for="Ket">Tinggi Badan(Cm)</label><span style="color:red">*</span>
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
                   <label for="Ket">Tensi(SYS/DIA)</label><span style="color:red">*</span>
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
                  <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSave_Click"/>
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
                <h3 class="card-title">Edit Riwayat</h3>
              </div>
                
                <div class="card-body">
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
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
                  <asp:Button ID="EditbtnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="EditbtnSave_Click"/>
                  <asp:Button ID="EditbtnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="EditbtnCancel_Click"/>
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
                <h3 class="card-title">Table Riwayat</h3>
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
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tinggi</asp:Label>
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

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

