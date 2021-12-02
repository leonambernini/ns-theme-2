{# /*============================================================================
  #Page breadcrumbs
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
<div class="breadcrumbs-bg">
    <div class="container">
        <div class="breadcrumbs {{ breadcrumbs_custom_class }}">
            <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
            <span class="divider"><svg xmlns="http://www.w3.org/2000/svg" width="4" height="4" viewBox="0 0 4 4"><circle cx="2" cy="2" r="2" fill="#00baff"/></svg></span>
            {% if template == 'page' %}
                <span class="crumb active">{{ page.name }}</span>
            {% elseif template == 'category' %}
                <span class="crumb active">{{ category.name }}</span>
            {% elseif template == 'cart' %}
                <span class="crumb active">{{ "Carrito de compras" | translate }}</span>
            {% elseif template == 'search' %}
                <span class="crumb active">{{ "Resultados de búsqueda" | translate }}</span>
            {% elseif template == 'account.order' %}
                <span class="crumb active">{{ 'Orden {1}' | translate(order.number) }}</span>
            {% else %}
                {% for crumb in breadcrumbs %}
                    {% if crumb.last %}
                        <span class="crumb active">{{ crumb.name }}</span>
                    {% else %}
                        <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
                        <span class="divider"><svg xmlns="http://www.w3.org/2000/svg" width="4" height="4" viewBox="0 0 4 4"><circle cx="2" cy="2" r="2" fill="#00baff"/></svg></span>
                    {% endif %}
                {% endfor %}
            {% endif %}
        </div>
    </div>
</div>
{% endif %}
