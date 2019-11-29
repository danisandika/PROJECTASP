﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Administrator_Supplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Supplier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
    <h1 class="m-0 text-dark">Supplier</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    Supplier
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
      <!--SECTION ADD-->
     <section class="content" id="AddMenu" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tambah Supplier</h3>
              </div>
            <div class="card-body">
             <div class="form-group">
            <asp:Label
                id="lblNama"
                Text="Nama Supplier  : "
                AssociatedControlID="txtNamaSupplier"
                Runat="server" />
          
            <asp:TextBox
                id="txtNamaSupplier"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />
           
            <asp:RequiredFieldValidator
                id="valNama"
                ControlToValidate="txtNamaSupplier"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </div>
            <div class="form-group">
            <asp:Label
                id="lblAlamat"
                Text="Alamat supplier : "
                AssociatedControlID="txtAlamat"
                Runat="server" />
           
            <asp:TextBox
                id="txtAlamat"
                class="form-control form-control-user"
                Text='<%# Bind("AlamatSupplier") %>'
                Runat="server" TextMode="MultiLine"/>
           
            <asp:RequiredFieldValidator
                id="valAlamat"
                ControlToValidate="txtAlamat"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            </div>
            <div class="form-group">
            <asp:Label
                id="lblEmail"
                Text="Email : "
                AssociatedControlID="txtEmail"
                Runat="server" />
           
            <asp:TextBox
                id="txtEmail"
                class="form-control form-control-user"
                Text='<%# Bind("EmailSupplier") %>'
                Runat="server" TextMode="Email" />
           
            <asp:RequiredFieldValidator
                id="val3mail"
                ControlToValidate="txtEmail"
                Text="(Required)"
                ValidationGroup="frmAdd"
                Runat="server" />
            
                <asp:RegularExpressionValidator
                 ID="RegularExpressionValidator2"
                 runat="server" 
                 ControlToValidate="txtEmail"
                 ForeColor="Red"
                 ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                 ErrorMessage = "Format Email Salah"/>
           </div>
            <div class="form-group">
            <asp:Label
                id="Label1"
                Text="Nomor Telephone  : "
                AssociatedControlID="txtNamaSupplier"
                Runat="server" />
           
            <asp:TextBox
                id="txtPhoneInsert"
                  class="form-control form-control-user"
                Text='<%# Bind("Phone") %>'
                Runat="server" />
            
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
            
            </div>
            <div class="form-group">
             <asp:Label
                id="lblCreateBy"
                Text="Create Date  : "
                AssociatedControlID="txtTanggal"
                Runat="server" />
          
             <asp:TextBox CssClass="form-control" ID="txtTanggal" placeholder="Create Date" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="valTanggal"
                 runat="server"
                 ControlToValidate="txtTanggal"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </div>
        <div class="card-footer">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" class="btn btn-primary col-1" />
        <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" OnClick="btnCancelAdd_Click" class="btn btn-danger col-1"/>
    </div>
    </div>
</div>
</div>
</div>
</div>
</section>
    

 <section class="content" id="EditMenu" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tambah Supplier</h3>
              </div>
                    <asp:Label ID="lblIdEdit" Visible="false" runat="server"></asp:Label>
            <div class="card-body">
            <div class="form-group">
            <asp:Label
                id="lblENama"
                Text="Nama Supplier  : "
                AssociatedControlID="txtNamaE"
                Runat="server" />

            <asp:TextBox
                id="txtNamaE"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />

            <asp:RequiredFieldValidator
                id="RequiredFieldValidator1"
                ControlToValidate="txtNamaE"
                Text="(Required)"
                ValidationGroup="frmedit"
                Runat="server" />
            </div>
            <div class="form-group">
            <asp:Label
                id="Label3"
                Text="Alamat supplier : "
                AssociatedControlID="txtAlamatE"
                Runat="server" />

            <asp:TextBox
                id="txtAlamatE"
                class="form-control form-control-user"
                Text='<%# Bind("AlamatSupplier") %>'
                Runat="server" />

            <asp:RequiredFieldValidator
                id="RequiredFieldValidator2"
                ControlToValidate="txtAlamatE"
                Text="(Required)"
                ValidationGroup="frmedit"
                Runat="server" />
            </div>
            <div class="form-group">
            <asp:Label
                id="Label4"
                Text="Email : "
                AssociatedControlID="txtEmailE"
                Runat="server" />

            <asp:TextBox
                id="txtEmailE"
                class="form-control form-control-user"
                Text='<%# Bind("EmailSupplier") %>'
                Runat="server" />

            <asp:RequiredFieldValidator
                id="RequiredFieldValidator3"
                ControlToValidate="txtEmailE"
                Text="(Required)"
                ValidationGroup="frmedit"
                Runat="server" />

            <asp:RegularExpressionValidator
                 ID="RegularExpressionValidator3"
                 runat="server" 
                 ControlToValidate="txtEmailE"
                 ForeColor="Red"
                 ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                 ErrorMessage = "Format Email Salah"/>
            </div>
            <div class="form-group">
            <asp:Label
                id="Label5"
                Text="Nomor Telephone  : "
                AssociatedControlID="txtNoTelpE"
                Runat="server" />

            <asp:TextBox
                id="txtNoTelpE"
                  class="form-control form-control-user"
                Text='<%# Bind("Phone") %>'
                Runat="server" />

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
            </div>
            
        <div class="card-footer">
        <asp:Button ID="btnEdit" runat="server" Text="Ubah" OnClick="btnEdit_Click" class="btn btn-primary" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" OnClick="btnCancelEdit_Click" class="btn btn-danger"/>
        </div>
    </div>
</div>
</div>
</div>
</div>
</section>

<div class="card-body" id="ViewMenu" runat="server">
      <section class="content" id="secView" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Jenis Obat</h3>
                  <br />
                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="Linkbutton1" OnClick="btnTambah_Click1"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <asp:TextBox id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    <div class="input-group-append">
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="LinkButton2" OnClick="btnSearch_Click"><i class="fas fa-search"></i></asp:LinkButton>
                    </div>
                  </div>
                </div>
              </div>

         <div class="card-body table-responsive p-0 col-12">
                <asp:GridView CssClass="table table-hover"
                id="grdMenu"
                DataKeyNames="IDSupplier"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                GridLines="Both"
                Runat="server"
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
                    
                    <asp:BoundField DataField="NamaSupplier" HeaderText="Nama Supplier" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="NamaSupplier" />
                    <asp:BoundField DataField="AlamatSupplier" HeaderText="Alamat" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="AlamatSupplier" />
                    <asp:BoundField DataField="EmailSupplier" HeaderText="Email" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="EmailSupplier" />
                    <asp:BoundField DataField="noTelp" HeaderText="No Telp" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="noTelp" />
                    

                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server"  ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Ubah Data Table"><span class="far fa-edit nav-icon">Edit</span></asp:LinkButton>
                            &nbsp;|&nbsp;
                            <asp:LinkButton runat="server" ID="linkHapus" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Hapus Data Table"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span></asp:LinkButton>
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
</div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>


