<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage_Admin.master" AutoEventWireup="true" CodeFile="infokesehatan.aspx.cs" Inherits="Administrator_infokesehatan" %>

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
                  <div class="form-group">
                    <label for="Judul">Judul</label>
                    <asp:TextBox ID="txtJudul" CssClass="form-control" runat="server"/>
                  </div>

                  <div class="form-group">
                   <label for="kategori">Kategori</label>
                   <asp:DropDownList ID="ddlKategori" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="Ibu dan Anak">Ibu dan Anak</asp:ListItem>
                        <asp:ListItem Value="Sehari hari">Sehari hari</asp:ListItem>
                        <asp:ListItem Value="Olahraga">Olahraga</asp:ListItem>
                       <asp:ListItem Value="Penyakit">Penyakit</asp:ListItem>
                       
                    </asp:DropDownList>

                   <div class="form-group">
                   <label for="waktuPost">Waktu Post</label>
                   <asp:TextBox ID="txtWaktuPost" CssClass="form-control" runat="server" TextMode="Date" />
                  </div>

                  <div class="form-group">
                   <label for="Konten">Konten</label>
                   <asp:TextBox ID="txtKonten" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>

                 <div class="form-group row align-items-center">
                 <label class="col-sm-3 col-form-label text-label">Foto</label>
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
                    OnRowCommand="gridInfo_RowCommand" OnSorting="gridInfo_Sorting" OnSelectedIndexChanged="gridInfo_SelectedIndexChanged" >
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Judul" HeaderText="Judul"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Judul" />                      
                         <asp:BoundField DataField="Kategori" HeaderText="Kategori"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Kategori" />
                        <asp:BoundField DataField="Konten" HeaderText="Konten"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Konten" />
                        <asp:BoundField DataField="waktuPost" HeaderText="waktuPost"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="waktuPost" />
                        <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" DataImageUrlField ="foto" HeaderText="Foto"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" ></asp:ImageField>
                        
                        <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Edit Data"><span class="far fa-edit nav-icon">Edit</span>
                                </asp:LinkButton>
                                |
                                <asp:LinkButton runat="server" ID="linkDelete" CommandName="cmDelete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Delete Data"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Are you sure you want to delete this item?');">Delete</span>
                                </asp:LinkButton>
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
                  <div class="form-group">
                    <label for="Judul">Judul</label>
                    <asp:TextBox ID="txtJudulE" CssClass="form-control" runat="server"/>
                  </div>

                  <div class="form-group">
                   <label for="kategori">Kategori</label>
                   <asp:DropDownList ID="ddlKatE" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="Ibu dan Anak">Ibu dan Anak</asp:ListItem>
                        <asp:ListItem Value="Sehari hari">Sehari hari</asp:ListItem>
                        <asp:ListItem Value="Olahraga">Olahraga</asp:ListItem>
                       <asp:ListItem Value="Penyakit">Penyakit</asp:ListItem>
                       
                    </asp:DropDownList>

                  <div class="form-group">
                   <label for="Konten">Konten</label>
                   <asp:TextBox ID="txtJontenE" CssClass="form-control" runat="server" TextMode="MultiLine" />
                  </div>

                 <div class="form-group">
                   <label for="waktuPost">Waktu Post</label>
                   <asp:TextBox ID="txtWaktuE" CssClass="form-control" runat="server" TextMode="Date" />
                  </div>

                 <div class="form-group row align-items-center">
                 <label class="col-sm-3 col-form-label text-label">Foto</label>
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

