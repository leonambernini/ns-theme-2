{% if banner and ("#{banner}.jpg" | has_custom_image) %}
    {% set banner_url = attribute(settings,"#{banner}_url") %}
    {% if banner_url %}
        <a class="textbanner-link" href="{{ banner_url }}" title="{{ 'Banner de' | translate }} {{ store.name }}" aria-label="{{ 'Banner de' | translate }} {{ store.name }}">
    {% endif %}
    <div class="textbanner-image">
        <img {% if width %}width="{{ width }}"{% endif %} {% if height %}height="{{ height }}"{% endif %} class="textbanner-image-background lazyautosizes lazyload blur-up-big" src="{{ "#{banner}.jpg" | static_url | settings_image_url('tiny') }}" data-srcset="{{ "#{banner}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}.jpg" | static_url | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10" alt="{{ 'Banner de' | translate }} {{ store.name }}" />
    </div>
    {% if banner_url %}
        </a>
    {% endif %}
{% endif %}