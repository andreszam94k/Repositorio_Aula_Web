<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Consultar_archivo.aspx.cs" Inherits="Presentacion_Consultar_archivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 25%;
        text-align: center;
    }
        .auto-style16 {
            width: 25%;
        text-align: right;
    }
        .auto-style17 {
            width: 25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MCA_1" runat="server">aaa</asp:Label>
    </h1>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">
                <asp:Button ID="B_mostrar_archivos" runat="server" OnClick="B_mostrar_archivos_Click" style="font-size: medium; color: #CCCCCC; background-color: #000066" Text="aaa" />
            </td>
            <td class="auto-style16">&nbsp;
                <asp:Label ID="L_consultar_archivos" runat="server" style="font-size: x-large; color: #CCCCCC">aaa</asp:Label>
                <br />
&nbsp;
                <asp:RequiredFieldValidator ID="RFV_consultar_archivos" runat="server" ControlToValidate="TB_consultar_archivos" style="color: #FF6600; font-size: large" ValidationGroup="B_consultar_archivos" ErrorMessage="aaa"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style17">&nbsp;
                <asp:TextBox ID="TB_consultar_archivos" runat="server" MaxLength="30" style="font-size: medium" Width="109px"></asp:TextBox>
&nbsp;
                <asp:Button ID="B_consultar_archivos" runat="server" OnClick="B_consultar_archivos_Click" style="color: #CCCCCC; font-size: medium; background-color: #000066" ValidationGroup="B_consultar_archivos" Text="aaa" />
&nbsp;<br />
                <asp:RegularExpressionValidator ID="REV_consultar_archivos" runat="server" ControlToValidate="TB_consultar_archivos" style="font-size: large; color: #FF6600" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="B_consultar_archivos" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
            <td style="text-align: left">&nbsp;&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GV_consultar_archivo" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" style="background-color: #333333; text-align: center;" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowEditing="GV_consultar_archivo_RowEditing">
        <Columns>
            <asp:TemplateField Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" style="color: #CCCCCC" Text='<%# Eval("IdArchivo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("ImagenPortada") %>' Width="100px" />
                    <br />
                    <asp:Label ID="Label3" runat="server" style="color: #FF0000" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="68px" Text='<%# Bind("Sinopsis") %>' TextMode="MultiLine" Width="207px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" style="color: #CCCCCC" Text='<%# Eval("Tags") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" style="color: #CCCCCC" Text='<%# Eval("Categoria") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
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
<br />
<br />
    <br />
</asp:Content>

