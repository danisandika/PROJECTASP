<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterDokter.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Karyawan_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
    .hiddencol
    {
    display:none;
    } 
    </style>
       <!--SECTION VIEW-->
     <section class="content" id="secViewRiwayat" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Riwayat</h3>
                  <br />
                <asp:linkbutton CssClass="btn btn-block bg-gradient-primary col-2" runat="server" ID="btntambahRiwayat" OnClick="btntambahRiwayat_Click"><i class="fas fa-plus"></i> | Tambah</asp:linkbutton>
                  <div class="card-tools">
                </div>
              </div>
                
            </div>
        </div>
    </div>
    </div>
        
</section>

     <!--SECTION ADD Riwayat-->
     <section class="content" id="secAddRiwayat" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Data Pemeriksaan</h3>
              </div>
                <asp:Label ID="lblIDqu" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="labelIDUSer" runat="server" Text="Label" Visible="false"></asp:Label>
                <div class="card-body">
                    
                <div class="row form-group">
                 <div class="col-md-3">
                  <label for="pasien">Nama Pasien</label><span style="color:red">(*)</span>
                </div>
                 <div class="col-md-5">
                     <asp:Label ID="lblIDPasien" runat="server" Text="" readonly="false"></asp:Label>
                 </div>
                </div>

                  <div class="row form-group">
                     <div class="col-md-3">
                    <label for="Obat">Penyakit</label> <span style="color:red">(*)</span>
                    </div>
                     <div class="col-md-5">
                    <asp:TextBox ID="txtPenyakit" CssClass="form-control" runat="server" TextMode="MultiLine"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="txtPenyakit"
                        ForeColor="Red"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                    <div class="col-md-3">
                     <label for="Ket">Berat Badan (Kg) </label> <span style="color:red">(*)</span>
                    </div>
                 <div class="col-md-5">
                   <asp:TextBox ID="txtBerat" CssClass="form-control" runat="server" TextMode="Number"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtBerat"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Harus diisi"></asp:RequiredFieldValidator>
                  </div> 
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Tinggi Badan (cm)</label> <span style="color:red">(*)</span>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtTinggi" CssClass="form-control" runat="server" TextMode="Number" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtTinggi"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Tensi(SYS/DIA)</label> <span style="color:red">(*)</span>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtTensi" CssClass="form-control" runat="server" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server"
                        ControlToValidate="txtTensi"
                        ForeColor="Red"
                        ValidationGroup="numb"
                        ErrorMessage="Data Harus diisi dengan Angk"></asp:RequiredFieldValidator>
                  </div>
                </div>


                  <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Pesan</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtPesan" CssClass="form-control" runat="server" TextMode="MultiLine" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                        runat="server"
                        ControlToValidate="txtPesan"
                        ForeColor="Red"
                        ErrorMessage="Data Harus diisi dengan Angka"></asp:RequiredFieldValidator>
                  </div>
                </div>

                <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Gula Darah(mg/dL)</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtGula" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>
                </div>


                <div class="row form-group">
                   <div class="col-md-3">
                   <label for="Ket">Kolestrol(mg/dL)</label>
                    </div>
                    <div class="col-md-5">
                   <asp:TextBox ID="txtKolestrol" CssClass="form-control" runat="server" TextMode="Number" />
                  </div>
                </div>
        <div class="row">
            <asp:Button ID="btnSaveRiwayat" CssClass="btn btn-primary" runat="server" Text="Tambahkan" OnClick="btnSaveRiwayat_Click"/>
        </div>
            </div>                                           
            </div>

            </div> 
                <!-- /.card-body -->
                <div class="card-footer">
                </div>    
            </div>
              </div>
        </section>


<!--SECTION VIEW Bookinng-->
     <section class="content" id="secBooking" runat="server">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Pembookingan</h3>
                  <br />

                <div class="input-group-append">
                    <asp:TextBox id="txtSearchBooking" CssClass="form-control float-right" runat="server" Width="20%"/>                    
                      <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click1"><i class="fas fa-search"></i></asp:LinkButton>
                    </div>
                  </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                 <asp:TextBox ID="idUserBooking" runat="server" style="display:none;"/>                 
                <asp:GridView ID="gridBooking" runat="server" CssClass="table table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDBooking" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridBooking_PageIndexChanging"
                    OnRowCommand="gridBooking_RowCommand" OnSorting="gridBooking_Sorting" OnSelectedIndexChanged="gridBooking_SelectedIndexChanged"
                    OnRowDeleting="gridBooking_RowDeleting" OnRowDataBound="gridBooking_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                                       <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="1%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDBooking"  HeaderStyle-CssClass="table-bordered" HeaderText="ID Booking"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaJenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateBooking"  HeaderStyle-CssClass="table-bordered" HeaderText="Tanggal Booking"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="dateBooking" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="statusBooking" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />         
                         <asp:BoundField DataField="nama_jenis"  HeaderStyle-CssClass="table-bordered" HeaderText="Jenis Dokter"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="nama_jenis" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                         <asp:BoundField DataField="NamaU"  HeaderStyle-CssClass="table-bordered" HeaderText="Nama Customer"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NamaU" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="IDUser" ItemStyle-CssClass="hiddencol" HeaderText="Username" HeaderStyle-CssClass="hiddencol" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="username" />
                        <asp:BoundField DataField="ID_Dokter" ItemStyle-CssClass="hiddencol" HeaderText="Password" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="password" />
                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Selesai Pemeriksaan"><span class="far fa-trash-alt nav-icon" onclick="return confirm('Apa kamu yakin menyelesaikan pemeriksaan?');"></span></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="linkBooking" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Periksa"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>

                                
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
              
                   </div>
                </div>          
              </div>
        </section>

<section id="secObat" class="intro" runat="server">
    <div class="col-lg-12">
    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Table Obat</h3>
                <asp:Label ID="lblKaryawan" runat="server" Visible="false" Text=""></asp:Label>

                   <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                <div class="row form-group">
                    <div class="col-md-8">
                    <asp:TextBox Width="350%" id="txtSearch" CssClass="form-control float-right" runat="server"/>
                    </div>
                     <div class="col-md-3">
                      <asp:LinkButton BackColor="SkyBlue" CssClass="col-lg-8" runat="server" ID="cariObat" OnClick="cariObat_Click">
                          <span class="fa fa-search"></span></asp:LinkButton>
                  </div>
                  </div>
                </div>
                </div>
              </div>
                <div class="card-body table-responsive p-0 col-12">
                
              <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>

                <asp:GridView ID="gridObat" runat="server"
                     CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true"
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDObat" EmptyDataText="Tidak Ada Data" 
                    PageSize="5"  ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridObat_PageIndexChanging"
                    OnRowCommand="gridObat_RowCommand" OnSorting="gridObat_Sorting" OnSelectedIndexChanged="gridObat_SelectedIndexChanged"
                   OnRowDataBound="gridObat_RowDataBound" OnRowDeleting="gridObat_RowDeleting" >
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:BoundField DataField="namaObat" HeaderStyle-CssClass="table-bordered"  HeaderText="Nama Obat"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Keterangan" ItemStyle-CssClass="hiddencol" HeaderText="" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:BoundField DataField="Harga" ItemStyle-CssClass="hiddencol" HeaderText="" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:BoundField DataField="HargaBarang" DataFormatString="Rp {0:###,###,###}" HeaderStyle-CssClass="table-bordered"  HeaderText="Harga"  NullDisplayText="-" ItemStyle-HorizontalAlign="Right" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Jumlah Beli" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                 <asp:TextBox ID="jumlahBeli" TextMode="Number" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField> 

                         <asp:BoundField DataField="Satuan" HeaderStyle-CssClass="table-bordered"  HeaderText="Satuan"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Harga" >
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>

                        <asp:BoundField DataField="IDObat" ItemStyle-CssClass="hiddencol" HeaderText="" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                            <asp:TemplateField HeaderText="Tambahkan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="small" VerticalAlign="Middle" Width="2%"  CssClass="table table-bordered table-striped" />
                             <ItemTemplate>
                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="cmEdit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    ToolTip="Tambahkan"><span class="far fa-edit nav-icon"></span>
                                </asp:LinkButton>                                
                            </ItemTemplate>
                        </asp:TemplateField>
                            
                    </Columns>
                </asp:GridView>
               <div class="form-group">
<%--               <asp:Button ID="keranjang" runat="server" CssClass="btn btn-primary" Text="Tambahkan ke keranjang" OnClick="keranjang_Click"/>             --%>
               </div>
                    </div>

                </div>
              </div>
            </div>
          </div>
         </div>
        </div>
        </section>

<section class="content" id="secKeranjang" runat="server">
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
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="25%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="namaObat" runat="server" Text='<%#Bind("namaObat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                  
                        <asp:TemplateField HeaderText="Satuan" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="10%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="Satuan" runat="server" Text='<%#Bind("Satuan") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Jumlah" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="15%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="jumlah" runat="server" Text='<%#Eval("jumlah") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Harga Total" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="25%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <asp:Label ID="harga" runat="server" Text='<%#Eval("harga") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
   
                         <asp:TemplateField HeaderText="ID Obat" HeaderStyle-CssClass="table-bordered"  ItemStyle-HorizontalAlign="Left" >
                            <ItemTemplate>
                                <asp:Label ID="IDObat" runat="server" Text='<%#Eval("IDObat") %>'></asp:Label>
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
       </div>                
 </div>

</section>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

