<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h1 class="m-0 text-dark">Supplier</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <form runat="server">
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
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click1" class="btn btn-sm btn-info float-center" />
        <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelAdd_Click" class="btn btn-sm btn-secondary float-center"/>
    </div>
    </div>
    </form>
</asp:Content>

