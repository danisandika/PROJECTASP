<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterManager.master" AutoEventWireup="true" CodeFile="Laporan_Beli.aspx.cs" Inherits="Manager_Laporan_Beli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    Laporan
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sub_Title" Runat="Server">
   <h1 class="m-0 text-dark">Laporan Pembelian</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title2" Runat="Server">
    Laporan
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Content" Runat="Server">
     <section class="content">
        <div class="row">
          <div class="col-md-12">
             <div class="card-blue">
              <div class="card-header">
                <h3 class="card-title">PRESENTASE JUMLAH PEMBELIAN OBAT 2020</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
            <center/>
            <div class="col-lg-5">
              <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                <canvas id="myChart" style="height: 230px; min-height: 230px; display: block; width: 265px;" width="212" height="184" class="chartjs-render-monitor"></canvas>
              </div>
              <!-- /.card-body -->
            </div></div>
        </div>
         </div>
            </section>
    <script src="../AdminLTE/dist/js/Chart.js"></script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="footer" Runat="Server">
     <script>
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: <%=this.jsonNama%>,
        datasets: [{
            label: '# of Votes',
            data: <%=this.jsonJumlah%>,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
</asp:Content>

