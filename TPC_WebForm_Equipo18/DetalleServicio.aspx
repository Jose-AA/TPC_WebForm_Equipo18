<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="DetalleServicio.aspx.cs" Inherits="TPC_WebForm_Equipo18.DetalleServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="DetalleServicio.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <section id="service-page">
        <div class="service-details">
            
            <div class="service-img">
                <!--Para cuando tengamos forma de cargar imagenes, luego se desarrollará-->
            </div>
           
            <div class="service-text">
                <h3>ACA VA EL NOMBRE DEL SERVICIO</h3>
                <span class="service-price">$2500.00</span>
                <p>
                    ACA VA LA DESCRIPCION
                </p>

                <div class="service-button">
                    <a href="#" class="add-turn-btn">Solicitar Turno</a>
                    <a href="#" class="add-fav-btn">Añadir a Favoritos</a>
                </div>
      
            </div>
        </div>
    </section>
</asp:Content>
