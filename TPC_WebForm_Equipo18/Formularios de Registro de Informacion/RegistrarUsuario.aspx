<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="TPC_WebForm_Equipo18.RegistrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <header style="margin-top: 20px; margin-left: 20px; margin-right: 20px;">

        <h1>Crear Usuario</h1>
    </header>
    <main>
        <div class="row g-1" style="margin-left: 20px; margin-right: 20px;">
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
            <div class="col-md-6">
                <label for="inputIDRol" class="form-label">ID Rol</label>
                <asp:DropDownList runat="server" ID="ddlRoles" CssClass="form-select">
                </asp:DropDownList>
            </div>

            <div class="col-12">
                <asp:Button ID="btnCrearUsuario" runat="server" CssClass="btn btn-primary" Text="Crear Usuario" OnClick="btnCrearUsuario_Click" />
            </div>

            <div class="col-12">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-primary" Text="Regresar" OnClick="btnRegresar_Click" />
            </div>
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
    </script>

</asp:Content>
