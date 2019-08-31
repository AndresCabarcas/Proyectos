<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Appetite</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet">
        <style>

            .map-container{
                overflow:hidden;
                padding-bottom:56.25%;
                position:relative;
                height:0;
            }
            .map-container iframe{
                left:0;
                top:0;
                height:100%;
                width:100%;
                position:absolute;
            }
        </style>
    </head>

    <body class="grey lighten-3">

        <jsp:useBean class="modelo.Consultas" id="RestauranteDao"></jsp:useBean>

            <!--Main Navigation-->
            <header>

                <!-- Navbar -->
                <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
                    <div class="container-fluid">

                        <!-- Brand -->
                        <a class="navbar-brand waves-effect" href="index.jsp" target="_blank">
                            <strong class="red-text">Appetite</strong>
                        </a>

                        <!-- Collapse -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <!-- Links -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <!-- Left -->
                            <ul class="navbar-nav mr-auto">
                            </ul>

                        </div>

                    </div>
                </nav>
                <!-- Navbar -->

                <!-- Sidebar -->
                <div class="sidebar-fixed position-fixed">

                    <a class="waves-effect ">
                        <img src="img/Appetitefix.png" width="230" height="120"  alt="">
                    </a>

                    <div class="list-group list-group-flush">
                        <a href="index.jsp" class="btn btn-danger">
                            <i class="fas fa-user mr-3"></i>Empleados
                            <span class="badge badge-primary badge-pill">14</span>
                        </a>
                        <a href="turnos.jsp" class="list-group-item list-group-item-action waves-effect">
                            <i class="fas fa-table mr-3"></i>Turnos</a>
                        <a href="control.jsp" class="list-group-item list-group-item-action waves-effect">
                            <i class="fas fa-map mr-3"></i>Control Asistencias</a>
                    </div>

                </div>
                <!-- Sidebar -->

            </header>
            <!--Main Navigation-->

            <!--Main layout-->
            <main class="pt-5 mx-lg-5">
                <div class="container-fluid mt-5">

                    <!-- Heading -->
                    <div class="card mb-4 wow fadeIn">

                        <!--Card content-->
                        <div class="card-body d-sm-flex justify-content-between">

                            <h4 class="mb-2 mb-sm-0 pt-1">
                                <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Admin</a>
                                <span>/</span>
                                <span>Empleados</span>
                            </h4>

                            <form class="d-flex justify-content-center">
                                <!-- Default input -->
                                <input type="search" placeholder="Realiza tu busqueda" aria-label="Search" class="form-control">
                                <button class="btn btn-danger btn-sm my-0 p" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </form>

                        </div>

                    </div>
                    <!-- Heading -->

                    <!--Grid row-->
                    <div class="row wow fadeIn">



                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row wow fadeIn">
                        <!--Grid column-->
                        <div class="col-md-12 mb-4">

                            <!--Card-->
                            <div class="card">

                                <!--Card content-->
                                <div class="card-body">

                                    <!-- Table  -->
                                    <table class="table table-hover">
                                        <!-- Table head -->
                                        <thead class="red lighten-4">
                                            <tr>
                                            <tr>
                                                <th>#</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Turno</th>
                                                <th>Accion</th>
                                            </tr>
                                        </thead>
                                        <!-- Table head -->

                                        <!-- Table body -->
                                        <tbody>
                                        <c:forEach items="${RestauranteDao.Listarempleados()}" var="empleado">
                                            <tr>
                                                <th scope="row">${empleado.id}</th>
                                                <td>${empleado.nombre}</td>
                                                <td>${empleado.apellido}</td>
                                                <td>${empleado.turno}</td>
                                                <td><a class="btn btn-danger btn-sm" href="ServletEmpleados?accion=eliminar&id=${grupo.id}">Eliminar</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <!-- Table body -->
                                </table>
                                <!-- Table  -->

                            </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row wow fadeIn">

                    <!--Grid column-->


                    <!--Grid column-->


                </div>
                <!--Grid column-->

                <!--Grid column-->
            </div>
            <!--Grid row-->

            <!--Grid row-->
            <div class="row wow fadeIn">

                <!--Grid column-->
                <div class="col-md-6 mb-4">


                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!--Section: Modals-->
                        <section>

                            <!-- Side Modal Top Right Success-->
                            <div class="modal fade right" id="sideModalTRSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true" data-backdrop="false">
                                <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading lead">Modal Success</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                                    iusto nulla
                                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                                    eius
                                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                                </p>
                                            </div>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer justify-content-center">
                                            <a role="button" class="btn btn-success">Get it now
                                                <i class="far fa-gem ml-1"></i>
                                            </a>
                                            <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                                                thanks</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Side Modal Top Right Success-->

                            <!-- Side Modal Bottom Right Danger-->
                            <div class="modal fade right" id="sideModalBRDangerDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true" data-backdrop="false">
                                <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-danger" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading">Modal Danger</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">

                                            <div class="row">
                                                <div class="col-3">
                                                    <p></p>
                                                    <p class="text-center">
                                                        <i class="fas fa-shopping-cart fa-4x"></i>
                                                    </p>
                                                </div>

                                                <div class="col-9">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga,
                                                        molestiae
                                                        provident temporibus sunt earum.</p>
                                                    <h2>
                                                        <span class="badge">v52gs1</span>
                                                    </h2>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer justify-content-center">
                                            <a role="button" class="btn btn-danger">Get it now
                                                <i class="far fa-gem ml-1"></i>
                                            </a>
                                            <a role="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">No,
                                                thanks</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Side Modal Bottom Right Danger-->


                            <!--Modal Form Login with Avatar Demo-->
                            <div class="modal fade" id="modalLoginAvatarDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
                                    <!--Content-->
                                    <div class="modal-content">

                                        <!--Header-->
                                        <div class="modal-header">
                                            <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg" class="rounded-circle img-responsive"
                                                 alt="Avatar photo">
                                        </div>
                                        <!--Body-->
                                        <div class="modal-body text-center mb-1">

                                            <h5 class="mt-1 mb-2">Maria Doe</h5>

                                            <div class="md-form ml-0 mr-0">
                                                <input type="password"  id="form1" class="form-control ml-0">
                                                <label for="form1" class="ml-0">Enter password</label>
                                            </div>

                                            <div class="text-center mt-4">
                                                <button class="btn btn-cyan">Login
                                                    <i class="fas fa-sign-in-alt ml-1"></i>
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!--Modal Form Login with Avatar Demo-->

                            <!--Modal: Login / Register Form Demo-->
                            <div class="modal fade" id="modalLRFormDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            ...
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal: Login / Register Form Demo-->



                            <!-- Central Modal Fluid Success-->
                            <div class="modal fade" id="centralModalFluidSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-fluid modal-notify modal-success" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading lead">Modal Success</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                                    iusto nulla
                                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                                    eius
                                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                                </p>
                                            </div>
                                            <ul class="list-group z-depth-0">
                                                <li class="list-group-item justify-content-between">
                                                    Cras justo odio
                                                    <span class="badge badge-primary badge-pill">14</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Dapibus ac facilisis in
                                                    <span class="badge badge-primary badge-pill">2</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Morbi leo risus
                                                    <span class="badge badge-primary badge-pill">1</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Cras justo odio
                                                    <span class="badge badge-primary badge-pill">14</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Dapibus ac facilisis in
                                                    <span class="badge badge-primary badge-pill">2</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Morbi leo risus
                                                    <span class="badge badge-primary badge-pill">1</span>
                                                </li>
                                            </ul>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer">
                                            <a role="button" class="btn btn-success">Get it now
                                                <i class="far fa-gem ml-1"></i>
                                            </a>
                                            <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                                                thanks</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Central Modal Fluid Success-->

                            <!-- Full Height Modal Right Success Demo-->
                            <div class="modal fade right" id="fluidModalRightSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true" data-backdrop="false">
                                <div class="modal-dialog modal-full-height modal-right modal-notify modal-success" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading lead">Modal Success</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                                    iusto nulla
                                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                                    eius
                                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                                </p>
                                            </div>
                                            <ul class="list-group z-depth-0">
                                                <li class="list-group-item justify-content-between">
                                                    Cras justo odio
                                                    <span class="badge badge-primary badge-pill">14</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Dapibus ac facilisis in
                                                    <span class="badge badge-primary badge-pill">2</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Morbi leo risus
                                                    <span class="badge badge-primary badge-pill">1</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Cras justo odio
                                                    <span class="badge badge-primary badge-pill">14</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Dapibus ac facilisis in
                                                    <span class="badge badge-primary badge-pill">2</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Morbi leo risus
                                                    <span class="badge badge-primary badge-pill">1</span>
                                                </li>
                                            </ul>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer justify-content-center">
                                            <a role="button" class="btn btn-success">Get it now
                                                <i class="far fa-gem ml-1"></i>
                                            </a>
                                            <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                                                thanks</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Full Height Modal Right Success Demo-->
                            <!-- Full Height Modal Top Warning Demo-->
                            <div class="modal fade top" id="fluidModalTopWarningDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true" data-backdrop="false">
                                <div class="modal-dialog modal-full-height modal-top modal-notify modal-warning" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading lead">Modal Warning</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                            </div>
                                            <ul class="list-group z-depth-0">
                                                <li class="list-group-item justify-content-between">
                                                    Cras justo odio
                                                    <span class="badge badge-primary badge-pill">14</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Dapibus ac facilisis in
                                                    <span class="badge badge-primary badge-pill">2</span>
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Morbi leo risus
                                                    <span class="badge badge-primary badge-pill">1</span>
                                                </li>
                                            </ul>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer">
                                            <a role="button" class="btn btn-warning">Get it now
                                                <i class="far fa-gem ml-1"></i>
                                            </a>
                                            <a role="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">No,
                                                thanks</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Full Height Modal Top Warning Demo-->

                            <!-- Full Height Modal Bottom Danger Demo-->
                            <div class="modal fade bottom" id="fluidModalBottomDangerDemo" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
                                <div class="modal-dialog modal-full-height modal-bottom modal-notify modal-danger" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <form action="ServletEmpleados" method="POST">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading lead">Agregar Empleado Nuevo</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">
                                            
                                            <div class="text-center">
                                                <i class="fas fa-user fa-4x mb-3 animated rotateIn"></i>
                                            </div>
                                            
                                            <ul class="list-group z-depth-0">
                                                
                                                
                                                <li class="list-group-item justify-content-between">
                                                    Nombres <br>
                                                    <input type="text" name="nombres" value="" />
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Apellidos <br>
                                                    <input type="text" name="apellidos" value="" />
                                                </li>
                                                <li class="list-group-item justify-content-between">
                                                    Horarios <br>
                                                    <select name="turnos" id="turnos">
                                                        <option value="0" >--- Seleccione un turno ---</option>
                                                        <c:forEach items="${RestauranteDao.Listarturnos()}" var="turno">
                                                            <option value="${turno.id}">${turno.hora_entrada} - ${turno.hora_salida}</option>
                                                        </c:forEach>
                                                    </select>
                                                </li>
                                            </ul>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer">
                                            <input type="submit" value="Agregar"class="btn btn-danger  waves-effect "/>
                                                
                                            <a role="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">Cerrar</a>
                                        </div>
                                        </form>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Full Height Modal Bottom Danger Demo-->

                        </section>
                        <!--Section: Modals-->



                    </div>
                    <!--/.Card-->

                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->
        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small red  mt-4 wow fadeIn">

            <!--Call to action-->
            <div class="pt-4">
                <a class="btn btn-outline-white" data-toggle="modal" data-target="#fluidModalBottomDangerDemo" 
                   role="button">Agregar Empleado
                    <i class="fas fa-user ml-2"></i>
                </a>
            </div>
            <!--/.Call to action-->
            <br>
            <br><br>

            <!--Copyright-->
            <div class="footer-copyright py-3">
                © 2019 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> MDBootstrap.com </a>
            </div>
            <!--/.Copyright-->

        </footer>
        <!--/.Footer-->

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();

        </script>

        <!-- Charts -->
        <script>
            // Line
            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                    datasets: [{
                            label: '# of Votes',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255,99,132,1)',
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

            //pie
            var ctxP = document.getElementById("pieChart").getContext('2d');
            var myPieChart = new Chart(ctxP, {
                type: 'pie',
                data: {
                    labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
                    datasets: [{
                            data: [300, 50, 100, 40, 120],
                            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
                        }]
                },
                options: {
                    responsive: true,
                    legend: false
                }
            });


            //line
            var ctxL = document.getElementById("lineChart").getContext('2d');
            var myLineChart = new Chart(ctxL, {
                type: 'line',
                data: {
                    labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [{
                            label: "My First dataset",
                            backgroundColor: [
                                'rgba(105, 0, 132, .2)',
                            ],
                            borderColor: [
                                'rgba(200, 99, 132, .7)',
                            ],
                            borderWidth: 2,
                            data: [65, 59, 80, 81, 56, 55, 40]
                        },
                        {
                            label: "My Second dataset",
                            backgroundColor: [
                                'rgba(0, 137, 132, .2)',
                            ],
                            borderColor: [
                                'rgba(0, 10, 130, .7)',
                            ],
                            data: [28, 48, 40, 19, 86, 27, 90]
                        }
                    ]
                },
                options: {
                    responsive: true
                }
            });


            //radar
            var ctxR = document.getElementById("radarChart").getContext('2d');
            var myRadarChart = new Chart(ctxR, {
                type: 'radar',
                data: {
                    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
                    datasets: [{
                            label: "My First dataset",
                            data: [65, 59, 90, 81, 56, 55, 40],
                            backgroundColor: [
                                'rgba(105, 0, 132, .2)',
                            ],
                            borderColor: [
                                'rgba(200, 99, 132, .7)',
                            ],
                            borderWidth: 2
                        }, {
                            label: "My Second dataset",
                            data: [28, 48, 40, 19, 96, 27, 100],
                            backgroundColor: [
                                'rgba(0, 250, 220, .2)',
                            ],
                            borderColor: [
                                'rgba(0, 213, 132, .7)',
                            ],
                            borderWidth: 2
                        }]
                },
                options: {
                    responsive: true
                }
            });

            //doughnut
            var ctxD = document.getElementById("doughnutChart").getContext('2d');
            var myLineChart = new Chart(ctxD, {
                type: 'doughnut',
                data: {
                    labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
                    datasets: [{
                            data: [300, 50, 100, 40, 120],
                            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
                        }]
                },
                options: {
                    responsive: true
                }
            });

        </script>

        <!--Google Maps-->
        <script src="https://maps.google.com/maps/api/js"></script>
        <script>
            // Regular map
            function regular_map() {
                var var_location = new google.maps.LatLng(40.725118, -73.997699);

                var var_mapoptions = {
                    center: var_location,
                    zoom: 14
                };

                var var_map = new google.maps.Map(document.getElementById("map-container"),
                        var_mapoptions);

                var var_marker = new google.maps.Marker({
                    position: var_location,
                    map: var_map,
                    title: "New York"
                });
            }

            new Chart(document.getElementById("horizontalBar"), {
                "type": "horizontalBar",
                "data": {
                    "labels": ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Grey"],
                    "datasets": [{
                            "label": "My First Dataset",
                            "data": [22, 33, 55, 12, 86, 23, 14],
                            "fill": false,
                            "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)",
                                "rgba(54, 162, 235, 0.2)",
                                "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
                            ],
                            "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                                "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)",
                                "rgb(201, 203, 207)"
                            ],
                            "borderWidth": 1
                        }]
                },
                "options": {
                    "scales": {
                        "xAxes": [{
                                "ticks": {
                                    "beginAtZero": true
                                }
                            }]
                    }
                }
            });

        </script>
    </body>

</html>
