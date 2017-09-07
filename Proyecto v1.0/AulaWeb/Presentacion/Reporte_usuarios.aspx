<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Reporte_usuarios.aspx.cs" Inherits="Presentacion_Reporte_usuarios" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">Formulario reporte usuarios</h1>
    <CR:CrystalReportViewer ID="CRV_usuarios" runat="server" AutoDataBind="true" ReportSourceID="CRS_usuarios" />
<CR:CrystalReportSource ID="CRS_usuarios" runat="server">
    <Report FileName="~\Presentacion\Reportes\Reporte_Usuarios.rpt">
    </Report>
</CR:CrystalReportSource>
    <br />
</asp:Content>

