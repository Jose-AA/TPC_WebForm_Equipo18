<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Moderacion de Reseñas.aspx.cs" Inherits="TPC_WebForm_Equipo18.ADMIN.Reseñas.Moderacion_de_Reseñas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    <div class="container">
        <asp:Repeater ID="rptReseñas" runat="server">
            <ItemTemplate>
                <div class="card mb-3" style="max-width: 350px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="https://avatars.githubusercontent.com/u/129862385?v=4" class="img-fluid rounded-start" alt="..." />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Cliente.Nombre") %> <%# Eval("Cliente.Apellido") %></h5>
                                <p class="card-text"><%# Eval("Comentario") %></p>
                                <%# GenerarEstrellasSVG(Convert.ToInt32(Eval("Calificacion"))) %>
                                <p class="card-text"><small class="text-muted"><%# Eval("CreadoEn") %></small></p>
                                <asp:Label ID="lblServicioId" runat="server" Visible="false" Text='<%# Eval("Servicio.Id") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>




</asp:Content>
