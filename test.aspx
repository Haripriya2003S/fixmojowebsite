%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="fixmojowebsite.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="css/swiper-bundle.min.css" />
 
    <link href="test.css" rel="stylesheet" />
  
    <link
      href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
      rel="stylesheet"
</head>
<body>
     <section class="container">
      <div class="testimonial mySwiper">
        <div class="testi-content swiper-wrapper">
          <div class="slide swiper-slide">
            <img src="#" alt="" class="image" />
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam,
              saepe provident dolorem a quaerat quo error facere nihil deleniti
              eligendi ipsum adipisci, fugit, architecto amet asperiores
              doloremque deserunt eum nemo.
            </p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name">Marnie Lotter</span>
              <span class="job">Web Developer</span>
            </div>
          </div>
          <div class="slide swiper-slide">
            <img src="#" alt="" class="image" />
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam,
              saepe provident dolorem a quaerat quo error facere nihil deleniti
              eligendi ipsum adipisci, fugit, architecto amet asperiores
              doloremque deserunt eum nemo.
            </p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name">Marnie Lotter</span>
              <span class="job">Web Developer</span>
            </div>
          </div>
          <div class="slide swiper-slide">
            <img src="#" alt="" class="image" />
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam,
              saepe provident dolorem a quaerat quo error facere nihil deleniti
              eligendi ipsum adipisci, fugit, architecto amet asperiores
              doloremque deserunt eum nemo.
            </p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name">Marnie Lotter</span>
              <span class="job">Web Developer</span>
            </div>
          </div>
        </div>
        <div class="swiper-button-next nav-btn"></div>
        <div class="swiper-button-prev nav-btn"></div>
        <div class="swiper-pagination"></div>
      </div>
    </section>
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 1,
            grabCursor: true,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
