<%-- 
    Document   : index
    Created on : Jul 8, 2021, 7:21:25 PM
    Author     : root
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--import access to CSS-->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

        <link href="css/estilos.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/duotone.css"
              integrity="sha384-R3QzTxyukP03CMqKFe0ssp5wUvBPEyy9ZspCB+Y01fEjhMwcXixTyeot+S40+AjZ" crossorigin="anonymous" />

        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css"
              integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <!--navegacion bar Products-->
        <ul class="nav nav-tabs nav-light bg-dark-">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="Controlador?accion=home">Home</a>
            </li>
            <!--navegacion bar Car-->
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="Controlador?accion=home">Carrito</a>
            </li>
        </ul>
        <div class="container mt-4">
            <h3>Carrito</h3>
            <div class="row">
                <div class="col-sm-8">
                    <table class= "table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRE</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                <th>CANTIDAD</th>
                                <th>SUBTOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="car" items="${carrito}">
                            <tr> 
                                <th>${car.getItem}</th>
                                <th>${car.getNombre}</th>
                                <th>${car.getDescripcion}</th>
                                <th>${car.getPrecio}</th>
                                <th>${car.getCantidad}</th>
                                <th>${car.getSubtotal}</th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div> 
                <div class="col-sm-4">
                    <div class = "card">
                        <div class= "card-header">
                            <h3>Facturación</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$RD${totalPagar}0" readonly="" class="form-control">
                            <label>Total a Pagar:</label>
                            <input type="text" value="$RD${totalPagar}0"readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="" class="btn btn-info btn-block">Realizar Pago</a>
                            <a href=""class="btn btn-danger btn btn-block">Generar Compra</a>
                        </div>
                    </div>
                </div>
            </div>

            <!--import components to BOOTSTRAP navegacion bar-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    </body>
</html>
