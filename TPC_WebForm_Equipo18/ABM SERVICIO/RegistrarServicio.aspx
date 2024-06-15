<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarServicio.aspx.cs" Inherits="TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion.RegistrarServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .position{
            position: relative;
            left: -148px;
        }
    </style>

    <header style="margin-top: 20px; margin-left: 20px; margin-right: 20px;">
        <h1>Crear Servicio</h1>

    </header>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <main>


        <!--  -----  MODAL CONFIRMACION ---->

        <div id="successModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">¡Registro Exitoso!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Servicio registrado exitosamente.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de prgegunta -->

<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">Confirmar Acción</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>¿Está seguro de que desea modificar este servicio?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="btnConfirmar">Confirmar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de éxito -->
<div id="Eliminadoexitoso" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">¡Eliminacion Exitosa!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>El servicio ha sido Eliminado exitosamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

        <!-- Modificado exitosamente -->

<div id="ModificadoExitosamente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalExitoEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalExitoEliminarLabel">¡Servicio Modificado Exitosamente!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>El servicio ha sido Modificado exitosamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

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
                <p>Por favor, seleccione un servicio antes de continuar con la accion.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

       <asp:UpdatePanel ID="UpdatePanelCrearServicio" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <div class="row g-3" style="margin-left: 20px; margin-right: 20px;">
                    <div class="col-md-6">
                        <label for="inputNombre" class="form-label">Nombre del Servicio</label>
                        <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="rfvNombre" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputNombre" runat="server" ValidationGroup="CrearServicioValidation" />
                    </div>
                    <div class="col-md-6">
                        <label for="inputDescripcion" class="form-label">Descripción</label>
                        <asp:TextBox ID="inputDescripcion" runat="server" CssClass="form-control" MaxLength="100" />
                        <asp:RequiredFieldValidator ID="rfvDescripcion" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputDescripcion" runat="server" ValidationGroup="CrearServicioValidation" />
                    </div>
                    <div class="col-md-6">
                        <label for="inputDuracion" class="form-label">Duración (minutos)</label>
                        <asp:TextBox ID="inputDuracion" runat="server" CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvDuracion" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputDuracion" runat="server" ValidationGroup="CrearServicioValidation" />
                        <asp:RangeValidator ID="rvDuracion" MinimumValue="1" MaximumValue="600" Type="Integer" ErrorMessage="* Se debe ingresar un número entero entre 1 y 600" ForeColor="Red" ControlToValidate="inputDuracion" runat="server" ValidationGroup="CrearServicioValidation" />
                    </div>
                    <div class="col-md-6">
                        <label for="inputPrecio" class="form-label">Precio</label>
                        <asp:TextBox ID="inputPrecio" runat="server" CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvPrecio" ErrorMessage="* Campo obligatorio" ForeColor="Red" ControlToValidate="inputPrecio" runat="server" ValidationGroup="CrearServicioValidation" />
                        <asp:RangeValidator ID="rvPrecio" MinimumValue="1" MaximumValue="999999" Type="Integer" ErrorMessage="* Se debe ingresar un número entero entre 1 y 999999" ForeColor="Red" ControlToValidate="inputPrecio" runat="server" ValidationGroup="CrearServicioValidation" />
                    </div>
                    <div class="col-12">
                        <asp:Button ID="btnCrearServicio" runat="server" CssClass="btn btn-primary" Text="Crear Servicio" OnClick="btnCrearServicio_Click" ValidationGroup="CrearServicioValidation" />
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnCrearServicio" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

                <asp:Table ID="Table1" runat="server" CellPadding="10" GridLines="Both" BorderStyle="None" CellSpacing="50" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell Width="800px" Height="200px" HorizontalAlign="Center">
                            <h2>Modificar Servicios</h2>
                            <div style="margin-top: 50px">
                                <asp:DropDownList ID="ModificarDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ModificarDropDownList_SelectedIndexChanged" />
                            </div>
                            <div style="margin-top: 50px">
                                <div class="row g-3" style="margin-left: 20px; margin-right: 20px;">
                                    <div class="col-md-6">
                                        <label for="inputNombreModificar" class="form-label">Nombre del Servicio</label>
                                        <asp:TextBox ID="inputNombreModificar" runat="server" CssClass="form-control" MaxLength="50" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputDescripcionModificar" class="form-label">Descripción</label>
                                        <asp:TextBox ID="inputDescripcionModificar" runat="server" CssClass="form-control" MaxLength="100" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputDuracionModificar" class="form-label">Duración (minutos)</label>
                                        <asp:TextBox ID="inputDuracionModificar" runat="server" CssClass="form-control" TextMode="Number" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputPrecioModificar" class="form-label">Precio</label>
                                        <asp:TextBox ID="inputPrecioModificar" runat="server" CssClass="form-control" TextMode="Number" />
                                    </div>
                                    <div class="col-12">
                                        <asp:Button ID="btnModificarServicio" runat="server" CssClass="btn btn-primary" Text="Modificar Servicio" OnClick="btnModificarServicio_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell Width="800px" Height="200px" HorizontalAlign="Center">
                            <h2>Eliminar Servicios</h2>
                            <div style="margin-top: 50px">
                                <asp:DropDownList ID="EliminarDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="EliminarDropDownList_SelectedIndexChanged" />
                            </div>
                            <div style="margin-top: 50px">
                                <div class="row g-3" style="margin-left: 20px; margin-right: 20px;">
                                    <div class="col-md-6">
                                        <label for="inputNombreEliminar" class="form-label">Nombre del Servicio</label>
                                        <asp:TextBox ID="inputNombreEliminar" runat="server" CssClass="form-control" MaxLength="50" ReadOnly="True" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputDescripcionEliminar" class="form-label">Descripción</label>
                                        <asp:TextBox ID="inputDescripcionEliminar" runat="server" CssClass="form-control" MaxLength="100" ReadOnly="True" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputDuracionEliminar" class="form-label">Duración (minutos)</label>
                                        <asp:TextBox ID="inputDuracionEliminar" runat="server" CssClass="form-control" TextMode="Number" ReadOnly="True" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputPrecioEliminar" class="form-label">Precio</label>
                                        <asp:TextBox ID="inputPrecioEliminar" runat="server" CssClass="form-control" TextMode="Number" ReadOnly="True" />
                                    </div>
                                    <div class="col-12">
                                        <asp:Button ID="btnEliminarServicio" runat="server" CssClass="btn btn-danger" Text="Eliminar Servicio" OnClick="btnEliminarServicio_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            
     

    </main>

    <script>
        function abrirModalServicioAgregado() {
            var myModal = new bootstrap.Modal(document.getElementById('successModal'), {
                keyboard: false
            });
            myModal.show();
        }
        function Eliminadoexitosamente() {
            var myModal = new bootstrap.Modal(document.getElementById('Eliminadoexitoso'), {
                keyboard: false
            });
            myModal.show();
        }
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
