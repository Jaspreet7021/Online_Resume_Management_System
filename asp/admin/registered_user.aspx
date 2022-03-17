<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="registered_user.aspx.cs" Inherits="admin_registered_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 page-content">
                    <table class="table table-striped">
            <asp:Repeater runat="server" ID="rprRecords">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email id</th>
                            <th>Mobile</th>
                            <th>D0B</th>
                            <th>Address</th>
                            <th>City</th>
                            <th>State</th>
                            <th>User Code</th>
                       </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%#Eval("name") %></td>
                            <td><%#Eval("email_id") %></td>
                            <td><%#Eval("mobile") %></td>
                            <td><%#Eval("DOB") %></td>
                            <td><%#Eval("address") %></td>
                            <td><%#Eval("city") %></td>
                            <td><%#Eval("state") %></td>
                            <td><a href="create_user_resume.aspx?uid=<%#Eval("user_code") %>"><%#Eval("user_code") %></a></td>
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

