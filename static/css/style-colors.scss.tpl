{#/*============================================================================
style.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
      --static/css/style-async.css.tpl --> For non critical styles witch will be loaded asynchronously
      --static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{# /*============================================================================
  Table of Contents

  #Colors and fonts
    // Colors
    // Font families
    // SVG Icons
    // Texts
    // Backgrounds
  #Components
    // Margin and padding
    // Mixins
    // Animations
    // Functions
    // Wrappers
    // Placeholders
    // Dividers
    // Breadcrumbs
    // Headings
    // Buttons
    // Links
    // Chips
    // Modals
    // Forms
    // Tabs
    // Cards
    // Panels
    // Pills
    // Preloaders
    // Banners
    // Sliders
    // Tables
    // Cards
  #Home page
    // Instafeed
    // Video
  #Product grid
    // Grid item
    // Labels
    // Filters
  #Product detail
    // Image
    // Form and info
  #Contact page
    // Data contact
  #Account page
    // Order items
  #Header and nav
    // Ad Bar
    // Header
    // Search
  #Footer
  #Media queries
    // Forms

==============================================================================*/ #}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}
	
{# /* // Colors */ #}

$topbar-background-color: {{ settings.topbar_background }};
$topbar-text-color: {{ settings.topbar_text }};
$header-background-color: {{ settings.header_background }};
$header-text-color: {{ settings.header_text }};
$header-icon-color: {{ settings.header_icons }};
$nav-background-color: {{ settings.nav_background }};
$nav-text-color: {{ settings.nav_text }};

{# /* // BS = Banner Service */ #}
$bs-icon-color: {{ settings.banner_service_icon_color }};
$bs-description-color: {{ settings.banner_service_description_color }};


$grid-name-color: {{ settings.grid_name_color }};
$grid-price-color: {{ settings.grid_price_color }};

$about-us-background-color: {{ settings.about_us_background_color }};
$about-us-title-color: {{ settings.about_us_title_color }};
$about-us-description-color: {{ settings.about_us_description_color }};
$about-us-cta-color: {{ settings.about_us_cta_color }};

$footer-news-background-color: {{ settings.ft_newsletter_background_color }};
$footer-news-icon-color: {{ settings.ft_newsletter_icon_color }};
$footer-news-title-color: {{ settings.ft_newsletter_title_color }};
$footer-news-subtitle-color: {{ settings.ft_newsletter_subtitle_color }};

$footer-nav-background-color: {{ settings.ft_nav_background_color }};
$footer-nav-title-color: {{ settings.ft_nav_title_color }};
$footer-nav-text-color: {{ settings.ft_nav_text_color }};

$title-color: {{ settings.title_color }};
$subtitle-color: {{ settings.subtitle_color }};
$primary-color: {{ settings.primary_color }};
$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};
$background-secondary-color: {{ settings.background_secondary_color }};
$accent-color: {{ settings.accent_color }};
$add-to-cart-background-color: {{ settings.add_to_cart_background_color }};

{# /* // Font families */ #}

$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};

{# /* // SVG Icons */ #}

.svg-icon-primary{
  fill: $primary-color;
}
.svg-icon-text{
  fill: $main-foreground;
}
.svg-icon-accent{
  fill: $accent-color;
}
.svg-icon-invert{
  fill: $main-background;
}

{# /* // Texts */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $main-foreground;
}

.text-accent {
  color: $accent-color;
}

{# /* // Backgrounds */ #}

.background-primary {
  background-color: $primary-color;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and padding */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 20px;
}
%element-margin-half {
  margin-bottom: 10px;
}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin no-wrap(){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: normal;
}

@mixin drop-shadow(){
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

{# /* // Animations */ #}

%simplefade {
  transition: all 0.5s ease;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}

@function set-foreground-color-invert($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return darken($foreground-color, 100%); // black foreground over white background
  } @else {
    @return lighten($foreground-color, 15%); // no dark foreground on dark background
  }
}

@function set-foreground-color-footer($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 30%); // Darker background, return light color
  }
}

{# /* // Wrappers */ #}

%body-font {
  font-size: 12px;
}

body{
  color: $main-foreground;
  font-family: $body-font;
  background-color:$main-background;
  @extend %body-font;
}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding:8px;
  border:1px solid rgba($main-foreground, .2);
}

{# /* // Placeholders */ #}

.placeholder-container{
  background-color:rgba($main-foreground, 0.1);
}
.placeholder-color{
  background-color:rgba($main-foreground, 0.07);
}
.placeholder-icon svg{
  fill:rgba($main-foreground, 0.2);
}
.placeholder-page{
  background: $main-foreground;
  &:hover,
  &.active{
      background: $primary-color;
      opacity: 0.8;
  }
}
.placeholder-shine,
.placeholder-fade{
  background-color:rgba($main-foreground, 0.2);
}

.spinner-ellipsis .point {
  background-color: rgba($main-foreground, 0.2);
}

{# /* // Dividers */ #}

.divider{
  margin-top: 20px;
  margin-bottom: 20px;
  clear: both;
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{# /* // Breadcrumbs */ #}

.breadcrumbs-bg {
  background-color: $background-secondary-color;
}
.breadcrumbs {
  .crumb{
    color: $subtitle-color;
    &.active{
      color: $title-color;
    }
  }
}

{# /* Headings */ #}

h1,.h1,
h2,.h2,
h3,.h3,
h4,.h4,
h5,.h5,
h6,.h6{
  margin-top: 0;
  font-family: $heading-font;
}

.page-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
    color: $title-color;
    fill: $title-color;
  }
}

h1, .h1,
h2, .h2,
h3, .h3{
  color: $title-color;
  fill: $title-color;
}

h4, .h4,
h5, .h5,
h6, .h6{
  color: $subtitle-color;
  fill: $subtitle-color;
}

{# /* // Buttons */ #}

.btn{
  text-decoration: none;
  text-align: center;
  border: 0;
  border-radius: 0;
  cursor: pointer;
  text-transform: uppercase;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background: none;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &.disabled,
  &[disabled]:hover,
  &.disabled:hover,{
    opacity: 0.8;
    cursor: not-allowed;
    outline: 0;
  }
  &-default{
    padding: 10px 15px; 
    background-color: #2B2B2B;
    border-bottom: 3px solid darken(#2B2B2B, 60%);
    color: #fff;
    fill: #fff;
    font-weight: bold;
  }
  &-success{
    padding: 15px;
    background-color: $add-to-cart-background-color;
    border-bottom: 3px solid darken($add-to-cart-background-color, 60%);
    color: #fff;
    fill: #fff;
    letter-spacing: 0;
    @extend %body-font;
    font-size: 16px;
    font-weight: bold;
    &:hover{
      background-color: darken($add-to-cart-background-color, 10%);
      color: #fff;
      fill: #fff;
      opacity: 1;
    }
  }
  &-primary{
    padding: 15px;
    background-color: $primary-color;
    border-bottom: 3px solid darken($primary-color, 60%);
    color: $main-background;
    fill: $main-background;
    letter-spacing: 0;
    @extend %body-font;
    &:hover{
      color: $main-background;
      fill: $main-background;
    }
  }
  &-secondary{
    padding: 10px 15px; 
    background-color: $main-background;
    border-bottom: 3px solid darken($main-background, 60%);
    color: $main-foreground;
    fill: $main-foreground;
  }
  &-block{
    float: left;
    width: 100%;
  }
  &-medium{
    padding: 12px;
  }
  &-small{
    display: inline-block;
    padding: 10px;
    font-size: 10px;
    letter-spacing: 0;
  }
  &-line{
    padding: 10px 0;
    color: $main-background;
    fill: $main-background;
    letter-spacing: 0;
    @extend %body-font;
    border-bottom: 2px solid;
  }
  &-circle{
    height: 32px;
    border-radius: 50%;
  }
  &-facebook{
    background-color: #1977f2;
    .svg-fb-icon {
      fill: #fff;
    }
  }
}

button{
  @extend %body-font;
  cursor: pointer;
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
}

{# /* // Texts */ #}


{# /* // Links */ #}

a {
  color: $main-foreground;
  fill: $main-foreground;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    color: rgba($main-foreground, .5);
    fill: rgba($main-foreground, .5);
  }
}

.link-contrast {
  color: $main-background;
  fill: $main-background;
  &:hover,
  &:focus{
    color: rgba($main-background, .8);
    fill: rgba($main-background, .8);
  }
}

.btn-link{
  color: $primary-color;
  fill: $primary-color;
  text-transform: uppercase;
  border-bottom: 1px solid;
  font-weight: bold;
  cursor: pointer;
  &:hover,
  &:focus{
    color: rgba($primary-color, .5);
    fill: rgba($primary-color, .5);
  }
}

{# /* // Chips */ #}

.chip {
  color: $main-foreground;
  background: rgba($main-foreground,0.1);
  border: 0;

  &-remove-icon {
    fill: $main-foreground;
  }
}

{# /* // Modals */ #}

.modal{
  color: $main-foreground;
  background-color:$main-background;
}

{# /* // Forms */ #}

input,
textarea {
  font-family: $body-font;
}

.form-control {
  display: block;
  padding: 8px 0;
  width: 100%;
  font-size: 16px; /* Hack to avoid autozoom on IOS */
  border: 0 none;
  border-bottom: 1px solid #B7B4B5;
  border-radius: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  background-color: #fff;
  font-weight: 500;
  color: #7E7E7E;
  &:focus{
    outline: 0;
  }
  &-inline{
    display: inline;
  }
}

.form-control::-webkit-input-placeholder { 
  color: #7E7E7E;
}
.form-control:-moz-placeholder {
  color: #7E7E7E;
}
.form-control::-moz-placeholder {
  color: #7E7E7E;
}
.form-control:-ms-input-placeholder {
  color: #7E7E7E;
}

.form-control.alert-danger {
  background-color: $main-background;
  border-color: #cc4845;
}

.form-select{
  display: block;
  padding: 0 10px 0 0;
  width: 100%;
  font-size: 16px; /* Hack to avoid autozoom on IOS */
  border: 0 none;
  border-bottom: 1px solid #B7B4B5;
  border-radius: 0;
  min-height: 40px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: #7E7E7E;
  background-color: #fff;
  @extend %body-font;
  &-icon{
    background-color: #fff;
  }
}

.radio-button-container{
  .radio-button {
    &-content{
      fill: $main-foreground;
      border-bottom: 1px solid rgba($main-foreground, .1);
    }
    input[type="radio"]{
      &:checked {
        + .radio-button-content{
          color: $primary-color;
          fill: $primary-color;
          outline: 2px solid $primary-color;
          outline-offset: -1px;
          .unchecked{
            border: 2px solid $primary-color;
          }
        }
        .shipping-method-price{
          color: $primary-color;
        }
      }

      & +  .radio-button-content .unchecked{
        border: 2px solid $main-foreground;
      }
      & +  .radio-button-content .checked{
        background-color: $primary-color;
      }
    }
  }
  .shipping-extra-options .radio-button-item:first-child {
    .radio-button-content{
      border-top: 1px solid rgba($main-foreground, .1);
    }
    input[type="radio"]:checked .radio-button-content{
      border: 2px solid $primary-color;
    }
  }
  .radio-button-item:last-of-type .radio-button-content{
    border-bottom: 0;
  }
}

.checkbox-container{
  .checkbox {
    color: $main-foreground;
    &-color {
      border: 1px solid rgba($main-foreground,.1);
    }
    &-icon {
      background: $main-background;
      border: 1px solid $main-foreground;
      &:after {
        border: solid $main-foreground;
        border-width: 0 2px 2px 0;
      }
    }
    &:hover {
      color: rgba($main-foreground,.8);
    }
  }
}

{# /* Lists */ #}

.list-readonly {
  .list-item {
    border-bottom: 1px solid rgba($main-foreground, .1);
    .radio-button-content{
      border-bottom: none;
    }
    &:only-child,
    &:last-of-type {
      border-bottom: 0;
    }
  }
  .shipping-extra-options .list-item:first-child {
    border-top: 1px solid rgba($main-foreground, .1);
    .radio-button-content{
      border-top: none;
    }
  }
  .list-item:last-of-type .radio-button-content{
    border-bottom: none;
  } 
}

{# /* // Alerts and notifications */ #}

.alert{
  &-danger,
  &-error{
    color: set-foreground-color-invert($main-background, #cc4845);
    border-color: rgba(set-foreground-color($main-background, #cc4845),.1);
    background-color: rgba(#cc4845, .1); 
  }
  &-warning{
    color: set-foreground-color-invert($main-background, #c09853);
    border-color: rgba(set-foreground-color($main-background, #c09853),.1);
    background-color: rgba(#c09853, .1); 
  }
  &-info{
    color: $main-foreground;
    border-color: rgba($main-foreground, .6);
    background-color: rgba($main-foreground, .02); 
  }
  &-success{
    color: set-foreground-color-invert($main-background, #3caf65);
    border-color: rgba(set-foreground-color($main-background, #3caf65),.1);
    background-color: rgba(#3caf65, .1); 
  }
  &-primary {
    border-color: rgba($primary-color, .1);
    color: $primary-color;
    background-color: rgba($primary-color, .05); 
  }
}

.notification-primary{
  color: $primary-color;
  fill: $primary-color;
  border-color: rgba($primary-color, .2);
  background-color: rgba($primary-color, .1);
}

.notification-floating .notification-primary{
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .14);
}

.notification-secondary {
  padding: 12px 0;
  background: darken($main-background, 3%);
  color: rgba($main-foreground, .8);
  border-bottom: 1px solid rgba($main-foreground, .1);
}

.notification-with-arrow:after,
.notification-with-arrow:before{
  position: absolute;
  width: 0;
  height: 0;
  display: block;
  border-style: solid;
  @include prefix(transform, rotate(-90deg), webkit ms moz o);
  content: '';
}
.notification-with-arrow:after {
  top: -17px;
  right: 14px;
  border-color: transparent transparent transparent $main-background;
  border-width: 9px;
}
.notification-with-arrow:before {
  top: -18px;
  right: 14px;
  border-color: transparent transparent transparent rgba($main-foreground, .14);
  border-width: 9px;
}

{# /* // Informative banners */ #}

.service-title,
.service-icon {
  &, path{
    color: $bs-icon-color;
    fill: $bs-icon-color;
  }
}
.service-item p{
  color: $bs-description-color;
}

{# /* // Tables */ #}

.table{
  background-color: $main-background;
  color: $main-foreground;
  tbody{
    tr:nth-child(odd){
      background-color: rgba($main-foreground, .05);
    }
  }
  th{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}

.tab-group{
  border-bottom: 1px solid rgba($main-foreground, .1);
  .tab{
    &-link{
      color: $main-foreground;
    }
    &.active{
      .tab-link{
        border-bottom: 2px solid rgba($primary-color, .5);
        color: $primary-color;
      }
    }
  }
}

{# /* Cards */ #}

.card {
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .4);
}

{# /* // Sliders */ #}

body .swiper-pagination-bullet-active {
  background-color: $primary-color;
}


/*============================================================================
  #Home Page
==============================================================================*/

{# /* // Home slider */ #}

.section-slider {
  
}

.about-us{
  background-color: $about-us-background-color;
  h3{
    color: $about-us-title-color;
  }
  p{
    color: $about-us-description-color
  }
  .btn{
    background-color: $about-us-cta-color;
    color: #fff;
    fill: #fff;
    &:hover{
      color: #fff;
      fill: #fff;
      background-color: darken($about-us-cta-color, 10%);
      opacity: 1;
    }
  }
}

{# /* // Video */ #}

.section-video-home {
  @extend %element-margin;
}

.embed-responsive {
  background: $main-foreground;
}

{# /* // Instafeed */ #}

.section-instafeed-home {
  @extend %element-margin;
}

.instafeed-title {
  display: block;
  @extend %element-margin;
  color: $main-foreground;
}

.instafeed-info {
  color: $main-background;
  fill: $main-background;
  background: rgba($main-foreground, .6);
}

{# /* // Featured products */ #}

.section-featured-home {
  @extend %element-margin;
}

.products_month{
  background-color: $primary-color;
  position: relative;
  > img{
    position: absolute;
    width: 100%;
    height: auto;
    top: 0;
    left: 0;
    z-index: 1;
  }
  > div{
    z-index: 2;
    position: relative;
  }
}


/*============================================================================
  #Product grid
==============================================================================*/

.filters-container{
  background-color: $background-secondary-color;
}

{# /* // Grid item */ #}

.item .item-name{
  color: $grid-name-color;
}
.item .item-price{
  color: $grid-price-color;
}

.item-link {
  color: $main-foreground;
}

.item-colors {
  background: rgba($main-foreground, .6);
  &-bullet {
    color: $main-foreground;
  }
  &-bullet-text {
    color: $main-background;
  }
}

{# /* // Labels */ #}

.label {
  background: darken($main-background, 5%);
  &.label-primary{
    background: $main-foreground;
    color: $main-background;
  }
  &.label-accent{
    background: $accent-color;
    color: $main-background;
  }
}

{# /* // Filters */ #}

.category-controls {
  background: $main-background;
  @extend %simplefade;
  &.is-sticky {
    border-bottom: 1px solid rgba($main-foreground, .1);
  }
}

.filters-overlay {
  background-color: rgba($main-background, .85);
}

/*============================================================================
  #Product detail
==============================================================================*/

.custom-field-file-group{
  margin: 15px 0;
  width: 100%;
  max-width: 298px;
  border: 1px dotted #B7B4B5;
  border-radius: 1px;
  .custom-field-file-cta{
    width: 100%;
    height: 55px;
    border-bottom-color: $primary-color;
    font-size: 16px;
    line-height: 20px;
    font-weight: bold;
    text-transform: uppercase;
  }
}

{# /* // Image */ #}

.nube-slider-product {
  background: rgba($main-foreground, 0.04);
  @extend %element-margin;
}

.product-video-container {
  background-color: rgba($main-foreground, .07);
}


.product-thumbs .swiper-slide-thumb-active .thumb-item-border{
  border-color: $primary-color;
}

{# /* // Form and info */ #}
    
.product-title{
  color: $grid-name-color;
}

.product-cta-box{
  // background-color: $background-secondary-color;
  #price_display{
    color: $grid-price-color;
  }
}

.product-description-text{
  color: $main-foreground;
}

.social-share {
  @extend %element-margin;
  .social-share-button {
    color: $main-foreground;
  }
}

.product-description {
  @extend %section-margin;
}

/*============================================================================
  #Contact page
==============================================================================*/

{# /* // Data contact */ #}

.contact-item {
  @extend %element-margin;
}

.contact-link {
  color: $main-foreground;
}

/*============================================================================
  #Account page
==============================================================================*/

{# /* // Order item */ #}

.order-item {
  padding: 15px 0;
  border-bottom: 1px solid rgba($main-foreground, .08);
  &:first-child {
    border-top: 1px solid rgba($main-foreground, .08);
  }
}

/*============================================================================
  #Header and nav
==============================================================================*/

{# /* // Ad Bar */ #}

.section-advertising {
  background-color: $topbar-background-color;
}
.section-advertising,
.section-advertising a,
.section-advertising svg,
.section-advertising svg path,
.section-advertising p{
  color: $topbar-text-color;
  fill: $topbar-text-color;
}

.header{
  background-color: $header-background-color;
  .icon,
  .svg-icon-text{
    &, path{
      color: $header-icon-color;
      fill: $header-icon-color;
    }
  }
  .header-link-icon{
    span{
      color: $header-text-color;
    }
  }
  .cart-widget-amount{
    background-color: $header-text-color;
  }
}

{# /* // Header */ #}

.head-light{
  background-color: $main-background;
  @extend %simplefade;
  .cart-widget-amount,
  .svg-icon-text {
    color: $main-foreground;
    fill: $main-foreground;
  }
}

.head-dark{
  background-color: $main-foreground;
  @extend %simplefade;
  .cart-widget-amount,
  .svg-icon-text {
    color: $main-background;
    fill: $main-background;
  }
}

.head-transparent{
  background-color: transparent;
}

.nav-account{
  background: $main-background;
  border-top: 1px solid rgba($main-foreground, .5);
}

{# /* // Search */ #}

.search-suggest-item {
  border-bottom: 1px solid rgba($main-foreground, .1);
}


.header-desktop-nav{
  background: transparent;
  .item-subitems-box-1{
    background-color: $nav-background-color;
  }
  li.lvl-1{
    &:hover{
      .nav-list-link{    
        &-1{
          border-bottom-color: lighten($nav-text-color, 30%);
        }
      }
    }
  }
  .nav-list-link{
    opacity: 1;
    &-1{
      color: $nav-text-color;
    }
  }
  .nav-list-link-2{
    color: lighten($nav-text-color, 35%);
    &:hover{
      color: lighten($nav-text-color, 25%);
    }
  }
}

/*============================================================================
  #Footer
==============================================================================*/


.section-footer {
  @extend %section-margin;
}
.element-footer {
  @extend %element-margin;
}

.powered-by-logo svg {
  fill: $main-foreground;
}

{# /* // Newsletter */ #}


.footer-news-box{
  overflow: hidden;
  background: $footer-news-background-color;
}

.footer-news{
  .newsletter-icon{
    svg{
      &, path{
        color: $footer-news-icon-color;
        fill: $footer-news-icon-color;
      }
    }
  }
  .newsletter-description{
    h3{
      color: $footer-news-title-color;
    }
    p{
      color: $footer-news-subtitle-color;
    }
  }
}

.footer-navs{
  background: $footer-nav-background-color;
  h4{
    color: $footer-nav-title-color;
  }
  .contact,
  .footer-menu{
    &-item,
    &-link{
      &, svg, svg path{
        color: $footer-nav-text-color;
        fill: $footer-nav-text-color;
      }
    }
    &-link{
      &:hover{
        color: darken($footer-nav-text-color, 15%);
      }
    }
  }
}

.newsletter-btn {
  // color: #fff;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}


{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* Product grid */ #}

  .item-colors {
    &-bullet:not(.item-colors-bullet-text) {
      background-color: $main-background;
      border: 1px solid rgba($main-background, .5);
      &.selected {
        border: 1px solid $main-background;
      }
    }
  }

  {# /* Forms */ #}

  .form-control {
    padding: 10px 0;
    font-size: 14px;
  }

  .form-select {
    font-size: 14px;
  }

}
