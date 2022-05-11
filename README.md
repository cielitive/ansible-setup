ansible-setup

```
{% if env == 'prduction' %}本番環境{% elif env == 'development' %}検証環境{% endif %}
```

```
ip --oneline -4 addr | egrep -v "^1:" | awk '{print $2":\n  exists: true\n  aadrs:\n  - "$4}'
```
