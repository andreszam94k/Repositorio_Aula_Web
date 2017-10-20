<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Inicio.aspx.cs" Inherits="Presentacion_Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
        color: #CCCCCC;
            text-align: center;
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
    <h1 class="auto-style15">
        <asp:Label ID="L_MI_1" runat="server"></asp:Label>
    </h1>
    <h2 class="auto-style17">
        <asp:Label ID="L_MI_2" runat="server"></asp:Label>
    </h2>
    <p class="auto-style18">
        <asp:Label ID="L_MI_3" runat="server"></asp:Label>
    </p>
    <p class="auto-style15">
    <asp:Image ID="Img_portada" runat="server" ImageAlign="Middle" ImageUrl="~/Imagenes/portada.png" style="text-align: center" />
    </p>
    <p class="auto-style15"><span class="auto-style19">
        <asp:Label ID="L_MI_4" runat="server"></asp:Label>
        </span></p>
    <h3 style="color: #CCCCCC" class="auto-style3">&nbsp;<asp:Label ID="L_MI_5" runat="server"></asp:Label>
    </h3>
    <br />
</asp:Content>

