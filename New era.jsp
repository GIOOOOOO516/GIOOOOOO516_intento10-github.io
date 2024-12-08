<%-- 
    Document   : New era
    Created on : 7/12/2024, 04:05:29 PM
    Author     : gioca
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo - New Era</title>
    <style>
        /* Estilos del catálogo */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #222222;
            color: #f1c40f;
        }

        header {
            font-size: 1.6em;
            background: linear-gradient(135deg, #333333, #f39c12);
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        header h1 {
            margin: 0;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 30px;
            justify-content: space-around;
            background-color: #222222;
        }

        .product-box {
            background-color: #333333;
            width: 220px;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .product-box img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        
          /* Botón para regresar */
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f1c40f;
            color: #222222;
            text-decoration: none;
            border-radius: 5px;
            margin: 30px auto;
            text-align: center;
            font-size: 1.2em;
            cursor: pointer;
        }

        .product-box h3 {
            color: #f1c40f;
        }

        .view-product-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f1c40f;
            color: #222222;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .view-product-button:hover {
            background-color: #e67e22;
        }
    </style>
</head>

<body>

    <!-- Encabezado -->
    <header>
        <h1>New Era</h1>
    </header>

    <!-- Catálogo de productos -->
    <div class="product-container">
        <%
            // Configuración de conexión a MySQL
            String url = "jdbc:mysql://localhost:3306/tienda";
            String user = "root"; 
            String password = ""; 

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                // Filtramos los productos para que solo se muestren los que tengan visible_en_new_era = TRUE
                String sql = "SELECT id, nombre, imagen_url, precio FROM productos WHERE visible_en_new_era = TRUE";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    String imagenUrl = rs.getString("imagen_url");
                    double precio = rs.getDouble("precio");
        %>
                    <div class="product-box" data-id="<%= id %>">
                        <img src="<%= imagenUrl %>" alt="<%= nombre %>">
                        <h3><%= nombre %></h3>
                        <p>Precio: $<%= precio %></p>
                        <a href="javascript:void(0)" class="view-product-button" onclick="addToCart('<%= id %>', '<%= nombre %>', <%= precio %>)">Agregar al carrito</a>
                    </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p>Error al conectar con la base de datos: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>

    <!-- Script para carrito -->
    <script>
        let cart = [];
        function addToCart(id, name, price) {
            const index = cart.findIndex(item => item.id == id);
            if (index !== -1) {
                cart[index].quantity += 1;
            } else {
                cart.push({ id, name, price, quantity: 1 });
            }
            alert(`Producto agregado: ${name}`);
        }
    </script>
    
     <a href="index.html" class="back-button">Regresar</a>

</body>

</html>
