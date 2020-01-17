<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="jenisDokter.aspx.cs" Inherits="Administrator_jenisDokter" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
     Jenis Dokter
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
      <h1 class="m-0 text-dark">Jenis Dokter</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
     Jenis Dokter
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
                <h3 class="card-title">Tambah Jenis Dokter</h3>
              </div>
                
                <div class="card-body">
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Nama Jenis Dokter</label><span style="color:red">*</span>
                    </div>
                      <div class="col-md-5">
                    <asp:TextBox ID="txtnamaJenis" CssClass="form-control" runat="server"/>
                           <asp:RequiredFieldValidator
                            id="RequiredFieldValidator17"
                            ControlToValidate="txtnamaJenis"
                            Text="(Required)"
                            ValidationGroup="frmAdd"
                            Runat="server" />
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputPassword1">Deskripsi</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtDeskripsi" CssClass="form-control" runat="server" TextMode="MultiLine" />
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
                <h3 class="card-title">Edit Jenis Dokter</h3>
              </div>
                
                <div class="card-body">
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Nama Jenis Dokter</label><span style="color:red">*</span>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtEditnamaJenis" CssClass="form-control" runat="server"/>
                  </div>
                  </div>

                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="exampleInputPassword1">Deskripsi</label>
                    </div>
                    <div class="col-md-5">
                      <asp:TextBox ID="txtEditDeskripsi" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                </div>
                  
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                  <asp:Button ID="EditbtnSave" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="EditbtnSave_Click"/>
                  <asp:Button ID="EditbtnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="EditbtnCancel_Click"/>
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
                <h3 class="card-title">Table Jenis Dokter</h3>
                  <br />

                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="btntambah" OnClick="btntambah_Click"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
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
                
                <asp:GridView ID="gridJenis" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="ID_SP" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridJenis_PageIndexChanging"
                    OnRowCommand="gridJenis_RowCommand" OnSorting="gridJenis_Sorting" OnSelectedIndexChanged="gridJenis_SelectedIndexChanged"
                    OnRowDeleting="gridJenis_RowDeleting" OnRowDataBound="gridJenis_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="1%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nama_jenis"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Jenis"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="nama_jenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="deskripsi"  HeaderStyle-CssClass="table-bordered" HeaderText="Deskripsi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="createDate" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="nama" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="modifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>
                                
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Apa kamu yakin untuk me-non aktifkan akun ini?');"></span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Apa kamu yakin untuk me-aktifkan akun ini?');"></span></asp:LinkButton>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("ID_SP")%>' 
                                OnClick="lnkViewDetails_Click" Text="" ToolTip="Details" CssClass="far fa-check-square"/>
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
        <asp:Label ID="nama_jenis" runat="server" Text="nama"></asp:Label>
        </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Dibuat Oleh</asp:label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="CreateBy" runat="server" Text="CreateBy"></asp:Label>
        </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tanggal dibuat</asp:Label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="CreateDate" runat="server" Text="Create Date"></asp:Label>
         </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Diubah Oleh</asp:Label>
        </div>
        <div class="col-md-5">
        <asp:Label ID="ModifiedBy" runat="server" Text="modiby"></asp:Label>
       </div></div>

        <div class="row form-group">
         <div class="col-md-5">
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Tanggal Diubah</asp:Label>
       </div>
        <div class="col-md-5">
        <asp:Label ID="ModifiedDate" runat="server" Text="modidate"></asp:Label>
        </div></div>
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
     </div></div>
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server"  TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
    
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

