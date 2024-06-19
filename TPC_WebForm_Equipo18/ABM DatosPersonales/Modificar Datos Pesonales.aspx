<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Modificar Datos Pesonales.aspx.cs" Inherits="TPC_WebForm_Equipo18.ABM_Datos_Personales.Modificar_Datos_Pesonales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main>

        <div id="seleccione" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSeleccionEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSeleccionEliminarLabel">Error: Selección Requerida</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Por favor, seleccione un usuario antes de continuar con la accion.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>
        <div id="ModificadoExitosamente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalExitoEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalExitoEliminarLabel">¡Datos Modificados exitosamente!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Los datos pesonales del usuario han sido Modificado exitosamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>


        <h1 style="margin-left: 20px; margin-right: 20px; margin-top:20px " > Modificar datos Personales </h1>

        <h3 style="margin-left: 20px; margin-right: 20px; margin-top:20px " > Seleccione el usuario </h3>

        <div style="margin-left: 20px; margin-right: 20px; margin-top:50px ">
        <asp:DropDownList ID="UsuarioModificar" runat="server" AutoPostBack="True" OnSelectedIndexChanged="UsuarioModificar_SelectedIndexChanged"/>
        </div>

        <div class="row g-3" style="margin-left: 20px; margin-right: 20px; margin-top:50px ">

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

                <div style=" margin-top:30px " >
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Guardar y Modificar" OnClick="btnSubmit_Click"   />
                    </div>

            </div>

            </div>

    </main>
    <script>

        function seleccione() {
            var myModal = new bootstrap.Modal(document.getElementById('seleccione'), {
                keyboard: false
            });
            myModal.show();
        }

        function modificadoexitosamente() {
            var myModal = new bootstrap.Modal(document.getElementById('ModificadoExitosamente'), {
                keyboard: false
            });
            myModal.show();
        }


    </script>

</asp:Content>
