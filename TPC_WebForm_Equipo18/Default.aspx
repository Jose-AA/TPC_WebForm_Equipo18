<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_WebForm_Equipo18._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="stylesHome.css">
    <main>

        <img src="FPF/home/h1.png" alt="portada" class="img-fluid" />
        <div class="form-container" style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%); z-index: 2;">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ingresar</h5>
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="exampleInputPassword1">
                        </div>

                        <button id="bot" type="submit" class="SearchButton">Ingresar</button>
                    </form>
                </div>
            </div>
        </div>

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
