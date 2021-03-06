﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Consultar_autor.aspx.cs" Inherits="Presentacion_Consultar_autor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            text-align: center;
        }
        .auto-style16 {
            width: 50%;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MCAU_1" runat="server" Text="Label"></asp:Label>
    </h1>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="L_elegir_autor" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Elegir autor: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDL_autor" runat="server" AutoPostBack="True" DataSourceID="EntityDataSource1" DataTextField="nombre_autor" DataValueField="id_autor" style="font-size: large" OnSelectedIndexChanged="DDL_autor_SelectedIndexChanged">
                </asp:DropDownList>
&nbsp;<asp:ObjectDataSource ID="ODS_elegir_autor" runat="server" SelectMethod="mostrar_autor" TypeName="Data.Dao_Consultar_autor"></asp:ObjectDataSource>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=Aula_Web_SQLEntities" DefaultContainerName="Aula_Web_SQLEntities" EnableFlattening="False" EntitySetName="autor" Select="it.[id_autor], it.[nombre_autor]">
                </asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2">
                <br />
                <asp:Image ID="Image1_autor" runat="server" Height="160px" Visible="False" Width="160px" />
                <br />
                <asp:Label ID="L_nombre_autor" runat="server" style="color: #00CC99; font-size: x-large" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" style="color: #CCCCCC; font-size: x-large" Text="Pais Natal: "></asp:Label>
&nbsp;<asp:Label ID="L_pais_autor" runat="server" style="color: #999999; font-size: x-large"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" style="color: #CCCCCC; font-size: x-large" Text="Fecha Nacimiento: " Visible="False"></asp:Label>
                <asp:Label ID="L_birth_autor" runat="server" style="font-size: x-large; color: #999999" Visible="False"></asp:Label>
&nbsp;
                <asp:Label ID="Label3" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Fecha Muerte: " Visible="False"></asp:Label>
&nbsp;<asp:Label ID="L_death_autor" runat="server" style="color: #999999; font-size: x-large" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" style="color: #CCCCCC; font-size: x-large" Text="Descripcion" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="TB_descripcion_autor" runat="server" Enabled="False" Height="80px" style="font-size: large" TextMode="MultiLine" Visible="False" Width="500px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GV_archivo_autor" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowEditing="GV_archivo_autor_RowEditing" style="text-align: center; background-color: #333333" OnRowDataBound="GV_archivo_autor_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="ID" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" style="color: #CCCCCC" Text='<%# Eval("id_archivo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ARCHIVO">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("imagen_portada") %>' Width="100px" />
                    <br />
                    <asp:Label ID="Label7" runat="server" style="color: #FF0000" Text='<%# Eval("nombre_archivo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPCION">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="80px" style="font-size: medium" Text='<%# Eval("sinopsis_archivo") %>' Width="300px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" style="color: #3333FF">Ver Detalles</asp:LinkButton>
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
    <br />
    <br />
</asp:Content>

