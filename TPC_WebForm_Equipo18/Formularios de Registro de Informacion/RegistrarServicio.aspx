<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarServicio.aspx.cs" Inherits="TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion.RegistrarServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <header style="margin-top: 20px;" > 
        <h1>Crear Servicio</h1>
    </header>
    <main style="margin-top: 50px;">
        <div class="row g-3">
            <div class="col-md-6">
                <label for="inputNombre" class="form-label">Nombre del Servicio</label>
                <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" MaxLength="50" />
            </div>
            <div class="col-md-6">
                <label for="inputDescripcion" class="form-label">Descripción</label>
                <asp:TextBox ID="inputDescripcion" runat="server" CssClass="form-control" MaxLength="100" />
            </div>
            <div class="col-md-6">
                <label for="inputDuracion" class="form-label">Duración (minutos)</label>
                <asp:TextBox ID="inputDuracion" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="col-md-6">
                <label for="inputPrecio" class="form-label">Precio</label>
                <asp:TextBox ID="inputPrecio" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnCrearServicio" runat="server" CssClass="btn btn-primary" Text="Crear Servicio" />
            </div>
        </div>
    </main>

</asp:Content>
