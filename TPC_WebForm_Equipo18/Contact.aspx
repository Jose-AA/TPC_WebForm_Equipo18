<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TPC_WebForm_Equipo18.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body{
            background-color: #77C9D4;
        }
        .principal {
            display: flex;
        }
        .primero, .segundo, .tercero{
            display:flex;
            flex: 1; 
            padding: 10px;
            border: 1px solid #000; 
            justify-content: center; 
            align-items: center; 
            flex-direction: column;

        }
        .primero, .tercero{
            background-color: #57BC90;
            border-color: #57BC90;
        }
        .segundo{
            background-color: #015249;
            border-color: #015249;
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
        @media (max-width: 900px) {
    .principal {
        flex-direction: column;
    }
}
    
        .contact-form {
            background-color: #57BC90;
            border: 2px solid #015249;
            border-radius: 15px;
            padding: 20px;
            max-width: 500px;
            margin: 50px auto;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .contact-form h2 {
             margin-top: 0;
             color: #015249;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #015249;
}
       

        @media (max-width: 600px) {
            .contact-form {
                padding: 15px;
            }
        }


    </style>

    <main>
         <div id="form1" runat="server">
        <div class="contact-form">
            <h2>Contacto</h2>
            <div class="form-group">
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtTelefono">Teléfono:</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtComentario">Comentario:</label>
                <asp:TextBox ID="txtComentario" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
            </div>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn" style="background-color:#015249; color:#fff " />
        </div>
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
               
               <img src="FPF/Contacto/ub.png" />
               <div id="map">

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3289.876047069637!2d-58.62676688800867!3d-34.45529424956341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bca48d22673f87%3A0x8775d1ae9173ba5c!2sSecretar%C3%ADa%20de%20Extensi%C3%B3n%20Universitaria%20U.T.N.%20F.R.G.P!5e0!3m2!1ses!2sar!4v1717710686701!5m2!1ses!2sar" width="300" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>
           </div>

       </div>
        
       
    </main>


</asp:Content>
