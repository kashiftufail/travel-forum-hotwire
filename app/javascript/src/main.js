$(document).on("turbo:load", () => {
  $(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1500,
    margin: 30,
    dots: true,
    loop: true,
    center: true,
    responsive: {
    0: {
        items: 1
    },
    576: {
        items: 1
    },
    768: {
        items: 2
    },
    992: {
        items: 3
    }
    }
  });
  
  var options = {  
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },  
      getValue: "title",  
      list: {
        match: {
          enabled: true
        }
      },  
      theme: "square"
    };  
  $("#countries").easyAutocomplete(options);  
  $("#booking_departure_date").flatpickr();  
  $("#booking_return_date").flatpickr();  


  var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
    removeItemButton: true,
    maxItemCount:5,
    searchResultLimit:5,
    placeholder: true,
    renderChoiceLimit:5
  }); 

});