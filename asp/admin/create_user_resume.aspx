<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="create_user_resume.aspx.cs" Inherits="admin_create_user_resume" %>

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
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#collapseB1" data-toggle="collapse">Resume Details </a></h4>
                                </div>
                                <div class="panel-collapse collapse in" id="collapseB1">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="control-label">Education</label>
                                            <asp:TextBox ID="txtEducation" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Language</label>
                                            <asp:TextBox ID="txtLanguage" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Skills</label>
                                            <asp:TextBox ID="txtSkills" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Professional Summary</label>
                                            <asp:TextBox ID="txtProfSummary" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Certificate</label>
                                            <asp:TextBox ID="txtCertificate" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Project</label>
                                            <asp:TextBox ID="txtProject" runat="server" class="form-control " />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Training</label>
                                            <asp:TextBox ID="txtTraining" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Additional Details</label>
                                            <asp:TextBox ID="txtAdditionalDetails" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Additional Details</label>
                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Hobbies</label>
                                            <asp:TextBox ID="txtHobbies" runat="server" class="form-control" />
                                        </div>
                                        <%--<div class="form-group hide">
                                                    <label class="control-label">Facebook account map</label>
                                                    <div class="form-control">
                                                        <a class="link" href="fb.com">Jhone.doe</a>
                                                        <a class=""><i class="fa fa-minus-circle"></i></a>
                                                    </div>
                                                </div>--%>
                                        <div class="form-group">
                                            <asp:Button Text="Insert" runat="server" ID="btnInsertResume" class="btn btn-common" OnClick="btnInsertResume_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a aria-expanded="false" class="collapsed" href="#collapseB2" data-toggle="collapse">User Details </a></h4>
                                </div>
                                <div style="height: 0px;" aria-expanded="false" class="panel-collapse collapse" id="collapseB2">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="control-label">Name</label>
                                            <asp:TextBox ID="txtName" runat="server" class="form-control" />
                                        </div>
                                        <asp:HiddenField runat="server" ID="hfUserCode"/>
                                        <div class="form-group">
                                            <label class="control-label">Email id</label>
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Date of birth</label>
                                            <asp:TextBox ID="txtdob" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Mobile</label>
                                            <asp:TextBox ID="txtMobile" runat="server" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Address</label>
                                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" />
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Country</label>
                                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" DataValueField="country_id" DataTextField="country"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">State</label>
                                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" DataValueField="state_id" DataTextField="state"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">City</label>
                                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" DataValueField="city_id" DataTextField="city"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Gender</label>
                                            <asp:RadioButtonList ID="rblGender" runat="server" DataValueField="gender_id" DataTextField="gender">
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button runat="server" Text="Update" class="btn btn-common" id="btnUpdate" OnClick="btnUpdate_Click"></asp:Button>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a aria-expanded="false" class="collapsed" href="#collapseB3" data-toggle="collapse">Settings </a></h4>
                                </div>
                                <div style="height: 0px;" aria-expanded="false" class="panel-collapse collapse" id="collapseB3">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="control-label">New Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Confirm Password</label>
                                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-common">Update</button>
                                        </div>

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

