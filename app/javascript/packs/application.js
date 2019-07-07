// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
// require("@rails/actiontext")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
import '@rails/actiontext';
import '../../../node_modules/bootstrap/dist/js/bootstrap.min.js';
import './cocoon.js';
import Sortable from 'sortablejs';
import Typed from 'typed.js';


$(document).ready(function(){
  // console.log(window.location.href)
  typed()
  set_position()
  
  const el = document.getElementById('portfolio-card');
  let updatedValue = []
  if (el) {
   Sortable.create(el, {
      onUpdate: function (){
        const portfolio_item = $('.portfolio-card')
        $.each(portfolio_item, function(index, value){
          updatedValue.push({
            id: $(value).data('id'),
            position: index + 1
          })
        })
        updatePosition(updatedValue)
      }
    });
  }
 })

function typed(){
  const typed = new Typed('#typed', {
     stringsElement: '#typed-strings',    
     typeSpeed: 50
  });
}

function set_position() {
  const portfolio_item = $('.portfolio-card')
  $.each(portfolio_item, function( index, value  ) {
    $(value).attr('data-pos', index+1)
  });
}

function updatePosition(order) {
  $.ajax({
    url: '/portfolios/sort', 
    type: 'PUT',
    data: {order: order},
  })
  return
}

