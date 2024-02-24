{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
    {# This FALSE is how we escape after checking all columns #}
    {# The "-" is used to trim white spaces.  #}
{% endmacro %}