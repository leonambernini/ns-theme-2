{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}


{% set section_products = products %}
{% set has_banner = banner and ("#{banner}.jpg" | has_custom_image) %}
{% set has_background_image = background_image and ("#{background_image}.jpg" | has_custom_image) %}
{% set aditional_js_class = aditional_js_class | default('') %}

{% if has_banner %}
    {% set aditional_js_class = '-2' %}
{% endif %}

{% if section_products %}
    <section class="section-featured-home {{ section_select }} {% if has_background_image %}has-background-image{% endif %}" data-store="products-home-featured">
        {% if has_background_image %}
            <img class="product-showcase-image-background lazyautosizes lazyload blur-up-big" src="{{ "#{background_image}.jpg" | static_url | settings_image_url('tiny') }}" data-srcset="{{ "#{background_image}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{background_image}.jpg" | static_url | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10" alt="{{ 'Banner de' | translate }} {{ store.name }}" />
        {% endif %}
        <div class="container">
            <div class="row">
                {% if title %}
                    <div class="col-12 text-center">
                        <h3 class="showcase-title">
                            {% if section_select == 'products_month' and settings.month_products_title_icon %}
                                {% include 'snipplets/svg/heart.tpl' with {'svg_custom_class': 'd-inline-block'} %}
                            {% endif %}
                            {{ title }}
                        </h3>
                    </div>
                {% endif %}
                {% if has_banner %}
                    <div class="col-12 col-md-6 {% if settings.secondary_products_banner_hide_mobile %}d-none d-md-block{% endif %}">
                        {% include 'snipplets/home/home-banner-model.tpl' with {'banner': banner} %}
                    </div>
                {% endif %}
                <div class="col-12 {% if has_banner %}col-md-6{% endif %}">
                    <div class="js-swiper-featured{{ aditional_js_class }} swiper-container">
                        <div class="swiper-wrapper">
                            {% for product in section_products %}
                                {% include 'snipplets/grid/item.tpl' with {'slide_item': true} %}
                            {% endfor %}

                        </div>
                        <div class="js-swiper-featured{{ aditional_js_class }}-pagination swiper-pagination"></div>
                        <div class="js-swiper-featured{{ aditional_js_class }}-prev swiper-button-prev">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-16 icon-2x svg-icon-text"} %}</div>
                        <div class="js-swiper-featured{{ aditional_js_class }}-next swiper-button-next">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-16 icon-2x svg-icon-text"} %}</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {% set section_name = 'primary' %}
{% endif %}