<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ModificarServicios.aspx.cs" Inherits="TPC_WebForm_Equipo18.ABM_SERVICIO.ModificarServicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main>

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

    
            <h1  style="margin-top: 30px" >Modificar Servicios</h1>


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
      

    </main>

    <script>  
        function modificadoexitosamente() {
            var myModal = new bootstrap.Modal(document.getElementById('ModificadoExitosamente'), {
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


    </script>

</asp:Content>
