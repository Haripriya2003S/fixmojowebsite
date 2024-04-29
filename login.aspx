<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="fixmojowebsite.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="login.css" rel="stylesheet" />
    <div class="box">
<center>LOGIN<br />
    <asp:Label ID="errmsg" runat="server" Text=""></asp:Label>
    EMAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="email" runat="server"></asp:TextBox><br />
    PASSWORD <asp:TextBox ID="password" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></center>
       </div>
</asp:Content>
