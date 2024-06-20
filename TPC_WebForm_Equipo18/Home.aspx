<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TPC_WebForm_Equipo18.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #77C9D4;
        color: #015249;
        margin: 0;
        padding: 0;
        }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    #logo{
        width: 250px;
    }
    section {
        margin-bottom: 40px;
        padding: 20px;
        border-radius: 10px;
        background-color: #A5A5AF;
        color: #fff;
    }

    h1, h2 {
        color: #015249;
    }

    h3 {
        color: #57BC90;
    }

    .service-item {
        display: flex;
        align-items: center;
        background-color: #57BC90;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 20px;
    }

    .service-item img {
        width: 150px;
        height: 150px;
        margin-right: 20px;
    }

    .service-item.reverse {
        flex-direction: row-reverse;
    }

    .service-item.reverse img {
        margin-left: 20px;
        margin-right: 0;
    }

    .experience img {
        width: 150px;
        height: 150px;
        margin: 10px;
        border-radius: 50%;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #015249;
        color: #fff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
    }

    button:hover {
        background-color: #57BC90;
    }

    @media (max-width: 768px) {
        .container {
            padding: 10px;
        }

        section {
            padding: 10px;
        }

        .service-item {
            flex-direction: column;
        }

        .service-item img {
            margin: 0 0 10px 0;
        }

        .service-item.reverse {
            flex-direction: column;
        }

        .service-item.reverse img {
            margin: 0 0 10px 0;
        }

        .experience img {
            margin: 5px 0;
        }
    }



    </style>
     <div class="container">
        <section class="about-us">
            <h1>Quiénes Somos</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
             <img id="logo" src="https://png.pngtree.com/png-clipart/20211116/original/pngtree-beauty-logo-png-image_6943906.png" alt="logo beauty" />
        </section>

        <section class="services">
            <h2>Nuestros Servicios</h2>
            <div class="service-item">
                <img src="https://centromedicoescuela.com.ar/foto/Fotolia_102318601_XS.jpg" alt="Realización de Uñas">
                <div>
                    <h3>Realización de Uñas</h3>
                    <p>Ofrecemos una variedad de servicios de manicura y pedicura, incluyendo uñas acrílicas, gel y diseños personalizados.</p>
                </div>
            </div>
            <div class="service-item reverse">
                <div>
                    <h3>Extensión de Pestañas</h3>
                    <p>Nuestros técnicos expertos utilizan técnicas avanzadas para proporcionar extensiones de pestañas que se ven naturales y duraderas.</p>
                </div>
                <img src="https://i0.wp.com/tucarabonita.es/wp-content/uploads/2023/01/Extensiones-de-pesyanas.png?resize=1080%2C675&ssl=1" alt="Extensión de Pestañas">
            </div>
            <div class="service-item">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZq6SmoZfEoqUc2OGUFHfRHwS1qVu0xPz6Zw&s" alt="Tratamientos Faciales">
                <div>
                    <h3>Tratamientos Faciales</h3>
                    <p>Disfruta de nuestros tratamientos faciales que rejuvenecen y revitalizan tu piel, dejándola radiante y saludable.</p>
                </div>
            </div>
        </section>

        <section class="experience">
            <h2>Nuestra Experiencia</h2>
            <p>Con un equipo de profesionales altamente calificados, estamos comprometidos con la excelencia y la satisfacción del cliente. Nuestro local ha sido reconocido por su calidad y atención al detalle en cada servicio que ofrecemos.</p>
            <img src="https://img.freepik.com/foto-gratis/mujer-posando-albornoz-spa_23-2148206225.jpg" alt="Especialista 1">
            <img src="https://img.freepik.com/foto-gratis/retrato-dentista-pie-brazos-cruzados_107420-74076.jpg" alt="Especialista 2">
            <img src="https://www.shutterstock.com/image-photo/portrait-smiling-woman-doctor-cosmetologist-260nw-2218117229.jpg" alt="Especialista 3">
            <img src="https://www.shutterstock.com/image-photo/caucasian-brazilian-woman-wearing-lab-260nw-2332589487.jpg" alt="Especialista 4">
             <img src="https://www.shutterstock.com/image-photo/woman-beautician-doctor-work-spa-260nw-670810756.jpg" alt="Especialista 5"> 
            
            
            <p>Nuestros especialistas en skincare están siempre al día con las últimas tendencias y técnicas para ofrecerte lo mejor en cuidados de la piel.</p>
        </section>

        <section class="contact">
            <h2>Contáctanos</h2>
            <button onclick="location.href='contacto.aspx'">Contáctanos!</button>
        </section>
    </div>
</asp:Content>
