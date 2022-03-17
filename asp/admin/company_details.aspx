<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="company_details.aspx.cs" Inherits="admin_company_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 page-content">
                    <div class="inner-box">
                        <div class="usearadmin">
                            <h3><a href="#">
                                <img class="userimg" src="assets/img/user.jpg" alt="" />
                                Admin</a></h3>
                        </div>
                    </div>
                    <div class="inner-box">
                        <%--<div class="welcome-msg">
                                    <h3 class="page-sub-header2 clearfix no-padding">Hello Jhon Doe </h3>
                                    <span class="page-sub-header-sub small">You last logged in at: 01-03-2017 12:40 AM [UK time (GMT + 6:00hrs)]</span>
                                </div>--%>
                        <div id="accordion" class="panel-group">
                            <div class="panel panel-default">

                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="control-label">Comapny Name</label>
                                        <asp:TextBox ID="txtCompName" runat="server" class="form-control" />
                                    </div>
                                    <asp:HiddenField runat="server" ID="hfCompCode" />
                                    <div class="form-group">
                                        <label class="control-label">Comapny mail id</label>
                                        <asp:TextBox ID="txtCompEmail" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">About Company</label>
                                        <asp:TextBox ID="txtAboutComapny" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Phone</label>
                                        <asp:TextBox ID="txtCompPhone" runat="server" class="form-control" />
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Company Logo</label>
                                        <asp:FileUpload runat="server"  ID="fuCompLogo" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">City</label>
                                        <asp:DropDownList ID="ddlCompCity" runat="server" CssClass="form-control" DataValueField="city_id" DataTextField="city"></asp:DropDownList>
                                    </div>

                                    <%--<div class="form-group">
                                        <label class="control-label">Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Confim Password</label>
                                        <asp:TextBox ID="txtPasswordConfirm" runat="server" class="form-control" TextMode="Password" />
                                    </div>--%>
                                    <div class="form-group">
                                        <asp:Button Text="Save" runat="server" class="btn btn-common" ID="btnCompanyRegistartion" OnClick="btnCompanyRegistartion_Click" />
                                    </div>

                                </div>

                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="control-label">Profile</label>
                                        <asp:TextBox ID="txtProfile" runat="server" class="form-control" />
                                    </div>
                                    <asp:HiddenField runat="server" ID="HiddenField1" />
                                    <div class="form-group">
                                        <label class="control-label">Type of internship</label>
                                        <asp:RadioButtonList ID="rblTypeOfInternship" runat="server">
                                            <asp:ListItem>Full Time</asp:ListItem>
                                            <asp:ListItem>Part Time</asp:ListItem>
                                            <asp:ListItem>Work From Home</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Location</label>
                                        <asp:TextBox ID="txtLocation" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Start Date</label>
                                        <asp:TextBox ID="txtStartDate" runat="server" class="form-control" />
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Skills needed</label>
                                        <asp:TextBox ID="txtSkillNeeded" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Perks</label>
                                        <asp:TextBox ID="txtPerks" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Responsibilities</label>
                                        <asp:TextBox ID="txtResponsibilities" runat="server" class="form-control" />
                                    </div>

                                    <%--<div class="form-group">
                                        <label class="control-label">Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Confim Password</label>
                                        <asp:TextBox ID="txtPasswordConfirm" runat="server" class="form-control" TextMode="Password" />
                                    </div>--%>
                                    <div class="form-group">
                                        <asp:Button Text="Save" runat="server" class="btn btn-common" ID="btnCompanySkills" OnClick="btnCompanySkills_Click"/>
                                    </div>

                                </div>

                                <div class="panel-body">
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

                                    <%--<div class="form-group">
                                        <label class="control-label">Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Confim Password</label>
                                        <asp:TextBox ID="txtPasswordConfirm" runat="server" class="form-control" TextMode="Password" />
                                    </div>--%>
                                    <div class="form-group">
                                        <asp:Button Text="Save" runat="server" class="btn btn-common" ID="btnInsertUrl" OnClick="btnInsertUrl_Click"/>
                                        <asp:Button Text="Clear All" runat="server" id="btnClear" class="btn btn-common" OnClick="btnClear_Click"/>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

