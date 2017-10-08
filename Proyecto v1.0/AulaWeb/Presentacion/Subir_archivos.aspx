<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Subir_archivos.aspx.cs" Inherits="Presentacion_Subir_archivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 5%;
        }
        .auto-style16 {
            width: 40%;
            text-align: right;
        }
        .auto-style17 {
            color: #999999;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">
        <asp:Label ID="L_MSA_1" runat="server">aaa</asp:Label>
    </h1>
    <h2 style="color: #CCCCCC; text-align: center">
        <asp:Label ID="L_MSA_2" runat="server">aaa</asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">
                &nbsp;<asp:RequiredFieldValidator ID="RFV_archivo_nombre" runat="server" ControlToValidate="TB_archivo_nombre" style="color: #FF6600; font-size: large" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
                <asp:Label ID="L_archivo_nombre" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_archivo_nombre" runat="server" MaxLength="30" style="font-size: medium"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_archivo_nombre" runat="server" ControlToValidate="TB_archivo_nombre" style="font-size: large; color: #FF6600" ValidationExpression="^[1234567890a-zA-Z ]*$" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RFV_archivo_fecha" runat="server" ControlToValidate="TB_archivo_fecha" style="color: #FF6600; font-size: large" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
                <asp:Label ID="L_archivo_fecha" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_archivo_fecha" runat="server" style="font-size: medium" TextMode="Date" MaxLength="30"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RFV_archivo_sinopsis" runat="server" ControlToValidate="TB_archivo_sinopsis" style="color: #FF6600; font-size: large" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
                <asp:Label ID="L_archivo_sinopsis" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_archivo_sinopsis" runat="server" Height="104px" MaxLength="1000" style="font-size: medium" TextMode="MultiLine" Width="286px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REV_archivo_sinopsis" runat="server" ControlToValidate="TB_archivo_sinopsis" style="font-size: large; color: #FF6600" ValidationExpression="^[1234567890a-zA-Z., ]*$" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RFV_archivo_paginas" runat="server" ControlToValidate="TB_archivo_paginas" style="color: #FF6600; font-size: large" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RequiredFieldValidator>
                <asp:Label ID="L_archivo_paginas" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TB_archivo_paginas" runat="server" MaxLength="4" style="font-size: medium" Width="52px"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="REV_archivo_paginas" runat="server" ControlToValidate="TB_archivo_paginas" style="color: #FF6600; font-size: large" ValidationExpression="^[1234567890]*$" ValidationGroup="B_archivo_subir" SetFocusOnError="True" ErrorMessage="aaa"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="AulaWebContext_public.AulaWebDataContext_public" EntityTypeName="" Select="new (IdCategoria, Categoria1)" TableName="Categorias">
                </asp:LinqDataSource>
            </td>
            <td class="auto-style16">
                <asp:Label ID="L_archivo_categoria" runat="server" style="font-size: x-large; color: #CCCCCC" Visible="False">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:DropDownList ID="DDL_archivo_categoria" runat="server" AutoPostBack="True" DataSourceID="LinqDataSource1" DataTextField="Categoria1" DataValueField="IdCategoria" OnSelectedIndexChanged="DDL_archivo_categoria_SelectedIndexChanged" style="font-size: large" Visible="False">
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:TextBox ID="TB_archivo_precio" runat="server" Enabled="False" style="font-size: medium; color: #FF6600" Visible="False" Width="52px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;&nbsp;<br />
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="AulaWebContext_public.AulaWebDataContext_public" EntityTypeName="" TableName="Autors">
                </asp:LinqDataSource>
            </td>
            <td class="auto-style16">
                <asp:Label ID="L_archivo_autores" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:DataList ID="DL_archivo_autores" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" CellPadding="3" DataSourceID="LinqDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: left; background-color: #333333" Width="100%">
                <HeaderStyle BackColor="#999999" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                <HeaderTemplate>
                    <div class="auto-style3">
                        <span class="auto-style17">Autor</span></div>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CB_autores" runat="server" style="color: #CCCCCC; background-color: #333333" Text='<%# Eval("Nombre") %>' />
                </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <br />
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="AulaWebContext_public.AulaWebDataContext_public" EntityTypeName="" TableName="Tags">
                </asp:LinqDataSource>
            </td>
            <td class="auto-style16">
                <asp:Label ID="L_archivo_tags" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:DataList ID="DL_archivo_tags" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" CellPadding="3" DataSourceID="LinqDataSource3" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: left; color: #000000; background-color: #333333" Width="100%">
                <HeaderStyle BackColor="#999999" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                <HeaderTemplate>
                    <div class="auto-style17">
                        Tag</div>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CB_tags" runat="server" style="color: #CCCCCC" Text='<%# Eval("Tag1") %>' />
                </ItemTemplate>
                </asp:DataList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">
                <asp:Label ID="L_archivo_foto" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:FileUpload ID="FU_archivo_foto" runat="server" style="font-size: medium; background-color: #CCCCCC" />
&nbsp;&nbsp;
                <asp:Button ID="B_cargar_foto" runat="server" style="font-size: medium" OnClick="B_cargar_foto_Click" ValidationGroup="B_archivo_subir" Text="aaa" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td>&nbsp;&nbsp;<asp:GridView ID="GV_archivo_foto" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" OnRowDeleting="GV_archivo_foto_RowDeleting" OnRowDataBound="GV_archivo_foto_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("ruta") %>' Width="100px" />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("ruta") %>' Visible="False"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete">a</asp:LinkButton>
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
            <td class="auto-style16">
                <asp:Label ID="L_archivo_file" runat="server" style="color: #CCCCCC; font-size: x-large">aaa</asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:FileUpload ID="FU_archivo_file" runat="server" style="font-size: medium; background-color: #CCCCCC" />
&nbsp;&nbsp;
                <asp:Button ID="B_cargar_file" runat="server" style="font-size: medium" OnClick="B_cargar_file_Click" ValidationGroup="B_archivo_subir" Text="aaa" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td>&nbsp;&nbsp;<asp:GridView ID="GV_archivo_file" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" OnRowCommand="GV_archivo_file_RowCommand" OnRowDeleting="GV_archivo_file_RowDeleting" OnRowDataBound="GV_archivo_file_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("url") %>' CommandName="Download" Text='<%# Eval("nombre") %>' style="color: #FF0000"></asp:LinkButton>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("url") %>' Visible="False"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Delete">a</asp:LinkButton>
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
            <td class="auto-style16">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td>&nbsp;
                <asp:Button ID="B_archivo_subir" runat="server" style="font-size: medium" OnClick="B_archivo_subir_Click" ValidationGroup="B_archivo_subir" Text="aaa" />
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

