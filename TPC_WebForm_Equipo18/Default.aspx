<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_WebForm_Equipo18._Default" %>
<%@ Import Namespace="Dominio" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="stylesHome.css">
   
    <style>
        .background-repeater {
    background-image: url('FPF/home/h1.png'); /* Ruta a tu imagen de fondo */
    background-size: contain;
    background-position: center; /* Centra la imagen de fondo */
    background-repeat: no-repeat; /* Evita que la imagen se repita */
    padding: 20px; /* Añade un padding para el contenido */
    display: flex; /* Usar flexbox para centrar el contenido */
    justify-content: center; /* Centrar horizontalmente */
    flex-wrap: wrap; /* Permitir que las tarjetas se envuelvan */
    }

    .card {
    margin: 15px; 
    }
        </style>



    <main>
            <main>
            <div class="background-repeater">
              <div class="row row-cols-1 row-cols-md-3 g-0 mt-0" style=" margin-left:170px; margin-right: 170px" >
                  <asp:Repeater runat="server" ID="repRepetidor">
                        <ItemTemplate>
                             <div class="col">
                             <div class="card" style="width: 18rem;">
                                  <div class="card-body">
                                   <img src="https://www.materialestetica.com/blog/wp-content/uploads/2022/11/beneficios-masajes-733.png" class="card-img-top" alt="...">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text"><%# Eval("Descripcion") %></p>
                                <p class="card-text"><%# Eval("Precio", "{0:N2}") %></p>
                                <asp:Button runat="server" ID="btnDetalles" Text="Detalles" CssClass="btn btn-primary" OnClick="btnDetalles_Click" CommandArgument='<%# Eval("Id") %>' />
                                  </div>
                                </div>
                          </div>
                     </ItemTemplate>
                 </asp:Repeater>
             </div>
            </div>
        </main>


      

        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000" style="margin-top: 50px;">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="FPF/home/1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="FPF/home/2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="FPF/home/3.png" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <div class="container-fluid" style="background-color: #f8d9ef; justify-content: center; margin-top: 50px; padding-bottom:50px;">
            <h1 class="text-center">¿Por qué elegirnos?</h1>
            <div class="row" style="margin-top: 50px;">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <figure class="text-center">
                                <blockquote class="blockquote">
                                    <img src="FPF/home/icolun.png" />
                                    <h5>Experiencia</h5>
                                </blockquote>
                                <figcaption class="blockquote-footer">
                                    <p>Contamos con especialistas altamente capacitados, siendo los mejores en su labor y con trayectoria intachable. </p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <figure class="text-center">
                                <blockquote class="blockquote">
                                    <img src="FPF/home/icoest.png" />
                                    <h5>Tecnología</h5>
                                </blockquote>
                                <figcaption class="blockquote-footer">
                                    <p>Estamos equipados con tecnología de última generación, siempre de vanguardia para darte los mejores resultados y cuidarte.</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>


                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <figure class="text-center">
                                <blockquote class="blockquote">
                                    <img src="FPF/home/icocor.png" />
                                    <h5>Amor</h5>
                                </blockquote>
                                <figcaption class="blockquote-footer">
                                    <p>Amamos nuestro trabajo, día a día nos impulsa más amar lo que hacemos y hacerte sentir una reina</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </main>
    <footer>
        <div class="container-fluid" style="margin-top: 50px; margin-bottom: 50px; justify-content: center; align-items: center; gap: 50px; display: flex;">


            <a href="#">
                <img src="FPF/home/ig.png" />
            </a>


            <a href="#">
                <img src="FPF/home/fa.png" />

            </a>

            <a href="#">
                <img src="FPF/home/tw.png" />
            </a>
            <a href="#">
                <img src="FPF/home/ti.png" />
            </a>
        </div>
        <div style="background-color: black; color: azure">
            <h5 class="text-center">App web diseñada y programada en 2024 por Franco Formía, José Arias y Martín García. Equipo 18, Programación 3, UTN FRGP</h5>

        </div>

    </footer>
</asp:Content>
