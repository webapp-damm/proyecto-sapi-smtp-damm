%dw 2.0
output application/json
---
{
    code: "403",
    message:  "Unauthorized",
    raw:  error.description  as String default ""
}



