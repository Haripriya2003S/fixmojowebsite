<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookingplum.aspx.cs" Inherits="fixmojowebsite.bookingplum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <link href="booking.css" rel="stylesheet" />
    <div class="box">
      
      <center> <h1>Booking Details</h1></center>
         <% if (!string.IsNullOrEmpty(lblpldrain.Text)) { %>
         <asp:Label ID="lblpldrainname" runat="server" Text="Painting" ></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblpldrain" runat="server" Text="painting"  ></asp:Label><br />   <% } %>
 
        <% if (!string.IsNullOrEmpty(lblplflush.Text)) { %>
        <asp:Label ID="lblplflushname" runat="server" Text="Water"  ></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblplflush" runat="server" Text="water" ></asp:Label><br /> <% } %>
  
        <% if (!string.IsNullOrEmpty(lblplsh.Text)) { %>
        <asp:Label ID="lblplshname" runat="server" Text="intpt"  ></asp:Label>&nbsp;&nbsp<asp:Label ID="lblplsh" runat="server" Text="intpt" ></asp:Label><br /> <% } %>
 
        <% if (!string.IsNullOrEmpty(lblplbasin.Text)) { %>
        <asp:Label ID="lblplbasinname" runat="server" Text="extpt" ></asp:Label>&nbsp;&nbsp<asp:Label ID="lblplbasin" runat="server" Text="extpt"  ></asp:Label><br /> <% } %>
 <asp:Label ID="lblSubtotalText" runat="server" Text="Subtotal:"  ></asp:Label><asp:Label ID="lblsubtotal" runat="server" Text="Subtotal "></asp:Label><br />
<asp:Label ID="lblTaxText" runat="server" Text="Tax (5%):"></asp:Label> <asp:Label ID="lbltax" runat="server" Text="Tax"></asp:Label><br />
   <asp:Label ID="lblShippingText" runat="server" Text="Shipping:"></asp:Label><asp:Label ID="lblship" runat="server" Text="Shipping Charges"></asp:Label><br />
 _________________________________________________<br />
 <asp:Label ID="lblTotalText" runat="server" Text="Total:"></asp:Label><asp:Label ID="lbltotal" runat="server" Text="Total"></asp:Label><br />
  
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

         function saveAppointmentDate() {
             var appointmentDate = document.getElementById('<%= appointment.ClientID %>').value;
             var email = document.getElementById('<%= lblemail.ClientID %>').value;

             // Validate appointment date and email here if needed

             // Call server-side method to save appointment date
             PageMethods.SaveAppointmentDate(appointmentdate, Email, onAppointmentSaved);
         }

         function saveAppointmentDetails() {
             var appointmentDate = document.getElementById('<%= appointment.ClientID %>').value;
        var email = document.getElementById('<%= lblemail.ClientID %>').value;

        // Validate appointment date and email here if needed

        // Call server-side method to save appointment date
        PageMethods.SaveAppointmentDate(appointmentdate, Email, onAppointmentSaved);
    }

    function onAppointmentSaved(result) {
        // Handle result if needed
        // For example, display a success message
        document.getElementById('<%= lblMessage.ClientID %>').innerText = "Appointment date and email saved successfully.";
    }
         
         


     
     </script>
      


</asp:Content>
