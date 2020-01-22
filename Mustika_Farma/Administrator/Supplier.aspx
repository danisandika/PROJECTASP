<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Administrator_Supplier" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
     <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style> 
    
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
             <div class="row form-group">
            <div class="col-md-3">
            <asp:Label
                id="lblNama"
                Text="Nama Supplier  "
                AssociatedControlID="txtNamaSupplier"
                Runat="server" /><span style="color:red">*</span>
            </div>
            <div class="col-md-5">
            <asp:TextBox
                id="txtNamaSupplier"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />
            <asp:RequiredFieldValidator runat="server" id="reqName" 
                            controltovalidate="txtNamaSupplier" 
                            errormessage="Data Harus diisi!" />
           </div>
            </div>

            <div class="row form-group">
            <div class="col-md-3">
            <asp:Label
                id="lblAlamat"
                Text="Alamat supplier  "
                AssociatedControlID="txtAlamat"
                Runat="server" /><span style="color:red">*</span>
           </div>
            <div class="col-md-5">
            <asp:TextBox
                id="txtAlamat"
                class="form-control form-control-user"
                Text='<%# Bind("AlamatSupplier") %>'
                Runat="server" TextMode="MultiLine"/>
           
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator6" 
                            controltovalidate="txtAlamat" 
                            errormessage="Data Harus diisi!" />
            </div>
            </div>

            <div class="row form-group">
             <div class="col-md-3">
            <asp:Label
                id="lblEmail"
                Text="Email"
                AssociatedControlID="txtEmail"
                Runat="server" /><span style="color:red">*</span>
           </div>
           <div class="col-md-5">
            <asp:TextBox
                id="txtEmail"
                class="form-control form-control-user"
                Text='<%# Bind("EmailSupplier") %>'
                Runat="server" TextMode="Email" />
           
             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator7" 
                            controltovalidate="txtEmail" 
                            errormessage="Data Harus diisi!" />
                          
                <asp:RegularExpressionValidator
                 ID="RegularExpressionValidator2"
                 runat="server" 
                 ControlToValidate="txtEmail"
                 ForeColor="Red"
                 ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                 ErrorMessage = "Format Email Salah"/>
           </div>
            </div>

            <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Nomor Telepon</label>
                    </div>
                    <div class="col-md-5">
                     <asp:TextBox ID="txtPhoneInsert" CssClass="form-control" runat="server" TextMode="Number" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                         ControlToValidate="txtPhoneInsert"
                         ForeColor="Red" ValidationExpression="(\d[0-9]{10,13})$"
                         ErrorMessage = "Masukan minimal 12 Digit nomor telephone"/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="txtPhoneInsert"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

            <div class="row form-group">
             <div class="col-md-3">
             <asp:Label
                id="lblCreateBy"
                Text="Create Date  "
                AssociatedControlID="txtTanggal"
                Runat="server" /><span style="color:red">*</span>
            </div>
             <div class="col-md-5">
             <asp:TextBox CssClass="form-control" ID="txtTanggal" placeholder="Create Date" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="valTanggal"
                 runat="server"
                 ControlToValidate="txtTanggal"
                 ForeColor="Red"
                 ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
            </div>
            </div>
        <div class="card-footer">
        <asp:Button ID="btnAdd" runat="server" Text="Simpan" OnClick="btnAdd_Click" class="btn btn-primary col-1" />
        <asp:Button ID="btnCancelAdd" runat="server" Text="Kembali" OnClick="btnCancelAdd_Click" class="btn btn-danger col-1"/>
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
            <div class="row form-group">
             <div class="col-md-3">
            <asp:Label
                id="lblENama"
                Text="Nama Supplier   "
                AssociatedControlID="txtNamaE"
                Runat="server" /><span style="color:red">*</span>
            </div>
             <div class="col-md-5">
            <asp:TextBox
                id="txtNamaE"
                class="form-control form-control-user"
                Text='<%# Bind("NamaSupplier") %>'
                Runat="server" />

            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" 
                            controltovalidate="txtNamaE" 
                            errormessage="Data Harus diisi!" />
            </div>
            </div>
            <div class="row form-group">
             <div class="col-md-3">
            <asp:Label
                id="Label3"
                Text="Alamat supplier  "
                AssociatedControlID="txtAlamatE"
                Runat="server" /><span style="color:red">*</span>
           </div>
             <div class="col-md-5">
            <asp:TextBox
                id="txtAlamatE"
                class="form-control form-control-user"
                Text='<%# Bind("AlamatSupplier") %>'
                Runat="server" />

            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" 
                            controltovalidate="txtAlamatE" 
                            errormessage="Data Harus diisi!" />
            </div>
            </div>
            <div class="row form-group">
             <div class="col-md-3">
            <asp:Label
                id="Label4"
                Text="Email  "
                AssociatedControlID="txtEmailE"
                Runat="server" /><span style="color:red">*</span>
            </div>
             <div class="col-md-5">
            <asp:TextBox
                id="txtEmailE"
                class="form-control form-control-user"
                Text='<%# Bind("EmailSupplier") %>'
                Runat="server" />

            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" 
                            controltovalidate="txtEmailE" 
                            errormessage="Data Harus diisi!" />

            <asp:RegularExpressionValidator
                 ID="RegularExpressionValidator3"
                 runat="server" 
                 ControlToValidate="txtEmailE"
                 ForeColor="Red"
                 ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                 ErrorMessage = "Format Email Salah"/>
            </div>
            </div>
            <div class="row form-group">
             <div class="col-md-3">
            <asp:Label
                id="Label5"
                Text="Nomor Telephone  : "
                AssociatedControlID="txtNoTelpE"
                Runat="server" />
            </div>
             <div class="col-md-5">
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
            </div>
        <div class="card-footer">
        <asp:Button ID="btnEdit" runat="server" Text="Ubah" OnClick="btnEdit_Click" class="btn btn-primary" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" OnClick="btnCancelEdit_Click1" class="btn btn-danger"/>
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
                <h3 class="card-title">Table Supplier</h3>
                  <br />
                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="Linkbutton1" OnClick="btnTambah_Click1"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
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
                OnSorting="grdMenu_Sorting"
                OnRowDeleting="grdMenu_RowDeleting"
                OnRowDataBound="grdMenu_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="No. "  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="NamaSupplier" HeaderStyle-CssClass="table-bordered"  HeaderText="Nama Supplier" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="NamaSupplier" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                    <asp:BoundField DataField="AlamatSupplier" HeaderStyle-CssClass="table-bordered"  HeaderText="Alamat" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="AlamatSupplier" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                    <asp:BoundField DataField="EmailSupplier" HeaderStyle-CssClass="table-bordered"  HeaderText="Email" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="EmailSupplier" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                    <asp:BoundField DataField="noTelp" HeaderStyle-CssClass="table-bordered"  HeaderText="No Telp" NullDisplayText ="-" ItemStyle-HorizontalAlign="Left" SortExpression="noTelp" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                   <asp:BoundField DataField="Status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="CreateDate" ItemStyle-CssClass="hiddencol" HeaderText="createDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="namaM" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                  
                      <asp:TemplateField HeaderText="Aksi" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        <ItemTemplate>
                            <asp:LinkButton runat="server"  ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Ubah Data Table"><span class="far fa-edit nav-icon"></span></asp:LinkButton>
                        
                                <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Apakah Anda yakin me-nonaktifkan data ini?');"></span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Apakah Anda yakin untuk meaktifkan data ini?');"></span></asp:LinkButton>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDSupplier")%>' 
                                OnClick="lnkViewDetails_Click" Text="" ToolTip="Details" CssClass="far fa-check-square"/>     
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

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


