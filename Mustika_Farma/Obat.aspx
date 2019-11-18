<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Obat.aspx.cs" Inherits="Obat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h1 class="m-0 text-dark">Obat</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <form runat="server">
     <div class="row">
        <div class="col-12 table-responsive">
        <table class="table table-striped">
            <tr>
            <td>
            <asp:Label
                id="lblNama"
                Text="Nama Obat  : "
                AssociatedControlID="txtNamaObat"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtNamaObat"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valNama"
                ControlToValidate="txtNamaObat"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            </tr>
            
            <tr>
            <td>
            <asp:Label
                id="lblAlamat"
                Text="ID Jenis : "
                AssociatedControlID="DDlIDJenis"
                Runat="server" />
            </td>
            <td>
             <asp:DropDownList ID="DDlIDJenis" runat="server" class="custom-select"></asp:DropDownList>
            </td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="lblJumlah"
                Text="Jumlah Obat : "
                AssociatedControlID="txtJumlahObat"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtJumlahObat"
                class="form-control form-control-user"
                Text='<%# Bind("JumlahObat") %>'
                Runat="server" />
            </td>
            <td>
                <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator2" 
                runat="server"
                ControlToValidate="txtJumlahObat"
                ErrorMessage="Only numeric allowed"
                Text="Only Numeric"
                ValidationExpression="^[0-9]*$"/>
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valJumlah"
                ControlToValidate="txtJumlahObat"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="Label1"
                Text="Keterangan  : "
                AssociatedControlID="txtKet"
                Runat="server" />
            </td>
            <td>
            <asp:TextBox
                id="txtKet"
                  class="form-control form-control-user"
                Text='<%# Bind("Keterangan") %>'
                Runat="server" />
            </td>
            <td>
            <asp:RequiredFieldValidator
                id="valKet"
                ControlToValidate="txtKet"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </td>
            </tr>

            <tr>
            <td>
            <asp:Label
                id="Label8"
                Text="ID Lokasi  : "
                AssociatedControlID="ddlLokasi"
                Runat="server" />
            </td>
            <td>
             <asp:DropDownList ID="ddlLokasi" runat="server" class="custom-select"></asp:DropDownList>
            </td>
            </tr>

            <tr>
            <td>
             <asp:Label
                id="lblSatuan"
                Text="Satuan  : "
                AssociatedControlID="txtSatuan"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtSatuan" placeholder="Satuan" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="valSatuan"
                 runat="server"
                 ControlToValidate="txtSatuan"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>

            <tr>
            <td>
             <asp:Label
                id="Label9"
                Text="Harga  : "
                AssociatedControlID="txtHarga"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtHarga" placeholder="Harga" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                 runat="server"
                 ControlToValidate="txtHarga"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>

           <tr>
            <td>
             <asp:Label
                id="Label10"
                Text="Expired  : "
                AssociatedControlID="txtExpired"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtExpired" placeholder="Expired Date" runat="server" TextMode="Date" required></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                 runat="server"
                 ControlToValidate="txtExpired"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>

           
           <tr>
            <td>
             <asp:Label
                id="Label11"
                Text="Photo  : "
                AssociatedControlID="txtPhoto"
                Runat="server" />
            </td>
            <td>
             <asp:TextBox CssClass="form-control" ID="txtPhoto" placeholder="Photo" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                 runat="server"
                 ControlToValidate="txtPhoto"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </td>
            </tr>

        </table>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" class="btn btn-sm btn-info float-center" />
        <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelAdd_Click" class="btn btn-sm btn-secondary float-center"/>
    </div>
    </div>
</form>
</asp:Content>

