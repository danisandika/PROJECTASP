<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Cust.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Karyawan_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Apotek Mustika Farma</title>

  <!-- css -->
  <link href="Medicio/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="Medicio/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="plugins/cubeportfolio/css/cubeportfolio.min.css">
  <link href="Medicio/css/nivo-lightbox.css" rel="stylesheet')?>">
  <link href="Medicio/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css">
  <link href="Medicio/css/owl.carousel.css" rel="stylesheet" media="screen">
  <link href="Medicio/css/owl.theme.css" rel="stylesheet" media="screen">
  <link href="Medicio/css/animate.css" rel="stylesheet">
  <link href="Medicio/css/style.css" rel="stylesheet">

  <!-- boxed bg -->
  <link id="bodybg" href="Medicio/bodybg/bg1.css" rel="stylesheet" type="text/css">
  <!-- template skin -->
  <link id="t-colors" href="Medicio/color/default.css" rel="stylesheet">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainMenu" Runat="Server">
   <style type="text/css">
        .hiddencol
        {
        display:none;
        } 
    </style>

    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
          <ul class="nav navbar-nav">
            <li><a href="Default.aspx">Home</a></li>
            <li class="active" ><a href="Booking.aspx">Booking Dokter</a></li>
            <li><a href="Riwayat.aspx">Riwayat</a></li>
			 <a href="../Login.aspx" class="btn btn-skin btn-lg">Logout</a>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Section1" Runat="Server">
 
<section id="secView" runat="server" class="home-section paddingbot-60">
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
 
    <div class="container marginbot-50">
     <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="col-lg-6">
              <div class="form-wrapper">
                <div class="wow fadeInRight" data-wow-duration="2s" data-wow-delay="0.2s">

                  <div class="panel panel-skin">
                    <div class="panel-heading">
                      <h3 class="panel-title"><span class="fa fa-pencil-square-o"></span> Make an appoinment</h3>
                    </div>
                    <div class="panel-body">
                      <div id="sendmessage">Your message has been sent. Thank you!</div>
                      <div id="errormessage"></div>

                        <div class="row">
                          <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                              <label>ID Booking</label>
                                <asp:TextBox ID="txtBooking" runat="server" class="form-control input-md" ReadOnly="true"></asp:TextBox>
                                <div class="validation"></div>
                            </div>
                          </div>


                          <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                                <label>Tanggal Booking</label>
                                <asp:TextBox ID="txtTanggal" runat="server" class="form-control input-md" TextMode="DateTimeLocal"></asp:TextBox>
                                
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="txtTanggal"
                                ForeColor="Red"
                                ValidationGroup="date"
                                ErrorMessage="Data harus diisi"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                        </div>


                        <div class="row">
                          <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                              <label>Jenis Dokter</label>
                                 <asp:DropDownList ID="ddlJenisE" runat="server" CssClass="form-control" DataSourceID="dsJenisE" DataTextField="nama_Jenis" DataValueField="ID_SP" OnTextChanged="ddlJenisE_TextChanged" AutoPostBack="true"></asp:DropDownList>
                                 <asp:SqlDataSource ID="dsJenisE" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="select ID_SP,nama_Jenis from jenis_Dokter where [status] =1"></asp:SqlDataSource>
                            </div>
                          </div>

                          <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                              <label>Dokter</label>
                                <asp:DropDownList ID="ddlDokter" runat="server" CssClass="form-control" DataTextField="nama" DataValueField="ID_Dokter" >
                                  </asp:DropDownList>
                                   <asp:SqlDataSource ID="dsDokter" runat="server" ConnectionString="<%$ ConnectionStrings:Default %>" SelectCommand="sp_pilihDokter" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>
                                                            
                            </div>
                          </div>
                    
                         <div class="col-xs-12 col-sm-12 col-md-12">
                                 <div class="form-group">
                                 <label>Deskripsi</label>
                                <asp:TextBox ID="txtDeskripsi" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>           
                                </div>
                        </div>
                         </div>

                    
                     <asp:Button ID="booking" class="btn btn-skin btn-block btn-lg" runat="server" Text="Submit" OnClick="booking_Click" />
                    </div>

                  </div>

                </div>
              </div>
            </div>
            </div>
            <div class="col-lg-6">
              <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                <img src="Medicio/img/dummy/img-3.png" class="img-responsive" alt="" />
              </div>
            </div>  
        </div>  
         
          
        </div>
    </div>

 <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="callaction bg-gray">
              <div class="row">
                <div class="col-md-8">
                  <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <div class="cta-text">
                      <h3>Informasi Booking</h3>
                    </div>
                  </div>
                </div>
               
              </div>
            </div>
          </div>
        </div>
      </div>


      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-md-6">
            <div class="wow fadeInUp" data-wow-delay="0.2s">
              <img src="Medicio/img/dummy/img-1.jpg" class="img-responsive" alt=""/>
            </div>
          </div>
          <div class="col-sm-3 col-md-3">
            <div class="wow fadeInRight" data-wow-delay="0.1s">
                    <asp:GridView ID="gridBooking" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AllowPaging="true" 
                    AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IDBooking" EmptyDataText="Tidak Ada Data" 
                    PageSize="5" ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridBooking_PageIndexChanging"
                    OnRowCommand="gridBooking_RowCommand" OnSorting="gridBooking_Sorting" OnSelectedIndexChanged="gridBooking_SelectedIndexChanged"
                    OnRowDeleting="gridBooking_RowDeleting" OnRowDataBound="gridBooking_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                    <Columns>
                        <asp:TemplateField HeaderText="No"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />    
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="1%" CssClass="table table-bordered table-striped" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDBooking" HeaderStyle-CssClass="table-hover" HeaderText="ID Booking"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="nama_jenis" >
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />    
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateBooking"  HeaderStyle-CssClass="table-hover" HeaderText="Waktu Booking"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />                              
                             <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deskripsi"  HeaderStyle-CssClass="table-hover" HeaderText="Deskripsi"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />                              
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nama"  HeaderStyle-CssClass="table-hover" HeaderText="Nama"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />                              
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nama_jenis"  HeaderStyle-CssClass="table-hover" HeaderText="Spesialis"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />                              
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="namaDokter"  HeaderStyle-CssClass="table-hover" HeaderText="Nama Dokter"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="deskripsi" >
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />                              
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="60%"  CssClass="table table-bordered table-striped" />
                        </asp:BoundField>
                        <asp:BoundField DataField="statusBooking" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="ID_Dokter" ItemStyle-CssClass="hiddencol" HeaderText="Status" HeaderStyle-CssClass="hiddencol"  NullDisplayText="-" ItemStyle-HorizontalAlign="Left"/>

                        <asp:TemplateField HeaderText="Aksi"  HeaderStyle-CssClass="table-bordered" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="#03cffc" Font-Bold="True" ForeColor="Black" />                              
                            <ItemStyle Font-Size="Medium" VerticalAlign="Middle" Width="20%"  CssClass="table table-bordered table-striped" />
                            <ItemTemplate>                             
                                  <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                ToolTip="Batal" class="fa fa-remove"><span onclick="return confirm('Apa kamu yakin untuk me-non aktifkan akun ini?');"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
              </div>
        </div>

        </div>
      </div>
</body>
</section>
    <!-- /Section: services -->



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Section2" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Section3" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Section4" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Section5" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Section6" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="section7" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

