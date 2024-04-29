<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="fixmojowebsite.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="register.css" rel="stylesheet" />
   
   <div class="box">
       <center><h2>REGISTER</h2>
           <p>
               &nbsp;</p>
       </center> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USERNAME:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="username" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator runat="server" ControlToValidate="username" ErrorMessage="Required" ForeColor="Red" />
       <br />
       <BR />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASSWORD:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
       <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="Required" ForeColor="Red" />
       <br />
       <br />
       &nbsp;&nbsp;&nbsp;&nbsp; CONFIRM PASSWORD:<asp:TextBox ID="conpwd" runat="server" TextMode="Password"></asp:TextBox>
       <asp:CompareValidator runat="server" ControlToCompare="password" ControlToValidate="conpwd" ErrorMessage="Passwords do not match." ForeColor="Red" />
       <br />
       
       &nbsp;&nbsp;&nbsp;&nbsp; PHONE NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="phno" runat="server" TextMode="Number"></asp:TextBox>
       <asp:RequiredFieldValidator runat="server" ControlToValidate="phno" ErrorMessage="Required" ForeColor="Red" />
       <br />
       <br />
       &nbsp;&nbsp;&nbsp;&nbsp; EMAIL ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="email" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" />
&nbsp;
       <asp:RegularExpressionValidator runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Invalid email id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
       <br /><br />
       <center><asp:Button ID="regbutton" runat="server" Text="Submit" onclick="regbutton_Click" /></center>
       <br />
       <center>
       
       </div>

 
   
</asp:Content>
