%dw 2.0
output application/json
---
{
    code: "400",
    message:  "Bad request",
    raw:  error.description  as String default ""
}