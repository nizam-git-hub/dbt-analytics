{% macro generate_schema_name(custom_schema_name, node) %}

    {% if target.name | lower in ['default', 'dev'] %}
        DEV
    {% elif target.name | lower == 'qa' %}
        QA
    {% elif target.name | lower == 'prod' %}
        PROD
    {% else %}
        {{ target.schema }}
    {% endif %}

{% endmacro %}