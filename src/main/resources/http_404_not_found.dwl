%dw 2.0
output application/json
---
{
    code: "404",
    message:  "Not Found",
    raw:  error.description  as String default ""
}




