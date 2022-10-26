---
layout: default
title: Faculty
---
{%- assign faculty = site.data.people | where: "type", "faculty" | sort: "last_name" %}

{:.people}
{% for f in faculty -%}
- [{{ f.first_name }} {{ f.last_name }}]({{ f.url }})
  ![{{ f.first_name }} {{ f.last_name }}]({{ f.picture }})
  {% for i in f.interests -%}
  - {{ i }}
  {% endfor %}
{% endfor %}
