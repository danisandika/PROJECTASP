<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form runat="server">
     <div class="input-group mb-3">
         <asp:TextBox ID="txtNama" CssClass="form-control" runat="server"/>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>

        <div class="input-group mb-3">
        <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password" />    
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
       
          <!-- /.col -->
          <center>
          <div class="col-4">
            <asp:Button ID="btnSave" class="btn btn-primary btn-block btn-flat" runat="server" Text="Sign In" OnClick="btnSave_Click"/>
          </div>
        </center>
          <!-- /.col -->
    </form>
</asp:Content>

