<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_WebForm_Equipo18._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .carousel-item img {
            margin-right: 10%;
            margin-left: 10%;
            object-fit: cover;
            max-height: 20%;
            max-width: 80%;
        }
    </style>
    <main>
       
 <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <asp:Image ID="CarouselImage1" runat="server" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU0G4Qb943qwz_feAJMSKfkBNGbSgNhLppBQ&s" CssClass="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <asp:Image ID="CarouselImage2" runat="server" ImageUrl="https://booksy.com/biz/uploads/media/x1920/06/5176-salon-offers.jpg?v=1-0" CssClass="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                    <asp:Image ID="CarouselImage3" runat="server" ImageUrl="https://i0.wp.com/www.academiestetic.com/wp-content/uploads/2016/05/como-hacer-promociones-estetica.png?fit=600%2C785&ssl=1" CssClass="d-block w-100" alt="..." />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </main>

</asp:Content>
