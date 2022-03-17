<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search_result.aspx.cs" Inherits="search_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Search wrapper Start -->
                        <div id="search-bg-color">
                            <div class="container">
                                <div class="search-inner">
                                    <!-- Start Search box -->
                                    <div class="row search-bar">
                                        <div class="advanced-search">
                                            <div class="col-md-3 col-sm-6 search-col">
                                                <asp:DropDownList ID="ddlSearchInternShipType" runat="server" class="dropdown-product selectpicker" >
                                                    <asp:ListItem>Type of Internship</asp:ListItem>
                                                    <asp:ListItem>Full Time</asp:ListItem>
                                                    <asp:ListItem>Part Time</asp:ListItem>
                                                    <asp:ListItem>Work From Home</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>


                                            <div class="col-md-3 col-sm-6 search-col">
                                                <%--<asp:DropDownList ID="ddlSearchCity" runat="server" class="  dropdown-product selectpicker" DataValueField="city_id" DataTextField="city">
                                                    
                                                </asp:DropDownList>--%>

                                                <asp:TextBox runat="server" Id="txtInternshipLocation" class="form-control keyword" placeholder="Enter Internship Location"/>  
                                            </div>


                                            <div class="col-md-3 col-sm-6 search-col">
                                                <asp:TextBox ID="txtSearch" runat="server" placeholder="Enter Keyword" class="form-control keyword"></asp:TextBox>
                                                <i class="fa fa-search"></i>
                                            </div>

                                            <div class="col-md-3 col-sm-6 search-col">
                                                
                                                <asp:Button Text="Search" runat="server" ID="btnSearh" OnClick="btnSearh_Click" class="btn btn-common btn-search btn-block"/>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- End Search box -->
                                </div>
                            </div>
                        </div>
                        <!-- Search wrapper End -->

    <table class="table table-striped add-manage-table" style="margin-left:75px; margin-top:10px;">
        <asp:Repeater runat="server" ID="rprCompanyDetails">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody class="col-md-8">
                    <tr>
                        <td class="add-img-td">
                            <a href="ads-details.html">
                                <img class="img-responsive" src="assets/img/item/img-1.jpg" alt="img">
                            </a>
                        &nbsp;&nbsp;</td>
                        <td class="ads-details-td">
                            <h3><%#Eval("name") %></h3>
                            <p>
                                <strong>Location</strong>:<%#Eval("location") %></p>
                            <br />
                            <p><strong>Start Date</strong>: <%#Eval("start_date") %></p>
                            <br />
                            <p><strong>Perks</strong>: <%#Eval("perks") %></p>
                            <br />
                            <p><a class="btn btn-danger btn-xs"><i class="fa fa-pencil-square-o"></i>View Profile</a></p>
                        </td>
                    </tr>
                </tbody>

            </ItemTemplate>
        </asp:Repeater>

    </table>
</asp:Content>

