<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarDatosPersonales.aspx.cs" Inherits="TPC_WebForm_Equipo18.DatosPersonales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    
    <header style="margin-top: 20px;"> 
        <h1>Datos Personales</h1>
    </header>
    <main style="margin-top: 50px;">
        <div class="row g-3">
            <div class="col-md-6">
                <label for="inputNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" MaxLength="50" />
            </div>
            <div class="col-md-6">
                <label for="inputApellido" class="form-label">Apellido</label>
                <asp:TextBox ID="inputApellido" runat="server" CssClass="form-control" MaxLength="50" />
            </div>
            <div class="col-md-6">
                <label for="inputDNI" class="form-label">DNI</label>
                <asp:TextBox ID="inputDNI" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label for="inputTelefono" class="form-label">Teléfono</label>
                <asp:TextBox ID="inputTelefono" runat="server" CssClass="form-control" MaxLength="25" />
            </div>
            <div class="col-12">
                <label for="inputDireccion" class="form-label">Dirección</label>
                <asp:TextBox ID="inputDireccion" runat="server" CssClass="form-control" MaxLength="100" />
            </div>
            <div class="col-md-6">
                <label for="inputFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox ID="inputFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Guardar" />
            </div>
        </div>
    </main>
</asp:Content>

