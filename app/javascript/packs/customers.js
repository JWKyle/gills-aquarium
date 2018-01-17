import "hello_angular/polyfills";
import { Component, NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { FormsModule } from "@angular/forms";
import { platformBrowserDynamic } from "@angular/platform-browser-dynamic";

var CustomerSearchComponent = Component({
  selector: "gills-customer-search",
  template: ' \
<header> \
  <h1 class="h2"> Customer Search</h1> \
</header> \

<section class="search-form"> \
  <%= form_for :customers, method: :get do |f| %> \
    <div class="input-group input-group-lg"> \
      <%= label_tag :keywords, nil, class: "sr-only" %> \
      <%= text_field_tag :keywords, nil, placeholder: "First Name, Last Name, or E-mail Address", class: "form-control input-lg" %> \
      <span class="input-group-btn"> \
        <%= submit_tag "Find Customers", class: "btn btn-primary btn-lg" %> \
      </span> \
    </div> \
  <% end %> \
</section> \

<section class="search-results"> \
  <header> \
    <h1 class="h3">Search Results</h1> \
  </header> \
  <% if @customers.present? %> \
    <%= render partial: "pager", locals: { keywords: @keywords, page: @page } %> \
  <% end %> \
  <ol class="list-group"> \
    <% @customers.each do |customer| %> \
      <li class="list-group-item clearfix"> \
        <h3 class="pull-right"> \
          <small class="text-uppercase">Joined</small> <%= l customer.created_at.to_date%> \
        </h3> \
        <h2 class="h3"> \
          <%= customer.first_name%> <%= customer.last_name%> \
          <small><%= customer.username%></small> \
        </h2> \
        <h4><%= customer.email%></h4> \
      </li> \
    <% end %> \
  </ol> \
  <% if @customers.present? %> \
    <%= render partial: "pager", locals: { keywords: @keywords, page: @page } %> \
    <% end %> \
</section> \ '
}).Class({
  constructor: function() {
  }
});

var CustomerAppModule = NgModule({
  imports: [ BrowserModule, FormsModule ],
  declarations: [ CustomerSearchComponent ],
  bootstrap: [ CustomerSearchComponent ]
})
.Class({
  constructor: function() {}
});

platformBrowserDynamic().bootstrapModule(CustomerAppModule);
