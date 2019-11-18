<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="viewSupplier.aspx.cs" Inherits="viewSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1 class="m-0 text-dark">Supplier</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<form runat="server">
<div class="card-body" id="AddMenu" runat="server">
     <div class="row">
        <div class="col-12 table-responsive">
        <table class="table table-striped">
           <%-- <tr>
            <td>
            <asp:Label
                id="lblIdSupp"
                Text="ID Supplier : "
                AssociatedControlID="txtIDSupplier"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtIDSupplier"
                class="form-control form-control-user"
                Text='<%# Bind("IDSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valIDSupplier"
                ControlToValidate="txtIDSupplier"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            </tr>--%>

            <tr>
            <td>
            <asp:Label
                id="lblNama"
                Text="Nama Supplier  : "
                AssociatedControlID="txtNamaSupplier"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtNamaSupplier"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valNama"
                ControlToValidate="txtNamaSupplier"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            </tr>
            
            <tr>
            <td>
            <asp:Label
                id="lblAlamat"
                Text="Alamat supplier : "
                AssociatedControlID="txtAlamat"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtAlamat"
                class="form-control form-control-user"
                Text='<%# Bind("AlamatSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valAlamat"
                ControlToValidate="txtAlamat"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="lblEmail"
                Text="Email : "
                AssociatedControlID="txtEmail"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtEmail"
                class="form-control form-control-user"
                Text='<%# Bind("EmailSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="val3mail"
                ControlToValidate="txtEmail"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            <td><asp:RegularExpressionValidator
                 ID="RegularExpressionValidator2"
                 runat="server" 
                 ControlToValidate="txtEmail"
                 ForeColor="Red"
                 ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                 ErrorMessage = "Format Email Salah"/></td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="Label1"
                Text="Nomor Telephone  : "
                AssociatedControlID="txtNamaSupplier"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtPhoneInsert"
                  class="form-control form-control-user"
                Text='<%# Bind("Phone") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valPhone"
                ControlToValidate="txtPhoneInsert"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            
            <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator1" 
                runat="server"
                ControlToValidate="txtPhoneInsert"
                ErrorMessage="Only numeric allowed"
                Text="Only Numeric"
                ValidationExpression="^[0-9]*$"/>
            
            </td>
            </tr>

            <tr>
            <td>
             <asp:Label
                id="lblCreateBy"
                Text="Create Date  : "
                AssociatedControlID="txtTanggal"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtTanggal" placeholder="Create Date" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="valTanggal"
                 runat="server"
                 ControlToValidate="txtTanggal"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>

        </table>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" class="btn btn-sm btn-info float-center" />
        <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelAdd_Click" class="btn btn-sm btn-secondary float-center"/>
    </div>
    </div>
</div>

<div class="card-body" id="EditMenu" runat="server">
 <div class="row">
        <div class="col-12 table-responsive">
        <table class="table table-striped">
         <asp:Label ID="lblIdEdit" Visible="false" runat="server"></asp:Label>
            <tr>
            <td>
            <asp:Label
                id="lblENama"
                Text="Nama Supplier  : "
                AssociatedControlID="txtNamaE"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtNamaE"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="RequiredFieldValidator1"
                ControlToValidate="txtNamaE"
                Text="(Required)"
                ValidationGroup="frmedit"
                Runat="server" />
            </td>
            </tr>
            
            <tr>
            <td>
            <asp:Label
                id="Label3"
                Text="Alamat supplier : "
                AssociatedControlID="txtAlamatE"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtAlamatE"
                class="form-control form-control-user"
                Text='<%# Bind("AlamatSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="RequiredFieldValidator2"
                ControlToValidate="txtAlamatE"
                Text="(Required)"
                ValidationGroup="frmedit"
                Runat="server" />
            </td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="Label4"
                Text="Email : "
                AssociatedControlID="txtEmailE"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtEmailE"
                class="form-control form-control-user"
                Text='<%# Bind("EmailSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="RequiredFieldValidator3"
                ControlToValidate="txtEmailE"
                Text="(Required)"
                ValidationGroup="frmedit"
                Runat="server" />
            </td>
            <td><asp:RegularExpressionValidator
                 ID="RegularExpressionValidator3"
                 runat="server" 
                 ControlToValidate="txtEmailE"
                 ForeColor="Red"
                 ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                 ErrorMessage = "Format Email Salah"/></td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="Label5"
                Text="Nomor Telephone  : "
                AssociatedControlID="txtNoTelpE"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtNoTelpE"
                  class="form-control form-control-user"
                Text='<%# Bind("Phone") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="RequiredFieldValidator4"
                ControlToValidate="txtNoTelpE"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            
            <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator4" 
                runat="server"
                ControlToValidate="txtNoTelpE"
                ErrorMessage="Only numeric allowed"
                Text="Only Numeric"
                ValidationExpression="^[0-9]*$"/>
            
            </td>
            </tr>

            <tr>
            <td>
             <asp:Label
                id="Label6"
                Text="Create Date  : "
                AssociatedControlID="txtTanggalE"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtTanggalE" placeholder="Create Date" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                 runat="server"
                 ControlToValidate="txtTanggalE"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>

             <tr>
            <td>
             <asp:Label
                id="Label7"
                Text="Modified Date  : "
                AssociatedControlID="txtTanggalME"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtTanggalME" placeholder="Modified Date" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                 runat="server"
                 ControlToValidate="txtTanggalME"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>
            
            <tr>
            <td>
            <asp:Label
                id="Label2"
                Text="Status : "
                AssociatedControlID="txtAlamatE"
                Runat="server" />
            </td>
            <td>
                    <asp:RadioButton ID="rbAktif" runat="server" Text="Aktif" />
                    <asp:RadioButton ID="rbTidak" runat="server" Text="Tidak Aktif" />
             </td>
            </tr>
        </table>
        <asp:Button ID="btnEdit" runat="server" Text="Ubah" OnClick="btnEdit_Click" class="btn btn-sm btn-info float-center" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" OnClick="btnCancelEdit_Click" class="btn btn-sm btn-secondary float-center"/>
    </div>
</div>
</div>


<div class="card-body" id="ViewMenu" runat="server">
     <div class ="card card-primary">
     <table>
            <tr>
            <td>
                <asp:TextBox
                    id="txtSearch"
                    class="form-control form-control-user"
                    Text='<%# Bind("master_menu") %>'
                    Runat="server" />
            </td>
            <td>
                <asp:Button
                    id="btnSearch"
                    class="form-control form-control-user"
                    Text="Search"
                    Runat="server" 
                    OnClick="btnSearch_Click"/>
            </td>
            <td>
                <asp:Button
                    id="btnTambah"
                    class="form-control form-control-user"
                    Text="Tambah"
                    Runat="server"
                    OnClick="btnTambah_Click1" />
            </td>
            </tr>
         </table>
         <div class="card-body">
         <table class="table table-bordered">
            <tr>
                <asp:GridView
                id="grdMenu"
                DataKeyNames="IDSupplier"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                GridLines="Both"
                CssClass="list"
                Runat="server" Width="396px"
                OnSelectedIndexChanged="grdMenu_SelectedIndexChanged"
                OnPageIndexChanging="grdMenu_PageIndexChanging"
                OnRowCommand="grdMenu_RowCommand"
                OnSorting="grdMenu_Sorting">
                <Columns>
                    <asp:TemplateField HeaderText="No. " ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDSupplier" HeaderText="ID Supplier" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="IDSupplier" />
                    <asp:BoundField DataField="NamaSupplier" HeaderText="Nama Supplier" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="NamaSupplier" />
                    <asp:BoundField DataField="AlamatSupplier" HeaderText="Alamat" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="AlamatSupplier" />
                    <asp:BoundField DataField="EmailSupplier" HeaderText="Email" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="EmailSupplier" />
                    <asp:BoundField DataField="noTelp" HeaderText="No Telp" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="noTelp" />
                    <asp:BoundField DataField="Status" HeaderText="Status" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="Status" />
                    <asp:BoundField DataField="CreateBy" HeaderText="Create By" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="CreateBy" />
                    <asp:BoundField DataField="CreateDate" HeaderText="Create Date" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="CreateDate" />
                    <asp:BoundField DataField="ModifiedBy" HeaderText="Modified By" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="ModifiedBy" />
                    <asp:BoundField DataField="ModifiedDate" HeaderText="Modified Date" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="ModifiedDate" />

                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Edit" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Ubah Data Table"></asp:LinkButton>
                            &nbsp;|&nbsp;
                            <asp:LinkButton runat="server" Text="Hapus" ID="linkHapus" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Hapus Data Table"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </tr>

        </table>
      </div>
    </div>
</div>
</form>
</asp:Content>


