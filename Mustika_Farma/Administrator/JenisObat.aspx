<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="JenisObat.aspx.cs" Inherits="Administrator_JenisObat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Jenis Obat
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
    <h1 class="m-0 text-dark">Jenis Obat</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    Jenis Obat
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
                <h3 class="card-title">Tambah Jenis Obat</h3>
              </div>
                
                <div class="card-body">
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Nama Jenis Obat</label>
                    </div>
                      <div class="col-md-5">
                    <asp:TextBox ID="txtnamaJenis" CssClass="form-control" runat="server"/>
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
                <h3 class="card-title">Edit Jenis Obat</h3>
              </div>
                
                <div class="card-body">
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="exampleInputEmail1">Nama Jenis Obat</label>
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
                <h3 class="card-title">Table Jenis Obat</h3>
                  <br />

                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="btntambah" OnClick="btntambah_Click"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
                 <label>Lihat Bedasarkan Status</label>
                <asp:DropDownList ID="ddlStatusView" runat="server" class="form-control" Width="200px" OnTextChanged="ddlStatusView_TextChanged" AutoPostBack="true">
                 <asp:ListItem value="1" >Aktif</asp:ListItem>
                 <asp:ListItem Value="0" >Tidak Aktif</asp:ListItem>
                 <asp:ListItem Value="2" Selected="True">Semua</asp:ListItem>
             </asp:DropDownList>
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
                
                <asp:GridView ID="gridJenis" runat="server" CssClass="table table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="idjenis" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridJenis_PageIndexChanging"
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
                        <asp:BoundField DataField="namaJenis"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Jenis"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="deskripsi"  HeaderStyle-CssClass="table-bordered" HeaderText="Deskripsi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="statusJenis" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon">Edit</span>
                                </asp:LinkButton>
                                
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Are you sure you want to delete this item?');">Aktif</span></asp:LinkButton>
                                
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

