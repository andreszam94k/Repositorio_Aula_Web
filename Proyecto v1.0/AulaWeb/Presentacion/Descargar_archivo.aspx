<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Descargar_archivo.aspx.cs" Inherits="Presentacion_Descargar_archivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">Formulario descargar archivo</h1>
    <table align="center" class="auto-style2">
        <tr>
            <td style="text-align: center">
                <asp:Image ID="Image1_archivo" runat="server" Height="160px" Width="160px" />
                <br />
                <asp:Label ID="L_nombre_archivo" runat="server" style="color: #CCCCCC; font-weight: 700; font-size: x-large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <asp:Label ID="Label2" runat="server" style="color: #CCCCCC; font-size: x-large; font-weight: 700;" Text="Autor/es: "></asp:Label>
&nbsp;<asp:Label ID="L_autor_archivo" runat="server" style="font-size: x-large; font-style: italic; color: #00CC99;"></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server" style="color: #CCCCCC; font-size: x-large; font-weight: 700;" Text="Año de publicacion: "></asp:Label>
&nbsp;<asp:Label ID="L_fecha_archivo" runat="server" style="font-size: x-large; color: #999999; font-weight: 700;"></asp:Label>
&nbsp;
                <asp:Label ID="Label4" runat="server" style="color: #CCCCCC; font-size: x-large; font-weight: 700;" Text="# Paginas: "></asp:Label>
                <asp:Label ID="L_paginas_archivo" runat="server" style="font-size: x-large; color: #999999; font-weight: 700;"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" style="font-size: x-large; color: #CCCCCC; font-weight: 700;" Text="Categoria: "></asp:Label>
                <asp:Label ID="L_categoria_archivo" runat="server" style="font-size: x-large; color: #999999; font-weight: 700;"></asp:Label>
&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" style="font-size: x-large; color: #CCCCCC; font-weight: 700;" Text="Precio: "></asp:Label>
&nbsp;<asp:Label ID="L_precio_archivo" runat="server" style="color: #009933; font-size: x-large; font-weight: 700;"></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" style="color: #CCCCCC; font-size: x-large; font-weight: 700;" Text="Sinopsis"></asp:Label>
                <br />
                <asp:TextBox ID="TB_sinopsis_archivo" runat="server" Enabled="False" Height="80px" style="font-size: large" TextMode="MultiLine" Width="500px"></asp:TextBox>
                <br />
                <asp:Label ID="Label7" runat="server" style="font-size: x-large; color: #CCCCCC; font-weight: 700;" Text="Tags: "></asp:Label>
&nbsp;<asp:Label ID="L_tags_archivo" runat="server" style="font-style: italic; font-size: x-large; color: #00CC99;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:ImageButton ID="IB_descargar_archivo" runat="server" Height="60px" ImageUrl="~/Imagenes/Download-1.png" OnClientClick="return confirm (&quot;Recuerde que si descarga el archivo se descontara el dinero de su cuenta, ¿Desea descargar el archivo?&quot;);" Width="200px" OnClick="IB_descargar_archivo_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <asp:GridView ID="GV_comentarios" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" style="background-color: #999999" Width="597px">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("IdComentario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="COMENTARIOS">
                            <ItemTemplate>
                                <table class="auto-style2">
                                    <tr>
                                        <td class="auto-style15" style="color: #FFFFFF; background-color: #333333">
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Usuario") %>' style="color: #CCCCCC; font-size: large;"></asp:Label>
                                        </td>
                                        <td style="background-color: #666666">
                                            <asp:Label ID="Label9" runat="server" style="color: #FFFF00; font-size: large;" Text='<%# Bind("Fecha") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="background-color: #999999">
                                            <asp:TextBox ID="TextBox2" runat="server" Height="50px" style="color: #669999; background-color: #333333; font-size: large;" TextMode="MultiLine" Width="90%" Enabled="False" Text='<%# Bind("Comentario") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <asp:RequiredFieldValidator ID="RFV_comentario_archivo" runat="server" ControlToValidate="TB_comentario" ErrorMessage="Digite comentario " style="color: #FF6600; font-size: large" ValidationGroup="B_comentar"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TB_comentario" runat="server" Height="93px" style="font-size: medium" TextMode="MultiLine" Width="405px" MaxLength="200"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="REV_comentario_archivo" runat="server" ControlToValidate="TB_comentario" ErrorMessage="* Caracter invalido" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890a-zA-Z ]*$" ValidationGroup="B_comentar"></asp:RegularExpressionValidator>
                <br />
                <asp:Button ID="B_comentar" runat="server" style="color: #CCCCCC; font-size: medium; background-color: #660066" Text="COMENTAR" OnClick="B_comentar_Click" ValidationGroup="B_comentar" />
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>

