%dw 2.0
output application/json
---
{
    code: "405",
    message:  "Method not allowed",
    raw:  error.description  as String default ""
}


