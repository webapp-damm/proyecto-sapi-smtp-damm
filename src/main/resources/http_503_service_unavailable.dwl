%dw 2.0
output application/json
---
{
    code: "503",
    message:  "Service Unavailable",
    raw:  error.description  as String default ""
}




