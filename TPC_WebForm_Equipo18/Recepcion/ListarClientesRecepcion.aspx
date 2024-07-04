<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="ListarClientesRecepcion.aspx.cs" Inherits="TPC_WebForm_Equipo18.Recepcion.ListarClientesRecepcion" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
    .grid-container {
        width: 80%;
        margin: auto;
    }
    .grid-scroll {
        height: 600px;
        overflow-y: scroll;
    }
    .actions {
        margin-top: 50px;
        text-align: center;
        margin-bottom: 20px;
    }
    .actions label {
        margin-right: 10px;
    }
    .actions input[type="text"] {
        margin-right: 20px;
    }
    .form-control {
        width: 150px;
        display: inline-block;
    }
    .btn {
        border-color: black;
    }
    .btn:hover {
        border-color: black;
    }
   /* .selected-row {
        background-color: #015249;
        color: red;
        border-radius: 20%;
        width: 400%;
    }*/
    .selected-row .grid-card {
        background-color: #015249;
        color: white;
    }
    .grid-card {
        background-color: #57BC90;
        border: 2px solid #c3e6cb;
        border-radius: 20px;
        padding: 20px;
        margin: 10px 0;
        display: block;
        width: 100%;
        display: flex; /* Usa Flexbox */
        flex-wrap: wrap;
        z-index: 1000;
    }
    .grid-card h5 {
        margin: 0 10px 10px;
        
        
    }
    .grid-card p {
        margin: 0;
    }
</style>


    

   <div class="actions">
    <label for="dniFilter">Buscar por DNI:</label>
     <input type="text" id="dniFilter" class="form-control" placeholder="Ingrese DNI" onkeyup="filterByDNI()" />
    <asp:Button ID="btnAgregarCliente" runat="server" Text="Agregar Cliente" CssClass="btn btn-success" OnClick="btnAgregarCliente_Click"/>
    <asp:Button ID="btnModificarCliente" runat="server" Text="Modificar Cliente" CssClass="btn btn-warning" OnClick="btnModificarCliente_Click" />
    <!-- <asp:Button ID="btnEliminarCliente" runat="server" Text="Eliminar Cliente" CssClass="btn btn-danger" OnClick="btnEliminarCliente_Click"/> EL RECEPCIONISTA NO PUEDE ELIMINAR CLIENTES -->
    <asp:Button ID="btnVerTurnos" runat="server" Text="Turnos" CssClass="btn btn-info" OnClick="btnVerTurnos_Click" />
    <asp:Button ID="btnVerHistorial" runat="server" Text="Historial" CssClass="btn btn-info" OnClick="btnVerHistorial_Click" />
    <asp:Button ID="btnBlanqueo" runat="server" Text="Blanquear contraseña" CssClass="btn btn-info" OnClick="btnBlanqueo_Click" />
</div>

<div class="grid-container">
    <div class="grid-scroll">
        <asp:GridView runat="server" ID="gridUsuarios" DataKeyNames="IdUsuario" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" AutoGenerateColumns="false" OnRowDataBound="gridUsuarios_RowDataBound" ShowHeader="false" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="grid-card">
                            <h5><strong><%# Eval("Nombre") %> <%# Eval("Apellido") %></strong></h5>
                            <p><strong>DNI:</strong> <%# Eval("Dni") %></p>
                            <p><strong>Telefono:</strong> <%# Eval("Telefono") %></p>
                            <p><strong>Direccion:</strong> <%# Eval("Direccion") %></p>
                            <p><strong>Fecha de nacimiento:</strong> <%# Eval("FechaNacimiento") %></p>
                            <p><strong>Email:</strong> <%# Eval("Email") %></p>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>

<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">Confirmación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Está seguro que desea blanquear la contraseña?
            </div>
            <div class="modal-footer">
                
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="confirmBlanqueo()">Sí</button>
            </div>
        </div>
    </div>
</div>
<script>
    function filterByDNI() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById('dniFilter');
        filter = input.value.toUpperCase();
        table = document.getElementById('<%= gridUsuarios.ClientID %>');
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            var card = tr[i].getElementsByClassName("grid-card")[0];
            td = card.getElementsByTagName("p")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
    function showModal() {
        $('#confirmModal').modal('show');
    }

    function confirmBlanqueo() {
        $('#confirmModal').modal('hide');
        __doPostBack('<%= btnBlanqueo.ClientID %>', '');
    }
</script>


</asp:Content>
