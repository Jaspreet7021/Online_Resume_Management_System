<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="template_selection.aspx.cs" Inherits="template_selection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <img src="/images/template.png" alt="Alternate Text" />
    <br />
    <asp:Button ID="btnTemplate1" runat="server" Text="Choose this tempate" OnClick="btnTemplate1_Click" CssClass="btn btn-primary"/>
    </center>
    
</asp:Content>

