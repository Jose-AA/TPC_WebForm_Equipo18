﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarDatosPersonales.aspx.cs" Inherits="TPC_WebForm_Equipo18.DatosPersonales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header style="margin-top: 20px;" > 
       
        <h1>Crear Usuario</h1>
    </header>
    <main style="margin-top: 20px;">
        <div class="row g-1">
            <div class="col-md-6">
                <label for="inputCorreo" class="form-label">Correo Electrónico</label>
                <asp:TextBox ID="inputCorreo" runat="server" CssClass="form-control" MaxLength="255" />
            </div>
            <div class="col-md-6">
                <label for="inputContraseña" class="form-label">Contraseña</label>
                <asp:TextBox ID="inputContraseña" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
            </div>
            <div class="col-md-6">
                <label for="inputConfirmarContraseña" class="form-label">Confirmar Contraseña</label>
                <asp:TextBox ID="inputConfirmarContraseña" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnCrearUsuario" runat="server" CssClass="btn btn-primary" Text="Crear Usuario" />
            </div>
        </div>
    </main>
</asp:Content>