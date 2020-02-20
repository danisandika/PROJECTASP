 <%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Dokter.aspx.cs" Inherits="Administrator_Dokter" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Dokter
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    Dokter
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
                <h3 class="card-title">Tambah Dokter</h3>
              </div>
                
                <div class="card-body">
                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Nama Dokter</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtNama" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="txtNama"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                     <label for="Ket">NIP </label><span style="color:red">*</span>
                    </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtNIP" CssClass="form-control" runat="server" TextMode="Number"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                        runat="server"
                        ControlToValidate="txtNIP"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Jenis Kelamin</label>
                    </div>
                    <div class="col-md-5">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                     <asp:ListItem Value="1" selected="true"> Laki Laki</asp:ListItem>
                    <asp:ListItem Value="0">Perempuan</asp:ListItem>
                    </asp:RadioButtonList>
                  </div>
                </div>

                    <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Alamat</label>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtAlamat" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                    
                  </div>
                </div>

                     <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Username</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtUname" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                        runat="server"
                        ControlToValidate="txtUname"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                  </div>

                   <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Email</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                         ControlToValidate="txtEmail"
                         ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                         ErrorMessage = "Format Email Salah"/>
                  </div>
                  </div>
                    
                 <div class="row form-group">
                 <div class="col-md-3">
                  <label for="jenis">Jenis Dokter</label>
                </div>
                 <div class="col-md-5">
                  <asp:DropDownList ID="ddlJenis" runat="server" CssClass="form-control" DataSourceID="dsJenis" DataTextField="nama_Jenis" DataValueField="ID_SP">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsJenis" runat="server" ConnectionString="<%$ConnectionStrings:Default %>" SelectCommand="select ID_SP,nama_Jenis from jenis_Dokter where [status] =1"></asp:SqlDataSource>
                  </div>
                </div>  
                                            
                <div class="form-group row align-items-center">
                <div class="col-md-3">
                 <label class="col-sm-3 col-form-label text-label">Foto</label><span style="color:red">*</span>
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
                    <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Simpan" OnClick="btnSave_Click"/>           
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
                <h3 class="card-title">Edit User</h3>
              </div>
                
                <div class="card-body">
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                 <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Nama Dokter</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtNamaE" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtNamaE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                     <label for="Ket">NIP </label><span style="color:red">*</span>
                    </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtNIPE" CssClass="form-control" runat="server" TextMode="Number"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="txtNIPE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Jenis Kelamin</label><span style="color:red">*</span>
                    </div>
                    <div class="col-md-5">
                    <asp:RadioButtonList ID="rbGender" runat="server" Text='<%# Bind("jenis_Kelamin")%>' >
                     <asp:ListItem value="1" Selected="true"> Laki Laki</asp:ListItem>
                    <asp:ListItem Value="0">Perempuan</asp:ListItem>
                    </asp:RadioButtonList>
                  </div>
                </div>

                    <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Alamat</label>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtAlamatE" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server"
                        ControlToValidate="txtAlamatE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                     <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Username</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtUnameE" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server"
                        ControlToValidate="txtUnameE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                  </div>

                    <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Password</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtPassE" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                        runat="server"
                        ControlToValidate="txtPassE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                  </div>

                   <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Email</label><span style="color:red">*</span>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtEmailE" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server"
                        ControlToValidate="txtEmailE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                         ControlToValidate="txtEmailE"
                         ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                         ErrorMessage = "Format Email Salah"/>
                  </div>
                  </div>
                    
                 <div class="row form-group">
                 <div class="col-md-3">
                  <label for="jenis">Jenis Dokter</label><span style="color:red">*</span>
                </div>
                 <div class="col-md-5">
                  <asp:DropDownList ID="ddlJenisE" runat="server" CssClass="form-control" DataSourceID="dsJenisE" DataTextField="nama_Jenis" DataValueField="ID_SP">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsJenisE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select ID_SP,nama_Jenis from jenis_Dokter where [status] =1"></asp:SqlDataSource>
                  </div>
                </div>  
<%--                    
                 <div class="row form-group">
                 <div class="col-md-3">
                  <label for="jenis">Jadwal Kerja</label>
                </div>
                 <div class="col-md-5">
                  <asp:DropDownList ID="ddlJadwalE" runat="server" CssClass="form-control" DataSourceID="dsJadwalE" DataTextField="hari_Kerja" DataValueField="ID_Jadwal">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsJadwalE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select ID_Jadwal,hari_Kerja from jadwal_Dokter where [status] =1"></asp:SqlDataSource>
                  </div>
                </div> --%>
                    
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
                     </div>
               <asp:Button ID="btnUbahFoto"  CssClass="btn btn-dark" runat="server" Text="Ubah Foto" OnClick="btnUbahFoto_Click"/>
                </div>

                <div class="card-footer">
                  <asp:Button ID="EditbtnSave" CssClass="btn btn-primary" runat="server" Text="Simpan" OnClick="EditbtnSave_Click"/>
                  <asp:Button ID="EditbtnCancel" CssClass="btn btn-danger" runat="server" Text="Kembali" OnClick="EditbtnCancel_Click"/>
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
                 <h2>Tabel Dokter</h2>

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
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridDokter" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID_Dokter" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDokter_PageIndexChanging"
                    OnRowCommand="gridDokter_RowCommand" OnSorting="gridDokter_Sorting" OnSelectedIndexChanged="gridDokter_SelectedIndexChanged"
                   OnRowDataBound="gridDokter_RowDataBound" OnRowDeleting="gridDokter_RowDeleting"
                    >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Right" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                <%# Container.DataItemIndex +1 %> 
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="NIP" HeaderStyle-CssClass="table-bordered" HeaderText="NIP"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" SortExpression="NIP" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nama" HeaderStyle-CssClass="table-bordered" HeaderText="Nama Dokter"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Alamat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="jenis_Kelamin"  ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"  HeaderText="Jenis Kelamin"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nama_jenis" HeaderStyle-CssClass="table-bordered" HeaderText="Jenis Dokter"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="alamat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="18%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>

                        <asp:BoundField DataField="email" HeaderText="Email" HeaderStyle-CssClass="table-bordered" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="email" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%" CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        
                          <asp:ImageField ControlStyle-Width="100" HeaderStyle-CssClass="table-bordered"  ControlStyle-Height = "100" DataImageUrlField ="foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                       </asp:ImageField>

                        <asp:BoundField DataField="username" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                        <asp:BoundField DataField="password" ItemStyle-CssClass="hiddencol" HeaderText="Password" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="password" />
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="CreateBy" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="CreateDate" ItemStyle-CssClass="hiddencol" HeaderText="createDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedBy" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="foto" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="alamat"  ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"  HeaderText="Jenis Kelamin"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" >
                        </asp:BoundField>
                          <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Apa anda yakin menon-aktifkan data?');"></span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Apa anda yakin meng-aktifkan data?');"></span></asp:LinkButton>
                                
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("ID_Dokter")%>' 
                                OnClick="lnkViewDetails_Click" Text="" ToolTip="Details" CssClass="far fa-check-square"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    
                    </Columns>
                </asp:GridView>
                   
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
        <asp:Label ID="nama" runat="server" Text="nama"></asp:Label>
        </div></div>
         
        <div class="row form-group">
         <div class="col-md-5">
         <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Jenis kelamin</asp:label>
        </div>
        <div class="col-md-5">
         <asp:Label ID="jenis_Kelamin" runat="server" Text="JenisKelamin"></asp:Label>
       </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Username</asp:label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="username" runat="server" Text="CreateBy"></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Password</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="password" runat="server" Text="Password"></asp:Label>
        </div></div>
        
         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Create Date</asp:Label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="CreateDate" runat="server" Text="modiby"></asp:Label>
        </div></div>

         <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Modified date</asp:Label>
         </div>
        <div class="col-md-5">
        <asp:Label ID="ModifiedDate" runat="server" Text="modidate"></asp:Label>
        </div></div>
      
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
  </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
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

