﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Register.master" AutoEventWireup="true" CodeFile="Registrasi.aspx.cs" Inherits="Customer_Registrasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="input-group mb-3">
         <asp:TextBox ID="txtNama" CssClass="form-control" runat="server" placeholder="Nama"/>
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
         <asp:TextBox ID="txtNoTelp" CssClass="form-control" runat="server" placeholder="No Telp" />
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
         <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" />
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

