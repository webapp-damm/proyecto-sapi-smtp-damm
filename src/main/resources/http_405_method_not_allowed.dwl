%dw 2.0
output application/json
---
{
    code: "405",
    message:  "Method Not Allowed",
    raw:  error.description  as String default ""
}



