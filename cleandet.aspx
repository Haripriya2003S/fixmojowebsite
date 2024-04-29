<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cleandet.aspx.cs" Inherits="fixmojowebsite.cleandet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
     <h2>House Cleaning Service Order History</h2><br /><br />
   <center> <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#FDFFAB" Width="90%">
  <Columns >
      <asp:BoundField DataField="orderID" HeaderText="Order ID" />
      <asp:BoundField DataField="qtyn1" HeaderText="Service Name" />
      <asp:BoundField DataField="qty1" HeaderText="Service 1" />
      <asp:BoundField DataField="qtyn2" HeaderText="Service Name" />
      <asp:BoundField DataField="qty2" HeaderText="Service 2" />
      <asp:BoundField DataField="qtyn3" HeaderText="Service Name" />
      <asp:BoundField DataField="qty3" HeaderText="Service 3" />
      <asp:BoundField DataField="qtyn4" HeaderText="Service Name" />
      <asp:BoundField DataField="qty4" HeaderText="Service 4" />
      <asp:BoundField DataField="total" HeaderText="Total" />
      <asp:BoundField DataField="email" HeaderText="Email" />
  </Columns>
       <HeaderStyle BackColor="#BEADFA"  />
      </asp:GridView>
      
       
   </center>
     </div><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
