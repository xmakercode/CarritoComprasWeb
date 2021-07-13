<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>WeSoft | GMSDLS </title>
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
                <a class="nav-link active" aria-current="page" href="Controlador?accion=Carrito"><i class = "fas fa-cart-plus">(<label style="color: orange">${contador}</label>)</i>Car</a>
            </li>
        </ul>
        <!--vista de productos-->
        <div class="container mt-2">
            <div class="row">

                <c:forEach var="producto" items="${productos}">
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header">
                                <h4>${producto.getNombre}</h4>
                            </div>
                            <div class="card-body text-center">
                                <img src="ControladorIMG?id=${producto.getIdProducto}" width="150" height="130">
                            </div>
                            <div class="card-footer text-center">
                                <label>${producto.getDescripcion}Description products
                                </label>
                                <h5> $.${producto.getPrecio()}</h5>
                                <div>
                                    <a href="Controlador?accion=AgregarCarrito&id=${producto.getIdProducto}" class="btn btn-outline-info">Añadir al carrito</a>
                                    <a href="" class="btn btn-danger">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

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