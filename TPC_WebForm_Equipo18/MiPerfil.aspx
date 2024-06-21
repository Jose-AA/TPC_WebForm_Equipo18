<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPC_WebForm_Equipo18.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>¡Bienvenido!</h1>

    <div>
        <asp:Label Text="Nombre" runat="server" />
        <asp:TextBox runat="server" ID="txtNombre" />
    </div>
    <div>
        <asp:Label Text="Apellido" runat="server" />
        <asp:TextBox runat="server" ID="txtApellido" />
    </div>



</asp:Content>
