<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="SolicitarTurno.aspx.cs" Inherits="TPC_WebForm_Equipo18.SolicitarTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        body{
            background-color: white !important;
        }

        .available-times {
            display: none; /* Los horarios permanecen escondidos por defecto */
            max-width: 400px; /* Para ajustar el tamaño de los horarios */
            margin: 0 auto; /* Para centrar horizontalmente los horarios */
            text-align: center;
            padding: 10px;
        }

        .available-times.show {
            display: block; /* Muestra los horarios cuando una fecha es seleccionada */
        }

        .available-times .time-slot {
            display: none; /* Por defecto esconde todos los slots de tiempo */
            margin: 10px auto;
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            max-width: 300px;
        }

        .available-times .time-slot.show {
            display: block; /* Muestra todos los slots de tiempo */
        }

        .available-times .time-slot:hover,
        .available-times .time-slot.selected {
            background-color: #f2f2f2;
        }


        /* Estilos del calendario */
        .calendar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; 
        }

        .calendar-container table {
            width: 80%; /* Para agrandar el calendario */
            border-collapse: collapse;
        }

        .calendar-container th,
        .calendar-container td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd; /* Para crear efecto separador entre fechas */
        }

        .calendar-container th {
            background-color: #f2f2f2;
        }



    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="calendar-container">
                <asp:Calendar ID="calendarioTurnos" runat="server" OnSelectionChanged="calendarioTurnos_SelectionChanged" OnDayRender="calendarioTurnos_DayRender"></asp:Calendar>
            </div>
            <div id="available-times" class="available-times">
                <h3>Horas de inicio disponibles</h3>
                <div id="time-slots-container"></div>
            </div>


    <div id="successModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSeleccionEliminarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalconfirmacion">Confirmación turno</h5>
                </div>
                <div class="modal-body">
                    <p>¿Desea confirmar el siguiente turno?</p>
                    <asp:Label ID="lblIDTurno" Text="" runat="server" />
                    <br />
                    <asp:Label ID="lblNombreEspecialista" Text="" runat="server" />
                    <br />
                    <asp:Label ID="lblNombreServicio" Text="" runat="server" />
                    <br />
                    <asp:Label ID="lblFechaHoraTurno" Text="" runat="server" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button Text="Aceptar" CssClass="btn btn-success" ID="btnConfirmarTurno" OnClick="btnConfirmarTurno_Click" runat="server" />
                    <asp:Button Text="Cancelar" ID="btnNoConfirmarTurno" 
                        OnClientClick="var myModalEl = document.getElementById('successModal');
                                        var modal = bootstrap.Modal.getInstance(myModalEl);
                                        modal.hide(); return false;" runat="server" CssClass="btn btn-primary" />
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


    <div id="turnoExitoso" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSeleccionEliminarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblTurnoExitoso">¡Turno agendado exitosamente!</h5>
                </div>
                <div class="modal-body">
                    <p>Muchas gracias por elegir nuestros servicios</p>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>



    <asp:HiddenField ID="hiddenFieldHoraTurno" runat="server" />
    <asp:HiddenField ID="hiddenFieldIdTurno" runat="server" />


    <script>

        document.addEventListener("click", function (event) {
            if (event.target.classList.contains('time-slot')) {
                var turnoId = event.target.getAttribute('data-id');
                var horaTurno = event.target.getAttribute('data-time');
                document.getElementById('<%= hiddenFieldIdTurno.ClientID %>').value = turnoId;
                document.getElementById('<%= hiddenFieldHoraTurno.ClientID %>').value = horaTurno;
                showModal();
            }
        });


        function modalTurnoExitoso() {
            var myModal = new bootstrap.Modal(document.getElementById('turnoExitoso'), {
                keyboard: false
            });

            myModal.show();


            setTimeout(() => {

                window.location.href = "/Default.aspx";

            }, "3000")

        }
        


        function showModal() {
            var myModal = new bootstrap.Modal(document.getElementById('successModal'), {
                keyboard: false
            });

            var especialista = "Especialista: <%= especialistaSeleccionado.Apellido %>, <%= especialistaSeleccionado.Nombre %>";
            var servicio = "Servicio: <%= servicioSeleccionado.Nombre %>";
            var fecha = "Turno: <%= calendarioTurnos.SelectedDate.ToShortDateString() %>";
            //var idTurno = document.getElementById('<%= hiddenFieldIdTurno.ClientID %>').value;
            var hora = document.getElementById('<%= hiddenFieldHoraTurno.ClientID %>').value;

            var horaDesde = parseInt(hora);
            horaDesde = horaDesde + ":00";

            var horaHasta = parseInt(hora) + 1;
            horaHasta = horaHasta + ":00";

            hora = horaDesde + " - " + horaHasta; 

            //document.getElementById('<%= lblIDTurno.ClientID %>').textContent = idTurno;
            document.getElementById('<%= lblNombreEspecialista.ClientID %>').textContent = especialista;
            document.getElementById('<%= lblNombreServicio.ClientID %>').textContent = servicio;
            document.getElementById('<%= lblFechaHoraTurno.ClientID %>').textContent = fecha + " " + hora;


            myModal.show();
        }


    </script>


</asp:Content>
