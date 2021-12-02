{% if settings.about_us and settings.about_us_description %}

{% set has_image = "about_us.jpg" | has_custom_image %}
<section class="section-about-us-home about-us">
    <div class="container">
        <div class="row align-items-center">
            {% if has_image %}
            <div class="col-1 d-none d-xl-block"></div>
            <div class="col-12 col-lg-6 col-xl-5 about-us-image {% if settings.about_us_image_hide_mobile %}d-none d-md-block{% endif %}">
                <img class="lazyautosizes lazyload blur-up-big w-100 img-fluid" src="{{ "about_us.jpg" | static_url | settings_image_url('tiny') }}" data-srcset="{{ "about_us.jpg" | static_url | settings_image_url('large') }} 480w, {{ "about_us.jpg" | static_url | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10" alt="{{ 'Banner de' | translate }} {{ store.name }}" />
            </div>
            <div class="col-1 d-none d-xl-block"></div>
            {% endif %}
            <div class="col-12 {% if has_image %}col-lg-6 col-xl-5{% endif %} about-us-description">
                {% if settings.about_us_title %}
                    <h3>{{ settings.about_us_title }}</h3>
                {% endif %}

                <div class="about-us-text">{{ settings.about_us_description | raw }}</div>

                {% if settings.about_us_cta_text and settings.about_us_link %}
                    <a href="{{ settings.about_us_link }}" title="{{  settings.about_us_cta_text }}" class="btn btn-primary btn-small mx-auto ml-lg-0 mb-4">
                        {{  settings.about_us_cta_text }}
                    </a>
                {% endif %}
            </div>
        </div>  
    </div>
</section>
{% endif %}