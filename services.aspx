<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="fixmojowebsite.services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="servicepg.css" rel="stylesheet" />
   <br /><br />
    <center> <asp:Panel ID="Panel1" runat="server"  Height="143px" Width="77%" BackColor="#FFFF66" Font-Bold="True" Font-Italic="False" Font-Size="Large" ForeColor="#FF3300" BorderStyle="None" BorderBottom-BorderStyle="None" BorderColor="#FFFFCC" GroupingText="OUR TRENDING SERVICES" CssClass="auto-style2">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="97px" ImageUrl="~/imgnvid/ac.png" onClick="ImageButton1_Click" style="margin-left: 70px" Width="106px" />
    &nbsp;&nbsp;
<asp:ImageButton ID="ImageButton2" runat="server"  Height="97px" Width="106px" ImageUrl="~/imgnvid/car.png" OnClick="ImageButton2_Click"/>&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton3" runat="server"  Height="97px" Width="106px" ImageUrl="~/imgnvid/clean2.png"  OnClick="ImageButton3_Click" />&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton4" runat="server"  Height="97px" Width="106px" ImageUrl="~/imgnvid/ele2.png" OnClick="ImageButton4_Click" />&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton5" runat="server"  Height="97px" Width="106px" ImageUrl="~/imgnvid/paint.png" OnClick="ImageButton5_Click"/>&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton6" runat="server"  Height="97px" Width="106px" ImageUrl="~/imgnvid/pestcon.png"  OnClick="ImageButton6_Click"/>&nbsp;&nbsp;
<asp:ImageButton ID="ImageButton7" runat="server"  Height="97px" Width="106px" ImageUrl="~/imgnvid/pl2.png" OnClick="ImageButton7_Click" /> &nbsp;&nbsp;

     </asp:Panel></center>
     <div class="card-list">
        <a href="services.aspx" class="card-item">
            <img src="imgnvid/nontoxic.jpg" alt="Card Image">
            <span class="developer">Services</span>
            <h3>We offer services with Non-Toxic products</h3>
            <div class="arrow">
                <i class="fas fa-arrow-right card-icon"></i>
            </div>
        </a>
        <a href="contact.aspx" class="card-item">
            <img src="imgnvid/customercare.jpg" alt="Card Image">
            <span class="designer">Customer Care</span>
            <h3>Here at Fixmojo, we believe that exceptional customer support is not just a service – it's a commitment. </h3>
            <div class="arrow">
                <i class="fas fa-arrow-right card-icon"></i>
            </div>
        </a>
        <a href="#" class="card-item">
            <img src="imgnvid/trainedprof.jpg" alt="Card Image">
            <span class="editor">Service Heros</span>
            <h3> we take pride in our team of trained professionals who are the backbone of our service excellence.</h3>
            <div class="arrow">
                <i class="fas fa-arrow-right card-icon"></i>
            </div>
        </a>
    </div>
<br /><br /><br /><br /><br />
</asp:Content>
