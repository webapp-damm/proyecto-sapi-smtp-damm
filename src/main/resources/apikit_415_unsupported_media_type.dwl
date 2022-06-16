%dw 2.0
output application/json
---
{
    code: "415",
    message:  "Unsupported media type",
    raw:  error.description  as String default ""
}


