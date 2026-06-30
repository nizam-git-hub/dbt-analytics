{% macro dbt_job_monitoring(results) %}

{% for result in results %}

    {% set error_msg = '' %}
    {% if result.message is defined and result.message %}
        {% set error_msg = result.message | replace("'", "''") %}
    {% endif %}

    {% set insert_sql %}
        INSERT INTO DBT_POC_DB.MONITORING.DBT_MODEL_RUN_RESULTS
        (
            INVOCATION_ID,
            TARGET_NAME,
            DATABASE_NAME,
            SCHEMA_NAME,
            MODEL_NAME,
            RESOURCE_TYPE,
            STATUS,
            EXECUTION_TIME,
            ERROR_MESSAGE,
            RUN_STARTED_AT
        )
        VALUES
        (
            '{{ invocation_id }}',
            '{{ target.name }}',
            '{{ target.database }}',
            '{{ target.schema }}',
            '{{ result.node.name }}',
            '{{ result.node.resource_type }}',
            '{{ result.status }}',
            {{ result.execution_time }},
            '{{ error_msg }}',
            '{{ run_started_at }}'
        );
    {% endset %}

    {% do run_query(insert_sql) %}

{% endfor %}

{% endmacro %}