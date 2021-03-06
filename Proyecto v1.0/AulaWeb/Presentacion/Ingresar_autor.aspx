﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Ingresar_autor.aspx.cs" Inherits="Presentacion_Ingresar_autor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 10%;
        }
        .auto-style17 {
            width: 40%;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MIA_1" runat="server" Text="Label"></asp:Label>
    </h1>
    <h2 style="color: #CCCCCC; text-align: center;">
        <asp:Label ID="L_MIA_2" runat="server" Text="Label"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                &nbsp;<asp:RequiredFieldValidator ID="RFV_nombre_autor" runat="server" ControlToValidate="TB_autor_nombre" ErrorMessage="Completar campo " style="font-size: large; color: #FF6600" ValidationGroup="B_ingresar_autor" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_autor_nombre" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Nombre: "></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_autor_nombre" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_nombre_autor" runat="server" ControlToValidate="TB_autor_nombre" ErrorMessage="* Caracter invalido" style="color: #FF6600; font-size: large" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="B_ingresar_autor" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RFV_nacimiento_autor" runat="server" ControlToValidate="TB_autor_birth" ErrorMessage="Completar campo " style="font-size: large; color: #FF6600" ValidationGroup="B_ingresar_autor" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_autor_birth" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Fecha nacimiento:"></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_autor_birth" runat="server" style="font-size: medium" TextMode="Date" MaxLength="30"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                <asp:Label ID="L_autor_death" runat="server" style="color: #CCCCCC; font-size: x-large" Text="Fecha muerte: "></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_autor_death" runat="server" style="font-size: medium" TextMode="Date" MaxLength="30"></asp:TextBox>
&nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" style="font-size: large; color: #CCCCCC" Text="N/A" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                <asp:Label ID="L_autor_nacionalidad" runat="server" style="color: #CCCCCC; font-size: x-large" Text="Pais de origen: "></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:DropDownList ID="DDL_autor_nacionalidad" runat="server" DataSourceID="EntityDataSource1" DataTextField="pais1" DataValueField="id_nacionalidad" style="font-size: medium">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrar_pais" TypeName="Data.Dao_Ingresar_autor"></asp:ObjectDataSource>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=Aula_Web_SQLEntities" DefaultContainerName="Aula_Web_SQLEntities" EnableFlattening="False" EntitySetName="pais" Select="it.[id_nacionalidad], it.[pais1]">
                </asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                &nbsp;<asp:RequiredFieldValidator ID="RFV_descripcion_autor" runat="server" ControlToValidate="TB_autor_descripcion" ErrorMessage="Completar campo " style="color: #FF6600; font-size: large" ValidationGroup="B_ingresar_autor" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_autor_descripcion" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Descripcion: "></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_autor_descripcion" runat="server" Height="78px" style="font-size: medium" TextMode="MultiLine" Width="291px" MaxLength="200"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_descripcion_autor" runat="server" ControlToValidate="TB_autor_descripcion" ErrorMessage="* Caracter invalido" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890a-zA-Z., ]*$" ValidationGroup="B_ingresar_autor" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                <asp:Label ID="L_autor_foto" runat="server" style="color: #CCCCCC; font-size: x-large" Text="Foto:"></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:FileUpload ID="FU_autor_foto" runat="server" style="font-size: medium; color: #000000; background-color: #CCCCCC;" />
&nbsp;&nbsp;
                <asp:Button ID="B_cargar_foto" runat="server" OnClick="B_cargar_foto_Click" style="font-size: medium" Text="cargar" ValidationGroup="B_ingresar_autor" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">
                &nbsp;</td>
            <td>&nbsp;&nbsp;<asp:GridView ID="GV_autor_foto" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDeleting="GV_autor_foto_RowDeleting" OnRowDataBound="GV_autor_foto_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="IMAGEN">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("ruta") %>' Width="100px" />
                            <br />
                            <asp:Label ID="Label2" runat="server" style="color: #000000" Text='<%# Bind("nombre") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label3" runat="server" style="color: #000000; background-color: #FFFFFF" Text='<%# Eval("ruta") %>' Visible="False"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete">Eliminar</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td>&nbsp;&nbsp;<asp:Button ID="B_ingresar_autor" runat="server" style="font-size: medium" Text="INGRESAR AUTOR" OnClick="B_ingresar_autor_Click" ValidationGroup="B_ingresar_autor" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

