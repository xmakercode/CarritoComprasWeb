package com.controlador;

import com.modelo.Carrito;
import com.modelo.Producto;
import com.modelo.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    Producto producto = new Producto();
    List<Producto> productos = new ArrayList<>();

    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    int idProd;
    Carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        productos = pdao.listarProductos();
        switch (accion) {

            case "Comprar":
                totalPagar = 0.0;
                idProd = Integer.parseInt(request.getParameter("id"));
                producto = pdao.listarIdProducto(idProd);

                item = item + 1;
                Carrito car = new Carrito();
                car.setItem(item);
                car.setIdProducto(producto.getIdProducto());
                car.setNombre(producto.getNombre());
                car.setDescripcion(producto.getDescripcion());
                car.setPrecioCompra(producto.getPrecio());
                car.setCantidad(cantidad);
                car.setSubtotal(cantidad * producto.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            case "AgregarCarrito":

                int posicion = 0;
                cantidad = 1;
                idProd = Integer.parseInt(request.getParameter("id"));
                producto = pdao.listarIdProducto(idProd);

                if (listaCarrito.size() > 0) {

                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idProd == listaCarrito.get(i).getIdProducto()) {
                            posicion = i;
                        }
                    }

                    if (idProd == listaCarrito.get(posicion).getIdProducto()) {
                        cantidad = listaCarrito.get(posicion).getCantidad() + cantidad;
                        double subtotal = listaCarrito.get(posicion).getPrecioCompra() * cantidad;
                        listaCarrito.get(posicion).setCantidad(cantidad);
                        listaCarrito.get(posicion).setSubtotal(subtotal);

                    } else {
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(producto.getIdProducto());
                        car.setNombre(producto.getNombre());
                        car.setDescripcion(producto.getDescripcion());
                        car.setPrecioCompra(producto.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * producto.getPrecio());
                        listaCarrito.add(car);
                        request.setAttribute("contador", listaCarrito.size());
                        request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                        break;
                    }
                } else {
                    item = item + 1;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(producto.getIdProducto());
                    car.setNombre(producto.getNombre());
                    car.setDescripcion(producto.getDescripcion());
                    car.setPrecioCompra(producto.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * producto.getPrecio());
                    listaCarrito.add(car);
                    request.setAttribute("contador", listaCarrito.size());
                    request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                    break;

                }

            case "Carrito":
                totalPagar = 0.0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
