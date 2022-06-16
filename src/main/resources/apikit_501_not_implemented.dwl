%dw 2.0
output application/json
---
{
    code: "501",
    message:  "Not Implemented",
    raw:  error.description  as String default ""
}
