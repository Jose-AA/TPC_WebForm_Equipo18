<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion.ListarUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  

    <h1 style="margin-left:500px; margin-top:50px; margin-bottom:50px">listado de Usuarios</h1>

      <asp:TextBox ID="txtBuscar" runat="server" Visible="true" style="margin-left:500px; margin-top:50px; margin-bottom:50px" />

       <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />

    <asp:GridView runat="server" ID="gridUsuarios" DataKeyNames="IdUsuario" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" CssClass="table table-bordered" AutoGenerateColumns="false" style="width:1500px; margin-left:500px "  >
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="IdUsuario" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Contraseña" DataField="Contraseña" />
            <asp:BoundField HeaderText="ID Rol" DataField="IdRol" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Acción" />
        </Columns>
    </asp:GridView>

   <div style="margin-left:500px"> 
    <asp:Button  Text="Nuevo Usuario" ID="btnNuevoUsuario" CssClass="btn btn-primary" runat="server" onclick="btnNuevoUsuario_Click"/>
       </div>
</asp:Content>
