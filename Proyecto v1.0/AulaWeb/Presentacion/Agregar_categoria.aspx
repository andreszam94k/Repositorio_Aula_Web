<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Agregar_categoria.aspx.cs" Inherits="Presentacion_Agregar_categoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
        }
        .auto-style16 {
            text-align: center;
        }
        .auto-style17 {
            width: 40%;
            text-align: right;
        }
        .auto-style18 {
            width: 10%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MAC_1" runat="server" Text="Label"></asp:Label>
    </h1>
    <h2 style="color: #CCCCCC; text-align: center">
        <asp:Label ID="L_MAC_2" runat="server" Text="Label"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style17">&nbsp;<asp:RequiredFieldValidator ID="RFV_categoria" runat="server" ControlToValidate="TB_categoria" ErrorMessage="Completar campo " style="color: #FF6600; font-size: large" ValidationGroup="B_agregar_categoria" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="L_categoria" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Categoria: "></asp:Label>
            </td>
            <td>&nbsp;
                <asp:TextBox ID="TB_categoria" runat="server" style="font-size: medium" MaxLength="30"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="REV_categoria" runat="server" ControlToValidate="TB_categoria" ErrorMessage="* Caracter invalido" style="font-size: large; color: #FF6600" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="B_agregar_categoria" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style17">
                <asp:RequiredFieldValidator ID="RFV_costo" runat="server" ControlToValidate="TB_costo" ErrorMessage="Completar campo " style="font-size: large; color: #FF6600" ValidationGroup="B_agregar_categoria" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="L_costo" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Asignar costo: "></asp:Label>
            </td>
            <td>&nbsp; <asp:TextBox ID="TB_costo" runat="server" style="font-size: medium" MaxLength="5"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_costo" runat="server" ControlToValidate="TB_costo" ErrorMessage="* Caracter invalido" style="font-size: large; color: #FF6600" ValidationExpression="^[1234567890]*$" ValidationGroup="B_agregar_categoria" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2">&nbsp;</td>
            <td>
                <asp:Button ID="B_agregar_categoria" runat="server" style="font-size: medium" Text="Agregar" OnClick="B_agregar_categoria_Click" ValidationGroup="B_agregar_categoria" />
            </td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style16" colspan="2" style="text-align:center; align-content:center; align-items:center">
                <br />
                <asp:GridView ID="GV_categoria" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCancelingEdit="GV_categoria_RowCancelingEdit" OnRowDeleting="GV_categoria_RowDeleting" OnRowEditing="GV_categoria_RowEditing" OnRowUpdating="GV_categoria_RowUpdating" style="color: #333333; background-color: #333333" OnRowDataBound="GV_categoria_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_categoria") %>' style="color: #CCCCCC"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CATEGORIA">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" MaxLength="30" Text='<%# Eval("categoria") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("categoria") %>' style="color: #CCCCCC"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRECIO">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="RFV_gv_costo" runat="server" ControlToValidate="TextBox2" ErrorMessage="¿?" style="color: #FF0000" ValidationGroup="LinkButton2"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="5" Text='<%# Eval("precio_categoria") %>'></asp:TextBox>
                                &nbsp;<asp:RegularExpressionValidator ID="REV_gv_costo" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ValidationExpression="^[1234567890]*$" style="color: #FF0000" ValidationGroup="LinkButton2"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("precio_categoria") %>' style="color: #CCCCCC"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Update" ValidationGroup="LinkButton2" style="color: #00CC00">Cambiar</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Cancel" style="color: #3333FF">Cancelar</asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" style="color: #3333FF">Editar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Delete" OnClientClick="return confirm (&quot;¿Desea eliminar la categoria?&quot;);" style="color: #FF0000">Eliminar</asp:LinkButton>
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
            </td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>

