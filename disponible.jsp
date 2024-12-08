<%-- 
    Document   : disponible
    Created on : 6/12/2024, 07:48:57 PM
    Author     : gioca
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marcas - Jarillo Hats</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #222222;
            color: #f1c40f; /* Color de texto amarillo */
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
            font-size: 2em;
            font-family: 'Roboto', sans-serif;
            font-weight: bold;
        }

        .cart-icon {
            font-size: 1.8em;
            cursor: pointer;
            position: relative;
            padding: 12px;
            background-color: #f1c40f;
            border-radius: 50%;
            color: #222222;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .cart-icon:hover {
            background-color: #e67e22;
            transform: scale(1.1);
        }

        .cart-count {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: #e67e22;
            color: white;
            font-size: 1em;
            padding: 3px 8px;
            border-radius: 50%;
            border: 2px solid #fff;
        }

        .navbar {
            background-color: #222222;
            position: sticky;
            top: 0;
            z-index: 1000;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar ul {
            display: flex;
            justify-content: center;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .navbar ul li {
            padding: 15px 20px;
        }

        .navbar ul li a {
            color: #f1c40f;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .navbar ul li a:hover {
            color: #e67e22;
        }

        /* Estilo de los botones con imagen y texto */
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
            filter: grayscale(50%);
            transition: filter 0.3s ease;
        }

        .product-box:hover img {
            filter: grayscale(0%);
        }

        .product-box h3 {
            font-size: 1.4em;
            color: #f1c40f;
            margin: 10px 0;
        }

        .product-box p {
            color: #ddd;
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

        .cart-dropdown {
            position: fixed;
            top: 10%;
            right: 10px;
            width: 300px;
            background-color: #222222;
            color: #f1c40f;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            padding: 20px;
            display: none;
            z-index: 999;
            border-radius: 8px;
        }

        .close-cart {
            font-size: 1.8em;
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            color: #f1c40f;
        }

        .cart-item {
            margin-bottom: 10px;
        }

        .cart-item button {
            background-color: transparent;
            border: none;
            color: #f1c40f;
            cursor: pointer;
            font-size: 1.1em;
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

        .back-button:hover {
            background-color: #e67e22;
        }

        .total-price {
            font-size: 1.3em;
            font-weight: bold;
            color: #f1c40f;
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <!-- Encabezado -->
    <header>
        <h1>Jarillo Hats</h1>
        <div class="cart-icon" onclick="toggleCart()">
            🛒
            <div class="cart-count" id="cart-count">0</div>
        </div>
    </header>

    <!-- Barra de navegación -->
    <nav class="navbar">
        <ul>
            <li><a href="novedades.jsp">Novedades</a></li>
        </ul>
    </nav>

    <!-- Productos disponibles -->
   <div class="product-container">
    <div class="product-box">
        <img src="https://th.bing.com/th/id/OIP.gu72Ky_Zk3PtyePfc6JyLAHaGN?rs=1&pid=ImgDetMain">
        <h3>Barbas Hats</h3>
        <a href="Barbas hats.jsp" class="view-product-button">Ver marca</a>
    </div>

    <div class="product-box">
        <img src="https://cdn.shopify.com/s/files/1/0454/8195/1400/collections/gorinbroslogo_1200x1200.png?v=1603308639">
        <h3>Goorin bros</h3>
        <a href="Goorin Bros.jsp" class="view-product-button">Ver marca</a>
    </div>

    <div class="product-box">
        <img src="https://th.bing.com/th/id/R.64ad82a4130bf3773347f956f382e64c?rik=fjPaD2l03IP3Tg&riu=http%3a%2f%2ffinesttmerch.com%2fcdn%2fshop%2fcollections%2fDANDY_HATS_COLLECTION.jpg%3fv%3d1678659430&ehk=C2IxLs8BBWUZ%2fuAih5sOkqUOh2tCbbw05kT7OjOrfOQ%3d&risl=&pid=ImgRaw&r=0">
        <h3> Dandy Hats</h3>
        <a href="Dandy Hats.jsp" class="view-product-button">Ver marca</a>
    </div>

    <div class="product-box">
        <img src="https://th.bing.com/th/id/R.9a40c7a2f341e296c44c32e9ca252ec9?rik=pqAiryrxAnG1QA&riu=http%3a%2f%2fwww.gallofinobrand.com%2fcdn%2fshop%2ffiles%2flogo.png%3fv%3d1699116585&ehk=hnJ1QrNqcP88VfPMm5%2f9BZ9CqWn1s1Fvck74ewmqblA%3d&risl=&pid=ImgRaw&r=0">
        <h3>Gallo Fino</h3>
        <a href="Gallo Fino.jsp" class="view-product-button"> Ver marca</a>
    </div>

    <div class="product-box">
        <img src="https://cdn.shopify.com/s/files/1/0790/6843/0658/files/31_Hats_Order_Confirmations_1920_x_1080_px_1080_x_1080_px.jpg?v=1706074540">
        <h3>ThirtyOne Hats</h3>
        <a href="ThirtyOne.jsp" class="view-product-button">Ver marca</a>
    </div>

    <div class="product-box">
        <img src="https://th.bing.com/th/id/OIP.QjJ36F6d0ilHm3L4PydC2QHaHa?rs=1&pid=ImgDetMain">
        <h3>New era</h3>
        <a href="New era.jsp" class="view-product-button">Ver marca</a>
    </div>
</div>


    <!-- Botón para regresar a la página principal -->
    <a href="index.html" class="back-button">Regresar</a>
    
    <!-- Carrito desplegable -->
    <div class="cart-dropdown" id="cart-dropdown">
        <div class="close-cart" onclick="toggleCart()">X</div>
        <h3>Carrito</h3>
        <div id="cart-items"></div>
        <div class="total-price">Total: $0.00</div>
    </div>

    <script>
        let cart = [];
        const cartCount = document.getElementById('cart-count');
        const cartDropdown = document.getElementById('cart-dropdown');
        const cartItems = document.getElementById('cart-items');
        const totalPrice = document.getElementById('total-price');

        function addToCart(event) {
            const productBox = event.target.closest('.product-box');
            const productId = productBox.dataset.id;
            const productName = productBox.dataset.name;
            const productPrice = parseFloat(productBox.dataset.price);

            const existingProductIndex = cart.findIndex(item => item.id === productId);

            if (existingProductIndex > -1) {
                cart[existingProductIndex].quantity++;
            } else {
                cart.push({
                    id: productId,
                    name: productName,
                    price: productPrice,
                    quantity: 1
                });
            }

            updateCart();
        }

        function updateCart() {
            cartCount.textContent = cart.length;

            let itemsHTML = '';
            let total = 0;

            cart.forEach(item => {
                total += item.price * item.quantity;
                itemsHTML += `
                    <div class="cart-item">
                        <p>${item.name} x ${item.quantity} - $${(item.price * item.quantity).toFixed(2)}</p>
                        <button onclick="removeFromCart('${item.id}')">Eliminar</button>
                    </div>
                `;
            });

            cartItems.innerHTML = itemsHTML;
            totalPrice.textContent = total.toFixed(2);
        }

        function removeFromCart(productId) {
            cart = cart.filter(item => item.id !== productId);
            updateCart();
        }

        function toggleCart() {
            cartDropdown.style.display = cartDropdown.style.display === 'none' || cartDropdown.style.display === '' ? 'block' : 'none';
        }
    </script>

</body>

</html>
