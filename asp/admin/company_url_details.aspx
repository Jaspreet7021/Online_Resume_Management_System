<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="company_url_details.aspx.cs" Inherits="admin_company_url_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 page-content">
                    <table class="table table-striped" id="tbl_url_data">
                        <asp:Repeater runat="server" ID="rprComapnyUrl">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th>Website Url</th>
                                        <th>Facebook</th>
                                        <th>Linkdeln</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td><%#Eval("website_url") %></td>
                                        <td><%#Eval("facebook") %></td>
                                        <td><%#Eval("linkdeln") %></td>
                                        <td><a href="company_url_details.aspx?uid=<%#Eval("comp_code") %>"><%#Eval("comp_code") %></a></td>
                                    </tr>

                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>


                    </table>
                    <div class="panel-body" runat="server" id="div_url">
                        <div class="form-group">
                            <label class="control-label">Website URL</label>
                            <asp:TextBox ID="txtWebsiteUrl" runat="server" class="form-control" />
                        </div>


                        <div class="form-group">
                            <label class="control-label">Facebook</label>
                            <asp:TextBox ID="txtFacebook" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Instagram</label>
                            <asp:TextBox ID="txtInstagram" runat="server" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label class="control-label">Linkdeln</label>
                            <asp:TextBox ID="txtLinkdeln" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Youtube</label>
                            <asp:TextBox ID="txtYoutube" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Button Text="Save" runat="server" class="btn btn-common" ID="btnUpdateUrl" OnClick="btnUpdateUrl_Click"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

