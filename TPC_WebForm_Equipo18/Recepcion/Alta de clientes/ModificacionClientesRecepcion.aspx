<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ModificacionClientesRecepcion.aspx.cs" Inherits="TPC_WebForm_Equipo18.Recepcion.Alta_de_clientes.ModificacionClientesRecepcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lbltit" runat="server" Text="Modificar datos personales"></asp:Label>
    <asp:Label ID="lblNombreUsuario" runat="server" Text="Label"></asp:Label>
    <style>
        .form-container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            box-shadow: 0 9px #999;
        }
        .btn:hover {background-color: #3e8e41}
        .btn:active {
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
    </style>
    <body>
    <div id="formModificarDatos" runat="server">
        <div class="form-container">
            <h2>Modificar Datos</h2>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtApellido">Apellido:</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDNI">DNI:</label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtTelefono">Teléfono:</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDireccion">Dirección:</label>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtFechaNacimiento">Fecha de Nacimiento:</label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNuevaContrasena">Nueva Contraseña:</label>
                <asp:TextBox ID="txtNuevaContrasena" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtConfirmarContrasena">Confirmar Contraseña:</label>
                <asp:TextBox ID="txtConfirmarContrasena" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn" OnClick="btnModificar_Click"/>
            </div>
        </div>
    </div>
</body>


</asp:Content>
