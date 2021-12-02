{% if settings.ad_bar and settings.ad_text %}
	<section class="section-advertising d-none d-md-block">
		<div class="container">
			<div class="d-flex justify-content-center align-items-center">
				{% if settings.ad_text %}
					<div class="section-advertising-text">
						{{ settings.ad_text | raw }}
					</div>
				{% endif %}
			</div>
		</div>
	</section>
{% endif %}       	