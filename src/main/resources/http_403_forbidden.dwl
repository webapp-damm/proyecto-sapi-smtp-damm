%dw 2.0
output application/json
---
{
    code: "403",
    message:  "Forbidden",
    raw:  error.description  as String default ""
}


