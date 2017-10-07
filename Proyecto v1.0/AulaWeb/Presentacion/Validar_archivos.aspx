<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Validar_archivos.aspx.cs" Inherits="Presentacion_Validar_archivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MVA_1" runat="server">aaa</asp:Label>
    </h1>
    <h2 style="color: #CCCCCC; text-align: center;">
        <asp:Label ID="L_MVA_2" runat="server">aaa</asp:Label>
    </h2>
<h2 style="color: #CCCCCC; text-align: left;">
    <asp:Label ID="L_MVA_3" runat="server">aaa</asp:Label>
    &nbsp;
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Presentacion/Ver_categorias.aspx" style="color: #FF0000" Target="_blank">aaa</asp:HyperLink>
</h2>
    <asp:GridView ID="GV_validar_archivos" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="#333333" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" style="text-align: center; margin-top: 0px" OnRowCancelingEdit="GV_validar_archivos_RowCancelingEdit" OnRowDeleting="GV_validar_archivos_RowDeleting" OnRowEditing="GV_validar_archivos_RowEditing" OnRowUpdating="GV_validar_archivos_RowUpdating">
        <Columns>
            <asp:TemplateField Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("IdArchivo") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Usuario") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("ImagenPortada") %>' Width="100px" />
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("url") %>' style="color: #FF0000" Target="_blank" Text='<%# Bind("Nombre") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="55px" Text='<%# Eval("Sinopsis") %>' TextMode="MultiLine" Width="197px" style="color: #000000"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="Categoria1" DataValueField="IdCategoria" SelectedValue='<%# Eval("IdCategoria") %>' style="color: #000000">
                    </asp:DropDownList>
                    <br />
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="AulaWebContext_public.AulaWebDataContext_public" EntityTypeName="" TableName="Categorias">
                    </asp:LinqDataSource>
                    <br />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Categoria") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Tags") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("IdUsuario") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("IdEstado") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("IdCategoria") %>' style="color: #CCCCCC"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <table class="auto-style2">
                        <tr>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Update" style="color: #00CC00">b</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Delete" style="color: #FF0000">c</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" style="color: #3333FF">d</asp:LinkButton>
                    <br />
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
    <br />
</asp:Content>

