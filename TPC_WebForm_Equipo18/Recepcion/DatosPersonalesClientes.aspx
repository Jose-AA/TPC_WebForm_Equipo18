<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="DatosPersonalesClientes.aspx.cs" Inherits="TPC_WebForm_Equipo18.Recepcion.DatosPersonalesClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    main {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .form-container {
        background-color: #57BC90; 
        border-radius: 30px;
        padding: 20px;
        width: 340px; 
        box-shadow: 0 0 15px 5px #015249; 
    }

    .form-group {
        width: 300px;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        color: #fff; 
        color: #015249; 
    }

    .form-control {
        width: 100%;
    }

    .btn-primary {
        display: block;
        margin: 20px auto 0 auto;
    }
</style>
    
    
        <main>
            <div class="form-container">
                <h1>Datos de perfil</h1>
                <div class="form-group">
                    <label for="inputNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" MaxLength="255" />
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputNombre" runat="server" />
                </div>
                <div class="form-group">
                    <label for="inputApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="inputApellido" runat="server" CssClass="form-control" MaxLength="255" />
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputApellido" runat="server" />
                </div>
                <div class="form-group">
                    <label for="inputDNI" class="form-label">DNI</label>
                    <asp:TextBox ID="inputDNI" runat="server" CssClass="form-control" MaxLength="20" />
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputDNI" runat="server" />
                </div>
                <div class="form-group">
                    <label for="inputTelefono" class="form-label">Teléfono</label>
                    <asp:TextBox ID="inputTelefono" runat="server" CssClass="form-control" MaxLength="20" />
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputTelefono" runat="server" />
                </div>
                <div class="form-group">
                    <label for="inputDireccion" class="form-label">Direccion</label>
                    <asp:TextBox ID="inputDireccion" runat="server" CssClass="form-control" MaxLength="20" />
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputDireccion" runat="server" />
                </div>
                <div class="form-group">
                    <label for="inputFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox ID="inputFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date" />
                    <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputFechaNacimiento" runat="server" />
                </div>
                    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="btnGuardar_Click" />
            </div>
        </main>
    

</asp:Content>
