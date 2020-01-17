<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Customer_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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

  <!-- =======================================================
    Theme Name: Medicio
    Theme URL: https://bootstrapmade.com/medicio-free-bootstrap-theme/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">


  <div id="wrapper">

    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
      <div class="top-area">
      
      </div>
      <div class="container navigation">

        <div class="navbar-header page-scroll">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
          <a class="navbar-brand" href="index.html">
                    <img src="Medicio/img/logo1.png" alt="" width="150" height="60"/>
                </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
          <ul class="nav navbar-nav">
             <li class="active"><a href="Default.aspx">Home</a></li>
            <%--<li><a href="#service">Transaksi Penjualan</a></li>--%>
            <li><a href="Booking.aspx">Booking Dokter</a></li>
            <li><a href="Riwayat.aspx">Riwayat</a></li>
            <%--<li><a href="#pricing">Antrian</a></li>--%>
			  <a href="../Login.aspx" class="btn btn-skin btn-lg">Logout</a>
          
            
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container -->
    </nav>

    <!-- Section: intro -->
    <section id="intro" class="intro">
      <div class="intro-content">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="wow fadeInDown" data-wow-offset="0" data-wow-delay="0.1s">
                <h2 class="h-ultra">Mustika Farma Group</h2>
              </div>
              <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
                <h4 class="h-light">Provide best quality healthcare for you</h4>
              </div>
              <div class="well well-trans">
                <div class="wow fadeInRight" data-wow-delay="0.1s">

                  <ul class="lead-list">
                    <li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>The best Price</strong><br />Enjoy the prices of the most competitive drugs products</span></li>
                    <li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Complete Products </strong><br />Discover the most complete health products</span></li>
                    <li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Available at any time </strong><br />Need help? GoApotik customers are ready to serve</span></li>
                  </ul>                
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                <img src="Medicio/img/dummy/img-1.png" class="img-responsive" alt="" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- /Section: intro -->
  <!-- Core JavaScript Files -->
  <script src="Medicio/js/jquery.min.js"></script>
  <script src="Medicio/js/bootstrap.min.js"></script>
  <script src="Medicio/js/jquery.easing.min.js"></script>
  <script src="Medicio/js/wow.min.js"></script>
  <script src="Medicio/js/jquery.scrollTo.js"></script>
  <script src="Medicio/js/jquery.appear.js"></script>
  <script src="Medicio/js/stellar.js"></script>
  <script src="Medicio/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
  <script src="Medicio/js/owl.carousel.min.js"></script>
  <script src="Medicio/js/nivo-lightbox.min.js"></script>
  <script src="Medicio/js/custom.js"></script>

</body>

</html>