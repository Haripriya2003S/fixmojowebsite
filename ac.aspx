<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ac.aspx.cs" Inherits="fixmojowebsite.ac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="serve.css" rel="stylesheet" />
 <div class="wrapper">
	
		<div class="project">
			<div class="shop">
				<div class="box">
					<img src="imgnvid/genac.jpg">
					<div class="content">
						<h3>General Service</h3>
						<h4>Rs.450</h4>
						<p class="unit">Quantity: <input id="genacQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
				<div class="box">
					<img src="imgnvid/wetac.jpg">
					<div class="content">
						<h3>Wet Service</h3>
						<h4>Rs.750</h4>
						<p class="unit">Quantity: <input id="wetacQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
                <div class="box">
					<img src="imgnvid/acinstall.jpg">
					<div class="content">
						<h3>Installation</h3>
						<h4>Rs.600</h4>
						<p class="unit">Quantity: <input id="instacQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
                <div class="box">
					<img src="imgnvid/acunin.jpg">
					<div class="content">
						<h3>Uninstall</h3>
						<h4>Rs.500</h4>
						<p class="unit">Quantity: <input id="uninacQuantity" name="" value="" onchange="updateTotal()"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
            
			</div>
			<div id="totalSection" class="right-bar">
				<p><span>Subtotal</span> <span id="subtotal">$120</span></p>
				<hr>
				<p><span>Tax (5%)</span> <span id="tax">$6</span></p>
				<hr>
				<p><span>Shipping</span> <span id="shipping">$15</span></p>
				<hr>
				<p><span>Total</span> <span id="total">$141</span></p><a id="checkoutBtn" href="#" onclick="return populateBookingDetails()"><i class="fa fa-shopping-cart"></i>Book Now</a>
			</div>
		</div>
	</div>

    <script>
        function populateBookingDetails() {
            var genacQuantity = document.getElementById('genacQuantity').value;
            var wetacQuantity = document.getElementById('wetacQuantity').value;
            var instacQuantity = document.getElementById('instacQuantity').value;
			var uninacQuantity = document.getElementById('uninacQuantity').value;
            var genacName = document.querySelector('.project .shop .box:nth-child(1) .content h3').innerText;
			var wetacName = document.querySelector('.project .shop .box:nth-child(2) .content h3').innerText;
            var instacName = document.querySelector('.project .shop .box:nth-child(3) .content h3').innerText;
            var uninacName = document.querySelector('.project .shop .box:nth-child(4) .content h3').innerText;
          
            var subtotal = document.getElementById('subtotal').innerText;
            var tax = document.getElementById('tax').innerText;
            var shipping = document.getElementById('shipping').innerText;
            var total = document.getElementById('total').innerText;

            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'bookingac.aspx';

            if (parseInt(genacQuantity) > 0) {
                var genacNameInput = document.createElement('input');
                genacNameInput.type = 'hidden';
                genacNameInput.name = 'genacName';
                genacNameInput.value = genacName;
                form.appendChild(genacNameInput);

                var genacQuantityInput = document.createElement('input');
                genacQuantityInput.type = 'hidden';
                genacQuantityInput.name = 'genacQuantity';
                genacQuantityInput.value = genacQuantity;
                form.appendChild(genacQuantityInput);
			}
            if (parseInt(wetacQuantity) > 0) {
                var wetacNameInput = document.createElement('input');
                wetacNameInput.type = 'hidden';
                wetacNameInput.name = 'wetacName';
                wetacNameInput.value = wetacName;
                form.appendChild(wetacNameInput);

                var wetacQuantityInput = document.createElement('input');
                wetacQuantityInput.type = 'hidden';
                wetacQuantityInput.name = 'wetacQuantity';
                wetacQuantityInput.value = wetacQuantity;
                form.appendChild(wetacQuantityInput);
            }
            if (parseInt(instacQuantity) > 0) {
                var instacNameInput = document.createElement('input');
                instacNameInput.type = 'hidden';
                instacNameInput.name = 'instacName';
                instacNameInput.value = instacName;
                form.appendChild(instacNameInput);

                var instacQuantityInput = document.createElement('input');
                instacQuantityInput.type = 'hidden';
                instacQuantityInput.name = 'instacQuantity';
                instacQuantityInput.value = instacQuantity;
                form.appendChild(instacQuantityInput);
            }
            if (parseInt(uninacQuantity) > 0) {
                var uninacNameInput = document.createElement('input');
                uninacNameInput.type = 'hidden';
                uninacNameInput.name = 'uninacName';
                uninacNameInput.value = uninacName;
                form.appendChild(uninacNameInput);

                var uninacQuantityInput = document.createElement('input');
                uninacQuantityInput.type = 'hidden';
                uninacQuantityInput.name = 'uninacQuantity';
                uninacQuantityInput.value = uninacQuantity;
                form.appendChild(uninacQuantityInput);
            }
            var subtotalInput = document.createElement('input');
            subtotalInput.type = 'hidden';
            subtotalInput.name = 'subtotal';
            subtotalInput.value = subtotal;
            form.appendChild(subtotalInput);

            var taxInput = document.createElement('input');
            taxInput.type = 'hidden';
            taxInput.name = 'tax';
            taxInput.value = tax;
            form.appendChild(taxInput);

            var shippingInput = document.createElement('input');
            shippingInput.type = 'hidden';
            shippingInput.name = 'shipping';
            shippingInput.value = shipping;
            form.appendChild(shippingInput);

            var totalInput = document.createElement('input');
            totalInput.type = 'hidden';
            totalInput.name = 'total';
            totalInput.value = total;
            form.appendChild(totalInput);


            // Append the form to the document body and submit it
            document.body.appendChild(form);
            form.submit();
        }


        function updateTotal() {
			var genacPrice = 450;
			var wetacPrice = 750;
			var instacPrice = 600;
			var uninacPrice = 500;
			

            var genacQuantity = parseInt(document.getElementById('genacQuantity').value) || 0;
            var wetacQuantity = parseInt(document.getElementById('wetacQuantity').value) || 0;
            var instacQuantity = parseInt(document.getElementById('instacQuantity').value) || 0;
            var uninacQuantity = parseInt(document.getElementById('uninacQuantity').value) || 0;
           
           

			var subtotal = genacPrice * genacQuantity + wetacPrice * wetacQuantity + instacPrice * instacQuantity + uninacPrice * uninacQuantity ;
            var tax = subtotal * 0.05;
            var shipping = 15;
            var total = subtotal + tax + shipping;

            document.getElementById('subtotal').innerText = 'Rs ' + subtotal;
            document.getElementById('tax').innerText = 'Rs ' + tax;
            document.getElementById('total').innerText = 'Rs ' + total;
        }
    </script>
</asp:Content>
