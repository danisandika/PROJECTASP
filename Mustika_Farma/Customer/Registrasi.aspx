<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Register.master" AutoEventWireup="true" CodeFile="Registrasi.aspx.cs" Inherits="Customer_Registrasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="input-group mb-3">
         <asp:TextBox ID="txtNama" required="true" CssClass="form-control" runat="server" placeholder="Nama"/>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
         <asp:TextBox ID="txtAlamat" CssClass="form-control" runat="server" TextMode="MultiLine" placeholder="Alamat" />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-address-card"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
         <asp:TextBox ID="txtNoTelp" TextMode="Number" CssClass="form-control" runat="server" placeholder="No Telp" />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
         <asp:TextBox ID="txtTanggal" CssClass="form-control" runat="server" TextMode="Date"  placeholder="Tanggal Lahir" />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-birthday-cake"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
         <asp:TextBox ID="txtEmail" required="true" CssClass="form-control" runat="server" placeholder="Email" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtEmail"
            ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
            ErrorMessage = "Format Email Salah"/>
            <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <center>
          <div class="col-4">
            <asp:Button ID="btnSave" class="btn btn-primary btn-block btn-flat" runat="server" Text="Registrasi" OnClick="btnSave_Click1"/>
          </div>
        </center>
</asp:Content>

