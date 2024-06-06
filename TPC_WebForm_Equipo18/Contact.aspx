<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TPC_WebForm_Equipo18.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .principal {
            display: flex;
        }
        .primero, .segundo, .tercero{
            display:flex;
            flex: 1; /* Hace que todos los divs ocupen el mismo espacio */
            padding: 10px;
            border: 1px solid #000; /* Solo para visualizar los bordes */
            justify-content: center; /* Centra horizontalmente */
            align-items: center; /* Centra verticalmente */
            flex-direction: column;

        }
        .primero, .tercero{
            background-color: #f8d9ef;
            border-color: #f8d9ef;
        }
        .segundo{
            background-color:lightpink;
            border-color:lightpink;
        }
        #logo{
            width: 250px;
        }
        #loc{
            color: black;
        }
        #wha{
            border-radius: 10px;
            background-color: lawngreen;
            border-color: green;
            padding: 10px;
        }
        img{
            padding: 10px;
        }
    </style>

    <main>
        <div id="map">

        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3289.876047069637!2d-58.62676688800867!3d-34.45529424956341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bca48d22673f87%3A0x8775d1ae9173ba5c!2sSecretar%C3%ADa%20de%20Extensi%C3%B3n%20Universitaria%20U.T.N.%20F.R.G.P!5e0!3m2!1ses!2sar!4v1717710686701!5m2!1ses!2sar" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
         
       <div class="principal" ">
           <div class="primero">            
                <img id="logo" src="https://png.pngtree.com/png-clipart/20211116/original/pngtree-beauty-logo-png-image_6943906.png" alt="logo beauty" />
                <a id="beauty" href="#">
                    <h4 id="loc">Beauty</h4>
                </a>
           </div>

           <div class="segundo">
               <h4>Contacto</h4>
               <img src="FPF/Contacto/tel.png" />
               <img src="FPF/Contacto/mai.png" />
               <button id="wha">Whatsapp</button>
           </div>

           <div class="tercero">
               <h4>Donde estamos?</h4>    
               <img src="FPF/Contacto/ub.png" />
           </div>

       </div>
        
       
    </main>


</asp:Content>
