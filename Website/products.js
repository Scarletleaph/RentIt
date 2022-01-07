const productjson = [
    {
        "Product Id" : 1,
        "ProductName": "Product1",
        "RentorId" : 1,
        "RentAmount": 1000
    },
    {
        "Product Id" : 1,
        "ProductName": "Product2",
        "RentorId" : 1,
        "RentAmount": 5000
    }
]
// above is temp json file 
///TODO:  Write jquery to get the json data from webserver.




const pro = document.getElementById('allProducts');
pro.innerHTML = "";
    for(let i = 0; i < productjson.length; i++){
      let SingleProduct = productjson[i];
      
        pro.innerHTML += `<div onclick="window.location.href='sproduct.html';" class="product text-center col-lg-3 col-md-4 col-12">
        <img class="img-fluid mb-3" src="img/featured/guitar.jpg" alt="">
        <div class="star">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
        </div>
        <h5 class="p-name">${SingleProduct.ProductName}</h5>
        <h4 class="p-price">${SingleProduct.RentAmount}</h4>
        <button class="buy-btn">Buy Now</button>
    </div>`;
    }