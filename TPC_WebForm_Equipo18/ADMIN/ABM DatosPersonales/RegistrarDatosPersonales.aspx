<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarDatosPersonales.aspx.cs" Inherits="TPC_WebForm_Equipo18.DatosPersonales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    <header style="margin-top: 20px; margin-left: 20px; margin-right: 20px;"> 
        <h1>Datos Personales</h1>
    </header>

    <div style="margin-left: 20px; margin-right: 20px; margin-top:50px ">
<asp:DropDownList ID="UsuarioaCargar" runat="server" AutoPostBack="True"/>

</div>

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
                <p>Por favor, seleccione el correo del usuario antes de continuar con la accion.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

                <div id="DatosPersonalesYaCargados" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSeleccionEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSeleccionEliminarLabel2">Error: Datos personales ya cargados</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Este usuario ya tiene los datos personales cargados, si deseas moficiar sus datos deberas ir al apartado de modificacion </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

                        <div id="DatosPersonalesCargadosExitosamente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSeleccionEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSeleccionEliminarLabel3">¡ Datos Cargados Exitosamente!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p> ¡ Los datos personales fueron cargados exitosamente ! </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>



        <div class="row g-3" style="margin-left: 20px; margin-right: 30px;">
    <div class="col-md-6">
        <label for="inputNombre" class="form-label">Nombre</label>
        <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" MaxLength="50" />
        <asp:RequiredFieldValidator ID="rfvNombre" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputNombre" runat="server" ValidationGroup="CrearServicioValidation" />
    </div>
    <div class="col-md-6">
        <label for="inputApellido" class="form-label">Apellido</label>
        <asp:TextBox ID="inputApellido" runat="server" CssClass="form-control" MaxLength="50" />
        <asp:RequiredFieldValidator ID="rfvApellido" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputApellido" runat="server" ValidationGroup="CrearServicioValidation" />
    </div>
    <div class="col-md-6">
        <label for="inputDNI" class="form-label">DNI</label>
        <asp:TextBox ID="inputDNI" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="rfvDNI" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputDNI" runat="server" ValidationGroup="CrearServicioValidation" />
    </div>
    <div class="col-md-6">
        <label for="inputTelefono" class="form-label">Teléfono</label>
        <asp:TextBox ID="inputTelefono" runat="server" CssClass="form-control" MaxLength="25" />
        <asp:RequiredFieldValidator ID="rfvTelefono" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputTelefono" runat="server" ValidationGroup="CrearServicioValidation" />
        
    </div>
    <div class="col-12">
        <label for="inputDireccion" class="form-label">Dirección</label>
        <asp:TextBox ID="inputDireccion" runat="server" CssClass="form-control" MaxLength="100" />
        <asp:RequiredFieldValidator ID="rfvDireccion" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputDireccion" runat="server" ValidationGroup="CrearServicioValidation" />
    </div>
    <div class="col-md-6">
        <label for="inputFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
        <asp:TextBox ID="inputFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date" />
        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputFechaNacimiento" runat="server" ValidationGroup="CrearServicioValidation" />
    </div>
    <div class="col-12">
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="btnSubmit_Click" ValidationGroup="CrearServicioValidation" />
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

        function Datosyacargados(){

            var myModal = new bootstrap.Modal(document.getElementById('DatosPersonalesYaCargados'), {
                keyboard: false
            });
            myModal.show();
        }

        function DatosPersonalescargadosExitosamente() {

            var myModal = new bootstrap.Modal(document.getElementById('DatosPersonalesCargadosExitosamente'), {
                keyboard: false
            });
            myModal.show();
        }


    </script>

</asp:Content>

