<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rate.aspx.cs" Inherits="fixmojowebsite.rate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <title></title>

    <link href="rate.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>

    #Button1 {
        height: 30px;
        width: 300px;
        border: 1px solid #444;
        outline: none;
        background: #222;
        color: #999;
        font-size: 17px;
        font-weight: 500;
       margin-top:40px;
        text-transform: uppercase;
        cursor: pointer;
        transition: all 0.3s ease;
    }
</style>

</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="post">
                <div class="text">
                    <img src="https://gifsec.com/wp-content/uploads/2022/09/thank-you-gif-6.gif" style="height:400px" />
                </div>
                <div class="edit">EDIT</div>
            </div>
            <div class="star-widget">
                <input type="radio" name="rate" id="rate-5">
                <label for="rate-5" class="fas fa-star"></label>
                <input type="radio" name="rate" id="rate-4">
                <label for="rate-4" class="fas fa-star"></label>
                <input type="radio" name="rate" id="rate-3">
                <label for="rate-3" class="fas fa-star"></label>
                <input type="radio" name="rate" id="rate-2">
                <label for="rate-2" class="fas fa-star"></label>
                <input type="radio" name="rate" id="rate-1">
                <label for="rate-1" class="fas fa-star"></label>

                <br />
                <br />

               
                    <header>
                        <br />
                        <br />
                    </header>

                    <!-- Enclose the TextBox within the form -->

                    <div class="textarea">
                        <asp:TextBox ID="info" runat="server" TextMode="MultiLine" Placeholder="Write about your experience"></asp:TextBox><br />
                    </div> <br />
                    <asp:TextBox ID="user" runat="server" TextMode="MultiLine" Width="330px" BackColor="#1e1e1e" ForeColor="white" Placeholder="Enter your email address"></asp:TextBox>
                    <br />
               

         
            </div>
                <asp:Button ID="Button1" runat="server" Text="POST" BackColor="#1e1e1e" ForeColor="WHITE" OnClick="rateus"/>
        </div>
        
    </form>
    <script>
        const btn = document.querySelector("button");
        const post = document.querySelector(".post");
        const widget = document.querySelector(".star-widget");
        const editBtn = document.querySelector(".edit");
        btn.onclick = () => {
            widget.style.display = "none";
            post.style.display = "block";
            editBtn.onclick = () => {
                widget.style.display = "block";
                post.style.display = "none";
            }
            return false;
        }
    </script>
</body>

</html>