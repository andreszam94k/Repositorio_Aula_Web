<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Ver_categorias.aspx.cs" Inherits="Presentacion_Ver_categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 50%;
            text-align: center;
        }
        .auto-style16 {
            color: #FF6600;
        }
        .auto-style17 {
            text-align: center;
        }
        .auto-style18 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">Formulario categorias y tags</h1>
    <h2 style="color: #CCCCCC; text-align: center;">
        <asp:Button ID="B_ver_categorias" runat="server" OnClick="B_ver_categorias_Click" style="font-size: large" Text="CERRAR" />
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:DataList ID="DataList1" runat="server" BorderWidth="1px" CellPadding="3" DataSourceID="ODS_ver_categorias" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: left; background-color: #333333" Width="90%" HorizontalAlign="Center">
                    <HeaderStyle BackColor="Silver" />
                    <HeaderTemplate>
                        <div class="auto-style17">
                            CATEGORIAS</div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("categoria") %>' style="color: #CCCCCC"></asp:Label>
                        <br />
                        <span class="auto-style16">$ </span>
                        <asp:Label ID="Label3" runat="server" style="color: #FF6600" Text='<%# Bind("precio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td style="text-align: center">
                <asp:DataList ID="DataList2" runat="server" BorderWidth="1px" CellPadding="3" DataSourceID="ODS_ver_tags" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: left; background-color: #333333" Width="90%" HorizontalAlign="Center">
                    <HeaderStyle BackColor="Silver" />
                    <HeaderTemplate>
                        <div class="auto-style18">
                            TAGS</div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" style="color: #669999" Text='<%# Bind("tag") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:ObjectDataSource ID="ODS_ver_categorias" runat="server" SelectMethod="mostrar_categoria_archivo" TypeName="Consultar"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODS_ver_tags" runat="server" SelectMethod="mostrar_tags" TypeName="Consultar"></asp:ObjectDataSource>
&nbsp;
</asp:Content>

