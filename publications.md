---
layout: default
title: Publications
---

{%- assign publications = site.data.publications | concat: site.data.publications_ravi | sort: "year" | reverse -%}
{%- assign year = publications | map: "year" | first -%}

{:.publications}
{% for publication in publications %}
{%- assign authors = publication.people -%}
  * [**{{ publication.title }}**]({{ publication.paper }})
    {% include author_list.html %}. {{ publication.venue }}
{% endfor %}
