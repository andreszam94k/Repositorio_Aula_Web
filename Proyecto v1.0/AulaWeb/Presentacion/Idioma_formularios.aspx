<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Idioma_formularios.aspx.cs" Inherits="Presentacion_Idioma_formularios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 50%;
            text-align: right;
        }
        .auto-style16 {
            text-align: right;
            width: 50%;
        }
        .auto-style17 {
            text-align: right;
            width: 50%;
        }
        .auto-style18 {
            text-align: right;
            width: 50%;
        }
        .auto-style19 {
            text-align: right;
            width: 50%;
        }
        .auto-style20 {
            text-align: right;
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        <asp:Label ID="L_IF_1" runat="server" style="color: #CCCCCC" Text="Label"></asp:Label>
    </h1>
    <h2 style="text-align: center">
        <asp:Label ID="L_IF_2" runat="server" style="color: #CCCCCC" Text="Label"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style15">
                <asp:Label ID="Label1" runat="server" style="font-size: x-large; color: #CCCCCC" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="nombre" DataValueField="id_idiomas">
                </asp:DropDownList>
&nbsp;
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrar_idioma" TypeName="Data.Dao_Ingresar_idioma"></asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label2" runat="server" style="color: #CCCCCC" Text="Master_page"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label21" runat="server" style="font-size: large; color: #CCCCCC" Text="HL_inicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label22" runat="server" style="font-size: large; color: #CCCCCC" Text="HL_Nosotros "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label23" runat="server" style="font-size: large; color: #CCCCCC" Text="HL_Reglas "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label24" runat="server" style="font-size: large; color: #CCCCCC" Text="HL_Contacto "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label25" runat="server" style="font-size: large; color: #CCCCCC" Text="LB_cerrarSession "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label26" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label27" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label28" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila1_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label29" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila1_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label30" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label31" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila2_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label32" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila2_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label33" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila2_3 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox13" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label34" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila3 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox14" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label35" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila4 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label36" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila5 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox16" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label37" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila5_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox17" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label38" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila5_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox18" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label39" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila5_3 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox19" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label40" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila6 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox20" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label41" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila6_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox21" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label42" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu1_fila6_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox22" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label43" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox23" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label44" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila0_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox24" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label45" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila0_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox25" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label46" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox26" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label47" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox27" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label48" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox28" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label49" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox29" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label50" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila4_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox30" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label51" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu2_fila4_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox31" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label52" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu3_fila0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox32" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label53" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu3_fila1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox33" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label54" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu3_fila2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox34" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label55" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu4_fila0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox35" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label56" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu4_fila1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox36" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label57" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu4_fila2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox37" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label58" runat="server" style="font-size: large; color: #CCCCCC" Text="Menu4_fila3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox38" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="Label59" runat="server" style="font-size: large; color: #CCCCCC" Text="L_Derechos"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox39" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label3" runat="server" style="color: #CCCCCC" Text="Contacto"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style18">
                <asp:Label ID="Label60" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MC_1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox40" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Label ID="Label61" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MC_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox41" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Label ID="Label62" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MC_3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox42" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Label ID="Label63" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MC_4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox43" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Label ID="Label64" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MC_5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox44" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label4" runat="server" style="color: #CCCCCC" Text="Inicio "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label65" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MI_1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox45" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label66" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MI_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox46" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label67" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MI_3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox47" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label68" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MI_4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox48" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label69" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MI_5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox49" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label5" runat="server" style="color: #CCCCCC" Text="Normas"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label70" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox50" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label71" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox51" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label72" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox52" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label73" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox53" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label74" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox54" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label75" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox55" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label76" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox56" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label77" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_8"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox57" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label78" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_9"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox58" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label79" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_10"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox59" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label80" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_11"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox60" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label81" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_12"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox61" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label82" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MN_13"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox62" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label83" runat="server" style="font-size: large; color: #CCCCCC" Text="HyperLink1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox63" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label84" runat="server" style="font-size: large; color: #CCCCCC" Text="B_normas "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox64" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label6" runat="server" style="color: #CCCCCC" Text="Nosotros"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label85" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox65" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label86" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox66" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label87" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox67" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label88" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox68" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label89" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox69" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label90" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox70" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label91" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MNos_7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox71" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label7" runat="server" style="color: #CCCCCC" Text="Reglas"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label92" runat="server" style="font-size: large; color: #CCCCCC" Text="Label1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox72" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label93" runat="server" style="font-size: large; color: #CCCCCC" Text="Label2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox73" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label94" runat="server" style="font-size: large; color: #CCCCCC" Text="Label3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox74" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label95" runat="server" style="font-size: large; color: #CCCCCC" Text="Label4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox75" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label96" runat="server" style="font-size: large; color: #CCCCCC" Text="Label5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox76" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label97" runat="server" style="font-size: large; color: #CCCCCC" Text="Label6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox77" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label98" runat="server" style="font-size: large; color: #CCCCCC" Text="Label7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox78" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label99" runat="server" style="font-size: large; color: #CCCCCC" Text="Label8"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox79" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label100" runat="server" style="font-size: large; color: #CCCCCC" Text="Label9"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox80" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label101" runat="server" style="font-size: large; color: #CCCCCC" Text="Label10"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox81" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label102" runat="server" style="font-size: large; color: #CCCCCC" Text="Label11"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox82" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label103" runat="server" style="font-size: large; color: #CCCCCC" Text="Label12"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox83" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label104" runat="server" style="font-size: large; color: #CCCCCC" Text="Label13"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox84" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label105" runat="server" style="font-size: large; color: #CCCCCC" Text="Label14"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox85" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label106" runat="server" style="font-size: large; color: #CCCCCC" Text="Label15"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox86" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label107" runat="server" style="font-size: large; color: #CCCCCC" Text="Label16"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox87" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label108" runat="server" style="font-size: large; color: #CCCCCC" Text="Label17"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox88" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label109" runat="server" style="font-size: large; color: #CCCCCC" Text="Label18"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox89" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label110" runat="server" style="font-size: large; color: #CCCCCC" Text="Label19"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox90" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label111" runat="server" style="font-size: large; color: #CCCCCC" Text="Label20"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox91" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label112" runat="server" style="font-size: large; color: #CCCCCC" Text="Label21"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox92" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label113" runat="server" style="font-size: large; color: #CCCCCC" Text="Label22"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox93" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label114" runat="server" style="font-size: large; color: #CCCCCC" Text="Label23"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox94" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label115" runat="server" style="font-size: large; color: #CCCCCC" Text="Label24"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox95" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label116" runat="server" style="font-size: large; color: #CCCCCC" Text="Label25"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox96" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label117" runat="server" style="font-size: large; color: #CCCCCC" Text="Label26"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox97" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label118" runat="server" style="font-size: large; color: #CCCCCC" Text="Label27"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox98" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label119" runat="server" style="font-size: large; color: #CCCCCC" Text="Label28"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox99" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label120" runat="server" style="font-size: large; color: #CCCCCC" Text="Label29"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox100" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label8" runat="server" style="color: #CCCCCC" Text="Ver_categorias "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label121" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MC_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox101" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label122" runat="server" style="font-size: large; color: #CCCCCC" Text="B_ver_categorias "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox102" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label9" runat="server" style="color: #CCCCCC" Text="inicio_session "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label123" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MIS_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox103" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label124" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MIS_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox104" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label125" runat="server" style="font-size: large; color: #CCCCCC" Text="HL_CrearUser "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox105" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label126" runat="server" style="font-size: large; color: #CCCCCC" Text="L_inicio_usuario "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox106" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label127" runat="server" style="font-size: large; color: #CCCCCC" Text="L_inicio_clave "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox107" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label128" runat="server" style="font-size: large; color: #CCCCCC" Text="B_iniciarSession "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox108" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label129" runat="server" style="font-size: large; color: #CCCCCC" Text="B_iniciarSession "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox109" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label130" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_usuario "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox110" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label131" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_usuario "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox111" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label132" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_contraseña "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox112" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label133" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_contraseña "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox113" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label10" runat="server" style="color: #CCCCCC" Text="Registrar_usuario "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label134" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MRU_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox114" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label135" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MRU_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox115" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label136" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox116" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label137" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_apellido "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox117" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label138" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_documento "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox118" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label139" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_telefono "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox119" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label140" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_correo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox120" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label141" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_user "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox121" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label142" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_clave "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox122" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label143" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_confirmar "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox123" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label144" runat="server" style="font-size: large; color: #CCCCCC" Text="B_registrar "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox124" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label145" runat="server" style="font-size: large; color: #CCCCCC" Text="CB_terminos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox125" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label146" runat="server" style="font-size: large; color: #CCCCCC" Text="HL_terminos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox126" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label147" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox127" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label148" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox128" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label149" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_apellido "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox129" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label150" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_apellido "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox130" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label151" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_documento "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox131" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label152" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_documento "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox132" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label153" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_telefono "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox133" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label154" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_telefono "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox134" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label155" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_correo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox135" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label156" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_correo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox136" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label157" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_user "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox137" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label158" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_user "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox138" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label159" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_clave "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox139" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label160" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_clave "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox140" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label161" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_confirmar "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox141" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label162" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_confirmar "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox142" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label163" runat="server" style="font-size: large; color: #CCCCCC" Text="CV_confirmar "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox143" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label11" runat="server" style="color: #CCCCCC" Text="Registrar_moderador "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label164" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MRM_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox144" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label165" runat="server" style="font-size: large; color: #CCCCCC" Text="L_registro_mod "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox145" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label166" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna0"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox146" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label167" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox147" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label168" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox148" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label169" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox149" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label170" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox150" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label171" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox151" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label172" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox152" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label173" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox153" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label174" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna8"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox154" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label175" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_registro_mod_columna9"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox155" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label176" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_linkbuton1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox156" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label177" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_linkbuton2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox157" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label178" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_linkbuton3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox158" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label12" runat="server" style="color: #CCCCCC" Text="Ingresar_autor "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label179" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MIA_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox159" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label180" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MIA_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox160" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label181" runat="server" style="font-size: large; color: #CCCCCC" Text="L_autor_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox161" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label182" runat="server" style="font-size: large; color: #CCCCCC" Text="L_autor_birth "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox162" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label183" runat="server" style="font-size: large; color: #CCCCCC" Text="L_autor_death "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox163" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label184" runat="server" style="font-size: large; color: #CCCCCC" Text="L_autor_nacionalidad "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox164" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label185" runat="server" style="font-size: large; color: #CCCCCC" Text="L_autor_descripcion "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox165" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label186" runat="server" style="font-size: large; color: #CCCCCC" Text="L_autor_foto "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox166" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label187" runat="server" style="font-size: large; color: #CCCCCC" Text="B_cargar_foto "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox167" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label188" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_autor_foto_columna0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox168" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label189" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox169" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label190" runat="server" style="font-size: large; color: #CCCCCC" Text="B_ingresar_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox170" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label191" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_nombre_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox171" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label192" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_nombre_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox172" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label193" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_nacimiento_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox173" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label194" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_descripcion_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox174" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label195" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_descripcion_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox175" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label13" runat="server" style="color: #CCCCCC" Text="Agregar_categoria "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label196" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MAC_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox176" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label197" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MAC_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox177" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label198" runat="server" style="font-size: large; color: #CCCCCC" Text="L_categoria "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox178" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label199" runat="server" style="font-size: large; color: #CCCCCC" Text="L_costo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox179" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label200" runat="server" style="font-size: large; color: #CCCCCC" Text="B_agregar_categoria "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox180" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label201" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_categoria_columna0"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox181" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label202" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_categoria_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox182" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label203" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_categoria_columna2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox183" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label204" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox184" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label205" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox185" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label206" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox186" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label207" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox187" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label208" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_categoria "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox188" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label209" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_categoria "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox189" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label210" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_costo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox190" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label211" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_costo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox191" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label14" runat="server" style="color: #CCCCCC" Text="Agregar_tag "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label212" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MAT_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox192" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label213" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MAT_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox193" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label214" runat="server" style="font-size: large; color: #CCCCCC" Text="L_tag "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox194" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label215" runat="server" style="font-size: large; color: #CCCCCC" Text="B_agregar_tag "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox195" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label216" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_tags_columna0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox196" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label217" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_tags_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox197" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label218" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox198" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label219" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_tag "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox199" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label220" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_tag "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox200" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label15" runat="server" style="color: #CCCCCC" Text="Subir_archivos "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label221" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MSA_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox201" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label222" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MSA_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox202" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label223" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox203" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label224" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_fecha "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox204" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label225" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_sinopsis "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox205" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label226" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_paginas "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox206" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label227" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_categoria "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox207" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label228" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_autores "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox208" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label229" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_tags "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox209" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label230" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_foto "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox210" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label231" runat="server" style="font-size: large; color: #CCCCCC" Text="B_cargar_foto "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox211" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label232" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_archivo_foto_columna0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox212" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label233" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox213" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label234" runat="server" style="font-size: large; color: #CCCCCC" Text="L_archivo_file "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox214" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label235" runat="server" style="font-size: large; color: #CCCCCC" Text="B_cargar_file "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox215" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label236" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_archivo_file_columna0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox216" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label237" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox217" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label238" runat="server" style="font-size: large; color: #CCCCCC" Text="B_archivo_subir "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox218" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label239" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_archivo_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox219" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label240" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_archivo_nombre "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox220" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label241" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_archivo_fecha "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox221" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label242" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_archivo_sinopsis "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox222" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label243" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_archivo_sinopsis "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox223" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label244" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_archivo_paginas "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox224" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label245" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_archivo_paginas "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox225" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label16" runat="server" style="color: #CCCCCC" Text="Validar_archivos "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label246" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MVA_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox226" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label247" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MVA_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox227" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label248" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MVA_3 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox228" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label249" runat="server" style="font-size: large; color: #CCCCCC" Text="HyperLink3 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox229" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label250" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna0"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox230" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label251" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox231" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label252" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox232" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label253" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox233" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label254" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox234" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label255" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox235" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label256" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox236" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label257" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox237" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label258" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_validar_archivos_columna8"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox238" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label259" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox239" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label260" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox240" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label261" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox241" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label262" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox242" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label17" runat="server" style="color: #CCCCCC" Text="Consultar_archivo "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label263" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MCA_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox243" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label264" runat="server" style="font-size: large; color: #CCCCCC" Text="L_consultar_archivos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox244" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label265" runat="server" style="font-size: large; color: #CCCCCC" Text="B_mostrar_archivos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox245" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label266" runat="server" style="font-size: large; color: #CCCCCC" Text="B_consultar_archivos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox246" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label267" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_consultar_archivo_columna0"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox247" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label268" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_consultar_archivo_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox248" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label269" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_consultar_archivo_columna2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox249" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label270" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_consultar_archivo_columna3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox250" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label271" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_consultar_archivo_columna4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox251" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label272" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox252" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label273" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_consultar_archivos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox253" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label274" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_consultar_archivos "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox254" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label18" runat="server" style="color: #CCCCCC" Text="Consultar_autor "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label275" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MCAU_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox255" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label276" runat="server" style="font-size: large; color: #CCCCCC" Text="L_elegir_autor "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox256" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label277" runat="server" style="font-size: large; color: #CCCCCC" Text="Label5 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox257" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label278" runat="server" style="font-size: large; color: #CCCCCC" Text="Label2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox258" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label279" runat="server" style="font-size: large; color: #CCCCCC" Text="Label3 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox259" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label280" runat="server" style="font-size: large; color: #CCCCCC" Text="Label4 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox260" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label281" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_archivo_autor_columna0"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox261" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label282" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_archivo_autor_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox262" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label283" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_archivo_autor_columna2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox263" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label284" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_LinkButton1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox264" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label19" runat="server" style="color: #CCCCCC" Text="Descargar_archivo "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label285" runat="server" style="font-size: large; color: #CCCCCC" Text="L_MDA_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox265" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label286" runat="server" style="font-size: large; color: #CCCCCC" Text="Label2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox266" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label287" runat="server" style="font-size: large; color: #CCCCCC" Text="Label3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox267" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label288" runat="server" style="font-size: large; color: #CCCCCC" Text="Label4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox268" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label289" runat="server" style="font-size: large; color: #CCCCCC" Text="Label5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox269" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label290" runat="server" style="font-size: large; color: #CCCCCC" Text="Label10"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox270" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label291" runat="server" style="font-size: large; color: #CCCCCC" Text="Label6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox271" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label292" runat="server" style="font-size: large; color: #CCCCCC" Text="Label7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox272" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label293" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_comentarios_columna0 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox273" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label294" runat="server" style="font-size: large; color: #CCCCCC" Text="GV_comentarios_columna1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox274" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label295" runat="server" style="font-size: large; color: #CCCCCC" Text="B_comentar "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox275" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label296" runat="server" style="font-size: large; color: #CCCCCC" Text="RFV_comentario_archivo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox276" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label297" runat="server" style="font-size: large; color: #CCCCCC" Text="REV_comentario_archivo "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox277" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label20" runat="server" style="color: #CCCCCC" Text="Ingresar_idioma "></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label298" runat="server" style="font-size: large; color: #CCCCCC" Text="L_II_1 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox278" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label299" runat="server" style="font-size: large; color: #CCCCCC" Text="L_II_2 "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox279" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label300" runat="server" style="font-size: large; color: #CCCCCC" Text="L_idioma "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox280" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label301" runat="server" style="font-size: large; color: #CCCCCC" Text="L_terminacion "></asp:Label>
            </td>
            <td style="font-weight: 700">
                <asp:TextBox ID="TextBox281" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label302" runat="server" style="font-size: large; color: #CCCCCC" Text="B_ingresar_idioma "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox282" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label303" runat="server" style="font-size: large; color: #CCCCCC" Text="error_1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox283" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label304" runat="server" style="font-size: large; color: #CCCCCC" Text="error_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox284" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h2 style="text-align: center">
        <asp:Label ID="Label305" runat="server" style="color: #CCCCCC" Text="Idioma_formularios"></asp:Label>
    </h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style20">
                <asp:Label ID="Label306" runat="server" style="font-size: large; color: #CCCCCC" Text="L_IF_1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox285" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style20">
                <asp:Label ID="Label307" runat="server" style="font-size: large; color: #CCCCCC" Text="L_IF_2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox286" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style20">
                <asp:Label ID="Label308" runat="server" style="font-size: large; color: #CCCCCC" Text="Label1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox287" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style20">
                <asp:Label ID="Label309" runat="server" style="font-size: large; color: #CCCCCC" Text="B_agregar_datos"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox288" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <h2 style="text-align: center">
        <asp:Button ID="B_agregar_datos" runat="server" OnClick="B_agregar_datos_Click" style="text-align: center; font-size: medium" Text="Button" />
    </h2>
    <br />
    <br />
    <br />
</asp:Content>

