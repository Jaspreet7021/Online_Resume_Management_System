<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="registered_company_details.aspx.cs" Inherits="admin_registered_company_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 page-content">
                    <table class="table table-striped">
            <asp:Repeater runat="server" ID="rprComapnyRecords">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>Email id</th>
                            <th>User Code</th>
                       </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%#Eval("name") %></td>
                            <td><%#Eval("email_id") %></td>
                            <td><a href="company_details.aspx?uid=<%#Eval("comp_code") %>"><%#Eval("comp_code") %></a></td>
                        </tr>
                        
                    </tbody>
                </ItemTemplate>
            </asp:Repeater>


        </table>
                </div>
            </div>
        </div>
        
    </div>
</asp:Content>

