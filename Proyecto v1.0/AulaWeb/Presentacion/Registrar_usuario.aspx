<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Registrar_usuario.aspx.cs" Inherits="Presentacion_Registrar_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 50%;
            text-align: right;
        }
        .auto-style16 {
            width: 50%;
            text-align: right;
            height: 32px;
        }
        .auto-style17 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MRU_1" runat="server">aaa</asp:Label>
    </h1>
    <h2 style="color: #CCCCCC; text-align: center;">
        <asp:Label ID="L_MRU_2" runat="server">aaa</asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16" style="text-align: right">
                <asp:RequiredFieldValidator ID="RFV_nombre" runat="server" ControlToValidate="TB_registro_nombre" style="color: #FF6600; font-size: large;" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="L_registro_nombre" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td class="auto-style17">
                <asp:TextBox ID="TB_registro_nombre" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="REV_nombre" runat="server" ControlToValidate="TB_registro_nombre" style="color: #FF6600; font-size: large" ValidationExpression="^[a-zA-Z]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_apellido" runat="server" ControlToValidate="TB_registro_apellido" style="font-size: large; color: #FF6600" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_registro_apellido" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_apellido" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_apellido" runat="server" ControlToValidate="TB_registro_apellido" style="color: #FF6600; font-size: large" ValidationExpression="^[a-zA-Z]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_documento" runat="server" ControlToValidate="TB_registro_documento" style="font-size: large; color: #FF6600" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_registro_documento" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_documento" runat="server" style="font-size: medium" MaxLength="10"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_documento" runat="server" ControlToValidate="TB_registro_documento" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_telefono" runat="server" ControlToValidate="TB_registro_telefono" style="color: #FF6600; font-size: large" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
                <asp:Label ID="L_registro_telefono" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_telefono" runat="server" style="font-size: medium" MaxLength="10"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_telefono" runat="server" ControlToValidate="TB_registro_telefono" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_correo" runat="server" ControlToValidate="TB_registro_correo" style="color: #FF6600; font-size: large" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_registro_correo" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_correo" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_correo" runat="server" ControlToValidate="TB_registro_correo" style="font-size: large; color: #FF6600" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_user" runat="server" ControlToValidate="TB_registro_user" style="color: #FF6600; font-size: large" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_registro_user" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_user" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_user" runat="server" ControlToValidate="TB_registro_user" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890a-zA-Z_]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_clave" runat="server" ControlToValidate="TB_registro_clave" style="color: #FF6600; font-size: large" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_registro_clave" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_clave" runat="server" style="font-size: medium" MaxLength="30" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_clave" runat="server" ControlToValidate="TB_registro_clave" style="font-size: large; color: #FF6600" ValidationExpression="^[1234567890a-zA-Z_]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_confirmar" runat="server" ControlToValidate="TB_registro_confirmar" style="font-size: large; color: #FF6600" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_registro_confirmar" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TB_registro_confirmar" runat="server" style="font-size: medium" MaxLength="30" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:CompareValidator ID="CV_confirmar" runat="server" ControlToCompare="TB_registro_clave" ControlToValidate="TB_registro_confirmar" style="font-size: large; color: #FF6600" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:CompareValidator>
&nbsp;<asp:RegularExpressionValidator ID="REV_confirmar" runat="server" ControlToValidate="TB_registro_confirmar" style="font-size: large; color: #FF6600" ValidationExpression="^[1234567890a-zA-Z_]*$" ValidationGroup="B_registrar" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td>
                <asp:CheckBox ID="CB_terminos" runat="server" style="font-size: large; color: #CCCCCC" Text="aaa" />
&nbsp;
                <asp:HyperLink ID="HL_terminos" runat="server" NavigateUrl="~/Presentacion/Normas.aspx" style="font-size: large; color: #CC0000" Target="_blank">aaa</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td>
                <asp:Button ID="B_registrar" runat="server" style="font-size: medium" OnClick="B_registrar_Click" ValidationGroup="B_registrar" Text="aaa" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

