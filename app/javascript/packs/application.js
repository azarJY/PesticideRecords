// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 

// カレンダー形式用java設定

document.addEventListener('DOMContentLoaded', function() {
  flatpickr('.flatpickr', {
    dateFormat: 'Y-m-d',
    locale: 'ja',
  });
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
