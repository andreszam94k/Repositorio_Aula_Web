<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Ingresar_idioma.aspx.cs" Inherits="Presentacion_Ingresar_idioma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            text-align: right;
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        <asp:Label ID="L_II_1" runat="server" style="color: #CCCCCC" Text="Label"></asp:Label>
    </h1>
    <h2 style="text-align: center">
        <asp:Label ID="L_II_2" runat="server" style="color: #CCCCCC" Text="Label"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_idioma" runat="server" ControlToValidate="TB_idioma" SetFocusOnError="True" style="font-size: large; color: #FF6600" ValidationGroup="B_ingresar_idioma"></asp:RequiredFieldValidator>
                <asp:Label ID="L_idioma" runat="server" Text="Label" style="font-size: x-large; color: #CCCCCC"></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_idioma" runat="server" style="font-size: medium"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="REV_idioma" runat="server" ControlToValidate="TB_idioma" SetFocusOnError="True" style="font-size: large; color: #FF6600" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="B_ingresar_idioma"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_terminacion" runat="server" ControlToValidate="TB_terminacion" SetFocusOnError="True" style="font-size: large; color: #FF6600" ValidationGroup="B_ingresar_idioma"></asp:RequiredFieldValidator>
                <asp:Label ID="L_terminacion" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_terminacion" runat="server" style="font-size: medium"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="REV_terminacion" runat="server" ControlToValidate="TB_terminacion" style="color: #FF6600; font-size: large" ValidationExpression="^[a-zA-Z ]*$" SetFocusOnError="True" ValidationGroup="B_ingresar_idioma"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;&nbsp;<asp:Button ID="B_ingresar_idioma" runat="server" OnClick="B_ingresar_idioma_Click" Text="Button" style="font-size: medium" ValidationGroup="B_ingresar_idioma" />
            </td>
        </tr>
    </table>
</asp:Content>

