<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarTurnosDisponibles.aspx.cs" Inherits="TPC_WebForm_Equipo18.Herramientas_Para_El_Especialista.RegistrarTurnosDisponibles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <main style="margin-top: 50px; margin-left: 350px; margin-right: 350px;">
    <h1 style="margin-top: 20px; margin-left: 20px; margin-right: 20px;">Registrar Turnos Disponibles</h1>

<div style="margin-top: 50px;" >

    <h5>Seleccione la fecha para la que desea registrar turnos disponibles :</h5></div>

<div style="margin-top: 25px;">
    <input type="date" id="fechaInput" onchange="mostrarFechaSeleccionada()">
</div>

     <table class="table" style="margin-top: 50px; justify-items: center;">
     <thead>
         <tr>
             <th scope="col">Fecha</th>
             <th scope="col">Desde</th>
             <th scope="col">Hasta</th>
             <th scope="col">Habilitar</th>
         </tr>
     </thead>
     <tbody id="turnosTableBody" class="table-group-divider">
         <tr>
             <td class="fecha">N/A</td>
             <td>8:00</td>
             <td>9:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault1">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>9:00</td>
             <td>10:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault2">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>10:00</td>
             <td>11:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault3">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>11:00</td>
             <td>12:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault4">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>12:00</td>
             <td>13:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault5">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>13:00</td>
             <td>14:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault6">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>14:00</td>
             <td>15:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault7">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>15:00</td>
             <td>16:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault8">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>16:00</td>
             <td>17:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault9">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>17:00</td>
             <td>18:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault10">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>18:00</td>
             <td>19:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault11">
                 </div>
             </td>
         </tr>
         <tr>
             <td class="fecha">N/A</td>
             <td>19:00</td>
             <td>20:00</td>
             <td>
                 <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault12">
                 </div>
             </td>
         </tr>
     </tbody>
 </table>

<script src="https://cdn.ulpgc.es/ulpgcds/1.0/js/jquery.ui/datepicker.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
    function mostrarFechaSeleccionada() {
        var fechaSeleccionada = document.getElementById("fechaInput").value;
        var fechaFormateada = moment(fechaSeleccionada).format('DD/MM/YYYY'); // Formato deseado, por ejemplo 'DD/MM/YYYY'
        $(".fecha").text(fechaFormateada);
    }
</script>

</main>

</asp:Content>


