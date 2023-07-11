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
    // alert('ok')
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
    // alert('ok')
    var id = this.element.id;
    var inputField = document.getElementById('input-' + id);
    var quan = parseInt(inputField.value);
    if (!isNaN(quan)) {
      quan -= 1
      inputField.value = quan;
    }
  }
  
}
