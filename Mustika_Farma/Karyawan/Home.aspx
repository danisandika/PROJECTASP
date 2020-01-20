<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterDokter.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Karyawan_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Mustika Farma | Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
    <h1>Dashboard</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
      Dashboard
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
      <!-- Small boxes (Stat box) -->
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">
                  <i class="fas fa-chart-pie mr-1"></i>
                  Jumlah Pasien
                </h3>
                <ul class="nav nav-pills ml-auto p-2">
                  <li class="nav-item">
                    <asp:RadioButtonList ID="rblChartType" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                        <asp:ListItem Text="Bar" Value="7" Selected="True" />
                        <asp:ListItem Text="Column" Value="10" />
                    </asp:RadioButtonList>
                  </li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart"
                       style="position: relative; height: 300px;">
                         <asp:Chart ID="Chart1" runat="server" Height="300px" Width="400px" Visible="false">
                              <Titles>
                                <asp:Title ShadowOffset="3" Name="Items" />
                            </Titles>
                             <Series>
                                <asp:Series Name="Penjualan" />
                            </Series>
                             <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                            </ChartAreas>
                              <Legends>
                                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                    LegendStyle="Row" />
                            </Legends>
                         </asp:Chart>  

                      </div>
                   </div>
                </div>
              </div><!-- /.card-body -->
         
          </section>
              <div class="col-md-4">
            <!-- Info Boxes Style 2 -->
            <div class="info-box mb-3 bg-warning">
              <span class="info-box-icon"><i class="fas fa-tag"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Jumlah Pasien</span>
                  <span class="info-box-number"> <asp:Label ID="lblPendapatan" runat="server" Text=""></asp:Label></span>
             
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3 bg-success">
              <span class="info-box-icon"><i class="far fa-heart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Jumlah Antrean</span>
                  <span class="info-box-number"> <asp:Label ID="lbFav" runat="server" Text=""></asp:Label></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3 bg-danger">
              <span class="info-box-icon"><i class="fas fa-cloud-download-alt"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Pasien Tersering</span>
                  <span class="info-box-number"> <asp:Label ID="lblJumlah" runat="server" Text=""></asp:Label></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3 bg-info">
              <span class="info-box-icon"><i class="far fa-comment"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Direct Messages Apotek</span>
                <span class="info-box-number">MustikaFarma@gmail.com</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            </div>

       </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

