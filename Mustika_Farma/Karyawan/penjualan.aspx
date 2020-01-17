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

<section class="content" id="resepDokter" runat="server" >
          
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
                          <span class="fa fa-search"></span></asp:LinkButton>
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

                         <asp:TemplateField HeaderText="Keterangan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labKet" runat="server" Text='<%#Bind("Keterangan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                      <asp:TemplateField HeaderText="Harga" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="harga" runat="server" Text='<%#Bind("Harga") %>' DataFormatString="Rp {0:###,###,###}"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 


                         <asp:BoundField DataField="HargaBarang" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Jumlah Beli" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                 <asp:TextBox ID="jumlahBeli" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labSat" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>  

                        <asp:TemplateField HeaderText="ID Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labIDObat" runat="server" Text='<%#Bind("IDObat") %>' Visible="false"></asp:Label>
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
               <div class="form-group">
               <asp:Button ID="keranjang" runat="server" CssClass="btn btn-primary" Text="Tambahkan ke keranjang" OnClick="keranjang_Click"/>             
               </div>
                    </div>

                </div>
              </div>
            </div>
          </div>
         </div>
        </div>
        </section>

<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <div class="card-primary">
              <div class="card-header">
                <h3 class="card-title">Keranjang</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <asp:GridView ID="grdKeranjang" AutoGenerateColumns="false" runat="server" CssClass="table table-striped table-bordered table-hover">
                    <Columns> 
                         <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Nama Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labNama" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                  
                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labSat" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labJumlah" runat="server" Text='<%#Eval("jumlahBeli") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Harga Total" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="5%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="labHarga" runat="server" Text='<%#Eval("harga") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
   
                         <asp:TemplateField HeaderText="ID Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left" >
                            <ItemTemplate>
                                <asp:Label ID="labIDObat" runat="server" Text='<%#Eval("IDObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                           
                   </Columns>
                </asp:GridView>

               <asp:Label ID="lblJumlahPembelian" runat="server" Text='<%#Eval("valuefinal") %>'></asp:Label>
              <asp:Label ID="lblTotalHarga" runat="server" Text='<%#Eval("valuefinal") %>' Visible="false"></asp:Label>


              </div>
              <div class="card-footer clearfix">
                    <div class="form-group">
                <asp:Button ID="btnProses" runat="server" CssClass="btn btn-primary" Text="Proses" OnClick="btnProses_Click"/>                     
                </div>
             </div>
            </div>
          </div>
    <div class="col-md-4">
            <div class="card-primary">
              <div class="card-header">
                <h3 class="card-title">Transaksi Pembelian</h3>
                </div>
                <div class="card-tools">
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

		 <div class="form-group row align-items-center">
                    <div class="form-group row align-items-center">
                    <div class="col-md-12">
                     <label class="col-sm-3 col-form-label text-label" id="lblFoto" runat="server">Foto</label>
                     </div>
                     <div class="col-sm-12">
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
       <%-- function imgEdit() {
            var url = inputToURL(document.getElementById("<%=editUploadFile.ClientID%>"));
            document.getElementById("<%=editfoto.ClientID%>").src = url;--%>
        //}
        function inputToURL(inputElement) {
            var file = inputElement.files[0];
            return window.URL.createObjectURL(file);
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
 

