<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica_presentacion/Reporte_autores.aspx.cs" Inherits="Presentacion_Reporte_autores" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #CCCCCC">Formulario reporte autores</h1>
<CR:CrystalReportViewer ID="CRV_autores" runat="server" AutoDataBind="true" ReportSourceID="CRS_autores" />
<CR:CrystalReportSource ID="CRS_autores" runat="server">
    <Report FileName="~\Presentacion\Reportes\CrystalReport_autores.rpt">
    </Report>
</CR:CrystalReportSource>
<br />
</asp:Content>

