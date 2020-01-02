<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterKaryawan.master" AutoEventWireup="true" CodeFile="penjualan.aspx.cs" Inherits="Karyawan_penjualan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
      <h1>Data Penjualan</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
      Penjualan
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
    <!-- Content Wrapper. Contains page content -->
  <!-- Content Header (Page header) -->
 
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-12">
    <div class="card card-primary">
      <div class="card-header">
        <h3 class="card-title ">Tambah Data Penjualan</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
		<div class="row form-group">
		<div class="col-sm-12">
		<label>Resep Dokter</label>
        </div>
         <div class="col-md-5">
                    <asp:RadioButtonList ID="rbResep" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbResep_SelectedIndexChanged">
                     <asp:ListItem Value="1" selected="true">Ada</asp:ListItem>
                    <asp:ListItem Value="0">Tidak Ada</asp:ListItem>
                    </asp:RadioButtonList>
         </div>
		</div>

		<div id="EditFotoView" runat="server"> 
            <div class="col-sm-9">
            <div class="input-group">
            <figure class="img-upload-preview">
            <asp:FileUpload type="file" class="form-control form-control-user" ID="editUploadFile" runat="server" onchange="imgEdit();" />
             </figure>
              </div>
        <asp:RequiredFieldValidator
                id="RequiredFieldValidator18"
                ControlToValidate="editUploadFile"
                Text="(Required)"
                ValidationGroup="frmEdit"
                Runat="server" />
        </div>
        </div>
        <button type="submit" name="submit" class="btn btn-primary">Proses</button>
        </div>
      </div>
    </div>
</div>
</section>

<section id="intro" class="intro">
    <div class="col-lg-12">
    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Obat</h3>
                   <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                <div class="row form-group">
                    <div class="col-md-8">
                    <asp:TextBox Width="350%" id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    </div>
                     <div class="col-md-3">
                      <asp:LinkButton BackColor="SkyBlue" CssClass="col-lg-8" runat="server" ID="btnSearch" OnClick="btnSearch_Click">
                          <span class="fa fa-search"></span></i></asp:LinkButton>
                  </div>
                  </div>
                </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
                <asp:GridView ID="gridObat" runat="server"
                     CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="false"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting" OnSelectedIndexChanged="gridObat_SelectedIndexChanged"
                   OnRowDataBound="gridObat_RowDataBound" OnRowDeleting="gridObat_RowDeleting"
                    >
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="namaObat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labNama" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="IDJenis" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labIDJenis" runat="server" Text='<%#Bind("IDJenis") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="JumlahObat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labJumlahObat" runat="server" Text='<%#Bind("JumlahObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        
                         <asp:TemplateField HeaderText="Keterangan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labKet" runat="server" Text='<%#Bind("Keterangan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah Beli" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                 <asp:TextBox ID="jumlahBeli" runat="server" AutoPostBack="true"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labSat" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>  

                            <asp:TemplateField HeaderText="Tambahkan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="small" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

               <asp:Button ID="keranjang" runat="server" CssClass="btn btn-primary" Text="Tambahkan ke keranjang" OnClick="keranjang_Click"/>             
                </div>

                </div>
              </div>
            </div>
          </div>
         </div>
        </div>
        </section>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

