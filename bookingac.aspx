<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookingac.aspx.cs" Inherits="fixmojowebsite.bookingac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="booking.css" rel="stylesheet" />
    <div class="box">
        <center><h1>Booking Details</h1></center>
        <% if (!string.IsNullOrEmpty(lblgenac.Text)) { %>
            <asp:Label ID="lblGenacName" runat="server" Text="General Service"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblgenac" runat="server" Text="General Service Quantity"></asp:Label><br />
        <% } %>
        <% if (!string.IsNullOrEmpty(lblwetac.Text)) { %>
            <asp:Label ID="lblWetacName" runat="server" Text="Wet Service"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblwetac" runat="server" Text="Wet Service Quantity"></asp:Label><br />
        <% } %>
        <% if (!string.IsNullOrEmpty(lblinstac.Text)) { %>
            <asp:Label ID="lblInstacName" runat="server" Text="Installation"></asp:Label>&nbsp;&nbsp<asp:Label ID="lblinstac" runat="server" Text="Installation Quantity"></asp:Label><br />
        <% } %>
        <% if (!string.IsNullOrEmpty(lbluninac.Text)) { %>
            <asp:Label ID="lblUninacName" runat="server" Text="Uninstall"></asp:Label>&nbsp;&nbsp<asp:Label ID="lbluninac" runat="server" Text="Uninstall Quantity"></asp:Label><br />
        <% } %>
        <asp:Label ID="lblSubtotalText" runat="server" Text="Subtotal:"></asp:Label><asp:Label ID="lblSubtotal" runat="server" Text="Subtotal "></asp:Label><br />
        <asp:Label ID="lblTaxText" runat="server" Text="Tax (5%):"></asp:Label> <asp:Label ID="lblTax" runat="server" Text="Tax"></asp:Label><br />
        <asp:Label ID="lblShippingText" runat="server" Text="Shipping:"></asp:Label><asp:Label ID="lblShipping" runat="server" Text="Shipping Charges"></asp:Label><br />
        _________________________________________________<br />
        <asp:Label ID="lblTotalText" runat="server" Text="Total:"></asp:Label><asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label><br />

        <div class="app">
      <h2>Fix Appointment Date</h2>
      <label for="txtAppointmentDate">Appointment Date:</label>
          <asp:TextBox ID="appointment"  runat="server" TextMode="Date" CssClass="dateTextBox"></asp:TextBox><br />
     <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br />
     </div>
      Enter the Registered email: <asp:TextBox ID="lblemail" runat="server"></asp:TextBox>
       <asp:RegularExpressionValidator runat="server" ControlToValidate="lblemail" Display="Dynamic" ErrorMessage="Invalid email id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
      <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter phone number"></asp:TextBox><br />
          <asp:Button ID="btnSubmitAppointment" runat="server" Text="Submit"  OnClick="btnSubmitAppointment_Click" OnClientClick="return promptForEmail();" />
      <asp:HiddenField ID="hiddenEmailField" runat="server" />
    </div>

    <script>
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var yyyy = today.getFullYear();
        var minDate = yyyy + '-' + mm + '-' + dd;
        document.getElementById('<%= appointment.ClientID %>').setAttribute('min', minDate);


    </script>
        
</asp:Content>
