%dw 2.0
output application/json
---
{
    code: "415",
    message:  "Unsupported Media Type",
    raw:  error.description  as String default ""
}





