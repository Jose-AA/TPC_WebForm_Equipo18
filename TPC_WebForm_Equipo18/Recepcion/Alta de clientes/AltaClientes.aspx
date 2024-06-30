<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="AltaClientes.aspx.cs" Inherits="TPC_WebForm_Equipo18.Recepcion.RegistroUsuariosDesdeRecepcion" %>

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
        border-color: #015249;
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
        color: #015249; 
    }

    .form-control {
        width: 100%;
    }

    .btn-primary {
        display: block;
        margin: 20px auto 0 auto;
        background: #015249;
        border-color: #015249;
    }
    .btn-primary:hover{
        background-color: #1a6961;
        border-color: #1a6961;
    }
</style>


    <header style="margin-top: 20px; margin-left: 20px; margin-right: 20px;">

</header>
    
<main>
    <div class="form-container">
    <h1>Nuevo Cliente</h1>
        <div class="form-group">
            <label for="inputCorreo" class="form-label">Correo Electrónico</label>
            <asp:TextBox ID="inputCorreo" runat="server" CssClass="form-control" MaxLength="255" />
            <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputCorreo" runat="server" />
            <asp:RegularExpressionValidator ErrorMessage="* Debe ingresar un mail válido" ControlToValidate="inputCorreo" ForeColor="Red"
                ValidationExpression="^([\w\.-]+)@((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(([\w-]+\.)+[a-zA-Z]{2,4}))$" runat="server" />
        </div>
        <div class="form-group">
            <label for="inputContraseña" class="form-label">Contraseña</label>
            <asp:TextBox ID="inputContraseña" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
            <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputContraseña" runat="server" />
        </div>
        <div class="form-group">
            <label for="inputConfirmarContraseña" class="form-label">Confirmar Contraseña</label>
            <asp:TextBox ID="inputConfirmarContraseña" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
            <asp:RequiredFieldValidator ErrorMessage="* Campo Obligatorio" ForeColor="Red" ControlToValidate="inputConfirmarContraseña" runat="server" />
            <asp:CompareValidator ErrorMessage="* Las contraseñas no coinciden" ForeColor="Red" ControlToValidate="inputConfirmarContraseña" 
                controlToCompare="inputContraseña" runat="server" />
        </div>

        <asp:Button ID="btnCrearUsuario" runat="server" CssClass="btn btn-primary" Text="Crear Usuario" OnClick="btnCrearUsuario_Click" />
    </div>
</main>





<div id="usuarioCargado" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSeleccionEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSeleccionEliminarLabel3">¡ Datos Cargados Exitosamente!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Usuario cargado exitosamente</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>


<script>

    function abrirModal() {

        var myModal = new bootstrap.Modal(document.getElementById('usuarioCargado'), {
            keyboard: false
        });
        myModal.show();
    }

    function redirectAfterDelay() {
        setTimeout(function () {
            window.location.href = "DatosPersonalesClientes.aspx";
         }, 3000);
    }
</script>

</asp:Content>
