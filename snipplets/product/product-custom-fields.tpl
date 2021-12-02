{% if settings.custom_fields %}

    {% for field in ['custom_field_1','custom_field_2','custom_field_3','custom_field_4'] %}
        {% set active = attribute(settings,"#{field}_show") %}

        {% if active %}
            {% set rules_type = attribute(settings,"#{field}_rules_type") %}
            {% set rules_ids = attribute(settings,"#{field}_rules_ids") | split(',') %}
            {% set label = attribute(settings,"#{field}_label") %}
            {% set type = attribute(settings,"#{field}_type") %}

            {% set tag_is_ok = false %}

            {% if rules_type == 'tags' %}
                {% for tag in product.tags %}
                    {% for id in rules_ids %}
                        {% if tag == id %}
                            {% set tag_is_ok = true %}
                        {% endif %}
                    {% endfor %}
                {% endfor %}
            {% endif %}

            {% if rules_type == 'all' or ( rules_type == 'tags' and tag_is_ok ) or ( rules_type == 'category' and product.category.id in rules_ids ) or ( rules_type == 'brands' and product.brand in rules_ids ) %}

                {% if type == 'image' or type == 'image_plus' %}
                    <div class="custom-field-file-box d-flex align-items-center flex-wrap">
                        <div class="custom-field-file-group p-4">
                            <button class="custom-field-file-cta js-custom-field-file-cta btn btn-default btn-large">CARREGAR IMAGEM</button>
                            <input type="file" class="d-none js-custom-field-file" />
                            <input type="hidden" class="js-custom-field-file-name" name="{{ 'properties[' ~ label ~ ']' }}" />
                            <input type="hidden" class="js-custom-field-positions-mokup" name="{{ 'properties[' ~ label ~ ': Mokup LxA]' }}" />
                            <input type="hidden" class="js-custom-field-positions-image" name="{{ 'properties[' ~ label ~ ': Imagem LxA]' }}" />
                            <input type="hidden" class="js-custom-field-positions-image-pos" name="{{ 'properties[' ~ label ~ ': Imagem XeY]' }}" />
                        </div>
                        <div class="custom-field-file-preview-thumb ml-2"></div>
                    </div>

                    {% if type == 'image_plus' %}
                        <div id="custom-field-file-mokup" class="custom-field-file-mokup" style="display: none;">
                            <div class="custom-field-file-mokup-mask js-close-popup"></div>
                            <div class="custom-field-file-mokup-actions d-flex justify-content-center">
                                <button class="btn btn-default mr-3 custom-field-file-mokup-cta-edit">EDITAR IMAGEM</button>
                                <button class="btn btn-primary ml-2 custom-field-file-mokup-cta-save">SALVAR EDIÇÃO</button>
                            </div>
                            <div class="custom-field-file-mokup-content">
                                <div class="custom-field-file-mokup-molde">
                                    {% set productLastImage = product.images|last %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ productLastImage | product_image_url('large') }}" alt="" class="custom-field-file-mokup-image" width="600" height="600" />
                                    <div id="draggableHelper" style="display:inline-block">
                                        <img src="{{ 'images/empty-placeholder.png' | static_url }}" class="custom-field-file-mokup-preview" />
                                    </div>
                                </div>
                            </div>
                            <div class="custom-field-file-mokup-infos">
                                <p><span id="mokupW"></span> - <span id="mokupH"></span> - <span id="posX"></span> - <span id="posY"></span> - <span id="imageW"></span> - <span id="imageH"></span></p>
                            </div>
                        </div>
                        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
                        <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
                    {% endif %}
                {% else %}
                    {% embed "snipplets/forms/form-input.tpl" 
                        with{
                            text_area: (type == 'textarea'),
                            type_tel: false, 
                            input_name: 'properties[' ~ label ~ ']', 
                            input_custom_class: 'js-custom-field', 
                            input_label_text: label | translate, 
                            input_label: true, 
                            input_append_content: false, 
                            input_group_custom_class: 'form-row align-items-center mb-3', 
                            form_control_container_custom_class: ''
                        } %}
                    {% endembed %}
                {% endif %}

            {% endif %}

        {% endif %}

    {% endfor %}


{% endif %}