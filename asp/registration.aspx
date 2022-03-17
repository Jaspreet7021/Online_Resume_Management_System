<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Page Header Start -->
    <div class="page-header" style="background: url(assets/img/banner1.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-wrapper">
                        <h2 class="page-title">Join Us</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <!-- Content section Start -->
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                    <div class="page-login-form box">
                        <h3>Register
                        </h3>
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
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Confim Password</label>
                            <asp:TextBox ID="txtPasswordConfirm" runat="server" class="form-control" TextMode="Password" />
                        </div>
                        <div class="form-group">
                            <asp:Button Text="Save" runat="server" class="btn btn-common" ID="btn_registeration_save" OnClick="btn_registeration_save_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Content section End -->


</asp:Content>

