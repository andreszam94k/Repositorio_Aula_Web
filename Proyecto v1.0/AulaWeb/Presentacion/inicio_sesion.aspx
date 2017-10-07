<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/inicio_sesion.aspx.cs" Inherits="Presentacion_inicio_sesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style15 {
        color: #CCCCCC;
    }
        .auto-style16 {
            width: 50%;
        text-align: right;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style15">
        <asp:Label ID="L_MIS_1" runat="server">aaa</asp:Label>
    </h1>
<h2 style="text-align: center">&nbsp;<asp:Label ID="L_MIS_2" runat="server" style="color: #CCCCCC">aaa</asp:Label>
    <asp:HyperLink ID="HL_CrearUser" runat="server" NavigateUrl="~/Presentacion/Registrar_usuario.aspx" style="color: #CC0000">aaa</asp:HyperLink>
</h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RFV_usuario" runat="server" ControlToValidate="TB_inicio_usuario" style="color: #FF6600; font-size: large" ValidationGroup="B_iniciarSession" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_inicio_usuario" runat="server" CssClass="auto-style15" style="font-size: x-large">aaa</asp:Label>
            </td>
            <td>
        <asp:TextBox ID="TB_inicio_usuario" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REV_usuario" runat="server" ControlToValidate="TB_inicio_usuario" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890a-zA-Z_]*$" ValidationGroup="B_iniciarSession" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RFV_contraseña" runat="server" ControlToValidate="TB_inicio_clave" style="color: #FF6600; font-size: large" ValidationGroup="B_iniciarSession" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_inicio_clave" runat="server" CssClass="auto-style15" style="font-size: x-large">aaa</asp:Label>
            </td>
            <td>
        <asp:TextBox ID="TB_inicio_clave" runat="server" style="font-size: medium" MaxLength="30" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REV_contraseña" runat="server" ControlToValidate="TB_inicio_clave" style="font-size: large; color: #FF6600" ValidationExpression="^[1234567890a-zA-Z_]*$" ValidationGroup="B_iniciarSession" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <p style="text-align: center">
        <asp:Button ID="B_iniciarSession" runat="server" style="font-size: medium" OnClick="B_iniciarSession_Click" ValidationGroup="B_iniciarSession" Text="aaa" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="B_cancelarSession" runat="server" style="font-size: medium" OnClick="B_cancelarSession_Click" Text="aaa" />
</p>
<p style="text-align: center">&nbsp;</p>
</asp:Content>

