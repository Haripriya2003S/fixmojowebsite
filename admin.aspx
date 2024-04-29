<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="fixmojowebsite.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="adserv.css" rel="stylesheet" />
      <div class="main">
          <h1>Hello!! Admin</h1>

        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div class="card" style="background-color:yellow">

            <div class="image">
                <img src="imgnvid/adminpainting.jpg">
            </div>
            <div class="title">
                <h4>
          PAINTING
                </h4>
            </div>
            <div class="des">
                <asp:Button ID="Button1" runat="server" Text="View Orders" OnClick="Button1_Click" />
                
            </div>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        
        <div class="card" style="background-color:yellow">

            <div class="image">
                <img src="imgnvid/adminac.jpg">
            </div>
            <div class="title">
                <h4>
          AC REPAIR
                </h4>
            </div>
            <div class="des">
                <asp:Button ID="Button2" runat="server" Text="View Orders"  OnClick="Button2_Click"/>
               
            </div>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div class="card" style="background-color:yellow">

           <div class="image">
                <img src="imgnvid/admincarpen.jpg">
            </div>
            <div class="title">
                <h4>
               CARPENTER
                </h4>
            </div>
            <div class="des">
                <asp:Button ID="Button3" runat="server" Text="View Orders" OnClick="Button3_Click" />
               
            </div>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          
     <div class="card" style="background-color:yellow">
            <div class="image">
                <img src="imgnvid/adminclean.jpg">
            </div>
            <div class="title">
                <h4>
         HOUSE CLEANING
                </h4>
            </div>
            <div class="des">
                <asp:Button ID="Button4" runat="server" Text="View Orders"  OnClick="Button4_Click"/>
              </div>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
          <br />
&nbsp;<br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          
         <div class="card" style="background-color:yellow">
       <div class="image">
           <img src="imgnvid/eleadmin.jpeg">
       </div>
       <div class="title">
           <h4>
        ELECTRICIAN
           </h4>
       </div>
       <div class="des">
           <asp:Button ID="Button5" runat="server" Text="View Orders"  OnClick="Button5_Click"/>
         </div></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


             <div class="card" style="background-color:yellow">
                 <div class="image">
               <img src="imgnvid/plumbadmin.jpeg">
                  </div>
                  <div class="title">
                    <h4>
                  PLUMBER
                  </h4>
                 </div>
                 <div class="des">
                     <asp:Button ID="Button6" runat="server" Text="Button" OnClick="Button6_Click" />
                      </div><br />

    </div>       
    </div>  <br />  <br />  <br />  <br /><br />

    
</asp:Content>
