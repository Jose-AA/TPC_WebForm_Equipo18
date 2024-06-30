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
            height: 600px; /*Con esto estoy definiendo el tamaño que quiero que tenga la 
                            tabla, tipo la cantidad de registros que se visualizan, el resto
                            está abajo con la barrita deslizadoora 
                            */
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
        .btn{
            border-color: black;
        }
        btn:hover{
            border-color: black;
        }
        .selected-row {
            background-color: #015249;
            color: white;
        }
    </style>


    

    <div class="actions">
        <label for="dniFilter">Buscar por DNI:</label>
        <asp:TextBox ID="dniFilter" runat="server" CssClass="form-control" placeholder="Ingrese DNI" OnKeyUp="filterByDNI()" />
        <asp:Button ID="btnAgregarCliente" runat="server" Text="Agregar Cliente" CssClass="btn btn-success" OnClick="btnAgregarCliente_Click"/>
        <asp:Button ID="btnModificarCliente" runat="server" Text="Modificar Cliente" CssClass="btn btn-warning" OnClick="btnModificarCliente_Click" />
        <asp:Button ID="btnEliminarCliente" runat="server" Text="Eliminar Cliente" CssClass="btn btn-danger" OnClick="btnEliminarCliente_Click"/>
        <asp:Button ID="btnVerTurnos" runat="server" Text="Turnos" CssClass="btn btn-info" OnClick="btnVerTurnos_Click" />
        <asp:Button ID="btnVerHistorial" runat="server" Text="Historial" CssClass="btn btn-info" OnClick="btnVerHistorial_Click" />
        <asp:Button ID="btnBlanqueo" runat="server" Text="Blanquear contraseña" CssClass="btn btn-info" OnClick="btnBlanqueo_Click" />
        
    </div>
    <div class="grid-container">
        <div class="grid-scroll">
           
            <asp:GridView runat="server" ID="gridUsuarios" DataKeyNames="IdUsuario" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" CssClass="table table-success table-striped" AutoGenerateColumns="false" OnRowDataBound="gridUsuarios_RowDataBound">
          
                <Columns>
                    <asp:BoundField HeaderText="Nombres" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                    <asp:BoundField HeaderText="DNI" DataField="Dni" />
                    <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                    <asp:BoundField HeaderText="Direccion" DataField="Direccion" />
                    <asp:BoundField HeaderText="Fecha de nacimiento" DataField="FechaNacimiento" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
<script>
    function filterByDNI() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById('<%= dniFilter.ClientID %>');
        filter = input.value.toUpperCase();
        table = document.getElementById('<%= gridUsuarios.ClientID %>');
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2]; 
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
</script>

</asp:Content>
