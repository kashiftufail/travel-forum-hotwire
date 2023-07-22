import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-product"
export default class extends Controller {

  connect() {
    
  }

  addQuantity() {
    var quan = parseInt(document.getElementById('sst').value);
    if (!isNaN(quan)) {
      quan += 1
      document.getElementById('sst').value = quan;
    }
  }
  addQuantityBulk() {
    var id = this.element.id;
    var inputField = document.getElementById('input-' + id);
    var quan = parseInt(inputField.value);
    if (!isNaN(quan)) {
      quan += 1
      inputField.value = quan;
    }
  }
  decreaseQuantity() {
    var quan = parseInt(document.getElementById('sst').value);
    if (!isNaN(quan) && quan > 0) {
      quan -= 1
      document.getElementById('sst').value = quan;
    }
  }

  decreaseQuantityBulk() {
    var id = this.element.id;
    var inputField = document.getElementById('input-' + id);
    var quan = parseInt(inputField.value);
    if (!isNaN(quan) && quan > 0) {
      quan -= 1
      inputField.value = quan;
    }
    if(quan === 0){        
        this.remove(id)
    }
  }

  toggel(event){
    let shipping = event.target.value
    let total = parseInt(document.getElementById('total_with_shipping').innerText);    
    if (shipping === "fast"){
         total += 5
         document.getElementById('total_with_shipping').innerText = total;
    }
    else {
      total -= 5
      document.getElementById('total_with_shipping').innerText = total ;
    }
  }

  remove(event){        
    var id;
    if (typeof(event) === 'string'){
      id = event
    }
    else{
      id = event.target.id    
    }    
    
    var token = document.querySelector(
      'meta[name="csrf-token"]'
    ).content;    
    
    fetch(`/line_items/${id}`, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': token,
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin',
      body: JSON.stringify({
       id: id      
      })
    }).then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));

  }    
  
}
