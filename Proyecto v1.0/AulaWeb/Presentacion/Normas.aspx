<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Normas.aspx.cs" Inherits="Presentacion_Normas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style15 {
        color: #CCCCCC;
    }
    .auto-style16 {
        font-size: large;
    }
        .auto-style17 {
            color: #FFCC00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style15">Normas del sitio</h1>
<h2 style="color: #CCCCCC; text-align: center">Terminos y Condiciones</h2>
<ul>
    <li>
        <p style="color: #CCCCCC; font-size: large">
            El usuario ó visitante de la página web tienen la obligación de leer las condiciones de prestación del servicio que se detallan en este texto, de manera que asume éstas como válidas en la prestación del servicio.</p>
    </li>
    <li>
        <p style="color: #CCCCCC; font-size: large">
            En esta página web no se recoge ningún tipo de información privada del visitante. únicamente se recogen datos, puntualmente, para registrar el usuario y para el buen funcionamiento del sistema.
        </p>
    </li>
    <li>
        <p style="color: #CCCCCC; font-size: large">
            El autor de esta web no se hace responsable del mal uso que se haga del contenido expuesto en esta página web.</p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            En esta página web NO existen contenidos ilegales (pornografía infantil, apología del terrorismo, o cualquier otro tipo de contenido ilegal).
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            La página web no es responsable de las opiniones vertidas en los comentarios, y es responsabilidad total de los usuarios del sistema.</p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
&nbsp;La administracion de la página se reserva el derecho cancelar, borrar o eliminar el acceso a algún usuario que incumpla cualquier regla legal y/o moral.
        </p>
    </li>
</ul>
<h2 style="text-align: center; color: #CCCCCC">Sobre el registro</h2>
<ul>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            El nombre de usuario es único e inmodificable.</p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            Cada usuario al registrarse recibe un <span class="auto-style17">dinero base de $500</span> en su cuenta, para que pueda realizar transacciones en la pagina, si este se le agota o desea tener mas dinero debe participar subiendo archivos a la plataforma.</p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            La página web no es responsable del robo de cuentas por descuidos, cada usuario es responsable de proteger su cuenta eligiendo una contraseña segura, email personal y sin dejar cuentas abiertas en lugares de acceso público.</p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            Los usuarios, al registrarse, aceptan estos terminos de uso junto a las
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Presentacion/Reglas.aspx" style="font-weight: 700; color: #CC0000">Reglas del sitio.</asp:HyperLink>
        </p>
    </li>
</ul>
<p class="auto-style16" style="color: #CCCCCC; text-align: center">
    <asp:Button ID="B_normas" runat="server" OnClick="B_normas_Click" style="font-size: medium" Text="ACEPTAR" />
</p>
<p class="auto-style16" style="color: #CCCCCC; text-align: center">
    &nbsp;</p>
</asp:Content>

