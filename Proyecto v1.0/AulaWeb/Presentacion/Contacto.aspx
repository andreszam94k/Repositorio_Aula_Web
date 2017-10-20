<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Contacto.aspx.cs" Inherits="Presentacion_Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style15 {
        color: #CCCCCC;
    }
    .auto-style16 {
        text-decoration: underline;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style15">
        <asp:Label ID="L_MC_1" runat="server"></asp:Label>
    </h1>
    <table align="center" class="auto-style2" style="border-color: #000000; color: #CCCCCC; font-size: large" border="0">
        <tr>
            <td style="text-align: center">
                <h2>
                    <asp:Label ID="L_MC_2" runat="server"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <p>
                    Andres Felipe Zambrano Romero<br />
                    Ingenieria de sistemas<br />
                    Universidad de cundinamrca</p>
            </td>
        </tr>
        <tr>
            <td>
                <h2 style="text-align: center">
                    <asp:Label ID="L_MC_3" runat="server"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="text-align: center">
                <p>
                    <a href="mailto:mercenary94k@hotmail.com" style="color: #CCCCCC">mercenary94k@hotmail.com</a></p>
            </td>
        </tr>
        <tr>
            <td>
                <h2 style="text-align: center">&nbsp;<asp:Label ID="L_MC_4" runat="server"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <p>
                    Calle falsa 123 #1 A 0 2 sur</p>
            </td>
        </tr>
        <tr>
            <td>
                <h2 style="text-align: center">
                    <asp:Label ID="L_MC_5" runat="server"></asp:Label>
                </h2>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <p>
                    CEL-PHONE: 3111111111<br />
                    FIJO: 8255555<br />
                    FAX: 1-8732554</p>
            </td>
        </tr>
</table>
    <br />
</asp:Content>

