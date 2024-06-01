<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarServicio.aspx.cs" Inherits="TPC_WebForm_Equipo18.Formularios_de_Registro_de_Informacion.RegistrarServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    
    <header style="margin-top: 20px; margin-left: 20px; margin-right: 20px;" > 
        <h1>Crear Servicio</h1>

    </header>
  <main >

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

 <!--  -----  MODAL DE CONFIRMACION ---->


        <div class="row g-3" styles="margin-left: 20px; margin-right: 20px;" >
            <div class="col-md-6">
                <label for="inputNombre" class="form-label">Nombre del Servicio</label>
                <asp:TextBox ID="inputNombre" runat="server" CssClass="form-control" MaxLength="50" />
            </div>
            <div class="col-md-6">
                <label for="inputDescripcion" class="form-label">Descripción</label>
                <asp:TextBox ID="inputDescripcion" runat="server" CssClass="form-control" MaxLength="100" />
            </div>
            <div class="col-md-6">
                <label for="inputDuracion" class="form-label">Duración (minutos)</label>
                <asp:TextBox ID="inputDuracion" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="col-md-6">
                <label for="inputPrecio" class="form-label">Precio</label>
                <asp:TextBox ID="inputPrecio" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="col-12">
                <asp:Button ID="btnCrearServicio" runat="server" CssClass="btn btn-primary" Text="Crear Servicio" OnClick="btnCrearServicio_Click" />
            </div>
        </div>
    </main>

    <script>
    function abrirModalServicioAgregado() {
        var myModal = new bootstrap.Modal(document.getElementById('successModal'), {
            keyboard: false
        });
        myModal.show();
    }
    </script>

</asp:Content>
