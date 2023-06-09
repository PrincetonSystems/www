---
layout: default
title: Publications
---

{%- assign all_pubs = site.data.publications | concat: site.data.publications_ravi -%}

{%- assign publications = all_pubs | sort: "year" | reverse -%}
{%- assign year = publications | map: "year" | first -%}

## {{year}}

{:.publications}
{% for publication in publications %}

{% if publication.year != year %}
{%- assign year = publication.year -%}
## {{year}}

{:.publications}
{% endif %}
{%- assign authors = publication.people -%}
  * [**{{ publication.title }}**]({{ publication.paper }})

    {% include author_list.html %}.

    {:.venue}
    {{ publication.venue }}
     {% if publication.paper %}
     \[[paper]({{ publication.paper }})\]
     {%- endif -%}
     {%- if publication.presentation -%}
     \[[presentation]({{ publication.presentation }})\]
     {% endif %}
{% endfor %}
