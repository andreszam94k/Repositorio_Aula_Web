<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Ver_categorias.aspx.cs" Inherits="Presentacion_Ver_categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 50%;
            text-align: center;
        }
        .auto-style17 {
            text-align: center;
            color: #C0C0C0;
        }
        .auto-style19 {
            color: #FF6600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC"><asp:Label ID="L_MVC_1" runat="server" Text="Label"></asp:Label>
    </h1>
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
                <asp:DataList ID="DataList1" runat="server" BorderWidth="1px" CellPadding="3" DataSourceID="EntityDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: left; background-color: #333333" Width="90%" HorizontalAlign="Center">
                    <HeaderStyle BackColor="Silver" />
                    <HeaderTemplate>
                        <div class="auto-style17">
                            CATEGORIAS</div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" style="color: #CCCCCC" Text='<%# Eval("categoria1") %>'></asp:Label>
                        <br />
                        <span class="auto-style19">$ </span>
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style19" Text='<%# Eval("precio_categoria") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td style="text-align: center">
                <asp:DataList ID="DataList2" runat="server" BorderWidth="1px" CellPadding="3" DataSourceID="EntityDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: left; background-color: #333333" Width="90%" HorizontalAlign="Center">
                    <HeaderStyle BackColor="Silver" />
                    <HeaderTemplate>
                        <div class="auto-style17">
                            TAGS</div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" style="color: #669999" Text='<%# Eval("tag") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:ObjectDataSource ID="ODS_ver_categorias" runat="server" SelectMethod="mostrar_categoria_archivo" TypeName="Data.Dao_Ver_categorias"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODS_ver_tags" runat="server" SelectMethod="mostrar_tags" TypeName="Data.Dao_Ver_categorias"></asp:ObjectDataSource>
    <br />
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=Aula_Web_SQLEntities" DefaultContainerName="Aula_Web_SQLEntities" EnableFlattening="False" EntitySetName="categoria" Select="it.[id_categoria], it.[categoria1], it.[precio_categoria]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=Aula_Web_SQLEntities" DefaultContainerName="Aula_Web_SQLEntities" EnableFlattening="False" EntitySetName="tags" Select="it.[id_tags], it.[tag]">
    </asp:EntityDataSource>
    <br />
&nbsp;
</asp:Content>

