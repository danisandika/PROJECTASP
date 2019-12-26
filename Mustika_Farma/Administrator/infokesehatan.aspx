<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="infokesehatan.aspx.cs" Inherits="Administrator_infokesehatan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Info Kesehatan
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
Info Kesehatan
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
                <h3 class="card-title">Tambah Info Kesehatan</h3>
              </div>
                
                <div class="card-body">
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="Judul">Judul</label>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtJudul" CssClass="form-control" runat="server"/>
                  </div>
                </div>


                  <div class="row form-group">
                   <div class="col-md-3">
                   <label for="kategori">Kategori</label>
                   </div>
                   <div class="col-md-5">
                   <asp:DropDownList ID="ddlKategori" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="Ibu dan Anak">Ibu dan Anak</asp:ListItem>
                        <asp:ListItem Value="Sehari hari">Sehari hari</asp:ListItem>
                        <asp:ListItem Value="Olahraga">Olahraga</asp:ListItem>
                       <asp:ListItem Value="Penyakit">Penyakit</asp:ListItem>
                       
                    </asp:DropDownList>
                    </div>
                    </div>

                   <div class="row form-group">
                    <div class="col-md-3">
                   <label for="waktuPost">Waktu Post</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtWaktuPost" CssClass="form-control" runat="server" TextMode="Date" />
                  </div>
                  </div>

                  <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Konten">Konten</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtKonten" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                  </div>

                 <div class="form-group row align-items-center">
                <div class="col-md-3">
                 <label class="col-sm-3 col-form-label text-label">Foto</label>
                </div>

                 <div class="col-sm-9">
                 <div class="input-group">
                 <figure class="img-upload-preview">
                     <asp:FileUpload type="file" class="form-control form-control-user" ID="uploadfile" runat="server" onchange="img();" />
                 </figure>
                </div>
                       <asp:RequiredFieldValidator
                            id="RequiredFieldValidator17"
                            ControlToValidate="uploadfile"
                            Text="(Required)"
                            ValidationGroup="frmAdd"
                            Runat="server" />
                                               
                     </div>
               </div>

                <div class="form-group row align-items-center">
                <label class="col-sm-3 col-form-label text-label"></label>
                <div class="col-sm-9">
                <div class="input-group">
                <asp:Image ID="foto" runat="server" style="height:200px;" />
                </div>
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

   <!--SECTION VIEW-->
     <section class="content" id="secView" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Info Kesehatan</h3>
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
                
                <asp:GridView ID="gridInfo" runat="server" CssClass="table table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDInfo" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" PagerStyle-CssClass="pagination" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridInfo_PageIndexChanging"
                    OnRowCommand="gridInfo_RowCommand" OnSorting="gridInfo_Sorting" OnSelectedIndexChanged="gridInfo_SelectedIndexChanged"
                    OnRowDeleting="gridInfo_RowDeleting" OnRowDataBound="gridInfo_RowDataBound" >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign ="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Judul" HeaderStyle-CssClass="table-bordered"  HeaderText="Judul"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Judul">                      
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Kategori" HeaderText="Kategori" HeaderStyle-CssClass="table-bordered"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Kategori" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Konten"  HeaderText="Konten" HeaderStyle-CssClass="table-bordered"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Konten" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="30%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="waktuPost" HeaderText="waktuPost" HeaderStyle-CssClass="table-bordered" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="waktuPost">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="createBy" ItemStyle-CssClass="hiddencol" HeaderText="Creby" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="createDate" ItemStyle-CssClass="hiddencol" HeaderText="createDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedBy" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedBy" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ModifiedDate" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="status" ItemStyle-CssClass="hiddencol" HeaderText="ModifiedDate" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                         <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" HeaderStyle-CssClass="table-bordered" DataImageUrlField ="foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" >
                        <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:ImageField>
                        <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="table-bordered" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon">Edit</span>
                                </asp:LinkButton>
                                
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkDelete"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span></asp:LinkButton>
                                
                                
                                 <asp:LinkButton runat="server" ID="linkAktif" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="linkAktif"><span class="far fa-check-circle" onclick="return confirm('Are you sure you want to delete this item?');">Aktif</span></asp:LinkButton>
                                
                                <asp:LinkButton ID="lnkViewDetails" runat="server" CommandArgument='<%# Eval("IDInfo")%>' 
                                OnClick="lnkViewDetails_Click" Text="Detail" style="margin-left:20px"  CssClass="far fa-check-square"/>
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

        <br /><br />
        <asp:label style="margin-left:20px;" runat="server" class="col-sm-3 col-form-label text-label" Font-bold="true">DETAIL</asp:label>
        <br /><br />
        
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Nama</asp:label>
        <asp:Label ID="Judul" runat="server" Text="Judul"></asp:Label>
        <br /><br />
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Created By</asp:label>
        <asp:Label ID="CreateBy" runat="server" Text="CreateBy"></asp:Label>
        <br /><br />
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Created date</asp:Label>
        <asp:Label ID="CreateDate" runat="server" Text="Create Date"></asp:Label>
        <br /><br />
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Modified By</asp:Label>
        <asp:Label ID="ModifiedBy" runat="server" Text="modiby"></asp:Label>
        <br /><br />
        <asp:label style="margin-left:20px" runat="server" class="col-sm-3 col-form-label text-label">Modified date</asp:Label>
        <asp:Label ID="ModifiedDate" runat="server" Text="modidate"></asp:Label>

        <br /><br /><br />
        <asp:Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:25px" ID="btnclose" runat="server" Text="Kembali" OnClick="btnclose_Click" />
    </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>

  <!--SECTION EDIT-->
     <section class="content" id="secEdit" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Edit Info Kesehatan</h3>
              </div>
                
                <div class="card-body">
                    <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                <div class="card-body">
                  <div class="row form-group">
                    <div class="col-md-3">
                    <label for="Judul">Judul</label>
                    </div>
                    <div class="col-md-5">
                    <asp:TextBox ID="txtJudulE" CssClass="form-control" runat="server"/>
                  </div>
                </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="kategori">Kategori</label>
                    </div>
                    <div class="col-md-5">
                   <asp:DropDownList ID="ddlKatE" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="Ibu dan Anak">Ibu dan Anak</asp:ListItem>
                        <asp:ListItem Value="Sehari hari">Sehari hari</asp:ListItem>
                        <asp:ListItem Value="Olahraga">Olahraga</asp:ListItem>
                       <asp:ListItem Value="Penyakit">Penyakit</asp:ListItem>
                       
                    </asp:DropDownList>
                    </div>
                    </div>

                  <div class="row form-group">
                    <div class="col-md-3">
                   <label for="Konten">Konten</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtJontenE" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>
                </div>

                 <div class="row form-group">
                 <div class="col-md-3">
                   <label for="waktuPost">Waktu Post</label>
                 </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtWaktuE" CssClass="form-control" runat="server" TextMode="Date" />
                  </div>
                  </div>

                 <div class="form-group row align-items-center">
                <div class="col-md-3">
                 <label class="col-sm-3 col-form-label text-label">Foto</label>
                </div>
                 <div class="col-sm-9">
                 <div class="input-group">
                 <figure class="img-upload-preview">
                     <asp:FileUpload type="file" class="form-control form-control-user" ID="editUploadFile" runat="server" onchange="img();" />
                 </figure>
                </div>
                       <asp:RequiredFieldValidator
                            id="RequiredFieldValidator1"
                            ControlToValidate="editUploadFile"
                            Text="(Required)"
                            ValidationGroup="frmAdd"
                            Runat="server" />
               </div>
               </div>

                <div class="form-group row align-items-center">
                <label class="col-sm-3 col-form-label text-label"></label>
                <div class="col-sm-9">
                <div class="input-group">
                <asp:Image ID="EditFoto" runat="server" style="height:200px;" />
                </div>
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
          </div>
        </section>

    <script>
        function img() {
            var url = inputToURL(document.getElementById("<%=uploadfile.ClientID%>"));
            document.getElementById("<%=foto.ClientID%>").src = url;
        }
        function inputToURL(inputElement) {
            var file = inputElement.files[0];
            return window.URL.createObjectURL(file);
        }

    </script>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

