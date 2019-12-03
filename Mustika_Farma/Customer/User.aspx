<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Administrator_User" %>

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
                  <div class="form-group">
                    <label for="Obat">Nama User</label>
                    <asp:TextBox ID="txtNama" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="txtNama"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>

                 <div class="form-group">
                   <label for="Ket">Alamat </label>
                   <asp:TextBox ID="txtadds" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                  </div> 

                 <div class="form-group">
                   <label for="Ket">Nomor Telepon</label>
                   <asp:TextBox ID="txtNotelp" CssClass="form-control" runat="server" TextMode="Number" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                         ControlToValidate="txtNotelp"
                         ForeColor="Red" ValidationExpression="(\d[0-9]{12,13})$"
                         ErrorMessage = "Masukan minimal 12 Digit nomor telephone"/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtNotelp"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>

                  <div class="form-group">
                  <label for="Role">Role</label>
                  <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control" DataSourceID="dsrole" DataTextField="Deskripsi" DataValueField="IDROle">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsrole" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select IDRole, Deskripsi from Role where [status] =1"></asp:SqlDataSource>
                  </div>

                  <div class="form-group">
                   <label for="satuan">Tanggal</label>
                   <asp:TextBox ID="txtTanggal" CssClass="form-control" runat="server" TextMode="Date" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="txtTanggal"
                        ForeColor="Red"
                        ErrorMessage="Data Harus diisi"></asp:RequiredFieldValidator>
                  </div>

                   <div class="form-group">
                   <label for="Ket">Email</label>
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
                     
                   <div class="form-group">
                   <label for="Ket">Username</label>
                   <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server"
                        ControlToValidate="txtUsername"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>         
                     
                   <div class="form-group">
                   <label for="Ket">Password</label>
                   <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server"
                        ControlToValidate="txtPass"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
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
                  <div class="form-group">
                    <label for="Obat">Nama User</label>
                    <asp:TextBox ID="txtNamaE" CssClass="form-control" runat="server"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server"
                        ControlToValidate="txtNamaE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>

                 <div class="form-group">
                   <label for="Ket">Alamat </label>
                   <asp:TextBox ID="txtAlamatE" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                  </div> 

                 <div class="form-group">
                   <label for="Ket">Nomor Telepon</label>
                   <asp:TextBox ID="txtNoTelpE" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                         ControlToValidate="txtNoTelpE"
                         ForeColor="Red" ValidationExpression="(\d[0-9]{12,13})$"
                         ErrorMessage = "Masukan minimal 12 Digit nomor telephone"/>     
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtNotelp"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Isi data dengan benar"></asp:RequiredFieldValidator>
                  </div>

                 <div class="form-group">
                  <label for="Role">Role</label>
                  <asp:DropDownList ID="ddlROlee" runat="server" CssClass="form-control" DataSourceID="dsroles" DataTextField="Deskripsi" DataValueField="IDROle">
                  </asp:DropDownList>
                       <asp:SqlDataSource ID="dsroles" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select IDRole, Deskripsi from Role where [status] =1"></asp:SqlDataSource>
                  </div>

                  <div class="form-group">
                   <label for="satuan">Tanggal</label>
                   <asp:TextBox ID="txtTanggalE" CssClass="form-control" runat="server" TextMode="Date" />
                  </div>

                   <div class="form-group">
                   <label for="Ket">Email</label>
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
                     
                   <div class="form-group">
                   <label for="Ket">Username</label>
                   <asp:TextBox ID="txtUsernameE" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                        runat="server"
                        ControlToValidate="txtUsernameE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>         
                     
                   <div class="form-group">
                   <label for="Ket">Password</label>
                   <asp:TextBox ID="txtPasswordE" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                        runat="server"
                        ControlToValidate="txtPasswordE"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
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
                
                <asp:GridView ID="gridUser" runat="server" CssClass="table table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDUser" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridUser_PageIndexChanging"
                    OnRowCommand="gridUser_RowCommand" OnSorting="gridUser_Sorting" OnSelectedIndexChanged="gridUser_SelectedIndexChanged" >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nama" HeaderText="Nama"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Nama" />
                        <asp:BoundField DataField="Alamat" HeaderText="Alamat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Alamat" />
                        <asp:BoundField DataField="NoTelp" HeaderText="No Telpon"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoTelp" />
                        <asp:BoundField DataField="TglLahir" HeaderText="Tanggal Lahir"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TglLahir" />
                        <asp:BoundField DataField="Email" HeaderText="Email"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Email" />
                        <asp:BoundField DataField="Username" HeaderText="Username"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                        <asp:BoundField DataField="Password" HeaderText="Password"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="password" />
                        <asp:BoundField DataField="IDROle" HeaderText="ID Role"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDRole" />
                        
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

