<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Normas.aspx.cs" Inherits="Presentacion_Normas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style15 {
        color: #CCCCCC;
    }
    .auto-style16 {
        font-size: large;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style15">
        <asp:Label ID="L_MN_1" runat="server" Text="label"></asp:Label>
    </h1>
<h2 style="color: #CCCCCC; text-align: center">
    <asp:Label ID="L_MN_2" runat="server" Text="label"></asp:Label>
    </h2>
<ul>
    <li>
        <p style="color: #CCCCCC; font-size: large">
            <asp:Label ID="L_MN_3" runat="server" Text="label"></asp:Label>
        </p>
    </li>
    <li>
        <p style="color: #CCCCCC; font-size: large">
            <asp:Label ID="L_MN_4" runat="server" Text="label"></asp:Label>
        </p>
    </li>
    <li>
        <p style="color: #CCCCCC; font-size: large">
            <asp:Label ID="L_MN_5" runat="server" Text="label"></asp:Label>
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            &nbsp;<asp:Label ID="L_MN_6" runat="server" Text="Label"></asp:Label>
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            <asp:Label ID="L_MN_7" runat="server" Text="Label"></asp:Label>
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            <asp:Label ID="L_MN_8" runat="server" Text="Label"></asp:Label>
        </p>
    </li>
</ul>
<h2 style="text-align: center; color: #CCCCCC">
    <asp:Label ID="L_MN_9" runat="server" Text="Label"></asp:Label>
    </h2>
<ul>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            <asp:Label ID="L_MN_10" runat="server" Text="Label"></asp:Label>
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            <asp:Label ID="L_MN_11" runat="server" Text="Label"></asp:Label>
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            <asp:Label ID="L_MN_12" runat="server" Text="Label"></asp:Label>
        </p>
    </li>
    <li>
        <p class="auto-style16" style="color: #CCCCCC">
            <asp:Label ID="L_MN_13" runat="server" Text="Label"></asp:Label>
&nbsp;
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

