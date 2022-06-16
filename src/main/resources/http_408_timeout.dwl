%dw 2.0
output application/json
---
{
    code: "408",
    message:  "Request timeout",
    raw:  error.description  as String default ""
}

