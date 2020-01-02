<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Administrator_User" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    User
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    User
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
                <h3 class="card-title">Tambah User</h3>
              </div>
                
                <div class="card-body">
                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Nama User</label>
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
                     <label for="Ket">Alamat </label>
                    </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtadds" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Nomor Telepon</label>
                    </div>
                    <div class="col-md-5">
                     <asp:TextBox ID="txtNotelp" CssClass="form-control" runat="server" TextMode="Number" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                         ControlToValidate="txtNotelp"
                         ForeColor="Red" ValidationExpression="(\d[0-9]{10,13})$"
                         ErrorMessage = "Masukan minimal 12 Digit nomor telephone"/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtNotelp"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

                  <div class="row form-group">
                 <div class="col-md-3">
                  <label for="Role">Role</label>
                </div>
                 <div class="col-md-5">
                  <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control" DataSourceID="dsrole" DataTextField="Deskripsi" DataValueField="IDROle">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsrole" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select IDRole, Deskripsi from Role where [status] =1"></asp:SqlDataSource>
                  </div>
                </div>
                  <div class="row form-group">
                    <div class="col-md-3">
                      <label for="satuan">Tanggal</label>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtTanggal" CssClass="form-control" runat="server" TextMode="Date" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="txtTanggal"
                        ForeColor="Red"
                        ErrorMessage="Data Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                   <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Email</label>
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
                   <label for="Ket">Username</label>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server"
                        ControlToValidate="txtUsername"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>  
                  </div>       
                     
                   <div class="row form-group">
                     <div class="col-md-3">
                   <label for="Ket">Password</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server"
                        ControlToValidate="txtPass"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
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
                 <div class="card-body">
                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Nama User</label>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtNamaE" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server"
                        ControlToValidate="txtNamaE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                 <div class="col-md-3">
                   <label for="Ket">Alamat </label>
                 </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtAlamatE" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Nomor Telepon</label>
                    </div>
                   <div class="col-md-5">
                   <asp:TextBox ID="txtNoTelpE" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                         ControlToValidate="txtNoTelpE"
                         ForeColor="Red" ValidationExpression="(\d[0-9]{10,13})$"
                         ErrorMessage = "Masukan minimal 12 Digit nomor telephone"/>     
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtNotelp"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Isi data dengan benar"></asp:RequiredFieldValidator>
                  </div>    
                </div>

                 <div class="row form-group">
                 <div class="col-md-3">
                  <label for="Role">Role</label>
                  </div>
                 <div class="col-md-5">
                  <asp:DropDownList ID="ddlROlee" runat="server" CssClass="form-control" DataSourceID="dsroles" DataTextField="Deskripsi" DataValueField="IDROle">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsroles" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select IDRole, Deskripsi from Role where [status] =1"></asp:SqlDataSource>
                  </div>
                  </div>

                  <div class="row form-group">
                   <div class="col-md-3">
                   <label for="satuan">Tanggal</label>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtTanggalE" CssClass="form-control" runat="server" TextMode="Date" />
                  </div>
                </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Ket">Email</label>
                    </div>
                   <div class="col-md-5">
                   <asp:TextBox ID="txtEmailE" CssClass="form-control" runat="server" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                        runat="server"
                        ControlToValidate="txtEmailE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                         ControlToValidate="txtEmailE"
                         ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                         ErrorMessage = "Format Email Salah"/>
                  </div>   
                  </div>
                       
                   <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Username</label>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtUsernameE" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                        runat="server"
                        ControlToValidate="txtUsernameE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                  </div>        
                     
                   <div class="row form-group">
                     <div class="col-md-3">
                   <label for="Ket">Password</label>
                    </div>
                     <div class="col-md-5">
                   <asp:TextBox ID="txtPasswordE" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                        runat="server"
                        ControlToValidate="txtPasswordE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                </div>
     

                <div class="card-footer">
                  <asp:Button ID="EditbtnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="EditbtnSave_Click"/>
                  <asp:Button ID="EditbtnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="EditbtnCancel_Click"/>
                </div>
              
                 </div>
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
                <h3 class="card-title">Table User</h3>
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
                
                <asp:GridView ID="gridUser" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDUser" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridUser_PageIndexChanging"
                    OnRowCommand="gridUser_RowCommand" OnSorting="gridUser_Sorting" OnSelectedIndexChanged="gridUser_SelectedIndexChanged"
                   OnRowDataBound="gridUser_RowDataBound" OnRowDeleting="gridUser_RowDeleting"
                    >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign ="Center" >
                           <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate >
                                <%# Container.DataItemIndex +1 %> 
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="Nama" HeaderStyle-CssClass="table-bordered" HeaderText="Nama"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Nama" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Alamat" HeaderStyle-CssClass="table-bordered" HeaderText="Alamat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Alamat" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="NoTelp" HeaderStyle-CssClass="table-bordered" HeaderText="No Telpon"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%"  CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="TglLahir" HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal Lahir"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="8%" CssClass="table table-bordered table-striped"   />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Email" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="15%" CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Username" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                        <asp:BoundField DataField="Password" ItemStyle-CssClass="hiddencol" HeaderText="Password" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="password" />
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="CreateDate" ItemStyle-CssClass="hiddencol" HeaderText="createDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        
                         <asp:BoundField DataField="Deskripsi" HeaderStyle-CssClass="table-bordered" HeaderText="ID Role"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDRole" >
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="10%" CssClass="table table-bordered table-striped"  />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Large" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon">Edit</span>
                                </asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Are you sure you want to delete this item?');">Aktif</span></asp:LinkButton>
                                
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDUser")%>' 
                                OnClick="lnkViewDetails_Click" Text="Detail" style="margin-left:20px" CssClass="far fa-check-square"/>
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
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Nama</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="Nama" runat="server" Text="nama"></asp:Label>
         </div></div> 
        
         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Created By</asp:label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="CreateBy" runat="server" Text="CreateBy"></asp:Label>
        </div></div> 

         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Created date</asp:Label>
         </div>
         <div class="col-md-5">
        <asp:Label ID="CreateDate" runat="server" Text="Create Date"></asp:Label>
       </div></div> 
         <div class="row form-group">
        <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Modified By</asp:Label>
        </div>
         <div class="col-md-5">
        <asp:Label ID="ModifiedBy" runat="server" Text="modiby"></asp:Label>
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
  
 
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

