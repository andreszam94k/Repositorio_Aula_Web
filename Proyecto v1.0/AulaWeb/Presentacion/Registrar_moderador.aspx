﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Registrar_moderador.aspx.cs" Inherits="Presentacion_Registrar_moderador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 10%;
            text-align: right;
        }
        .auto-style16 {
            width: 40%;
            text-align: right;
        }
        .auto-style17 {
            width: 10%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MRM_1" runat="server" Text="Label"></asp:Label>
    </h1>
    
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style15" colspan="2">
    
                    &nbsp;</td>
                <td class="auto-style16">
    
                    <asp:Label ID="L_registro_mod" runat="server" ForeColor="#CCCCCC" style="font-size: x-large; text-align: right" Text="Ordenar por: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDL_rol" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_rol_SelectedIndexChanged" style="font-size: large">
                        <asp:ListItem Value="0">-- Rol --</asp:ListItem>
                        <asp:ListItem Value="3">Usuario / User</asp:ListItem>
                        <asp:ListItem Value="2">Moderador / Moderator</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" class="auto-style17">
                    &nbsp;</td>
                <td colspan="3" style="text-align: center">
                    <br />
                    <asp:GridView ID="GV_registro_mod" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCancelingEdit="GV_registro_mod_RowCancelingEdit" OnRowEditing="GV_registro_mod_RowEditing" OnRowUpdating="GV_registro_mod_RowUpdating" style="text-align: left; background-color: #333333;" HorizontalAlign="Center" OnRowDataBound="GV_registro_mod_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_usuario") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NOMBRE">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("nombre_user") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="APELLIDO">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("apellido_user") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DOCUMENTO">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("documento_user") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TELEFONO">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("telefono_user") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CORREO">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("correo_user") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="USUARIO">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("usuario") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CLAVE" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("clave") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DINERO">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("dinero_user") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID_ROL" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("id_rol") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Update" style="color: #00CC00">Cambiar Rol</asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Cancel">Cancelar</asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" style="color: #3333FF">Editar</asp:LinkButton>
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
                </td>
            </tr>
        </table>
 
    </asp:Content>

