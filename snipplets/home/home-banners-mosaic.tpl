{% set num_banners = 0 %}
{% for banner in ['banner_mosaic_01', 'banner_mosaic_02', 'banner_mosaic_03', 'banner_mosaic_04'] %}
    {% set has_banner =  ("#{banner}.jpg" | has_custom_image) %}
    {% if has_banner %}
        {% set num_banners = num_banners + 1 %}
    {% endif %}
{% endfor %}

{% if num_banners == 4 %}
<section class="section-banners-home section-banners-home-mosaic" data-store="banner-home-categories-mosaic">
    <div class="container{% if settings.banners_mosaic_full %}-fluid p-0{% endif %}">
        <div class="row {% if settings.banners_mosaic_full %}no-gutters{% endif %} align-items-center">
            <div class="col-12 col-md-5">
                {% include 'snipplets/home/home-banner-model.tpl' with {'banner': 'banner_mosaic_01', 'width': '450', 'height': '434'} %}
            </div>
            <div class="col-12 col-md-7">
                <div class="row {% if settings.banners_mosaic_full %}no-gutters{% endif %}">
                    <div class="col-12">
                        {% include 'snipplets/home/home-banner-model.tpl' with {'banner': 'banner_mosaic_02', 'width': '640', 'height': '184'} %}
                    </div>
                    <div class="col-12 col-md-7">
                        {% include 'snipplets/home/home-banner-model.tpl' with {'banner': 'banner_mosaic_03', 'width': '365', 'height': '230'} %}
                    </div>
                    <div class="col-12 col-md-5">
                        {% include 'snipplets/home/home-banner-model.tpl' with {'banner': 'banner_mosaic_04', 'width': '254', 'height': '230'} %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{% endif %}