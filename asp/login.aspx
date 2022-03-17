<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Page Header Start -->
    <div class="page-header" style="background: url(assets/img/banner1.jpg);">
      <div class="container">
        <div class="row">         
          <div class="col-md-12">
            <div class="breadcrumb-wrapper">
              <h2 class="page-title">Login to account</h2>
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
                <div class="col-sm-6 col-sm-offset-4 col-md-4 col-md-offset-4">
                    <div class="page-login-form box">
                        <h3>Login
                        </h3>
                            <div class="form-group">
                                <div class="input-icon">
                                    <i class="icon fa fa-user"></i>
                                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Username" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-icon">
                                    <i class="icon fa fa-unlock-alt"></i>
                                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" class="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="remember" name="rememberme" value="forever" style="float: left;">
                                <label for="remember">Remember me</label>
                            </div>
                             <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-common log-btn" OnClick="btnLogin_Click"/>
                        <ul class="form-links">
                            <li class="pull-left"><a href="signup.html">Don't have an account?</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Content section End -->
</asp:Content>

