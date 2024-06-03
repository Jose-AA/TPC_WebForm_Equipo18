<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_WebForm_Equipo18._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="stylesHome.css">
    <main>
       
       <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
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
        
        <div class="col-sm-6 mb-3 mb-sm-0" style="margin-top: 50px;">
            <div class="image-container">
                <asp:Image ID="Image1" runat="server" ImageUrl="FPF/home/6.png" CssClass="image-background" />
                  <div class="card card-overlay">
                     <div class="card-body">
                        <h5 class="card-title">Beauty</h5>
                        <p class="card-text">Centro de estética, especialistas en Skincare y tratamientos faciales</p>
                        <a href="Contact.aspx" id="botonTarjeta" class="btn btn-primary">Contáctanos</a>
                        <a href="Formularios de Registro de Informacion/RegistrarDatosPersonales" id="botonTarjeta" class="btn btn-primary">Regístrate</a>
                     </div>
                 </div>
             </div>
        </div>






 
    </main>

</asp:Content>
