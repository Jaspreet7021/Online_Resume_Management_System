<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-3 page-sideabr">
        <aside>
            <div class="inner-box">
                <div class="user-panel-sidebar">
                    <%--<div class="collapse-box">
                                            <h5 class="collapset-title no-border">My Classified <a aria-expanded="true" class="pull-right" data-toggle="collapse" href="#myclassified"><i class="fa fa-angle-down"></i></a></h5>
                                            <div aria-expanded="true" id="myclassified" class="panel-collapse collapse in">
                                                <ul class="acc-list">
                                                    <li class="active">
                                                        <a href="account-home.html"><i class="fa fa-home"></i>Links</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>--%>
                    <div class="collapse-box">
                        <h5 class="collapset-title">My Links <a aria-expanded="true" class="pull-right" data-toggle="collapse" href="#myads"><i class="fa fa-angle-down"></i></a></h5>
                        <div aria-expanded="true" id="myads" class="panel-collapse collapse in">
                            <ul class="acc-list">
                                <li>
                                    <a href="create_user_resume.aspx"><%--<i class="fa fa-heart-o"></i>--%>Create Resume<span class="badge"></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="collapse-box">
                        <h5 class="collapset-title">Terminate Account <a aria-expanded="true" class="pull-right" data-toggle="collapse" href="#close"><i class="fa fa-angle-down"></i></a></h5>
                        <div aria-expanded="true" id="close" class="panel-collapse collapse in">
                            <ul class="acc-list">
                                <li>
                                    <asp:Button Text="Logout" runat="server" CssClass="btn btn-danger" ID="btnLogout" OnClick="btnLogout_Click" />
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="inner-box">
                                    <div class="widget-title">
                                        <h4>Advertisement</h4>
                                    </div>
                                    <img src="assets/img/img1.jpg" alt="">
                                </div>--%>
        </aside>
    </div>
    <div class="col-sm-9 page-content">
        <div class="inner-box">
            <div class="usearadmin">
                <h3><a href="#">
                    <%--<img class="userimg" src="assets/img/user.jpg" alt="" />--%>
                               Welcome
                    <asp:Label ID="lblName" runat="server" /></a></h3>
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
                                <label class="control-label">Objective</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckObjective"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Education</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckEducation"  ></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Language</label>
                                <asp:TextBox ID="txtLanguage" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Skills</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckSkills"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Technical Knowledge</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckTechnical"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Certificate</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckCertificate"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Project</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckProject"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Training</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckTraining"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Additional Details</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckAdditionalDetails"></CKEditor:CKEditorControl>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Strengths</label>
                                <CKEditor:CKEditorControl runat="server" ID="ckStrengths"></CKEditor:CKEditorControl>
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
                                <asp:Button Text="Insert" runat="server" ID="btnInsertResume" class="btn btn-common" OnClick="btnInsertResume_Click" />
                                <asp:Button Text="Print Resume" runat="server" ID="btnPrint" class="btn btn-common" OnClick="btnPrint_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a class="collapsed" href="#collapseB2" data-toggle="collapse">User Details </a></h4>
                    </div>
                    <div style="height: 0px;" aria-expanded="false" class="panel-collapse collapse" id="collapseB2">
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="control-label">Name</label>
                                <asp:TextBox ID="txtName" runat="server" class="form-control" />
                            </div>
                            <asp:HiddenField runat="server" ID="hfUserCode" />
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
                                <asp:Button runat="server" Text="Update" class="btn btn-common" ID="btnUpdate" OnClick="btnUpdate_Click"></asp:Button>
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
                                <asp:Button runat="server" Text="Update" class="btn btn-common" ID="btnUpdatePassword" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="ckeditor/ckeditor.js"></script>
    </div>
</asp:Content>

