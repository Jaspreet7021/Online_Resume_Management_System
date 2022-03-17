<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Hero Area Start -->
    <div id="hero-area">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-xs-12 text-center">
                    <div class="contents">
                        <h1 class="head-title">Welcome to <span class="year">Resume Management System</span></h1>
                        <p>
                            Build your own resume and apply for internship in companies in the city you like         <br>
                            <%--Or Search For Property, Jobs And More--%>
                        </p>
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
                                                <asp:TextBox runat="server" Id="txtInternshipLocation" class="form-control keyword" placeholder="Enter Internship Location"/>  
                                            </div>


                                            <div class="col-md-3 col-sm-6 search-col">
                                                <asp:TextBox ID="txtSearch" runat="server" placeholder="Enter Profile" class="form-control keyword"></asp:TextBox>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Area End -->
</asp:Content>

