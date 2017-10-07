<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Registrar_moderador.aspx.cs" Inherits="Presentacion_Registrar_moderador" %>

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
        <asp:Label ID="L_MRM_1" runat="server">aaa</asp:Label>
    </h1>
    
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style15" colspan="2">
    
                    &nbsp;</td>
                <td class="auto-style16">
    
                    <asp:Label ID="L_registro_mod" runat="server" ForeColor="#CCCCCC" style="font-size: x-large; text-align: right">aaa</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDL_rol" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_rol_SelectedIndexChanged" style="font-size: large">
                        <asp:ListItem Value="0">--Rol--</asp:ListItem>
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
                    <asp:GridView ID="GV_registro_mod" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCancelingEdit="GV_registro_mod_RowCancelingEdit" OnRowEditing="GV_registro_mod_RowEditing" OnRowUpdating="GV_registro_mod_RowUpdating" style="text-align: left; background-color: #333333;" HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("IdUsuario") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Nombre") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Apellido") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Documento") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Telefono") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Correo") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Usuario1") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Clave") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Dinero") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("IdRol") %>' style="color: #CCCCCC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Update" style="color: #00CC00">b</asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Cancel">c</asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" style="color: #3333FF">a</asp:LinkButton>
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

