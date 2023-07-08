import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-product"
export default class extends Controller {
  
  connect() {     
  }

  addQuantity(){
    var quan = parseInt(document.getElementById('sst').value);
    if ( !isNaN( quan )){
      quan += 1
      document.getElementById('sst').value = quan;
    } 
  }
  decreaseQuantity(){    
    var quan = parseInt(document.getElementById('sst').value);
    if ( !isNaN( quan ) && quan > 0){
      quan -= 1
      document.getElementById('sst').value = quan;
    }  
  }
}
