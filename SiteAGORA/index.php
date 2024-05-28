

<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        header {
            background-color: #5CB8FF;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            color: white;
            margin: 0;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .logo {
            width: 350px;
            height: auto;
            margin-right: 20px;
        }

        nav {
            background-color: #444;
            padding: 10px;
        }

        nav ul {
            display: flex;
            list-style-type: none;
            margin: 0;
            padding: 0;
            justify-content: center;
        }

        nav li {
            margin-right: 50px;
            border-radius: 5px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 20px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: gray;
        }

       .section1 {
    flex-grow: 1;
    padding: 0;
    background-image: url('img/photopersonne.png');
    background-size: contain; /* ou auto, ou 50% selon le besoin */
    background-repeat: no-repeat;
    background-position: center;
    min-height: 100vh;
}

        section2 {
            flex-grow: 1;
            padding: 20px;
        }

        footer {
            background-color: #333;
            padding: 20px;
            text-align: center;
        }

        footer a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        footer a:hover {
            background-color: #555;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        header, nav, footer {
            animation: fadeIn 1s ease;
        }
		
        h2 {
            color: white;
        }

        p {
            color: white;
        }
    </style>
</head>
<body>
    <!-- En-tête avec barre de navigation -->
    <header>
        <img src="img/agoralogo.png" alt="Logo Agora" class="logo">
		
    </header>
	
    <nav>
        <ul>
            <li><a href="#">Accueil</a></li>
            <li><a href="browse.php">Tout Parcourir</a></li>
            <li><a href="#">Notifications</a></li>
            <li><a href="cart.php">Panier</a></li>
            <li><a href="account.php">Votre Compte</a></li>
        </ul>
    </nav>

    <!-- Section avec image de fond -->
    <section class="section1">
    </section>

    <!-- Carrousel de sélection du jour -->
    <section2>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/item1.jpg" class="d-block w-100" alt="Item 1">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Item 1</h5>
                        <p>Description de l'article 1.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/item2.jpg" class="d-block w-100" alt="Item 2">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Item 2</h5>
                        <p>Description de l'article 2.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/item3.jpg" class="d-block w-100" alt="Item 3">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Item 3</h5>
                        <p>Description de l'article 3.</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section2>

    <!-- Section contact avec Google Maps -->
    <footer>
        <section class="container mt-5">
            <h2>Contactez-nous</h2>
            <p>Adresse : 123 Rue de l'Exemple, Paris, France</p>
            <p>Email : contact@agorafrancia.com</p>
            <p>Téléphone : +33 1 23 45 67 89</p>
            <div id="map" style="height: 400px;"></div>
        </section>
        <p>&copy; 2023 Agora Francia</p>
        <a href="#">Mentions légales</a>
        <a href="#">Politique de confidentialité</a>
    </footer>

    <script>
        function initMap() {
            var location = {lat: 48.8566, lng: 2.3522}; // Paris coordinates
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                center: location
            });
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"></script>
</body>

<?php include 'contact.php'; ?>
<?php include 'footer.php'; ?>
