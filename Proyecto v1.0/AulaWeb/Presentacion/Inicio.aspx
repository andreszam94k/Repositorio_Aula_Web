<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Inicio.aspx.cs" Inherits="Presentacion_Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
        color: #CCCCCC;
            text-align: center;
        }
        .auto-style16 {
            color: #990000;
            font-size: large;
        }
        .auto-style17 {
            color: #CCCCCC;
            text-align: center;
        }
        .auto-style18 {
            color: #CCCCCC;
            text-align: center;
            font-size: large;
        }
        .auto-style19 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style15">Pagina Inicio</h1>
    <h2 class="auto-style17">BIENVENIDO AL AULA DE INVESTIGACION WEB</h2>
    <p class="auto-style18">La pagina esta dedicada especialmente al uso de contenido compartido, y orientada a la intelegiencia colectiva entre sus usuarios.</p>
    <p class="auto-style15">
    <asp:Image ID="Img_portada" runat="server" ImageAlign="Middle" ImageUrl="~/Imagenes/portada.png" style="text-align: center" />
    </p>
    <p class="auto-style15"><span class="auto-style16">Explora nuestro sitio</span><span class="auto-style19">, en el encontraras gran variedad de archivos que han sido recopilados por el grupo de trabajo de la pagina, ademas de ser alimentado por los mismos usuarios del sistema, lo cual lo hace un sitio ideal si deseas encontrar o compartir informacion. Aqui encontraras contenido util y a tu alcance con solo un click...</span></p>
    <h3 style="color: #CCCCCC" class="auto-style3">&nbsp;¡¡ QUE ESPERAS, AYUDANOS A HACER MAS GRANDE NUESTRA WEB !!</h3>
    <br />
</asp:Content>

