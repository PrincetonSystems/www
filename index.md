---
layout: default
---
{%- assign people = site.data.faculty | concat: site.data.people_sns | concat: site.data.people_ravi -%}

{%- assign faculty = people | where: "type", "faculty" | where: "active", "true" | sort: "last_name" %}
{%- assign postdocs = people | where: "type", "postdoc" | where: "active", "true" | sort: "last_name" %}
{%- assign phds = people | where: "type", "phd" | where: "active", "true" | sort: "last_name" %}
{%- assign mscs = people | where: "type", "msc" | where: "active", "true" | sort: "last_name" %}
{%- assign past = people | where: "active", "false" | sort: "graduated" | reverse %}

{% if faculty.size > 0 %}
# Faculty

  {:.faculty}
  {% for f in faculty -%}
  - [{{ f.first_name }} {{ f.last_name }}]({{ f.url }})
    ![{{ f.first_name }} {{ f.last_name }}]({{ f.picture }})
    {% for i in f.interests -%}
    - {{ i }}
    {% endfor %}
  {% endfor %}
{% endif %}

{% if postdocs.size > 0 %}
# Postdocs

{:.othermembers}
  {%- for person in postdocs %}
  - [{{ person.first_name }} {{ person.last_name }}]({{ person.url }})
    ![{{ person.first_name }} {{ person.last_name }}]({{ person.picture }})
  {% endfor %}
{% endif %}

{% if phds.size > 0 %}
# PhD Students

  {:.othermembers}
  {% for person in phds -%}
  - [{{ person.first_name }} {{ person.last_name }}]({{ person.url }})
    ![{{ person.first_name }} {{ person.last_name }}]({{ person.picture }})
  {% endfor %}
{% endif %}

{% if mscs.size > 0 %}
# Masters Students

{:.othermembers}
  {%- for person in mscs %}
  * ![]({{person.picture}}) [{{person.first_name}} {{person.last_name}}]({{person.url}})
  {% endfor %}
{% endif %}

{% if past.size > 0 %}
# Past Members

{:.othermembers}
  {%- for person in past %}
  * [{{person.first_name}} {{person.last_name}}]({{person.url}})
  {%- endfor -%}
{% endif %}
