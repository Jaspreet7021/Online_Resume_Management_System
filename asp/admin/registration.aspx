<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="admin_registration" %>


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
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" DataValueField="state_id" DataTextField="state" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
                                        <label class="control-label">Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password"/>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Confim Password</label>
                                        <asp:TextBox ID="txtPasswordConfirm" runat="server" class="form-control" TextMode="Password"/>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button Text="Save" runat="server" class="btn btn-common" ID="btn_registeration_save" OnClick="btn_registeration_save_Click"/>
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

