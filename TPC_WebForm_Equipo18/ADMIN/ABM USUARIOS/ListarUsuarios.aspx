<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion.ListarUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <label>Menú Usuarios</label>
    <asp:GridView runat="server" ID="gridUsuarios" DataKeyNames="IdUsuario" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" CssClass="table table-bordered" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="IdUsuario" />
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Contraseña" DataField="Contraseña" />
            <asp:BoundField HeaderText="ID Rol" DataField="IdRol" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Acción" />
        </Columns>
    </asp:GridView>


    <asp:Button Text="Nuevo Usuario" ID="btnNuevoUsuario" CssClass="btn btn-primary" runat="server" onclick="btnNuevoUsuario_Click"/>

</asp:Content>
