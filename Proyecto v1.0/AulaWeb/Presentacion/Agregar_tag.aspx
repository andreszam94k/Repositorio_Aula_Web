<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Agregar_tag.aspx.cs" Inherits="Presentacion_Agregar_tag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 10%;
        }
        .auto-style16 {
            width: 40%;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">Formulario agregar tag</h1>
    <h2 style="color: #CCCCCC; text-align: center">Ingresar Tags</h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RFV_tag" runat="server" ControlToValidate="TB_tag" ErrorMessage="Completar campo " style="color: #FF6600; font-size: large" ValidationGroup="B_agregar_tag" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="L_tag" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Tag: "></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_tag" runat="server" MaxLength="30" style="font-size: medium"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_tag" runat="server" ControlToValidate="TB_tag" ErrorMessage="* Caracter invalido" style="color: #FF6600; font-size: large" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="B_agregar_tag" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td>&nbsp;&nbsp;<asp:Button ID="B_agregar_tag" runat="server" style="font-size: medium" Text="Agregar" OnClick="B_agregar_tag_Click" ValidationGroup="B_agregar_tag" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td colspan="2" style="text-align: center">
                <br />
                <asp:GridView ID="GV_tags" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowDeleting="GV_tags_RowDeleting" style="background-color: #333333">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_tags") %>' style="color: #CCCCCC"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TAG">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("tag") %>' style="color: #CCCCCC"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm (&quot;¿Desea eliminar el tag?&quot;);" style="color: #FF0000">Eliminar</asp:LinkButton>
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
    <br />
</asp:Content>

