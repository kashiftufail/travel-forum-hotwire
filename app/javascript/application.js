// import "@hotwired/turbo-rails"
// import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails";
import "./controllers";
// import * as bootstrap from "bootstrap"
import "@fortawesome/fontawesome-free/js/all";
import "./src/jquery";
import "./src/bootstrap-min";
import "./src/owl-carousel";

// import * as bootstrap from "bootstrap";


$(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1500,
    margin: 30,
    dots: true,
    loop: true,
    center: true,
    responsive: {
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:2
        },
        992:{
            items:3
        }
    }
});


$(function(){
    console.log('jfksdj')
})

